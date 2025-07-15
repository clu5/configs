# Fish Shell Configuration
# Enhanced fish settings for improved productivity

# Enable vi key bindings
fish_vi_key_bindings

# Set default editor to vim if available
if command -v vim >/dev/null 2>&1
    set -gx EDITOR vim
    set -gx VISUAL vim
end

# Enable 256 color support
set -gx TERM xterm-256color

# History settings
set -g fish_history_max 10000

# Aliases
alias ls="ls -lhtrF"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Safety aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"

# Tmux shortcuts
alias ta="tmux attach"
alias tl="tmux list-sessions"
alias tn="tmux new-session"

# Glow markdown viewer (optimized for tmux)
alias glow="glow --style notty"

# Functions
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

function ff
    find . -type f -name "*$argv[1]*" 2>/dev/null
end

# Prompt customization with git support
function fish_prompt
    set -l last_status $status
    
    # User and hostname
    set_color green
    echo -n (whoami)
    set_color normal
    echo -n "@"
    set_color green
    echo -n (hostname)
    set_color normal
    echo -n ":"
    
    # Current directory
    set_color blue
    echo -n (prompt_pwd)
    set_color normal
    
    # Git branch if available
    if command -v git >/dev/null 2>&1
        set -l git_branch (git branch 2>/dev/null | grep '^*' | cut -d' ' -f2)
        if test -n "$git_branch"
            set_color red
            echo -n "($git_branch)"
            set_color normal
        end
    end
    
    # Prompt symbol
    if test $last_status -eq 0
        echo -n "\$ "
    else
        set_color red
        echo -n "\$ "
        set_color normal
    end
end

# Welcome message
function fish_greeting
    # Suppress default greeting
end

# Path additions
if test -d ~/.local/bin
    set -gx PATH ~/.local/bin $PATH
end

if test -d ~/go/bin
    set -gx PATH ~/go/bin $PATH
end

# Auto-start tmux (optional - uncomment to enable)
# if command -v tmux >/dev/null 2>&1
#     if not set -q TMUX
#         if test "$TERM_PROGRAM" != "vscode"
#             tmux attach-session -t default; or tmux new-session -s default
#         end
#     end
# end