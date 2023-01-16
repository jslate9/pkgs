#Set variables
$Date = (Get-Date).tostring("yy-MM-dd-HH-mm-ss") 
$folderPath = "C:\Windows\Temp"
$exe = "LMNTRIX_Endgame_3.65.2.exe"
$cfg = "LMNTRIX_Endgame_3.65.2.cfg"


#Make Working folder in temp && Capture Folder Name
$foldername = (New-Item -ItemType Directory -Path $folderPath -Name LMNTRIX_$Date).name

# Navigate to Temp Folder
cd $folderpath\$foldername

#Download Files
#CFG File
wget "https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/windows/SensorWindowsInstaller-RIVALRY_Detect_3.62.5.cfg" -outfile $folderpath\$foldername\$cfg

# Capture name of Download File and report it
if(test-path $folderpath\$foldername\$cfg){
echo "CFG File downloaded "$folderpath\$foldername\$cfg
} else {
echo "CFG File not downloaded"}

#EXE File
wget "https://github.com/jslate9/pkgs/raw/main/installers/LMNTRIX/windows/SensorWindowsInstaller-RIVALRY_Detect_3.62.5.exe" -outfile $folderpath\$foldername\$exe
# Capture name of Download File and report it
if(test-path $folderpath\$foldername\$exe){
echo "exe File downloaded "$folderpath\$foldername\$exe
} else {
echo "exe File not downloaded"}



#Install App
$folderpath\$foldername\$exe -c $folderpath\$foldername\$cfg -k 1E500BF92DFCF6F7F1AB -d false -l C:\Windows\Temp\Respond_Installer.txt
