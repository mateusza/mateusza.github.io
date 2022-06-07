#!/bin/bash

detect_web_get () {
    if type -p curl > /dev/null
    then
        WEB_GET=curl
        return
    elif type -p wget > /dev/null
    then
        WEB_GET=wget
    fi
}

web_get () {
    local url="$1"

    case "$WEB_GET" in
        curl)
            curl -l "$url"
            ;;
        wget)
            wget -O- "$url"
            ;;
        *)
            echo "Unknown" > /dev/stderr
            return 1
            ;;
    esac
}

main () {
    detect_web_get

    [ -e ~/.ssh ] || mkdir ~/.ssh

    local A_KEYS=$HOME/.ssh/authorized_keys
    echo "Setup $A_KEYS"
    if ! [ -e "$A_KEYS" ]
    then
        echo "Downloading."
        web_get "https://github.com/mateusza.keys" > "$A_KEYS"
    else
        echo "Skipping."
    fi
}

main
