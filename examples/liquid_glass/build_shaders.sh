#!/usr/bin/env sh

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$script_dir"

targets="glsl_330 hlsl msl wgsl spirv"
for target in $targets; do
    kira shader build Shaders --target "$target" --out-dir "generated/$target"
done

kira shader build Shaders --target glsl_330 --out-dir "generated/shaders"
kira shader build Shaders --target hlsl --out-dir "generated/shaders"
kira shader build Shaders --target msl --out-dir "generated/shaders"

if command -v glslangValidator >/dev/null 2>&1; then
    for shader in generated/shaders/*.vert.hlsl; do
        [ -e "$shader" ] || break
        asset=$(basename "$shader" .vert.hlsl)
        glslangValidator -D -V --auto-map-bindings --auto-map-locations \
            -S vert -e main --source-entrypoint "${asset}__vertex__main" \
            -o "generated/shaders/$asset.vert.spv" "$shader"
    done

    for shader in generated/shaders/*.frag.hlsl; do
        [ -e "$shader" ] || break
        asset=$(basename "$shader" .frag.hlsl)
        glslangValidator -D -V --auto-map-bindings --auto-map-locations \
            --resource-set-binding frag 1 --shift-sampler-binding frag 2 \
            -S frag -e main --source-entrypoint "${asset}__fragment__main" \
            -o "generated/shaders/$asset.frag.spv" "$shader"
    done
fi
