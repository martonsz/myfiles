#!/bin/bash
set -euo pipefail

CHEZMOI_SOURCE_DIR=${CHEZMOI_SOURCE_DIR:-$HOME/.local/share/chezmoi}

echo "~ Running $(basename $0)"

if [[ -f "${CHEZMOI_SOURCE_DIR}/.age-chezmoi" ]]; then
    rm -fv "${CHEZMOI_SOURCE_DIR}/.age-chezmoi"
fi
