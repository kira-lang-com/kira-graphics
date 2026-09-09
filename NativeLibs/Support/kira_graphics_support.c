// The backend-neutral C the graphics library needs and Kira cannot express.
//
// Until now this lived in the sokol native library, because sokol was the
// library's only C. The monotonic clock a frame is timed with is a platform
// call — Kira has no clock of its own, and a graphics library cannot assume the
// syscall table a Tessera program has — so it is here, alone, with no backend
// and no window system attached. A build that selects Metal or Dawn links this
// and nothing of sokol's.

#include <stdint.h>

#if defined(_WIN32)
#include <windows.h>
#else
#include <time.h>
#endif

// Nanoseconds since an unspecified but monotonic origin.
//
// Monotonic rather than wall-clock: a frame's cost is a difference between two
// of these, and a wall clock steps when the system's does. Windows counts in
// its own performance-counter ticks whose frequency the frame budget is
// expressed in, so it keeps its own path in `DawnFrameStats.kira` and this is
// the clock for every other platform.
static uint64_t kg_monotonic_now_ns(void) {
#if defined(_WIN32)
    static LARGE_INTEGER frequency;
    static int frequency_initialized = 0;
    if (!frequency_initialized) {
        QueryPerformanceFrequency(&frequency);
        frequency_initialized = 1;
    }
    LARGE_INTEGER counter;
    QueryPerformanceCounter(&counter);
    return (uint64_t)((double)counter.QuadPart * 1000000000.0 / (double)frequency.QuadPart);
#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
#endif
}

// Seconds as a double, which is what the frame-cost arithmetic wants.
double kg_monotonic_seconds(void) {
    return (double)kg_monotonic_now_ns() / 1000000000.0;
}

// The live-reload hooks, as weak no-ops.
//
// A live-reload runner defines these strongly and the app calls them to report
// where a frame reached; a build with no runner — every build that is not the
// dev live loop, Tessera included — needs them to exist and do nothing rather
// than be an undefined symbol at a call site that is compiled in but never
// meaningfully driven. `weak` is what lets the runner's strong definition win
// when there is one. They lived in the sokol C shim before, for no reason but
// that sokol was the only C the library had.
__attribute__((weak)) void kira_live_emit_log_line(const char* line) {
    (void)line;
}

__attribute__((weak)) void kira_live_emit_first_frame(void) {
}

#include <stdbool.h>

// Whether a live-reload runner has a reload waiting. No runner, no reload.
__attribute__((weak)) bool kira_live_take_reload(void) {
    return false;
}
