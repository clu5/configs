#!/bin/bash

# Configuration installation script for tmux and vim
# This script runs the install scripts for vim and tmux

set -e

echo "Installing vim configuration and plugins..."
./install_vim.sh
echo "✓ Vim installation complete"

echo "Installing tmux configuration..."
./install_tmux_config.sh
echo "✓ Tmux installation complete"

echo "All configurations installed successfully!"