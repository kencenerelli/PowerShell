<#
.SYNOPSIS
Shows a count of URL links from a webpage.

.DESCRIPTION
Function to retrieve a count of URL links.

.PARAMETER URL
The URL of the webpage to scan.

.EXAMPLE
PS> .\Get-WebPageLinkCount.ps1 -URL 'http://www.lego.com/en-us/'
#>

param
(
	[parameter()][string] $URL
)

$PageContent = (Invoke-WebRequest -Uri $URL);
$LinkCount = $PageContent.Links.Count

Return $LinkCount
