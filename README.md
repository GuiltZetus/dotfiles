# Description
dotfiles for all my arch config 

# Installation
```
cd
mkdir .dotfiles
git clone https://github.com/GuiltZetus/dotfiles.git ~/.dotfiles
```
# Dependencies
## pacman:
```
nvim hyprland rofi fcitx5 fcitx5-configtool fcitx5-chinese-addons ncsway brightnessctl hyprsunset 
```
## yay:
```
oh-my-posh fcitx5-bamboo python-mutagen
```
## vulkan dependencies (pacman):
```
vulkan-devel glfw-wayland glslc libxi libxxf86vm glm shaderc
```
# useful application
## with pacman
```
obsidian syncthing yt-dlp ffmpeg
```
### Make sure you start the system service for syncthing
```
systemctl --user enable syncthing.service
systemctl --user start syncthing.service
```
# Additional Settings
### For any Electron Application you need to launch them with these settings 
```
--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime
```

# Run this in terminal 
```
cd .dotfiles
stow alacritty hypr nvim rofi waybar yt-dlp
```


# Home server settings
## Dependencies
```
sudo apt install apache2 mariadb-server php libapache2-mod-php php-gd php-curl php-zip php-xml php-mbstring php-imagick php-mysql php-fpm php-intl php-json php-gmp php-bcmath php-apcu redis-server ufw unzip -y 
```
