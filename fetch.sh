#!/bin/bash

source ./.env.local # for authtoken

os=${uname}
if [ os == 'Darwin' ]; then
  yesterday=$(date -v-1d +%FT%TZ)
else
  yesterday=$(date -d "1 day ago" +%FT%TZ)
fi


# fetch latest posts from pinboard
curl -s "https://api.pinboard.in/v1/posts/all?fromdt=${yesterday}&format=json&auth_token=$authtoken" | jq . > posts.json
