@echo off
setlocal
set /p login="Enter username: "
set /p pass="Enter password: "
net user %login% %pass% /add > nul || goto :not_an_admin
set /p admin="Is admin (Y/N)? "
if "%admin%"=="y" net localgroup Administrators %login% /add > nul || goto :group_not_found
echo Success!
exit /b 0

:not_an_admin
exit /b 1

:group_not_found
net user %login% /delete > nul
exit /b 2
