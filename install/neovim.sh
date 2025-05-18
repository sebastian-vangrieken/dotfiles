#!/bin/bash

pacman -Syu

pacman -S neovim luarocks lua51 wget --no-confirm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
