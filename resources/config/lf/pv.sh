#!/bin/sh

case "$(file --dereference --brief --mime-type "$1")" in
	image/*|video/*|audio/*) mediainfo "$1" ;;
	text/*|*/xml|application/json) bat -f "$1" ;;
	application/pdf) pdftotext "$1" - ;;
	application/gzip) tar tf "$1" ;;
	application/zip) unzip -l "$1" ;;
	application/x-rar) unrar l "$1" ;;
	application/x-7z-compressed) 7z l "$1" ;;
esac
