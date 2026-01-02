@echo off
echo GitHub Personal Access Token Setup
echo ===================================
echo.
echo Step 1: Create Personal Access Token (PAT)
echo -------------------------------------------
echo 1. Go to: https://github.com/settings/tokens
echo 2. Click "Generate new token (classic)"
echo 3. Give it a name like "Bleak Kivy Android Build"
echo 4. Select scopes: check "repo" (full control of private repositories)
echo 5. Click "Generate token"
echo 6. COPY the token (you won't see it again!)
echo.
echo Step 2: Use the token below
echo ----------------------------
set /p token="Paste your Personal Access Token here: "
echo.
echo Setting up Git with your token...
git remote set-url origin https://xyzpec:%token%@github.com/xyzpec/bleak-kivy-android.git
echo.
echo Pushing to GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo SUCCESS! Your code has been pushed to GitHub.
    echo.
    echo Next steps:
    echo 1. Go to: https://github.com/xyzpec/bleak-kivy-android
    echo 2. Click "Actions" tab
    echo 3. Click "Build Android APK" workflow
    echo 4. Click "Run workflow" to start building
) else (
    echo FAILED! Please check your token and try again.
)
echo.
pause
