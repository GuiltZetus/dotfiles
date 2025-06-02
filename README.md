# Description
dotfiles for all my arch config 
# Dependencies
## pacman:
```
nvim hyprland rofi fcitx5 fcitx5-configtool fcitx5-chinese-addons ncsway brightnessctl
```
## yay:
```
oh-my-posh fcitx5-bamboo
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

