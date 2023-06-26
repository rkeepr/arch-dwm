#!/bin/sh

case "$1" in
    *.jpg|*.jpeg|*.png|*.gif|*.webp) mediainfo "$1" ;;
    *.mp3|*.flac|*.m4a|*.wav|*.wv|*.ogg) mediainfo "$1" ;;
    *.mp4|*.mkv|*.webm|*.avi|*.flv|*.mov|*.ts) mediainfo "$1" ;;
    *.tar*) tar tf "$1" ;;
    *.zip) unzip -l "$1" ;;
    *.rar) unrar l "$1" ;;
    *.7z) 7z l "$1" ;;
    *.pdf) pdftotext "$1" - ;;
    *) bat -f "$1" ;;
esac
