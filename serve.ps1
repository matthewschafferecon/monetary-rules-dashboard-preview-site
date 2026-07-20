param(
    [ValidateRange(1024, 65535)]
    [int]$Port = 8765
)

$ErrorActionPreference = 'Stop'
$dashboardRoot = $PSScriptRoot
$projectRoot = Split-Path -Parent $dashboardRoot
$url = "http://127.0.0.1:$Port/"
$virtualEnvironmentPython = Join-Path $projectRoot '.venv\Scripts\python.exe'
$bundledPython = Join-Path $env:USERPROFILE '.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'

if (Test-Path -LiteralPath $virtualEnvironmentPython) {
    $python = $virtualEnvironmentPython
} elseif (Test-Path -LiteralPath $bundledPython) {
    $python = $bundledPython
} else {
    $command = Get-Command python -ErrorAction SilentlyContinue
    if (-not $command) {
        $command = Get-Command py -ErrorAction SilentlyContinue
    }
    if (-not $command) {
        throw 'Python was not found. Install Python 3 or run this dashboard through another static web server.'
    }
    $python = $command.Source
}

$arguments = @(
    '-m', 'http.server', $Port,
    '--bind', '127.0.0.1',
    '--directory', $dashboardRoot
)

$server = Start-Process -FilePath $python -ArgumentList $arguments -WindowStyle Hidden -PassThru
try {
    Start-Sleep -Milliseconds 900
    if ($server.HasExited) {
        throw "The dashboard server could not start. Port $Port may already be in use."
    }
    Start-Process $url
    Write-Host "Dashboard opened at $url"
    Read-Host 'Press Enter to stop the dashboard server'
} finally {
    if (-not $server.HasExited) {
        Stop-Process -Id $server.Id
    }
}
