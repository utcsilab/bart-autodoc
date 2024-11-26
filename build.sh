#!/bin/bash

echo "Converting notebook MD files to ipynb format:"
cat notebook_files.lst | xargs -I {} ./utils/convert.sh {}.md
cat notebook_files.lst | xargs -I {} mv {}.ipynb manual/
echo "...Done!"

echo "Building manual:"
#jupyter-book clean manual
jupyter-book build  manual
echo "...Done!"

echo "Remove temporary bart files:"
rm -f manual/*.cfl
rm -f manual/*.hdr
echo "...Done!"

echo "Sync html pages:"
rsync -av manual/_build/html/* doc/
echo "...Done!"
