$ErrorActionPreference = "Stop"

$targets = @("glsl_330", "hlsl", "msl", "wgsl", "spirv")
foreach ($target in $targets) {
    kira shader build Shaders --target $target --out-dir "generated/$target"
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

kira shader build Shaders --target glsl_330 --out-dir "generated/shaders"
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
kira shader build Shaders --target hlsl --out-dir "generated/shaders"
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Get-ChildItem "generated/shaders/*.vert.hlsl" | ForEach-Object {
    $asset = $_.BaseName -replace "\.vert$", ""
    glslangValidator -D -V --auto-map-bindings --auto-map-locations `
        -S vert -e main --source-entrypoint "${asset}__vertex__main" `
        -o "generated/shaders/$asset.vert.spv" $_.FullName
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Get-ChildItem "generated/shaders/*.frag.hlsl" | ForEach-Object {
    $asset = $_.BaseName -replace "\.frag$", ""
    glslangValidator -D -V --auto-map-bindings --auto-map-locations `
        --resource-set-binding frag 1 --shift-sampler-binding frag 2 `
        -S frag -e main --source-entrypoint "${asset}__fragment__main" `
        -o "generated/shaders/$asset.frag.spv" $_.FullName
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}
