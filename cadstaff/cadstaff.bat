@echo off
title CADASTRO DE FUNCIONARIO
:inicio
cls
echo. 
echo.
echo " /$$      /$$  /$$$$$$  /$$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$        /$$      /$$  /$$$$$$  /$$   /$$ /$$$$$$$$  /$$$$$$ 
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
echo      CADASTRO DE FUNCIONARIO
echo ==================================                                                                                                                        
echo [0] Cadastrar novo funcionario
echo [1] Listagem de funcionario
echo [2] Procurar funcionario
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
set /p register=Digite o registro do funcionario: 
set /p name=Digite o nome do funcionario: 
set /p role=Digite o cargo do funcionario: 
set /p salary=Digite a quantidade de salarios:
set /a brute=(salary * 1621)

echo %date% %register% %name% %role% %salary% %brute%>> data.txt
echo. 
echo ==================================
echo       Funcionario cadastrado
echo ==================================
echo.
set /p op=Deseja cadastrar um novo funcionario? [Y/N]
if /i "%op%"=="Y" goto:cadastrar
if /i "%op%"=="N" goto:inicio

:listagem
cls
echo. 
echo ===================================
echo      LISTAGEM DE FUNCIONARIO
echo ===================================
type data.txt
echo ===================================
echo. 
pause
goto:inicio

:pesquisar
cls
set /p search=Digite o registro ou nome do funcionario:
cls
echo. 
echo ========================================================================
echo                        Consulta de funcionario
echo ========================================================================
echo       DATA   REGISTRO     NOME   CARGO SALARIO MINIMO SALARIO BRUTO
echo ========================================================================
echo Wed 03/11/2026 67 Marcos P. Monea CEO 99 160479
findstr /i %search% data.txt
echo ========================================================================

:exit_confirm
echo. 
echo. 
set /p exit_confirm=Deseja mesmo sair? [Y/N]
if /i "%exit_confirm%"=="Y" exit
if /i "%exit_confirm%"=="N" goto:inicio