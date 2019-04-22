# CP/S
# Control Program/script
# ----------------------

# CP/S logging.
$CPSLOGS = "SET-ME-TO-LOG-LOCATION\CPS-$(Get-Date -UFormat "%d.%m.%Y")-$(Get-Random).txt"
Start-Transcript -Path $CPSLOGS
# DO NOT MODIFY! Otherwise dead scrpt...
$ORIG = $PWD
$PSROOT = "SET-ME-TO-DESTINATION-LOCATION"
Set-Location $PSROOT
$PSCommandRoot = "SET-ME-TO-SCRIPT-LOCATION"
Write-Output "CP/S variables have been set. Continuing to modules."
$host.ui.RawUI.WindowTitle = "CP/S" # Not ded for this modified. Unless you change --> $host.ui.RawUI.WindowTitle

# Channel variables
# 0 = On.
# 1 = Off.

$MODULE = 1


# ---------------------

# Output set directories for the logs.
Write-Host "Output the set directories..."
Write-Host "::SCRIPTS"
Write-Host $PSCommandRoot
Write-Host " ----------- "
Write-Host "             "
Write-Host "::CP/S"
Write-Host $ORIG
Write-Host " ----------- "
Write-Host "             "
Write-Host "::CP/S LOGS"
Write-Host $CPSLOGS
Write-Host " ----------- "
Write-Host "             "
Write-Host "::ARCHIVE"
Write-Host $PSRoot
Write-Host " ----------- "
Write-Host "             "

# CP/S

# Download modules.
if ($MODULE -eq 0) {
   # Run once output.
    & $PSCommandRoot'.\SCRIPTNAME.ps1'
} else {
  Write-Host "Disabled module detected. Skipping."
  $PWD
}

$host.ui.RawUI.WindowTitle = "CP/S" # See warnings at the of file.

Set-Location $ORIG # JMP: Jump back.
Write-Host ""
Write-Host ""
Stop-Transcript
Stop-Transcript
Write-Host ""
Write-Host ""
Write-Host "CP/S has finished running. Please check module logs for error(s) and or CP/S logs."


# MODULE TEMPLATE:
#if ($MODULE -eq 0) {
   # Run once output.
#    & $PSCommandRoot'.\MODULE.ps1'
#} else {
#  Write-Host "Disabled module detected. Skipping."
#  $PWD
#}

  #EOF:
