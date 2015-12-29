<# 
.SYNOPSIS
Shows a list of services on your operating system.
 
.DESCRIPTION
Function to retrieve a list of services.
 
.EXAMPLE
PS> .\Get-Services.ps1
#> 

Get-WmiObject win32_service | Select Name, DisplayName, State, StartMode | Sort State, Name
