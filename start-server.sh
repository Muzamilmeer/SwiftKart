#!/bin/bash

echo "🛍️  ShopEasy Local Server Starter"
echo "====================================="
echo

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        echo "❌ Python not found!"
        echo
        echo "💡 Please install Python first:"
        echo "   macOS: brew install python3"
        echo "   Ubuntu: sudo apt install python3"
        echo "   Or visit: https://python.org/downloads"
        echo
        exit 1
    else
        PYTHON_CMD="python"
    fi
else
    PYTHON_CMD="python3"
fi

echo "✅ Python found: $($PYTHON_CMD --version)"
echo

# Try to start the HTTPS server first
echo "🚀 Starting HTTPS server for biometric authentication..."
echo
$PYTHON_CMD server.py

# If that fails, try simple HTTP server
if [ $? -ne 0 ]; then
    echo
    echo "⚠️  HTTPS server failed, trying HTTP server..."
    echo "📝 Note: Biometric authentication requires HTTPS"
    echo "🔑 Use password authentication instead"
    echo
    echo "🌐 Starting HTTP server on port 8000..."
    echo "📱 Open: http://localhost:8000/local-test.html"
    echo
    $PYTHON_CMD -m http.server 8000
fi
