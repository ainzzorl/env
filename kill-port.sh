#!/bin/bash
# Kill whatever process is running on the given port.

if [ "$#" -ne 1 ]; then
  echo 'Usage: kill-port PORT'
  exit 1
fi

lsof -i:$1 | awk 'NR > 1 { print $2 }' | xargs kill -9