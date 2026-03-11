@echo off
title CADASTRO DE CLIENTES
:inicio
cls
echo. 
echo.
echo  "/$$      /$$  /$$$$$$  /$$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$        /$$      /$$  /$$$$$$  /$$   /$$ /$$$$$$$$  /$$$$$$ 
echo "| $$$    /$$$ /$$__  $$| $$__  $$ /$$__  $$ /$$__  $$ /$$__  $$      | $$$    /$$$ /$$__  $$| $$$ | $$| $$_____/ /$$__  $$
echo "| $$$$  /$$$$| $$  \ $$| $$  \ $$| $$  \__/| $$  \ $$| $$  \__/      | $$$$  /$$$$| $$  \ $$| $$$$| $$| $$      | $$  \ $$
echo "| $$ $$/$$ $$| $$$$$$$$| $$$$$$$/| $$      | $$  | $$|  $$$$$$       | $$ $$/$$ $$| $$  | $$| $$ $$ $$| $$$$$   | $$$$$$$$
echo "| $$  $$$| $$| $$__  $$| $$__  $$| $$      | $$  | $$ \____  $$      | $$  $$$| $$| $$  | $$| $$  $$$$| $$__/   | $$__  $$
echo "| $$\  $ | $$| $$  | $$| $$  \ $$| $$    $$| $$  | $$ /$$  \ $$      | $$\  $ | $$| $$  | $$| $$\  $$$| $$      | $$  | $$
echo "| $$ \/  | $$| $$  | $$| $$  | $$|  $$$$$$/|  $$$$$$/|  $$$$$$/      | $$ \/  | $$|  $$$$$$/| $$ \  $$| $$$$$$$$| $$  | $$
echo "|__/     |__/|__/  |__/|__/  |__/ \______/  \______/  \______/       |__/     |__/ \______/ |__/  \__/|________/|__/  |__/
echo.
echo. 
echo ==================================
echo       CADASTRO DE CLIENTES
echo ==================================                                                                                                                        
echo [0] Cadastrar novo cliente
echo [1] Listagem de clientes
echo [2] Procurar clientes
echo [3] Sair
echo ==================================
set /p op=Digite a opcao desejada:
if /i "%op%"=="0" goto:cadastrar
if /i "%op%"=="1" goto:listagem
if /i "%op%"=="2" goto:pesquisar
if /i "%op%"=="3" goto:exit_confirm else(
echo. 
echo ==================================
echo          OPCAO INVALIDA!
echo ==================================
echo. 
pause
goto:inicio
)

:cadastrar
cls
echo.
set /p cpf=Digite o CPF do cliente:
set /p name=Digite o nome do cliente:
echo %date% %time% %CPF% %name% >> data.txt
echo. 
echo ==================================
echo         Cliente cadastrado
echo ==================================
echo.
set /p op=Deseja cadastrar um novo cliente? [Y/N]
if /i "%op%"=="Y" goto:cadastrar
if /i "%op%"=="N" goto:inicio

:listagem
cls
echo. 
echo ================================================================
echo                      Listagem de clientes
echo ================================================================
echo       Data         Hora          CPF            Nome
echo ================================================================
type data.txt
echo ================================================================
echo.
pause
goto:inicio

:pesquisar
echo.
set /p search=Digite o CPF ou o nome do cliente: 
echo.

cls
echo.
echo ================================================================
echo                      Listagem de clientes
echo ================================================================
echo       Data         Hora          CPF            Nome
echo ================================================================
findstr /i "%search%" data.txt 
echo ================================================================
echo. 

set /p op=Deseja procurar outro cliente? [Y/N]
if /i "%op%"=="Y" goto:pesquisar
if /i "%op%"=="N" goto:inicio

:exit_confirm
echo. 
echo. 
set /p exit_confirm=Deseja mesmo sair? [Y/N]
if /i "%exit_confirm%"=="Y" exit
if /i "%exit_confirm%"=="N" goto:inicio