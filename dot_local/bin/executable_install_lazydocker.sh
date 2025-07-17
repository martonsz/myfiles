#!/bin/bash
set -e

if [ ! -d "$HOME/.asdf/installs/lazydocker" ]; then
    # shellcheck disable=SC1091
    source "$HOME/.asdf/asdf.sh"
    asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
    asdf list all lazydocker
    asdf install lazydocker latest
    asdf global lazydocker latest
fi