#!/bin/sh

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
  full="$desc\n\n"
  # add extended info if present
  if [ -n "$info" ]; then
    full+="$info\n\n"
  fi
  # add tags if present (ex: #bitcoin #nostr)
  # if [ -n "$tags" ]; then
  #   for tag in $tags; do full+="#$tag "; done
  #   full+="\n\n"
  # fi
  # add link
  full+="$link\n\n\n"
  # write to file
  echo $full >> event.txt
done

cat event.txt