#!/bin/sh

case "$(file --dereference --brief --mime-type "$1")" in
	image/*|video/*|audio/*) mediainfo "$1" ;;
	text/*|*.xml|application/json) bat -f "$1" ;;
	application/pdf) pdftotext "$1" - ;;
	application/*) atool --list -- "$1" ;;
esac
