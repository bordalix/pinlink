#
# fetch.sh > posts.json > create.sh > content.txt > publish.sh > event.json > repost.sh
#

# pinboard posts file (output of fetch.sh, input to create.sh)
pinboard_posts="posts.json"

# content file (output of create.sh, input to publish.sh)
content_file="content.txt"

# last published event file (output of publish.sh, input to repost.sh)
last_event="event.json"

# Nostr relays to use
relays="wss://nos.lol wss://relay.primal.net wss://relay.damus.io wss://relay.nostr.band wss://nostr.bitcoiner.social"
