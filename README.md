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


# If You Do Not Have Administrator Privileges

TimeGuard requires administrator privileges for a true system-level shutdown service because it needs permission to:

* Start automatically after boot
* Run in the background
* Shut down the computer without user interaction

If you cannot get administrator access, use the user-level installation options below.

---

# Windows (No Administrator Access)

## Limitations

Without admin rights:

* The script can only run after user login
* It cannot guarantee shutdown if the user disables it
* It cannot create a system startup task

---

## Setup

### 1. Store Script Locally

Create a folder:

```text
%USERPROFILE%\TimeGuard
```

Place:

```text
TimeGuard.ps1
```

inside this folder.

---

### 2. Create Startup Entry

Press:

```
Win + R
```

Open:

```text
shell:startup
```

Create a file:

```text
Start-TimeGuard.bat
```

with:

```bat
powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%USERPROFILE%\TimeGuard\TimeGuard.ps1"
```

---

### 3. Test

Double-click:

```text
Start-TimeGuard.bat
```

The script will run automatically after login.

---

# macOS (No Administrator Access)

## Limitations

Without admin rights:

* Cannot create a LaunchDaemon
* Runs only after user login
* User can remove the startup item

---

## Setup

### 1. Store Script

Create:

```bash
mkdir -p ~/TimeGuard
```

Place:

```bash
~/TimeGuard/timeguard.sh
```

Make executable:

```bash
chmod +x ~/TimeGuard/timeguard.sh
```

---

### 2. Create Login Item

Open:

```
System Settings
→ General
→ Login Items
→ Open at Login
→ Add
```

Add:

```bash
~/TimeGuard/timeguard.sh
```

---

### 3. Test

Run:

```bash
~/TimeGuard/timeguard.sh
```

---

# Recommended Approach

| Access Level            | Windows                         | macOS                   |
| ----------------------- | ------------------------------- | ----------------------- |
| Administrator available | Use system service installation | Use LaunchDaemon        |
| No administrator        | Use startup folder              | Use Login Items         |
| Shared/company computer | Request IT installation         | Request IT installation |

For a personal productivity computer, the user-level setup is usually sufficient. For enforcing policies on managed devices, administrator installation is required.

