#!/bin/bash

if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    echo $(date)
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
    if [ -z "$2" ]; then
        count=100
    else
        count=$2
    fi

    for ((i=1; i<=$count; i++)); do
        filename="log$i.txt"
        echo "Nazwa pliku: $filename" > $filename
        echo "Skrypt: $0" >> $filename
        echo "Data: $(date)" >> $filename
    done
elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
    if [ -z "$2" ]; then
        count=100
    else
        count=$2
    fi

    for ((i=1; i<=$count; i++)); do
        filename="error$i.txt"
        echo "Nazwa pliku: $filename" > error/$filename
        echo "Skrypt: $0" >> error/$filename
        echo "Data: $(date)" >> error/$filename
    done
elif [ "$1" == "--init" ]; then
    git clone <repo-url> .
    export PATH=$PATH:$(pwd)
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Dostępne opcje:"
    echo "skrypt.sh --date (-d) - wyświetla dzisiejszą datę"
    echo "skrypt.sh --logs [liczba] (-l) - tworzy automatycznie [liczba] plików logx.txt, x - numer pliku od 1 do [liczba], zawierających informacje o nazwie, skrypcie i dacie"
    echo "skrypt.sh --error [liczba] (-e) - tworzy automatycznie [liczba] plików errorx.txt, x - numer pliku od 1 do [liczba], zawierających informacje o nazwie, skrypcie i dacie"
    echo "skrypt.sh --init - klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
    echo "skrypt.sh --help (-h) - wyświetla wszystkie dostępne opcje"
else
    echo "Nieznana opcja. Użyj 'skrypt.sh --help' aby zobaczyć dostępne opcje."
fi

