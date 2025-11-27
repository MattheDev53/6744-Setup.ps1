function Install-Mouse {
	$RealRoot = "$PSScriptRoot/../../../"
	$resDir = "$RealRoot/offline/mouse/posy/dark/"

	if (!(Test-Path $resDir)) {
		New-Item $resDir -ItemType Directory | Out-Null
	}

	if (!(Test-Path $resDir/extracted/)) {
		Extract-Mouse
	}

	Write-Output "|> Running cursor installation file"
	Start-Process "$resDir\extracted\Posy's Cursor Black\_install Posy Black.inf" -Verb Install -Wait
}

function Extract-Mouse {
	$RealRoot = "$PSScriptRoot/../../../"
	$resDir = "$RealRoot/offline/mouse/posy/dark/"

	if (!(Test-Path $resDir/font.zip)) {
		Download-Mouse
	}
	
	Write-Output "|> Extracting Posy Cursor Dark"
	Expand-Archive $resDir/mouse.zip -DestinationPath $resDir/extracted
}

function Download-Mouse {
	$RealRoot = "$PSScriptRoot/../../../"
	$resDir = "$RealRoot/offline/mouse/posy/dark/"

	Write-Output "|> Downloading Posy Cursor Dark"
	Invoke-WebRequest "https://www.michieldb.nl/other/cursors/Posy's%20Cursor%20Black.zip" -OutFile $resDir/mouse.zip
}
