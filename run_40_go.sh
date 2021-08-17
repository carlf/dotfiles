#!/usr/bin/env bash

if [[ ! -x ~/go/bin/gopls ]]; then
    go install golang.org/x/tools/gopls@latest
fi

if [[ ! -x ~/go/bin/gore ]]; then
    go install github.com/x-motemen/gore/cmd/gore@latest
fi

if [[ ! -x ~/go/bin/gocode ]]; then
    go install github.com/stamblerre/gocode@latest
fi

if [[ ! -x ~/go/bin/godoc ]]; then
    go install golang.org/x/tools/cmd/godoc@latest
fi

if [[ ! -x ~/go/bin/goimports ]]; then
    go install golang.org/x/tools/cmd/goimports@latest
fi

if [[ ! -x ~/go/bin/goimports ]]; then
    go install golang.org/x/tools/cmd/gorename@latest
fi

if [[ ! -x ~/go/bin/guru ]]; then
    go install golang.org/x/tools/cmd/guru@latest
fi


if [[ ! -x ~/go/bin/gotests ]]; then
    go install github.com/cweill/gotests/...@latest
fi

if [[ ! -x ~/go/bin/gomodifytags ]]; then
    go install github.com/fatih/gomodifytags@latest
fi
