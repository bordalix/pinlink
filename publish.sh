#!/bin/bash

source ./.env.local # for seckey

relays="wss://nos.lol wss://relay.primal.net wss://relay.damus.io wss://relay.nostr.band wss://nostr.bitcoiner.social"

# verify on https://snort.social/npub16c0l92flapw0qrrkx4wk0y63e252yvr58u4rr832trnfpqgrfwnqre85ac
nak event -c "`cat event.txt`" --sec $seckey $relays
