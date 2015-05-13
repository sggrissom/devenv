
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!'nPlease re-run this script as an Administrator!"
    Break
}

$currentPath = Split-Path $MyInvocation.MyCommand.Path
$parentPath = Split-Path $currentPath
$parentPath = Split-Path $parentPath
$startupFolder = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Startup"
$startupBatchPath = $startupFolder + "\startup.bat"
$desktopFolder = $env:USERPROFILE + "\Desktop"
$cmdLink = $desktopFolder + "\cmd.lnk"
$cmdPath = $env:WINDIR + "\system32\cmd.exe"

if (-NOT ($env:home)){
$env:home = $parentPath
}

subst w: $env:home
New-Item $startupBatchPath -type file -force -value "subst w: $env:home"
cmd /c mklink /D w:\.emacs.d w:\devenv\.emacs.d

$ws = New-Object -ComObject WScript.Shell;
$S = $ws.CreateShortcut($cmdLink)
$S.TargetPath = $cmdPath
$S.Arguments = '/k w:\devenv\bin\shell.bat'
$S.WorkingDirectory = 'w:\'
$S.Save()

.\installGit.ps1
.\installEmacs.ps1
