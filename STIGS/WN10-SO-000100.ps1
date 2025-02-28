<#
.SYNOPSIS
    This PowerShell script ensures that the Windows SMB client is configured to always perform SMB packet signing.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dgcyberfolio
    Date Created    : 2024-02-27
    Last Modified   : 2024-02-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000100.ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$valueName = "RequireSecuritySignature"
$value = 1  # Enabling the security signature (1)

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Set the registry value (as REG_DWORD)
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $value
    Write-Host "RequireSecuritySignature registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
