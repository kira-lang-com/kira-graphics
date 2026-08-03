# Where a frame's time goes

The "empty pass" fixed cost is mostly not GPU work. A Metal System Trace
(2026-08-02, same machine, same 6.24 Mpx window, 300-frame runs) shows a
near-empty pass keeps the GPU busy for **0.38 ms** — the framebuffer store and
composite bandwidth floor, 0.06 ms/Mpx — while its residency on the GPU
timeline spans 0.99 ms. The difference is what the in-app timer counts anyway:
`GPUStartTime` to `GPUEndTime` brackets WindowServer's compositor fragments
interleaved on the shared M1 GPU (0.3–0.7 ms chunks) and the scheduling gaps
between the app's own vertex/compute/fragment channels. On a full frame the
span is 3.03 ms against 2.09 ms of work; the lighter the frame, the larger the
share of its reported cost that is other processes and gaps.

Measured on an M1 iMac against `ui-foundation/Examples/liquid-glass-app`, on
screen, drawable read back at 6,238,200 px (a 1686x925 window at
`KIRA_METAL_RENDER_SCALE=2`). Run-to-run variance of the in-app timer is 17%,
so single runs decide nothing.

## The budget

GPU time per frame from the trace, same run for each configuration:

| | GPU active | GPU residency span | in-app timer, same run |
|---|---|---|---|
| near-empty pass (`FINAL_ONLY` + `NO_BACKGROUND` + `BACKGROUND_ONLY`) | 0.38 ms | 0.99 ms | 0.54–0.85 ms |
| full frame | 2.09 ms | 3.03 ms | 3.5–4.4 ms |
| of which: fragment | 1.68 ms | | |
| of which: glass blur compute | 0.33 ms | | |
| of which: vertex | 0.09 ms | | |

The earlier table's 1.60 ms "empty pass, zero draws" came from a temporary
zero-draw hack no flag combination reproduces — the nearest flags still draw
stream 0 — so it is superseded rather than re-measured; its 2.84 ms full frame
sits inside today's timer range once the 17% variance and a hotter machine are
allowed. The trace confirms the capture+blur bisection exactly: compute is
0.334 ms against the 0.32 measured by flags.

CPU work is 0.28 ms and does not move with resolution. Real GPU cost is
**0.33 ms/Mpx**, not the 0.5 the timer suggested; at true 4K (8.29 Mpx) that
extrapolates to ~2.8 ms active, against a 1.5 ms target that needs
~0.18 ms/Mpx. The reducible part is the 1.68 ms fragment pass — the floor
underneath it is 0.06 ms/Mpx of store/composite bandwidth.

## What the timer actually measures

`metalPacingCollectGpuTime` sums `GPUEndTime - GPUStartTime` per command
buffer. Those timestamps bracket the buffer's residency on the GPU timeline,
not its occupancy: everything the GPU does for anyone between the buffer's
first and last instant lands in the number. Two consequences:

- **WindowServer contention is self-inflicted.** An uncapped window presenting
  at 200+ fps gives the compositor 200+ surfaces a second to composite on the
  same GPU, and those fragments run inside the app's command-buffer span.
- **A near-empty buffer is almost all span.** The less work a buffer holds,
  the larger the share of its span the gaps are — which is why the "fixed
  cost" looked flat and irreducible.

For honest in-band GPU numbers the timer would need
`MTLCounterSampleBuffer` stage-boundary timestamps, which bracket the work
rather than the residency.

## Ruled out, with the evidence

Do not re-investigate these without new evidence; each cost a cycle.

**The clear is not the cost.** Switching the swapchain colour attachment to
`DontCare` behind an opaque fullscreen background measured 2.80/2.88/2.85
against 2.97/2.83/2.72 — no change. A tile-based GPU initializes the tile
rather than writing the clear to memory. The change was reverted: it risks
showing the previous frame wherever the cover is less than total, and buys
nothing.

**The CPU-side drawable wait is separate; GPU-timeline stalls are not.** The
`nextDrawable` block (median 4.25 ms, every other frame, from the trace's
`ca-client-buffer-wait-interval` table) sits on the main thread and stays out
of the GPU number. But the GPU number folds in every stall *on the GPU
timeline* — the earlier per-Mpx comparison against offscreen could not see
that, because offscreen has no compositor competing.

**The drawable pool is already at its maximum.** `KIRA_METAL_POOL_PROBE`
reports `maximumDrawableCount` = 3, which is the macOS ceiling. There is no
depth to add.

**The capture's bandwidth is not the problem.** `sceneDiv = 1` does make the
glass scene capture full-resolution — 33 MB stored and re-read at 4K, worth
fixing on principle — but capture plus the whole blur chain is 0.33 ms,
confirmed independently by bisection and by the trace's compute channel.

**The backdrop photo is an optimization, not a cost.** Disabling it made
frames *slower* (4.09 ms against 3.49): `directBackdropLayer0` samples the
photo directly and skips a scene capture, and without a photo that capture
runs.

**Shared-storage textures are not the anomaly.** Every texture is
`MTLStorageModeShared` (`MetalTexture.kira:18`), which forfeits optimal tiling
and lossless compression, but the fullscreen quad sampling one costs 0.28 ms
of 2.84. Building a blit encoder to make them private is not where the time
is.

**The pacing ring is not the anomaly.** `metalPacingBeginPass` blocks on
`waitUntilCompleted`, but it is 5 samples of 4655 on the main thread. Its ring
is indexed per committed command buffer rather than per frame, which collapses
the intended depth on multi-pass frames — a correctness tidy, not a speed win.

## What the frame rate is actually bound by

94% of the main thread sits in `-[CAMetalLayer nextDrawable]` with the window
visible. The renderer finishes its 0.28 ms and waits. Frames therefore
alternate ~0.4 ms and ~5 ms, and an instantaneous FPS readout swings between
30 and 300 — that oscillation is presentation, not the renderer.

Even frame *intervals* are only reachable by pacing the loop or presenting on
change. A visible window is deliberately uncapped here (`setDisplaySyncEnabled:
false`), so what can be held steady is **work per frame**, and that already is.

## Measuring it

`KIRA_METAL_BENCH` is offscreen: no drawable, no present, and a resolution the
window may never reach. It answers how fast a frame is *built*. It reported
850 fps at 4K for an app the screen was showing at 191, which is how this
investigation started five hours late.

```
KIRA_METAL_ONSCREEN_BENCH=N     the real-window percentile bench: N measured
                                frames on the live, presenting window (after a
                                30-frame warmup), then one summary — p50/p75/
                                p90/p95/p99/p999/max for frame interval, CPU,
                                and GPU residency. Combine with
                                KIRA_METAL_VSYNC=1 for the production pacing.
KIRA_METAL_ONSCREEN_TRACE=1     per-frame frame/CPU/GPU ns, on screen
KIRA_METAL_ONSCREEN_FRAMES=N    bounded run
KIRA_METAL_WINDOW_STATE=1       force focused/visible; an occluded window
                                takes the half-rate path and profiles as if
                                the run loop were a per-frame defect
KIRA_METAL_RENDER_SCALE=N       render above the display's resolution, so a
                                pixel target is reachable on a 1x panel
KIRA_METAL_POOL_PROBE=1         report maximumDrawableCount
KIRA_GLASS_BENCH_FINAL_ONLY=1   skip capture + blur
KIRA_GLASS_BENCH_BACKGROUND_ONLY=1   background + stream 0 only
KIRA_GLASS_BENCH_NO_BACKGROUND=1     every pass, no background draw
```

Read the **CPU** column, not the frame column: `frame[i]` is the interval since
the previous frame's start, so it lands one index after the cost that caused
it. Read the **GPU** column as a ceiling, not a cost — it is command-buffer
residency, and on a near-empty frame it is mostly other processes' work and
gaps.

Per-encoder GPU truth comes from a Metal System Trace, headless:

```
xcrun xctrace record --template 'Metal System Trace' \
  --output frame.trace --time-limit 30s --no-prompt \
  --env KIRA_METAL_ONSCREEN_FRAMES=300 --env KIRA_METAL_WINDOW_STATE=1 \
  --env KIRA_METAL_RENDER_SCALE=2 \
  --launch -- ./app/.kira-build/main
xcrun xctrace export --input frame.trace \
  --xpath '/trace-toc/run[@number="1"]/data/table[@schema="metal-gpu-intervals"]'
```

Filter the exported rows to the app's process — the table includes every
process on the GPU, and WindowServer's rows are the contention itself. The
`ca-client-buffer-wait-interval` table holds the CPU-side drawable waits.

## What the capture bought (2026-08-02, later the same day)

Three changes landed, each pixel-compared identical to the pre-change
baseline outside the HUD's FPS digits:

- **Blur-chain cache** (`UiBatch.kira`): the direct-backdrop path re-blurred a
  static photo every frame. The compute pair now re-runs only when the source
  texture or blur extent changes. Compute: 0.33 ms to ~0.
- **Backdrop layout optimize** (`UiBatchForeign.kira`, `MetalTexture.kira`):
  one `optimizeContentsForGPUAccess:` blit after the load-once upload re-tiles
  the shared-storage photo. The fullscreen photo draw: ~0.17 ms to ~0.02.
- **Endpoint tap skip** (`UiBatch.ksl`): at the frost dial's exact endpoints
  the cross-fade's dead arm is skipped. Measured flat in this demo (its dial
  rests mid-range); kept because it is exact and frees resting clear/frosted
  surfaces elsewhere.

GPU active per frame at 6.24 Mpx: **2.19 ms to ~1.6 ms** (uncapped run
1.66; three vsync runs 1.55/1.62/1.70). Also learned: uncapped runs inflate
even per-encoder "Active" intervals — the near-empty pass reads 0.83 ms
uncapped against 0.36 ms under vsync, because presenting at 200+ fps feeds the
compositor 200+ surfaces a second and the preemption lands inside the app's
encoder intervals. Quote on-screen GPU numbers from vsync-paced runs.

## The glass pipeline split (2026-08-03)

Liquid glass now draws through four pipelines instead of one branch of the
ubershader: the full stack on a corner-aware edge ring (thin straight strips
plus radius-sized corner squares), a shadow-free band, a lens-only ring past
the 22pt effect bands, and a taps-plus-washes core past the lens's 72pt limit.
Every region runs exactly the expressions the full shader provably computes
there — verified by whole-frame byte compare, ≤3 pixels at 1 lsb — and the
interiors are opaque, geometry-clipped, and write without blending. The blur
outputs also get one `optimizeContentsForGPUAccess:` blit per (cached)
recompute, repairing the uncompressed layout compute writes leave behind.

Real content, real window, 6.24 Mpx, 60 Hz, 1000-frame runs:

| | p50 | p98 | p99 |
|---|---|---|---|
| before | 1.833 | 2.030 | 2.131 |
| after | 1.546 | 1.710 | 1.743 |

What the split's instrumentation established, each by direct experiment: the
cost is the *executed* fragment work (a constant-output probe with identical
register allocation runs the frame at 0.87 ms), and it is insensitive to
static registers, varying count, pipeline switches, blending, hidden-surface
elimination, texture layout, sampling under divergence, and GPU clock state —
every one was toggled in isolation and moved the median at most ±0.08. The
near-empty pass itself shows p98 0.88 against p50 0.53: the tail is largely
compositor preemption landing inside the app's encoder intervals, which no
renderer change reaches.

A 1.5 ms p99 whole-frame budget at this resolution therefore needs a median
near 1.15, which means glass plus chrome shading near 0.4 ms — half the
measured executed-work floor of the current full-redraw design on M1. The
one measured-consistent route left is drawing less than the full frame:
damage-rect partial redraw is pixel-exact and drops a steady frame to the
0.36 ms store floor. That is an architecture decision, not a shader change.

## The interior cache (2026-08-03, later)

A glass interior's pixels depend only on the surface's geometry, dial,
material and the backdrop textures — when none of those changed, the interior
is a static image. The compositor now renders interiors once into a
drawable-sized private cache texture (a load-preserving pass before the
composite, band pipeline, dirty surfaces only) and re-presents them as opaque
texel copies (`UiGlassCopy.ksl`). Invalidation is an exact per-surface key
compare — geometry, dial, material, clip, viewport, backdrop epoch — plus a
present-time backdrop check that routes every copy to the live band pipeline
whenever staticness cannot be proven, so a copy is never wrong, only slower.
Streams are retained, so interiors always emit as copy quads and the routing
decides per frame.

Byte-exactness is verified three ways: copy output vs live output, zero
differing pixels over the whole frame; the live fallback vs the original
ubershader renderer, zero; and a mid-run resize (teardown, re-cache), zero.
The pitfall that cost the most: the cache was first created at LOGICAL size
(glassTexW is points, not device pixels) and every artifact — 1-lsb speckle,
black seam rows, bias-insensitive sampling — was the quarter-resolution
upscale masquerading as subtle rounding.

Real content, real window, 6.24 Mpx, 60 Hz, 1000 frames:

| | p50 | p98 | p99 | max |
|---|---|---|---|---|
| session start | 1.833 | 2.030 | 2.131 | — |
| pipeline split era | 1.546 | 1.710 | 1.743 | 1.957 |
| interior cache | **0.809** | **1.239** | **1.251** | **1.283** |

The 1.5 ms whole-frame budget is met at p99 — and at max — with the frame now
dominated by the store floor, chrome, and the glass edge ring; the cached
interiors cost a texel fetch. At true 4K (8.29 Mpx) the same build has not
been re-measured; the cache should scale near-linearly with the copy area.

## Where the remaining 1.6 ms lives

Vsync bisection: floor (drawable store + stream 0 + HUD) 0.36 ms — 0.058
ms/Mpx, raw store bandwidth, irreducible while every pixel is redrawn; photo
0.02 ms; vertex 0.03 ms; **glass + chrome streams 1.2 ms**. The glass quads
carry only a 4 pt skirt, so that 1.2 ms is surface area times interior ALU
(washes, edge stack, SDF) — no dead pixels to trim. Getting from 1.6 to a
1.5 ms whole-frame budget at this size, or to 0.18 ms/Mpx for 4K, means one
of: a premixed blur texture (one tap in the uniform-dial interior), cutting
interior ALU, compositing glass below full resolution, or redrawing less than
the full frame. Each trades visual guarantees or architecture; none is a
shader tweak.

If the in-app GPU number is to keep gating work, switch it to
`MTLCounterSampleBuffer` stage timestamps first — every conclusion drawn from
the residency timer on a light frame overstated the cost.
