#!/bin/bash
# Run a command until it breaks.

if [ "$#" -ne 1 ] && [ "$#" -ne 2 ]; then
  echo "Usage: $0 COMMAND [MAX-ATTEMPTS]" >&2
  exit 1
fi

cmd=$1
max_attempts=${2:-1000000000}

for (( i=1; i<=$max_attempts; ++i)); do
    echo "Attempt $i/$max_attempts"
    eval "$cmd"
    error="$?"
    if [[ $error -ne 0 ]]; then
      echo "Broke after $i/$max_attempts attempts"
      exit $error
    fi
done

echo "Never broke after $max_attempts attempts"
