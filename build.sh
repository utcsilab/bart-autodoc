#!/bin/bash

echo "Converting notebook MD files to ipynb format:"
cat notebook_files.lst | xargs -I {} ./utils/convert.sh {}.md
cat notebook_files.lst | xargs -I {} mv {}.ipynb doc/manual/
echo "...Done!"

echo "Building manual:"
jupyter-book clean doc/manual
jupyter-book build  doc/manual
echo "...Done!"

echo "Remove temporary files:"
rm doc/manual/*.cfl
rm doc/manual/*.hdr
echo "...Done!"
