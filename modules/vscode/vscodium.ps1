function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$vscodeDir = $RealRoot/offline/vscode/

	if (!(Test-Path $vscodeDir/vscodium-patched.zip)) {
		Patch-VSCode
	}

	Copy-Item $vscodeDir/vscode.zip -Destination $HOME/Downloads/VSCode.zip
}

function Patch-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$vscodeDir = "$RealRoot/offline/vscode/"

	if (!(Test-Path $vscodeDir/vscodium-extracted)) {
		Extract-VSCode
	}

	Write-Output "|> Patching VSCodium"
	Rename-Item $vscodeDir/vscodium-extracted/bin/codium.cmd code.cmd
	Rename-Item $vscodeDir/vscodium-extracted/VSCodium.exe Code.exe
	Compress-Archive $vscodeDir/vscodium-extracted/* -DestinationPath $vscodeDir/vscodium-patched.zip

}

function Extract-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$vscodeDir = "$RealRoot/offline/vscode/"

	if (!(Test-Path $vscodeDir/vscodium.zip)) {
		Download-VSCode
	}
	
	Write-Output "|> Extracting VSCodium"
	Expand-Archive $vscodeDir/vscodium.zip -DestinationPath $vscodeDir/vscodium-extracted
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$vscodeDir = "$RealRoot/offline/vscode/"

	Write-Output "|> Downloading VSCodium"
	Invoke-WebRequest "https://github.com/VSCodium/vscodium/releases/download/1.106.27818/VSCodium-win32-x64-1.106.27818.zip" -Outfile $vscodeDir/vscodium.zip
}
