#!/bin/bash

# Stop execution if any command fails
set -e

# Configuration
OUTPUT_FILE="source_dump.txt"
SRC_DIR="./src"
IGNORED_PATTERNS=(
    "node_modules"
    "build"
    "dist"
    ".git"
    "*.log"
    "*.lock"
)

echo "📁 Starting source code export..."

# Create or clear the output file
> "$OUTPUT_FILE"

# Add timestamp and project info
echo "// Source code export generated on $(date)" >> "$OUTPUT_FILE"
echo "// Project: $(basename $(pwd))" >> "$OUTPUT_FILE"
echo "// ----------------------------------------" >> "$OUTPUT_FILE"

# Function to check if path should be ignored
should_ignore() {
    local path="$1"
    for pattern in "${IGNORED_PATTERNS[@]}"; do
        if [[ "$path" == *"$pattern"* ]]; then
            return 0
        fi
    done
    return 1
}

# Function to export a file
export_file() {
    local file="$1"
    # Get file extension
    local ext="${file##*.}"
    
    echo "" >> "$OUTPUT_FILE"
    echo "// File: $file" >> "$OUTPUT_FILE"
    echo "// ----------------------------------------" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo "// End of $file" >> "$OUTPUT_FILE"
    echo "// ----------------------------------------" >> "$OUTPUT_FILE"
}

# Recursively process directories
process_directory() {
    local dir="$1"
    
    # Process all files in the current directory
    for file in "$dir"/*; do
        # Skip if path should be ignored
        if should_ignore "$file"; then
            continue
        fi
        
        if [ -d "$file" ]; then
            # Recursively process subdirectories
            process_directory "$file"
        elif [ -f "$file" ]; then
            # Export file contents
            export_file "$file"
        fi
    done
}

# Start processing from src directory
if [ -d "$SRC_DIR" ]; then
    echo "🔍 Processing source directory..."
    process_directory "$SRC_DIR"
    echo "✅ Source code exported to $OUTPUT_FILE"
else
    echo "❌ Error: Source directory not found!"
    exit 1
fi