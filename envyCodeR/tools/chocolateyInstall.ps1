try {
  $package = 'EnvyCodeR'

  $fontUrl = 'http://damieng.com/downloads/latest/EnvyCodeR'
  $destination = Join-Path $Env:Temp 'EnvyCodeR'

  Install-ChocolateyZipPackage $package -url $fontUrl -unzipLocation $destination

  $shell = New-Object -ComObject Shell.Application
  $fontsFolder = $shell.Namespace(0x14)

  Get-ChildItem $destination -Recurse -Filter *.ttf |
    % { $fontsFolder.CopyHere($_.FullName) }

  Remove-Item $destination -Recurse

  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
