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

Write-Output "! [Notice] !"
Write-Output "|> You are running testing.ps1 as opposed to main.ps1, meaning this will     "
Write-Output "|> likely not install any new software or change system settings. On the off "
Write-Output "|> chance this file does something, please press <Ctrl+C> to terminate the   "
Write-Output "|> program before it starts making unexpected changes to your system. If you "
Write-Output "|> can read Powershell, have read this program, and know what it does, be my "
Write-Output "|> guest, but don't say I didn't warn you.                                   "
# Write-Output "|>                                                                           "
function Get-VSCodePreference {
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&VSCode",
				"Standard Version of VSCode"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"VSCode &Insider",
				"Experimental Build of VSCode"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"VSCodi&um",
				"Telemetry free build of VSCode"
			))
	)
	$choice = $host.ui.PromptForChoice("VSCode Version Selection","Select a Version",$choices,0)
	switch ( $choice ) {
		0 {return "VSCode"}
		1 {return "VSCode Insider"}
		2 {return "VSCodium"}
	}
}

function Inquire-LibraryDrive {
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Yes",
				"You have a WPILib ISO on D:\ that is named properly (faster)"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&No",
				"You do not have a WPILib ISO on D:\ or you want to install from the internet (slower)"
			))
	)
	$choice = $host.ui.PromptForChoice(
		"SeAProS Drive Query : WPILib",
		"Do you have a WPILib ISO on D:\ named ``wpi.iso``?",
		$choices,1
	)
	switch ( $choice ) {
		0 {return "Install from drive"}
		1 {return "Install from internet"}
	}
}
function Inquire-ToolsDrive {
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Yes",
				"You have the NI Game Tools Installer on D:\ that is named properly (faster)"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&No",
				"You do not have the NI Game Tools Installer on D:\ or you want to install from the internet (slower)"
			))
	)
	$choice = $host.ui.PromptForChoice(
		"SeAProS Drive Query : Game Tools",
		"Do you have the NI Game Tools Installer on D:\ named ``ni.exe``?",
		$choices,1
	)
	switch ( $choice ) {
		0 {return "Install from drive"}
		1 {return "Install from internet"}
	}
}

$foo = Inquire-LibraryDrive
Write-Output $foo
$bar = Inquire-ToolsDrive
Write-Output $bar
