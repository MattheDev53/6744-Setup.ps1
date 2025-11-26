function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$vscodeDir = "$RealRoot/offline/vscode/"
	if (!(Test-Path $vscodeDir/vscode.zip)) {
		Write-Output "|> Downloading VSCode"
		Invoke-WebRequest "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -Outfile $vscodeDir/vscode.zip
	}
	Copy-Item $vscodeDir/vscode.zip -Destination $HOME/Downloads/VSCode.zip
}
