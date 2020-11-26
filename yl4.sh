#!/bin/bash
if [ $# -ne 2 ]; then
	echo "Skript on valesti!Käivita nii: $0 kasutajatefail paroolifail"
else
	kasutajafail=$1
	paroolidefail=$2
	if [ -f $kasutajafail -a -r $kasutajafail ] && [ -f $paroolidefail -a -r $paroolidefail ]; then
		echo "fail $kasutajafail kasutajatega ja $paroolidefail paroolidega on korras"
		paste -d":" $kasutajafail $paroolidefail >chpasswdjaoks.txt
		for kasutaja in $(cat $kasutajafail)
		do
			useradd $kasutaja -m -s  /bin/bash
			echo "kontrollime kas kasutaja nimega $kasutaja on loodud: "
			more /etc/shadow | grep "$kasutaja"
		done

		for kas_parool in $(cat chpasswdjaoks.txt)
		do
			echo $kas_parool | chpasswd
			kas=$(echo $kas_parool | cut -f1 -d":" )
			echo "kasutajale $kas parool on määratud! "
		done
	else
	echo "faili $kasutajafail või $paroolidefail ei ole. Kontrolli!"
	fi
fi
