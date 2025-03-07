#!/bin/bash

url=$(xclip -o -sel clip)

if [[ -z "$url" ]]; then
  notify-send "Error" "Clipboard is empty"
  exit 1
fi

temp_dir=$(mktemp -d) || { echo "Error: Could not create temp directory"; exit 1; }

video_url=$(yt-dlp -g "$url" 2>/dev/null)
if [[ -z "$video_url" ]]; then
    video_url="$url"
fi

# Download thumbnail (robust approach)
if ! yt-dlp --write-thumbnail --skip-download -o "$temp_dir/thumbnail" "$url" 2>/dev/null; then  # Check for errors!
    echo "Error: Thumbnail download failed!"
    notify-send "Error" "Thumbnail download failed!"
    rm -rf "$temp_dir"  # Clean up even if thumbnail fails
    exit 1  # Exit the script on thumbnail failure
fi

# Find the actual thumbnail file
thumbnail_file=$(find "$temp_dir" -name "thumbnail.*" | head -n 1)

if [[ -n "$thumbnail_file" ]]; then
    echo "Thumbnail file found: $thumbnail_file"

    # Convert to JPEG (if it's not already)
    thumbnail_path_jpg="$temp_dir/thumbnail.jpg"
    if [[ ! "$thumbnail_file" == *".jpg" ]]; then
        if ! magick "$thumbnail_file" "$thumbnail_path_jpg"; then # Use magick convert
            echo "Error: Thumbnail conversion to JPEG failed!"
            notify-send "Error" "Thumbnail conversion to JPEG failed!"
            rm -rf "$temp_dir"
            exit 1
        fi
        echo "Thumbnail converted to JPEG. New path: $thumbnail_path_jpg"

        # *** The Crucial Fix 1: Wait for file permissions to be set ***
        while ! [[ -r "$thumbnail_path_jpg" ]]; do  # Wait until readable
            sleep 0.1  # Check every 100ms
        done

        chmod 600 "$thumbnail_path_jpg" || echo "Error setting permissions on thumbnail"

        # *** The Crucial Fix 2: Escape the path for notify-send ***
        thumbnail_path_escaped=$(printf '%q' "$thumbnail_path_jpg") # Escape the path

        notify-send -t 3000 -i "$thumbnail_path_escaped" "Playing Video" "$url" # Use escaped path

    else
        # *** The Crucial Fix 1: Wait for file permissions to be set ***
        while ! [[ -r "$thumbnail_file" ]]; do  # Wait until readable
            sleep 0.1  # Check every 100ms
        done

        chmod 600 "$thumbnail_file" || echo "Error setting permissions on thumbnail"

        # *** The Crucial Fix 2: Escape the path for notify-send ***
        thumbnail_file_escaped=$(printf '%q' "$thumbnail_file") # Escape the path

        notify-send -t 3000 -i "$thumbnail_file_escaped" "Playing Video" "$url" # Use escaped path
    fi
else
    echo "Error: No thumbnail file found!"
    notify-send "Error" "No thumbnail file found!"
    rm -rf "$temp_dir"
    exit 1
fi

# Cleanup *after* notify-send
rm -rf "$temp_dir" || { echo "Error: Could not remove temp directory"; exit 1; }  # Cleanup is last!

if mpv "$url" & then
  :
else
  notify-send "Error" "mpv failed to play video"
  exit 1
fi
