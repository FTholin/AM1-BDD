# Le petit New Yorkais

Nous avons établi une table de restaurants et nous avons besoin de votre aide pour répondre à quelques questions. Utilisez les commandes SQL que vous venez d'apprendre et trouvez les meilleurs restaurants de la ville.

### A vous de jouer !

Rédigez les requêtes suivantes :

0. Importez les requêtes dans le fichier `restaurant.sql`


1. Commencez par vous familiariser avec la table `restaurants` :

  ```sql
  SELECT *
  FROM restaurants;
  ```

  Quels sont les noms des colonnes ?


2. Quels sont les quartiers distincts ?


3. Quels sont les différents types de cuisine ?


4. Supposons que nous voulions un plat chinois à emporter.

  Quelles sont nos options ?


5. Retournez tous les restaurants dont l'avis est supérieur ou égal à 4.

6. Supposons qu'Abbi et Ilana souhaitent organiser un dîner chic.

  Retournez tous les restaurants qui sont italiens et dont le prix est de $$$.


7. Votre collègue Trey ne se souvient pas du nom exact d'un restaurant où il est allé, mais il sait qu'il contient le mot `Buddha`.

Pouvez-vous le trouver pour lui en utilisant une requête ?


8. Commandons une livraison à domicile !

  Trouvez tous les endroits proches dans le centre ville, le centre-ville ou `Chinatown`.

  (OR peut être utilisé plus d'une fois)


9. Trouvez tous les restaurants en attente de classement sanitaire (valeurs vides).


10. Créez un classement des 10 meilleurs restaurants en fonction des avis.


11. Utilisez une instruction `CASE` pour changer le système de classement en :

    - avis > 4.5 : Extraordinaire
    - avis > 4 est Excellent
    - critique > 3 = bon
    - critique > 2 : Moyen

Tout le reste est mauvais

N'oubliez pas de renommer la nouvelle colonne !
