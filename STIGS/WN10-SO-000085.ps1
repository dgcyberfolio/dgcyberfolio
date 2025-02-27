<#
.SYNOPSIS
    This PowerShell script ensures the caching of logon credentials will be limited.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-27
    Last Modified   : 2024-02-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000085

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000085.ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$valueName = "CachedLogonsCount"
$value = "10"  # Set to 10 or less as required

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Set the registry value (as REG_SZ, string type)
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $value
    Write-Host "CachedLogonsCount registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
