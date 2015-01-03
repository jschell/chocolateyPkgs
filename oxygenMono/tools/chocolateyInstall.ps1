try 
{
    $packageName = 'oxygenmono'
    $url = 'http://www.fontsquirrel.com/fonts/download/oxygen-mono'

    $destination = Join-Path $Env:Temp $packageName

    Install-ChocolateyZipPackage $packageName -url $url -unzipLocation $destination

    $shell = New-Object -ComObject Shell.Application
    $fontsFolder = $shell.Namespace(0x14)

    Get-ChildItem $destination -Recurse -Filter *.otf |
        ForEach-Object { $fontsFolder.CopyHere($_.FullName) }

    Remove-Item $destination -Recurse

    Write-ChocolateySuccess $package
} 
catch 
{
    Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw
}
