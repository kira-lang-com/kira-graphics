param(
    [ValidateSet("metal", "dawn", "vulkan")]
    [string]$Backend = "dawn",
    [int]$Frames = 0
)

$ErrorActionPreference = "Stop"
$env:KIRA_GRAPHICS_BACKEND = $Backend

& "$PSScriptRoot/build_shaders.ps1"
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

if ($Frames -gt 0) {
    $env:KIRA_GRAPHICS_QUIT_AFTER_FRAMES = "$Frames"
    $env:KIRA_GRAPHICS_LIFETIME_REPORT = "1"
}

Push-Location $PSScriptRoot
try {
    kira run --backend llvm .
    $runExitCode = $LASTEXITCODE
} finally {
    Pop-Location
}
exit $runExitCode
