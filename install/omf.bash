#!/usr/bin/env bash
set -euo pipefail

curl -L --silent https://get.oh-my.fish > download/omf-install

set +e
output="$( fish ./download/omf-install --noninteractive 2>&1 )"
set -e

rm ./download/omf-install

if grep --quiet "Existing installation detected" <<< "$output"; then
  echo "already installed"
  exit 0
fi

if ! grep --quiet "successfully installed" <<< "$output"; then
  echo "failed to install oh-my-fish" 1>&2
  echo "$output" 1>&2
  exit 1
fi
