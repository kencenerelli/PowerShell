<#
.SYNOPSIS
Locates the Microsoft Azure PowerShell cmdlets version currently installed.

.DESCRIPTION
Function to retrieve the Microsoft Azure PowerShell cmdlets version.


.EXAMPLE
PS> .\Get-AzurePowerShellCmdletsVersion.ps1
#>

$name='Azure'

if(Get-Module -ListAvailable | 
    Where-Object { $_.name -eq $name }) 
{ 
    (Get-Module -ListAvailable | Where-Object{ $_.Name -eq $name }) | 
    Select Version, Name, Author, PowerShellVersion  | Format-List; 
} 
else 
{ 
    “The Azure PowerShell module is not installed.”
}
