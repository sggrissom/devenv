
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!'nPlease re-run this script as an Administrator!"
    Break
}

$homeDir = 'C:\dev'
$env:home = $homeDir
$devenv = $homeDir + '\devenv'
$devenvBin = $devenv + '\bin'
$configure = $devenvBin + '\configure.ps1'
$emacs = $devenvBin + '\emacs.bat'
$gitURL = 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/Git-1.9.5-preview20150319.exe'
$gitPath = ${env:ProgramFiles(x86)} + '\Git'
$git = $gitPath + '\bin\git.exe'
$gitDevenv = 'https://github.com/sggrissom/devenv.git'

if (-NOT (Test-Path $gitPath)){

    if (-NOT (Test-Path git.exe)){
	Invoke-WebRequest $gitURL -OutFile git.exe
    }

    .\git.exe -and Remove-Item -force git.exe | Out-Null
}

if (-Not (Test-Path $homeDir)){
    mkdir $homeDir
}

pushd

cd $homeDir

if (-Not (Test-Path $devenv)){
    & $git clone $gitDevenv | Out-Null
}

cd $devenvBin

& $configure

& $emacs

popd
