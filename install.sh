#!/bin/bash

# Check if Vim has been installed
if ! command -v vim >/dev/null 2>&1; then
  echo "Vim is not installed. Please install Vim before running this script."
  exit 1
fi

# Make undodir
if [ ! -d ~/.vim/undodir ]; then
    mkdir -p ~/.vim/undodir
fi

# Check if the package manager has been installed
if [ ! -d ~/.vim/pack/plugins/start ]; then
  echo "Vim package manager is not installed. Installing now..."
  mkdir -p ~/.vim/pack/plugins/start
  vim -u NONE -c "helptags vim-8.2.0098/doc" -c q
fi

# Install the plugin
cd ~/.vim/pack/plugins/start
echo "Installing ale..."
git clone https://github.com/dense-analysis/ale
echo "Installing nerdtree..."
git clone https://github.com/preservim/nerdtree
echo "Installing gruvbox..."
git clone https://github.com/morhetz/gruvbox
echo "Installing vim-flake8..."
git clone https://github.com/nvie/vim-flake8

# Check if Python is installed
if ! command -v python3 >/dev/null 2>&1; then
  echo "Python is not installed. Please install Python before running this script."
  exit 1
fi

# Install the packages
echo "Installing packages..."
pip3 install black isort flake8

echo "Done!"
