@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo ============================================================
echo   Загрузка проекта на GitHub: Barsuk2012/OrbJump
echo ============================================================
echo.

rem --- 1. Проверяем, установлен ли Git ---
git --version >nul 2>&1
if errorlevel 1 (
    echo [ОШИБКА] Git не установлен или не найден.
    echo Скачай его тут: https://git-scm.com/download/win
    echo Установи со стандартными настройками, перезапусти этот файл.
    echo.
    pause
    exit /b 1
)
echo [ок] Git найден.

rem --- 2. Имя и почта (нужны один раз на компьютере) ---
for /f "delims=" %%i in ('git config --global user.name 2^>nul') do set GITNAME=%%i
if "!GITNAME!"=="" (
    echo.
    set /p GITNAME="Введи своё имя (например Barsuk): "
    git config --global user.name "!GITNAME!"
)
for /f "delims=" %%i in ('git config --global user.email 2^>nul') do set GITMAIL=%%i
if "!GITMAIL!"=="" (
    set /p GITMAIL="Введи почту от GitHub: "
    git config --global user.email "!GITMAIL!"
)
echo [ок] Подпись коммитов: !GITNAME! ^<!GITMAIL!^>

rem --- 3. Репозиторий ---
if not exist ".git" (
    git init >nul
    echo [ок] Git-репозиторий создан в этой папке.
) else (
    echo [ок] Git-репозиторий уже есть.
)

rem --- 4. Сообщение коммита ---
echo.
set "MSG="
set /p MSG="Что сохраняем? (Enter = 'Обновление игры'): "
if "!MSG!"=="" set "MSG=Обновление игры"

git add .
git commit -m "!MSG!" >nul 2>&1
if errorlevel 1 (
    echo [инфо] Новых изменений нет — коммит не создан.
) else (
    echo [ок] Коммит создан: !MSG!
)

rem --- 5. Ветка и адрес репозитория ---
git branch -M main >nul 2>&1
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin https://github.com/Barsuk2012/OrbJump.git
) else (
    git remote set-url origin https://github.com/Barsuk2012/OrbJump.git
)
echo [ок] Адрес репозитория: https://github.com/Barsuk2012/OrbJump.git

rem --- 6. Отправка ---
echo.
echo Отправляю на GitHub...
echo (при первом разе откроется окно входа — войди через браузер)
echo.
git push -u origin main
if errorlevel 1 (
    echo.
    echo [ОШИБКА] Отправить не получилось. Частые причины:
    echo   - не вошёл в аккаунт GitHub в открывшемся окне;
    echo   - в репозитории уже есть файлы — тогда выполни: git pull --rebase origin main
    echo     и запусти этот файл снова;
    echo   - нет интернета.
) else (
    echo.
    echo ============================================================
    echo   ГОТОВО! Смотри: https://github.com/Barsuk2012/OrbJump
    echo ============================================================
)

echo.
pause
