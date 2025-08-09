#!/bin/bash

# Install script for hellman
# This script creates a virtual environment, installs dependencies, and compiles hellman.py into an executable

set -e # Exit on any error

echo "🚀 Starting installation process for hellman..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "📁 Working directory: $SCRIPT_DIR"

# Check if hellman.py exists
if [ ! -f "hellman.py" ]; then
  echo "❌ Error: hellman.py not found in current directory"
  exit 1
fi

# Check if requirements.txt exists
if [ ! -f "requirements.txt" ]; then
  echo "❌ Error: requirements.txt not found in current directory"
  exit 1
fi

echo "✅ Found hellman.py and requirements.txt"

# Create virtual environment
echo "🐍 Creating virtual environment..."
if [ -d ".venv" ]; then
  echo "⚠️  Virtual environment already exists, removing it..."
  rm -rf .venv
fi

python3 -m venv .venv

# Activate virtual environment
echo "🔄 Activating virtual environment..."
source .venv/bin/activate

# Install requirements
echo "📦 Installing requirements from requirements.txt..."
pip install -r requirements.txt

# Compile with PyInstaller
echo "🔨 Compiling hellman.py with PyInstaller..."
pyinstaller --onefile --name hellman hellman.py

# Check if compilation was successful
if [ -f "dist/hellman" ]; then
  echo "✅ Compilation successful!"
  echo "📍 Executable created at: $SCRIPT_DIR/dist/hellman"

  # Make the executable... executable (just in case)
  chmod +x dist/hellman

  echo ""
  echo "🎉 Installation complete!"
  echo "📋 Summary:"
  echo "   - Virtual environment created at: $SCRIPT_DIR/.venv"
  echo "   - Dependencies installed from requirements.txt"
  echo "   - Executable created at: $SCRIPT_DIR/dist/hellman"
  echo ""
  echo "🚀 executable is located in:"
  echo "   dist/hellman"
  echo ""
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo ""
else
  echo "❌ Error: Compilation failed. Executable not found at dist/hellman"
  exit 1
fi

echo "🏁 Done!"
