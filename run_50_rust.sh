#!/usr/bin/env bash

PATH=~/.cargo/bin:$PATH

if [[ ! -x ~/.cargo/bin/rustc ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

if [[ ! -x ~/.cargo/bin/rust-analyzer ]]; then
    TMP=$(mktemp -d)
    git clone https://github.com/rust-analyzer/rust-analyzer.git "$TMP"
    pushd "$TMP" || exit
    cargo xtask install --server
    popd || exit
    rm -rf "$TMP"
fi
