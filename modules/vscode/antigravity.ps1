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
	Write-Output "!: Follow the below instructions carefully"
	Write-Output "!: At Step 2: Install the program at $resDir/void-extracted"
	Write-Output "!: At Step 3: Check `"Don't Create a Start Menu Folder`""
	Write-Output "!: At Step 4: Uncheck all boxes"
	Start-Process $resDir/antigravity.exe -Wait
}

function Download-VSCode {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/vscode/antigravity"

	Write-Output "|> Downloading Google Antigravity"
	Invoke-WebRequest "" -Outfile $resDir/antigravity.exe
}
