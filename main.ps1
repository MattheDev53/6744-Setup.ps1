function Get-BrowserPreference {
	<#
.DESCRIPTION
Get-BrowserPreference gets the user's prefered browser

.OUTPUTS
Outputs the WinGet ID of the browser selected (Defaults to Edge)
	#>
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Edge",
				"No new browser is installed"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Zen Browser",
				"Installs Zen Browser"
			))
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Firefox",
				"Installs Firefox"
			))
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"Chrom&ium",
				"Installs Chromium"
			))
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Chrome",
				"Installs Chrome"
			))
	)
	$choice = $host.ui.PromptForChoice("Browser Selection","Select a Browser",$choices,0)
	switch ( $choice ) {
		0 {return "Microsoft.Edge"}
		1 {return "Zen-Team.Zen-Browser"}
		2 {return "Mozilla.Firefox"}
		3 {return "Hibbiki.Chromium"}
		4 {return "Google.Chrome"}
	}
}

# Make sure the directory is consistent
Set-Location ~/

Write-Output @"
   _____      ___    ____            _____
  / ___/___  /   |  / __ \_________ / ___/
  \__ \/ _ \/ /| | / /_/ / ___/ __ \\__ \ 
 ___/ /  __/ ___ |/ ____/ /  / /_/ /__/ / 
/____/\___/_/  |_/_/   /_/   \____/____/  

[Se]mi
[A]utonomous
[Pro]visioning
[S]ystem

Built by MattheDev53 <matthew.c.albrecht@gmail.com>
To be Licensed under AGPL-3.0
"@

$tasks = 2
$doingTask = 0

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing JetBrains Mono"

Write-Output "[Task #$doingTask] Downloading JetBrains Mono"
Invoke-WebRequest "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -OutFile font.zip

Write-Output "[Task #$doingTask] Unzipping the font files"
Expand-Archive .\font.zip

Write-Output "[Task #$doingTask] Deleting the original zip file"
Remove-Item font.zip # Clean up the zip file

Write-Output "[Task #$doingTask] Installing Fonts"
Get-ChildItem -Path .\font\fonts\ttf | ForEach-Object {
    Write-Output "Installing $_"
    Copy-Item $_ "C:\Windows\Fonts"
  
    #register font for all users
    New-ItemProperty -Name $_.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $_.name}
Write-Output "[Task #$doingTask] Removing original font files"
Remove-Item .\font -Recurse -Force

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing Posy's Improved Cursors"

Write-Output "[Task #$doingTask] Downloading Posy's Improved Cursors"
Invoke-WebRequest "https://www.michieldb.nl/other/cursors/Posy's%20Cursor%20Black.zip" -OutFile mouse.zip

Write-Output "[Task #$doingTask] Unzipping the cursor files"
Expand-Archive .\mouse.zip

Write-Output "[Task #$doingTask] Deleting the original zip file"
Remove-Item .\mouse.zip

Write-Output "[Task #$doingTask] Running cursor installation file"
Start-Process ".\mouse\Posy's Cursor Black\_install Posy Black.inf" -Verb Install -Wait

Write-Output "[Task #$doingTask] Removing cursor files"
Remove-Item .\mouse -Recurse -Force

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing Apps"

# Write-Output "[Task #$doingTask] ..."

