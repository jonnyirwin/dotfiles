#!/usr/bin/env bash
# Adapter that runs the pomodoro script and emits plain text for polybar.
# The underlying pomodoro.sh returns JSON like {"text": "...", "class": "..."}.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
out=$("$SCRIPT_DIR/pomodoro.sh" display 2>/dev/null)

if [ -z "$out" ]; then
    exit 0
fi

# Prefer jq if available — otherwise fall back to a sed extraction.
if command -v jq >/dev/null 2>&1; then
    printf '%s' "$out" | jq -r '.text // empty'
else
    printf '%s' "$out" | sed -E 's/.*"text"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/'
fi
