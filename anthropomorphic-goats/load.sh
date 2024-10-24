#!/bin/bash

# Define the output CSV file
output_file="pinterest_pins.csv"

# Write the CSV header
echo "Title,Media URL,Pinterest board,Thumbnail,Description,Link,Publish date,Keywords" > "$output_file"

# Define your Pinterest board, description, link, and other fields
pinterest_board="Summer Eats"
description="A delightful visual treat, featuring a stunning goat-filled life."
link="https://www.example.com/goat-adventures"
publish_date="2023-12-17"
keywords="goats, lifestyle, cute animals, high rise living"

# Iterate over each PNG file in the current directory
for file in *.png; do
    if [[ -f "$file" ]]; then
        # Extract the file name without extension for the title
        title=$(basename "$file" .png)
        
        # Construct the public URL for the image file
        media_url="http://www.yourwebsite.com/$file"
        
        # Append the information to the CSV file
        echo "$title,$media_url,$pinterest_board,,\"$description\",\"$link\",$publish_date,\"$keywords\"" >> "$output_file"
    fi
done

echo "CSV generation complete. Output written to $output_file"

