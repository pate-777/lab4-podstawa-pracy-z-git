#!/bin/bash

if [ "$1" == "--date" ]; then
    echo $(date)
elif [ "$1" == "--logs" ]; then
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
elif [ "$1" == "--help" ]; then
    echo "Dostępne opcje:"
    echo "skrypt.sh --date - wyświetla dzisiejszą datę"
    echo "skrypt.sh --logs [liczba] - tworzy automatycznie [liczba] plików logx.txt, x - numer pliku od 1 do [liczba], zawierających informacje o nazwie, skrypcie i dacie"
    echo "skrypt.sh --help - wyświetla wszystkie dostępne opcje"
else
    echo "Nieznana opcja. Użyj 'skrypt.sh --help' aby zobaczyć dostępne opcje."
fi

