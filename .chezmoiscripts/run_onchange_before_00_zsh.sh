#!/bin/bash
set -e
echo "~ Running $(basename $0)"

[[ $CHEZMOI_OS != linux ]] && exit 0

if ! hash zsh 2> /dev/null; then
  sudo apt-get update
  sudo apt-get install -y zsh
fi

echo "Set zsh as default shell"
sudo chsh -s "$(which zsh)" "$(whoami)"
