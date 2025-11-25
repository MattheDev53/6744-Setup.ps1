. ./modules/browser.ps1
. ./modules/vscode/selection.ps1
. ./modules/mouse/selection.ps1
. ./modules/font/selection.ps1
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

. ./modules/font/$font.ps1
. ./modules/mouse/$mouse.ps1
. ./modules/vscode/$vscode.ps1

$tasks = 7
$doingTask = 0

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing $font"
Install-Font

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing $cursor"
Install-Cursor

$doingTask++
Write-Output "Task $doingTask/$tasks: Downloading VSCode"
Install-VSCode

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing Browser"
winget install $browser

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing Non-WPILib Apps"

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing WPILib"

$doingTask++
Write-Output "Task $doingTask/$tasks: Installing NI Gametools"
