#!/bin/bash
sleep 3s
streamer -f jpeg -o image.jpeg

DICT="$(sudo -u debian twurl -H upload.twitter.com '/1.1/media/upload.json' -f image.jpeg -F media -X POST)"
#echo "${DICT}"

MEDIA_ID="$(sudo -u debian python dict_parse.py ${DICT})"
#echo "${MEDIA_ID}"

DATE="$(date)"

sudo -u debian twurl '/1.1/statuses/update.json' -d "media_ids=$MEDIA_ID&status=$DATE"

rm image.jpeg
