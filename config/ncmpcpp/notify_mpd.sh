#!/bin/bash

music_library="/mnt/Kingston/Music/"

fallback_image="/home/ahloi/.config/ncmpcpp/NewJeansRabbit128.svg"

ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" /tmp/mpd_cover.jpg > /dev/null 2>&1 && \

notify-send -e -i /tmp/mpd_cover.jpg "Now Playing:" "$(mpc current)" || \

notify-send -e -i $fallback_image "Now Playing:" "$(mpc current)"


