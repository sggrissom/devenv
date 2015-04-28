@echo off

OPENFILES >nul 2>nul
IF ERRORLEVEL 1 (
   ECHO.This script must be run as administrator.
   PAUSE
   GOTO :eof
   )

copy startup.bat "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
call startup.bat
mklink /D w:\.emacs.d w:\devenv\.emacs.d

set TARGET='%windir%\system32\cmd.exe'
set SHORTCUT='C:\Users\steve ctr grissom\Desktop\cmd.lnk'
set ARGUMENTS='/k w:\devenv\bin\shell.bat'
set STARTIN='w:\'

set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell;$S = $ws.CreateShortcut(%SHORTCUT%);$S.TargetPath = %TARGET%;$S.Arguments = %ARGUMENTS%;$S.WorkingDirectory = %STARTIN%;$S.Save()"