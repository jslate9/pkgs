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
DownloadedCFGFile="$(ls)"
echo "Downloaded $DownloadedCFGFile to /tmp/$TempFolder"

#INSTALL File
curl -LJO https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.60.2
# Capture name of Download File and report it
DownloadedINSTALLFile="$(ls)"
echo "Downloaded $DownloadedINSTALLFile to /tmp/$TempFolder"


chmod +x $DownloadedINSTALLFile
sudo ./$DownloadedINSTALLFile -c $DownloadedCFGFile.cfg -k 1E500BF92DFCF6F7F1AB -d false -l install.log