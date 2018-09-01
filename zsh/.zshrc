if [ "$TERM" = "linux" ]; then

export PS1="[%n@%m] %~ $"

else

export TERM=xterm-256color

source ~/.antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='088'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='242'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_BACKGROUND='242'
POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='242'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'

POWERLEVEL9K_TIME_BACKGROUND='088'
POWERLEVEL9K_TIME_FOREGROUND='255'
POWERLEVEL9K_HISTORY_BACKGROUND='242'
POWERLEVEL9K_HISTORY_FOREGROUND='255'
POWERLEVEL9K_STATUS_OK_BACKGROUND='022'
POWERLEVEL9K_STATUS_OK_FOREGROUND='255'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='088'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='255'

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

synclient TouchpadOff=1

fi
