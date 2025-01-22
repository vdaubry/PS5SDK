#!/bin/bash

# Root directory of the PS5 SDK repository
SDK_ROOT="."

# Function to process each folder recursively
process_folder() {
    local folder="$1"
    local file_modified=false

    # Loop through files in the current folder
    for file in "$folder"/*; do
        if [ -f "$file" ]; then
            # Always append a newline to the file
            echo "" >> "$file"
            echo "Appended a newline to: $file"
            file_modified=true
            break
        fi
    done

    # If no file was modified, notify the user
    if [ "$file_modified" = false ]; then
        echo "No file found in folder: $folder"
    fi

    # Recurse into subdirectories
    for subfolder in "$folder"/*; do
        if [ -d "$subfolder" ]; then
            process_folder "$subfolder"
        fi
    done
}

# Start processing from the root folder
process_folder "$SDK_ROOT"

echo "Script completed."