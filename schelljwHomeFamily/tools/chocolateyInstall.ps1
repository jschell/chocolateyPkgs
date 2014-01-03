try 
{
    Install-WindowsUpdate -getUpdatesFromMS -acceptEula -surpressReboots
    disable-UAC 
    
    # update-executionPolicy -policy bypass

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

    $firefox = dir $env:ProgramFiles,"$env:ProgramFiles (x86)" -recurse firefox.exe | select -first 1
    install-chocolateyPinnedTaskBarItem $firefox.fullName

    $notepadpp = dir $env:ProgramFiles,"$env:ProgramFiles (x86)" -recurse notepad++.exe
    install-chocolateyPinnedTaskBarItem $notepadpp.fullName
    # install-chocolateyFileAssociation ".txt" $notepadpp.fullName

    install-chocolateyPinnedTaskBarItem 'C:\Windows\System32\taskmgr.exe'

    enable-UAC
}
catch 
{
    Write-ChocolateyFailure 'schelljw.Home.Family' $($_.Exception.Message)
    throw
}