@echo off
set updatetime=%date:~0% - %time:~0,8%
git add .
git commit -a -m "update - %updatetime%"
echo.
git push

pause