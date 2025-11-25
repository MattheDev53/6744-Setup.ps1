function Install-Mouse {
	Write-Output "|> Downloading Posy's Improved Cursors"
	Invoke-WebRequest "https://www.michieldb.nl/other/cursors/Posy's%20Cursor%20Black.zip" -OutFile mouse.zip

	Write-Output "|> Unzipping the cursor files"
	Expand-Archive .\mouse.zip

	Write-Output "|> Deleting the original zip file"
	Remove-Item .\mouse.zip

	Write-Output "|> Running cursor installation file"
	Start-Process ".\mouse\Posy's Cursor Black\_install Posy Black.inf" -Verb Install -Wait

	Write-Output "|> Removing cursor files"
	Remove-Item .\mouse -Recurse -Force
}
