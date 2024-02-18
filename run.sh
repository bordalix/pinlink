#!/bin/sh

# fetch from pinboard
./fetch.sh

# create event text
./create.sh

# publish to relays
./publish.sh
