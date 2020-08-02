@echo off
cls
:menu
cls
color 2
 
date /t
REM desenvolvido por Jazzs 
echo Computador: %computername%        Usuario: %username%
                   
echo            MENU TAREFAS
echo  ==================================
echo * 0. SAIR                           **
echo * 1. Ping                           **
echo * 2. IPconfig                       **
echo * 3. Nslookup                       **
echo * 4. Tracert                        **
echo * 5. Limpeza appdata temp           **
echo * 6. Limpeza windows temp           **
echo * 7. GPUPDATE                       **
echo * 8. Limpeza de senha               **
echo * 9. Net user                       **
echo * 10. Internet Explorer RESET       **
echo * 11. Spooler de impressar RESET    **
echo * 12. WEBSENSE STOP/START           **
echo * 13. Websense reinstalacao         **
echo * 14. Correcao do CHROMME           **
echo * 15. Ambientes SAP Atualizados     **
echo * 16. Outlook Reset Full            **
echo * 17. Limpeza de Disco              **
echo * 18. DESGRAGMENTAR                 **
echo * 19. CHKDSK                        **
echo * 20. SFC /SCANNOW                  **
echo * 21. Reiniciando remotamente       **

echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 0 goto opcao0
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% equ 11 goto opcao11
if %opcao% equ 12 goto opcao12
if %opcao% equ 13 goto opcao13
if %opcao% equ 14 goto opcao14
if %opcao% equ 15 goto opcao15
if %opcao% equ 16 goto opcao16
if %opcao% equ 17 goto opcao17
if %opcao% equ 18 goto opcao18
if %opcao% equ 19 goto opcao19
if %opcao% equ 20 goto opcao20
if %opcao% equ 21 goto opcao21

:opcao0
cls
exit


:opcao1
cls
set /p var= Endereco de IP 
ping %var%
echo ==================================
echo *      PING                       *
echo ==================================
pause
goto menu

:opcao2
cls
ipconfig 
echo ==================================
echo *      IPConfig                   *
echo ==================================
pause
goto menu

:opcao3
cls
set /p var= Endereco de IP 
nslookup %var%
echo ==================================
echo *     nslookup                    *
echo ==================================
pause
goto menu

:opcao4
cls
set /p var= Endereco de IP 
tracert %var%
echo ==================================
echo *     Tracert                     *
echo ==================================
pause
goto menu

:opcao5
cls
rd /q /s %temp%
echo ==================================
echo *   limpeza da pasta APPDATATEMP  *
echo ==================================
pause
goto menu

:opcao6
cls       
rd /q /s C:\Windows\Temp
rd /q /s C:Windows\Downloaded Installations
echo ==================================
echo *     Limpeza windows temp        *
echo ==================================
pause
goto menu

:opcao7
cls
echo ==================================
echo *     GPUPDATE                    *
echo ==================================
GPUPDATE /FORCE
echo ==================================
echo *     GPUPDATE GPO ATUALIZADA     *
echo ==================================
pause
goto menu

:opcao8
cls
rundll32.exe keymgr.dll, KRShowKeyMgr
echo ==================================
echo *     Limpeza de senha            *
echo ==================================
pause
goto menu

:opcao9
cls
set /p var= Entre com o LOGIN 
net user %var% /domain
echo ==================================
echo *     Net user                    *
echo ==================================

pause
goto menu

:opcao10
cls
rundll32.exe inetcpl.cpl ResetIEtoDefaults
echo ==================================
echo *     Reset Full INTERNET EXPLORER*
echo ==================================
pause
goto menu

:opcao11
cls
net stop spooler
pause
echo Iniciando o Spooler
net start spooler
echo ==================================
echo *   Spooler de impressao RESET    *
echo ==================================
echo Interrompendo o Spooler
pause
goto menu

:opcao12
cls
rem pasta \\Softwares Padrao\Websense\FP_8.3
rem cd \\Softwares Padrao\Websense\FP_8.3\
MSIEXEC
cd "c:\Program Files\Websense\Websense Endpoint"
wepsvc -stop -password Websense#15 wspxy
wepsvc -stop -password GJDUR35213kjsdfFNFVKN23 wspxy
pause
MSIEXEC
cd "c:\Program Files\Websense\Websense Endpoint"
wepsvc -start -password Websense#15 wspxy
wepsvc -start -password GJDUR35213kjsdfFNFVKN23 wspxy
echo ==================================
echo * STOP/START WEBSENSE             *
echo ==================================
pause
goto menu

:opcao13
cls
rem Fecha o Chrome Aberto
taskkill /im chrome.exe
rem renomeia a pasta appdata Chrome para .old
ren "%LOCALAPPDATA%\Google" Google.old
rem inicia o Chrome
start chrome
echo ==================================
echo *     Correcao do CHROMME         *
echo ==================================
pause
goto menu

:opcao14
cls
rem Fecha o Chrome Aberto
taskkill /im chrome.exe
rem renomeia a pasta appdata Chrome para .old
ren "%LOCALAPPDATA%\Google" Google.old
rem inicia o Chrome
start chrome
echo ==================================
echo *     Correcao do CHROMME         *
echo ==================================
pause
goto menu

:opcao15
cls
start run Outlook /resetnavpane
echo ==================================
echo *     Outlook reset   *
echo ==================================
pause
goto menu
:opcao16
cls
start run Outlook /resetnavpane
echo ==================================
echo *     Outlook reset   *
echo ==================================
pause
goto menu

:opcao17
cls
%SystemRoot%\System32\cmd.exe /c Cleanmgr /sageset:65535&Cleanmgr /sagerun:65535
echo ==================================
echo *     Limpeza de disco            *
echo ==================================
pause
goto menu

:opcao18
cls
defrag C: -f -v
echo ==================================
echo *     DESGRAGMENTAR               *
echo ==================================
pause
goto menu


:opcao19
cls
chkdsk c: /r /f
echo ==================================
echo *     CHKDSK                      *
echo ==================================
cls
pause
goto menu

:opcao20
cls
sfc /scannow 
echo ==================================
echo *     SFC /SCANNOW                *
echo ==================================
cls
pause
goto menu

:opcao21
cls
set /p var= Endereco de IP/ Nº da maquina 
shutdown -r -t 00 /m \\%var%
echo ==================================
echo * Reiniciando Maquina remotamente *
echo ==================================
pause
cls
goto menu


