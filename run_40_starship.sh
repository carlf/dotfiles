#!/usr/bin/env bash

if [[ ! -f /usr/local/bin/starship ]]; then
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -f
fi
