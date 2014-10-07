function GetLatestVersionInPath ($path)
{
	write-host "working on directory $path"
	$directories = [System.IO.Directory]::GetDirectories($path)
	
	[int]$latestDirectoryNumbers = 0
	foreach ($directory in $directories)
	{
		$number = [int]$directory.SubString($path.Length + 1)
		if($latestDirectoryNumbers -lt $number)
		{
			$latestDirectoryNumbers = $number
		}
	}
		
	write-host $latestDirectoryNumbers
	return $latestDirectoryNumbers;
}

function CopyContent($src, $dest)
{
	$exists = Test-Path $dest
	if ($exists) 
	{
		rm $dest -recurse -force
	}
	md $dest
	cp -r $src $dest
}

function CopyLatestComponent($sourceDirectory, $sourceLocationSecondPart, $outputDirectory, $versionNumber)
{
	$latestComponentVersion = GetLatestVersionInPath $sourceDirectory;
	$componentFullpath  = $sourceDirectory + "\" + $latestComponentVersion + "\$sourceLocationSecondPart\*"

	write-host($componentFullpath)

	$newComponentPath = $outputDirectory + "\\" + $versionNumber
	CopyContent $componentFullpath $newComponentPath
}