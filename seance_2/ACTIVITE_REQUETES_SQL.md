# QUERIES


## Introduction

Dans cette leçon, nous allons apprendre différentes commandes SQL pour interroger une seule table dans une base de données.

L'un des principaux objectifs du langage SQL est de récupérer des informations stockées dans une base de données. C'est ce qu'on appelle communément l'interrogation. Les requêtes nous permettent de communiquer avec la base de données en posant des questions et en renvoyant un ensemble de résultats contenant des données pertinentes pour la question.

Nous allons interroger une base de données contenant une table appelée films.

C'est parti !

Fait amusant : IBM a lancé SQL sous le nom de SEQUEL (Structured English QUEry Language) dans les années 1970 pour interroger les bases de données.


### A vous de jouer ! 🤠

Nous devons nous familiariser avec la table des films.

Dans l'éditeur, tapez ce qui suit :

```sql
SELECT * FROM films;
Quels sont les noms de colonnes ?
```

## Select

Précédemment, nous avons appris que `SELECT` est utilisé chaque fois que vous voulez interroger des données d'une base de données et que * signifie toutes les colonnes.

Supposons que nous ne soyons intéressés que par deux des colonnes. Nous pouvons sélectionner des colonnes individuelles par leurs noms (séparés par une virgule) :

```sql
SELECT colonne1, colonne2
FROM nom_table;
```

Pour faciliter la lecture, nous avons déplacé `FROM` sur une autre ligne.

Les sauts de ligne ne signifient rien de particulier en `SQL`. Nous pourrions écrire cette requête entière en une seule ligne, et elle s'exécuterait parfaitement.

### A vous de jouer ! 🤠

1. Ne sélectionnons que les colonnes nom et genre du tableau.

Dans l'éditeur de code, tapez ce qui suit :

```sql
SELECT nom, genre
FROM films;
```

2. Maintenant, nous voulons inclure une troisième colonne.

Modifiez votre requête pour qu'elle renvoie les colonnes `nom`, `genre` et `annee` du tableau.


## As

Sachant comment fonctionne `SELECT`, supposons que nous ayons le code ci-dessous :

```sql
SELECT nom AS Titres
FROM films;
```


Pouvez-vous deviner ce que fait `AS` ?

`AS` est un mot-clé en `SQL` qui vous permet de renommer une colonne ou une table en utilisant un alias. Le nouveau nom peut être ce que vous voulez tant que vous le placez entre guillemets simples. Ici, nous avons renommé la colonne nom en `Titres`.

Quelques points importants à noter :

    - Bien que ce ne soit pas toujours nécessaire, la meilleure pratique consiste à entourer vos alias de guillemets simples.
    - Lorsque vous utilisez `AS`, les colonnes ne sont pas renommées dans la table. Les **alias apparaissent uniquement dans le résultat**.

### A vous de jouer ! 🤠

1. Pour montrer ce que fait le mot-clé `AS`, sélectionnez la colonne name et renommez-la avec un alias de votre choix.

Placez l'alias entre guillemets simples, comme suit :

```sql
SELECT nom AS '______'
FROM films;
```

Notez dans le résultat, que le nom de la colonne est maintenant votre alias.

2. Modifiez la requête de sorte qu'au lieu de sélectionner et de renommer la colonne `nom`, sélectionnez la colonne `note_imdb` et renommez-la en `IMDb`.


## Distinct

Lorsque nous examinons les données d'une table, il peut être utile de savoir quelles valeurs distinctes existent dans une colonne particulière.

`DISTINCT` est utilisé pour renvoyer des valeurs uniques dans la sortie. Il filtre toutes les valeurs en double dans la ou les colonnes spécifiées.

Par exemple,

```sql
SELECT outils
FROM inventaire;
```

pourrait produire :

| outils  |
|--------|
| Marteau |
| Clous  |
| Clous  |
| Clous  |

En ajoutant `DISTINCT` devant le nom de la colonne,

```sql
SELECT DISTINCT outils
FROM inventaire;
```

le résultat serait maintenant :

| outils  |
|--------|
| Marteau |
| Clous |


Le filtrage des résultats d'une requête est une compétence importante en SQL. Il est plus facile de voir les différents genres possibles dans le tableau des films après que les données ont été filtrées que de parcourir chaque ligne du tableau.

### A vous de jouer ! 🤠

1. Essayons-le. Dans l'éditeur de code, tapez :

```sql
SELECT DISTINCT genre
FROM films;
```

Quels sont les genres uniques ?

2. Maintenant, changez le code pour que nous retournions les valeurs uniques de la colonne `annee` à la place.


## Where

Nous pouvons restreindre les résultats de notre requête à l'aide de la clause `WHERE` afin d'obtenir uniquement les informations que nous souhaitons.

En suivant ce format, l'instruction ci-dessous filtre l'ensemble des résultats pour n'inclure que les films les mieux notés (notes IMDb supérieures à 8) :

```sql
SELECT *
FROM films
WHERE note_imdb > 8;
```


Comment cela fonctionne-t-il ?

La clause `WHERE` filtre le jeu de résultats pour n'inclure que les lignes où la condition suivante est vraie.

La condition est `note_imdb > 8`. Ici, seules les lignes dont la valeur est supérieure à 8 dans la colonne `note_imdb` seront retournées.

Le `>` est un opérateur. Les opérateurs créent une condition qui peut être évaluée comme vraie ou fausse.

Les opérateurs de comparaison utilisés avec la clause `WHERE` sont les suivants :

  - `=` égal à
  - `!=` non égal à
  - `>` supérieur à
  - `<` inférieur à
  - `>=` supérieur ou égal à
  - `<=` inférieur ou égal à

Il existe également quelques opérateurs spéciaux que nous allons découvrir dans les exercices à venir.

### A vous de jouer ! 🤠

1. Supposons que nous voulions jeter un coup d'œil à tous les films qui n'ont pas été très bien accueillis dans la base de données.

Dans l'éditeur de code, tapez :

```sql
SELECT *
FROM films
WHERE note_imdb < 5;
```

Ouch!

2. Modifiez la requête pour qu'elle récupère désormais tous les films récents, plus précisément ceux qui sont sortis après 2014.

Sélectionnez toutes les colonnes en utilisant `*`.


## Like I

`LIKE` peut être un opérateur utile lorsque vous souhaitez comparer des valeurs similaires.

Le tableau des films contient deux films aux titres similaires, "Se7en" et "Seven".

Comment pouvons-nous sélectionner tous les films qui commencent par 'Se' et se terminent par 'en' et qui ont exactement un caractère au milieu ?

```sql
SELECT *
FROM films
WHERE noms LIKE 'Se_en';
```

- `LIKE` est un opérateur spécial utilisé avec la clause `WHERE` pour rechercher un motif spécifique dans une colonne.

- name `LIKE` 'Se_en' est une condition qui évalue la colonne name à la recherche d'un motif spécifique.

- Se_en représente un modèle avec un caractère générique.

Le `_` signifie que vous pouvez substituer n'importe quel caractère individuel ici sans rompre le motif. Les noms Seven et Se7en correspondent tous deux à ce modèle.

### A vous de jouer ! 🤠

1. testons-le.

Dans l'éditeur de code, tapez :

```sql
SELECT *
FROM films
WHERE nom LIKE 'Se_en';
```

## Like II

Le signe pourcentage `%` est un autre caractère générique qui peut être utilisé avec `LIKE`.

L'instruction ci-dessous filtre le jeu de résultats pour n'inclure que les films dont le nom commence par la lettre 'A' :

```sql
SELECT *
FROM films
WHERE nom LIKE 'A%';
```

`%` est un caractère générique qui correspond à zéro ou plusieurs lettres manquantes dans le modèle. Par exemple :

    - A% correspond à tous les films dont le nom commence par la lettre 'A'.
    - %a correspond à tous les films dont le nom se termine par 'a'.

On peut également utiliser `%` à la fois avant et après un motif :

```sql
SELECT *
FROM films
WHERE nom LIKE '007%';
```

Dans ce cas, tous les films dont le nom contient le mot "007" seront affichés dans le résultat.

LIKE n'est pas sensible à la casse. "Batman" et "Man of Steel" apparaîtront tous deux dans le résultat de la requête ci-dessus.

### A vous de jouer ! 🤠

1. Dans l'éditeur de texte, tapez :

```sql
SELECT *
FROM films
WHERE nom LIKE '007%';
```

Combien de titres de films contiennent le mot "007" ?


2. Essayons encore une fois.

Modifiez la requête de manière à ce qu'elle sélectionne toutes les informations sur les titres de films commençant par le mot `Star Wars%`.

Vous aurez peut-être besoin d'un espace !


## Is Null

À ce stade de la leçon, vous avez peut-être remarqué qu'il y a quelques valeurs manquantes dans le tableau des films. Le plus souvent, les données que vous rencontrez comportent des valeurs manquantes.

Les valeurs inconnues sont indiquées par `NULL`.

Il n'est pas possible de tester les valeurs `NULL` avec les opérateurs de comparaison, tels que `=` et `!=`.

À la place, nous devrons utiliser ces opérateurs :

- `IS NULL`
- `IS NOT NULL`

Pour filtrer tous les films ayant un classement IMDb :

```sql
SELECT nom
FROM films
WHERE note_imdb IS NOT NULL;
```

### A vous de jouer ! 🤠

Maintenant, faisons l'inverse.

Ecrivez une requête pour trouver tous les films sans classement IMDb.

Ne sélectionnez que la colonne des noms !

```sql
SELECT nom
FROM films
WHERE note_imdb IS NULL;
```

## Between

L'opérateur `BETWEEN` est utilisé dans une clause `WHERE` pour filtrer l'ensemble des résultats dans une certaine plage. Il accepte deux valeurs qui sont soit des nombres, soit du texte, soit des dates.

Par exemple, cette instruction filtre le jeu de résultats pour n'inclure que les films dont l'année va de 1990 à 1999 inclus.

```sql
SELECT *
FROM films
WHERE annee BETWEEN 1990 AND 1999;
```

Lorsque les valeurs sont du texte, `BETWEEN` filtre l'ensemble des résultats dans la plage alphabétique.

Dans cette déclaration, `BETWEEN` filtre l'ensemble des résultats pour n'inclure que les films dont le nom commence par la lettre 'A' jusqu'à, mais sans, ceux qui commencent par 'J'.

```sql
SELECT *
FROM films
WHERE nom BETWEEN 'A' AND 'J';
```

Cependant, si le nom d'un film est simplement 'J', il correspondra. En effet, `BETWEEN` va jusqu'à la deuxième valeur - jusqu'à 'J'. Ainsi, le film nommé "J" sera inclus dans l'ensemble des résultats, mais pas "Jaws".


### A vous de jouer !

1. En utilisant l'opérateur `BETWEEN`, écrivez une requête qui sélectionne toutes les informations sur les films dont le nom commence par les lettres 'D', 'E' et 'F'.


2. Supprimez la requête précédente.
  En utilisant l'opérateur `BETWEEN`, écrivez une nouvelle requête qui sélectionne toutes les informations sur les films sortis dans les années 1970.


  ## And

  Il arrive que l'on veuille combiner plusieurs conditions dans une clause `WHERE` afin de rendre le jeu de résultats plus spécifique et plus utile.

  Une façon de le faire est d'utiliser l'opérateur `AND`. Ici, nous utilisons l'opérateur `AND` pour obtenir uniquement les films d'amour des années 90.

  ```sql
  SELECT *
  FROM films
  WHERE annee BETWEEN 1990 AND 1999
     AND genre = 'action';
  ```
  - `annee BETWEEN 1990 AND 1999` est la 1ère condition.

  - `genre = 'action'` est la 2ème condition.

  - `AND` combine les deux conditions.



  ![and](./ressources/and.svg)


  Avec `AND`, les deux conditions doivent être vraies pour que la ligne soit incluse dans le résultat.


  ### A vous de jouer ! 🤠

  Dans l'exercice précédent, nous avons récupéré tous les films sortis dans les années 1970.

  Maintenant, récupérons tous les films sortis dans les années 70, qui ont également été bien reçus.

  Dans l'éditeur de code, tapez :

  ```sql
  SELECT *
  FROM films
  WHERE annee BETWEEN 1970 AND 1979
    AND note_imdb > 8;
  ```

  2. Supprimez la requête précédente.

      - Supposons que nous ayons un ami pointilleux qui ne veut regarder que des vieux films d'horreur.

      - En utilisant AND, écrivez une nouvelle requête qui sélectionne tous les films antérieurs à 2010 qui appartiennent également au genre action.



## Or

Semblable à `AND`, l'opérateur `OR` peut également être utilisé pour combiner plusieurs conditions dans WHERE, mais il existe une différence fondamentale :

- L'opérateur `AND` affiche une ligne si toutes les conditions sont vraies.
- L'opérateur `OR` affiche une ligne si l'une des conditions est vraie.

Supposons que nous voulions voir un nouveau film ou un film d'action :

```sql
SELECT *
FROM films
WHERE annee > 2014
   OR genre = 'action';
```

- annee > 2014 est la 1ère condition.

- genre = 'action' est la 2ème condition.

`OR` combine les deux conditions.

![OR](./ressources/OR.svg)


Avec OR, si l'une des conditions est vraie, alors la ligne est ajoutée au résultat.


### A vous de jouer ! 🤠

1. Testons cela :

```sql
SELECT *
FROM films
WHERE annee > 2014
   OR genre = 'action';
```

2. Supposons que nous ayons envie de rire ou de pleurer un bon coup.

En utilisant OR, écrivez une requête qui renvoie tous les films qui sont soit une romance, soit une comédie.


## Order By

C'est tout pour `WHERE` et ses opérateurs. Continuons !

Il est souvent utile de lister les données de notre ensemble de résultats dans un ordre particulier.

Nous pouvons trier les résultats à l'aide de ORDER BY, soit par ordre alphabétique, soit par ordre numérique. Le tri des résultats rend souvent les données plus utiles et plus faciles à analyser.

Par exemple, si nous voulons tout trier par le titre du film de A à Z :

```sql
SELECT *
FROM films
ORDER BY nom;
```
- `ORDER BY` est une clause qui indique que vous voulez trier le jeu de résultats par une colonne particulière.

- `nom` est la colonne spécifiée.

Parfois, nous voulons trier les choses dans un ordre décroissant. Par exemple, si nous voulons sélectionner tous les films bien accueillis, triés de la plus haute à la plus basse selon leur année :

```sql
SELECT *
FROM films
WHERE note_imdb > 8
ORDER BY annee DESC;
```

- `DESC` est un mot-clé utilisé dans ORDER BY pour trier les résultats par ordre décroissant (de haut en bas ou de Z-A).

- `ASC` est un mot-clé utilisé dans ORDER BY pour trier les résultats dans l'ordre croissant (de bas en haut ou de A à Z).

La colonne que nous trions par ORDER BY ne doit même pas être l'une des colonnes que nous affichons.

Remarque : `ORDER BY` passe toujours après `WHERE` (si WHERE est présent).

### A vous de jouer !  🤠

1. Supposons que nous voulions récupérer les colonnes nom et année de tous les films, classés par ordre alphabétique de leur nom.

Tapez le code suivant :

```sql
SELECT nom, annee
FROM films
ORDER BY nom;
```

2. Votre tour ! Supprimez la requête précédente.

Ecrivez une nouvelle requête qui récupère le nom, l'année, et les colonnes note_imdb de tous les films, classés du plus haut au plus bas par leurs évaluations.


## Limit

Nous avons travaillé avec une table relativement petite (moins de 250 lignes), mais la plupart des tables SQL contiennent des centaines de milliers d'enregistrements. Dans ces situations, il devient important de limiter le nombre de lignes dans le résultat.

Par exemple, imaginons que nous ne voulons voir que quelques exemples d'enregistrements.

```sql
SELECT *
FROM films
LIMIT 10;
```

`LIMIT` est une clause qui vous permet de spécifier le nombre maximum de lignes que le jeu de résultats aura. Cela permet d'économiser de l'espace sur notre écran et d'exécuter nos requêtes plus rapidement.

Ici, nous spécifions que le jeu de résultats ne peut pas contenir plus de 10 lignes.

`LIMIT` se place toujours à la toute fin de la requête. En outre, elle n'est pas prise en charge par toutes les bases de données SQL.

### A vous de jouer ! 🤠

1. En combinant vos connaissances de `LIMIT` et `ORDER BY`, écrivez une requête qui renvoie les 3 films les mieux notés.

Sélectionnez toutes les colonnes.

## Case

Une instruction `CASE` nous permet de créer différentes sorties (généralement dans l'instruction SELECT). C'est la façon dont SQL gère la logique si alors.

Supposons que nous voulions condenser les notes des films en trois niveaux :

  - Si la note est supérieure à 8, le film est fantastique.
  - Si la note est supérieure à 6, le film est mal reçu.
  - Sinon, à éviter à tout prix.

```sql
SELECT nom,
 CASE
  WHEN note_imdb > 8 THEN 'Fantastique'
  WHEN note_imdb > 6 THEN 'mal reçu'
  ELSE 'A éviter'
 END
FROM films;
```

- Chaque WHEN teste une condition et le THEN suivant nous donne la chaîne si la condition est vraie.
- Le ELSE nous donne la chaîne de caractères si toutes les conditions ci-dessus sont fausses.
- L'instruction CASE doit se terminer par END.


### A vous de jouer ! 🤠

1. Essayons d'en faire une par vous-même.

Sélectionnez la colonne nom et utilisez une instruction CASE pour créer la deuxième colonne qui est :

- 'Chill' si genre = 'romance'.
- Frisson si le genre = comédie
- 'Intense' dans tous les autres cas

Facultatif : Renommez l'ensemble de l'instruction CASE en "ambiance" en utilisant AS.
