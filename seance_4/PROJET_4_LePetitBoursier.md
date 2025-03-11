# LePetitBoursier

LepetitBoursier est une bourse de devises numériques dont le siège social se trouve à Lyon. Ils hebergent des échanges de Bitcoin, Bitcoin Cash, Ethereum, et Litecoin avec des devises fiduciaires dans environ 50 pays.

Aidez-les à analyser les données de leur grand livre de janvier en utilisant les fonctions d'agrégation SQL ! On vous donne la table `transactions`, qui contient les transactions d'entrée et de sortie d'argent.

## À vous de jouer !

0. Importez la table `transactions` dans votre base de données.


1. Commençons par vérifier l'ensemble du tableau des transactions :
```sql
SELECT *
FROM transactions ;
```
    - Quels sont les noms des colonnes ?


2. Quel est le nombre total de transactions dans la table ?


3. Quelles sont les devises utilisées dans la table ?



4. La colonne `entree` enregistre le montant (en euros) que l'utilisateur a acheté.
    - Quel est le montant total de la colonne `entree` dans la table ?


5. La colonne `sortie` enregistre le montant (en euros) que l'utilisateur a vendu.

    - Quel est le montant total de `sortie` dans la table ?


6. Il a été rapporté que le Bitcoin (`BTC`) domine dans LepetitBoursier. Voyons si c'est vrai dans le cadre de ces dates en répondant à deux questions :
    - Combien de transactions entrée y a-t-il dans ce tableau ?
    - Combien de transactions " entrée " y a-t-il dans ce tableau où `BTC` est la devise ?
    


7. Quelle était la plus grosse transaction de la table ?

    Etait-ce une entrée ou une sortie ?


8. Quelle est l'entrée moyenne pour la devise Ethereum (`'ETH'`) ?


9. Sélectionnez la date, la moyenne des entrées et la moyenne des sorties d'argent dans la table et regroupons tout par date.


10. Pour faciliter la lecture de la requête précédente, arrondissez les moyennes à 2 décimales.

    Donnez des alias aux colonnes en utilisant `AS` pour plus de lisibilité.

11. Quel est le nombre de transactions par utilisateur ?

12. Quel est le montant total des entrées et des sorties pour chaque utilisateur, divisé par devise ?

13. Quel est le nombre de transactions effectuées chaque jour ?

14. Quelle est la tendance quotidienne des transactions en termes de volume (nombre de transactions) au cours du mois ? 

15. Quelle est la devise la plus utilisée dans les transactions ?

16. Quel est le montant total des entrées et des sorties pour chaque jour ?

