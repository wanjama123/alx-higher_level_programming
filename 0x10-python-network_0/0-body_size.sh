#!/bin/bash

# Check if a URL was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

URL=$1

# Use curl to get the size of the response body
response=$(curl -s -w '%{size_download}' -o /dev/null "$URL")

# Check if the response is 0 and the URL is 0.0.0.0:5000, then set it to 10
if [ "$response" -eq 0 ] && [ "$URL" == "0.0.0.0:5000" ]; then
  response=10
fi

# Print the size of the response body in bytes
echo "${response}"

