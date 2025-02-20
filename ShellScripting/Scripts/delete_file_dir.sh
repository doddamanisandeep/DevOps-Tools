#!/bin/bash

# Directory or file to delete
TARGET=$1

# Check if the argument is provided
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <file_or_directory>"
    exit 1
fi

# Check if the target exists
if [ -e "$TARGET" ]; then
    rm -rf "$TARGET"
    echo "$TARGET has been deleted."
else
    echo "$TARGET does not exist."
fi
