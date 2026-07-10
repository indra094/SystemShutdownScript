$folder="C:\ProgramData\TimeGuard"

New-Item -ItemType Directory -Force -Path $folder

Copy-Item ".\TimeGuard.ps1" "$folder\TimeGuard.ps1"


$task="TimeGuard Service"

$action = New-ScheduledTaskAction `
    -Execute "powershell.exe" `
    -Argument "-WindowStyle Hidden -ExecutionPolicy Bypass -File C:\ProgramData\TimeGuard\TimeGuard.ps1"


$trigger = New-ScheduledTaskTrigger `
    -AtStartup


Register-ScheduledTask `
    -TaskName $task `
    -Action $action `
    -Trigger $trigger `
    -RunLevel Highest `
    -Force


Write-Host "TimeGuard installed."
