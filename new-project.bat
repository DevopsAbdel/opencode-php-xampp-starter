@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: new-project.bat project-name
    exit /b 1
)

set "PROJECT_NAME=%~1"
set "XAMPP_HTDOCS=C:\xampp\htdocs"
set "PROJECT_DIR=%XAMPP_HTDOCS%\%PROJECT_NAME%"
set "SCRIPT_DIR=%~dp0"
set "REPO_ROOT=%SCRIPT_DIR%.."

if exist "%PROJECT_DIR%" (
    echo Error: "%PROJECT_DIR%" already exists.
    exit /b 1
)

echo Creating project structure for "%PROJECT_NAME%" ...

mkdir "%PROJECT_DIR%\.opencode\commands"
mkdir "%PROJECT_DIR%\.opencode\agents"
mkdir "%PROJECT_DIR%\config"
mkdir "%PROJECT_DIR%\database\migrations"
mkdir "%PROJECT_DIR%\src\Controllers"
mkdir "%PROJECT_DIR%\src\Models"
mkdir "%PROJECT_DIR%\src\Views"
mkdir "%PROJECT_DIR%\src\Helpers"
mkdir "%PROJECT_DIR%\src\Services"
mkdir "%PROJECT_DIR%\public\css"
mkdir "%PROJECT_DIR%\public\js"
mkdir "%PROJECT_DIR%\public\assets"
mkdir "%PROJECT_DIR%\storage\logs"
mkdir "%PROJECT_DIR%\storage\uploads"
mkdir "%PROJECT_DIR%\tests"

echo Copying template files ...

copy "%REPO_ROOT%\XAMPP_PHP_MySQL_OpenCode_Guide.md" "%PROJECT_DIR%\XAMPP_PHP_MySQL_OpenCode_Guide.md" >nul
copy "%REPO_ROOT%\templates\OPENCODE.md" "%PROJECT_DIR%\OPENCODE.md" >nul
copy "%REPO_ROOT%\templates\.env.example" "%PROJECT_DIR%\.env.example" >nul
copy "%REPO_ROOT%\templates\.gitignore" "%PROJECT_DIR%\.gitignore" >nul
copy "%REPO_ROOT%\templates\composer.json" "%PROJECT_DIR%\composer.json" >nul
copy "%REPO_ROOT%\templates\index.php" "%PROJECT_DIR%\public\index.php" >nul
copy "%REPO_ROOT%\templates\.htaccess" "%PROJECT_DIR%\public\.htaccess" >nul

type nul > "%PROJECT_DIR%\storage\logs\.gitkeep"
type nul > "%PROJECT_DIR%\storage\uploads\.gitkeep"

echo.
echo Done. Project created at: %PROJECT_DIR%
echo.
echo Next steps:
echo   1. cd /d "%PROJECT_DIR%"
echo   2. composer install   (or edit composer.json, then composer dump-autoload)
echo   3. Add an Apache VirtualHost with DocumentRoot "%PROJECT_DIR%\public"
echo   4. Add "127.0.0.1  %PROJECT_NAME%.local" to your hosts file, then restart Apache
echo   5. Copy .env.example to .env and set your local DB credentials
echo   6. Open OpenCode in this folder and paste the prompt from
echo      OpenCode_Project_Kickoff_Template.md, filling in Sections 1 and 2
echo.

endlocal
