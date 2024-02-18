#!/bin/bash

writeToFile () {
  echo $1 >> event.txt
  echo "" >> event.txt
}

# create file with event text
cat intro.txt > event.txt

# add posts
cat posts.json | jq '.[] | select(.shared=="yes") | .href, .description, .extended, .tags' | \
while read -r h; read -r d; read -r e; read -r t; do
  # remove quotes from strings
  desc=$(echo $d | tr -d \")
  info=$(echo $e | tr -d \")
  link=$(echo $h | tr -d \")
  tags=$(echo $t | tr -d \")
  # add post description
  writeToFile "$desc"
  # add extended info if present
  if [ -n "$info" ]; then
    writeToFile "$info"
  fi
  # add tags if present (ex: #bitcoin #nostr)
  # tagline=""
  # if [ -n "$tags" ]; then
  #   for tag in $tags; do tagline+="#$tag "; done
  #   writeToFile "$tagline"
  # fi
  # add link
  writeToFile "$link"
  echo "" >> event.txt
done

cat event.txt
