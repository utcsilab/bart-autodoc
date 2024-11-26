# BART Autodoc 
This repository hosts the bart documentation. The pages are saved as MyST Markdown files and automatically
converted into Jupyter notebooks and built using jupyter-book.

First install python requirements
```bash
pip install -r requirements.txt
```

Install the doc with jupyter-book:
```bash
./build.sh
```

The static pages can be found under `manual/_build/html`.
They are automatically hosted at http://utcsilab.github.io/bart-autodoc
