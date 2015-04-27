@echo off

REM cmd shortcut target: %windir%\system32\cmd.exe \k w:\devenv\bin\shell.bat

set path=w:\bin;w:\devenv\bin;%path%
set home=w:\
mklink /D w:\.emacs w:\devenv\.emacs