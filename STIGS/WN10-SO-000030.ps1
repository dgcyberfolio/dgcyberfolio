<#
.SYNOPSIS
    This PowerShell script configure audit policy to ensure subcategories settings are enabled.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-26
    Last Modified   : 2024-02-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000030.ps1 
#>

# Define the registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "SCENoApplyLegacyAuditPolicy"
$value = 1

# Check if the registry path exists
if (Test-Path $regPath) {
    # Set the registry value to 1
    Set-ItemProperty -Path $regPath -Name $valueName -Value $value
    Write-Host "Registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
