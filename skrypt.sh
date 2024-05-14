#!/bin/bash

if [ "$1" = "--date" ]; then
    dzis=$(date +"%Y-%m-%d")
    echo $dzis
elif [ "$1" = "--logs" ]; then
    for ((i=1; i<=100; i++)); do
        nazwa_pliku="log${i}.txt"
        echo "Nazwa pliku: $nazwa_pliku" > $nazwa_pliku
        echo "Skrypt: $0" >> $nazwa_pliku
        echo "Data utworzenia: $(date +"%Y-%m-%d %H:%M:%S")" >> $nazwa_pliku
    done
fi
