#!/bin/bash

show_help() {
    echo "  skrypt.sh --date | -d        Wyświetla dzisiejszą datę"
    echo "  skrypt.sh --logs | -l [liczba_plikow]    Tworzy pliki log. Domyślnie 100, opcjonalnie podaj liczbę plików."
    echo "  skrypt.sh --error | -e [liczba_plikow]   Tworzy pliki error. Domyślnie 100, opcjonalnie podaj liczbę plików."
    echo "  skrypt.sh --help | -h        Wyświetla wszystkie dostępne opcje"
}

create_logs() {
    if [ -z "$1" ]; then
        liczba_plikow=100
    else
        liczba_plikow=$1
    fi

    for ((i=1; i<=$liczba_plikow; i++)); do
        nazwa_pliku="log${i}.txt"
        echo "Nazwa pliku: $nazwa_pliku" > $nazwa_pliku
        echo "Skrypt: $0" >> $nazwa_pliku
        echo "Data utworzenia: $(date +"%Y-%m-%d %H:%M:%S")" >> $nazwa_pliku
    done
}

create_errors() {
    if [ -z "$1" ]; then
        liczba_plikow=130
    else
        liczba_plikow=$1
    fi

    for ((i=1; i<=$liczba_plikow; i++)); do
        mkdir -p error$i
        nazwa_pliku="error${i}.txt"
        echo "Nazwa pliku: $nazwa_pliku" > error$i/$nazwa_pliku
        echo "Skrypt: $0" >> error$i/$nazwa_pliku
        echo "Data utworzenia: $(date +"%Y-%m-%d %H:%M:%S")" >> error$i/$nazwa_pliku
    done
}

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    dzis=$(date +"%Y-%m-%d")
    echo $dzis
elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
    create_logs $2
elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    create_errors $2
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_help
elif [ "$1" = "--init" ]; then
    git clone https://github.com/Cay00/lab4IT.git
    PATH=$PATH:$(pwd)/repo
fi
