if [ "$TERM" = "linux" ]; then

  export PS1="[%n@%m] %~ $"

else

source $HOME/.antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle docker
antigen bundle jsontools
antigen bundle npm
antigen bundle vagrant
antigen bundle yarn
antigen bundle node
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

fi

export VISUAL=nvim
export VIMCONFIG="$HOME/.config/nvim"
export VIMDATA="$HOME/.local/share/nvim"
export FZF_DEFAULT_COMMAND='rg --files'
export QT_QPA_PLATFORMTHEME=gtk2

alias vim=nvim
alias vi=nvim

export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
