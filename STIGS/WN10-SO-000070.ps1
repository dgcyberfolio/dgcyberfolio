<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-27
    Last Modified   : 2024-02-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000070.ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "InactivityTimeoutSecs"
$value = 0x00000384 # 900 seconds (15 minutes) in hexadecimal

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $value
    Write-Host "Registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
