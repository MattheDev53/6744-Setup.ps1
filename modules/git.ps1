function Configure-Git {
	winget install Git.Git --silent --accept-source-agreements --accept-package-agreements
	$gitName = Read-Host "Enter Your Git Username"
  	$gitMail = Read-Host "Enter Your Git Email"
	Add-Content = ~/.gitconfig "[user]`n`tname = $gitName`n`temail = $gitMail"
  if (!(Test-Path $HOME/.ssh/)) {
    New-Item $HOME/.ssh -ItemType Directory | Out-Null
  }
  ssh-keygen -q -f $HOME/.ssh/git-$gitName -C $gitMail
  
  Write-Output "Please copy and paste the key in your GitHub SSH Settings"
  Write-Output "1. Go to https://github.com/settings/profile"
  Write-Output "2. Click `"Add an SSH Key`""
  Write-Output "3. Paste the key"
  Write-Output "Close Notepad after you are finished to continue program execution"
  Start-Process notepad.exe ~/.ssh/git-$gitName.pub -Wait
}
