#!/bin/bash
LAST_URL=""
while [ 1 ]
do
        CLIP=$(xsel -bo)
        if [[ $CLIP =~ (((http(s)?://(www\.)?)|(www\.)|\s)(youtu\.be|youtube\.com)/(embed/|v/|watch(\?v=|\?.+&amp;v=|/))?([a-zA-Z0-9._\/~#&amp;=;%+?\!]+)) ]]; then
                if [ "$LAST_URL" = "$CLIP" ] ; then
                        #same link
                        :
                else
                        echo "found youtube link"
                        LAST_URL=$CLIP
                        yt-dlp -o - "$CLIP" | mpv  -
                fi
        else
                :
                #no yt link
        fi
        sleep 5
done
