#!/bin/bash
#This Script is for installation of the agent

endgameStatus=$(pgrep esensor)
#Create Temp Folder
DATE=$(date '+%Y-%m-%d-%H-%M-%S')
TempFolder="Download-$DATE"
mkdir /tmp/$TempFolder
# Navigate to Temp Folder
cd /tmp/$TempFolder

if [[ $endgameStatus ]]; then
    echo "endgame is running/installed, proceeding to uninstall"
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

    echo "Changing permissions to uninstall file"
    chmod +x $DownloadedINSTALLFile
    echo "Starting uninstaller"
    ./$DownloadedINSTALLFile -c $DownloadedCFGFile -k 1E500BF92DFCF6F7F1AB -u force -l uninstall.log
    if [ $? -eq 0 ]; then
        echo "Uninstaller ran successfully"
        Sleep 30
        endgameStatus=$(pgrep esensor)
        if [[! $endgameStatus ]]; then
            echo "endgame successfully uninstalled"
            exit 0
        else
            echo "endgame failed to uninstall"
            exit 1
        fi
    fi
    echo "Deleting endgame .app file from Applications Directory"
    rm -rf /Applications/Endgame.app
    echo "/tmp/$TempFolder/uninstall.log"


else
    echo "Endgame is not installed"
    exit 1
fi
