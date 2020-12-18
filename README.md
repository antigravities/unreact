## Archived
While this script probably still works, I will not continue to support it. If you really must, use the [-no-browser +open steam://open/minigameslist](https://www.howtogeek.com/694531/how-to-reduce-steams-ram-usage-from-400-mb-to-60-mb/) trick instead.

# unreact

This script will download and install the last stable version of Steam before the Library update on 10-30-19 [from the Steam CDN](https://github.com/antigravities/unreact/blob/master/unreact.ps1#L73), and write a file to prevent the bootstrapper from attempting an update.

Before you start, close Steam. You can also (optionally) clear out *all* of the files in your Steam directory except for steamapps and userdata.

**This is intended as a temporary fix<sup><a href="#footnote-1">1</a></sup>.** Newer games, especially those that use the new Origin integration (i.e. Star Wars Jedi: The Fallen Order) may not work! More importantly, running old versions of Steam may be fine for a while... until an exploit is discovered. Be careful.

## Run this
**This script runs on Windows 7 x64, Windows 8.1 x64, and Windows 10 x64.** The downloaded items will cause undefined behavior on other operating systems.

### The lazy way
Open PowerShell (windows key + X -> PowerShell), and then
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/antigravities/unreact/master/unreact.ps1'))
```
### The better way
Download [unreact.ps1](https://raw.githubusercontent.com/antigravities/unreact/master/unreact.ps1). Then, type `Set-ExecutionPolicy Bypass -Scope Process -Force` into PowerShell, and press ENTER. After that, drag unreact.ps1 into PowerShell, and press ENTER.

<sup><a id="footnote-1">1: I created this because the new update's performance was simply unbearable for me with the size of my library.</a></sup>
