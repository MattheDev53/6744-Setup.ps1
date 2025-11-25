function Get-VSCodePreference {
	<#
.DESCRIPTION
Get-VSCodePreference gets the user's prefered version of VSCode

.OUTPUTS
Outputs the module path of the cursor selected from /modules/vscode/ (Defaults to VSCode)
	#>
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
		0 {return "vscode"}
		1 {return "VSCode Insider"}
		2 {return "VSCodium"}
	}
}
