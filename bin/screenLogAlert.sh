#!/bin/bash
# screenLogAlert.sh
# read ESP32-cam log file and send detected alert to record images and audio

SCREEN_LOG="/home/jody/ESP.log"
tail -n 1 -f $SCREEN_LOG | ~/bin/readLog.php