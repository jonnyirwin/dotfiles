#set theme_color_scheme nord
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git' --glob '!node_modules'"

abbr di 'cd ~/git/DigitalInnovation'

set -gx DOCKER_GROUP_ID (getent group docker | cut -d: -f3)

set theme_color_scheme terminal2-dark

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
