$arch = get-processorBits
if($arch -eq 64 )
{
    $progFile = "$env:programFiles (x86)"
}
else
{
    $progFile = "$env:programFiles"
}

$dirPath = "\DisplayFusion"
$installPath = $progFile + $dirPath
$localeTwoLetter = (Get-Culture).TwoLetterISOLanguageName

$packageName = 'displayFusion'
$fileType = 'EXE'
$silentArgs = "/VERYSILENT /LANG=$localeTwoLetter /DIR=`"$installPath`" /STARTUPALL=1 /MERGETASKS=`"!desktopicon,!desktopicon\common,!desktopicon\user`" "
$url = 'http://www.binaryfortress.com/Data/Download/?package=displayfusion'

install-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -url $url