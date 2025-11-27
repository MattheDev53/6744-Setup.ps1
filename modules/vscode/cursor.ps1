function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/cursor"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory | Out-Null
	}

	if (!(Test-Path $resDir/cursor.zip)) {
		Patch-VSCode
	}

	Copy-Item $resDir/cursor.zip -Destination $HOME/Downloads/VSCode.zip
}

function Patch-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/cursor"

	if (!(Test-Path $resDir/cursor)) {
		Extract-VSCode
	}

	Write-Output "|> Patching Cursor"
	New-Item $resDir/bin/code.cmd
	Add-Content = $resDir/bin/code.cmd "@echo off`nsetlocal`nset VSCODE_DEV=`nset ELECTRON_RUN_AS_NODE=1`n`"%~dp0..\Code.exe`" `"%~dp0..\resources\app\out\cli.js`" %*`nIF %ERRORLEVEL% NEQ 0 EXIT /b %ERRORLEVEL%`nendlocal"
	Rename-Item $resDir/vscodium-extracted/VSCodium.exe Code.exe
	Compress-Archive $resDir/cursor-extracted/* -DestinationPath $resDir/cursor-patched.zip

}

function Extract-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/cursor"

	if (!(Test-Path $resDir/cursor.exe)) {
		Download-VSCode
	}
	
	Write-Output "|> Extracting Cursor"
	Write-Output "!: Install the program at $resDir/cursor-extracted"
	Start-Process $resDir/cursor.exe -Wait
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/cursor"

	Write-Output "|> Downloading Cursor"
	Invoke-WebRequest "" -Outfile $resDir/cursor.exe
}
