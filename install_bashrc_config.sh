#!/bin/bash

# Install Bash Configuration Script
# Appends bashrc content to ~/.bashrc with backup

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
BASHRC_SOURCE="$SCRIPT_DIR/bashrc"

# Check if source bashrc exists
if [ ! -f "$BASHRC_SOURCE" ]; then
    log_error "bashrc not found in $SCRIPT_DIR"
    exit 1
fi

# Backup existing bashrc
if [ -f ~/.bashrc ]; then
    BACKUP_FILE=~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)
    log_info "Backing up existing ~/.bashrc to $BACKUP_FILE"
    cp ~/.bashrc "$BACKUP_FILE"
else
    log_info "No existing ~/.bashrc found, creating new one"
    touch ~/.bashrc
fi

# Check if our config is already added
if grep -q "Enhanced bash settings for improved productivity" ~/.bashrc; then
    log_warn "Configuration appears to already be present in ~/.bashrc"
    log_warn "Skipping to avoid duplication"
    exit 0
fi

# Append configuration to bashrc
log_info "Appending bash configuration to ~/.bashrc..."
echo "" >> ~/.bashrc
echo "# ==============================================================================" >> ~/.bashrc
echo "# Enhanced Configuration Added $(date)" >> ~/.bashrc
echo "# ==============================================================================" >> ~/.bashrc
cat "$BASHRC_SOURCE" >> ~/.bashrc

log_info "Bash configuration appended successfully!"
log_info "Features: vi mode, 10k/20k history, enhanced aliases, git prompt"
log_info "Run 'source ~/.bashrc' or restart your shell to load the new configuration"