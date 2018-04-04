@echo off
setlocal
set /p login="Enter username: "
set /p pass="Enter password: "
net user %login% %pass% /add > nul || goto :not_an_admin
set /p admin="Is admin (Y/N)? "
if "%admin%"=="y" net localgroup Administrators %login% /add > nul
echo Success!
exit /b 0

:not_an_admin
exit /b 1
