#!/bin/bash

pacman -Syu

pacman -S neovim luarocks lua51 ripgrep python python-pip --no-confirm

# Node install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
npm install -g npm
npm install -g neovim

# Python venv setup
mkdir -p ~/.venv
python -m venv ~/.venv/python-venv
source ~/.venv/python-venv/bin/activate
python -m pip install pynvim
deactivate
