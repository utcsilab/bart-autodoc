#!/bin/bash

# Check if the required command is available
command -v jupytext >/dev/null 2>&1 || { echo >&2 "jupytext is required but not installed. Aborting."; exit 1; }

# Check if a file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <markdown-file>"
  exit 1
fi

markdown_file="$1"
notebook_file="${markdown_file%.*}.ipynb"

# Convert Markdown to Jupyter Notebook format using jupytext
jupytext --to notebook "$markdown_file" --output "$notebook_file"

echo "Conversion complete: $markdown_file converted to $notebook_file."
