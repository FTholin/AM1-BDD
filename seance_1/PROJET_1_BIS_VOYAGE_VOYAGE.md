# Créer une table de voyages

Dans ce projet, vous allez créer une table pour enregistrer vos voyages et les expériences uniques qu'ils ont apportées, en ajoutant ou retirant des informations au besoin.

### A vous de jouer !

1. Créez une table `voyages` avec les colonnes suivantes :
   - `id`  un entier
   - `destination` 
   - `date_depart`
   - `date_retour` 

2. Insérez des données sur votre dernier voyage.

3. Vérifiez l'insertion avec la commande :
   ```sql
   SELECT * FROM voyages;
   ```
   Assurez-vous que :
   - La table a été correctement créée.
   - Les données de votre dernier voyage ont été ajoutées.

4. Ajoutez des informations sur deux autres voyages.

5. Vous avez décidé de prolonger un de vos voyages.
   - Mettez à jour la `date_retour` pour ce voyage.

6. Ajoutez une colonne `commentaires` de type `TEXT`.

7. Ajoutez des commentaires pour chaque voyage.

8. Vous avez changé d'avis sur un voyage.
   - Supprimez cette entrée de la table.

9. Félicitations ! Consultez la table mise à jour :
   ```sql
   SELECT * FROM voyages;
   ```