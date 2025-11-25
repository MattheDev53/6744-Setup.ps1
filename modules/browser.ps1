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
