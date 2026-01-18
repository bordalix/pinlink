#!/bin/bash

source ./vars.sh
source ./.env.local # for seckey

filesize=$(wc -c < $content_file)

if [ $filesize -le 100 ]; then
  exit "file too small"
fi

# verify on https://snort.social/npub16c0l92flapw0qrrkx4wk0y63e252yvr58u4rr832trnfpqgrfwnqre85ac
nak event -c "`cat $content_file`" --sec $seckey $relays > $last_event
