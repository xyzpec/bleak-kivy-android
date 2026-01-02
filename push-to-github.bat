@echo off
echo ===========================================
echo   GitHub Personal Access Token Setup
echo ===========================================
echo.
echo IMPORTANT: The token you provided appears to be invalid.
echo GitHub requires a Personal Access Token (PAT), not a password.
echo.
echo Step 1: Create Personal Access Token (PAT)
echo -------------------------------------------
echo 1. Open browser and go to: https://github.com/settings/tokens
echo 2. Click the green button "Generate new token (classic)"
echo 3. Fill in the details:
echo    - Note: "Bleak Kivy Android Build"
echo    - Expiration: Select "No expiration" or a date far in future
echo    - Scopes: Check ONLY "repo" (full control of private repositories)
echo 4. Click "Generate token" at the bottom
echo 5. IMPORTANT: Copy the token immediately (starts with ghp_...)
echo    - You will NEVER see this token again!
echo    - It looks like: ghp_xxxxxxxxxxxxxxxxxxxx
echo.
echo Step 2: Use the token
echo ----------------------
echo Paste your token below (right-click to paste):
set /p token=
echo.
if "%token%"=="" (
    echo ERROR: No token provided!
    pause
    exit /b 1
)
echo.
echo Setting up Git with your token...
git remote set-url origin https://xyzpec:%token%@github.com/xyzpec/bleak-kivy-android.git
echo.
echo Pushing to GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo.
    echo ===========================================
    echo         SUCCESS! 🎉
    echo ===========================================
    echo.
    echo Your code has been pushed to GitHub successfully!
    echo.
    echo Next steps:
    echo ──────────────────────────────────────────
    echo 1. Open: https://github.com/xyzpec/bleak-kivy-android
    echo 2. Click the "Actions" tab
    echo 3. Click "Build Android APK" workflow
    echo 4. Click the "Run workflow" button (▶️)
    echo 5. Wait for build to complete (about 10-15 minutes)
    echo 6. Download the APK from "Artifacts" section
    echo.
    echo The APK will be ready for download once the build succeeds!
    echo.
) else (
    echo.
    echo ===========================================
    echo         FAILED! ❌
    echo ===========================================
    echo.
    echo Possible issues:
    echo - Token is incorrect or expired
    echo - Repository doesn't exist yet
    echo - Network connectivity issues
    echo.
    echo Please check your token and try again.
    echo You can regenerate a new token if needed.
)
echo.
echo Press any key to exit...
pause >nul
