#!/bin/bash

# Install Glow Configuration Script
# Installs glow and sets up configuration for better tmux compatibility

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
GLOW_CONFIG_SOURCE="$SCRIPT_DIR/glow.yml"

# Check if source glow.yml exists
if [ ! -f "$GLOW_CONFIG_SOURCE" ]; then
    log_error "glow.yml not found in $SCRIPT_DIR"
    exit 1
fi

# Check if glow is installed
if ! command -v glow >/dev/null 2>&1; then
    log_warn "Glow is not installed. Installing via snap..."
    if command -v snap >/dev/null 2>&1; then
        sudo snap install glow
        log_info "Successfully installed glow via snap"
    else
        log_error "Snap is not available. Please install glow manually:"
        log_info "Visit: https://github.com/charmbracelet/glow"
        exit 1
    fi
else
    log_info "Glow is already installed: $(glow --version)"
fi

# Create glow config directory
GLOW_CONFIG_DIR=~/.config/glow
if [ ! -d "$GLOW_CONFIG_DIR" ]; then
    log_info "Creating glow config directory..."
    mkdir -p "$GLOW_CONFIG_DIR"
fi

# Backup existing glow.yml if it exists
if [ -f "$GLOW_CONFIG_DIR/glow.yml" ]; then
    BACKUP_FILE="$GLOW_CONFIG_DIR/glow.yml.backup.$(date +%Y%m%d_%H%M%S)"
    log_warn "Existing glow.yml found, backing up to $BACKUP_FILE"
    cp "$GLOW_CONFIG_DIR/glow.yml" "$BACKUP_FILE"
fi

# Install new glow.yml
log_info "Installing glow configuration..."
cp "$GLOW_CONFIG_SOURCE" "$GLOW_CONFIG_DIR/glow.yml"

log_info "Glow configuration installed successfully!"
log_info "Config location: $GLOW_CONFIG_DIR/glow.yml"
log_info "Features: tmux-compatible rendering, 80-column width, no pager"
log_info "Test with: glow README.md"