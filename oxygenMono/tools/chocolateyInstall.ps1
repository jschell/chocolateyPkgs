try {
  $package = 'OxygenMono'

  $fontUrl = 'http://www.fontsquirrel.com/fonts/download/oxygen-mono'
  $destination = Join-Path $Env:Temp 'OxygenMono'

  Install-ChocolateyZipPackage $package -url $fontUrl -unzipLocation $destination

  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)

  Get-ChildItem $destination -Recurse -Filter *.otf |
    % { $fontsFolder.CopyHere($_.FullName) }

  Remove-Item $destination -Recurse

  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
