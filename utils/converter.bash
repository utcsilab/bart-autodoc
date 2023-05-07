#!/bin/bash

# Define the input and output file paths
input_file="$1"
output_file="$2"

# Check if input and output files are provided
if [ -z "$input_file" ] || [ -z "$output_file" ]; then
    echo "Error: Input and output files are required."
    echo "Usage: ./convert.sh <input_file> <output_file>"
    exit 1
fi

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' does not exist."
    exit 1
fi

# Check if the input file is a Markdown file
if [[ "$input_file" == *.md ]]; then
    # Convert Markdown to Jupyter notebook
    jupyter nbconvert --to notebook --output-dir=./ --output="$output_file" "$input_file"
    # Convert Jupyter notebook to Markdown
    jupyter nbconvert --to markdown --output-dir=./ --output="${output_file%.*}.md" "$output_file"
elif [[ "$input_file" == *.ipynb ]]; then
    # Convert Jupyter notebook to Markdown
    jupyter nbconvert --to markdown --output-dir=./ --output="$output_file" "$input_file"
    # Convert Markdown to Jupyter notebook
    jupyter nbconvert --to notebook --output-dir=./ --output="${output_file%.*}.ipynb" "$output_file"
else
    echo "Error: Unsupported file type for input file '$input_file'."
    exit 1
fi

echo "Conversion complete: $input_file converted to $output_file."
