# Ensure the script runs with admin privileges
$adminCheck = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $adminCheck.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrative privileges. Please run PowerShell as Administrator." -ForegroundColor Red
    exit
}

# Check if Winget is installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is not installed. Please update Windows or install the App Installer package from the Microsoft Store." -ForegroundColor Red
    exit
}

# List of applications to install
$apps = @(
    "Valve.Steam",
    "Discord.Discord",
    "ShareX.ShareX",
    "OBSProject.OBSStudio",
    "Bitwarden.Bitwarden",
    "Google.Chrome",
    "VideoLAN.VLC",
    "7zip.7zip"
)

# Loop through each application and install it
foreach ($app in $apps) {
    Write-Host "Installing $app..." -ForegroundColor Cyan
    winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
}

Write-Host "Installation of selected programs is complete!" -ForegroundColor Green
