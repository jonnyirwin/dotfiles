set -l host_conf ~/.config/fish/hosts/(hostname).fish
test -f $host_conf; and source $host_conf
