# unreact
This script will download and install the last stable version of Steam before the Library update on 10-30-19, and write a file to prevent the bootstrapper from attempting an update.

Before you start, close Steam. You can also (optionally) clear out *all* of the files in your Steam directory except for steamapps and userdata.

Please consider the implications of what you are doing and inspect the script. Running old versions of Steam may be fine for a while... until an exploit is discovered and Valve only updates the version with the new library. Be careful.

## Run this
### The lazy way
Open PowerShell (windows key + X -> PowerShell), and then
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/antigravities/unreact/master/unreact.ps1'))
```
### The better way
Download [unreact.ps1](https://raw.githubusercontent.com/antigravities/unreact/master/unreact.ps1), drag it into PowerShell, and press ENTER.
