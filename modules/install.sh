#!/usr/bin/env bash
set -e

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Installing official packages..."
sudo pacman -S --needed --noconfirm - < pkglist.txt

# Check for AUR helper (yay)
if ! command -v yay &> /dev/null; then
  echo "==> Installing yay (AUR helper)..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
fi

echo "==> Installing AUR packages..."
yay -S --needed --noconfirm - < aurlist.txt

echo "==> Done! All packages installed."
