# Add XDG support prior to anything else.
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state

# Set prompt settings.
starship init fish | source
set fish_greeting

# Set various SSH & GPG parameters.
if string match -e 'kitty' $TERM; alias ssh 'kitty +kitten ssh'; end
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -x GPG_TTY $(tty)

# User bin support.
set -gx PATH "$HOME/.local/bin" $PATH

# Custom aliases.
# alias cat 'bat'; alias find 'fd'; alias grep 'rg'; alias ps 'procs'
alias ls 'exa --classify --icons --git'
alias li 'ls --long --header --group --modified --created --octal-permissions'
alias tree 'ls --tree'

alias dcu 'docker compose up -d'
alias dcd 'docker compose down --remove-orphans'
alias dcl 'docker compose logs -f'
alias dcls "docker container ls --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}'"

alias tb 'nc termbin.com 9999'
alias pacman-packages 'pacman -Qq | fzf --preview \'pacman -Qil {}\' --layout=reverse --bind \'enter:execute(pacman -Qil {} | less)\''
