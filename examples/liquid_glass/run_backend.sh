#!/usr/bin/env sh

set -eu

backend="${1:-metal}"
frames="${2:-0}"
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

"$script_dir/set_backend.sh" "$backend"

case "$backend" in
    vulkan)
        if [ -z "${VULKAN_SDK:-}" ]; then
            echo "set VULKAN_SDK before running the Vulkan backend" >&2
            exit 1
        fi
        export CPATH="${VULKAN_SDK}/include${CPATH:+:$CPATH}"
        export KIRA_NATIVE_LIBRARY_PATH="${VULKAN_SDK}/lib${KIRA_NATIVE_LIBRARY_PATH:+:$KIRA_NATIVE_LIBRARY_PATH}"
        ;;
    *)
        unset CPATH || true
        unset KIRA_NATIVE_LIBRARY_PATH || true
        ;;
esac

"$script_dir/build_shaders.sh"

if [ "$frames" -gt 0 ] 2>/dev/null; then
    export KIRA_GRAPHICS_QUIT_AFTER_FRAMES="$frames"
    export KIRA_GRAPHICS_LIFETIME_REPORT=1
fi

kira run --backend llvm "$script_dir"
