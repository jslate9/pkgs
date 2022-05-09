#!/bin/bash
#This Script is for installation of the agent

#Create Temp Folder
DATE=$(date '+%Y-%m-%d-%H-%M-%S')
TempFolder="Download-$DATE"
mkdir /tmp/$TempFolder
# Navigate to Temp Folder
cd /tmp/$TempFolder

#Download Required Files
#CFG File
curl -LJO https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.60.2.cfg
# Capture name of Download File and report it
DownloadFile="$(ls)"
echo "Downloaded $DownloadFile to /tmp/$TempFolder"
#INSTALL File
curl -LJO https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.60.2
# Capture name of Download File and report it
DownloadFile="$(ls)"
echo "Downloaded $DownloadFile to /tmp/$TempFolder"

