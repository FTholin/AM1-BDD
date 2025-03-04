# Fonctions d'agrégation

## Introduction

Nous avons appris à écrire des requêtes pour récupérer des informations dans la base de données. Nous allons maintenant apprendre à effectuer des calculs à l'aide de SQL.

Les calculs effectués sur plusieurs lignes d'une table sont appelés agrégats.

Dans cette leçon, nous vous avons donné une table nommée fake_apps qui est constituée de données de fausses applications mobiles.

Voici un aperçu rapide de certains agrégats importants que nous allons aborder dans les cinq prochains exercices :

- `COUNT()` : compte le nombre de lignes.
- `SUM()` : la somme des valeurs d'une colonne
- `MAX()/MIN()` : la valeur la plus grande/la plus petite
- `AVG()` : la moyenne des valeurs d'une colonne
- `ROUND()` : arrondir les valeurs d'une colonne


### A vous de jouer ! 🤠

Avant de commencer, jetez un coup d'œil aux données de la table `applications`.

Dans l'éditeur de code, tapez ce qui suit :

```sql
SELECT *
FROM applications ;
```


Quels sont les noms des colonnes ? 

## COUNT

Le moyen le plus rapide de calculer le nombre de lignes d'un tableau est d'utiliser la fonction `COUNT()`.

`COUNT()` est une fonction qui prend le nom d'une colonne comme argument et compte le nombre de valeurs non vides dans cette colonne.

```sql
SELECT COUNT(*)
FROM nom_table;
```

Ici, nous voulons compter chaque ligne, donc nous passons `*` comme argument à l'intérieur des parenthèses.

### A vous de jouer ! 🤠

1. Comptons le nombre d'applications présentes dans le tableau.

Dans l'éditeur de code, exécutez :
```sql
SELECT COUNT(*) 
FROM applications;
```

2. Ajoutez une clause `WHERE` dans la requête précédente pour compter le nombre d'applications gratuites dans la table.



## SUM

SQL permet d'additionner facilement toutes les valeurs d'une colonne particulière à l'aide de la fonction `SUM()`.

`SUM()` est une fonction qui prend le nom d'une colonne comme argument et renvoie la somme de toutes les valeurs de cette colonne.

Quel est le nombre total de téléchargements pour l'ensemble des applications ?

```sql
SELECT SUM(telechargements)
FROM applications;
```


Cela ajoute toutes les valeurs de la colonne `telechargements`.

### Trouvons la réponse !

1. Dans l'éditeur de code, tapez :
```sql
SELECT SUM(telechargements)
FROM applications;
```


## Max / Min

Les fonctions `MAX()` et `MIN()` renvoient respectivement les valeurs les plus élevées et les plus basses d'une colonne.

Combien de téléchargements a l'application la plus populaire ?

```sql
SELECT MAX(telechargements)
FROM applications;
```

`MAX()` prend le nom d'une colonne comme argument et renvoie la plus grande valeur de cette colonne. Ici, nous avons renvoyé la plus grande valeur de la colonne des téléchargements.

`MIN()` fonctionne de la même manière, mais fait exactement le contraire : elle renvoie la plus petite valeur.

 ### A vous de jouer !
 
 1. Quel est le plus petit nombre de fois qu'une application a été téléchargée ?

Dans l'éditeur de code, tapez :
```sql
SELECT MIN(telechargements)
FROM applications;
```

2. Supprimez la requête précédente.

Rédigez une nouvelle requête qui renvoie le prix de l'application la plus chère.


## Moyenne

SQL utilise la fonction `AVG()` pour calculer rapidement la valeur moyenne d'une colonne particulière.

L'instruction ci-dessous renvoie le nombre moyen de téléchargements pour une application dans notre base de données :
```sql
SELECT AVG(telechargements)
FROM applications;
```
La fonction `AVG()` fonctionne en prenant le nom d'une colonne comme argument et renvoie la valeur moyenne de cette colonne.


### A vous de jouer !

1. Calculez le nombre moyen de téléchargements pour toutes les applications du tableau.

Dans l'éditeur de code, tapez :

```sql
SELECT AVG(telechargements)
FROM applications;
```

2. Supprimez la requête précédente.

Rédigez une nouvelle requête qui calcule le prix moyen de toutes les applications de la table.


## ROUND()

Par défaut, SQL essaie d'être aussi précis que possible sans arrondir. Nous pouvons rendre le tableau de résultats plus facile à lire en utilisant la fonction `ROUND()`.

La fonction `ROUND()` prend deux arguments entre parenthèses :

- un nom de colonne
- un nombre entier

Elle arrondit les valeurs de la colonne au nombre de décimales spécifié par le nombre entier.

```sql
SELECT ROUND(prix::numeric, 2)
FROM applications;
```

Ici, nous passons la colonne prix et le nombre entier 0 comme arguments. SQL arrondit les valeurs de la colonne à 0 décimale dans la sortie.

### A vous de jouer !

1.Renvoyons la colonne nom et une colonne prix arrondie.

Dans l'éditeur de code, tapez :
```sql
SELECT nom, ROUND(prix:numeric, 2)
FROM applications;
```

2. Supprimez la requête précédente.

    Dans le dernier exercice, nous avons pu obtenir le prix moyen d'une application (2,02365 €) en utilisant cette requête :

    ```sql
    SELECT AVG(prix)
    FROM applications;
    ```

    Modifions maintenant cette requête pour qu'elle arrondisse ce résultat à deux décimales.


## GROUPBY I

Il arrive souvent que l'on veuille calculer un agrégat pour des données présentant certaines caractéristiques.

Par exemple, nous pouvons vouloir connaître la moyenne des évaluations IMDb pour tous les films chaque année. Nous pourrions calculer chaque nombre par une série de requêtes avec différentes instructions WHERE, comme suit :

```sql
SELECT AVG(note_imdb)
FROM films
WHERE annee = 1999;
 
SELECT AVG(note_imdb)
FROM films
WHERE annee = 2000;
 
SELECT AVG(note_imdb)
FROM movies
WHERE annee = 2001;
```


et ainsi de suite.

Heureusement, il existe un meilleur moyen !

Nous pouvons utiliser `GROUP BY` pour faire cela en une seule étape :
```sql
SELECT annee,
   AVG(note_imdb)
FROM films
GROUP BY annee
ORDER BY annee;
```

`GROUP BY` est une clause du langage SQL qui est utilisée avec les fonctions d'agrégation. Elle est utilisée en collaboration avec l'instruction `SELECT` pour organiser des données identiques en groupes.

L'instruction `GROUP BY` vient après toute instruction `WHERE`, mais avant `ORDER BY` ou `LIMIT`.

### A vous de jouer !

1. Dans l'éditeur de code, tapez :
    ```sql
    SELECT prix, COUNT(*) 
    FROM applications
    GROUP BY prix;
    ```

    Ici, notre fonction d'agrégation est `COUNT()` et nous avons classé les prix en groupes.

    Quel est le résultat attendu ?


2. Dans la requête précédente, ajoutez une clause `WHERE` pour compter le nombre total d'applications qui ont été téléchargées plus de 20 000 fois, à chaque prix.


3. Supprimez la requête précédente.

   - Rédigez une nouvelle requête qui calcule le nombre total de téléchargements pour chaque catégorie.
   - Faites une selection `SELECT` sur `categorie` and `SUM(telechargements)`.


## GROUPBY II

Parfois, nous voulons `GROUP BY` un calcul effectué sur une colonne.

Par exemple, nous pouvons vouloir savoir combien de films ont une note IMDb arrondie à 1, 2, 3, 4, 5. 

Pour ce faire, nous pouvons utiliser la syntaxe suivante :

```sql
SELECT ROUND(note_imdb:numeric, 2), COUNT(nom)
FROM films
GROUP BY ROUND(note_imdb)
ORDER BY ROUND(note_imdb);
```

Cependant, cette requête peut être longue à écrire et plus sujette aux erreurs.

SQL nous permet d'utiliser une ou plusieurs références de colonnes dans notre `GROUP BY`, ce qui nous facilitera la vie.

- 1 est la première colonne sélectionnée
- 2 est la deuxième colonne sélectionnée
- 3 est la troisième colonne sélectionnée

et ainsi de suite.

La requête suivante est équivalente à celle qui précède :

```sql
SELECT ROUND(note_imdb:numeric, 2), COUNT(nom)
FROM films
GROUP BY 1
ORDER BY 1;
```

Ici, le 1 fait référence à la première colonne de notre instruction `SELECT, ROUND(note_imdb)`.

### A vous de jouer !

1. Supposons que nous ayons la requête ci-dessous :
```sql
SELECT categorie, 
   prix,
   AVG(telechargements)
FROM applications
GROUP BY categorie, prix;
```

2. Rédigez la même requête, mais utilisez des numéros de référence de colonne au lieu des noms de colonne après `GROUP BY`.



## Having 

Outre la possibilité de regrouper des données à l'aide de `GROUP BY`, SQL vous permet également de filtrer les groupes à  à inclure et ceux à exclure.

Par exemple, imaginons que nous voulions voir combien de films de genres différents ont été produits chaque année, mais que nous ne nous intéressions qu'aux années et aux genres comportant au moins 10 films.

Nous ne pouvons pas utiliser `WHERE` ici car nous ne voulons pas filtrer les lignes, mais les groupes.

C'est là qu'intervient l'option `HAVING`.

`HAVING` est très similaire à `WHERE`. En fait, tous les types de clauses `WHERE` que vous avez appris jusqu'à présent peuvent être utilisés avec `HAVING`.

Nous pouvons utiliser la formule suivante pour résoudre le problème :

```sql
SELECT annee,
   genre,
   COUNT(nom)
FROM films
GROUP BY 1, 2
HAVING COUNT(nom) > 10;
```


- Lorsque l'on veut limiter les résultats d'une requête en fonction des valeurs des lignes individuelles, on utilise `WHERE`.
- Lorsque l'on veut limiter les résultats d'une requête en fonction d'une propriété agrégée, on utilise HAVING.

L'instruction `HAVING` vient toujours après `GROUP BY`, mais avant `ORDER BY` et `LIMIT`.


### A vous de jouer !

1. Supposons la requête suivante:
    ```sql
    SELECT prix, 
       ROUND(AVG(telechargements)),
       COUNT(*)
    FROM applications
    GROUP BY prix;
    ```

    - Elle renvoie les téléchargements moyens (arrondis) et le nombre d'applications - à chaque niveau de prix.

    - Cependant, certains prix n'ont pas beaucoup d'applications, et leurs téléchargements moyens sont donc moins significatifs.

Ajoutez une clause `HAVING` pour restreindre la requête aux prix qui ont plus de 10 applications.
