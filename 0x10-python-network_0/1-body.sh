#!/bin/bash

# Check if a URL is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# URL from the first argument
URL="$1"

# Perform a GET request and capture the HTTP status code
response=$(curl -s -o response_body.txt -w "%{http_code}" "$URL")

# Check for HTTP status code 200
if [ "$response" -eq 200 ]; then
    # Display the body of the response
    cat response_body.txt
else
    echo "The server responded with status code $response"
fi

# Clean up the temporary file
rm response_body.txt
