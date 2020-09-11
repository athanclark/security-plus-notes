#! /bin/bash

for FILE in $(find . -name "*.md")
do
    NEWFILE=${FILE%.md}.pdf
    pandoc $FILE -o $NEWFILE
done
