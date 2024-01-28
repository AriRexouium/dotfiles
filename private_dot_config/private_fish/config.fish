set fish_greeting
#starship init fish | source
set -gx PATH "$HOME/.local/bin" $PATH
# set -x GPG_TTY $(tty)

# List Files
alias ls 'eza --classify --icons --git'
alias li 'ls --long --header --group --modified --created --octal-permissions --time-style=long-iso'
alias tree 'ls --tree'

# Docker
alias dl "docker logs -f"
alias dls "docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}'"
alias dcu 'docker compose up -d'
alias dcd 'docker compose down --remove-orphans'
alias dcl 'docker compose logs -f'

# extra
alias termbin 'nc termbin.com 9999'
alias gensecret 'openssl rand -hex 32'
