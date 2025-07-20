#!/bin/bash
set -e

CFG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DOTFILES_USER="saltytine"

echo "[*] installing base packages"
sudo apt update
sudo apt install -y \
  ranger btop kew git curl unzip \
  node-typescript make gnome-shell-extension-prefs \
  tmux flatpak

echo "[*] enabling flathub repo"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "[*] installing pop-shell"
rm -rf /tmp/pop-shell
git clone https://github.com/pop-os/shell.git /tmp/pop-shell
cd /tmp/pop-shell
git checkout master_noble
make local-install
cd ~

echo "[*] installing nvim (snap for v11)"
sudo snap install nvim --classic

echo "[*] installing kitty"
sudo apt install kitty

echo "[*] cloning config repos"
declare -A repos=(
  [nvim]="https://github.com/$DOTFILES_USER/nvim.git"
  [ranger]="https://github.com/$DOTFILES_USER/ranger.git"
  [btop]="https://github.com/$DOTFILES_USER/btop.git"
  [kitty]="https://github.com/$DOTFILES_USER/kitty.git"
)

mkdir -p "$CFG_DIR"

for name in "${!repos[@]}"; do
  echo "[*] installing config for $name"
  rm -rf "$CFG_DIR/$name"
  git clone --depth=1 "${repos[$name]}" "$CFG_DIR/$name"
done

echo "[*] installing tmux.conf"
rm -f ~/.tmux.conf
git clone --depth=1 https://github.com/$DOTFILES_USER/tmux.git /tmp/tmux
cp /tmp/tmux/tmux.conf ~/.tmux.conf
rm -rf /tmp/tmux

echo "[*] overwriting .bashrc"
rm -f ~/.bashrc
git clone --depth=1 https://github.com/$DOTFILES_USER/bashrc.git /tmp/bashrc
cp /tmp/bashrc/.bashrc ~/
rm -rf /tmp/bashrc

echo "[*] setting kew music path"
kew path "$HOME/Music/"

echo "[*] setting up Coding dir + scripts"
mkdir -p ~/Coding
rm -rf ~/Coding/scripts
git clone --depth=1 https://github.com/$DOTFILES_USER/scripts.git ~/Coding/scripts

echo "[*] making scripts executable"
find ~/Coding/scripts -type f -name "*.sh" -exec chmod +x {} \;

echo "[*] done. reboot, relog, or source .bashrc"
