#!/bin/bash
# Outputs JSON for waybar custom/ip module.
# Shows both internal and external IPs simultaneously.

internal=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") print $(i+1)}')
external=$(curl -sf --max-time 3 https://ipv4.icanhazip.com)

internal="${internal:-unavailable}"
external="${external:-unavailable}"

printf '{"text":"%s  %s","tooltip":"internal: %s | external: %s","class":"both"}\n' \
    "$internal" "$external" "$internal" "$external"
