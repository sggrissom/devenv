
$gitURL = 'https://github.com/msysgit/msysgit/releases/download/Git-1.9.5-preview20150319/Git-1.9.5-preview20150319.exe'
$gitPath = ${env:ProgramFiles(x86)} + '\Git'

if (-NOT (Test-Path $gitPath)){

    if (-NOT (Test-Path git.exe)){
	Invoke-WebRequest $gitURL -OutFile git.exe
    }

    .\git.exe -and Remove-Item -force git.exe
}
