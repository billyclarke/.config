#!/bin/bash

spotify_pid=$(pgrep spotify)
if [ "$spotify_pid" != "" ]; then
  eval spotify_script="~/.config/i3status/spotify_status_generator.py"
  spotify_part=$($spotify_script)
  echo $spotify_part
else 
  spotify_part=""
fi


pandora_pid=$(pgrep pithos)
if [ "$pandora_pid" != "" ]; then
  eval pandora_script="~/.config/i3status/pandora_status_generator.py"
  pandora_part=$($pandora_script)
  echo $pandora_part
  music_part=$pandora_part
else 
  pandora_part=""
  music_part=$spotify_part
fi
