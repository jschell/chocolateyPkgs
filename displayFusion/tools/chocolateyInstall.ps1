function get-osArch
{
    $ptr = [intptr]::size
    if($ptr -eq 8)
    {
        $os = 64
    }
    else
    {
        $os = 32
    }

    return $os
}

$arch = get-osArch
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
$silentOptions = "/VERYSILENT /LANG=$localeTwoLetter /DIR=`"$installPath`" /STARTUPALL=1 /MERGETASKS=`"!desktopicon,!desktopicon\common,!desktopicon\user`" "

install-ChocolateyPackage -packageName 'displayFusion' -fileType 'exe' -silentArgs $silentOptions -url  'www.binaryfortress.com/Data/Download/?package=displayfusion'
