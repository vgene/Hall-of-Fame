#!/bin/bash

YEAR=2020

for i in ASPLOS CGO HPCA ISCA MICRO PACT PLDI POPL DSN; do
    cd $i;
    ./wget.sh $YEAR ;
    cp ../generateFameHTML.py .;
    python generateFameHTML.py;
    cd ..;
done
