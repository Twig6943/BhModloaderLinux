#Brawlhalla mod loader Linux Install Script
#Debian
sudo apt install wget
#Arch
sudo pacman -S wget --noconfirm
#Fedora
sudo dnf install wget
echo "Make sure you have wget,tar Steam & Proton 9.0 installed."
echo "Make sure you've launched Brawlhalla from Steam at least once."
echo "Make sure you have Proton 9.0 installed to your main drive, if not edit the script!"
#Enviroment Setup Start
sleep 3
wine lifeisroblox.exe
mkdir /home/$USER/protonwinebhml
mkdir /home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader
wget https://gamebanana.com/dl/669726 -O /home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe
wget https://github.com/Twig6943/BhModloaderLinux/blob/main/mh.jpg?raw=true -O /home/$USER/.local/share/applications/mh.jpg
wget https://github.com/Twig6943/BhModloaderLinux/blob/main/modloaderclient.png?raw=true -O /home/$USER/.local/share/applications/modloaderclient.png
wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u412-b08/openlogic-openjdk-8u412-b08-windows-x64.msi -O /home/$USER/Downloads/ojdk.msi
wget https://github.com/Kron4ek/Wine-Builds/releases/download/9.6/wine-9.6-amd64.tar.xz -O /home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz
wget https://raw.githubusercontent.com/Twig6943/BhModloaderLinux/main/desktop1.sh -O /home/$USER/Downloads/desktop1.sh
tar -xvf /home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz -C /home/$USER/protonwinebhml 
rm /home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz
#Enviroment Setup Stop

#Proton/Wine stuff
echo "Install OpenJDK!"
sleep 5
WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/Downloads/ojdk.msi"
echo "This is probably going to give an error! Just close it (Even if it doesn't)."
sleep 5
WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/twig/.steam/steam/steamapps/common/Proton 9.0 (Beta)/files/bin/wine" "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe"
#Wine 9.4 Launch
echo "This'll probably work. Close it even doesn't"
sleep 5
WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe"
chmod +x /home/$USER/Downloads/desktop1.sh
sh /home/$USER/Downloads/desktop1.sh
#Desktop Entry1
#echo "Exec=WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx /home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine /home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe" >> bhml.desktop
#Desktop2
#echo "Exec=WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.wine/drive_c/users/twig/AppData/Roaming/BModloader/ModLoaderClient.exe %u"" >> modloader.desktop

#Don't forget to mark the script as executable
#If you experience any issues add me on discord. My discord is twig6843
