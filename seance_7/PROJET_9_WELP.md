# Welp

Pour mettre en pratique ce que vous avez appris sur la jonction de plusieurs tables, vous allez utiliser les données d'une application passionnante appelée Welp. Les utilisateurs adorent Welp parce qu'elle leur permet de laisser des avis sur les entreprises de leur ville et de voir comment d'autres personnes ont évalué ces entreprises.

Pour ce projet, vous travaillerez avec deux tables :

- lieux
- avis


## À vous de jouer ! 🤠


- **lieux** (contient par exemple : `id_lieu`, `nom`, `note_moyenne`, `budget`, etc.)  
- **avis** (contient par exemple : `id_avis`, `nom_utilisateur`, `id_lieu`, `date_avis`, `note`, `commentaire`, etc.)

Les noms de colonnes exacts peuvent varier selon ta structure, mais l’idée est de montrer 20 requêtes représentatives que l’on peut exécuter.

---

## 1. Lister tous les avis de la table `avis`

**Question** : Afficher tous les enregistrements de la table `avis` pour voir son contenu complet.



---

## 2. Afficher tous les lieux de la table `lieux`

**Question** : Lister tous les lieux disponibles pour comprendre leur structure.


---

## 3. Trouver les lieux dont le budget est de 20 $ ou moins

**Question** : En supposant que chaque signe `$` correspond à 10 €, comment afficher tous les lieux qui coûtent 20 $ ou moins ?  
*(Ici, on suppose que la colonne `budget` représente le nombre de signes `$`. Par exemple, `budget = 2` correspond à `$$` = 20 $.)*



---

## 4. Identifier les colonnes qui permettent de faire une jointure entre `lieux` et `avis`

**Question** : Quelles colonnes peut-on utiliser pour lier les deux tables ?  
**Réponse** :*(Ici, ce n’est pas une requête SQL mais une explication 


## 5. Effectuer une jointure interne (INNER JOIN) pour obtenir toutes les évaluations avec le nom du lieu

**Question** : Rédiger une requête pour joindre les deux tables et afficher toutes les évaluations et le nom du lieu correspondant.


---

## 6. Afficher uniquement les colonnes importantes (nom du lieu, note moyenne, nom_utilisateur, note, date, commentaire)

**Question** : Limiter les colonnes renvoyées pour simplifier l’affichage.



---

## 7. Faire un LEFT JOIN et comparer le résultat avec l’INNER JOIN

**Question** : Afficher le même jeu de colonnes qu’à la question précédente, mais en utilisant un LEFT JOIN. Quelles différences observe-t-on ?



**Réponse** :  
- L’**INNER JOIN** (question 6) n’affiche que les lieux qui ont **au moins un avis**.  
- Le **LEFT JOIN** (question 7) affiche **tous les lieux**, même s’ils n’ont pas d’avis (dans ce cas, les colonnes d’`avis` sont `NULL`).  

---

## 8. Repérer tous les lieux qui n’ont aucun avis

**Question** : Qu’en est-il des lieux sans avis ? Écrire une requête pour les trouver.



---

## 9. Combien d’avis chaque lieu a-t-il reçus ?

**Question** : Compter le nombre d’avis par lieu.



---

## 10. Quel est le lieu ayant reçu le plus d’avis ?

**Question** : Identifier le lieu le plus commenté.



---

## 11. Quels sont les avis dont la note est inférieure à la note moyenne du lieu ?

**Question** : Afficher nom du lieu, note moyenne du lieu, nom de l’utilisateur, note de l’avis, pour tous les avis en dessous de la moyenne du lieu.



---

## 12. Calculer la note moyenne donnée par chaque utilisateur

**Question** : Moyenne de toutes les notes postées par un même `nom_utilisateur`.



---

## 13. Lister toutes les notes et commentaires laissés en 2020

**Question** : Utiliser la clause `WHERE` pour filtrer les avis de 2020.



---

## 14. (Avec clause `WITH`) Sélectionner tous les avis publiés en 2020 et joindre les lieux pour n’afficher que le nom du lieu, la date et le commentaire

Les systèmes de gestion de bases de données SQLite et PostgreSQL offrent tous deux des mécanismes pour formater ou extraire des parties spécifiques d'une date, mais ils utilisent des fonctions et des syntaxes différentes.

---

### En SQLite : Utilisation de `strftime` avec `%Y`

- **La fonction `strftime`**  
  SQLite propose la fonction `strftime` pour formater des valeurs de date et d'heure en chaîne de caractères selon un format spécifié.  
  - **Syntaxe générale :**  
    ```sql
    strftime(format, date, modifier1, modifier2, ...)
    ```
    Ici, `format` est une chaîne dans laquelle on utilise des séquences d'échappement (par exemple `%Y`, `%m`, `%d`, etc.) pour indiquer les différentes parties de la date ou de l’heure.

- **Utilisation de `%Y`**  
  Le format `%Y` renvoie l'année sur 4 chiffres. Par exemple :
  ```sql
  SELECT strftime('%Y', '2024-04-08');
  ```
  Ce qui renverra la chaîne `'2024'`. Cela est utile lorsque vous souhaitez extraire l'année d'une date ou présenter les dates sous un format précis.

---

### En PostgreSQL : La fonction équivalente

PostgreSQL n’emploie pas `strftime` mais offre plusieurs méthodes pour obtenir le même résultat :

1. **Utiliser `to_char` pour le formatage**  
   - **Fonctionnement :**  
     `to_char` permet de convertir des valeurs de date ou timestamp en une chaîne de caractères selon un format spécifié, similaire à `strftime`.
   - **Exemple d’utilisation :**
     ```sql
     SELECT to_char(current_date, 'YYYY');
     ```
     Cela renverra l'année courante sous forme de chaîne (ex. `'2024'`).

2. **Utiliser `EXTRACT` pour obtenir un entier**  
   - **Fonctionnement :**  
     La fonction `EXTRACT` permet d'extraire une partie numérique d'une date, comme l'année.
   - **Exemple d’utilisation :**
     ```sql
     SELECT EXTRACT(YEAR FROM current_date);
     ```
     Cette requête renverra l'année courante en tant que nombre (ex. `2024`).




**Question** : Utiliser la clause `WITH` et (selon le SGBD) une fonction de date (ex. `strftime` en SQLite) pour isoler les avis de 2020.





C’est super pratique pour filtrer sur des **mois**, **jours**, ou **années** sans modifier le format de date !

---

## 15. Trouver les avis publiés en mars 2020 (avec `strftime`)

**Question** : Sélectionner les colonnes principales pour les avis du mois de mars 2020, toujours avec la fonction `strftime` (SQLite) ou équivalent.



---

## 16. Déterminer l’utilisateur qui a publié le plus grand nombre d’avis au total

**Question** : Classer les utilisateurs selon leur nombre d’avis et n’afficher que celui qui en a le plus.



---

## 17. Trouver l’évaluateur ayant le plus grand nombre d’évaluations **inférieures** à la note moyenne des lieux

**Question** : Besoin de faire une jointure pour comparer la note d’un avis avec la note moyenne du lieu, puis compter.



---

## 18. Lister, pour chaque lieu, la note la plus basse reçue

**Question** : Utile pour identifier des critiques particulièrement négatives.



---

## 19. Afficher pour chaque lieu la note la plus élevée reçue et l’utilisateur qui l’a donnée

**Question** : On peut utiliser une sous-requête ou diverses techniques (fenêtres, etc.). Exemples d’une méthode plus basique :


---

## 20. Afficher un récapitulatif regroupé par lieu : nombre d’avis, note moyenne calculée sur les avis, et note moyenne enregistrée dans la table `lieux`

**Question** : Vérifier la cohérence entre la `note_moyenne` de la table `lieux` et la moyenne réelle des avis.


