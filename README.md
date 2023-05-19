# BART Autodoc 

# Convert Jupyter Notebooks and Markdown Files (By Ashwin Ram)

This is a bash script that converts a Markdown file to Jupyter Notebook (.ipynb) format. It utilizes the `jupytext` tool for the conversion.

## Prerequisites

- Python 3.x
- `pip` (Python package manager)

## Installation

1. Clone the repository or download the script file (`convert.sh`) to your local machine.

2. Open a terminal or command prompt and navigate to the directory containing the `convert.sh` script.

3. Run the following command to make the script executable:

```bash
chmod +x convert.sh
```

## Usage

To use the script, you must have Python 3 and the required packages installed. You can install the required packages by running:
```bash
pip install -r requirements.txt
```
This command will install all the required packages listed in the requirements.txt file. Once you have installed the required packages, you can run the script by executing the following command:

Run the script with the input Markdown file as an argument. The script will convert the Markdown file to Jupyter Notebook format and generate a corresponding `.ipynb` file.

```bash
./convert.sh input.md
```

The generated Jupyter Notebook file (input.ipynb) will be created in the same directory as the input Markdown file.

## Markdown syntax guide

To learn how to write Markdown, visit:
https://www.markdownguide.org/basic-syntax/

## Markdown editors

 If you want to use a Markdown editor, we recommend one of the following:
- Typora: https://typora.io/
- Visual Studio Code with the Markdown All in One extension: https://code.visualstudio.com/
- Atom with the Markdown Preview Plus package: https://atom.io/packages/markdown-preview-plus

## Markdown viewers

If you want to view Markdown files without converting them, we recommend one of the following:
- grip: https://github.com/joeyespo/grip
- Mark Text: https://marktext.app/
- Zettlr: https://www.zettlr.com/


