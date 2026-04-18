#!/bin/bash
# OCR a selected region with tesseract and copy the text to the clipboard.
# Deps: grim, slurp, tesseract, wl-copy, notify-send.

region=$(slurp) || exit 1
[ -z "$region" ] && exit 1

text=$(grim -g "$region" - | tesseract - - 2>/dev/null)

if [ -z "$text" ]; then
    notify-send "OCR" "No text detected"
    exit 1
fi

printf '%s' "$text" | wl-copy
word_count=$(printf '%s' "$text" | wc -w)
notify-send "OCR" "Copied $word_count words to clipboard"
