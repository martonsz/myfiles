#!/bin/bash
set -e
echo "~ Running $(basename $0)"

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
