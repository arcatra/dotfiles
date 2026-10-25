
# Exports group

# Load default color scheme for file types
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


# HISTORY ------------
HISTFILE="$XDG_STATE_HOME/zsh/history"

# for setting history length see HISTSIZE and HISTFILESIZE in zsh(1)
HISTSIZE=1000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower


# =========================================================
# FZF
# =========================================================
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi


# =========================================================
# Modular config files: Sourcing
# =========================================================

# Source Aliases
if [[ -f "$ZDOTDIR/aliases.zsh" ]]; then
  source "$ZDOTDIR/aliases.zsh"

fi

# Source plugins
source "$ZDOTDIR/plugins.zsh"

# Source prompt
source "$ZDOTDIR/prompt.zsh"

# Initialize the Zoxide
eval "$(zoxide init zsh)"

# Initialize the starship
# eval "$(starship init zsh)" # Initialized in prompt.zsh.
