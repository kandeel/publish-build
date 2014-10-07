$sourceDirectory= $args[0]
$sourceLocationSecondPart = $args[1]
$outputDirectory = $args[2]
$outputDirectoryPart2 = $args[3]
$versionNumber = $args[4]

if($args.count -ne 5)
{
	write-host $args.count
	write-host "Usage"
	write-Host "powershell -File publish_helper.ps1 componentSource componentSourceSecondPart outputFolder outputFolderPart2 versionNumber"
    exit
} 

. (".\publish_helper.ps1")

CopyLatestComponent $sourceDirectory $sourceLocationSecondPart $outputDirectory $outputDirectoryPart2 $versionNumber

