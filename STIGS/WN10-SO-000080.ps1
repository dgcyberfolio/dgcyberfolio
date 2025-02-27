<#
.SYNOPSIS
    This PowerShell script ensures that the Windows dialog box title for the legal banner is configured.

.NOTES
    Author          : David Gilmore
    LinkedIn        : linkedin.com/in/david-gilmore1/
    GitHub          : github.com/dhcyberfolio
    Date Created    : 2024-02-27
    Last Modified   : 2024-02-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000080

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000080.ps1 
#>


# Define the registry path and the value name
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "LegalNoticeCaption"
$value = "DoD Notice and Consent Banner"  # Modify as needed for your environment

# Check if the registry key exists
if (Test-Path $registryPath) {
    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $value
    Write-Host "LegalNoticeCaption registry value set successfully."
} else {
    Write-Host "Registry path does not exist."
}
