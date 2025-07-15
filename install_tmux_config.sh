#!/bin/bash

# Install Tmux Configuration Script
# Copies tmux.conf to ~/.tmux.conf with backup of existing config

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions for colored output
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_SOURCE="$SCRIPT_DIR/tmux.conf"

# Check if source tmux.conf exists
if [ ! -f "$TMUX_SOURCE" ]; then
    log_error "tmux.conf not found in $SCRIPT_DIR"
    exit 1
fi

# Check if tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
    log_error "tmux is not installed. Please install tmux first."
    log_info "On Ubuntu/Debian: sudo apt install tmux"
    log_info "On macOS: brew install tmux"
    exit 1
fi

# Backup existing tmux.conf if it exists
if [ -f ~/.tmux.conf ]; then
    BACKUP_FILE=~/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
    log_warn "Existing ~/.tmux.conf found, backing up to $BACKUP_FILE"
    cp ~/.tmux.conf "$BACKUP_FILE"
fi

# Install new tmux.conf
log_info "Installing tmux configuration..."
cp "$TMUX_SOURCE" ~/.tmux.conf

# Reload tmux config if tmux is running
if pgrep -x "tmux" > /dev/null; then
    log_info "Reloading tmux configuration..."
    tmux source-file ~/.tmux.conf 2>/dev/null || log_warn "Could not reload tmux config automatically"
fi

log_info "Tmux configuration installed successfully!"
log_info "Existing configuration backed up if it existed"
log_info "Features: 50k scroll history, mouse mode, status with seconds, panes start from 1"