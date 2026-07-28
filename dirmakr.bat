@echo off
set /p "MAIN=Enter Main Folder Name: "
set /p "SUB1=Enter First Subfolder Name: "
set /p "FILE1=Enter File Name inside %SUB1%: "
set /p "SUB2=Enter Second Subfolder Name: "
set /p "FILE2=Enter File Name inside %SUB2%: "

cls
title Command Prompt

echo Microsoft Windows [Version 10.0.26100.8875]
echo (c) Microsoft Corporation. All rights reserved.

cd /d "%USERPROFILE%"

call :run "cd desktop"

call :run "mkdir %MAIN%"
call :run "cd %MAIN%"

call :run "mkdir %SUB1% %SUB2%"

call :run "cd %SUB1%"
call :run "type nul > %FILE1%"
call :run "cd .."

call :run "cd %SUB2%"
call :run "type nul > %FILE2%"
call :run "cd .."

call :run "cd %SUB1%"
call :run "copy %FILE1% ..\%SUB2%\"
call :run "cd .."

call :run "cd .."

call :run "tree %MAIN% /F"

echo.
cmd /k
exit /b


:run
echo.
echo %CD%^>%~1
timeout /t 1 /nobreak >nul
call %~1
exit /b