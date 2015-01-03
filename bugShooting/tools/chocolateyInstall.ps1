# Package requires .net 3.5

$osInfo = Get-WmiObject Win32_OperatingSystem | select-object Version
$osInfo.Version = [version] $osInfo.Version

if ($osInfo.Version -lt [version]'6.2') 
{
    # Less than 2012/Win8, test if the directory is present for .net3.5
    if( !(test-path 'C:\WINDOWS\Microsoft.NET\Framework\v3.5') )
    {
        choco install DotNet3.5
    }
}

else 
{
    $check35 = get-WindowsFeature Net-Framework-Core
    if( $check35.installed -eq $False)
    {
        install-windowsFeature Net-Framework-Core
    }
}

# End of .Net 3.5 install hackery... smh

$packageName = 'bugshooting'
$fileType = 'exe'
$url = 'http://www.bugshooting.com/Home/Download?Mode=Start'
$silentArgs = "/SILENT /LINKDESKTOP=0 /MULTIUSER=1 /LINKAUTOSTART=1"

install-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -url $url