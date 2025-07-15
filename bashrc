# Enhanced bash settings for improved productivity

# =============================================================================
# HISTORY SETTINGS
# =============================================================================

# Increase history size significantly
export HISTSIZE=10000
export HISTFILESIZE=20000

# Don't store duplicate commands or commands starting with space
export HISTCONTROL=ignoreboth:erasedups

# Append to history file rather than overwriting
shopt -s histappend

# Store multi-line commands as single entries
shopt -s cmdhist

# Store history immediately after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# =============================================================================
# VI MODE
# =============================================================================

# Enable vi mode for command line editing
set -o vi

# Show vi mode in prompt (optional - uncomment if desired)
# bind 'set show-mode-in-prompt on'

# =============================================================================
# SCROLLBACK/TERMINAL SETTINGS
# =============================================================================

# Enable extended globbing
shopt -s extglob

# Enable case-insensitive globbing
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================

# Set default editor to vim if available
if command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
    export VISUAL=vim
fi

# Enable 256 color support
export TERM=xterm-256color

# =============================================================================
# ALIASES
# =============================================================================

# Enhanced ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Tmux shortcuts
alias ta='tmux attach'
alias tl='tmux list-sessions'
alias tn='tmux new-session'

# =============================================================================
# FUNCTIONS
# =============================================================================

# Create directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick file search
ff() {
    find . -type f -name "*$1*" 2>/dev/null
}

# =============================================================================
# PROMPT CUSTOMIZATION
# =============================================================================

# Colorful prompt with git branch (if git is available)
if command -v git >/dev/null 2>&1; then
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
    export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\]\$ "
else
    export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

# =============================================================================
# COMPLETION ENHANCEMENTS
# =============================================================================

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# =============================================================================
# PERFORMANCE
# =============================================================================

# Faster directory navigation
export CDPATH=".:~:~/projects"

# =============================================================================
# TMUX INTEGRATION
# =============================================================================

# Auto-start tmux if not already in a session and if tmux is available
if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
    # Uncomment the next line to auto-start tmux
    # tmux attach-session -t default || tmux new-session -s default
    :
fi