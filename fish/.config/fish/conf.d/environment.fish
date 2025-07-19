# Better defaults
set -gx EDITOR vim
set -gx VISUAL $EDITOR
set -gx PAGER less

# Colorful man pages
set -gx LESS_TERMCAP_mb \e'[1;32m'     # begin blinking
set -gx LESS_TERMCAP_md \e'[1;32m'     # begin bold
set -gx LESS_TERMCAP_me \e'[0m'        # end mode
set -gx LESS_TERMCAP_se \e'[0m'        # end standout-mode
set -gx LESS_TERMCAP_so \e'[01;33m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'        # end underline
set -gx LESS_TERMCAP_us \e'[1;4;31m'   # begin underline

# History settings
set -gx HISTSIZE 10000
set -gx HISTFILESIZE 20000
