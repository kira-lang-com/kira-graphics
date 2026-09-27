#include "kira_vulkan_surface.h"

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#if defined(__linux__)
// Some minimal Vulkan loader builds do not export every device-extension
// trampoline as a linkable ELF symbol. Kira's generated core binding names the
// prototype, so provide the standard trampoline locally and resolve the real
// device command the Vulkan way.
VKAPI_ATTR VkResult VKAPI_CALL vkGetMemoryFdPropertiesKHR(
    VkDevice device,
    VkExternalMemoryHandleTypeFlagBits handleType,
    int fd,
    VkMemoryFdPropertiesKHR *properties) {
    PFN_vkGetMemoryFdPropertiesKHR function = (PFN_vkGetMemoryFdPropertiesKHR)
        vkGetDeviceProcAddr(device, "vkGetMemoryFdPropertiesKHR");
    if (function == NULL) return VK_ERROR_EXTENSION_NOT_PRESENT;
    return function(device, handleType, fd, properties);
}
#endif

static int kira_vulkan_device_supported_for_mode(void *physical_device, int needs_surface) {
    VkPhysicalDevice physical = (VkPhysicalDevice)physical_device;
    VkPhysicalDeviceProperties properties;
    vkGetPhysicalDeviceProperties(physical, &properties);
    if (properties.apiVersion < VK_API_VERSION_1_2) return 0;

    uint32_t count = 0;
    if (vkEnumerateDeviceExtensionProperties(physical, NULL, &count, NULL) != VK_SUCCESS || !count) return 0;
    VkExtensionProperties *extensions = malloc(sizeof(*extensions) * count);
    if (!extensions) return 0;
    int swapchain = 0, dynamic_rendering = 0, external_fd = 0, dma_buf = 0;
    if (vkEnumerateDeviceExtensionProperties(physical, NULL, &count, extensions) == VK_SUCCESS) {
        for (uint32_t i = 0; i < count; ++i) {
            swapchain |= strcmp(extensions[i].extensionName, VK_KHR_SWAPCHAIN_EXTENSION_NAME) == 0;
            dynamic_rendering |= strcmp(extensions[i].extensionName, VK_KHR_DYNAMIC_RENDERING_EXTENSION_NAME) == 0;
#ifdef __linux__
            external_fd |= strcmp(extensions[i].extensionName, VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME) == 0;
            dma_buf |= strcmp(extensions[i].extensionName, VK_EXT_EXTERNAL_MEMORY_DMA_BUF_EXTENSION_NAME) == 0;
#endif
        }
    }
    free(extensions);
    if (!dynamic_rendering) return 0;
    if (needs_surface && !swapchain) return 0;
#ifdef __linux__
    if (!needs_surface && (!external_fd || !dma_buf)) return 0;
#endif
    VkPhysicalDeviceDynamicRenderingFeatures rendering = {
        .sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES,
    };
    VkPhysicalDeviceFeatures2 features = {
        .sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2,
        .pNext = &rendering,
    };
    vkGetPhysicalDeviceFeatures2(physical, &features);
    return rendering.dynamicRendering == VK_TRUE;
}

int kira_vulkan_device_supported(void *physical_device) {
    return kira_vulkan_device_supported_for_mode(physical_device, 1);
}

int kira_vulkan_headless_device_supported(void *physical_device) {
    return kira_vulkan_device_supported_for_mode(physical_device, 0);
}

int kira_vulkan_clip_cursor(void *window, int lock) {
#ifdef _WIN32
    if (!lock) return ClipCursor(NULL) != 0;
    RECT bounds;
    POINT top_left, bottom_right;
    if (!GetClientRect((HWND)window, &bounds)) return 0;
    top_left = (POINT){bounds.left, bounds.top};
    bottom_right = (POINT){bounds.right, bounds.bottom};
    if (!ClientToScreen((HWND)window, &top_left) ||
        !ClientToScreen((HWND)window, &bottom_right)) return 0;
    bounds = (RECT){top_left.x, top_left.y, bottom_right.x, bottom_right.y};
    return ClipCursor(&bounds) != 0;
#else
    (void)window;
    (void)lock;
    return 0;
#endif
}

int kira_vulkan_has_dynamic_rendering(void *device) {
    return vkGetDeviceProcAddr((VkDevice)device, "vkCmdBeginRenderingKHR") != NULL &&
           vkGetDeviceProcAddr((VkDevice)device, "vkCmdEndRenderingKHR") != NULL;
}

void kira_vulkan_begin_rendering(void *device, void *command_buffer, const VkRenderingInfo *info) {
    PFN_vkCmdBeginRenderingKHR begin = (PFN_vkCmdBeginRenderingKHR)
        vkGetDeviceProcAddr((VkDevice)device, "vkCmdBeginRenderingKHR");
    begin((VkCommandBuffer)command_buffer, info);
}

void kira_vulkan_end_rendering(void *device, void *command_buffer) {
    PFN_vkCmdEndRenderingKHR end = (PFN_vkCmdEndRenderingKHR)
        vkGetDeviceProcAddr((VkDevice)device, "vkCmdEndRenderingKHR");
    end((VkCommandBuffer)command_buffer);
}

static void *surface_word(VkSurfaceKHR surface) {
    return (void *)(uintptr_t)surface;
}

void *kira_vulkan_create_win32_surface(void *instance, void *hinstance, void *window) {
#ifdef _WIN32
    const VkWin32SurfaceCreateInfoKHR info = {
        .sType = VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR,
        .pNext = NULL,
        .flags = 0,
        .hinstance = (HINSTANCE)hinstance,
        .hwnd = (HWND)window,
    };
    VkSurfaceKHR surface = VK_NULL_HANDLE;
    PFN_vkCreateWin32SurfaceKHR create = (PFN_vkCreateWin32SurfaceKHR)
        vkGetInstanceProcAddr((VkInstance)instance, "vkCreateWin32SurfaceKHR");
    if (!create || create((VkInstance)instance, &info, NULL, &surface) != VK_SUCCESS) {
        return NULL;
    }
    return surface_word(surface);
#else
    (void)instance;
    (void)hinstance;
    (void)window;
    return NULL;
#endif
}

void *kira_vulkan_create_wayland_surface(void *instance, void *display, void *surface) {
#if defined(_WIN32) || defined(KIRA_VULKAN_HEADLESS)
    (void)instance;
    (void)display;
    (void)surface;
    return NULL;
#else
    const VkWaylandSurfaceCreateInfoKHR info = {
        .sType = VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR,
        .pNext = NULL,
        .flags = 0,
        .display = (struct wl_display *)display,
        .surface = (struct wl_surface *)surface,
    };
    VkSurfaceKHR result = VK_NULL_HANDLE;
    PFN_vkCreateWaylandSurfaceKHR create = (PFN_vkCreateWaylandSurfaceKHR)
        vkGetInstanceProcAddr((VkInstance)instance, "vkCreateWaylandSurfaceKHR");
    if (!create || create((VkInstance)instance, &info, NULL, &result) != VK_SUCCESS) {
        return NULL;
    }
    return surface_word(result);
#endif
}

void kira_vulkan_destroy_surface(void *instance, void *surface) {
    if (surface != NULL) {
        vkDestroySurfaceKHR((VkInstance)instance, (VkSurfaceKHR)(uintptr_t)surface, NULL);
    }
}

void *kira_vulkan_instance_extensions(int linux_platform) {
    static const char *const win32_extensions[] = {
        "VK_KHR_surface",
        "VK_KHR_win32_surface",
    };
    static const char *const wayland_extensions[] = {
        "VK_KHR_surface",
        "VK_KHR_wayland_surface",
    };
    return (void *)(linux_platform ? wayland_extensions : win32_extensions);
}

void *kira_vulkan_device_extensions(int linux_platform, int needs_surface) {
    static const char *const window_extensions[] = {
        "VK_KHR_swapchain",
        "VK_KHR_dynamic_rendering",
    };
#if defined(__linux__)
    static const char *const linux_window_extensions[] = {
        "VK_KHR_swapchain",
        "VK_KHR_dynamic_rendering",
        "VK_KHR_external_memory_fd",
        "VK_EXT_external_memory_dma_buf",
    };
    static const char *const linux_headless_extensions[] = {
        "VK_KHR_dynamic_rendering",
        "VK_KHR_external_memory_fd",
        "VK_EXT_external_memory_dma_buf",
    };
    if (linux_platform) return (void *)(needs_surface ? linux_window_extensions : linux_headless_extensions);
#else
    (void)linux_platform;
#endif
    return (void *)window_extensions;
}

int kira_vulkan_device_extension_count(int linux_platform, int needs_surface) {
#if defined(__linux__)
    if (linux_platform) return needs_surface ? 4 : 3;
#else
    (void)linux_platform;
#endif
    return 2;
}

void *kira_vulkan_queue_priority(void) {
    static const float priority = 1.0f;
    return (void *)&priority;
}

void *kira_vulkan_dynamic_rendering_features(void) {
    static VkPhysicalDeviceDynamicRenderingFeatures features = {
        .sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES,
        .pNext = NULL,
        .dynamicRendering = VK_TRUE,
    };
    return (void *)&features;
}

void *kira_vulkan_pipeline_rendering_info(int color_format, int depth_format, int stencil_format) {
    static VkFormat color;
    static VkPipelineRenderingCreateInfo info;
    color = (VkFormat)color_format;
    info = (VkPipelineRenderingCreateInfo){
        .sType = VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO,
        .pNext = NULL,
        .viewMask = 0,
        .colorAttachmentCount = 1,
        .pColorAttachmentFormats = &color,
        .depthAttachmentFormat = (VkFormat)depth_format,
        .stencilAttachmentFormat = (VkFormat)stencil_format,
    };
    return (void *)&info;
}
