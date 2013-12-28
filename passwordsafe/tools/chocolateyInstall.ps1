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
    $progFile = "$env:programFiles(x86)"
}
else
{
    $progFile = "$env:programFiles"
}

$dirPath = "\passwordSafe"
$installPath = $progFile + $dirPath
$silentOptions = "/S /D=`'$installPath`'"

install-ChocolateyPackage -packageName 'passwordsafe' -fileType 'exe' -silentArgs $silentOptions -url  'http://sourceforge.net/projects/passwordsafe/files/passwordsafe/3.32/pwsafe-3.32.exe/download'
