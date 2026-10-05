// See kira_graphics_support.c: the backend-neutral C the graphics library needs.
#ifndef KIRA_GRAPHICS_SUPPORT_H
#define KIRA_GRAPHICS_SUPPORT_H

#include <stdint.h>

// Seconds from a monotonic origin, for timing one frame against the next.
double kg_monotonic_seconds(void);

// Pauses the calling thread for `seconds`; nothing for a duration of zero or less.
void kg_sleep_seconds(double seconds);

// Reports `message` from `stage` at `level` (0 error, 1 warning, 2 trace) when
// `KIRA_GRAPHICS_LOG` admits that level; see the definition for the format.
void kg_diagnostic(const char* stage, int32_t stage_index, int32_t level, const char* message);

// Whether a report at `level` would be printed, so a caller can skip building
// a message nobody will see.
int kg_diagnostics_enabled(int32_t level);

#endif
