function Install-Packages {
	$packages @(
		"REVRobotics.REVHardwareClient"
		"9NVV4PWDW27Z", # Phoenix Tuner X (From MS Store)
		"9NQBKB5DW909"  # Pathplanner     (From MS Store)
		# "grapplerobotics.GrappleHook" # Not on winget yet
	)
	$packages | ForEach-Object {
		Write-Output "Installing $_"
	  winget install $_ --silent --accept-source-agreements --accept-package-agreements
	}
}
