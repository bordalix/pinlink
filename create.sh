#!/bin/bash

declare -a greetings=(
  "Bom dia"
  "Good Morning"
  "Buenos días"
  "Bonjour"
  "Guten Morgen"
  "Ohayō gozaimasu"
  "Nǐ hǎo"
  "Namaste"
  "Добрае раніца"
  "Bună dimineața"
  "Dobrý ráno"
)

function get_random_good_morning() {
  local random_index=$((RANDOM % ${#greetings[@]}))
  echo "${greetings[$random_index]}"
}


writeToFile () {
  echo $1 >> event.txt
  echo "" >> event.txt
}

first_post=true

# create file with event date as first line of text
echo -n > event.txt
writeToFile "$(get_random_good_morning)!"
writeToFile "$(date +%A) assorted links:"

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
