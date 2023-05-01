if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -u fish_greeting
set STARSHIP_CONFIG $HOME/.config/starship.toml
starship init fish | source

set -gx VAGRANT_DEFAULT_PROVIDER libvirt
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
