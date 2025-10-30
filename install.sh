#!/usr/bin/env bash
set -e

echo "==> Starting Arch setup..."
echo "=============================="

# --- Helpers ---------------------------------------------------------------
exists() { command -v "$1" >/dev/null 2>&1; }

# --- Update system ---------------------------------------------------------
echo "==> Updating system..."
sudo pacman -Syu --noconfirm

# --- Install essential base tools ------------------------------------------
echo "==> Installing base packages..."
sudo pacman -S --needed --noconfirm git base-devel stow curl wget vim

# --- Install official repo packages ---------------------------------------
if [[ -f pkglist.txt ]]; then
  echo "==> Installing packages from pkglist.txt..."
  sudo pacman -S --needed --noconfirm - < pkglist.txt
else
  echo "⚠️  pkglist.txt not found, skipping official packages."
fi

# --- Install AUR helper (yay) ---------------------------------------------
if ! exists yay; then
  echo "==> Installing yay (AUR helper)..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  (cd /tmp/yay && makepkg -si --noconfirm)
  rm -rf /tmp/yay
fi

# --- Install AUR packages --------------------------------------------------
if [[ -f aurlist.txt ]]; then
  echo "==> Installing AUR packages..."
  yay -S --needed --noconfirm - < aurlist.txt
else
  echo "⚠️  aurlist.txt not found, skipping AUR packages."
fi

# --- Fonts (optional) ------------------------------------------------------
echo "==> Installing developer fonts..."
sudo pacman -S --needed --noconfirm ttf-firacode ttf-jetbrains-mono ttf-font-awesome

# --- Stow dotfiles ---------------------------------------------------------
if [[ -f stow.sh ]]; then
  echo "==> Linking dotfiles with stow..."
  ./stow.sh
else
  echo "⚠️  stow.sh not found, skipping dotfile linking."
fi

# --- Enable system services (edit as needed) -------------------------------
echo "==> Enabling useful system services..."
sudo systemctl enable --now sshd.service || true
sudo systemctl enable --now NetworkManager.service || true

# --- Developer setup (git, shell, etc.) ------------------------------------
echo "==> Setting up dev environment..."

# Git defaults
git config --global user.name "${GIT_NAME:-Your Name}"
git config --global user.email "${GIT_EMAIL:-you@example.com}"
git config --global core.editor "nvim"

# Default shell
if exists zsh; then
  echo "==> Setting zsh as default shell..."
  chsh -s "$(command -v zsh)" || true
fi

# --- Finish ---------------------------------------------------------------
echo ""
echo "✅ All done!"
echo "Reboot or re-login for all changes to take effect."
echo "=============================="

