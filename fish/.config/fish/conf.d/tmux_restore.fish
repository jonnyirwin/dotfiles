if command -v tmux > /dev/null 2>&1; and not set -q TMUX
    set -l boot_time (stat -c %Y /proc/1 2>/dev/null; or date +%s)
    set -l restore_flag /tmp/tmux_restored_(id -u)_$boot_time
    
    # Restore if flag doesn't exist or no sessions are running
    if not test -f $restore_flag; or not tmux list-sessions >/dev/null 2>&1
        # Start tmux server and give continuum time to restore sessions
        tmux new-session -d -s temp 2>/dev/null; or true
        sleep 4  # Give continuum enough time to restore
        tmux kill-session -t temp 2>/dev/null; or true
        touch $restore_flag
    end
end
