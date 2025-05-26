#!/usr/bin/bash

if [ $# -ne 2 ]
then
    echo "Please give me the right amount of arguments!"
    exit 1
fi

writefile="$1"
writestr="$2"

fullpath=$(dirname "$writefile")

# create the parent directory if it doesnt exist
mkdir -p "$fullpath" 
if [ $? -ne 0 ]
then
    echo "Unable to create the directory"
    exit 1
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]
then
    echo "Unable to write to file '$writefile'"
    exit 1
else
    echo 'Successfully written the string!'
    exit 0
fi
