<#
.SYNOPSIS
    This PowerShell script ensures that the Smart Card removal option will be configured to Force Logoff or Lock the Workstation.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-28
    Last Modified   : 2024-02-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000095

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000095.ps1 
#>

# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$valueName = "SCRemoveOption"

# The value can be set to 1 (Lock Workstation) or 2 (Force Logoff)
# In this case, setting the value as per your need
$value = 1  # Change to 2 for Force Logoff

# Check if the registry path exists
if (Test-Path $regPath) {
    # Set the registry value
    Set-ItemProperty -Path $regPath -Name $valueName -Value $value
    Write-Output "Registry key '$valueName' set to $value successfully."
} else {
    Write-Error "The registry path $regPath does not exist."
}
