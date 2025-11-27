$mod = "$PSScriptRoot/modules"
. $mod/git.ps1
. $mod/browser.ps1
. $mod/packages.ps1

. $mod/frc/wpi.ps1
. $mod/frc/ni.ps1

. $mod/vscode/selection.ps1
. $mod/mouse/selection.ps1
. $mod/font/selection.ps1

# Make sure the directory is consistent
Set-Location $PSScriptRoot

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
Licensed under The AGPL-3.0
"@

$font = Get-FontPreference
$mouse = Get-MousePreference
$vscode = Get-VSCodePreference
$browser = Get-BrowserPreference

. $mod/font/$font.ps1
. $mod/mouse/$mouse.ps1
. $mod/vscode/$vscode.ps1

$tasks = 8
$doingTask = 0

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing $font"
Install-Font

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing $cursor"
Install-Cursor

$doingTask++
Write-Output "Task $doingTask/$tasks`: Downloading $vscode"
Install-VSCode

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing $browser"
winget install $browser --silent --accept-source-agreements --accept-package-agreements

$doingTask++
Write-Output "Task $doingTask/$tasks`: Configuring Git"
Configure-Git

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing Non-WPILib Apps"
Install-Packages

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing WPILib"
Install-WPILib

$doingTask++
Write-Output "Task $doingTask/$tasks`: Installing NI Gametools"
