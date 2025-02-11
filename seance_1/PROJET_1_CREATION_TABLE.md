## Créer une table
Dans ce projet, vous allez créer votre propre tableau d'amis et y ajouter/supprimer des données !

Les instructions fournies sont des lignes directrices générales. N'hésitez pas à ajouter d'autres colonnes, à insérer d'autres données et à créer d'autres tableaux.

### A vous de jouer !

1. Créez une table nommée `amis` avec trois colonnes :

    - `id` qui stocke `INTEGER`
    - `nom` qui stocke `TEXT`
    - `date_naissance` qui stocke `DATE`


2. Sous votre code actuel, ajoutez Ororo Munroe à vos amis.

    Son anniversaire est le 30 mai 1940.


3. Assurons-nous que Ororo a bien été ajoutée à la base de données :
```sql
SELECT *
FROM amis;
```
Vérifiez deux choses :

    - La table des amis est-elle créée ?
    - Est-ce que Ororo Munroe y a été ajouté ?


4. Passez à l'action !

    - Ajoutez deux de vos amis à la table.

    - Insérez un identifiant, un nom et une date de naissance pour chacun d'eux.


5. Ororo Munroe vient de réaliser qu'elle peut contrôler la météo et a décidé de changer de nom. Son nouveau nom est "Tempête".

    - Mettez à jour son enregistrement dans les amis.


6. Ajoutez une nouvelle colonne nommée "email".


7. Mettez à jour l'adresse électronique de tous les membres de votre table.

    - L'adresse électronique de `Tempête` est `tempete@gmail.com`.


8. Attendez, `Tempête` est une fiction...

    - Retirez-la de vos amis.


9. Bon travail ! Regardons le résultat une dernière fois :
```sql
SELECT *
FROM amis;
```
