#!/bin/sh

source ./.env.local # for authtoken
yesterday=$(date -v-1d +%FT%TZ)

# fetch latest posts from pinboard
curl -s "https://api.pinboard.in/v1/posts/all?fromdt=${yesterday}&format=json&auth_token=$authtoken" | jq . > posts.json
