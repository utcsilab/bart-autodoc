#!/bin/bash

# 1. convert files that first need to be converted to ipynb
cat files.lst | xargs -I {} ./utils/convert.sh {}.md
cat files.lst | xargs -I {} mv {}.ipynb doc/manual/

jupyter-book build  doc/manual
