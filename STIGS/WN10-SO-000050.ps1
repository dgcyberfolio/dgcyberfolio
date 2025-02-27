<#
.SYNOPSIS
    This PowerShell script ensures that the computer password will not be prevented from resetting.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-26
    Last Modified   : 2024-02-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000050

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000050.ps1 
#>


# Define the registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$valueName = "DisablePasswordChange"
$value = 0

# Check if the registry path exists
if (Test-Path $regPath) {
    # Set the registry value to 0
    Set-ItemProperty -Path $regPath -Name $valueName -Value $value
    Write-Host "Registry value '$valueName' set to $value successfully."
} else {
    Write-Host "Registry path does not exist."
}
