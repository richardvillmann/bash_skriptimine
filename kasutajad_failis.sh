#!/bin/bash
#   
# kasutajate lisamise skript, mis võtab failist kasutajad ja initsieerib lisa_kasutaja scripti, luues uued userid ja nende kaustad kasutajadtxt faili seest
if [ $# -eq 0 ]; then
    echo "Kasutusjuhend:Sisestage nii  $0 failinimi"	
else
  failinimi=$1
  if [ -f $failinimi -a -r $failinimi ]; then
### -f kontrollib kas fail eksisteerib ehk find ja -r loeb failist sisu ehk read
    echo "fail on korras"
    for nimi in $(cat $failinimi)
    do
      # sellega peaks faili sisu olema nähtav, kui fail on kätte saadav ja nüüd echo asemel tuleb kutsuda vajalik skript
       echo $nimi ###näitab kellele luuakse
      sh lisa_kasutaja.sh $nimi # sellega me laseme lisa_kasutaja skript tööle
    done
  else
    echo "probleem failiga $failinimi"
  fi
# parameetrite kontrolli lõpp
fi

