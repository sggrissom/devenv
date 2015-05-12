
$startupFolder = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Startup"
$startupBatchPath = $startupFolder + "\startup.bat"
$desktopFolder = $env:USERPROFILE + "\Desktop"
$cmdLink = $desktopFolder + "\cmd.lnk"
$emacsConfigLink = "w:\.emacs.d"
$emacsPath = $env:ProgramW6432 + '\emacs'

if (Test-Path $emacsConfigLink){
    cmd /c rmdir $emacsConfigLink
}

cmd /c subst /d w:

if (Test-Path $startupBatchPath){
    cmd /c rmdir $startupBatchPath
}

if (Test-Path $cmdLink){
    Remove-Item -force $cmdLink
}

if (Test-Path $emacsPath){
    Remove-Item -force -recurse $emacsPath
}