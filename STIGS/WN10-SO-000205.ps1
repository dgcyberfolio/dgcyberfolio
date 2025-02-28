<#
.SYNOPSIS
    This PowerShell script ensures that the LanMan authentication level is set to send NTLMv2 response only, and to refuse LM and NTLM.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-28
    Last Modified   : 2024-02-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000205.ps1 
#>

# Define registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$valueName = "LmCompatibilityLevel"
$value = 5

# Check if the registry path exists; if not, create it
if (-not (Test-Path $regPath)) {
    Write-Error "The registry path $regPath does not exist."
    return
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $value
Write-Output "Registry key '$valueName' set to $value successfully."
