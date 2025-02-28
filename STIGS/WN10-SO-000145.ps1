<#
.SYNOPSIS
    This PowerShell script ensures that the Anonymous enumeration of SAM accounts are not allowed.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-28
    Last Modified   : 2024-02-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000145.ps1 
#>

# Define registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "RestrictAnonymousSAM"
$value = 1

# Check if the registry path exists
if (Test-Path $regPath) {
    # Set the registry value
    Set-ItemProperty -Path $regPath -Name $valueName -Value $value
    Write-Output "Registry key '$valueName' set to $value successfully."
} else {
    Write-Error "The registry path $regPath does not exist."
}
