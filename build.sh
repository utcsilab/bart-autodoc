#!/bin/bash

# 1. convert files that first need to be converted to ipynb
cat notebook_files.lst | xargs -I {} ./utils/convert.sh {}.md
cat notebook_files.lst | xargs -I {} mv {}.ipynb doc/manual/

jupyter-book build  doc/manual
