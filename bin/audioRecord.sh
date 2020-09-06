#!/bin/bash
# Record icecast2 stream to audio file

NOW=$(/bin/date +"%Y-%m-%d-%H%M%S")

HOST=snapshots.computervision.local
DIRECTORY="/home/jody/audiorecords/"

# ffmpeg -thread_queue_size 512 -y -i http://computervision:8000/warregrille 201930062249.ogg
ffmpeg -thread_queue_size 512 -y -i http://$HOST:8000/warre -t '00:01:00' $DIRECTORY$NOW.ogg


echo recorded file: $DIRECTORY$NOW.ogg