function Install-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/antigravity"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory | Out-Null
	}

	if (!(Test-Path $resDir/antigravity.zip)) {
		Patch-VSCode
	}

	Copy-Item $resDir/antigravity.zip -Destination $HOME/Downloads/VSCode.zip
}

function Patch-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/antigravity"

	if (!(Test-Path $resDir/antigravity)) {
		Extract-VSCode
	}

	Write-Output "|> Patching Google Antigravity"
	Rename-Item $resDir/antigravity-extracted/bin/antigravity.cmd code.cmd
	Copy-Item $resDir/antigravity-extracted/Antigravity.exe $resDir/antigravity/Code.exe
	Compress-Archive $resDir/antigravity-extracted/* -DestinationPath $resDir/antigravity-patched.zip

}

function Extract-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/antigravity"

	if (!(Test-Path $resDir/antigravity.exe)) {
		Download-VSCode
	}
	
	Write-Output "|> Extracting Google Antigravity"
	Write-Output "!: Install the program at $resDir/antigravity-extracted"
	Start-Process $resDir/antigravity.exe -Wait
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/antigravity"

	Write-Output "|> Downloading Google Antigravity"
	Invoke-WebRequest "" -Outfile $resDir/antigravity.exe
}
