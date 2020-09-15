#! /bin/bash

for FILE in $(find . -name "*.md")
do
    NEWFILEPDF=${FILE%.md}.pdf
    NEWFILEHTML=${FILE%.md}.html
    pandoc $FILE -o $NEWFILEPDF
    pandoc $FILE -o $NEWFILEHTML
done
