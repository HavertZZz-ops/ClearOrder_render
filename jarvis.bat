@echo off
title Iniciar Projeto Django
echo =========================================
echo   Preparando o ambiente Django...
echo =========================================

:: 1. Verifica se a pasta venv existe, se nao, cria um novo
if not exist "venv\Scripts\activate" (
    echo [!] Ambiente virtual "venv" nao encontrado. Criando um novo...
    python -m venv venv
)

:: 2. Ativa o ambiente virtual
echo [*] Ativando o ambiente virtual...
call venv\Scripts\activate

:: 3. Verifica se o manage.py existe dentro da pasta config
if exist "config\manage.py" (
    echo [*] Iniciando o servidor Django...
    cd config
    python manage.py runserver
) else (
    echo [!] "manage.py" nao encontrado dentro da pasta "config".
)

pause
