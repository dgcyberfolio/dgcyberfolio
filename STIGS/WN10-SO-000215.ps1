<#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to meet the minimum session security requirement for NTLM SSP based clients.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-28
    Last Modified   : 2024-02-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000215

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000215.ps1 
#>


# Define registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$valueName = "NTLMMinClientSec"
$value = 0x20080000  # Hexadecimal value (537395200 in decimal)

# Check if the registry path exists; if not, create it
if (-not (Test-Path $regPath)) {
    # Create the registry path
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "MSV1_0" -Force
    Write-Output "Registry path '$regPath' created."
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $value
Write-Output "Registry key '$valueName' set to $value successfully."
