#!/usr/bin/env bash
set -euo pipefail

# --- settings ---
REPO_DIR="${REPO_DIR:-$PWD}"
TARGET_HOME="${TARGET_HOME:-$HOME}"
BACKUP_SUFFIX=".$(date +%Y%m%d-%H%M%S).bak"

# Files to link: repo_subdir/filename -> $HOME/targetpath
# starship.toml goes to ~/.config/starship.toml (handled below)
declare -A DOTS=(
  ["bash/.bashrc"]="$TARGET_HOME/.bashrc"
  ["bash/.bash_aliases"]="$TARGET_HOME/.bash_aliases"
  ["git/.gitconfig"]="$TARGET_HOME/.gitconfig"
  ["tmux/.tmux.conf"]="$TARGET_HOME/.tmux.conf"
  ["vim/.vimrc"]="$TARGET_HOME/.vimrc"
)

echo "==> Installing base packages (Ubuntu/Debian)..."
if command -v apt >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y git vim tmux fzf ripgrep htop curl wget net-tools \
    bat eza tree build-essential python3 python3-pip python3-venv
else
  echo "apt not found; skip package install."
fi

echo "==> Ensuring Starship is installed..."
if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://starship.rs/install.sh | bash -s -- -y
fi

echo "==> Creating ~/.config if needed..."
mkdir -p "$TARGET_HOME/.config"

echo "==> Symlinking dotfiles..."
for key in "${!DOTS[@]}"; do
  src="$REPO_DIR/$key"
  dst="${DOTS[$key]}"
  if [[ -e "$dst" || -L "$dst" ]]; then
    echo "Backing up $dst -> $dst$BACKUP_SUFFIX"
    mv -f "$dst" "$dst$BACKUP_SUFFIX"
  fi
  echo "ln -s $src -> $dst"
  ln -s "$src" "$dst"
done

# Starship config to ~/.config/starship.toml
STAR_SRC="$REPO_DIR/starship/starship.toml"
STAR_DST="$TARGET_HOME/.config/starship.toml"
if [[ -f "$STAR_SRC" ]]; then
  if [[ -e "$STAR_DST" || -L "$STAR_DST" ]]; then
    echo "Backing up $STAR_DST -> $STAR_DST$BACKUP_SUFFIX"
    mv -f "$STAR_DST" "$STAR_DST$BACKUP_SUFFIX"
  fi
  echo "ln -s $STAR_SRC -> $STAR_DST"
  ln -s "$STAR_SRC" "$STAR_DST"
fi

echo
echo "✅ Done. Reload your shell:  source ~/.bashrc"

