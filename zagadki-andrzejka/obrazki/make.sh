#!/bin/bash

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
