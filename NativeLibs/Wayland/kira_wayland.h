#ifndef KIRA_WAYLAND_H
#define KIRA_WAYLAND_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

struct kira_wayland_registry_listener {
    void (*global)(void *data, void *registry, uint32_t name, void *interface_name, uint32_t version);
    void (*global_remove)(void *data, void *registry, uint32_t name);
};

struct kira_wayland_shell_listener {
    void (*ping)(void *data, void *shell, uint32_t serial);
};

struct kira_wayland_surface_listener {
    void (*configure)(void *data, void *surface, uint32_t serial);
};

struct kira_wayland_toplevel_listener {
    void (*configure)(void *data, void *toplevel, int32_t width, int32_t height, void *states);
    void (*close)(void *data, void *toplevel);
    void (*configure_bounds)(void *data, void *toplevel, int32_t width, int32_t height);
    void (*wm_capabilities)(void *data, void *toplevel, void *capabilities);
};

struct kira_wayland_seat_listener {
    void (*capabilities)(void *data, void *seat, uint32_t capabilities);
    void (*name)(void *data, void *seat, void *name);
};

struct kira_wayland_pointer_listener {
    void (*enter)(void *data, void *pointer, uint32_t serial, void *surface, int32_t x, int32_t y);
    void (*leave)(void *data, void *pointer, uint32_t serial, void *surface);
    void (*motion)(void *data, void *pointer, uint32_t time, int32_t x, int32_t y);
    void (*button)(void *data, void *pointer, uint32_t serial, uint32_t time, uint32_t button, uint32_t state);
    void (*axis)(void *data, void *pointer, uint32_t time, uint32_t axis, int32_t value);
    void (*frame)(void *data, void *pointer);
    void (*axis_source)(void *data, void *pointer, uint32_t source);
    void (*axis_stop)(void *data, void *pointer, uint32_t time, uint32_t axis);
    void (*axis_discrete)(void *data, void *pointer, uint32_t axis, int32_t discrete);
};

void *kira_wayland_display_connect(void);
void kira_wayland_display_disconnect(void *display);
int32_t kira_wayland_display_roundtrip(void *display);
int32_t kira_wayland_display_flush(void *display);
int32_t kira_wayland_display_dispatch_pending(void *display);
int32_t kira_wayland_display_pump(void *display);

void *kira_wayland_display_get_registry(void *display);
void *kira_wayland_registry_bind_compositor(void *registry, uint32_t name, uint32_t version);
void *kira_wayland_registry_bind_shell(void *registry, uint32_t name, uint32_t version);
void *kira_wayland_registry_bind_decoration_manager(void *registry, uint32_t name, uint32_t version);
void *kira_wayland_registry_bind_seat(void *registry, uint32_t name, uint32_t version);
void *kira_wayland_display_bind_cursor_shape_manager(void *display);

// The size a surface was opened at, remembered on the surface's behalf.
//
// A wl_surface carries one user-data word and the window already spends it on
// the toplevel, so the size lives beside the surface rather than on it. The
// compositor is the authority on how big a surface is and says so in a
// configure; until that event is read, what a caller asked for is what it got,
// and reporting that is what lets the client area be a number rather than zero.
void kira_wayland_surface_note_size(void *surface, int32_t width, int32_t height);
int32_t kira_wayland_surface_width(void *surface);
int32_t kira_wayland_surface_height(void *surface);

int32_t kira_wayland_registry_add_listener(void *registry, const struct kira_wayland_registry_listener *listener, void *data);
int32_t kira_wayland_shell_add_listener(void *shell, const struct kira_wayland_shell_listener *listener, void *data);
int32_t kira_wayland_surface_add_listener(void *surface, const struct kira_wayland_surface_listener *listener, void *data);
int32_t kira_wayland_toplevel_add_listener(void *toplevel, const struct kira_wayland_toplevel_listener *listener, void *data);
int32_t kira_wayland_seat_add_listener(void *seat, const struct kira_wayland_seat_listener *listener, void *data);
int32_t kira_wayland_pointer_add_listener(void *pointer, const struct kira_wayland_pointer_listener *listener, void *data);

void *kira_wayland_compositor_create_surface(void *compositor);
void *kira_wayland_shell_get_surface(void *shell, void *surface);
void *kira_wayland_surface_get_toplevel(void *surface);
void *kira_wayland_seat_get_pointer(void *seat);
void *kira_wayland_cursor_shape_manager_get_pointer(void *manager, void *pointer);
void *kira_wayland_decoration_get_toplevel(void *manager, void *toplevel);

void kira_wayland_shell_pong(void *shell, uint32_t serial);
void kira_wayland_surface_ack_configure(void *surface, uint32_t serial);
void kira_wayland_toplevel_set_title(void *toplevel, const char *title);
void kira_wayland_toplevel_set_app_id(void *toplevel, const char *app_id);
void kira_wayland_toplevel_move(void *toplevel, void *seat, uint32_t serial);
void kira_wayland_toplevel_resize(void *toplevel, void *seat, uint32_t serial, uint32_t edges);
void kira_wayland_toplevel_set_minimized(void *toplevel);
void kira_wayland_toplevel_set_maximized(void *toplevel);
void kira_wayland_toplevel_unset_maximized(void *toplevel);
int32_t kira_wayland_toplevel_states_contains(void *states, uint32_t state);
uint32_t kira_wayland_toplevel_state_maximized(void);
uint32_t kira_wayland_toplevel_state_activated(void);
void kira_wayland_cursor_shape_device_set_shape(void *device, uint32_t serial, uint32_t shape);
uint32_t kira_wayland_cursor_shape_default(void);
uint32_t kira_wayland_cursor_shape_for_resize_edge(uint32_t edges);
uint32_t kira_wayland_resize_edge_top(void);
uint32_t kira_wayland_resize_edge_bottom(void);
uint32_t kira_wayland_resize_edge_left(void);
uint32_t kira_wayland_resize_edge_top_left(void);
uint32_t kira_wayland_resize_edge_bottom_left(void);
uint32_t kira_wayland_resize_edge_right(void);
uint32_t kira_wayland_resize_edge_top_right(void);
uint32_t kira_wayland_resize_edge_bottom_right(void);
void kira_wayland_decoration_set_server_side(void *decoration);
void kira_wayland_surface_commit(void *surface);
void kira_wayland_surface_set_window_geometry(void *xdg_surface, int32_t x, int32_t y, int32_t width, int32_t height);

int32_t kira_wayland_resize_frame_create(void *display, void *surface, void *compositor, void *xdg_surface, int32_t width, int32_t height);
void kira_wayland_resize_frame_update(void *surface, int32_t width, int32_t height);
uint32_t kira_wayland_resize_frame_edge(void *surface, void *event_surface);
int32_t kira_wayland_resize_frame_offset_x(void *surface, void *event_surface);
int32_t kira_wayland_resize_frame_offset_y(void *surface, void *event_surface);
void kira_wayland_resize_frame_destroy(void *surface);

void kira_wayland_proxy_destroy(void *proxy);
uint32_t kira_wayland_proxy_get_version(void *proxy);
void kira_wayland_proxy_set_user_data(void *proxy, void *data);
void *kira_wayland_proxy_get_user_data(void *proxy);
void *kira_wayland_proxy_get_display(void *proxy);

#ifdef __cplusplus
}
#endif

#endif
