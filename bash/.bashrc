# ========================
# Load Starship prompt
# ========================
eval "$(starship init bash)"

# ========================
# Load custom aliases
# ========================
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ========================
# Conda (if installed)
# ========================
if [ -f ~/miniconda3/etc/profile.d/conda.sh ]; then
    . ~/miniconda3/etc/profile.d/conda.sh
fi

# ========================
# Fzf integration
# ========================
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    . /usr/share/doc/fzf/examples/key-bindings.bash
fi
if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
    . /usr/share/doc/fzf/examples/completion.bash
fi

# ========================
# Extra PATHs (if needed)
# ========================
export PATH="$HOME/.local/bin:$PATH"
