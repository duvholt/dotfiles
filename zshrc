# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v
export KEYTIMEOUT=1

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Spaceship theme config
# Disable npm package version
export SPACESHIP_PACKAGE_SHOW=false
# Disable docker version
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_NODE_DEFAULT_VERSION="$(/usr/bin/node --version)"
export SPACESHIP_PYTHON_DEFAULT_VERSION="system"

# virtualenvwrapper
if [[ -a /usr/bin/virtualenvwrapper_lazy.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    source /usr/bin/virtualenvwrapper_lazy.sh
fi

# Default editor configs
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# direnv - automatically load env variables
if type "direnv" &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

# Rust
export PATH=$PATH:~/.cargo/bin

# OCaml OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Amedia tools (should be moved to machine specific config)
if [[ -a ~/amedia/tools/init.zsh ]]; then
    source ~/amedia/tools/init.zsh
fi

# Allow installing npm binary packages without sudo
export PATH=~/.npm-global/bin:$PATH
# Add local bin folder
export PATH=~/.local/bin:$PATH

# spaceship_vi_mode_enable

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export PATH=$PATH:~/go/bin
# Krew k8s
export PATH="${PATH}:${HOME}/.krew/bin"
# .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH="${PATH}:${HOME}/.dotnet"
export PATH="${PATH}:${HOME}/.dotnet/tools"

# Jetbrains
export PATH="${PATH}:${HOME}/.local/share/JetBrains/Toolbox/scripts"

# Test stuff down here
alias ssh='TERM=xterm-256color ssh'

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
alias hx='helix'

# https://wiki.archlinux.org/title/Makepkg#Improving_build_times
export MAKEFLAGS="-j$(nproc)"
export DOTNET_ROOT=~/.dotnet

alias aladark="ln -fs ~/.config/alacritty/themes/themes/one_dark.toml ~/.config/alacritty/themes/themes/_active.toml"
alias alalight="ln -fs ~/.config/alacritty/themes/themes/pencil_light.toml ~/.config/alacritty/themes/themes/_active.toml"
func alatheme() {
  ln -fs ~/.config/alacritty/themes/themes/$1.toml ~/.config/alacritty/themes/themes/_active.toml
  touch ~/.config/alacritty.toml
}
