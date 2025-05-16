#!/bin/bash

set -e

echo "Creating symlinks..."

ln -s "$HOME/dotfiles/config/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/config/nvim" "$HOME/.config/nvim"
ln -s "$HOME/dotfiles/config/kitty" "$HOME/.config/kitty"
ln -s "$HOME/dotfiles/config/hypr" "$HOME/.config/hypr"
ln -s "$HOME/dotfiles/config/keyd" "/etc/keyd"

echo "Symlinks created!"
