# Make sure the directory is consistent
Set-Location ~/

Invoke-WebRequest "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -OutFile font.zip
Expand-Archive .\font.zip
Remove-Item font.zip # Clean up the zip file
Get-ChildItem -Path .\font\fonts\ttf | ForEach-Object {
    Write-Output "Installing $_"
    Copy-Item $_ "C:\Windows\Fonts"
  
    #register font for all users
    New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name}
Remove-Item .\font -Recurse -Force

Invoke-WebRequest "https://www.michieldb.nl/other/cursors/Posy's%20Cursor%20Black.zip" -OutFile mouse.zip
Expand-Archive .\mouse.zip
Remove-Item .\mouse.zip
Start-Process ".\mouse\Posy's Cursor Black\_install Posy Black.inf" -Verb Install

