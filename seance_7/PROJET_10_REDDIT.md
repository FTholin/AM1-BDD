# Tables multiples avec Reddit

Pour ce projet, vous travaillerez en tant qu'analyste de données et examinerez des données fictives provenant de Reddit, un site d'agrégation de nouvelles sociales et d'évaluation de contenu.

Sur Reddit, les utilisateurs peuvent créer des messages avec du contenu tel que du texte, des médias et des liens vers d'autres sites web. Les utilisateurs peuvent publier des contenus dans différentes communautés appelées "groupes", qui se concentrent sur un sujet particulier. Les utilisateurs peuvent ensuite évaluer le contenu des autres en le notant à la hausse ou à la baisse, et chaque message affichera son score total cumulé.

Pour cette tâche, vous avez reçu trois tableaux :

- utilisateurs : données sur les utilisateurs
- posts : informations sur les posts
- groupes : informations sur les groupes


## À vous de jouer ! 🤠


1. **Lister les utilisateurs (nom_utilisateur, email, date_adhesion) inscrits avant l’année 2010.**  
   - *Indication :* filtrer avec `date_adhesion < '2010-01-01'`.

2. **Combien d’utilisateurs n’ont pas de nom_utilisateur ou d’email renseignés ?**  
   - *Indication :* faire un comptage sur les valeurs `NULL`.

3. **Quels sont les 10 utilisateurs ayant le plus grand score dans la table utilisateurs ?**  
   - *Indication :* trier par `score` descendant et limiter le nombre de résultats.

4. **Trier les groupes (nom, nb_souscripteur) par nombre de souscripteurs, du plus élevé au plus faible.**  
   - *Indication :* `ORDER BY nb_souscripteur DESC`.

5. **Afficher pour chaque groupe le nombre total de posts qui y sont rattachés.**  
   - *Indication :* faire une jointure entre `posts` et `groupes`, puis un `GROUP BY groupes.id` et `COUNT(posts.id)`.

6. **Quel est l’utilisateur qui a posté le plus de messages au total (toutes tables `posts` et `posts2` confondues) ?**  
   - *Indication :* faire une **union** ou deux requêtes séparées, puis regrouper par l’utilisateur et compter le total de posts.

7. **Afficher la liste des posts dont le titre contient le mot “chien” ou “dog” (peu importe la casse).**  
   - *Indication :* utiliser `WHERE LOWER(titre) LIKE '%chien%' OR LOWER(titre) LIKE '%dog%'`.

8. **Quels sont les 5 posts avec le score le plus élevé dans la table `posts` ?**  
   - *Indication :* `ORDER BY score DESC LIMIT 5`.

9. **Lister tous les posts (titre, date_creation) créés en 2020, en les triant par date de création chronologiquement.**  
   - *Indication :* filtrer la colonne `date_creation` sur l’année 2020, ensuite `ORDER BY date_creation`.

10. **Afficher, pour chaque utilisateur, le score moyen de ses posts (dans la table `posts`) et le nombre total de posts.**  
    - *Indication :* jointure `utilisateurs` / `posts`, groupement par utilisateur, agrégations `AVG(score)` et `COUNT(*)`.

11. **Quel est le titre du post (dans `posts`) qui a le score maximum, et quel est ce score ?**  
    - *Indication :* on peut soit utiliser `ORDER BY ... DESC LIMIT 1`, soit la fonction d’agrégation `MAX()`.

12. **Trouvez les utilisateurs qui ont rejoint le même jour et qui ont le même score.**  
    - *Indication :* self-join ou agrégation/groupement par `(date_adhesion, score)` et un HAVING sur `COUNT(id) > 1`.

13. **Combien y a-t-il de posts dans le groupe “films” ?**  
    - *Indication :* identifier l’`id` du groupe `films`, puis compter dans `posts` (ou `posts2` si tu veux les cumuler).

14. **Afficher la liste des `id` de posts (avec leur titre) dont le score est supérieur à la moyenne de tous les scores (dans `posts`).**  
    - *Indication :* requête imbriquée pour comparer au `AVG(score)`.

15. **Quels sont les 3 groupes les plus anciens (date_creation la plus vieille) ?**  
    - *Indication :* trier `groupes` par `date_creation ASC` et limiter à 3.

16. **Dans la table `posts`, quels sont les 5 posts créés **le plus récemment** et quels sont leurs auteurs (nom d’utilisateur) ?**  
    - *Indication :* jointure `posts` / `utilisateurs`, tri par `date_creation DESC`, limiter à 5.

17. **Afficher la liste de tous les utilisateurs qui n’ont jamais rien posté (ni dans `posts` ni dans `posts2`).**  
    - *Indication :* utilisation de jointures et détection des `NULL` ou utilisation de `NOT IN`.

18. **Quels sont les groupes qui ont reçu des posts à la fois dans `posts` et dans `posts2` ?**  
    - *Indication :* repérer les `id` de groupe apparaissant dans les deux tables.

19. **Lister tous les posts créés par un utilisateur ayant rejoint avant 2010 et ayant un score de post supérieur à 50 000.**  
    - *Indication :* jointure utilisateurs / posts + condition sur `date_adhesion` + condition sur `posts.score`.

20. **Afficher le nombre total de posts (toutes tables confondues) créés par année.**  
    - *Indication :* faire une union (ou deux requêtes séparées) de `posts` et `posts2`, extraire l’année (`YEAR(date_creation)`) et faire un `GROUP BY` avec un `COUNT(*)`.

---

### Conseils généraux

- Utilise systématiquement les **jointures** (`JOIN`) pour relier tes tables quand tu as besoin d’informations de plusieurs d’entre elles (par exemple pour faire le lien entre les tables `utilisateurs`, `posts`, et `groupes`).
- N’hésite pas à expérimenter avec les **fonctions d’agrégation** (`COUNT`, `MAX`, `MIN`, `AVG`, `SUM`) et les **clause GROUP BY / HAVING** pour synthétiser les données.
- Pour filtrer les dates, tu peux utiliser des opérateurs comme `<`, `>`, `BETWEEN`, ou encore extraire l’année avec des fonctions SQL selon ton SGBD (par exemple `YEAR(date_adhesion)`).
- Pour chercher un terme dans un texte, utilise `LIKE '%...%'` ou `ILIKE '%...%'` (dans PostgreSQL) ou encore la fonction `LOWER()` pour ignorer la casse.
- Les **requêtes imbriquées** (sous-requêtes) te permettent de comparer une valeur à un résultat agrégé (par exemple la moyenne).
- Les **requêtes UNION** te permettent de concaténer deux jeux de résultats (par exemple pour agréger les posts de `posts` et de `posts2`).

Ces 20 questions te donneront un bon panorama de la manière d’exploiter cette base de données et de consolider tes compétences en SQL. Bon courage pour tes exercices !