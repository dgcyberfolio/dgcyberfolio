<#
.SYNOPSIS
    This PowerShell script ensures that outgoing secure channel traffic is signed when possible.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-02-26
    Last Modified   : 2024-02-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000045

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000045.ps1 
#>


# Define the registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$valueName = "SignSecureChannel"
$value = 1

# Check if the registry path exists
if (Test-Path $regPath) {
    # Set the registry value to 1
    Set-ItemProperty -Path $regPath -Name $valueName -Value $value
    Write-Host "Registry value '$valueName' set to $value successfully."
} else {
    Write-Host "Registry path does not exist."
}
