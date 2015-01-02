$packageName = 'smplayer'
$fileType = 'EXE'
$silentArgs = '/S'
$url32bit = 'http://downloads.sourceforge.net/project/smplayer/SMPlayer/14.9.0/smplayer-14.9.0-win32.exe'
$url64bit = 'http://downloads.sourceforge.net/project/smplayer/SMPlayer/14.9.0/smplayer-14.9.0-x64.exe'

install-chocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -url $url32bit -url64bit $url64bit
