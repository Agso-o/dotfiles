#!/usr/bin/env bash

set -euo pipefail

echo "-----Instaling pacman needed packages-----"
sudo pacman -Syu --needed \
    git go base-devel stow \
    pipewire pipewire-pulse \
    wireplumber alacritty \
    xdg-desktop-portal-gnome \
    neovim firefox fastfetch \
    kitty lf okular vlc loupe \
    make less papirus-icon-theme \
    starship ttf-jetbrains-mono

if ! command -v yay &>/dev/null; then
    "------Instaling AUR helper (yay)-----"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi 

echo "-----Instaling yay needed packages-----"
yay -S --needed \
    niri \
    noctalia-shell \

echo "-----Setting up config files-----"
stow alacritty
stow fastfetch
stow kitty
stow niri
stow nvim

echo "-----Setting up Bashrc-----"
echo "fastfetch" >> $HOME/.bashrc
echo "eval "$(starship init bash)"" >> $HOME/.bashrc

starship preset catppuccin-powerline -o ~/.config/starship.toml

echo "config finished"
