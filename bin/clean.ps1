
$startupFolder = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Startup"
$startupBatchPath = $startupFolder + "\startupLink.bat"
$desktopFolder = $env:USERPROFILE + "\Desktop"
$cmdLink = $desktopFolder + "\cmd.lnk"
$emacsConfigLink = "w:\.emacs.d"

if (Test-Path $emacsConfigLink){
    cmd /c rmdir $emacsConfigLink
}

if (Test-Path w:\){
	subst /d w:
}

if (Test-Path $startupBatchPath){
    Remove-Item -force $startupBatchPath
}

if (Test-Path $cmdLink){
    Remove-Item -force $cmdLink
}