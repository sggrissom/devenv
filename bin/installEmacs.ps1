
$emacsURL = 'http://ftp.kaist.ac.kr/gnu/gnu/emacs/windows/emacs-24.5-bin-i686-mingw32.zip'
$emacsPath = $env:ProgramW6432 + '\emacs'

if (-NOT (Test-Path $emacsPath)){

	mkdir $emacsPath

	if (-NOT (Test-Path w:\devenv\bin\emacs.zip)){
		Invoke-WebRequest $emacsURL -OutFile emacs.zip
	}

	$ws = new-object -com shell.application
	$zip = $ws.NameSpace("w:\devenv\bin\emacs.zip")
	foreach($item in $zip.items())
	{
 	   $ws.Namespace($emacsPath).copyhere($item)
	}
}