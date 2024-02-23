#!/bin/sh

echo fetching from pinboard
./fetch.sh

echo creating event text
./create.sh

echo publishing event to relays
./publish.sh
