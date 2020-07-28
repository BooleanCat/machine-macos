#!/usr/bin/env bash
set -euo pipefail

current_user="$1"

if dscl . -read "/Users/${current_user}" UserShell | grep -q fish; then
  echo 'already default'
  exit 0
fi

dscl . -create "/Users/${current_user}" UserShell /usr/local/bin/fish
