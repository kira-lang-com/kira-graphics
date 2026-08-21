#ifndef KIRA_SHARED_SURFACE_H
#define KIRA_SHARED_SURFACE_H

#include <stdint.h>

/* A block of GPU memory two processes can both render from and sample.
 *
 * This is the allocation half of cross-process compositing. Dawn can IMPORT
 * shared memory -- `wgpuDeviceImportSharedTextureMemory` -- but it cannot
 * allocate any, so the buffer has to come from the platform first and be handed
 * to Dawn on both sides afterwards. That is what this does, and all it does:
 * nothing here knows what a texture is.
 *
 *   Linux    a dmabuf from GBM, on the DRM render node
 *   Windows  a DXGI shared NT handle
 *   macOS    an IOSurface
 *
 * The handle that comes out is transferred by the CHANNEL rather than described
 * in a message -- see KiraIpc's handle passing -- because a number naming
 * memory means nothing in the process that did not allocate it.
 *
 * # It is allowed to fail
 *
 * A machine with no render node, a driver with no export support, a container
 * with no /dev/dri: all of them answer 0 rather than trapping. Zero-copy sharing
 * is an optimisation over copying the pixels, and a caller that cannot have it
 * falls back rather than failing to start. Nothing here is loaded at link time
 * either -- GBM is opened by name at first use -- so a build runs on a machine
 * that does not have it. */

/* An allocated surface. Zero is never one. */
typedef int32_t kira_shared_surface;

/* Allocate a surface `width` x `height` in a linear BGRA8 layout.
 *
 * Linear rather than tiled, and BGRA8 rather than the driver's preference,
 * because the whole point is that a DIFFERENT process samples it: a modifier
 * only one vendor's driver understands is a surface the compositor cannot read.
 * The modifier is reported anyway, so a caller that negotiated something better
 * can pass it on. */
kira_shared_surface kira_shared_surface_create(int32_t width, int32_t height);

/* Take ownership of a surface allocated in another process, as it arrived over
 * a channel. The handle is this process's own by the time it gets here. */
kira_shared_surface kira_shared_surface_adopt(
    int64_t handle,
    int32_t width,
    int32_t height,
    int32_t stride,
    int64_t modifier);

/* The handle to hand to the channel. Still owned by this surface: transferring
 * it duplicates it, and closing this one is what releases this side's. */
int64_t kira_shared_surface_handle(kira_shared_surface surface);

int32_t kira_shared_surface_width(kira_shared_surface surface);
int32_t kira_shared_surface_height(kira_shared_surface surface);
/* Bytes per row, which an importer needs and cannot infer: a driver is free to
 * pad rows out to its own alignment. */
int32_t kira_shared_surface_stride(kira_shared_surface surface);
/* The DRM format modifier describing the memory layout, or 0 for linear. */
int64_t kira_shared_surface_modifier(kira_shared_surface surface);
/* The DRM fourcc the surface was allocated in. */
int32_t kira_shared_surface_format(kira_shared_surface surface);

/* Whether this platform can share a surface at all. A caller asks once and
 * arranges to copy pixels instead when the answer is no. */
int32_t kira_shared_surface_supported(void);

/* Why sharing is unavailable, when it is. For a person, and empty when the last
 * allocation succeeded. */
const char *kira_shared_surface_diagnostic(void);

void kira_shared_surface_destroy(kira_shared_surface surface);

/* --- Handing a surface to the GPU ------------------------------------------
 *
 * Dawn imports shared memory rather than allocating it, so a surface becomes a
 * texture in two steps: the memory is imported, and a texture is made over it.
 * The producer and the consumer run exactly the same two calls -- by the time
 * either gets here it is holding its own handle to the same memory, and neither
 * needs to know which of them allocated.
 *
 * `device` is the `WGPUDevice`, passed as a pointer because this is the seam and
 * not the graphics layer: nothing here reads it.
 *
 * A platform whose sharing goes through the graphics DEVICE rather than through
 * a memory allocator -- Windows with a DXGI resource, macOS with an IOSurface --
 * answers 0 from these, and the device's own import path is used instead. */
void *kira_shared_texture_import_memory(void *device, kira_shared_surface surface);
void *kira_shared_texture_create(void *memory);

/* Bracket every frame that touches the surface.
 *
 * Shared memory is not shared synchronisation. Without this the compositor can
 * sample halfway through the producer's frame -- a torn surface rather than a
 * wrong one, which is the hardest kind to see in a screenshot and the easiest to
 * see in motion. */
/* Take the GPU's word that the other side has finished.
 *
 * `preserve` is the whole difference between the two ends of a surface. A
 * PRODUCER is about to draw over every pixel and says 0: the contents before it
 * started are worth nothing, and claiming otherwise costs a transition for
 * pixels about to be replaced. A CONSUMER says 1, because the contents are the
 * entire point of the exchange -- beginning as a producer would discard the
 * frame it came to read, which does not fail, it just hands back whatever the
 * memory happened to hold. */
int32_t kira_shared_texture_begin(void *memory, void *texture, int32_t preserve);
int32_t kira_shared_texture_end(void *memory, void *texture);
void kira_shared_texture_release(void *memory, void *texture);

const char *kira_shared_texture_diagnostic(void);

#endif
