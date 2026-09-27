#ifndef KIRA_VULKAN_SURFACE_H
#define KIRA_VULKAN_SURFACE_H

#include <vulkan/vulkan_core.h>

#ifdef _WIN32
#include <windows.h>
#include <vulkan/vulkan_win32.h>
#elif !defined(KIRA_VULKAN_HEADLESS)
#include <vulkan/vulkan_wayland.h>
#endif

// The public Kira boundary carries opaque handles as pointer-sized words. The
// platform headers remain on this side because they pull in the window toolkit's
// native types and are not part of the platform-neutral Vulkan autobinding.
void *kira_vulkan_create_win32_surface(void *instance, void *hinstance, void *window);
void *kira_vulkan_create_wayland_surface(void *instance, void *display, void *surface);
void kira_vulkan_destroy_surface(void *instance, void *surface);
void *kira_vulkan_instance_extensions(int linux_platform);
void *kira_vulkan_device_extensions(int linux_platform, int needs_surface);
int kira_vulkan_device_extension_count(int linux_platform, int needs_surface);
void *kira_vulkan_queue_priority(void);
void *kira_vulkan_dynamic_rendering_features(void);
void *kira_vulkan_pipeline_rendering_info(int color_format, int depth_format, int stencil_format);
int kira_vulkan_has_dynamic_rendering(void *device);
void kira_vulkan_begin_rendering(void *device, void *command_buffer, const VkRenderingInfo *info);
void kira_vulkan_end_rendering(void *device, void *command_buffer);
int kira_vulkan_clip_cursor(void *window, int lock);
int kira_vulkan_device_supported(void *physical_device);
int kira_vulkan_headless_device_supported(void *physical_device);

#endif
