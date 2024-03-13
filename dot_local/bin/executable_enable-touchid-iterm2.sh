#!/bin/bash
set -e

file="/etc/pam.d/sudo"
if ! grep -q '^auth sufficient pam_tid.so$' "$file"; then
    sudo sed -i '' '1s;^;auth sufficient pam_tid.so\n;' "$file"
fi