#!/bin/bash

iconcolor=#eb6f92

output=$(cmus-remote -C status)
artist=$(echo "$output" | grep "^tag artist" | cut -c 12-)
path=$(echo "$output" | grep "^file" | cut -c 12-)
cmusstatus=$(echo "$output"| grep "^status" | cut -c 8-)
case $cmusstatus in 
    "playing")
        icon=" "
        ;;
    "paused")
        icon=" "
        ;;
    "stopped")
        echo
        exit 0
esac

if [[ $artist = *[!\ ]* ]]; then
    song=$(echo "$output" | grep "^tag title" | cut -c 11-)

    echo -n "%{F$iconcolor}$icon%{F-} $artist %{F$iconcolor}-%{F-} $song"
elif [[ $path = *[!\ ]* ]]; then
    IFS="/"
    read -ra parts <<< "$path"
    for i in "${parts[@]}"; do
        file=$i
    done
    echo -n "%{F$iconcolor}$icon%{F-} $file"
else
        echo
fi

