#!/usr/bin/env sh

set -eu

backend="${1:-metal}"
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
manifest_path="$script_dir/../../NativeLibs/Sokol.toml"

case "$(uname -s)" in
    Darwin)
        target_header='[target.aarch64-macos-none]'
        target_static='static_lib = "../generated/native/aarch64-macos/libsokol.a"'
        case "$backend" in
            metal)
                replacement='defines = ["SOKOL_METAL"]
frameworks = ["Foundation", "AppKit", "QuartzCore", "Metal", "MetalKit"]'
                ;;
            opengl)
                replacement='defines = ["SOKOL_GLCORE"]
frameworks = ["Foundation", "AppKit", "QuartzCore", "OpenGL"]'
                ;;
            *)
                echo "unsupported macOS backend: $backend (expected: metal or opengl)" >&2
                exit 1
                ;;
        esac
        ;;
    Linux)
        target_header='[target.x86_64-linux-gnu]'
        target_static='static_lib = "../generated/native/x86_64-linux-gnu/libsokol.a"'
        case "$backend" in
            opengl)
                replacement='defines = ["SOKOL_GLCORE"]
system_libs = ["X11", "Xi", "Xcursor", "GL", "dl", "pthread", "m"]'
                ;;
            *)
                echo "unsupported Linux backend: $backend (expected: opengl)" >&2
                exit 1
                ;;
        esac
        ;;
    *)
        echo "unsupported host OS: $(uname -s)" >&2
        exit 1
        ;;
esac

python3 - "$manifest_path" "$target_header" "$target_static" "$replacement" <<'PY'
import pathlib
import sys

manifest_path = pathlib.Path(sys.argv[1])
target_header = sys.argv[2]
target_static = sys.argv[3]
replacement = sys.argv[4]

manifest = manifest_path.read_text()
lines = manifest.splitlines()

try:
    start = lines.index(target_header)
except ValueError as exc:
    raise SystemExit(f"Could not find target header in {manifest_path}") from exc

if start + 1 >= len(lines) or lines[start + 1] != target_static:
    raise SystemExit(f"Could not find target static lib line in {manifest_path}")

replace_start = start + 2
replace_end = replace_start
while replace_end < len(lines):
    line = lines[replace_end]
    if line.startswith("[target."):
        break
    if not (line.startswith("defines = ") or line.startswith("frameworks = ") or line.startswith("system_libs = ")):
        break
    replace_end += 1

updated_lines = lines[:replace_start] + replacement.splitlines() + lines[replace_end:]
manifest_path.write_text("\n".join(updated_lines) + "\n")
PY
