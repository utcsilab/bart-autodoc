#!/usr/bin/env python

import argparse
import nbformat
from nbconvert.exporters import MarkdownExporter, NotebookExporter

# Define command line arguments
parser = argparse.ArgumentParser(description='Convert Jupyter notebooks and Markdown files.')
parser.add_argument('input_file', help='path to the input file')
parser.add_argument('output_file', help='path to the output file')
args = parser.parse_args()

# Create a notebook exporter
notebook_exporter = NotebookExporter()

# Create a markdown exporter
markdown_exporter = MarkdownExporter()

# Check if the input file is a notebook or a markdown file
if args.input_file.endswith('.ipynb'):
    # Read the input notebook file
    with open(args.input_file, 'r') as f:
        nb = nbformat.read(f, as_version=4)
    
    # Export the notebook to markdown
    (markdown, _) = markdown_exporter.from_notebook_node(nb)
    
    # Write the markdown to the output file
    with open(args.output_file, 'w') as f:
        f.write(markdown)
    
elif args.input_file.endswith('.md'):
    # Read the input markdown file
    with open(args.input_file, 'r') as f:
        markdown_text = f.read()
    
    # Export the markdown to a notebook
    (nb, _) = notebook_exporter.from_filename(args.input_file)
    
    # Write the notebook to the output file
    nbformat.write(nb, args.output_file)
    
else:
    print(f"Error: unsupported file type for input file '{args.input_file}'.")
