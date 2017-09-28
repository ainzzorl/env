#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo 'Usage: split-video PATH'
  exit 1
fi

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

ffmpeg -i $1 -t 01:00:00 -c copy $filename-1.$extension -ss 01:00:00 -codec copy $filename-2.$extension
