$ErrorActionPreference = "Stop"
Push-Location $PSScriptRoot
try {
    kira shader build
    $shaderExitCode = $LASTEXITCODE
} finally {
    Pop-Location
}
exit $shaderExitCode
