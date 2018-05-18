source ~/.antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BNDLES/bhilburn/powerlevel9k

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle chucknorris
antigen bundle docker
antigen bundle jsontools
antigen bundle npm
antigen bundle vagrant
antigen bundle yarn
antigen bundle node
antigen bundle sudo


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme fishy
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply
