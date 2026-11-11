# ZeroDay Client online installer
$ErrorActionPreference = "Stop"
$dest = Join-Path (Get-Location) "ZeroDay-Client"
Write-Host "[*] Downloading ZeroDay Client..."
$zip = Join-Path $env:TEMP "ZeroDay-Client.zip"
Invoke-WebRequest -Uri "https://github.com/Vitaintelligence/zeroday-download/releases/latest/download/ZeroDay-Client-v4.3.zip" -OutFile $zip -UseBasicParsing
Write-Host "[*] Extracting..."
if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
Expand-Archive -Path $zip -DestinationPath $dest -Force
Remove-Item $zip -Force
Write-Host "[*] Launching START.bat..."
Start-Process -FilePath (Join-Path $dest "client_package\START.bat") -WorkingDirectory (Join-Path $dest "client_package")
Write-Host "[+] Done. ZeroDay window should open."
