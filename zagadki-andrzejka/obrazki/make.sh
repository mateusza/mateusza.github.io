#!/bin/bash

for a in *.webp; do
    [[ -e "$a" ]] || break
    printf -v n "%s.png" "$( basename "$a" .webp )"
    echo "$a --> $n"
    convert "$a" "$n"
done

{ 
    printf "var Obrazki = [\n"
    first=""
    for a in *.png; do
       [ "x$first" = "xno" ] && printf ", "
       printf '"%s"' "$a"
       first=no
    done 
    printf "]\n"
} > Obrazki.js
