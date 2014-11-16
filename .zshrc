source ~/.antigen/antigen.zsh

# Load oh-my-zsh's library
antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting

# Work specific bundles
if [[ $AT_WORK ]]; then
    antigen bundle symfony2
fi

antigen theme risto 

antigen apply 

