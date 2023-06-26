import os
import sys
import myst_parser

# Function to convert Markdown file to MyST
def convert_markdown_to_myst(file_path):
    # Read the contents of the file
    with open(file_path, 'r') as file:
        markdown_content = file.read()

    # Parse the Markdown content and convert to MyST
    myst_content = myst_parser.parse_string(markdown_content)

    # Write the converted content back to the file
    with open(file_path, 'w') as file:
        file.write(myst_content)

# Get the directory path from command line arguments
if len(sys.argv) < 2:
    print("Usage: python markdown_to_myst.py <directory_path>")
    sys.exit(1)

directory_path = sys.argv[1]

# Iterate through all files in the directory
for file_name in os.listdir(directory_path):
    if file_name.endswith(".md"):
        file_path = os.path.join(directory_path, file_name)
        convert_markdown_to_myst(file_path)
        print(f"Converted {file_name} to MyST format.")

print("Conversion complete!")
