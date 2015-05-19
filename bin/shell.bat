@echo off

set path=w:\bin;w:\devenv\bin;%path%
set home=w:\

call "%ProgramFiles(x86)%\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" x64
