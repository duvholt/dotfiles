#
# User configuration sourced by interactive shells
#
# load zgen
#autoload -Uz compinit
#compinit
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load zsh-users/zsh-autosuggestions .
    #zgen load stedolan/jq
    #zgen mrowa44/emojify
    #zgen b4b4r07/emoji-cli

    # completions
    zgen load zsh-users/zsh-completions src

    zgen load twang817/zsh-ssh-agent
    zstyle :omz:plugins:ssh-agent identities id_ed25519

    # theme
    #zgen oh-my-zsh
    zgen load denysdovhan/spaceship-prompt spaceship
    #zgen load iplaces/astro-zsh-theme astro.zsh-theme

    zgen load zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh

    # save all to init script
    zgen save
fi

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey ";3C" forward-word
bindkey ";3D" backward-word
bindkey ";5C" forward-word
bindkey ";5D" backward-word

export HISTFILE="${ZDOTDIR:-${HOME}}/.zhistory"
export SAVEHIST=1000000

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/bin/virtualenvwrapper_lazy.sh
eval "$(direnv hook zsh)"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim


export PATH=$PATH:/home/christian/.cargo/bin

# OPAM configuration
. /home/christian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#source /usr/share/nvm/init-nvm.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh --no-use
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
