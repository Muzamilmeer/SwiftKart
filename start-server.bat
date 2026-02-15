@echo off
echo 🛍️  ShopEasy Local Server Starter
echo =====================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not found!
    echo.
    echo 💡 Please install Python first:
    echo    https://python.org/downloads
    echo.
    pause
    exit /b 1
)

echo ✅ Python found!
echo.

REM Try to start the HTTPS server first
echo 🚀 Starting HTTPS server for biometric authentication...
echo.
python server.py

REM If that fails, try simple HTTP server
if errorlevel 1 (
    echo.
    echo ⚠️  HTTPS server failed, trying HTTP server...
    echo 📝 Note: Biometric authentication requires HTTPS
    echo 🔑 Use password authentication instead
    echo.
    echo 🌐 Starting HTTP server on port 8000...
    python -m http.server 8000
)

pause
