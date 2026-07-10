while ($true) {

    $now = Get-Date
    $hour = $now.Hour
    $minute = $now.Minute

    # Reminder at 4:30 PM
    if ($hour -eq 16 -and $minute -eq 30) {

        Add-Type -AssemblyName PresentationFramework

        [System.Windows.MessageBox]::Show(
            "30 minutes remaining. Plan your next day for 4 hours before shutdown.",
            "TimeGuard Reminder"
        )

    }


    # Shutdown after 5 PM
    if ($hour -ge 17) {

        shutdown.exe /s /t 30 `
        /c "Work window ended. Shutting down."

        exit
    }


    Start-Sleep -Seconds 60
}
