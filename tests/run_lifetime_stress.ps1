param(
    [switch]$RunThousandFrames
)

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

function Run-Kira {
    param(
        [string]$Command,
        [hashtable]$Environment = @{}
    )

    for ($attempt = 1; $attempt -le 3; $attempt += 1) {
        $previousErrorActionPreference = $ErrorActionPreference
        $ErrorActionPreference = "Continue"
        $oldValues = @{}
        foreach ($key in $Environment.Keys) {
            $oldValues[$key] = [Environment]::GetEnvironmentVariable($key, "Process")
            [Environment]::SetEnvironmentVariable($key, [string]$Environment[$key], "Process")
        }
        try {
            $output = (& cmd /c "$Command 2>&1" | Out-String)
            $exitCode = $LASTEXITCODE
        } finally {
            foreach ($key in $Environment.Keys) {
                [Environment]::SetEnvironmentVariable($key, $oldValues[$key], "Process")
            }
            $ErrorActionPreference = $previousErrorActionPreference
        }

        if ($exitCode -eq 0) {
            Start-Sleep -Milliseconds 500
            return $output
        }
        if ($output.Contains("FileBusy") -and $attempt -lt 3) {
            Get-Process | Where-Object { $_.ProcessName -match '^(kira|kirac)$' } | Stop-Process -Force -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 2
            continue
        }
        throw "Command failed: $Command`n$output"
    }
}

function Assert-ZeroLifetimeReport {
    param(
        [string]$Output,
        [string]$Context
    )

    Assert-Contains -Output $Output -Needle "Kira Graphics lifetime report: buffers=0 images=0 samplers=0 views=0 shaders=0 pipelines=0" -Context $Context
}

function Run-CubeFrames {
    param(
        [int]$Frames,
        [switch]$Detailed
    )

    $env = @{
        KIRA_GRAPHICS_LIFETIME_REPORT = "1"
        KIRA_GRAPHICS_QUIT_AFTER_FRAMES = [string]$Frames
    }
    if ($Detailed) {
        $env.KIRA_GRAPHICS_LIFETIME_DETAIL = "1"
    }
    $output = Run-Kira -Command "cd examples\basic_3d_cube && kira run" -Environment $env
    Assert-ZeroLifetimeReport -Output $output -Context "basic_3d_cube $Frames frames"
    if ($Detailed) {
        Assert-Contains -Output $output -Needle "Kira Graphics lifetime detail:" -Context "basic_3d_cube $Frames frame detail"
        Assert-Contains -Output $output -Needle "buffers current=0" -Context "basic_3d_cube $Frames frame detail"
        Assert-Contains -Output $output -Needle "pipelines current=0" -Context "basic_3d_cube $Frames frame detail"
    }
    return $output
}

Run-Kira -Command "cd examples\basic_3d_cube && kira shader build" | Out-Null

Run-CubeFrames -Frames 3 | Out-Null
Run-CubeFrames -Frames 60 | Out-Null
Run-CubeFrames -Frames 300 -Detailed | Out-Null
if ($RunThousandFrames) {
    Run-CubeFrames -Frames 1000 -Detailed | Out-Null
}

Run-Kira -Command "cd examples\lifetime_stress && kira shader build" | Out-Null
Run-Kira -Command "kira check examples\lifetime_stress" | Out-Null

$stressOutput = Run-Kira -Command "cd examples\lifetime_stress && kira run" -Environment @{
    KIRA_GRAPHICS_LIFETIME_REPORT = "1"
    KIRA_GRAPHICS_LIFETIME_DETAIL = "1"
}
Assert-Contains -Output $stressOutput -Needle "Kira Graphics lifetime stress: pass iterations=200" -Context "lifetime_stress"
Assert-Contains -Output $stressOutput -Needle "lifetime stress app passed" -Context "lifetime_stress"
Assert-ZeroLifetimeReport -Output $stressOutput -Context "lifetime_stress"
Assert-Contains -Output $stressOutput -Needle "buffers current=0" -Context "lifetime_stress detail"
Assert-Contains -Output $stressOutput -Needle "images current=0" -Context "lifetime_stress detail"
Assert-Contains -Output $stressOutput -Needle "views current=0" -Context "lifetime_stress detail"
Assert-Contains -Output $stressOutput -Needle "shaders current=0" -Context "lifetime_stress detail"
Assert-Contains -Output $stressOutput -Needle "pipelines current=0" -Context "lifetime_stress detail"

Write-Host "Kira Graphics lifetime stress checks passed."
