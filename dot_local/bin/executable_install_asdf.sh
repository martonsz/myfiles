#!/bin/bash
set -e
set -o pipefail

if [[ ! -f "${HOME}/.local/bin/asdf" ]] 2> /dev/null; then
    ASDF_LATEST_VERSION=$(curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        ASDF_ARCH="amd64"
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
        ASDF_ARCH="arm64"
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi
    os=$(uname | tr '[:upper:]' '[:lower:]')
    curl -Ls https://github.com/asdf-vm/asdf/releases/download/${ASDF_LATEST_VERSION}/asdf-${ASDF_LATEST_VERSION}-${os}-${ASDF_ARCH}.tar.gz \
        | tar xvf - -C /tmp
    mkdir -p "${HOME}/.local/bin"
    mv -v "/tmp/asdf" "${HOME}/.local/bin/asdf"

else
    echo "Asdf already installed in: ${HOME}/.local/bin/asdf"
fi
if [ ! -d "${ASDF_DATA_DIR:-$HOME/.asdf}/completions" ]; then
     mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
     asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
else
    echo " Asdf completions already installed in: ${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
fi
