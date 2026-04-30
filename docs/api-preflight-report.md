# API Preflight Report

## 1. Summary

Yes, the current Kira compiler can express a meaningful fake descriptor-first graphics API probe, but not the ideal prompt shape verbatim.

The biggest blockers were not "graphics logic" blockers. They were language-surface and package-shape blockers:

- enum variant construction in descriptor defaults did not resolve
- empty array defaults did not type-check
- unsigned typed array literals such as `[U16]` / `[U32]` did not accept plain numeric literals
- the exact stateful trailing-block render-pass style could not see direct captured outer member references like `state.pipeline`
- the exact no-comma array-of-struct spelling did not parse
- the example app package did not automatically assemble the split `app/Fake/*.kira` source tree into the program

The compiling fallback therefore uses:

- a single compiled `app/main.kira`
- string-backed descriptor values where the ideal API wanted enums
- explicit `beginRenderPass(...)` / `endPass(...)` for stateful draw encoding
- a hybrid-safe trailing-block variant that first hoists needed state into locals
- comma-separated arrays of struct literals
- `[Int]` index data fallback instead of `[U32]`

## 2. Whether The Fake Preflight Example Compiles

Yes.

- `kira check --backend hybrid examples\api_preflight_fake` passed
- `kira check examples\api_preflight_fake` passed
- `kira check .` passed

## 3. Exact Validation Commands Run

```powershell
kira check --backend hybrid examples\api_preflight_fake
kira check examples\api_preflight_fake
kira check .
```

Targeted failure probes were also run by temporarily appending or swapping snippets inside `examples/api_preflight_fake/app/main.kira`, then restoring the compiling baseline.

## 4. Exact Validation Results

- `kira check --backend hybrid examples\api_preflight_fake`: passed
- `kira check examples\api_preflight_fake`: passed
- `kira check .`: passed
- First `kira check .` run exceeded the local 124 second command timeout in Codex, so it was rerun with a longer timeout and then passed in about 170 seconds

## 5. Supported Language/API Shapes

- Nested struct literals are viable in the compiling probe
- Descriptor-first resource construction is viable in the compiling probe
- Method-heavy fake API classes compile
- Arrays of floats compile
- Arrays of struct literals compile when the elements are comma-separated
- Arrays of bind entries compile
- Arrays of color target descriptors compile
- Arrays of color attachments compile
- Fake 3D cube setup and draw code compiles with the explicit begin/end pass fallback
- Fake 3D cube setup and draw code also compiles with a hybrid trailing-block variant after hoisting `state` members into locals
- Fake UI/effects setup and draw code compiles with the explicit begin/end pass fallback
- Bind-group-like descriptor arrays are viable
- Nested fake handles and fake resource wrapper structs are viable

## 6. Unsupported Language/API Shapes

- `app/Fake/*.kira` did not auto-load into the app package
- Flattened sibling fake files also did not merge into the app program automatically, so the compiling probe had to be collapsed into `app/main.kira`
- Enum variant construction in descriptor defaults did not resolve, even in a PascalCase follow-up probe
- Empty array literals are not viable as typed field defaults
- Plain numeric literals in `[U16]` and `[U32]` array defaults did not coerce cleanly
- The exact no-comma array-of-struct spelling from the prompt did not parse
- The stateful trailing-block render-pass style could not reference outer `state`

## 7. Fallback Shapes That Compiled

- String-backed pseudo-enums such as `"triangleList"` and `"rgba8Unorm"`
- Explicit `beginRenderPass(...)` / `endPass(...)`
- Hybrid trailing render-pass blocks after hoisting needed values into local aliases
- Comma-separated array literals for struct elements
- `[Int]` fallback for index arrays
- Placeholder non-empty defaults instead of empty array defaults
- Single-file compiled probe instead of a real split app package

## 8. Recommended Real API Shape For The Implementation Pass

Recommended implementation prompt, if run against the current compiler without prior `kirac` work:

- Keep descriptor-first shapes
- Keep nested struct literals
- Keep arrays of descriptors and bind entries, but write them with commas
- Do not depend on empty array defaults
- Do not depend on enum-backed descriptor defaults yet
- Do not depend on direct-member stateful `frame.renderPass(desc) { encoder in ... }` closures
- Prefer either explicit `beginPass` / encode / `endPass` or a hybrid trailing-block form that hoists `state` members into locals first
- Prefer fixed slots only where defaults or backend-facing storage truly need them, not as the only public API

## 9. Things The Real Mega Implementation Prompt Should Avoid

- Do not assume the split fake file layout proves app-local multi-file assembly works
- Do not assume enum variants can be used directly for descriptor defaults
- Do not assume `[]` can be used as a typed default for array fields
- Do not assume `[U32]` index data with plain numeric literals is smooth
- Do not assume direct `state.member` capture inside `frame.renderPass(desc) { encoder in ... }` is ready for stateful draw paths
- Do not use the exact no-comma array-of-struct spelling

## 10. Things That Require Compiler Work In `kirac`

- Reliable enum variant construction and typing in ordinary expressions and field defaults
- Better typed empty array literal support
- Better typed numeric literal coercion for unsigned arrays
- Stateful callback-block capture or another honest closure model for render-pass helpers
- Clearer app-package local source discovery rules for split source trees

## 11. Whether Descriptor-First Render Passes Are Viable

Yes, with fallback constraints.

Descriptor-first pass structs are viable, and nested pass literals compile. The exact direct-member-capture convenience wrapper form is not viable, but a hybrid-friendly trailing-block variant works after hoisting needed values into locals.

## 12. Whether Arrays Of Descriptors Are Viable

Yes, with caveats.

Non-empty comma-separated arrays of descriptor structs compiled. Empty array defaults did not.

## 13. Whether Nested Struct Literals Are Viable

Yes.

Nested fake resource, pipeline, attachment, pass, and texture descriptor literals compiled in the fallback example.

## 14. Whether Enum Defaults Are Viable

No, not in this probe.

Both the original lowercase `FakeBufferUsage.vertex` probe and a PascalCase `PascalBufferUsage.Vertex` follow-up probe failed to resolve as usable default values.

## 15. Whether Trailing Block Methods Like `frame.renderPass(desc) { encoder in ... }` Are Viable

Partially.

Final-argument callback methods exist in the language and the repo already uses them for simpler cases. In this refreshed hybrid probe:

- direct outer member capture such as `state.pipeline` was still not viable
- local alias capture was viable after hoisting, for example `let pipeline = state.pipeline`

So the exact target spelling is still unsupported, but a stronger nearby trailing-block form now compiles.

## 16. Whether Fixed-Slot Descriptor Fallback Is Needed

Not as a universal public shape, but it is still a useful contingency.

The current probe did not need fixed-slot fallbacks for non-empty descriptor arrays. The real need showed up around defaults and closure ergonomics, not around the existence of arrays themselves.

## 17. Whether Bind Group Arrays Are Viable

Yes.

The fake bind-group descriptor shape with an array of entries compiled in the fallback example.

## 18. Whether 3D Cube API Shape Is Viable

Yes, with fallback constraints.

The fake 3D slice compiled when:

- enum-like settings were string-backed
- index data used `[Int]`
- stateful draw encoding used either explicit begin/end or the hybrid-safe local-alias trailing-block form

## 19. Whether Fake UI Effects API Shape Is Viable

Yes, with fallback constraints.

The fake UI/effects slice compiled with generic buffer/pipeline/pass APIs, array-backed surface data, texture/sampler/bind-group setup, and explicit begin/end pass encoding. A UI-specific local-alias trailing-block variant was not added yet, but the cube probe makes that a realistic next syntax check.

## Bottom Line

The compiler can support a serious preflight of the future graphics API, but the ideal prompt should not pretend that enum-backed descriptor defaults, typed empty array defaults, unsigned numeric arrays, or direct outer-member render-pass captures are already solid.

If the real implementation prompt runs today, it should target:

- descriptor-first structs
- nested struct literals
- comma-separated descriptor arrays
- either explicit pass begin/end for stateful drawing or the hybrid local-alias trailing-block form
- string or similarly conservative fallbacks where the ideal surface wanted enums

If the goal is the ideal surface instead of the safest current surface, `kirac` needs compiler work first.
