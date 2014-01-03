try 
{
    Install-WindowsUpdate -getUpdatesFromMS -acceptEula -surpressReboots
    disable-UAC 
    Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
    enable-RemoteDesktop

    update-executionPolicy -policy bypass

    # Chocolatey Installation...
    # cup all

    cinst googleChrome
    cinst firefox

    cinst virtualCloneDrive
    cinst 7zip
    cinst sumatraPDF
    cinst notepadplusplus

    cinst flashplayeractivex 
    cinst flashplayerplugin 
    cinst adobeAir
    cinst quicktime
    cinst silverlight

    cinst paint.net
    cinst dropbox
    cinst passwordsafe
    cinst teamviewer
    cinst f.lux

    cinst itunes
    
    # work related
    cinst dotnet4.0
    cinst dotnet4.5.1
    cinst powershell4
    
    cinst imgburn
    cinst nugetPackageExplorer
    cinst putty
    
    
    $firefox = dir $env:ProgramFiles,"$env:ProgramFiles (x86)" -recurse firefox.exe | select -first 1
    install-chocolateyPinnedTaskBarItem $firefox.fullName

    $notepadpp = dir $env:ProgramFiles,"$env:ProgramFiles (x86)" -recurse notepad++.exe
    install-chocolateyPinnedTaskBarItem $notepadpp.fullName
    install-chocolateyFileAssociation ".txt" $notepadpp.fullName

    install-chocolateyPinnedTaskBarItem 'C:\Windows\System32\taskmgr.exe'

}
catch 
{
    Write-ChocolateyFailure 'schelljw.Home.Core' $($_.Exception.Message)
    throw
}