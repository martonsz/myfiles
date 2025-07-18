#!/bin/bash
set -euo pipefail

AGE_KEY_FILE="${CHEZMOI_SOURCE_DIR}/.age-chezmoi.age"
AGE_KEY_FILE_DECYPRTED="${CHEZMOI_SOURCE_DIR}/.age-chezmoi"

while [[ ! -f "$AGE_KEY_FILE" ]]; do
    echo "Error: $AGE_KEY_FILE not found"
    echo "Paste the encrypted private key content and press Ctrl+D when done:"
    cat > "$AGE_KEY_FILE"
    echo "Key file saved to $AGE_KEY_FILE"
done

if [[ ! -f  "$AGE_KEY_FILE" ]]; then
  echo "Error: $AGE_KEY_FILE does not exist"
  exit 1
fi

echo "Decrypting $AGE_KEY_FILE to $AGE_KEY_FILE_DECYPRTED"
age -d "$AGE_KEY_FILE" > "$AGE_KEY_FILE_DECYPRTED"
