while ($true) {

    $hour = (Get-Date).Hour

    # Allowed time: 9 AM - 5 PM
    if ($hour -lt 9 -or $hour -ge 17) {

        shutdown.exe /s /t 30 /c "Computer locked by TimeGuard policy."

        exit
    }

    Start-Sleep -Seconds 60
}
