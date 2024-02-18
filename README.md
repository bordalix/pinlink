# Pinlink

Shell script to fetch new posts from pinboard.in and publish to Nostr

It gets posts with less than 24 hours, configurable in [fetch.sh](./fetch.sh)

The list of relays is configurable in [publish.sh](./publish.sh)

## Requirements

- [nak](https://github.com/fiatjaf/nak), the nostr army knife
- [jq](https://jqlang.github.io/jq/), a command-line JSON processor

## How to use it

Clone this repo:

```bash
$ git clone https://github.com/bordalix/pinlink
$ cd pinlink
```

Add your credentials to file `.env.local`:

```bash
# get it from pinboard.in > settings > password
$ echo "authtoken=username:1234567890ABCDEF" > .env.local
# your nostr private key in hexadecimal format
$ echo "seckey=<64 hex chars>" >> .env.local
```

There are 4 executable scripts:

- [fetch.sh](./fetch.sh) fetches new posts from pinboard.in and saves to `posts.json`
- [create.sh](./create.sh) from `intro.txt` and `posts.json` creates `event.txt` with full text for the event to be published
- [publish.sh](./publish.sh) gets event content from `event.txt`, signs and publishes it to list of relays
- [run.sh](./run.sh) run all 3 previous scripts in sequence
