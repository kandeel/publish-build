$sourceDirectory= $args[0]
$sourceLocationSecondPart = $args[1]
$outputDirectory = $args[2]
$versionNumber = $args[3]

if($args.count -ne 4)
{
	write-host "Usage"
	write-Host "powershell -File publish_helper.ps1 componentSource componentSourceSecondPart outputFolder versionNumber"
    exit
} 

. (".\publish_helper.ps1")

CopyLatestComponent $sourceDirectory $sourceLocationSecondPart $outputDirectory $versionNumber

