# zgen - zsh package manager
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # fish-like autosuggestions
    zgen load zsh-users/zsh-autosuggestions .
    # completions
    zgen load zimfw/zimfw modules/completion/init.zsh

    # ssh agent
    zgen load twang817/zsh-ssh-agent
    zstyle :omz:plugins:ssh-agent identities id_ed25519

    # theme
    zgen load denysdovhan/spaceship-prompt spaceship

    # fish-like syntax highlighting
    zgen load zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh

    # fzf - fancy ctrl-r
    zgen load junegunn/fzf shell/completion.zsh
    zgen load junegunn/fzf shell/key-bindings.zsh

    # z - fuzzy jump to directory
    zgen load rupa/z
    zgen load changyuheng/fz

    # git dsf - fancy git diff
    zgen load zdharma/zsh-diff-so-fancy

    # sane input bindings for zsh
    zgen load zimfw/zimfw modules/input/init.zsh
    # sane history settings for zsh
    zgen load zimfw/zimfw modules/history/init.zsh


    # save all to init script
    zgen save
fi

# Spaceship theme config
# Disable npm package version
export SPACESHIP_PACKAGE_SHOW=false
# Disable docker version
export SPACESHIP_DOCKER_SHOW=false

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
eval "$(direnv hook zsh)"

# Java
export JAVA_OPTS="-Xmx512m"
# not completely sure where this is taken from
export MAVEN_OPTS="-Xms256m -Dfile.encoding=UTF-8 -Dcom.sun.management.jmxremote -noverify $JAVA_OPTS"

# Rust
export PATH=$PATH:~/.cargo/bin

# OCaml OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Node version manager
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh --no-use
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# Ruby env
eval "$(rbenv init -)"

# Amedia tools (should be moved to machine specific config)
source ~/amedia/tools/init.zsh

# Allow installing npm binary packages without sudo
export PATH=~/.npm-global/bin:$PATH
# Add local bin folder
export PATH=~/.local/bin:$PATH
