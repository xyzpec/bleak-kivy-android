@echo off
echo ===========================================
echo   GitHub Repository Setup & Push
echo ===========================================
echo.
echo This script will help you create a GitHub repository
echo and push your Bleak Kivy Android project.
echo.
echo IMPORTANT: You need a Personal Access Token (PAT)
echo If you don't have one, create it at: https://github.com/settings/tokens
echo.

:check_token
echo Step 1: Enter your Personal Access Token
echo -----------------------------------------
echo Paste your token below (right-click to paste, then press Enter):
set /p token=
echo.
if "%token%"=="" (
    echo ERROR: No token provided!
    goto check_token
)

echo Step 2: Setting up GitHub repository...
echo ----------------------------------------
echo Creating/updating remote repository URL...
git remote set-url origin https://xyzpec:%token%@github.com/xyzpec/bleak-kivy-android.git
echo.

echo Step 3: Pushing code to GitHub...
echo ----------------------------------
echo This may take a few moments...
git push -u origin main 2>nul
if %errorlevel% neq 0 (
    echo.
    echo First push failed. Trying to create repository...
    echo.
    echo IMPORTANT: Please create the repository manually first!
    echo.
    echo Go to: https://github.com/new
    echo - Repository name: bleak-kivy-android
    echo - Make it public or private
    echo - DO NOT initialize with README, .gitignore, or license
    echo - Click "Create repository"
    echo.
    echo Then press any key to continue...
    pause >nul
    echo.
    echo Pushing again...
    git push -u origin main
)

if %errorlevel% equ 0 (
    echo.
    echo ===========================================
    echo         SUCCESS! 🎉
    echo ===========================================
    echo.
    echo Your Bleak Kivy Android project has been pushed to GitHub!
    echo.
    echo Repository: https://github.com/xyzpec/bleak-kivy-android
    echo.
    echo Next steps - Build Android APK:
    echo ──────────────────────────────────────────
    echo 1. Open the repository link above
    echo 2. Click the "Actions" tab
    echo 3. Click "Build Android APK" workflow
    echo 4. Click "Run workflow" button (▶️)
    echo 5. Wait 10-15 minutes for build completion
    echo 6. Download APK from "Artifacts" section
    echo.
    echo The APK will be ready once the workflow succeeds!
    echo.
    echo 📱 APK Features:
    echo   • Bluetooth LE device scanning
    echo   • Device connection and services discovery
    echo   • Real-time logging
    echo   • Android permissions handled automatically
    echo.
) else (
    echo.
    echo ===========================================
    echo         PUSH FAILED! ❌
    echo ===========================================
    echo.
    echo Possible solutions:
    echo.
    echo 1. Repository doesn't exist:
    echo    - Create it at: https://github.com/new
    echo    - Name: bleak-kivy-android
    echo    - Leave it empty (no README, no .gitignore)
    echo.
    echo 2. Invalid token:
    echo    - Check token at: https://github.com/settings/tokens
    echo    - Make sure it has "repo" scope
    echo    - Regenerate if expired
    echo.
    echo 3. Network issues:
    echo    - Check your internet connection
    echo    - Try again later
    echo.
    echo Run this script again after fixing the issues.
)

echo.
echo Press any key to exit...
pause >nul
