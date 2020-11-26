#!/bin/bash
#*********See skrpit võtab parameetriks skripti aktiveerimisel sisestatud argumendi...
#*********...ja loob antud nimega kasutaja ilma paroolita
#********* Sellena on mõeldud seda et skripti aktiveerimisel käsurea lõppu kasutajanimi mida tahetakse
#*********kasutajale tehakse /home kausta omanimeline kaust, tekkima peavad ka peidetud struktuurid 

# kasutaja lisamise skript
# kasutaja nimi tuleb anda skripti parameetrina
# skript peab antud nimega kasutajat lisama süsteemi
# ning looma kasutajale vastava sisuga kodukataloogi
# ja pakkuma sobilik koorik
#
# võime lisada ka kasutusjuhendi, kui midagi valesti käivitame või unustame kasutajanimi edasi anda
# käsurea kaudu parameetrite arv on $# sees olev number, meie korral peab olema 1 parameeter - kasutajanimi
# kui aga antud parameeter ei ole lisatud - tuleb juhendada kasutajat, kuidas skriptiga tööd teha
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 kasutajanimi"
else
  # defineerime vajalik muutuja kasutajanimi salvestamiseks
  # kuna andmed edastatakse käsurealt skripti parameetrina, siis need on $1 $2 jne
  # kasutajanimi on esimene parameeter, seega tuleb kasutada $1 muutujat
  kasutajanimi=$1 
  # kasutame kasutaja lisamise käsk vajalikute võtmetega
  #
  #
  useradd $kasutajanimi -m -s /bin/bash ###################See siin on põhikäsk, mille ümber töö käib
  #
  #
  #
  # põhimõtteliselt nagu kõik, aga kes teab kas antud käsu tulemus on ok või mitte
  # seega kontrollime seda
  # $? - viimase! käsu väljund staatus, 0 kui on korras, muu kui on probleem
  if [ $? -eq 0 ]; then
    echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
    cat /etc/passwd | grep $kasutajanimi
    ls -la /home/$kasutajanimi
  else
    echo "probleem kasutaja $kasutajanimi lisamisega"
    echo "probleemi kood on $?"
  fi
# skripti õige kasutamise kontrolli lõpp
fi
