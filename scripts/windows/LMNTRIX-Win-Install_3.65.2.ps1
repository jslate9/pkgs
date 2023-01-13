#Set variables
DATE=$(date '+%Y-%m-%d-%H-%M-%S')
TempFolder="Download-$DATE"

#Make Working folder in temp
mkdir /tmp/$TempFolder

# Navigate to Temp Folder
cd /tmp/$TempFolder

#Download Files
#CFG File
curl -LJO https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/macos/SensorMacOSInstaller-RIVALRY_Detect_3.62.5.cfg
# Capture name of Download File and report it
DownloadedCFGFile="$(ls)"


#Install File




#Install App
#<driver>.exe -c <driver>.cfg -k 1E500BF92DFCF6F7F1AB -d false -l C:\Windows\Temp\Respond_Installer.txt