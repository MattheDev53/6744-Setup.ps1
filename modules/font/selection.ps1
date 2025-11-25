function Get-FontPreference {
	<#
.DESCRIPTION
Get-FontPreference gets the user's prefered font

.OUTPUTS
Outputs the module path of the font selected from /modules/font/ (No Defaults)
	#>
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&No Font",
				"Do not install a font"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&JetBrains Mono",
				"Monospace font from JetBrains"
			))
	)
	$choice = $host.ui.PromptForChoice("VSCode Version Selection","Select a Font",$choices,-1)
	switch ( $choice ) {
		0 {return "none"}
		1 {return "jetbrains"}
	}
}
