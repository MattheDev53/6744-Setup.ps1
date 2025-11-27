function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/vscodium"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory
	}

	if (!(Test-Path $resDir/vscodium-patched.zip)) {
		Patch-VSCode
	}

	Copy-Item $resDir/vscode.zip -Destination $HOME/Downloads/VSCode.zip
}

function Patch-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/vscodium"

	if (!(Test-Path $resDir/vscodium-extracted)) {
		Extract-VSCode
	}

	Write-Output "|> Patching VSCodium"
	Rename-Item $resDir/vscodium-extracted/bin/codium.cmd code.cmd
	Rename-Item $resDir/vscodium-extracted/VSCodium.exe Code.exe
	Compress-Archive $resDir/vscodium-extracted/* -DestinationPath $resDir/vscodium-patched.zip

}

function Extract-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/vscodium"

	if (!(Test-Path $resDir/vscodium.zip)) {
		Download-VSCode
	}
	
	Write-Output "|> Extracting VSCodium"
	Expand-Archive $resDir/vscodium.zip -DestinationPath $resDir/vscodium-extracted
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/vscodium"

	Write-Output "|> Downloading VSCodium"
	Invoke-WebRequest "https://github.com/VSCodium/vscodium/releases/download/1.106.27818/VSCodium-win32-x64-1.106.27818.zip" -Outfile $resDir/vscodium.zip
}
