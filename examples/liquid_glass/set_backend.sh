#!/usr/bin/env sh

set -eu

backend="${1:-metal}"
case "$backend" in
    metal|dawn|vulkan)
        export KIRA_GRAPHICS_BACKEND="$backend"
        echo "KIRA_GRAPHICS_BACKEND=$backend"
        ;;
    *)
        echo "usage: . ./set_backend.sh [metal|dawn|vulkan]" >&2
        exit 2
        ;;
esac
