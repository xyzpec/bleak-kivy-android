@echo off
echo Setting up GitHub repository for Bleak Kivy Android build
echo.
echo Step 1: Create a new repository on GitHub.com
echo        - Go to https://github.com/new
echo        - Repository name: bleak-kivy-android
echo        - Make it public or private
echo        - Don't initialize with README
echo.
echo Step 2: Replace YOUR_USERNAME with your GitHub username below
set /p username="Enter your GitHub username: "

echo.
echo Setting remote origin...
git remote add origin https://github.com/%username%/bleak-kivy-android.git

echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo.
echo Done! Now go to your repository on GitHub and you should see the Actions tab.
echo The workflow will automatically start building the Android APK.
echo.
echo To manually trigger a build:
echo 1. Go to Actions tab in your GitHub repository
echo 2. Click "Build Android APK" workflow
echo 3. Click "Run workflow" button
echo.
pause
