# ~/.config/zsh/.zshenv


export TERM="xterm-256color"

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


# Defaults
export TERMINAL=/usr/bin/ghostty
export EDITOR="helix"

# Paths
export PATH="$HOME/.local/bin:$PATH"
