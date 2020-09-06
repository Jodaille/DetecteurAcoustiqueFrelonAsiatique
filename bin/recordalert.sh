#!/bin/bash
NOW=$(/bin/date +"%Y-%m-%d-%H%M%S")

echo $NOW >> /home/jody/recordalert.log

# /home/jody/record_rtsp_ffmpeg.sh 200 &
/home/jody/BeehiveSnapshots/bin/audioRecord.sh &

/home/jody/record_rtsp_ffmpeg.sh 201 &

/home/jody/BeehiveSnapshots/bin/snap_with_params.sh 200 .5 &

/home/jody/BeehiveSnapshots/bin/snap_with_params.sh 202 .5 &

