#!/usr/bin/env bash
set -euo pipefail

if ! ansible --version &>/dev/null; then
  brew install ansible
fi

ansible-playbook \
  -i "localhost," \
  --ask-become-pass \
  --con local \
  playbook.yml
