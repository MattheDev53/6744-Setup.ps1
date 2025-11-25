function Get-MousePreference {
	<#
.DESCRIPTION
Get-MousePreference gets the user's prefered cursor

.OUTPUTS
Outputs the module path of the cursor selected from /modules/mouse/ (No Defaults)
	#>
	$choices = @(
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&No Cursor",
				"Does not install a new cursor"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"&Posy Cursor",
				"Posy's improved cursors for Windows"
			)),
			(New-Object System.Management.Automation.Host.ChoiceDescription(
				"Posy Cursor &Dark",
				"Posy's improved cursors for Windows"
			))
	)
	$choice = $host.ui.PromptForChoice("Mouse Cursor Selection","Select a Cursor",$choices,-1)
	switch ( $choice ) {
		0 {return "none"}
		1 {return "posy/default"}
		2 {return "posy/dark"}
	}
}
