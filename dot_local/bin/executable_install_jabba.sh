#!/bin/bash
# https://github.com/shyiko/jabba
set -e

export JABBA_HOME="$HOME/.local/bin/jabba"
curl -sL https://github.com/Jabba-Team/jabba/raw/main/install.sh | bash -s -- --skip-rc && . "$JABBA_HOME/jabba.sh"
