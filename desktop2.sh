# Prompt the user for their username
read -p "Enter your username: " username

goverlay_desktop_file="/home/$USER/.local/share/applications/bhmc.desktop"
sudo echo "[Desktop Entry]" > "$goverlay_desktop_file"
sudo echo "Name=Brawlhalla Mod Creator" >> "$goverlay_desktop_file"
sudo echo "Exec=WINEPREFIX=/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModCreator/bhmc.exe"" >> "$goverlay_desktop_file"
sudo echo "Icon=/home/$USER/.local/share/applications/mh.jpg" >> "$goverlay_desktop_file"
sudo echo "Type=Application" >> "$goverlay_desktop_file"
sudo echo "Categories=Games;" >> "$goverlay_desktop_file"

# Replace USER_PLACEHOLDER with the actual username
sed -i "s|USER_PLACEHOLDER|$username|g" "$goverlay_desktop_file"

echo "\e[0;31mInstallation finished.\e"
