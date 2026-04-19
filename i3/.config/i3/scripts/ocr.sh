#!/bin/bash
# OCR a selected region with tesseract and copy the text to the clipboard.
# Deps: maim, slop, tesseract, xclip, notify-send.

region=$(slop -f "%g") || exit 1
[ -z "$region" ] && exit 1

text=$(maim -g "$region" | tesseract - - 2>/dev/null)

if [ -z "$text" ]; then
    notify-send "OCR" "No text detected"
    exit 1
fi

printf '%s' "$text" | xclip -selection clipboard
word_count=$(printf '%s' "$text" | wc -w)
notify-send "OCR" "Copied $word_count words to clipboard"
