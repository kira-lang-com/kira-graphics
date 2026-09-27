/* Allocating memory two processes can both use as a texture.
 *
 * One table of slots, like every other handle table here: a process holds one
 * surface per region it draws, so the number is small by construction.
 *
 * GBM is opened BY NAME at first use rather than linked. A build that linked it
 * would not start on a machine without it, and a machine without it is an
 * ordinary machine -- a container with no /dev/dri, a remote session, a driver
 * with no export support. Opening it by name turns "cannot share" into an
 * answer instead of a failure to launch. */

#include "kira_shared_surface.h"

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define KIRA_SHARED_SURFACE_SLOTS 32

/* DRM_FORMAT_ARGB8888, spelled out rather than included: `drm_fourcc.h` is a
 * development package, and this is one constant. */
#define KIRA_SHARED_FOURCC_ARGB8888 0x34325241
/* DRM_FORMAT_MOD_LINEAR. */
#define KIRA_SHARED_MODIFIER_LINEAR 0

struct kira_shared_surface_slot {
    int used;
    int64_t handle;
    int32_t width;
    int32_t height;
    int32_t stride;
    int64_t modifier;
    int32_t format;
    /* The GBM buffer object, when this process allocated it. An adopted surface
     * has none: it owns a handle and nothing else. */
    void *buffer;
    /* Linux fallback allocation, used when GBM is absent. The primary DRM node
     * creates a linear dumb buffer, PRIME exports it as the dma-buf in handle,
     * and these two fields keep enough ownership to destroy it later. */
    int allocator_fd;
    uint32_t drm_handle;
    /* Vulkan-exported memory has two views of the same allocation: the dma-buf
     * in `handle` is handed to the compositor, while Dawn imports this opaque fd. */
    int dawn_handle;
    uint32_t memory_type_index;
    uint64_t allocation_size;
    uint64_t vk_image;
    uint64_t vk_memory;
    void *vk_image_create_info;
};

static struct kira_shared_surface_slot kira_shared_surfaces[KIRA_SHARED_SURFACE_SLOTS];
static char kira_shared_note[256];

static struct kira_shared_surface_slot *kira_shared_slot_at(kira_shared_surface surface) {
    if (surface <= 0 || surface > KIRA_SHARED_SURFACE_SLOTS) {
        return 0;
    }
    struct kira_shared_surface_slot *slot = &kira_shared_surfaces[surface - 1];
    if (slot->used == 0) {
        return 0;
    }
    return slot;
}

static kira_shared_surface kira_shared_slot_claim(void) {
    for (int index = 0; index < KIRA_SHARED_SURFACE_SLOTS; index += 1) {
        if (kira_shared_surfaces[index].used == 0) {
            memset(&kira_shared_surfaces[index], 0, sizeof(kira_shared_surfaces[index]));
            kira_shared_surfaces[index].used = 1;
            kira_shared_surfaces[index].allocator_fd = -1;
            kira_shared_surfaces[index].dawn_handle = -1;
            return (kira_shared_surface)(index + 1);
        }
    }
    snprintf(kira_shared_note, sizeof(kira_shared_note), "no free shared-surface slot");
    return 0;
}

const char *kira_shared_surface_diagnostic(void) {
    return kira_shared_note;
}

int64_t kira_shared_surface_handle(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->handle : 0;
}

int32_t kira_shared_surface_width(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->width : 0;
}

int32_t kira_shared_surface_height(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->height : 0;
}

int32_t kira_shared_surface_stride(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->stride : 0;
}

int64_t kira_shared_surface_modifier(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->modifier : 0;
}

int32_t kira_shared_surface_format(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->format : 0;
}

int64_t kira_shared_surface_dawn_handle(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->dawn_handle : -1;
}

uint32_t kira_shared_surface_memory_type_index(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->memory_type_index : 0;
}

uint64_t kira_shared_surface_allocation_size(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->allocation_size : 0;
}

void *kira_shared_surface_vk_image_create_info(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    return slot != 0 ? slot->vk_image_create_info : 0;
}

kira_shared_surface kira_shared_surface_adopt(
    int64_t handle,
    int32_t width,
    int32_t height,
    int32_t stride,
    int64_t modifier) {
    if (handle == 0 || width <= 0 || height <= 0) {
        return 0;
    }
    kira_shared_surface surface = kira_shared_slot_claim();
    if (surface == 0) {
        return 0;
    }
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    slot->handle = handle;
    slot->width = width;
    slot->height = height;
    slot->stride = stride;
    slot->modifier = modifier;
    slot->format = KIRA_SHARED_FOURCC_ARGB8888;
    slot->buffer = 0;
    return surface;
}

struct kira_shared_vulkan_import_record {
    void *image;
    void *memory;
    kira_shared_surface surface;
};

void *kira_shared_surface_vulkan_import_image(void *import_record) {
    struct kira_shared_vulkan_import_record *record =
        (struct kira_shared_vulkan_import_record *)import_record;
    return record != 0 ? record->image : 0;
}

void *kira_shared_surface_vulkan_import_memory(void *import_record) {
    struct kira_shared_vulkan_import_record *record =
        (struct kira_shared_vulkan_import_record *)import_record;
    return record != 0 ? record->memory : 0;
}

int32_t kira_shared_surface_vulkan_record_surface(void *import_record) {
    struct kira_shared_vulkan_import_record *record =
        (struct kira_shared_vulkan_import_record *)import_record;
    return record != 0 ? record->surface : 0;
}

void kira_shared_surface_vulkan_import_forget(void *import_record) {
    free(import_record);
}

#if defined(_WIN32)

#include <windows.h>

void *kira_shared_surface_vulkan_create(void *device, void *physical_device, int32_t width, int32_t height) {
    (void)device; (void)physical_device; (void)width; (void)height; return 0;
}

void *kira_shared_surface_vulkan_import(void *device, kira_shared_surface surface) {
    (void)device; (void)surface; return 0;
}

/* Windows shares a texture by its DXGI resource, which is a D3D object rather
 * than a block of memory -- so allocation belongs to the device, not here. This
 * side is what carries the handle once the device has made one, which is why
 * `create` answers 0: a caller on Windows adopts a handle the graphics layer
 * produced rather than asking for one here. */
int32_t kira_shared_surface_supported(void) {
    return 1;
}

kira_shared_surface kira_shared_surface_create(int32_t width, int32_t height) {
    (void)width;
    (void)height;
    snprintf(kira_shared_note, sizeof(kira_shared_note),
             "a shared surface on Windows is created by the graphics device and adopted here");
    return 0;
}

void kira_shared_surface_destroy(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    if (slot == 0) {
        return;
    }
    if (slot->handle != 0) {
        CloseHandle((HANDLE)(intptr_t)slot->handle);
    }
    memset(slot, 0, sizeof(*slot));
}

#elif defined(__APPLE__)

void *kira_shared_surface_vulkan_create(void *device, void *physical_device, int32_t width, int32_t height) {
    (void)device; (void)physical_device; (void)width; (void)height; return 0;
}

void *kira_shared_surface_vulkan_import(void *device, kira_shared_surface surface) {
    (void)device; (void)surface; return 0;
}

int32_t kira_shared_surface_supported(void) {
    return 1;
}

/* An IOSurface is created through the IOSurface framework and carried as a mach
 * port. Like Windows, the object comes from the graphics layer rather than from
 * a memory allocator, so this side adopts rather than allocates. */
kira_shared_surface kira_shared_surface_create(int32_t width, int32_t height) {
    (void)width;
    (void)height;
    snprintf(kira_shared_note, sizeof(kira_shared_note),
             "a shared surface on macOS is created by the graphics device and adopted here");
    return 0;
}

void kira_shared_surface_destroy(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    if (slot == 0) {
        return;
    }
    memset(slot, 0, sizeof(*slot));
}

#else

#include <dlfcn.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <vulkan/vulkan.h>

static int kira_vulkan_memory_type_for_physical(
    VkPhysicalDevice physical,
    uint32_t bits,
    VkMemoryPropertyFlags wanted) {
    VkPhysicalDeviceMemoryProperties properties;
    vkGetPhysicalDeviceMemoryProperties(physical, &properties);
    for (uint32_t index = 0; index < properties.memoryTypeCount; index += 1) {
        if ((bits & (1u << index)) != 0 &&
            (properties.memoryTypes[index].propertyFlags & wanted) == wanted) {
            return (int)index;
        }
    }
    return -1;
}

void *kira_shared_surface_vulkan_create(
    void *device_word,
    void *physical_word,
    int32_t width,
    int32_t height) {
    VkDevice device = (VkDevice)device_word;
    VkPhysicalDevice physical = (VkPhysicalDevice)physical_word;
    if (device == VK_NULL_HANDLE || physical == VK_NULL_HANDLE || width <= 0 || height <= 0) {
        return 0;
    }

    VkExternalMemoryImageCreateInfo external = {0};
    external.sType = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO;
    external.handleTypes = VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    VkImageCreateInfo image_info = {0};
    image_info.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    image_info.pNext = &external;
    image_info.imageType = VK_IMAGE_TYPE_2D;
    image_info.format = VK_FORMAT_B8G8R8A8_UNORM;
    image_info.extent.width = (uint32_t)width;
    image_info.extent.height = (uint32_t)height;
    image_info.extent.depth = 1;
    image_info.mipLevels = 1;
    image_info.arrayLayers = 1;
    image_info.samples = VK_SAMPLE_COUNT_1_BIT;
    image_info.tiling = VK_IMAGE_TILING_LINEAR;
    image_info.usage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    image_info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    image_info.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;

    VkImage image = VK_NULL_HANDLE;
    if (vkCreateImage(device, &image_info, 0, &image) != VK_SUCCESS) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not create the device-owned shared image");
        return 0;
    }
    VkMemoryRequirements requirements;
    vkGetImageMemoryRequirements(device, image, &requirements);
    int memory_type = kira_vulkan_memory_type_for_physical(
        physical, requirements.memoryTypeBits, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT);
    if (memory_type < 0) {
        memory_type = kira_vulkan_memory_type_for_physical(physical, requirements.memoryTypeBits, 0);
    }
    if (memory_type < 0) {
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan found no memory type for the device-owned shared image");
        return 0;
    }

    VkExportMemoryAllocateInfo export_info = {0};
    export_info.sType = VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO;
    export_info.handleTypes = VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    VkMemoryDedicatedAllocateInfo dedicated_info = {0};
    dedicated_info.sType = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO;
    dedicated_info.pNext = &export_info;
    dedicated_info.image = image;
    VkMemoryAllocateInfo allocation = {0};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.pNext = &dedicated_info;
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = (uint32_t)memory_type;
    VkDeviceMemory memory = VK_NULL_HANDLE;
    if (vkAllocateMemory(device, &allocation, 0, &memory) != VK_SUCCESS || memory == VK_NULL_HANDLE) {
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not allocate device-owned shared image memory");
        return 0;
    }
    if (vkBindImageMemory(device, image, memory, 0) != VK_SUCCESS) {
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not bind device-owned shared image memory");
        return 0;
    }

    PFN_vkGetMemoryFdKHR get_memory_fd = (PFN_vkGetMemoryFdKHR)
        vkGetDeviceProcAddr(device, "vkGetMemoryFdKHR");
    if (get_memory_fd == 0) {
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan exposes no vkGetMemoryFdKHR on the render device");
        return 0;
    }
    VkMemoryGetFdInfoKHR fd_info = {0};
    fd_info.sType = VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR;
    fd_info.memory = memory;
    fd_info.handleType = VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    int scanout_fd = -1;
    if (get_memory_fd(device, &fd_info, &scanout_fd) != VK_SUCCESS || scanout_fd < 0) {
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not export the render image as a dma-buf");
        return 0;
    }

    VkImageSubresource subresource = {0};
    subresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    VkSubresourceLayout layout;
    vkGetImageSubresourceLayout(device, image, &subresource, &layout);

    kira_shared_surface surface = kira_shared_slot_claim();
    if (surface == 0) {
        close(scanout_fd);
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        return 0;
    }
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    slot->handle = scanout_fd;
    slot->width = width;
    slot->height = height;
    slot->stride = (int32_t)layout.rowPitch;
    slot->modifier = KIRA_SHARED_MODIFIER_LINEAR;
    slot->format = KIRA_SHARED_FOURCC_ARGB8888;
    slot->allocation_size = requirements.size;

    struct kira_shared_vulkan_import_record *record =
        (struct kira_shared_vulkan_import_record *)calloc(1, sizeof(*record));
    if (record == 0) {
        kira_shared_surface_destroy(surface);
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        return 0;
    }
    record->image = (void *)image;
    record->memory = (void *)memory;
    record->surface = surface;
    kira_shared_note[0] = 0;
    return record;
}


void *kira_shared_surface_vulkan_import(void *device_word, kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    VkDevice device = (VkDevice)device_word;
    if (slot == 0 || device == VK_NULL_HANDLE || slot->handle < 0 ||
        slot->vk_image_create_info == 0 || slot->allocation_size == 0) {
        return 0;
    }
    VkImageCreateInfo image_info = *(const VkImageCreateInfo *)slot->vk_image_create_info;
    VkImage image = VK_NULL_HANDLE;
    if (vkCreateImage(device, &image_info, 0, &image) != VK_SUCCESS) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not recreate the shared image on the render device");
        return 0;
    }
    VkMemoryRequirements requirements;
    vkGetImageMemoryRequirements(device, image, &requirements);
    int imported_fd = dup((int)slot->handle);
    if (imported_fd < 0) {
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "could not duplicate the Vulkan shared-memory dma-buf");
        return 0;
    }
    PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties = (PFN_vkGetMemoryFdPropertiesKHR)
        vkGetDeviceProcAddr(device, "vkGetMemoryFdPropertiesKHR");
    if (get_memory_fd_properties == 0) {
        close(imported_fd);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan exposes no vkGetMemoryFdPropertiesKHR for shared surfaces");
        return 0;
    }
    VkMemoryFdPropertiesKHR fd_properties = {0};
    fd_properties.sType = VK_STRUCTURE_TYPE_MEMORY_FD_PROPERTIES_KHR;
    if (get_memory_fd_properties(device, VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT,
                                 imported_fd, &fd_properties) != VK_SUCCESS) {
        close(imported_fd);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not inspect the shared-memory dma-buf");
        return 0;
    }
    uint32_t compatible_types = requirements.memoryTypeBits & fd_properties.memoryTypeBits;
    uint32_t memory_type = slot->memory_type_index;
    if (memory_type >= 32 || (compatible_types & (1u << memory_type)) == 0) {
        memory_type = UINT32_MAX;
        for (uint32_t bit = 0; bit < 32; bit += 1) {
            if ((compatible_types & (1u << bit)) != 0) { memory_type = bit; break; }
        }
    }
    if (memory_type == UINT32_MAX) {
        close(imported_fd);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan shared dma-buf has no compatible memory type");
        return 0;
    }
    VkImportMemoryFdInfoKHR import_info = {0};
    import_info.sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_FD_INFO_KHR;
    import_info.handleType = VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    import_info.fd = imported_fd;
    VkMemoryAllocateInfo allocation = {0};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.pNext = &import_info;
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = memory_type;
    VkDeviceMemory memory = VK_NULL_HANDLE;
    VkResult allocation_result = vkAllocateMemory(device, &allocation, 0, &memory);
    if (allocation_result != VK_SUCCESS || memory == VK_NULL_HANDLE) {
        close(imported_fd);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not import shared image memory");
        return 0;
    }
    if (vkBindImageMemory(device, image, memory, 0) != VK_SUCCESS) {
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not bind imported shared image memory");
        return 0;
    }
    struct kira_shared_vulkan_import_record *record =
        (struct kira_shared_vulkan_import_record *)calloc(1, sizeof(*record));
    if (record == 0) {
        vkFreeMemory(device, memory, 0);
        vkDestroyImage(device, image, 0);
        return 0;
    }
    record->image = (void *)image;
    record->memory = (void *)memory;
    return record;
}

struct kira_drm_create_dumb {
    uint32_t height;
    uint32_t width;
    uint32_t bpp;
    uint32_t flags;
    uint32_t handle;
    uint32_t pitch;
    uint64_t size;
};

struct kira_drm_prime_handle {
    uint32_t handle;
    uint32_t flags;
    int32_t fd;
};

struct kira_drm_destroy_dumb {
    uint32_t handle;
};

#define KIRA_DRM_IOCTL_MODE_CREATE_DUMB 0xc02064b2UL
#define KIRA_DRM_IOCTL_MODE_DESTROY_DUMB 0xc00464b4UL
#define KIRA_DRM_IOCTL_PRIME_HANDLE_TO_FD 0xc00c642dUL
#define KIRA_DRM_CLOEXEC 0x01U
#define KIRA_DRM_RDWR 0x02U

/* The slice of GBM this needs, declared here rather than included.
 *
 * `gbm.h` ships in a development package that a machine running the built
 * program has no reason to have, and these six entry points have been stable
 * for a decade. Declaring them keeps the build free of a header dependency that
 * would buy nothing. */
#define KIRA_GBM_BO_USE_RENDERING 4
#define KIRA_GBM_BO_USE_LINEAR 16

typedef void *(*kira_gbm_create_device_fn)(int fd);
typedef void (*kira_gbm_device_destroy_fn)(void *device);
typedef void *(*kira_gbm_bo_create_fn)(void *device, uint32_t width, uint32_t height, uint32_t format, uint32_t flags);
typedef int (*kira_gbm_bo_get_fd_fn)(void *bo);
typedef uint32_t (*kira_gbm_bo_get_stride_fn)(void *bo);
typedef uint64_t (*kira_gbm_bo_get_modifier_fn)(void *bo);
typedef void (*kira_gbm_bo_destroy_fn)(void *bo);

struct kira_gbm {
    int loaded;
    void *library;
    int node;
    void *device;
    kira_gbm_create_device_fn create_device;
    kira_gbm_device_destroy_fn device_destroy;
    kira_gbm_bo_create_fn bo_create;
    kira_gbm_bo_get_fd_fn bo_get_fd;
    kira_gbm_bo_get_stride_fn bo_get_stride;
    kira_gbm_bo_get_modifier_fn bo_get_modifier;
    kira_gbm_bo_destroy_fn bo_destroy;
};

static struct kira_gbm kira_gbm_state;

/* Open GBM and a render node, once.
 *
 * The RENDER node rather than the card: a render node needs no session and no
 * master, which is what lets a component allocate from one inside a container or
 * over a remote session. */
static int kira_gbm_ready(void) {
    if (kira_gbm_state.loaded) {
        return kira_gbm_state.device != 0;
    }
    kira_gbm_state.loaded = 1;
    kira_gbm_state.node = -1;

    kira_gbm_state.library = dlopen("libgbm.so.1", RTLD_LAZY | RTLD_LOCAL);
    if (kira_gbm_state.library == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "libgbm.so.1 is not on this machine");
        return 0;
    }
    kira_gbm_state.create_device = (kira_gbm_create_device_fn)dlsym(kira_gbm_state.library, "gbm_create_device");
    kira_gbm_state.device_destroy = (kira_gbm_device_destroy_fn)dlsym(kira_gbm_state.library, "gbm_device_destroy");
    kira_gbm_state.bo_create = (kira_gbm_bo_create_fn)dlsym(kira_gbm_state.library, "gbm_bo_create");
    kira_gbm_state.bo_get_fd = (kira_gbm_bo_get_fd_fn)dlsym(kira_gbm_state.library, "gbm_bo_get_fd");
    kira_gbm_state.bo_get_stride = (kira_gbm_bo_get_stride_fn)dlsym(kira_gbm_state.library, "gbm_bo_get_stride");
    kira_gbm_state.bo_get_modifier = (kira_gbm_bo_get_modifier_fn)dlsym(kira_gbm_state.library, "gbm_bo_get_modifier");
    kira_gbm_state.bo_destroy = (kira_gbm_bo_destroy_fn)dlsym(kira_gbm_state.library, "gbm_bo_destroy");
    if (kira_gbm_state.create_device == 0 || kira_gbm_state.bo_create == 0 || kira_gbm_state.bo_get_fd == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "libgbm.so.1 is missing the entry points this needs");
        return 0;
    }

    /* The first render node that opens. There is more than one on a machine with
     * more than one GPU, and any of them can allocate memory the others can
     * read: a dmabuf is not tied to the device that made it. */
    static const char *const nodes[] = {
        "/dev/dri/renderD128",
        "/dev/dri/renderD129",
        "/dev/dri/renderD130",
    };
    for (size_t index = 0; index < sizeof(nodes) / sizeof(nodes[0]); index += 1) {
        int node = open(nodes[index], O_RDWR | O_CLOEXEC);
        if (node >= 0) {
            kira_gbm_state.node = node;
            break;
        }
    }
    if (kira_gbm_state.node < 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "no DRM render node could be opened");
        return 0;
    }
    kira_gbm_state.device = kira_gbm_state.create_device(kira_gbm_state.node);
    if (kira_gbm_state.device == 0) {
        close(kira_gbm_state.node);
        kira_gbm_state.node = -1;
        snprintf(kira_shared_note, sizeof(kira_shared_note), "the render node would not open as a GBM device");
        return 0;
    }
    return 1;
}

struct kira_vulkan_allocator {
    int tried;
    VkInstance instance;
    VkPhysicalDevice physical;
    VkDevice device;
    VkPhysicalDeviceMemoryProperties memory_properties;
    PFN_vkGetMemoryFdKHR get_memory_fd;
    uint32_t queue_family_index;
};

static struct kira_vulkan_allocator kira_vulkan_allocator_state;

static int kira_vulkan_memory_type(uint32_t bits, VkMemoryPropertyFlags wanted) {
    for (uint32_t index = 0; index < kira_vulkan_allocator_state.memory_properties.memoryTypeCount; index += 1) {
        if ((bits & (1u << index)) != 0 &&
            (kira_vulkan_allocator_state.memory_properties.memoryTypes[index].propertyFlags & wanted) == wanted) {
            return (int)index;
        }
    }
    return -1;
}

static int kira_vulkan_allocator_ready(void) {
    if (kira_vulkan_allocator_state.tried) {
        return kira_vulkan_allocator_state.device != VK_NULL_HANDLE;
    }
    kira_vulkan_allocator_state.tried = 1;

    VkApplicationInfo app = {0};
    app.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app.pApplicationName = "kira-shared-surface";
    app.apiVersion = VK_API_VERSION_1_1;
    VkInstanceCreateInfo instance_info = {0};
    instance_info.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    instance_info.pApplicationInfo = &app;
    if (vkCreateInstance(&instance_info, 0, &kira_vulkan_allocator_state.instance) != VK_SUCCESS) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not create the shared-surface allocator instance");
        return 0;
    }

    uint32_t physical_count = 1;
    if (vkEnumeratePhysicalDevices(kira_vulkan_allocator_state.instance, &physical_count,
                                   &kira_vulkan_allocator_state.physical) != VK_SUCCESS || physical_count == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan found no physical device for shared surfaces");
        return 0;
    }

    const char *extensions[] = {
        VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME,
        VK_EXT_EXTERNAL_MEMORY_DMA_BUF_EXTENSION_NAME,
    };
    uint32_t queue_count = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(kira_vulkan_allocator_state.physical, &queue_count, 0);
    VkQueueFamilyProperties queue_properties[32];
    if (queue_count > 32) queue_count = 32;
    vkGetPhysicalDeviceQueueFamilyProperties(kira_vulkan_allocator_state.physical, &queue_count, queue_properties);
    uint32_t queue_family = UINT32_MAX;
    for (uint32_t index = 0; index < queue_count; index += 1) {
        if ((queue_properties[index].queueFlags & VK_QUEUE_GRAPHICS_BIT) != 0) {
            queue_family = index;
            break;
        }
    }
    if (queue_family == UINT32_MAX) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan found no graphics queue for shared surfaces");
        return 0;
    }
    kira_vulkan_allocator_state.queue_family_index = queue_family;
    float priority = 1.0f;
    VkDeviceQueueCreateInfo queue_info = {0};
    queue_info.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queue_info.queueFamilyIndex = queue_family;
    queue_info.queueCount = 1;
    queue_info.pQueuePriorities = &priority;
    VkDeviceCreateInfo device_info = {0};
    device_info.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    device_info.queueCreateInfoCount = 1;
    device_info.pQueueCreateInfos = &queue_info;
    device_info.enabledExtensionCount = 2;
    device_info.ppEnabledExtensionNames = extensions;
    if (vkCreateDevice(kira_vulkan_allocator_state.physical, &device_info, 0,
                       &kira_vulkan_allocator_state.device) != VK_SUCCESS) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not create the shared-surface allocator device");
        return 0;
    }
    vkGetPhysicalDeviceMemoryProperties(kira_vulkan_allocator_state.physical,
                                        &kira_vulkan_allocator_state.memory_properties);
    kira_vulkan_allocator_state.get_memory_fd = (PFN_vkGetMemoryFdKHR)
        vkGetDeviceProcAddr(kira_vulkan_allocator_state.device, "vkGetMemoryFdKHR");
    if (kira_vulkan_allocator_state.get_memory_fd == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan exposes no vkGetMemoryFdKHR for shared surfaces");
        return 0;
    }
    return 1;
}

struct kira_vulkan_image_description {
    VkExternalMemoryImageCreateInfo external;
    VkImageCreateInfo image;
};

static kira_shared_surface kira_vulkan_surface_create(int32_t width, int32_t height) {
    if (!kira_vulkan_allocator_ready()) {
        return 0;
    }

    struct kira_vulkan_image_description *description =
        (struct kira_vulkan_image_description *)calloc(1, sizeof(*description));
    if (description == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "out of memory retaining the Vulkan shared-image description");
        return 0;
    }
    description->external.sType = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO;
    description->external.handleTypes = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT |
                                        VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    description->image.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    description->image.pNext = &description->external;
    description->image.flags = VK_IMAGE_CREATE_MUTABLE_FORMAT_BIT;
    description->image.imageType = VK_IMAGE_TYPE_2D;
    description->image.format = VK_FORMAT_B8G8R8A8_UNORM;
    description->image.extent.width = (uint32_t)width;
    description->image.extent.height = (uint32_t)height;
    description->image.extent.depth = 1;
    description->image.mipLevels = 1;
    description->image.arrayLayers = 1;
    description->image.samples = VK_SAMPLE_COUNT_1_BIT;
    description->image.tiling = VK_IMAGE_TILING_LINEAR;
    description->image.usage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT | VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    description->image.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;

    VkImage image = VK_NULL_HANDLE;
    if (vkCreateImage(kira_vulkan_allocator_state.device, &description->image, 0, &image) != VK_SUCCESS) {
        free(description);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not create the linear shared image");
        return 0;
    }
    VkMemoryRequirements requirements;
    vkGetImageMemoryRequirements(kira_vulkan_allocator_state.device, image, &requirements);
    int memory_type = kira_vulkan_memory_type(requirements.memoryTypeBits, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT);
    if (memory_type < 0) {
        memory_type = kira_vulkan_memory_type(requirements.memoryTypeBits, 0);
    }
    if (memory_type < 0) {
        vkDestroyImage(kira_vulkan_allocator_state.device, image, 0);
        free(description);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan found no memory type for the shared image");
        return 0;
    }

    VkExportMemoryAllocateInfo export_info = {0};
    export_info.sType = VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_INFO;
    export_info.handleTypes = description->external.handleTypes;
    VkMemoryAllocateInfo allocation = {0};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.pNext = &export_info;
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = (uint32_t)memory_type;
    VkDeviceMemory memory = VK_NULL_HANDLE;
    if (vkAllocateMemory(kira_vulkan_allocator_state.device, &allocation, 0, &memory) != VK_SUCCESS ||
        vkBindImageMemory(kira_vulkan_allocator_state.device, image, memory, 0) != VK_SUCCESS) {
        if (memory != VK_NULL_HANDLE) vkFreeMemory(kira_vulkan_allocator_state.device, memory, 0);
        vkDestroyImage(kira_vulkan_allocator_state.device, image, 0);
        free(description);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not allocate shared image memory");
        return 0;
    }

    VkImageSubresource subresource = {0};
    subresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    VkSubresourceLayout layout;
    vkGetImageSubresourceLayout(kira_vulkan_allocator_state.device, image, &subresource, &layout);

    VkMemoryGetFdInfoKHR fd_info = {0};
    fd_info.sType = VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR;
    fd_info.memory = memory;
    fd_info.handleType = VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT;
    int scanout_fd = -1;
    if (kira_vulkan_allocator_state.get_memory_fd(kira_vulkan_allocator_state.device, &fd_info, &scanout_fd) != VK_SUCCESS) {
        vkFreeMemory(kira_vulkan_allocator_state.device, memory, 0);
        vkDestroyImage(kira_vulkan_allocator_state.device, image, 0);
        free(description);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not export the shared image as a dma-buf");
        return 0;
    }
    fd_info.handleType = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT;
    int dawn_fd = -1;
    if (kira_vulkan_allocator_state.get_memory_fd(kira_vulkan_allocator_state.device, &fd_info, &dawn_fd) != VK_SUCCESS) {
        close(scanout_fd);
        vkFreeMemory(kira_vulkan_allocator_state.device, memory, 0);
        vkDestroyImage(kira_vulkan_allocator_state.device, image, 0);
        free(description);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "Vulkan could not export the shared image for Dawn");
        return 0;
    }

    kira_shared_surface surface = kira_shared_slot_claim();
    if (surface == 0) {
        close(dawn_fd);
        close(scanout_fd);
        vkFreeMemory(kira_vulkan_allocator_state.device, memory, 0);
        vkDestroyImage(kira_vulkan_allocator_state.device, image, 0);
        free(description);
        return 0;
    }
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    slot->handle = scanout_fd;
    slot->dawn_handle = dawn_fd;
    slot->width = width;
    slot->height = height;
    slot->stride = (int32_t)layout.rowPitch;
    slot->modifier = KIRA_SHARED_MODIFIER_LINEAR;
    slot->format = KIRA_SHARED_FOURCC_ARGB8888;
    slot->memory_type_index = (uint32_t)memory_type;
    slot->allocation_size = requirements.size;
    slot->vk_image = (uint64_t)image;
    slot->vk_memory = (uint64_t)memory;
    slot->vk_image_create_info = &description->image;
    kira_shared_note[0] = 0;
    return surface;
}

static int kira_drm_primary_open(void) {
    static const char *const nodes[] = {
        "/dev/dri/card0",
        "/dev/dri/card1",
        "/dev/dri/card2",
    };
    for (size_t index = 0; index < sizeof(nodes) / sizeof(nodes[0]); index += 1) {
        int fd = open(nodes[index], O_RDWR | O_CLOEXEC);
        if (fd >= 0) {
            return fd;
        }
    }
    return -1;
}

static kira_shared_surface kira_drm_dumb_surface_create(int32_t width, int32_t height) {
    int card = kira_drm_primary_open();
    if (card < 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "no DRM primary node could be opened");
        return 0;
    }

    struct kira_drm_create_dumb create = {0};
    create.width = (uint32_t)width;
    create.height = (uint32_t)height;
    create.bpp = 32;
    if (ioctl(card, KIRA_DRM_IOCTL_MODE_CREATE_DUMB, &create) != 0 || create.handle == 0) {
        close(card);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "the DRM device would not allocate a linear shared surface");
        return 0;
    }

    struct kira_drm_prime_handle prime = {0};
    prime.handle = create.handle;
    prime.flags = KIRA_DRM_CLOEXEC | KIRA_DRM_RDWR;
    prime.fd = -1;
    if (ioctl(card, KIRA_DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime) != 0 || prime.fd < 0) {
        struct kira_drm_destroy_dumb destroy = { create.handle };
        ioctl(card, KIRA_DRM_IOCTL_MODE_DESTROY_DUMB, &destroy);
        close(card);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "the DRM surface could not be PRIME-exported as a dma-buf");
        return 0;
    }

    kira_shared_surface surface = kira_shared_slot_claim();
    if (surface == 0) {
        close(prime.fd);
        struct kira_drm_destroy_dumb destroy = { create.handle };
        ioctl(card, KIRA_DRM_IOCTL_MODE_DESTROY_DUMB, &destroy);
        close(card);
        return 0;
    }
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    slot->handle = (int64_t)prime.fd;
    slot->width = width;
    slot->height = height;
    slot->stride = (int32_t)create.pitch;
    slot->modifier = KIRA_SHARED_MODIFIER_LINEAR;
    slot->format = KIRA_SHARED_FOURCC_ARGB8888;
    slot->buffer = 0;
    slot->allocator_fd = card;
    slot->drm_handle = create.handle;
    kira_shared_note[0] = 0;
    return surface;
}

int32_t kira_shared_surface_supported(void) {
    fprintf(stderr, "kira-shared-surface: legacy supported() probe\n");
    if (kira_gbm_ready()) {
        return 1;
    }
    if (kira_vulkan_allocator_ready()) {
        return 1;
    }
    int card = kira_drm_primary_open();
    if (card >= 0) {
        close(card);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "GBM unavailable; using DRM linear-buffer sharing");
        return 1;
    }
    return 0;
}

kira_shared_surface kira_shared_surface_create(int32_t width, int32_t height) {
    fprintf(stderr, "kira-shared-surface: legacy create() allocation\n");
    if (width <= 0 || height <= 0) {
        return 0;
    }
    if (kira_gbm_ready() == 0) {
        if (kira_vulkan_allocator_ready()) {
            return kira_vulkan_surface_create(width, height);
        }
        return kira_drm_dumb_surface_create(width, height);
    }
    /* LINEAR as well as RENDERING: the surface is sampled by a DIFFERENT
     * process, whose driver may not understand this one's preferred tiling. A
     * vendor-specific modifier is a surface the compositor cannot read. */
    void *buffer = kira_gbm_state.bo_create(
        kira_gbm_state.device,
        (uint32_t)width,
        (uint32_t)height,
        KIRA_SHARED_FOURCC_ARGB8888,
        KIRA_GBM_BO_USE_RENDERING | KIRA_GBM_BO_USE_LINEAR);
    if (buffer == 0) {
        snprintf(kira_shared_note, sizeof(kira_shared_note), "GBM would not allocate a %dx%d surface", width, height);
        return 0;
    }
    int descriptor = kira_gbm_state.bo_get_fd(buffer);
    if (descriptor < 0) {
        kira_gbm_state.bo_destroy(buffer);
        snprintf(kira_shared_note, sizeof(kira_shared_note), "the surface could not be exported as a dmabuf");
        return 0;
    }
    kira_shared_surface surface = kira_shared_slot_claim();
    if (surface == 0) {
        close(descriptor);
        kira_gbm_state.bo_destroy(buffer);
        return 0;
    }
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    slot->handle = (int64_t)descriptor;
    slot->width = width;
    slot->height = height;
    slot->stride = kira_gbm_state.bo_get_stride != 0 ? (int32_t)kira_gbm_state.bo_get_stride(buffer) : width * 4;
    slot->modifier = kira_gbm_state.bo_get_modifier != 0
        ? (int64_t)kira_gbm_state.bo_get_modifier(buffer)
        : KIRA_SHARED_MODIFIER_LINEAR;
    slot->format = KIRA_SHARED_FOURCC_ARGB8888;
    slot->buffer = buffer;
    kira_shared_note[0] = 0;
    return surface;
}

void kira_shared_surface_destroy(kira_shared_surface surface) {
    struct kira_shared_surface_slot *slot = kira_shared_slot_at(surface);
    if (slot == 0) {
        return;
    }
    if (slot->handle != 0) {
        close((int)slot->handle);
    }
    if (slot->dawn_handle > 0) {
        close(slot->dawn_handle);
    }
    /* Only what this process allocated is destroyed. An adopted surface holds a
     * descriptor and nothing else, and the memory behind it belongs to whoever
     * made it. */
    if (slot->buffer != 0 && kira_gbm_state.bo_destroy != 0) {
        kira_gbm_state.bo_destroy(slot->buffer);
    }
    if (slot->drm_handle != 0 && slot->allocator_fd >= 0) {
        struct kira_drm_destroy_dumb destroy = { slot->drm_handle };
        ioctl(slot->allocator_fd, KIRA_DRM_IOCTL_MODE_DESTROY_DUMB, &destroy);
        close(slot->allocator_fd);
    }
    if (slot->vk_image != 0 && kira_vulkan_allocator_state.device != VK_NULL_HANDLE) {
        vkDestroyImage(kira_vulkan_allocator_state.device, (VkImage)slot->vk_image, 0);
    }
    if (slot->vk_memory != 0 && kira_vulkan_allocator_state.device != VK_NULL_HANDLE) {
        vkFreeMemory(kira_vulkan_allocator_state.device, (VkDeviceMemory)slot->vk_memory, 0);
    }
    if (slot->vk_image_create_info != 0) {
        struct kira_vulkan_image_description *description =
            (struct kira_vulkan_image_description *)((char *)slot->vk_image_create_info - offsetof(struct kira_vulkan_image_description, image));
        free(description);
    }
    memset(slot, 0, sizeof(*slot));
}

#endif
