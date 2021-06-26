set TERM "xterm-256color"
set -x XDG_CURRENT_DESKTOP "sway"
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/go/bin $fish_user_paths

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SET MANPAGER ###
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### ALIAS ###

# Neovim
alias vim='nvim'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# github
alias g='git'
alias gcm='git commit -m'
alias gcs='git commit -s'
alias gco='git checkout'
alias gp='git push origin'
alias ga='git add'
alias gaa='git add .'
alias gp='git push origin'
alias gst='git status'


### Abbreviations ###

# pacman update
abbr -a syu 'sudo pacman -Syu'
abbr -a syy 'sudo pacman -Syy'

### RANDOM COLOR SCRIPT ###
colorscript random

### SETTING THE STARSHIP PROMPT ###
starship init fish | source
