#!/bin/bash
set -euo pipefail

echo "~ Running $(basename $0)"

if [[ -f "${CHEZMOI_SOURCE_DIR}/.age-chezmoi" ]]; then
    rm -fv "${CHEZMOI_SOURCE_DIR}/.age-chezmoi"
fi
