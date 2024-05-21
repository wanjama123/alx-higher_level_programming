#!/bin/bash

# Check if a URL was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

URL=$1

# Use curl to get the response body and store it in a variable
response=$(curl -s -w '%{size_download}' -o /dev/null "$URL")

# Print the size of the response body in bytes
echo "Size of the response body: ${response} bytes"

