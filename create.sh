#!/bin/bash

writeToFile () {
  echo $1 >> event.txt
  echo "" >> event.txt
}

first_post=true

# create file with event date as first line of text
writeToFile "GM! $(date +%A) assorted links:" > event.txt

# add posts
cat posts.json | jq '.[] | select(.shared=="yes") | .href, .description, .extended, .tags' | \
while read -r h; read -r d; read -r e; read -r t; do
  # remove quotes from strings and substitute '\n' with newlines
  desc=$(echo $d | tr -d \" | sed 's/\\n/\n/g')
  info=$(echo $e | tr -d \" | sed 's/\\n/\n/g')
  link=$(echo $h | tr -d \")
  tags=$(echo $t | tr -d \")
  # add post separator unless is first post
  if [ "$first_post" = true ]; then
    first_post=false
  else
    writeToFile "---"
  fi
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
  writeToFile "🔗 $link"
done

cat event.txt
