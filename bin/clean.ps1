
$startupFolder = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Startup"
$startupBatchPath = $startupFolder + "\startup.bat"
$desktopFolder = $env:USERPROFILE + "\Desktop"
$cmdLink = $desktopFolder + "\cmd.lnk"
$emacsConfigLink = "w:\.emacs.d"

if (Test-Path $emacsConfigLink){
    cmd /c rmdir $emacsConfigLink
}

cmd /c subst /d w:

if (Test-Path $startupBatchPath){
    Remove-Item $startupBatchPath
}

if (Test-Path $cmdLink){
    Remove-Item $cmdLink
}

