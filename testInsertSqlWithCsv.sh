#!/bin/bash

#Il faut en paramètre : 
#        1) L'IP du serveur de la BDD
#        2) Mot de passe du serveur (pas obligatoire)
#        3) Nom de la BDD 
#        4) L'utilisateur de la BDD
#        5) Le mot de passe de l'utilisateur de la BDD (pas obligatoire)
#        6) Le nom du fichier csv
#        7) Le symoble de séparation
#Dans le fichier csv : 
#        - premier argument : table de la BDD
#        - deuxième argument : la liste des colonnes de la table qui vont recevoir une valeur
#        - chaque argument
#avec ; comme séparateur 
#\!/ Ne pas oublier des ' pour les chaines de caractètres \!/"

echo "" > test_Csv.sql
nb_ligne=($(wc -l tes_csv.csv))

for i in `seq 1 $nb_ligne`;
do
        table=($(head -n$i tes_csv.csv | tail -n1 | cut -d';' -f1 ))
	colonnes=($(head -n$i tes_csv.csv | tail -n1 | cut -d';' -f2))
	j=3
	values="("
	while [ -n "$(head -n$i tes_csv.csv | tail -n1 | cut -d';' -f$j)" ]
	do
		values="$values$(head -n$i tes_csv.csv | tail -n1 | cut -d';' -f$j),"
		j=$(($j+1))
	done
	values=${values%?}
	values="$values)"
	echo "INSERT INTO $table($colonnes) VALUES $values;" >> test_Csv.sql
done

psql -U postgres -f test_Csv.sql testCsv 
