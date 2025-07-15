#!/bin/bash

# Install Fish Configuration Script
# Sets up fish config without installing fish itself

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
FISH_CONFIG_SOURCE="$SCRIPT_DIR/config.fish"

# Check if source config.fish exists
if [ ! -f "$FISH_CONFIG_SOURCE" ]; then
    log_error "config.fish not found in $SCRIPT_DIR"
    exit 1
fi

# Check if fish is installed (warn but don't fail)
if ! command -v fish >/dev/null 2>&1; then
    log_warn "Fish shell is not installed."
    log_info "To install fish:"
    log_info "On Ubuntu/Debian: sudo apt install fish"
    log_info "On macOS: brew install fish"
    log_info "On Arch: sudo pacman -S fish"
    log_info "Setting up config anyway for when fish is installed..."
fi

# Create fish config directory
FISH_CONFIG_DIR=~/.config/fish
if [ ! -d "$FISH_CONFIG_DIR" ]; then
    log_info "Creating fish config directory..."
    mkdir -p "$FISH_CONFIG_DIR"
fi

# Backup existing config.fish if it exists
if [ -f "$FISH_CONFIG_DIR/config.fish" ]; then
    BACKUP_FILE="$FISH_CONFIG_DIR/config.fish.backup.$(date +%Y%m%d_%H%M%S)"
    log_warn "Existing config.fish found, backing up to $BACKUP_FILE"
    cp "$FISH_CONFIG_DIR/config.fish" "$BACKUP_FILE"
fi

# Install new config.fish
log_info "Installing fish configuration..."
cp "$FISH_CONFIG_SOURCE" "$FISH_CONFIG_DIR/config.fish"

log_info "Fish configuration installed successfully!"
log_info "Config location: $FISH_CONFIG_DIR/config.fish"
log_info "Features: vi key bindings, ls='ls -lhtrF', git prompt, enhanced aliases"

if command -v fish >/dev/null 2>&1; then
    log_info "Fish is installed. Run 'fish' to start using the new configuration"
else
    log_info "Install fish shell to use this configuration"
fi