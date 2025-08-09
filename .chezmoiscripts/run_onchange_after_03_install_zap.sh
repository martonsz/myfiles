#!/bin/bash
set -eo pipefail 
echo "~ Running $(basename $0)"

ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
if [[ ! -d "$ZAP_DIR" ]]; then
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
fi
