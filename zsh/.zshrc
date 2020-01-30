if [ "$TERM" = "linux" ]; then

  export PS1="[%n@%m] %~ $"

else

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
  # Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

  source ~/.antigen.zsh

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
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export VISUAL=nvim
export VIMCONFIG="$HOME/.config/nvim"
export VIMDATA="$HOME/.local/share/nvim"
export FZF_DEFAULT_COMMAND='rg --files'

alias vim=nvim
alias vi=nvim
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
