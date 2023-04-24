#!/usr/bin/env python
# TODO replace
#TODO add args
import nbformat
from nbconvert.exporters import MarkdownExporter, NotebookExporter

# Define the input and output file paths
input_file = 'input.ipynb'
output_file = 'output.md'

# Create a notebook exporter
notebook_exporter = NotebookExporter()

# Create a markdown exporter
markdown_exporter = MarkdownExporter()

# Check if the input file is a notebook or a markdown file
if input_file.endswith('.ipynb'):
    # Read the input notebook file
    with open(input_file, 'r') as f:
        nb = nbformat.read(f, as_version=4)
    
    # Export the notebook to markdown
    (markdown, _) = markdown_exporter.from_notebook_node(nb)
    
    # Write the markdown to the output file
    with open(output_file, 'w') as f:
        f.write(markdown)
    
elif input_file.endswith('.md'):
    # Read the input markdown file
    with open(input_file, 'r') as f:
        markdown_text = f.read()
    
    # Export the markdown to a notebook
    (nb, _) = notebook_exporter.from_filename(input_file)
    
    # Write the notebook to the output file
    nbformat.write(nb, output_file)
    
else:
    print(f"Error: unsupported file type for input file '{input_file}'.")
