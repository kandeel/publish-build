$sourceDirectory = $args[0]
$buildNumber = $args[1]
$destDirectory = $args[2]

if($args.count -ne 3)
{
	write-host "Usage"
	write-Host "powershell -File GeneratePluginFiles.ps1 <Input location> <Build Number> <Output location>"
    exit
} 

function GetLatestVersionInPath ($path)
{
	$directories = [System.IO.Directory]::GetDirectories($path)
	
	[int]$latestDirectoryNumbers = 0
	foreach ($directory in $directories)
	{
		$number = [int]$directory.SubString($sourceDirectory.Length + 1)
		if($latestDirectoryNumbers -lt $number)
		{
			$latestDirectoryNumbers = $number
		}
	}
		
	write-host $latestDirectoryNumbers
	return $latestDirectoryNumbers;
}

$lxePluginPath = GetLatestLxePluginPath $sourceDirectory;

