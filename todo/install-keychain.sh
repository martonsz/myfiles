#!/bin/bash
# Install Keychain
# https://www.funtoo.org/Keychain

if ! hash keychain 2>/dev/null; then
  echo -e "\n~~~~ $0 - Installing keychain"
  if hash apt-get 2> /dev/null; then
    sudo apt-get install -y keychain
  elif hash brew 2> /dev/null; then
    brew install keychain
  fi
else
  echo -e "\n~~~~ $0 - keychain already installed"
fi

