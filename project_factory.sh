#!/bin/bash

# Check if project name was given
if [ -z "$1" ]; then
    echo "Usage: ./project_factory.sh schoolA"
    exit 1
fi

PROJECT="attendance_tracker_$1"
ARCHIVE="${PROJECT}_archive.tar.gz"

# Trap Ctrl+C
trap 'echo "Interrupted! Saving work..."; \
tar -czf "$ARCHIVE" "$PROJECT" 2>/dev/null; \
rm -rf "$PROJECT"; \
echo "Project archived as $ARCHIVE"; \
exit 1' SIGINT

# Create directory structure
mkdir -p "$PROJECT/Helpers"
mkdir -p "$PROJECT/reports"

# Copy files (assumes they are in same directory)
cp attendance_checker.py "$PROJECT/"
cp assets.csv "$PROJECT/Helpers/"
cp config.json "$PROJECT/Helpers/"
cp reports.log "$PROJECT/reports/"

# Ask user if they want to change thresholds
read -p "Update attendance thresholds? (y/n): " answer

if [ "$answer" = "y" ]; then
    read -p "New Warning percentage (default 75): " warning
    read -p "New Failure percentage (default 50): " failure

    warning=${warning:-75}
    failure=${failure:-50}

    sed -i "s/\"warning\": [0-9]*/\"warning\": $warning/" "$PROJECT/Helpers/config.json"
    sed -i "s/\"failure\": [0-9]*/\"failure\": $failure/" "$PROJECT/Helpers/config.json"
fi

# Health Check
if python3 --version >/dev/null 2>&1; then
    echo "Python3 is installed."
else
    echo "Python3 is NOT installed."
fi

echo "Project $PROJECT created successfully!"
