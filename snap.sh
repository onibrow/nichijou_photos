#!/bin/bash
streamer -f jpeg -o image.jpeg

DICT="$(twurl -H upload.twitter.com '/1.1/media/upload.json' -f image.jpeg -F media -X POST)"
echo "${DICT}"

MEDIA_ID="$(python dict_parse.py ${DICT})"
echo "${MEDIA_ID}"

DATE="$(date)"
twurl '/1.1/statuses/update.json' -d "media_ids=$MEDIA_ID&status=$DATE"
