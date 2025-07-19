function sysinfo --description "Display system information"
    echo "System Information:"
    echo "=================="
    echo "Hostname: "(hostname)
    echo "OS: "(uname -s)
    echo "Kernel: "(uname -r)
    echo "Architecture: "(uname -m)
    echo "Uptime: "(uptime -p 2>/dev/null; or uptime)
    echo "Shell: "$SHELL
    echo "Terminal: "$TERM
    echo "User: "$USER
    echo "Home: "$HOME
    echo "Working Directory: "(pwd)
    echo "Date: "(date)
    echo ""
    echo "Disk Usage:"
    df -h | head -n 1
    df -h | grep -E '^/dev/'
    echo ""
    echo "Memory Usage:"
    free -h 2>/dev/null; or vm_stat
end
