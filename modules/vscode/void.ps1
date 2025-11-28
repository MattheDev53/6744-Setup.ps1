function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/void"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory | Out-Null
	}

	if (!(Test-Path $resDir/void.zip)) {
		Patch-VSCode
	}

	Copy-Item $resDir/void.zip -Destination $HOME/Downloads/VSCode.zip
}

function Patch-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/void"

	if (!(Test-Path $resDir/void)) {
		Extract-VSCode
	}

	Write-Output "|> Patching Void"
	Rename-Item $resDir/void-extracted/bin/void.cmd code.cmd
	Copy-Item $resDir/void-extracted/Void.exe $resDir/void/Code.exe
	Compress-Archive $resDir/void-extracted/* -DestinationPath $resDir/void-patched.zip
}

function Extract-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/void"

	if (!(Test-Path $resDir/void.exe)) {
		Download-VSCode
	}
	
	Write-Output "|> Extracting Void"
	Write-Output "!: Install the program at $resDir/void-extracted"
	Start-Process $resDir/void.exe -Wait
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/void"

	Write-Output "|> Downloading Void"
	Invoke-WebRequest "https://github.com/voideditor/binaries/releases/download/1.99.30044/VoidSetup-x64-1.99.30044.exe" -Outfile $resDir/void.exe
}
