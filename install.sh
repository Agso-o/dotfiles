#!/usr/bin/env bash

set -euo pipefall

# Install important packages
sudo pacman -Syu --needed \
    git go base-devel stow \
    pipewire pipewire-pulse \
    wireplumber alacritty \
    neovim firefox fastfetch kitty \
    lf okular vlc loupe make 

# Install WM and needed packages 
sudo pacman -S --needed \
    niri xwayland-satellite \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    quickshell dms-shell \
    qt5-base qt6-base dgop \
    matugen



if ! comand -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si
    cd ..
    rm -rf yay
fi

yay -S --needed \
    dankcalendar-bin \
    dsearch-bin \
    greetd-dms-greeter-bin

stow alacritty
stow fastfetch
stow kitty
stow niri
stow nvim

dms setup

