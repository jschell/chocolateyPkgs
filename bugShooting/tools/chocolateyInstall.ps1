$osInfo = Get-WmiObject Win32_OperatingSystem | SELECT Version, ProductType, Caption
$osInfo.Version = [version] $osInfo.Version

# Get the .Net 3.5 Framework installed

if ($osInfo.Version -lt [version]'6.2') 
{
    cinst DotNet3.5
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

$silentOptions = "/SILENT /MULTIUSER=1 /LINKDESKTOP=0"
install-ChocolateyPackage -packageName 'bugShooting' -fileType 'exe' -silentArgs $silentOptions -url  'http://www.bugshooting.com/Home/Download?Mode=Start'