if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    mise activate fish | source
    
    # Enable vi key bindings (optional - comment out if you prefer default)
    # fish_vi_key_bindings
    
    # Greeting message
    set fish_greeting "Welcome back, $USER! 🐟"
    
    # Better directory colors
    set -gx LS_COLORS 'di=1;34:ln=1;36:so=32:pi=33:ex=1;32:bd=1;33:cd=1;33:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
    
    # Enable auto-suggestions
    set -g fish_autosuggestion_enabled 1
    
    # Configure auto-suggestions color
    set -g fish_color_autosuggestion 555 brblack
    
    # Set up fzf if available
    if command -v fzf > /dev/null
        set -gx FZF_DEFAULT_OPTS \
            '--height 40% --layout=default --border=none' \
            '--prompt=❯\  --pointer=❯ --marker=❯' \
            '--color=bg:#1e1e2e,bg+:#45475a,fg:#cdd6f4,fg+:#cdd6f4' \
            '--color=hl:#89b4fa,hl+:#89b4fa' \
            '--color=prompt:#cba6f7,pointer:#cba6f7,marker:#a6e3a1' \
            '--color=spinner:#cba6f7,info:#585b70,header:#89b4fa'
        fzf --fish 2>/dev/null | source
    end

    # zoxide (smarter cd - use 'z' instead of 'cd')
    zoxide init fish | source

    # direnv (per-directory env vars, auto-loaded on cd)
    if command -v direnv > /dev/null
        direnv hook fish | source
    end
end

alias killrails="pkill -f rails; pkill -f puma; rm -f tmp/pids/server.pid"
alias railsdebug="env RUBY_DEBUG_OPEN=true RUBY_DEBUG_PORT=38698 bundle exec rails s"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
