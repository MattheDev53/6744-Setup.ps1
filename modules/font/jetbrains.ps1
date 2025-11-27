function Install-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/font/jetbrains/"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory
	}

	if (!(Test-Path $resDir/extracted/)) {
		Extract-Font
	}

	Write-Output "|> Installing All JetBrains Mono Fonts"
	Get-ChildItem -Path $resDir\extracted\font\fonts\ttf | ForEach-Object {
			Write-Output "|> Installing $_"
			Copy-Item $_ "C:\Windows\Fonts"
		
			#register font for all users
			New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name
		}
}

function Extract-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/font/jetbrains/"

	if (!(Test-Path $resDir/font.zip)) {
		Download-Font
	}
	
	Write-Output "|> Extracting JetBrains Mono"
	Expand-Archive $resDir/font.zip -DestinationPath $resDir/extracted
}

function Download-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = "$RealRoot/offline/font/jetbrains/"

	Write-Output "|> Downloading JetBrains Mono"
	Invoke-WebRequest "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -OutFile $resDir/font.zip
}
