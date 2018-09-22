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

  synclient TouchpadOff=1
  . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi
