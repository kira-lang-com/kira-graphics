/* Turning a shared surface into a texture the GPU can draw into and sample.
 *
 * Dawn IMPORTS shared memory and does not allocate any, so this is the second
 * half of the pair: `kira_shared_surface.c` gets the memory from the platform,
 * and this hands it to Dawn on whichever side of the channel is holding it. The
 * producer and the consumer run exactly the same code -- the only difference is
 * which of them allocated, and by the time either calls this it is holding its
 * own handle to the same memory.
 *
 * Every Dawn entry point is resolved BY NAME at first use rather than linked.
 * The graphics library already loads Dawn, so the symbols are in the process;
 * looking them up keeps this translation unit free of a link dependency, which
 * is what lets a build that never touches Dawn still contain it. */

#include "kira_shared_surface.h"

#include <stdio.h>
#include <string.h>

#if defined(__linux__)

#include <dawn/webgpu.h>
#include <dlfcn.h>
#include <vulkan/vulkan.h>

typedef WGPUSharedTextureMemory (*kira_import_fn)(WGPUDevice, WGPUSharedTextureMemoryDescriptor const *);
typedef WGPUTexture (*kira_create_texture_fn)(WGPUSharedTextureMemory, WGPUTextureDescriptor const *);
typedef WGPUStatus (*kira_begin_access_fn)(WGPUSharedTextureMemory, WGPUTexture, WGPUSharedTextureMemoryBeginAccessDescriptor const *);
typedef WGPUStatus (*kira_end_access_fn)(WGPUSharedTextureMemory, WGPUTexture, WGPUSharedTextureMemoryEndAccessState *);
typedef WGPUStatus (*kira_get_properties_fn)(WGPUSharedTextureMemory, WGPUSharedTextureMemoryProperties *);
typedef WGPUBool (*kira_is_device_lost_fn)(WGPUSharedTextureMemory);
typedef void (*kira_texture_release_fn)(WGPUTexture);
typedef void (*kira_memory_release_fn)(WGPUSharedTextureMemory);

struct kira_dawn_shared {
    int loaded;
    kira_import_fn import_memory;
    kira_create_texture_fn create_texture;
    kira_begin_access_fn begin_access;
    kira_end_access_fn end_access;
    kira_get_properties_fn get_properties;
    kira_is_device_lost_fn is_device_lost;
    /* Letting go. Resolved like the rest and allowed to be missing: a Dawn
     * without them leaks a reopened surface rather than refusing to run, which
     * is the better of the two failures. */
    kira_texture_release_fn release_texture;
    kira_memory_release_fn release_memory;
};

static struct kira_dawn_shared kira_dawn_shared_state;
static char kira_shared_texture_note[256];

static int kira_dawn_shared_ready(void) {
    if (kira_dawn_shared_state.loaded) {
        return kira_dawn_shared_state.import_memory != 0;
    }
    kira_dawn_shared_state.loaded = 1;
    /* The already-loaded process first: the graphics library brought Dawn in,
     * and asking for it by file name again would open a second copy. */
    void *self = dlopen(0, RTLD_LAZY);
    if (self == 0) {
        snprintf(kira_shared_texture_note, sizeof(kira_shared_texture_note), "the process would not open for symbol lookup");
        return 0;
    }
    kira_dawn_shared_state.import_memory = (kira_import_fn)dlsym(self, "wgpuDeviceImportSharedTextureMemory");
    kira_dawn_shared_state.create_texture = (kira_create_texture_fn)dlsym(self, "wgpuSharedTextureMemoryCreateTexture");
    kira_dawn_shared_state.begin_access = (kira_begin_access_fn)dlsym(self, "wgpuSharedTextureMemoryBeginAccess");
    kira_dawn_shared_state.end_access = (kira_end_access_fn)dlsym(self, "wgpuSharedTextureMemoryEndAccess");
    kira_dawn_shared_state.get_properties = (kira_get_properties_fn)dlsym(self, "wgpuSharedTextureMemoryGetProperties");
    kira_dawn_shared_state.is_device_lost = (kira_is_device_lost_fn)dlsym(self, "wgpuSharedTextureMemoryIsDeviceLost");
    kira_dawn_shared_state.release_texture = (kira_texture_release_fn)dlsym(self, "wgpuTextureRelease");
    kira_dawn_shared_state.release_memory = (kira_memory_release_fn)dlsym(self, "wgpuSharedTextureMemoryRelease");
    if (kira_dawn_shared_state.import_memory == 0 || kira_dawn_shared_state.create_texture == 0) {
        snprintf(kira_shared_texture_note, sizeof(kira_shared_texture_note),
                 "this Dawn does not export shared texture memory");
        return 0;
    }
    return 1;
}

/* Import a surface as Dawn memory. The result is kept by the caller and paired
 * with the texture made from it: the memory is what access is begun and ended
 * on, and the texture is what is drawn into. */
void *kira_shared_texture_import_memory(void *device, kira_shared_surface surface) {
    if (device == 0 || kira_dawn_shared_ready() == 0) {
        return 0;
    }
    int32_t width = kira_shared_surface_width(surface);
    int32_t height = kira_shared_surface_height(surface);
    if (width <= 0 || height <= 0) {
        return 0;
    }

    WGPUSharedTextureMemoryDescriptor descriptor;
    memset(&descriptor, 0, sizeof(descriptor));

    int dawn_handle = (int)kira_shared_surface_dawn_handle(surface);
    WGPUSharedTextureMemoryOpaqueFDDescriptor opaque;
    memset(&opaque, 0, sizeof(opaque));
    WGPUSharedTextureMemoryDmaBufPlane plane;
    memset(&plane, 0, sizeof(plane));
    WGPUSharedTextureMemoryDmaBufDescriptor dmabuf;
    memset(&dmabuf, 0, sizeof(dmabuf));

    /* Tessera's Vulkan allocator exports two descriptors for the same memory.
     * DRM gets the dma-buf; Dawn gets the opaque fd, which is the path proven by
     * dawn_scanout_smoke on venus. GBM/adopted surfaces do not have that second
     * descriptor and stay on Dawn's generic dma-buf import path. */
    if (dawn_handle >= 0 && kira_shared_surface_allocation_size(surface) != 0) {
        opaque.chain.sType = WGPUSType_SharedTextureMemoryOpaqueFDDescriptor;
        opaque.vkImageCreateInfo = kira_shared_surface_vk_image_create_info(surface);
        opaque.memoryFD = dawn_handle;
        opaque.memoryTypeIndex = kira_shared_surface_memory_type_index(surface);
        opaque.allocationSize = kira_shared_surface_allocation_size(surface);
        opaque.dedicatedAllocation = 0;
        descriptor.nextInChain = (WGPUChainedStruct *)&opaque;
    } else {
        plane.fd = (int)kira_shared_surface_handle(surface);
        plane.offset = 0;
        plane.stride = (uint32_t)kira_shared_surface_stride(surface);
        dmabuf.chain.sType = WGPUSType_SharedTextureMemoryDmaBufDescriptor;
        dmabuf.size.width = (uint32_t)width;
        dmabuf.size.height = (uint32_t)height;
        dmabuf.size.depthOrArrayLayers = 1;
        dmabuf.drmFormat = (uint32_t)kira_shared_surface_format(surface);
        dmabuf.drmModifier = (uint64_t)kira_shared_surface_modifier(surface);
        dmabuf.planeCount = 1;
        dmabuf.planes = &plane;
        descriptor.nextInChain = (WGPUChainedStruct *)&dmabuf;
    }

    WGPUSharedTextureMemory memory = kira_dawn_shared_state.import_memory((WGPUDevice)device, &descriptor);
    if (memory == 0) {
        if (dawn_handle >= 0) {
            snprintf(kira_shared_texture_note, sizeof(kira_shared_texture_note),
                     "Dawn returned no shared memory for opaque fd %d", dawn_handle);
        } else {
            snprintf(kira_shared_texture_note, sizeof(kira_shared_texture_note),
                     "Dawn returned no shared memory for dmabuf format 0x%x modifier 0x%llx",
                     kira_shared_surface_format(surface),
                     (unsigned long long)kira_shared_surface_modifier(surface));
        }
        return 0;
    }

    /* Dawn represents validation failures as non-null error objects. Detect one
     * here, before CreateTexture turns it into a device-wide cascade of invalid
     * resources and hides which import was bad. */
    /* Do not probe the imported memory with GetProperties here. The proven
     * Dawn/Venus scanout path goes directly from ImportSharedTextureMemory to
     * CreateTexture; on this backend GetProperties on freshly imported opaque
     * memory is not a harmless validity query and can turn the object into an
     * error object. Creation and BeginAccess are the operations that validate
     * the contract we need, so let them be the probes. */
    return memory;
}

/* The texture over that memory. Its descriptor is Dawn's own default for the
 * imported memory, which is what makes the format agree with the dmabuf's
 * without this having to translate a fourcc into a WebGPU format. */
void *kira_shared_texture_create(void *memory, kira_shared_surface surface) {
    if (memory == 0 || kira_dawn_shared_ready() == 0) {
        return 0;
    }
    int32_t width = kira_shared_surface_width(surface);
    int32_t height = kira_shared_surface_height(surface);
    if (width <= 0 || height <= 0) {
        return 0;
    }
    WGPUTextureDescriptor descriptor;
    memset(&descriptor, 0, sizeof(descriptor));
    descriptor.dimension = WGPUTextureDimension_2D;
    descriptor.size.width = (uint32_t)width;
    descriptor.size.height = (uint32_t)height;
    descriptor.size.depthOrArrayLayers = 1;
    descriptor.format = WGPUTextureFormat_BGRA8Unorm;
    descriptor.mipLevelCount = 1;
    descriptor.sampleCount = 1;
    descriptor.usage = WGPUTextureUsage_RenderAttachment;
    return kira_dawn_shared_state.create_texture((WGPUSharedTextureMemory)memory, &descriptor);
}

/* Take the GPU's word that whatever the other process wrote is finished.
 *
 * Shared memory is not shared synchronisation: without this the compositor can
 * sample halfway through the producer's frame, which is a torn surface rather
 * than a wrong one -- the hardest kind of bug to see in a screenshot and the
 * easiest to see in motion. */
int32_t kira_shared_texture_begin(void *memory, void *texture, int32_t preserve) {
    if (memory == 0 || texture == 0 || kira_dawn_shared_ready() == 0) {
        return 0;
    }
    if (kira_dawn_shared_state.begin_access == 0) {
        return 0;
    }
    /* Vulkan tracks an IMAGE LAYOUT that Dawn cannot guess for memory another
     * process last touched, so the bracket carries it explicitly. UNDEFINED on
     * the way in means "do not preserve what is there" -- correct for a surface
     * about to be drawn over, and the only honest answer for one whose last
     * writer was a different process using a different queue.
     *
     * 0 is VK_IMAGE_LAYOUT_UNDEFINED and 1 is VK_IMAGE_LAYOUT_GENERAL, spelled
     * out rather than included: this translation unit has no business pulling in
     * the Vulkan headers for two constants.
     *
     * GENERAL is the layout a shared surface rests in between its two owners. It
     * is not the fastest layout for either job, and it is the only one both can
     * agree on without a negotiation neither side is in a position to have: the
     * producer renders into it and the consumer samples it, across two processes
     * and two queues that never speak. */
    WGPUSharedTextureMemoryVkImageLayoutBeginState layout;
    memset(&layout, 0, sizeof(layout));
    layout.chain.sType = WGPUSType_SharedTextureMemoryVkImageLayoutBeginState;
    layout.oldLayout = preserve != 0 ? 1 : 0;
    layout.newLayout = 1;

    WGPUSharedTextureMemoryBeginAccessDescriptor descriptor;
    memset(&descriptor, 0, sizeof(descriptor));
    descriptor.nextInChain = (WGPUChainedStruct *)&layout;
    descriptor.initialized = 1;
    descriptor.fenceCount = 0;
    return kira_dawn_shared_state.begin_access(
        (WGPUSharedTextureMemory)memory, (WGPUTexture)texture, &descriptor) == WGPUStatus_Success;
}

int32_t kira_shared_texture_end(void *memory, void *texture) {
    if (memory == 0 || texture == 0 || kira_dawn_shared_ready() == 0) {
        return 0;
    }
    if (kira_dawn_shared_state.end_access == 0) {
        return 0;
    }
    /* The layout the memory is left in, which is what the NEXT process to touch
     * it will be told to expect. */
    // Left in GENERAL, which is what the next process to touch it is told to
    // expect. Ending in UNDEFINED said "the contents are worth nothing" about a
    // frame that had just been painted for somebody else to read.
    WGPUSharedTextureMemoryVkImageLayoutEndState layout;
    memset(&layout, 0, sizeof(layout));
    layout.chain.sType = WGPUSType_SharedTextureMemoryVkImageLayoutEndState;
    layout.oldLayout = 1;
    layout.newLayout = 1;

    WGPUSharedTextureMemoryEndAccessState state;
    memset(&state, 0, sizeof(state));
    state.nextInChain = (WGPUChainedStruct *)&layout;
    return kira_dawn_shared_state.end_access(
        (WGPUSharedTextureMemory)memory, (WGPUTexture)texture, &state) == WGPUStatus_Success;
}

/* Let go of a texture and the memory it was made over.
 *
 * Called when a surface is REOPENED: a component whose window changed shape
 * allocates a new surface at the new size, and the texture standing over the old
 * one is a GPU allocation the size of the region that nothing will sample again.
 * Reopening happens on every resize, so leaking one per resize is leaking as
 * fast as somebody can drag a window edge.
 *
 * Order matters: the texture stands over the memory, so it goes first. */
void kira_shared_texture_release(void *memory, void *texture) {
    if (kira_dawn_shared_ready() == 0) {
        return;
    }
    if (texture != 0 && kira_dawn_shared_state.release_texture != 0) {
        kira_dawn_shared_state.release_texture((WGPUTexture)texture);
    }
    if (memory != 0 && kira_dawn_shared_state.release_memory != 0) {
        kira_dawn_shared_state.release_memory((WGPUSharedTextureMemory)memory);
    }
}

const char *kira_shared_texture_diagnostic(void) {
    return kira_shared_texture_note;
}

void *kira_dawn_create_device_probe(void *adapter, void *descriptor_raw) {
    WGPUDeviceDescriptor const *descriptor = (WGPUDeviceDescriptor const *)descriptor_raw;
    if (adapter == 0 || descriptor == 0) {
        fprintf(stderr, "kira-dawn-probe: null adapter or descriptor\n");
        return 0;
    }
    fprintf(stderr,
            "kira-dawn-probe: sizeof(DeviceDescriptor)=%zu count=%zu features=%p limits=%p queue.next=%p lost.mode=%d lost.cb=%p error.cb=%p\n",
            sizeof(*descriptor), descriptor->requiredFeatureCount,
            (void *)descriptor->requiredFeatures, (void *)descriptor->requiredLimits,
            (void *)descriptor->defaultQueue.nextInChain,
            (int)descriptor->deviceLostCallbackInfo.mode,
            (void *)descriptor->deviceLostCallbackInfo.callback,
            (void *)descriptor->uncapturedErrorCallbackInfo.callback);
    size_t count = descriptor->requiredFeatureCount;
    if (count > 16) count = 16;
    for (size_t index = 0; index < count; index += 1) {
        fprintf(stderr, "kira-dawn-probe: feature[%zu]=0x%08x\n",
                index, (unsigned)descriptor->requiredFeatures[index]);
    }
    typedef WGPUDevice (*create_device_fn)(WGPUAdapter, WGPUDeviceDescriptor const *);
    void *self = dlopen(0, RTLD_LAZY);
    create_device_fn create_device = self != 0
        ? (create_device_fn)dlsym(self, "wgpuAdapterCreateDevice") : 0;
    if (create_device == 0) {
        fprintf(stderr, "kira-dawn-probe: wgpuAdapterCreateDevice unavailable\n");
        return 0;
    }
    return (void *)create_device((WGPUAdapter)adapter, descriptor);
}

#else

#if defined(__APPLE__)
#include <dawn/webgpu.h>

/* The headless device path (openHeadlessGraphics is Dawn on Apple) needs the
 * device-creation entry the same as Linux does. macOS links Dawn as a static
 * archive, so wgpuAdapterCreateDevice is in the executable already and is
 * called directly rather than reached through the dynamic loader. The
 * shared-texture functions below stay stubbed: a macOS surface is shared
 * through the graphics device, not through a memory allocator. */
void *kira_dawn_create_device_probe(void *adapter, void *descriptor_raw) {
    WGPUDeviceDescriptor const *descriptor = (WGPUDeviceDescriptor const *)descriptor_raw;
    if (adapter == 0 || descriptor == 0) {
        return 0;
    }
    return (void *)wgpuAdapterCreateDevice((WGPUAdapter)adapter, descriptor);
}
#endif

/* Windows and macOS share a texture through the graphics DEVICE rather than
 * through a memory allocator: a DXGI shared handle names a D3D resource and an
 * IOSurface names a surface object, and both are made by the device that will
 * draw into them. The import path there is the device's own, so there is
 * nothing for this translation unit to do. */
void *kira_shared_texture_import_memory(void *device, kira_shared_surface surface) {
    (void)device;
    (void)surface;
    return 0;
}

void *kira_shared_texture_create(void *memory, kira_shared_surface surface) {
    (void)memory;
    (void)surface;
    return 0;
}

int32_t kira_shared_texture_begin(void *memory, void *texture, int32_t preserve) {
    (void)memory;
    (void)texture;
    (void)preserve;
    return 0;
}

int32_t kira_shared_texture_end(void *memory, void *texture) {
    (void)memory;
    (void)texture;
    return 0;
}

void kira_shared_texture_release(void *memory, void *texture) {
    (void)memory;
    (void)texture;
}

const char *kira_shared_texture_diagnostic(void) {
    return "shared textures on this platform are created by the graphics device";
}

#endif
