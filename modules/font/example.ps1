function Install-Font {
	Write-Output "|> Downloading Font"

	# Replace the link to a direct download link to your file
	Invoke-WebRequest "https://example.com" -OutFile font.zip

	Write-Output "|> Unzipping the font files"
	Expand-Archive .\font.zip

	# Cleans up the zip file
	Write-Output "|> Deleting the original zip file"
	Remove-Item font.zip 

	Write-Output "|> Installing Fonts"
	Get-ChildItem -Path .\path\to\fonts\ | ForEach-Object {
			Write-Output "Installing $_"
			Copy-Item $_ "C:\Windows\Fonts"
		
			#register font for all users
			New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name}

	Write-Output "|> Removing original font files"
	Remove-Item .\font -Recurse -Force
}
