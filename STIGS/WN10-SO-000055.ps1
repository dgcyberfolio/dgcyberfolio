<#
.SYNOPSIS
    This PowerShell script ensures maximum age for machine account passwords must be configured to 30 days or less.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-27
    Last Modified   : 2024-02-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000055

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000055.ps1 
#>

# Define the registry path and the value name
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$valueName = "MaximumPasswordAge"
$value = 0x0000001e # 30 days in hexadecimal

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $value
    Write-Host "Registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
