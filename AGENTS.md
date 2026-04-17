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

## Verification

- Prefer grep/static checks first when changing API naming or helper removal across the surface.
- The Kira frontend may fail with `KICE001` internal errors; report that clearly if build validation is blocked.
