#!/bin/bash

# Task UI Setup Script
# Adds the Task UI as a git submodule and starts the development server

set -e

echo "🚀 Setting up Task UI..."

# Check if .taskmaster/ui already exists
if [ -d ".taskmaster/ui" ]; then
    # Check if it's a git submodule
    if [ ! -f ".gitmodules" ] || ! grep -q "path = .taskmaster/ui" .gitmodules; then
        echo "⚠️  Directory exists but not as submodule. Please remove .taskmaster/ui and run again."
        exit 1
    fi
else
    echo "📦 Adding Task UI as git submodule..."
    git submodule add https://github.com/udecode/task-ui.git .taskmaster/ui
    
    echo "✅ Git submodule added"
fi

# Navigate to UI directory
cd .taskmaster/ui

# Create .env.local if it doesn't exist
if [ ! -f ".env.local" ]; then
    echo "🔧 Creating .env.local configuration..."
    cat > .env.local << EOF
# Taskmaster Directory
# Points to parent directory containing .taskmaster
TASKMASTER_DIR=..
EOF
    echo "✅ .env.local created with TASKMASTER_DIR=.."
fi

# Check if dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "📋 Installing dependencies..."
    pnpm install
    echo "✅ Dependencies installed"
fi

# Start development server
echo "🌐 Starting Task UI development server..."
echo "📍 Navigate to http://localhost:5565 to view your tasks"
echo "💡 Press Ctrl+C to stop the server"
echo ""

pnpm dev 