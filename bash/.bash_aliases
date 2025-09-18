# ========================
# General Shortcuts
# ========================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias q='exit'
alias e='exit'

# Better ls (use exa if installed)
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safer operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ========================
# Git Shortcuts
# ========================
alias gs='git status -sb'       # short status
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcm='git checkout main'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gcl='git clone'
alias gss='git stash save'
alias gsp='git stash pop'
alias gl='git log --oneline --graph --decorate --all'

# ========================
# Python / Conda
# ========================
alias py='python3'
alias pipup='pip install --upgrade pip setuptools wheel'
alias req='pip freeze > requirements.txt'
alias act='source .venv/bin/activate'  # for venv projects

# Conda helpers
alias ca='conda activate'
alias cda='conda deactivate'
alias ce='conda env list'
alias cre='conda env remove -n'

# ========================
# Networking & Debugging
# ========================
alias myip='curl ifconfig.me'
alias ports='ss -tulnp'
alias pingg='ping google.com'
alias flushdns='sudo systemd-resolve --flush-caches'

# ========================
# System & Process Mgmt
# ========================
alias update='sudo apt update && sudo apt upgrade -y'
alias inst='sudo apt install'
alias htop='htop'
alias dfh='df -h'
alias duh='du -sh * | sort -h'
alias psf='ps aux | grep -i'   # e.g. psf python

# ========================
# Tmux / Dev Tools
# ========================
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'

# ========================
# Quality of Life
# ========================
alias v='vim'
alias svim='sudo vim'
alias g='grep --color=auto -i'
alias cls='clear && ls'

