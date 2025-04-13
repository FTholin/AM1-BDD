-- 2
SELECT * 
FROM utilisateurs
LIMIT 10;
 
SELECT * 
FROM posts
LIMIT 10;
 
SELECT * 
FROM groupes
LIMIT 10;


-- 3
/*

La clé primaire de la table des utilisateurs est id.

La clé primaire de la table posts est id.

La clé primaire de la table groupes est id.

La table posts possède des clés étrangères id_utilisateur et id_groupes.

*/

-- 4

SELECT COUNT(*) AS 'nombre_groupes'
FROM groupes;


-- 5

SELECT nom_utilisateur, MAX(___) AS 'highest_score'
FROM utilisateurs;
 
SELECT titre, MAX(___) AS 'highest_score'
FROM posts;
 
SELECT nom
FROM ___
ORDER BY subscriber_count DESC
LIMIT 5;


-- 6

SELECT utilisateurs.nom_utilisateur, COUNT(___) AS 'nb_posts'
FROM utilisateurs
LEFT JOIN ___
  ON utilisateurs.___ = posts.___
GROUP BY utilisateurs.id
ORDER BY 2 DESC;


-- 7
SELECT *
FROM ___
INNER JOIN utilisateurs
  ON posts.___ = utilisateurs.___;

-- 8
-- Vous pouvez superposer un ensemble de données à un autre ensemble de données à l'aide de la clause UNION.

SELECT * FROM ___
UNION
SELECT * FROM ___ ;


-- 9

WITH posts_populaires AS (
  SELECT *
  FROM ___
  WHERE score >= ___
)
SELECT groupes.___, posts_populaires.___, posts_populaires.___
FROM ___
INNER JOIN posts_populaires
  ON groupes.___ = posts_populaires.___
ORDER BY posts_populaires.___ DESC;

-- 10

SELECT 
  posts.titre, 
  groupes.___ AS 'nom_groupe', 
  MAX(___) AS 'highest_score'
FROM posts
INNER JOIN ___
  ON posts.___ = groupes.___
GROUP BY groupes.id;


-- 11

SELECT 
  groupes.___, 
  AVG(posts.___) AS 'score_moyen'
FROM ___
INNER JOIN posts
ON groupes.id = posts.id_groupes
GROUP BY groupes.nom
ORDER BY 2 DESC;
