#!/bin/bash

# NO: Kopier nyeste bilde for visning i browser
# EN: Make copy of latest image for display in browser
cp $(ls -t /CloudCam/kameranavn/log/* | head -1) /CloudCam/kameranavn/kameranavn.jpg