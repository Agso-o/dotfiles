#!/usr/bin/env bash

set -euo pipefall

sudo pacman -Syu --needed \
    git go base-devel stow \
    obs-studio pipewire pipewire-pulse wireplumber \
    xdg-desktop-portal-gnome \
    neovim firefox fastfetch kitty alacritty \
    lf okular vlc steam loupe make 

if ! comand -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si
    cd ..
    rm -rf yay
fi 

yay -S --needed \
    niri \
    noctalia-shell \
    android-studio \
    arduino-ide-bin

stow alacritty 
stow fastfetch
stow kitty 
stow niri 
stow nvim 

