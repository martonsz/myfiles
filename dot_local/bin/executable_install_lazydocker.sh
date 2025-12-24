#!/bin/bash
set -e

if [ ! -e "${ASDF_DATA_DIR:-$HOME/.asdf}/shims/lazydocker" ]; then
    asdf plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
    asdf install lazydocker latest
    asdf set -u lazydocker latest
fi