function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/default"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory | Out-Null
	}
	if (!(Test-Path $resDir/vscode.zip)) {
		Write-Output "|> Downloading VSCode"
		Invoke-WebRequest "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -Outfile $resDir/vscode.zip
	}
	Copy-Item $resDir/vscode.zip -Destination $HOME/Downloads/VSCode.zip
}
