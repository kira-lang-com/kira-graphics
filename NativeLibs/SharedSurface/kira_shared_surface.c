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

#include <stdio.h>
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

#if defined(_WIN32)

#include <windows.h>

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
#include <unistd.h>

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

int32_t kira_shared_surface_supported(void) {
    return kira_gbm_ready() ? 1 : 0;
}

kira_shared_surface kira_shared_surface_create(int32_t width, int32_t height) {
    if (width <= 0 || height <= 0) {
        return 0;
    }
    if (kira_gbm_ready() == 0) {
        return 0;
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
    /* Only what this process allocated is destroyed. An adopted surface holds a
     * descriptor and nothing else, and the memory behind it belongs to whoever
     * made it. */
    if (slot->buffer != 0 && kira_gbm_state.bo_destroy != 0) {
        kira_gbm_state.bo_destroy(slot->buffer);
    }
    memset(slot, 0, sizeof(*slot));
}

#endif
