#!/usr/bin/env bash

function get_font_dir {
    os=$(uname -s)
    if [[ $os == "Darwin" ]]; then
        echo "$HOME/Library/Fonts"
    elif [[ $os == "Linux" ]]; then
        echo "$HOME/.local/share/fonts"
    else
        echo "$HOME/.local/share/fonts"
    fi
}

function needs_font {
    font_name=$1
    font_dir=$(get_font_dir)
    if [[ -f "${font_dir}/${font_name}.ttf" ]]; then
        return 1
    else
        return 0
    fi
}

function get_font {
    font_name=$1
    dest=$(get_font_dir)
    url="https://raw.githubusercontent.com/domtronn/all-the-icons.el/master/fonts/${font_name}.ttf"
    curl -s -o "${dest}/${font_name}.ttf" "$url"
}

FONTS=(all-the-icons file-icons fontawesome material-design-icons octicons weathericons)

for font in "${FONTS[@]}"; do
    if needs_font "$font"; then
        get_font "$font"
    fi
done
