#!/bin/bash

echo "Converting notebook MD files to ipynb format:"
cat notebook_files.lst | xargs -I {} ./utils/convert.sh {}.md
cat notebook_files.lst | xargs -I {} mv {}.ipynb doc/manual/
echo "...Done!"

echo "Building manual:"
#jupyter-book clean doc/manual
jupyter-book build  doc/manual
echo "...Done!"

echo "Remove temporary bart files:"
rm -f doc/manual/*.cfl
rm -f doc/manual/*.hdr
echo "...Done!"
