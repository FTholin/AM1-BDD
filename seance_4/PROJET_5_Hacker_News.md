# Tendances Web

Hacker News est un site Web populaire géré par Y Combinator. Il est largement connu par les personnes de l'industrie technologique comme un site communautaire pour partager des nouvelles, montrer des projets, poser des questions, entre autres choses.

Dans ce projet, vous travaillerez avec une table nommée hacker_news qui contient les histoires de Hacker News depuis son lancement en 2007. Elle comporte les colonnes suivantes :


- id identifiant unique article
- titre titre de l'article
- url  lien url de l'article
- score score de l'article
- nb_commentaire nombre de commentaires
- auteur le créateur de l'article
- date_creation la date de création de l'article


C'est parti !


## Comprendre l'ensemble des données

Commencez par vous familiariser avec la table `hacker_news` !

Trouvons les articles les plus populaires de Hacker News :

1. Quelles sont les cinq histoires ayant obtenu les meilleurs scores ?


## Modération de Hacker News

Des études récentes ont montré que les forums en ligne ont tendance à être dominés par un petit pourcentage de leurs utilisateurs (règle du [1-9-90](https://fr.wikipedia.org/wiki/R%C3%A8gle_du_1_%25)).

- Est-ce le cas de Hacker News ?

- Est-ce qu'un petit pourcentage de soumissionnaires de Hacker News prend la majorité des points ?

2. Tout d'abord, trouvez le nombre total d'articles.


3. Ensuite, trouvez les 4 auteurs qui ont le plus publié.

    - `GROUP BY`  est nécessaire !


4. Additionner le nombre d'articles de ces auteurs et les diviser par le total pour obtenir le pourcentage

    Comme ceci :

    ```sql
    SELECT (nb_article_auteur1 + nb_article_auteur2 + nb_article_auteur3 + nb_article_auteur4 + nb_article_auteur5) / TOTAL ;
    ```

    - Alors, Hacker News est-il dominé par ces utilisateurs ?


5. Oh non ! Pendant que nous nous intéressons aux utilisateurs les plus influents, certains utilisateurs font du [rickrolling](https://knowyourmeme.com/memes/rickroll), c'est-à-dire qu'ils incitent les lecteurs à cliquer sur un lien vers une vidéo amusante en prétendant qu'elle mène à des informations sur le codage.

    - L'url de la vidéo est https://www.youtube.com/watch?v=dQw4w9WgXcQ

    - Combien de fois chaque utilisateur fautif a-t-il posté ce lien ?

    - Vous pouvez utiliser `GROUP BY` par `auteur` et utiliser `WHERE` pour restreindre l'url 


## Quels sont les sites qui alimentent Hacker News ?

6. Les articles de Hacker News sont essentiellement des liens qui conduisent les utilisateurs vers d'autres sites Web.

    Lequel de ces sites alimente le plus Hacker News ?

    GitHub, Medium, ou le New York Times ?

    Tout d'abord, nous voulons classer chaque article en fonction de sa source.

    Nous pouvons le faire en utilisant une instruction `CASE` :

    ```sql
    SELECT CASE
       WHEN url LIKE '%github.com%' THEN 'GitHub' -- WHEN déclaration ici.
       -- WHEN déclaration ici
       -- WHEN déclaration ici
       -- Instruction ELSE ici
      END 
    FROM hacker_news ;
    ```

    Remplissez les autres instructions `WHEN` et l'instruction `ELSE`.


7. Ensuite, développez la requête précédente :

    - Ajoutez une colonne pour le nombre d'articles de chaque URL en utilisant `COUNT()`.

    - Regroupez également les données par l'instruction `CASE`.

N'oubliez pas que vous pouvez faire référence à une colonne dans `GROUP BY` en utilisant un nombre.
