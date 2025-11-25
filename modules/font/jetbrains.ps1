function Install-Font {
	Write-Output "|> Downloading JetBrains Mono"
	Invoke-WebRequest "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -OutFile font.zip

	Write-Output "|> Unzipping the font files"
	Expand-Archive .\font.zip

	Write-Output "|> Deleting the original zip file"
	Remove-Item font.zip # Clean up the zip file

	Write-Output "|> Installing Fonts"
	Get-ChildItem -Path .\font\fonts\ttf | ForEach-Object {
			Write-Output "Installing $_"
			Copy-Item $_ "C:\Windows\Fonts"
		
			#register font for all users
			New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name}
	Write-Output "|> Removing original font files"
	Remove-Item .\font -Recurse -Force
}
