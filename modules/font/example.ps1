function Install-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = $RealRoot/font/FONT/

	if (!(Test-Path $resDir/extracted/)) {
		Extract-Font
	}

	Write-Output "|> Installing All FONT Fonts"
	Get-ChildItem -Path $resDir\extracted\font\fonts\ttf | ForEach-Object {
			Write-Output "|> Installing $_"
			Copy-Item $_ "C:\Windows\Fonts"
		
			#register font for all users
			New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name}
		}
}

function Extract-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = $RealRoot/font/FONT/

	if (!(Test-Path $resDir/font.zip)) {
		Download-Font
	}
	
	Write-Output "|> Extracting FONT"
	Expand-Archive $resDir/font.zip -DestinationPath $resDir/extracted
}

function Download-Font {
	$RealRoot = "$PSScriptRoot/../../"
	$resDir = $RealRoot/font/FONT/

	Write-Output "|> Downloading FONT"
	Invoke-WebRequest "link/to/FONT/" -OutFile $resDir/font.zip
}
