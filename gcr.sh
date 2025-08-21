#!/bin/bash

# Configuration installation script for tmux and vim
# This script runs the install scripts for vim and tmux

set -e

echo "Installing vim configuration and plugins..."
./install_vim.sh
echo "✓ Vim installation complete"

echo "Moving tmux.conf to ~/.tmux.conf..."
cp tmux.conf ~/.tmux.conf
echo "✓ tmux.conf moved to home directory"

echo "Reloading tmux configuration..."
tmux source-file ~/.tmux.conf 2>/dev/null || echo "Note: tmux not running, config will be loaded when tmux starts"

echo "Installing tmux configuration..."
./install_tmux_config.sh
echo "✓ Tmux installation complete"

echo "All configurations installed successfully!"