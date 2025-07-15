# Vim Configuration Setup

Professional Vim configuration with Python development tools, code formatting, and linting.

## Features

- **Modern Vim Setup**: Comprehensive configuration with sensible defaults
- **Python Development**: Integrated formatting (Black) and linting (flake8) with 120-character line length
- **File Navigation**: NERDTree file explorer with intuitive key bindings
- **Code Quality**: ALE plugin for real-time linting and automatic code fixing
- **Visual Appeal**: Gruvbox color scheme with customizable contrast settings
- **Persistent Undo**: Undo history preserved across Vim sessions

## Installation

Run the installation script to set up Vim with all plugins and dependencies:

```bash
chmod +x install_vim.sh
./install_vim.sh
```

The script will:
- Install Vim plugins (ALE, NERDTree, Gruvbox, vim-flake8)
- Set up Python development packages (black, isort, flake8)
- Configure Vim directories and settings
- Install the vimrc configuration

## Key Bindings

### File Navigation (NERDTree)
- `Ctrl+n`: Open NERDTree
- `Ctrl+t`: Toggle NERDTree
- `Ctrl+f`: Find current file in NERDTree
- `<leader>n`: Focus NERDTree

### General
- `Ctrl+l`: Clear search highlighting
- `<leader>l`: Toggle invisible characters (tabs, line endings)
- `j/k`: Move by visual lines (useful for wrapped text)

## Python Development

### Code Formatting
- **Black**: Automatically formats Python code with 120-character line length
- **isort**: Sorts Python imports automatically
- **Auto-fix on save**: Code is automatically formatted when saving files

### Linting
- **flake8**: Real-time Python linting with 120-character line length
- **ALE**: Advanced linting engine with status line integration

## Configuration Details

### Line Length
Both Black formatter and flake8 linter are configured with 120-character maximum line length:
- Black: `--line-length 120`
- flake8: `--max-line-length=120`

### Theme
- **Gruvbox**: Dark theme with high contrast
- **Syntax highlighting**: Enhanced for better code readability
- **Visual settings**: Optimized for development work

## Requirements

- Vim 8.0+
- Python 3.x
- Git (for plugin installation)
- Internet connection (for initial plugin downloads)

## Troubleshooting

If you encounter issues:
1. Ensure Vim, Python 3, and Git are installed
2. Check that pip3 is available
3. Restart Vim after installation to load plugins
4. First-time loading may be slow as Vim generates help tags

## File Structure

```
├── bashrc                   # Bash configuration with vi mode and enhanced features
├── config.fish             # Fish shell configuration with vi key bindings
├── glow.yml                # Glow markdown viewer configuration for tmux compatibility
├── install_bashrc_config.sh # Install script for bash configuration
├── install_fish_config.sh  # Install script for fish configuration
├── install_glow_config.sh  # Install script for glow configuration
├── install_tmux_config.sh  # Install script for tmux configuration
├── install_vim.sh          # Complete vim setup with plugins and glow
├── README.md               # This file
├── tmux.conf               # Tmux configuration with enhanced features
└── vimrc                   # Vim configuration file with comprehensive settings
```

## Additional Tools

### Glow Markdown Viewer
The repository includes configuration for [glow](https://github.com/charmbracelet/glow), a terminal markdown viewer that's optimized for tmux compatibility:

```bash
chmod +x install_glow_config.sh
./install_glow_config.sh
```

Features:
- Optimized for limited color terminals and tmux
- 80-column width for readable formatting
- No pager for direct output
