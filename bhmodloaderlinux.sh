#!/bin/bash

# check if package is installed
is_installed() {
  command -v "$1" >/dev/null 2>&1
}

# install packages corresponding to users os
install_package() {
  case $1 in
    "apt")
      sudo apt update
      sudo apt install -y "$2"
      ;;
    "pacman")
      sudo pacman -S --noconfirm "$2"
      ;;
    "dnf")
      sudo dnf install -y "$2"
      ;;
    "zypper")
      sudo zypper install -y "$2"
      ;;
    *)
      echo "Package manager not supported."
      exit 1
      ;;
  esac
}

# simple os detection
PACKAGE_MANAGER=""
if [ -f /etc/debian_version ]; then
  PACKAGE_MANAGER="apt"
elif [ -f /etc/arch-release ]; then
  PACKAGE_MANAGER="pacman"
elif [ -f /etc/fedora-release ]; then
  PACKAGE_MANAGER="dnf"
elif [ -f /etc/SuSE-release ]; then
  PACKAGE_MANAGER="zypper"
else
  echo "Unsupported OS. Exiting..."
  exit 1
fi

# makes sure packages are installed
REQUIRED_PACKAGES=("wget" "wine")

for pkg in "${REQUIRED_PACKAGES[@]}"; do
  if ! is_installed "$pkg"; then
    echo "Installing $pkg..."
    install_package "$PACKAGE_MANAGER" "$pkg"
  else
    echo "$pkg is already installed."
  fi
done

echo "Ensure you have Steam, Proton 9.0, and that you've launched Brawlhalla from Steam at least once."
echo "If Proton 9.0 isn't installed on your main drive, you may need to edit the script!"

echo "Setting up environment..."
mkdir -p "/home/$USER/protonwinebhml"
mkdir -p "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader"

echo "Downloading necessary files..."
wget https://gamebanana.com/dl/669726 -O "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe"
wget https://github.com/Twig6943/BhModloaderLinux/blob/main/mh.jpg?raw=true -O "/home/$USER/.local/share/applications/mh.jpg"
wget https://github.com/Twig6943/BhModloaderLinux/blob/main/modloaderclient.png?raw=true -O "/home/$USER/.local/share/applications/modloaderclient.png"
wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u412-b08/openlogic-openjdk-8u412-b08-windows-x64.msi -O "/home/$USER/Downloads/ojdk.msi"
wget https://github.com/Kron4ek/Wine-Builds/releases/download/9.6/wine-9.6-amd64.tar.xz -O "/home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz"
wget https://raw.githubusercontent.com/Twig6943/BhModloaderLinux/main/desktop1.sh -O "/home/$USER/Downloads/desktop1.sh"

echo "Extracting Wine archive..."
tar -xvf "/home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz" -C "/home/$USER/protonwinebhml"
rm "/home/$USER/protonwinebhml/wine-9.6-amd64.tar.xz"

echo "Installing OpenJDK via Wine..."
WINEPREFIX="/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx" "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/Downloads/ojdk.msi"

echo "Launching Brawlhalla Mod Loader (close it if it doesn't work)..."
WINEPREFIX="/home/$USER/.steam/steam/steamapps/compatdata/291550/pfx" "/home/$USER/protonwinebhml/wine-9.6-amd64/bin/wine" "/home/$USER/.steam/steam/steamapps/compatdata/291550/drive_c/ProgramData/BrawlhallaModLoader/bhml.exe"

# Make the desktop1.sh an executable
chmod +x "/home/$USER/Downloads/desktop1.sh"
sh "/home/$USER/Downloads/desktop1.sh"
