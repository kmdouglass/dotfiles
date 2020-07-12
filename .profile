# Import the .bashrc configuration file
if [ -r "$HOME/.bashrc" ]; then
    # shellcheck source=.bashrc
    . "$HOME/.bashrc"
fi

# Custom helper functions
# shellcheck source=.helpers
. "$HOME/.helpers"

###################################################################################################
# Environment variables

# AWS_VAULT
export AWS_VAULT_BACKEND=secret-service
export AWS_SESSION_TOKEN_TTL=8h

# Caster
if [ -d "$HOME/src/homelab/speech-recognition/caster" ]; then
    export CASTER_USER_DIR="$HOME/src/homelab/speech-recognition/caster"
fi

# npm
if [ -d "$HOME/npm" ]; then
    PATH="$PATH:$HOME/npm/bin"
    export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
fi

# nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Org-mode
if [ -d "$HOME/src/org-mode" ]; then
    export ORG_SOURCE="$HOME/src/org-mode"
fi

# Python
if [ -d "$HOME/venvs" ]; then
    export WORKON_HOME="$HOME/venvs"
fi

# Rust
if [ -d "$HOME/.cargo" ]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

###################################################################################################
# PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private .local/bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH"
