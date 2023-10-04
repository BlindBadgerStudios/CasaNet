:: Use this script to add alternate NETBIOS names for a system (in addition to the server's actual name)
:: Usage: script.bat name1 name2
:: Credit: https://dimitri.janczak.net/2016/09/26/multiple-server-names-on-windows/
@echo off
if "%1"=="" goto :us
set p=%*
set p0=%p: =\0%
reg add HKLM\system\currentcontrolset\services\DNSCache\parameters /v AlternateComputerNames /t REG_MULTI_SZ /d %p0% /f
echo Please run ipconfig /registerdns when you want new DNS Names to appear
goto :eof
:us
echo %~n0 name1 name2... nameN
echo makes this computer responds to name1, .. nameN as DNS name in addition to its very own name.