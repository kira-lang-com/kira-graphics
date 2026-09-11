#!/usr/bin/env sh

set -eu

case "$(uname -s)" in
    Darwin) default_backend=metal ;;
    *) default_backend=dawn ;;
esac
backend="${1:-$default_backend}"
frames="${2:-0}"
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

case "$backend" in
    metal|dawn|vulkan) export KIRA_GRAPHICS_BACKEND="$backend" ;;
    *) echo "usage: $0 [metal|dawn|vulkan] [frames]" >&2; exit 2 ;;
esac

"$script_dir/build_shaders.sh"

if [ "$frames" -gt 0 ] 2>/dev/null; then
    export KIRA_GRAPHICS_QUIT_AFTER_FRAMES="$frames"
    export KIRA_GRAPHICS_LIFETIME_REPORT=1
fi

cd "$script_dir"
kira run --backend llvm .
