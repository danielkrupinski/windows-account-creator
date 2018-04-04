@echo off
setlocal
set /p login="Enter username: "
set /p pass="Enter password: "
net user %login% %pass% /add > nul
set /p admin="Is admin (Y/N)? "
if "%admin%"=="y" net localgroup Administrators %login% /add
exit /b 0
