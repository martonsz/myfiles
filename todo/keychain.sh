#!/bin/bash
# keychain
# https://www.funtoo.org/Keychain

# This script is sourced from .zshrc using this line
#[[ -f $DOTFILES_PATH/configs/keychain.sh ]] && source "$DOTFILES_PATH/configs/keychain.sh"

# Start keychain with private keys found in $HOME/.ssh
if hash keychain 2> /dev/null; then
    if [[ -d $HOME/.ssh && -z "$SSH_AUTH_SOCK" ]]; then
        keyFiles=$(find -L "$HOME/.ssh" -type f -print0 | xargs -0 grep -l "BEGIN RSA PRIVATE KEY")
        if [ -n "$keyFiles" ]; then
            /usr/bin/keychain -q --nogui "$keyFiles"
            # shellcheck source=/dev/null
            source "$HOME/.keychain/$(hostname)-sh"
        else
            echo "$0: No private keys found in $HOME/.ssh"
        fi
    fi
fi