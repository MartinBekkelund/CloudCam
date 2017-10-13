#!/bin/bash

# NO: Hent bilder fra webserveren og slett dem derfra
# EN: Get images from webserver and delete
rsync --remove-source-files -e ssh brukernavn@eksempel.no:/CloudCam/kameranavn/log/*.jpg /mnt/disknavn/CloudCam/kameranavn/input/

# NO: Tidsstemplet tar.gz (zip-ish) for backup
# EN: Time stamped tar.gz (zip-sih) for backup
tar -czf /mnt/disknavn/CloudCam/kameranavn/backup/kameranavn_backup_$(date +%Y-%m-%d).tar.gz /mnt/disknavn/CloudCam/kameranavn/input/*.jpg

# NO: Lage tidsstemplet time-lapse
# NO: 30 indikerer bilder per sekund og finnes to steder
# EN: Make time stamped time-lapse
# EN: 30 indicates frames per second and is found twice
avconv -r 30 -i /mnt/disknavn/CloudCam/kameranavn/input/%*.jpg -r 30 -vcodec libx264 -crf 25 -preset slow -g 15 /mnt/disknavn/CloudCam/kameranavn/output/kameranavn_daglig_$(date +%Y-%m-%d).mp4

# NO: Slette input-filer
# EN: Delete input files
rm /mnt/disknavn/CloudCam/kameranavn/input/*.jpg

# NO: Kopiere timelapse til webserveren
# EN: Copy time-lapse to webserver
scp /mnt/disknavn/CloudCam/kameranavn/output/01_zavio_daglig_$(date +%Y-%m-%d).mp4 brukernavn@eksempel.no:/CloudCam/kameranavn/kameranavn_daglig.mp4
