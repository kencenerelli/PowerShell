<# 
.SYNOPSIS 
Shows a list of services that matches the parameter combination. Retrieves three properties and sorts on two of them.
 
.DESCRIPTION
Function to retrieve a list of services based on defined parameters.

.PARAMETER STATE
The state of the service. AKA the Status.

.PARAMETER STARTMODE
The mode the service is set to on start up. AKA the Startup Type.
 
.EXAMPLE
PS> .\Get-ServicesWithFilter.ps1 -State Stopped -StartMode Auto
#>

param(
    [Parameter()]
    [ValidateSet("Stopped","Running")]
    [string[]]
    $State,

    [Parameter()]
    [ValidateSet("Auto", "Manual", "Disabled")]
    [string[]]
    $StartMode
) 

If ($State -and $StartMode -eq $null)
{ 
    Get-WmiObject win32_service -Filter "State = '$State'" | Select Name, DisplayName, State, StartMode | Sort State, Name
}
ElseIf ($State -eq $null -and $StartMode)
{ 
    Get-WmiObject win32_service -Filter "StartMode = '$StartMode'" | Select Name, DisplayName, State, StartMode | Sort State, Name
}
ElseIf ($State -and $StartMode) 
{ 
    Get-WmiObject win32_service -Filter "State = '$State' AND StartMode = '$StartMode'" | Select Name, DisplayName, State, StartMode | Sort State, Name
}
