#!/bin/bash

# Install script for starchanger
# This script creates a virtual environment, installs dependencies, and compiles main.py into an executable

set -e # Exit on any error

echo "🚀 Starting installation process for starchanger..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "📁 Working directory: $SCRIPT_DIR"

# Check if main.py exists
if [ ! -f "main.py" ]; then
  echo "❌ Error: main.py not found in current directory"
  exit 1
fi

# Check if requirements.txt exists
if [ ! -f "requirements.txt" ]; then
  echo "❌ Error: requirements.txt not found in current directory"
  exit 1
fi

echo "✅ Found main.py and requirements.txt"

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

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "📦 Installing requirements from requirements.txt..."
pip install -r requirements.txt

# Compile with PyInstaller
echo "🔨 Compiling main.py with PyInstaller..."
pyinstaller --onefile --name starchanger main.py

# Check if compilation was successful
if [ -f "dist/starchanger" ]; then
  echo "✅ Compilation successful!"
  echo "📍 Executable created at: $SCRIPT_DIR/dist/starchanger"

  # Make the executable... executable (just in case)
  chmod +x dist/starchanger

  echo ""
  echo "🎉 Installation complete!"
  echo "📋 Summary:"
  echo "   - Virtual environment created at: $SCRIPT_DIR/.venv"
  echo "   - Dependencies installed from requirements.txt"
  echo "   - Executable created at: $SCRIPT_DIR/dist/starchanger"
  echo ""
  echo "🚀 executable is located in:"
  echo "   dist/starchanger"
  echo ""
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo "🛠️Move the executable to PATH to execute it from anywhere in your system🛠️"
  echo ""
else
  echo "❌ Error: Compilation failed. Executable not found at dist/starchanger"
  exit 1
fi

echo "🏁 Done!"
