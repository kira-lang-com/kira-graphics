param(
    [int[]]$Frames = @(3000),
    [int]$SampleMilliseconds = 100,
    [double]$MaxLlvmPrivateDeltaMB = 96.0,
    [double]$MaxHybridPrivateDeltaMB = 96.0,
    [double]$MaxHybridOverLlvmDeltaMB = 80.0
)

$ErrorActionPreference = "Stop"

function Get-DescendantProcesses {
    param([int]$RootPid)

    $all = Get-CimInstance Win32_Process | Select-Object ProcessId, ParentProcessId, Name, CommandLine, ExecutablePath
    $ids = New-Object System.Collections.Generic.HashSet[int]
    [void]$ids.Add($RootPid)
    $changed = $true
    while ($changed) {
        $changed = $false
        foreach ($proc in $all) {
            if ($ids.Contains([int]$proc.ParentProcessId) -and -not $ids.Contains([int]$proc.ProcessId)) {
                [void]$ids.Add([int]$proc.ProcessId)
                $changed = $true
            }
        }
    }

    return @($all | Where-Object { $ids.Contains([int]$_.ProcessId) })
}

function Select-KiraRuntimeProcess {
    param(
        [object[]]$Processes
    )

    $candidates = @($Processes | Where-Object {
        $_.Name -notin @("zig.exe", "lld-link.exe", "clang.exe", "cmd.exe", "powershell.exe", "pwsh.exe")
    })
    $runtime = @($candidates | Where-Object {
        $_.Name -ne "kira.exe" -and ($_.Name -eq "kirac.exe" -or $_.CommandLine -like "*basic_3d_cube*" -or $_.ExecutablePath -like "*basic_3d_cube*")
    })
    if ($runtime.Count -gt 0) {
        return $runtime
    }
    return $candidates
}

function Assert-ZeroLifetimeReport {
    param(
        [string]$Output,
        [string]$Context
    )

    $expected = "Kira Graphics lifetime report: shaders=0 pipelines=0 textures=0 uniforms=0 bindGroups=0"
    if ($Output -notlike "*$expected*") {
        throw "$Context did not end with zero Kira Graphics lifetime counters."
    }
}

function Measure-KiraRun {
    param(
        [string]$Backend,
        [int]$FrameCount
    )

    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "kira"
    $psi.Arguments = "run --backend $Backend examples/basic_3d_cube"
    $psi.WorkingDirectory = (Get-Location).Path
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.UseShellExecute = $false
    $psi.EnvironmentVariables["KIRA_GRAPHICS_LIFETIME_REPORT"] = "1"
    $psi.EnvironmentVariables["KIRA_GRAPHICS_LIFETIME_DETAIL"] = "1"
    $psi.EnvironmentVariables["KIRA_GRAPHICS_QUIT_AFTER_FRAMES"] = [string]$FrameCount

    $process = [System.Diagnostics.Process]::Start($psi)
    $stdoutTask = $process.StandardOutput.ReadToEndAsync()
    $stderrTask = $process.StandardError.ReadToEndAsync()

    $startWorkingSet = $null
    $startPrivate = $null
    $endWorkingSet = 0L
    $endPrivate = 0L
    $peakWorkingSet = 0L
    $peakPrivate = 0L

    while (-not $process.HasExited) {
        $targets = @(Select-KiraRuntimeProcess -Processes (Get-DescendantProcesses -RootPid $process.Id))
        if ($targets.Count -gt 0) {
            $sampleWorkingSet = 0L
            $samplePrivate = 0L
            foreach ($target in $targets) {
                try {
                    $runtimeProcess = Get-Process -Id $target.ProcessId -ErrorAction Stop
                    $sampleWorkingSet += [int64]$runtimeProcess.WorkingSet64
                    $samplePrivate += [int64]$runtimeProcess.PrivateMemorySize64
                } catch {
                }
            }

            if ($sampleWorkingSet -gt 0) {
                if ($null -eq $startWorkingSet) {
                    $startWorkingSet = $sampleWorkingSet
                    $startPrivate = $samplePrivate
                }
                $endWorkingSet = $sampleWorkingSet
                $endPrivate = $samplePrivate
                if ($sampleWorkingSet -gt $peakWorkingSet) { $peakWorkingSet = $sampleWorkingSet }
                if ($samplePrivate -gt $peakPrivate) { $peakPrivate = $samplePrivate }
            }
        }

        Start-Sleep -Milliseconds $SampleMilliseconds
    }

    $process.WaitForExit()
    if ($null -eq $startWorkingSet) {
        throw "No runtime process samples were captured for backend=$Backend frames=$FrameCount."
    }

    $output = $stdoutTask.Result + "`n" + $stderrTask.Result
    if ($process.ExitCode -ne 0) {
        Write-Host $output
        throw "kira run failed for backend=$Backend frames=$FrameCount exit=$($process.ExitCode)"
    }

    Assert-ZeroLifetimeReport -Output $output -Context "$Backend $FrameCount frames"
    $lifetime = ($output -split "`r?`n" | Where-Object { $_ -like "*Kira Graphics lifetime report:*" } | Select-Object -Last 1)
    $detail = ($output -split "`r?`n" | Where-Object { $_ -like "*Kira Graphics lifetime detail:*" } | Select-Object -Last 1)

    return [pscustomobject]@{
        Backend = $Backend
        Frames = $FrameCount
        StartWorkingSetMB = [math]::Round($startWorkingSet / 1MB, 2)
        EndWorkingSetMB = [math]::Round($endWorkingSet / 1MB, 2)
        PeakWorkingSetMB = [math]::Round($peakWorkingSet / 1MB, 2)
        DeltaWorkingSetMB = [math]::Round(($endWorkingSet - $startWorkingSet) / 1MB, 2)
        StartPrivateMB = [math]::Round($startPrivate / 1MB, 2)
        EndPrivateMB = [math]::Round($endPrivate / 1MB, 2)
        PeakPrivateMB = [math]::Round($peakPrivate / 1MB, 2)
        DeltaPrivateMB = [math]::Round(($endPrivate - $startPrivate) / 1MB, 2)
        Lifetime = $lifetime
        Detail = $detail
    }
}

$results = @()
foreach ($frameCount in $Frames) {
    $llvm = Measure-KiraRun -Backend "llvm" -FrameCount $frameCount
    $hybrid = Measure-KiraRun -Backend "hybrid" -FrameCount $frameCount
    $results += $llvm
    $results += $hybrid

    if ($llvm.DeltaPrivateMB -gt $MaxLlvmPrivateDeltaMB) {
        throw "LLVM private memory delta $($llvm.DeltaPrivateMB) MB exceeded $MaxLlvmPrivateDeltaMB MB for $frameCount frames."
    }
    if ($hybrid.DeltaPrivateMB -gt $MaxHybridPrivateDeltaMB) {
        throw "Hybrid private memory delta $($hybrid.DeltaPrivateMB) MB exceeded $MaxHybridPrivateDeltaMB MB for $frameCount frames."
    }
    $gap = $hybrid.DeltaPrivateMB - $llvm.DeltaPrivateMB
    if ($gap -gt $MaxHybridOverLlvmDeltaMB) {
        throw "Hybrid grew $([math]::Round($gap, 2)) MB more than LLVM for $frameCount frames."
    }
}

$results | Select-Object Backend, Frames, StartWorkingSetMB, EndWorkingSetMB, PeakWorkingSetMB, DeltaWorkingSetMB, StartPrivateMB, EndPrivateMB, PeakPrivateMB, DeltaPrivateMB | Format-Table -AutoSize
foreach ($result in $results) {
    Write-Host "$($result.Backend) $($result.Frames) lifetime: $($result.Lifetime)"
    Write-Host "$($result.Backend) $($result.Frames) detail: $($result.Detail)"
}
