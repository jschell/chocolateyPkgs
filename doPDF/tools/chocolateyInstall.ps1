$silentOptions = "/VERYSILENT /NORESTART"

install-ChocolateyPackage -packageName 'doPDF' -fileType 'exe' -silentArgs $silentOptions -url  'http://www.dopdf.com/download/setup/dopdf-7.exe'