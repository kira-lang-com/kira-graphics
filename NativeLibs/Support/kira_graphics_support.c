// The backend-neutral C the graphics library needs and Kira cannot express.
//
// Until now this lived in the sokol native library, because sokol was the
// library's only C. The monotonic clock a frame is timed with is a platform
// call — Kira has no clock of its own, and a graphics library cannot assume the
// syscall table a Tessera program has — so it is here, alone, with no backend
// and no window system attached. A build that selects Metal or Dawn links this
// and nothing of sokol's.

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

// Pause the calling thread, so a frame loop with nothing to present waits out
// the rest of its interval instead of spinning on a fence that never blocks.
void kg_sleep_seconds(double seconds) {
    if (!(seconds > 0.0)) {
        return;
    }
#if defined(_WIN32)
    Sleep((DWORD)(seconds * 1000.0));
#else
    struct timespec ts;
    ts.tv_sec = (time_t)seconds;
    ts.tv_nsec = (long)((seconds - (double)ts.tv_sec) * 1000000000.0);
    nanosleep(&ts, NULL);
#endif
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

// The diagnostics every stage of the library reports through.
//
// `KIRA_GRAPHICS_LOG` picks how much is printed: `off`, `error`, `warn` (the
// default) or `trace`. Each line names the stage that reported it. A message
// identical to the one before it is not printed again; its repeats are counted
// and the count is printed at each power of two and when a different message
// arrives, so a failure that recurs every frame stays one line, not thousands.
static int kg_log_level = -2;
static char kg_log_last[512];
static int kg_log_last_stage = -1;
static uint64_t kg_log_repeats = 0;

static const char* kg_log_level_names[] = {"error", "warning", "trace"};

static int kg_log_threshold(void) {
    if (kg_log_level != -2) {
        return kg_log_level;
    }
    kg_log_level = 1;
    const char* setting = getenv("KIRA_GRAPHICS_LOG");
    if (setting != NULL) {
        if (strcmp(setting, "off") == 0) kg_log_level = -1;
        else if (strcmp(setting, "error") == 0) kg_log_level = 0;
        else if (strcmp(setting, "trace") == 0) kg_log_level = 2;
    }
    return kg_log_level;
}

static void kg_log_flush_repeats(void) {
    if (kg_log_repeats > 0 && (kg_log_repeats & (kg_log_repeats - 1)) != 0) {
        fprintf(stderr, "[kira-graphics] last message repeated %llu times in all\n", (unsigned long long)kg_log_repeats);
    }
    kg_log_repeats = 0;
}

int kg_diagnostics_enabled(int32_t level) {
    return level <= kg_log_threshold() ? 1 : 0;
}

void kg_diagnostic(const char* stage, int32_t stage_index, int32_t level, const char* message) {
    if (level > kg_log_threshold() || level < 0 || level > 2) {
        return;
    }
    if (stage_index == kg_log_last_stage && strncmp(message, kg_log_last, sizeof kg_log_last - 1) == 0) {
        kg_log_repeats += 1;
        if ((kg_log_repeats & (kg_log_repeats - 1)) == 0) {
            fprintf(stderr, "[kira-graphics:%s] %s (repeated %llu times)\n", stage, kg_log_level_names[level], (unsigned long long)kg_log_repeats);
        }
        return;
    }
    kg_log_flush_repeats();
    kg_log_last_stage = stage_index;
    strncpy(kg_log_last, message, sizeof kg_log_last - 1);
    kg_log_last[sizeof kg_log_last - 1] = 0;
    fprintf(stderr, "[kira-graphics:%s] %s: %s\n", stage, kg_log_level_names[level], message);
}
