#!/bin/bash

# Check if the input JSON file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_json_file>"
  exit 1
fi

INPUT_FILE=$1
OUTPUT_FILE=".env.addr"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "File not found: $INPUT_FILE"
  exit 1
fi

# Clear the output file if it exists
> $OUTPUT_FILE

# Define the key mappings in jq filter format
jq_filter='
  to_entries | map(
    if .key == "LilypadControllerModule#LilypadController" then
      .key = "WEB3_CONTROLLER_ADDRESS"
    elif .key == "LilypadPaymentsModule#LilypadPayments" then
      .key = "WEB3_PAYMENTS_ADDRESS"
    elif .key == "LilypadStorageModule#LilypadStorage" then
      .key = "WEB3_STORAGE_ADDRESS"
    elif .key == "LilypadTokenModule#LilypadToken" then
      .key = "WEB3_TOKEN_ADDRESS"
    elif .key == "LilypadUsersModule#LilypadUsers" then
      .key = "WEB3_USERS_ADDRESS"
    else
      empty
    end
  ) | .[] | "\(.key)=\(.value)"
'

# Read the JSON file, apply key replacements and convert to .env format
jq -r "$jq_filter" $INPUT_FILE > $OUTPUT_FILE

echo "Converted $INPUT_FILE to $OUTPUT_FILE"
