# Prompt the user for their username
read -p "Enter your username: " username

goverlay_desktop_file="/home/$USER/.local/share/applications/bhml.desktop"
sudo echo "[Desktop Entry]" > "$goverlay_desktop_file"
sudo echo "Name=Brawlhalla Mod Loader" >> "$goverlay_desktop_file"
sudo echo "Exec=WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe"" >> "$goverlay_desktop_file"
sudo echo "Icon=/home/$USER/.local/share/applications/mh.jpg" >> "$goverlay_desktop_file"
sudo echo "Type=Application" >> "$goverlay_desktop_file"
sudo echo "Categories=Games;" >> "$goverlay_desktop_file"

# Replace USER_PLACEHOLDER with the actual username
sed -i "s|USER_PLACEHOLDER|$username|g" "$goverlay_desktop_file"


#Desktop2
# Prompt the user for their username
read -p "Enter your username: " username

goverlay1_desktop_file="/home/$USER/.local/share/applications/modloader.desktop"
sudo echo "[Desktop Entry]" > "$goverlay1_desktop_file"
sudo echo "Name=ModLoaderClient" >> "$goverlay1_desktop_file"
sudo echo "Exec=Exec=WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.wine/drive_c/users/twig/AppData/Roaming/BModloader/ModLoaderClient.exe %u"" >> "$goverlay1_desktop_file"
sudo echo "Icon=/home/$USER/.local/share/applications/modloaderclient.png" >> "$goverlay1_desktop_file"
sudo echo "Type=Application" >> "$goverlay1_desktop_file"
sudo echo "Categories=Games;" >> "$goverlay1_desktop_file"
sudo echo "MimeType=x-scheme-handler/bmod" >> "$goverlay1_desktop_file"

# Replace USER_PLACEHOLDER with the actual username
sed -i "s|USER_PLACEHOLDER|$username|g" "$goverlay1_desktop_file"

echo "\e[0;31mInstallation finished.\e"
