# TimeGuard

Automatic computer shutdown outside work hours.

## Behavior

* Allowed usage: **9:00 AM - 5:00 PM**
* Reminder: **4:30 PM**

  * Plan next day for 4 hours
* Shutdown: **5:00 PM**
* Runs automatically after startup
* Checks every minute

---

# Windows Setup

## Requirements

* Windows 10/11
* Administrator PowerShell

---

## Install

Open PowerShell as Administrator:

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

Run installer:

```powershell
.\Install-TimeGuard.ps1
```

Verify:

```powershell
Get-ScheduledTask -TaskName TimeGuard
```

---

## Start Manually

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\ProgramData\TimeGuard\TimeGuard.ps1
```

---

## Stop / Remove

Stop:

```powershell
Unregister-ScheduledTask -TaskName TimeGuard -Confirm:$false
```

Remove files:

```powershell
Remove-Item C:\ProgramData\TimeGuard -Recurse
```

---

# macOS Setup

## Requirements

* macOS
* Administrator password

---

## Install

Create required folders:

```bash
sudo mkdir /Library/TimeGuard
```

Make script executable:

```bash
sudo chmod +x /Library/TimeGuard/timeguard.sh
```

Set permissions:

```bash
sudo chown -R root:wheel /Library/TimeGuard
sudo chown root:wheel /Library/LaunchDaemons/com.timeguard.shutdown.plist
sudo chmod 644 /Library/LaunchDaemons/com.timeguard.shutdown.plist
```

Load service:

```bash
sudo launchctl load /Library/LaunchDaemons/com.timeguard.shutdown.plist
```

---

## Verify Service

```bash
sudo launchctl list | grep timeguard
```

---

## Stop / Remove

Unload:

```bash
sudo launchctl unload /Library/LaunchDaemons/com.timeguard.shutdown.plist
```

Remove:

```bash
sudo rm -rf /Library/TimeGuard
sudo rm /Library/LaunchDaemons/com.timeguard.shutdown.plist
```

---

# Project Files

## Windows

Required files:

```
Install-TimeGuard.ps1
TimeGuard.ps1
```

## macOS

Required files:

```
/Library/TimeGuard/timeguard.sh
/Library/LaunchDaemons/com.timeguard.shutdown.plist
```

---

# Configuration

Default:

```
Start: 09:00
Reminder: 16:30
Shutdown: 17:00
```

Modify the scripts if different hours are required.
