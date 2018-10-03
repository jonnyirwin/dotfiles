if [ "$TERM" = "linux" ]; then

export PS1="[%n@%m] %~ $"

else
  source ~/.antigen.zsh
  antigen use oh-my-zsh

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
  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen apply

  POWERLINE_COMMAND=/usr/bin/powerline
  POWERLINE_CONFIG_COMMAND=/usr/bin/powerline-config 
  . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

  FZF_DEFAULT_COMMAND='rg --files'

  PATH=~/.local/bin:~/.npm-global/bin:$PATH
fi
