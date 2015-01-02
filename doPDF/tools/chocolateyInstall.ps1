$packageName = 'doPDF'
$fileType = 'EXE'
$silentArgs = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
$url = 'http://www.dopdf.com/download/setup/dopdf_7_3_400.exe'

install-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -url $url