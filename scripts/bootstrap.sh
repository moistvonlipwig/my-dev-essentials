#!/usr/bin/env bash
set -Eeuo pipefail

# ---- settings ---------------------------------------------------------------
REPO_DIR="${REPO_DIR:-$PWD}"
TARGET_HOME="${TARGET_HOME:-$HOME}"
BACKUP_SUFFIX=".$(date +%Y%m%d-%H%M%S).bak"

# repo path -> home path
declare -A DOTS=(
  ["bash/.bashrc"]="$TARGET_HOME/.bashrc"
  ["bash/.bash_aliases"]="$TARGET_HOME/.bash_aliases"
  ["git/.gitconfig"]="$TARGET_HOME/.gitconfig"
  ["tmux/.tmux.conf"]="$TARGET_HOME/.tmux.conf"
  ["vim/.vimrc"]="$TARGET_HOME/.vimrc"
)

# ---- helpers ---------------------------------------------------------------
backup_link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"

  # if dst is already the correct symlink, skip
  if [[ -L "$dst" ]]; then
    local cur="$(readlink -f "$dst" 2>/dev/null || true)"
    local tgt="$(readlink -f "$src" 2>/dev/null || echo "$src")"
    if [[ "$cur" == "$tgt" ]]; then
      echo "OK: $dst already -> $src"
      return
    fi
  fi

  # if dst is a real file with identical content, skip
  if [[ -e "$dst" && ! -L "$dst" ]] && cmp -s "$src" "$dst"; then
    echo "OK: $dst already up-to-date"
    return
  fi

  # otherwise backup and (re)link
  if [[ -e "$dst" || -L "$dst" ]]; then
    local bak="${dst}${BACKUP_SUFFIX}"
    echo "Backing up $dst -> $bak"
    mv -f "$dst" "$bak"
  fi
  echo "ln -s $src -> $dst"
  ln -sfn "$src" "$dst"
}

ensure_cmd() { command -v "$1" >/dev/null 2>&1; }

# ---- base packages (Ubuntu/Debian) -----------------------------------------
echo "==> Installing base packages (Ubuntu/Debian)..."
if ensure_cmd apt; then
  sudo apt update
  sudo apt install -y \
    git vim tmux fzf ripgrep htop curl wget net-tools \
    bat eza tree build-essential python3 python3-pip python3-venv xclip
else
  echo "apt not found; skipping package install."
fi

# ---- Starship --------------------------------------------------------------
echo "==> Ensuring Starship is installed..."
if ! ensure_cmd starship; then
  curl -fsSL https://starship.rs/install.sh | bash -s -- -y
fi

echo "==> Linking Starship config..."
mkdir -p "$TARGET_HOME/.config"
STAR_SRC="$REPO_DIR/starship/starship.toml"
STAR_DST="$TARGET_HOME/.config/starship.toml"
if [[ -f "$STAR_SRC" ]]; then
  backup_link "$STAR_SRC" "$STAR_DST"
else
  echo "WARNING: $STAR_SRC not found; skipping starship.toml link."
fi

# Ensure bash initializes Starship (only append if absent)
if [[ -f "$TARGET_HOME/.bashrc" ]] && ! grep -q 'starship init bash' "$TARGET_HOME/.bashrc"; then
  echo 'eval "$(starship init bash)"' >> "$TARGET_HOME/.bashrc"
  echo "Appended Starship init to ~/.bashrc"
fi

# ---- dotfiles --------------------------------------------------------------
echo "==> Symlinking dotfiles..."
for key in "${!DOTS[@]}"; do
  src="$REPO_DIR/$key"
  dst="${DOTS[$key]}"
  if [[ -f "$src" || -d "$src" ]]; then
    backup_link "$src" "$dst"
  else
    echo "NOTE: $src not found; skipping."
  fi
done

echo
echo "? Done. Reload your shell:  source ~/.bashrc"
