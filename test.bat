@echo off
:: Starting port, you can change it
set /a port=10000
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F %%i IN (D:\\Prod APP\\His\\TempImageCLSID.list) DO (
echo %%i !port!
D:\\Prod APP\\His\\TempImage\\jp.exe -z -l !port! -c %%i >> result.log
set RET=!ERRORLEVEL!
:: echo !RET!
if "!RET!" == "1" set /a port=port+1
)