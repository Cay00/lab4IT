#!/bin/bash

if [ "$1" = "--date" ]; then
    dzis=$(date +"%Y-%m-%d")
    echo $dzis
elif [ "$1" = "--logs" ]; then
    if [ -z "$2" ]; then
        liczba_plikow=100
    else
        liczba_plikow=$2
    fi

    for ((i=1; i<=$liczba_plikow; i++)); do
        nazwa_pliku="log${i}.txt"
        echo "Nazwa pliku: $nazwa_pliku" > $nazwa_pliku
        echo "Skrypt: $0" >> $nazwa_pliku
        echo "Data utworzenia: $(date +"%Y-%m-%d %H:%M:%S")" >> $nazwa_pliku
    done
fi
