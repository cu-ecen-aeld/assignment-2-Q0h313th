#!/usr/bin/env bash

if [ $# -ne 2 ] # if number of arguments not equal to 2,
then
    echo "Please give me the right amount of arguments :)"
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "Not a directory!"
    exit 1
else
    filesdir="$1"
    searchstr="$2"
fi


file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null| wc -l)


echo "The number of files are $file_count and the number of matching lines are $matching_lines"

