#!/bin/bash
#This Script is for installation of the agent

endgameStatus=$(pgrep esensor)
#Create Temp Folder
DATE=$(date '+%Y-%m-%d-%H-%M-%S')
TempFolder="Download-$DATE"

if [[ $endgameStatus ]]; then
echo "endgame is running/installed, not downloading or installing"
exit 0
else
    mkdir /tmp/$TempFolder
    # Navigate to Temp Folder
    cd /tmp/$TempFolder

    #Download Required Files
    #CFG File
    curl -LJOs https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.62.5.cfg
    # Capture name of Download File and report it
    DownloadedCFGFile="$(ls)"
    echo "Downloaded $DownloadedCFGFile to /tmp/$TempFolder"
    #INSTALL File
    curl -LJOs https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.62.5
    # Capture name of Download File and report it
    DownloadedINSTALLFile="$(ls)"
    echo "Downloaded $DownloadedINSTALLFile to /tmp/$TempFolder"
    chmod +x $DownloadedINSTALLFile

    echo "stating install"
    ./$DownloadedINSTALLFile -c $DownloadedCFGFile -k 1E500BF92DFCF6F7F1AB -d false -l install.log
    if [ $? -eq 0 ]; then
        echo "Installer ran successfully"
        Sleep 30
        endgameStatus=$(pgrep esensor)
        if [[ $endgameStatus ]]; then
            echo "endgame started successfully after install"
            exit 0
        else
            echo "endgame failed to start after install"
            exit 1
        fi
    fi
fi
