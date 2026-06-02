param(
    [ValidateSet("opengl", "directx", "vulkan")]
    [string]$Backend = "opengl"
)

$ErrorActionPreference = "Stop"
$manifestPath = Join-Path $PSScriptRoot "../../NativeLibs/Sokol.toml"
$manifest = [System.IO.File]::ReadAllText($manifestPath)
$replacement = switch ($Backend) {
    "opengl" {
        "defines = [`"SOKOL_GLCORE`"]`r`nsystem_libs = [`"opengl32`"]"
    }
    "directx" {
        "defines = [`"SOKOL_D3D11`"]"
    }
    "vulkan" {
        "defines = [`"SOKOL_VULKAN`"]`r`nsystem_libs = [`"vulkan-1`"]"
    }
}

$pattern = '(?ms)(\[target\.x86_64-windows-msvc\]\r?\nstatic_lib = "\.\./generated/native/x86_64-windows-msvc/sokol\.lib"\r?\n)defines = \[[^\r\n]*\](?:\r?\nsystem_libs = \[[^\r\n]*\])?'
if (-not [regex]::IsMatch($manifest, $pattern)) {
    throw "Could not update the Windows Sokol backend in $manifestPath"
}
$updated = [regex]::Replace($manifest, $pattern, "`${1}$replacement")
[System.IO.File]::WriteAllText($manifestPath, $updated)
