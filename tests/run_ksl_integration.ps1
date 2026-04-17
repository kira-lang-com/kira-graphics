$ErrorActionPreference = "Stop"

function Assert-Contains {
    param(
        [string]$Output,
        [string]$Needle,
        [string]$Context
    )

    if (-not $Output.Contains($Needle)) {
        throw "Expected '$Needle' in $Context. Actual output:`n$Output"
    }
}

function Run-Case {
    param(
        [string]$AssetDir,
        [string]$ShaderName,
        [string]$VertexLayout,
        [string[]]$Expected,
        [int]$ExpectedExitCode
    )

    $output = (& cmd /c ".\\tests\\ksl_asset_probe.exe `"$AssetDir`" `"$ShaderName`" `"$VertexLayout`" 2>&1" | Out-String)
    if ($LASTEXITCODE -ne $ExpectedExitCode) {
        throw "Expected exit code $ExpectedExitCode for $AssetDir/$ShaderName but got $LASTEXITCODE.`n$output"
    }
    foreach ($needle in $Expected) {
        Assert-Contains -Output $output -Needle $needle -Context "$AssetDir/$ShaderName"
    }
}

$null = & clang -std=c11 tests\ksl_asset_probe.c -o tests\ksl_asset_probe.exe
if ($LASTEXITCODE -ne 0) {
    throw "Failed to compile tests/ksl_asset_probe.c"
}

Run-Case -AssetDir "tests/fixtures/basic_triangle" -ShaderName "BasicTriangle" -VertexLayout "position=float2" -ExpectedExitCode 0 -Expected @(
    "status: ok",
    "shader: BasicTriangle",
    "vertex_field[0]: position=float2",
    "runtime: ready"
)

Run-Case -AssetDir "tests/fixtures/basic_triangle" -ShaderName "BasicTriangle" -VertexLayout "uv=float2" -ExpectedExitCode 1 -Expected @(
    "status: error",
    "vertex layout mismatch"
)

Run-Case -AssetDir "tests/fixtures/textured_quad" -ShaderName "TexturedQuad" -VertexLayout "position=float3;uv=float2" -ExpectedExitCode 0 -Expected @(
    "status: ok",
    "resource[0]: Frame.camera kind=uniform",
    "runtime: ready_for_asset_loading_but_resource_binding_is_not_implemented"
)

Run-Case -AssetDir "tests/fixtures/missing_fragment" -ShaderName "BasicTriangle" -VertexLayout "position=float2" -ExpectedExitCode 1 -Expected @(
    "status: error",
    "could not open file"
)

Run-Case -AssetDir "tests/fixtures/malformed_reflection" -ShaderName "BasicTriangle" -VertexLayout "position=float2" -ExpectedExitCode 1 -Expected @(
    "status: error",
    "reflection"
)

$buildOutput = (& cmd /c "kira build examples\\ksl_triangle 2>&1" | Out-String)
Assert-Contains -Output $buildOutput -Needle "wrote" -Context "examples/ksl_triangle build"

$frameApiCheckOutput = (& cmd /c "kira check examples\\frame_api_triangle 2>&1" | Out-String)
Assert-Contains -Output $frameApiCheckOutput -Needle "check passed" -Context "examples/frame_api_triangle check"

Write-Host "KSL integration checks passed."
