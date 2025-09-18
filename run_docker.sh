#!/usr/bin/env bash
set -euo pipefail

HOST_BASE_DIR="$(pwd)/neovim_test_config"

DIRS=(
  "config"
  "data"
  "state"
  "cache"
  "opt"
)

for d in "${DIRS[@]}"; do
  mkdir -p "$HOST_BASE_DIR/$d"
done

docker run -it --rm \
  --user 1000:1000 \
  -v "$HOST_BASE_DIR/config:/home/ubuntu/.config/nvim" \
  -v "$HOST_BASE_DIR/data:/home/ubuntu/.local/share/nvim" \
  -v "$HOST_BASE_DIR/state:/home/ubuntu/.local/state/nvim" \
  -v "$HOST_BASE_DIR/cache:/home/ubuntu/.cache/nvim" \
  -v "$HOST_BASE_DIR/opt:/opt" \
  ubuntu:latest \
  bash -c '
    set -e
    # Add Neovim nightly to PATH if it exists
    if [ -d /opt/nvim-linux-x86_64/bin ]; then
      export PATH=/opt/nvim-linux-x86_64/bin:$PATH
    fi

    echo "Neovim version inside container:"
    nvim --version || ( echo "Neovim not found in /opt/nvim-linux-x86_64/bin"; exit 1 )

    exec bash
  '
