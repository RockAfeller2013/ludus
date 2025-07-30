# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/youruser/yourrepo/main/activate-windows.ps1')) -ProductKey "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"
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

Write-Output "Done. You can check activation status with 'slmgr.vbs /xpr'"
