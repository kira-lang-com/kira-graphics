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

function Assert-NotContains {
    param(
        [string]$Output,
        [string]$Needle,
        [string]$Context
    )

    if ($Output.Contains($Needle)) {
        throw "Did not expect '$Needle' in $Context. Actual output:`n$Output"
    }
}

function Assert-FileContains {
    param(
        [string]$Path,
        [string]$Needle
    )

    $source = Get-Content -LiteralPath $Path -Raw
    Assert-Contains -Output $source -Needle $Needle -Context $Path
}

function Assert-FileNotContains {
    param(
        [string]$Path,
        [string]$Needle
    )

    $source = Get-Content -LiteralPath $Path -Raw
    Assert-NotContains -Output $source -Needle $Needle -Context $Path
}

function Assert-SampleLifecycle {
    param(
        [string]$Path
    )

    $source = Get-Content -LiteralPath $Path -Raw
    Assert-Contains -Output $source -Needle "GraphicsApplication" -Context $Path
    Assert-Contains -Output $source -Needle "GraphicsAppCallbacks" -Context $Path
    Assert-Contains -Output $source -Needle "nativeState" -Context $Path
    Assert-Contains -Output $source -Needle "nativeUserData" -Context $Path
    Assert-Contains -Output $source -Needle "nativeRecover" -Context $Path
    Assert-Contains -Output $source -Needle "beginPass" -Context $Path
    Assert-Contains -Output $source -Needle "createRenderPipeline" -Context $Path
    Assert-Contains -Output $source -Needle "app.run(callbacks" -Context $Path
    Assert-NotContains -Output $source -Needle "KiraGraphics.sokol" -Context $Path
    Assert-NotContains -Output $source -Needle "applicationPresentFrame" -Context $Path
    Assert-NotContains -Output $source -Needle "applicationRunWithVertexData" -Context $Path
}

function Run-Kira {
    param(
        [string]$Command,
        [string]$Expected
    )

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    $output = (& cmd /c "$Command 2>&1" | Out-String)
    $exitCode = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorActionPreference

    if ($exitCode -ne 0) {
        throw "Command failed: $Command`n$output"
    }
    Assert-Contains -Output $output -Needle $Expected -Context $Command
}

Run-Kira -Command "kira shader check examples\basic_triangle\Shaders\BasicTriangle.ksl" -Expected "shader check passed"
Run-Kira -Command "kira shader check examples\ksl_triangle\Shaders\BasicTriangle.ksl" -Expected "shader check passed"

Assert-FileContains -Path "examples/basic_triangle/generated/Shaders/BasicTriangle.vert.glsl" -Needle "layout(location = 0) in vec2 kira_attr_position"
Assert-FileContains -Path "examples/basic_triangle/generated/Shaders/BasicTriangle.frag.glsl" -Needle "layout(location = 0) out vec4 kira_frag_color"
Assert-FileContains -Path "examples/ksl_triangle/generated/shaders/BasicTriangle.vert.glsl" -Needle "layout(location = 0) in vec2 kira_attr_position"
Assert-FileContains -Path "examples/ksl_triangle/generated/shaders/BasicTriangle.frag.glsl" -Needle "layout(location = 0) out vec4 kira_frag_color"

Assert-FileNotContains -Path "examples/basic_triangle/generated/Shaders/BasicTriangle.vert.glsl" -Needle "VertexOut out;"
Assert-FileNotContains -Path "examples/basic_triangle/generated/Shaders/BasicTriangle.frag.glsl" -Needle "FragmentOut out;"
Assert-FileNotContains -Path "examples/ksl_triangle/generated/shaders/BasicTriangle.vert.glsl" -Needle "VertexOut out;"
Assert-FileNotContains -Path "examples/ksl_triangle/generated/shaders/BasicTriangle.frag.glsl" -Needle "FragmentOut out;"

Run-Kira -Command "kira build --backend llvm examples\ksl_triangle" -Expected "wrote"
Run-Kira -Command "kira check examples\frame_api_triangle" -Expected "check passed"
Run-Kira -Command "kira check examples\clear_color" -Expected "check passed"

Assert-SampleLifecycle -Path "examples/basic_triangle/app/main.kira"
Assert-SampleLifecycle -Path "examples/ksl_triangle/app/main.kira"

Write-Host "KSL integration checks passed."
