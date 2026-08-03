# AGENTS.md

## Repo Conventions

- Use camelCase for all function and method names in Kira source.
- Prefer direct construction with `Type()` plus field assignment.
- Do not add constructor-style helper functions like `foo_default()` or `foo_bar(...)` when their only job is building a value.
- Keep behavioral instance methods when they mutate state or encode commands.
- Preserve the current backend contract in `app/backend_bridge.kira` unless a task explicitly changes the native boundary.

## Graphics API Style

- Types should carry their own defaults with inline field values and explicit nested values such as `= Foo()`.
- Public examples and docs should demonstrate direct construction only.
- Compatibility entrypoints such as `applicationRun(...)` may stay, but they should use the same direct-construction model internally.

## Measuring a renderer

- **Measure on screen.** Prove any frame-time claim about a windowed app with `KIRA_METAL_ONSCREEN_TRACE`, never with `KIRA_METAL_BENCH`. The offscreen benchmark has no drawable and never presents, so it measures how fast a frame is *built*: it reported 850 fps at 4K for an app the screen was showing at 191.
- **Quote the drawable size with every number.** Read it back (`KIRA_METAL_ONSCREEN_DUMP`, bytes / 4 = pixels) rather than assuming the window got the size it asked for — a "4K" benchmark was 5.3x the pixels the window could ever reach.
- **Separate work from waiting.** Read a `nextDrawable` block as pacing, never as cost: it sits inside the frame's timing window, so a frame that waits 5 ms on the compositor reports 5 ms of CPU. Split the two before claiming either.
- **Refuse to cap or smooth a frame time to make it look even.** Reject a frame limiter, `displaySyncEnabled`, and a rolling-average FPS readout as answers to jitter — each destroys the ability to see the defect it covers, and a limiter makes any sub-refresh target unmeasurable. A visible window is uncapped here on purpose.
- **Attribute a presentation stall before accepting it.** A windowed frame rate is paced by how long each drawable is held and how fast the compositor returns it, not by the renderer — an uncapped loop alternates ~0.4 ms and ~5 ms frames against a pool of 3. Measure the hold (acquire to present) and shorten it; never quote a ceiling from pool depth times refresh rate, which the measured 390 fps at 60 Hz already disproves.
- **Keep an attachment the next pass does not read out of memory.** Give it `storeActionDontCare()` and `attachmentStorageMemoryless()`, so a tile-based GPU never writes it back: a stored 4K depth target costs 33 MB of bandwidth per pass for bytes nobody reads.

## Verification

- Prefer grep/static checks first when changing API naming or helper removal across the surface.
- The Kira frontend may fail with `KICE001` internal errors; report that clearly if build validation is blocked.
