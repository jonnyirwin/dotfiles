# Source machine-local secrets if present. The file is intentionally outside
# the dotfiles repo (under ~/.config/fish.secrets/) so per-host API keys never
# get committed. Exported vars set here propagate into new tmux panes via the
# normal shell-inherits-environment path — no `tmux set-environment` needed.
#
# Layout: ~/.config/fish.secrets/api_keys.fish  (chmod 600)

set -l secrets ~/.config/fish.secrets/api_keys.fish
test -f $secrets; and source $secrets
