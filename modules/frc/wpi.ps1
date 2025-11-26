function Install-WPILib {
	$RealRoot = $PSScriptRoot/../../
	$frcFolder = $RealRoot/offline/frc

	# I Can't install WPILib if It isn't extracted
	if (!(Test-Path $frcFolder/wpi-extracted)) {
		Extract-WPILib
	}
	Write-Output "|> Running WPILib Installer "
	Write-Output "!: At the VSCode Stage of the installer, choose `"Select...`""
	Write-Output "!: When prompted to select an archive, use $HOME\Downloads\VSCode.zip"
}

function Download-WPILib {
	$RealRoot = $PSScriptRoot/../../
	$frcFolder = $RealRoot/offline/frc

	Write-Output "|> Downloading WPILib Installer ISO"
	Invoke-WebRequest "https://packages.wpilib.workers.dev/installer/v2026.1.1-beta-1/Win64/WPILib_Windows-2026.1.1-beta-1.iso" -OutFile $frcFolder/wpi.iso
}

function Extract-WPILib {
	$RealRoot = $PSScriptRoot/../../
	$frcFolder = $RealRoot/offline/frc

	# I can't extract WPILib if I don't have the ISO
	if (!(Test-Path $frcFolder/wpi.iso)) {
		Download-WPILib
	}

	# Expand-Archive doesn't work on ISOs and I
	# want this to be pure Powershell with no
	# external dependencies outside of a fresh
	# windows install, so I had to get creative
	

	# Saves the info about the disk image for later
	Write-Output "|> Mounting WPILib ISO"
  $mount = Mount-DiskImage $frcFolder/wpi.iso
	# Get all of the FILESYSTEM drives
	#
	# (Powershell is weird. Try running
	# `Get-PSDrive` alone. Yeah, I know. Weird
	Write-Output "|> Getting Drives"
  $disks = Get-PSDrive -PSProvider FileSystem

	# $disks is an array of the drives
  $disks | ForEach-Object {
		# Since the ISO hasn't changed size since mounting (i hope)
		# we can easily tell which drive the iso is mounted to
		Write-Output "|> Checking $($_.Root)"
    if ( $_.Used.Equals($mount.FileSize)) {
      $wpiDrive = $_.Root # Drive Letter
    }
  }

	Write-Output "|> ISO Mount Point found at $wpiDrive"

	# This just copies all of the files in the ISO to a folder for later
  ls $wpiDrive | ForEach-Object {
		Write-Output "|> Installing $_"
    Copy-Item $wpiDrive/$_ -Destination $frcFolder/wpi-extracted/$_
  }
}
