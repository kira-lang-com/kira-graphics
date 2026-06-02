param(
    [ValidateSet("opengl", "directx", "vulkan")]
    [string]$Backend = "opengl",
    [int]$Frames = 0
)

$ErrorActionPreference = "Stop"
& "$PSScriptRoot/set_backend.ps1" -Backend $Backend

if ($Backend -eq "vulkan") {
    $sdk = "$env:USERPROFILE/scoop/apps/vulkan/current"
    if (-not (Test-Path "$sdk/Include/vulkan/vulkan.h")) {
        throw "Install the Vulkan SDK first: scoop install glslang vulkan"
    }
    $env:CPATH = "$sdk/Include"
    $env:KIRA_NATIVE_LIBRARY_PATH = "$sdk/Lib"
} else {
    Remove-Item Env:CPATH -ErrorAction SilentlyContinue
    Remove-Item Env:KIRA_NATIVE_LIBRARY_PATH -ErrorAction SilentlyContinue
}

& "$PSScriptRoot/build_shaders.ps1"
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

if ($Frames -gt 0) {
    $env:KIRA_GRAPHICS_QUIT_AFTER_FRAMES = "$Frames"
    $env:KIRA_GRAPHICS_LIFETIME_REPORT = "1"
}

kira run --backend llvm $PSScriptRoot
