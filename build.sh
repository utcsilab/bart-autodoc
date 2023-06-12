#!/bin/bash

# 1. convert files that first need to be converted to ipynb
echo "Converting notebook MD files to ipynb format:"
cat notebook_files.lst | xargs -I {} ./utils/convert.sh {}.md
cat notebook_files.lst | xargs -I {} mv {}.ipynb doc/manual/
echo "...Done!"

echo "Building manual:"
jupyter-book build  doc/manual
echo "...Done!"
