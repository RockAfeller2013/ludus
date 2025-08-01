# Invoke-WebRequest -Uri "https://raw.githubusercontent.com/RockAfeller2013/ludus/refs/heads/main/activate-windows.ps1" -OutFile "$env:TEMP\activate.ps1"; powershell -ExecutionPolicy Bypass -File "$env:TEMP\activate.ps1" -ProductKey "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"

# This must be run as Administrator or it will fail.
# Make sure your Windows version matches the license key you're using (e.g., Home, Pro, Enterprise).
# This script does not validate the key before attempting activation. Windows itself will determine validity.
# You can optionally use Invoke-WebRequest instead of System.Net.WebClient in newer PowerShell versions

param (
    [Parameter(Mandatory=$true)]
    [string]$ProductKey
)

Write-Output "Removing existing product key (if any)..."
slmgr.vbs /upk

Write-Output "Installing new product key..."
slmgr.vbs /ipk $ProductKey

Write-Output "Activating Windows..."
slmgr.vbs /ato
slmgr /xpr
slmgr /dli
slmgr /dlv
(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey


Write-Output "Done. You can check activation status with 'slmgr.vbs /xpr'"
