param(
    [ValidateSet("metal", "dawn", "vulkan")]
    [string]$Backend = "metal"
)

$ErrorActionPreference = "Stop"
$env:KIRA_GRAPHICS_BACKEND = $Backend
Write-Host "KIRA_GRAPHICS_BACKEND=$Backend"
