#!/bin/bash

source ./.env.local # for seckey, pubkey
source ./vars.sh # for last_event, relays

p_tag="[\"p\", \"$pubkey\"]"
id=$(cat $last_event | jq -r .id)
e_tag="[\"e\", \"${id}\", \"wss://nos.lol\"]"
echo "{\"tags\": [$e_tag,$p_tag]}" | \
nak event -k 6 -c "`jq -Rs . $last_event`" --sec $seckey $relays