
$emacsURL = 'http://ftp.kaist.ac.kr/gnu/gnu/emacs/windows/emacs-24.5-bin-i686-mingw32.zip'
$emacsPath = $env:ProgramW6432 + '\emacs'
$emacsZip = 'w:\devenv\bin\emacs.zip'

if (-NOT (Test-Path $emacsPath)){

    mkdir $emacsPath

    if (-NOT (Test-Path $emacsZip)){
	Invoke-WebRequest $emacsURL -OutFile emacs.zip
    }

    $ws = new-object -com shell.application
    $zip = $ws.NameSpace($emacsZip)
    foreach($item in $zip.items())
    {
 	$ws.Namespace($emacsPath).copyhere($item)
    }

    Remove-Item -force $emacsZip

}
