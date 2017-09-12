#!/bin/bash

# NO: Last opp bilder og slett dem deretter
# EN: Upload files and delete afterwards
sudo rsync --remove-source-files -z /home/pi/FTP/kameranavn/*.jpg brukernavn@eksempel.no:CloudCam/kameranavn/log/