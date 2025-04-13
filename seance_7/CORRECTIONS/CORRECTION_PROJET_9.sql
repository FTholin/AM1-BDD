-- 2

Voyons ce que contiennent ces tables en exécutant les commandes suivantes :

SELECT * 
FROM lieux ;
 
SELECT * 
FROM avis ;


-- 3

SELECT * 
FROM lieux
WHERE ratio_prix_note = '$' 
  OR ratio_prix_note = '$$'

-- 4

/*

La clé étrangère ici est id_lieux dans la table avis.

N'oubliez pas qu'une clé étrangère est un identifiant unique qui correspond à un identifiant dans une table externe.

*/

-- 5

SELECT * 
FROM lieux 
INNER JOIN avis 
   ON lieux.id = avis.id_lieux;

-- 6

SELECT lieux.nom, lieux.note_moyenne, avis.nom_utilisateur, avis.note, avis.date_avis, avis.commentaire
FROM lieux 
INNER JOIN _____ 
   ON _____ = _____;

-- 7

SELECT lieux.nom, lieux.note_moyenne, avis.nom_utilisateur, avis.note, avis.date_avis, avis.commentaire
FROM lieux 
LEFT JOIN avis 
   ON lieux.id = avis.id_lieux;


-- En quoi les résultats de cette requête sont-ils différents ?

-- **LEFT JOIN vs INNER JOIN :** Un LEFT JOIN inclut tous les enregistrements de la table de gauche (`lieux` dans cet exemple) et les enregistrements correspondants de la table de droite (`avis`). Si il n'y a pas de correspondance, le résultat contiendra NULL pour les colonnes de la table de droite. En revanche, un INNER JOIN n'inclut que les enregistrements où il y a une correspondance dans les deux tables. Donc, un LEFT JOIN fournira une vue complète des lieux, avec ou sans avis, tandis qu'un INNER JOIN ne listera que les lieux qui ont reçu des avis.

-- Cette requête ou une INNER JOIN serait-elle plus utile pour un journal d'avis ?

-- Pour un journal d'avis, un LEFT JOIN serait plus utile si l'objectif est de lister tous les lieux, y compris ceux sans avis, pour peut-être encourager les critiques sur ces derniers. Cela permet de montrer aux utilisateurs tous les lieux disponibles, même ceux qui n'ont pas encore été évalués.
-- Si l'objectif est de ne présenter que des lieux ayant déjà des critiques, un INNER JOIN serait plus approprié.

-- Qu'en est-il des lieux qui n'ont pas d'avis dans notre base de données ?

-- Avec un LEFT JOIN, les lieux qui n'ont pas d'avis dans la base de données apparaîtront dans les résultats de la requête, mais les colonnes sélectionnées de la table `avis` (par exemple, `note_avis`) contiendront NULL pour ces lieux. Cela permet d'identifier quels lieux n'ont pas encore été critiqués.


-- 8

SELECT lieux.id, lieux.name
FROM lieux 
LEFT JOIN avis 
   ON lieux.id = avis.id_lieux
WHERE avis.id_lieu IS ____;


-- 9
/**
Pour commencer, voici comment vous pouvez utiliser strftime pour 
obtenir uniquement l'année à partir de la date d'examen.
**/

WITH avis_2020 AS (
SELECT id, nom_utilisateur, id_lieux, date_critique, note, commentaire
FROM avis
WHERE strftime('%Y', date_critique) = '2020'
)
SELECT lieux.nom, lieux.adresse, lieux.type, avis_2020.nom_utilisateur, avis_2020.note, avis_2020.commentaire
FROM lieux
INNER JOIN avis_2020 ON lieux.id = avis_2020.id_lieux;


-- 10
WITH LieuMoyenne AS (
  SELECT
    id AS id_lieux,
    note_moyenne
  FROM
    lieux
)
SELECT
  avis.nom_utilisateur,
  COUNT(avis.id) AS NombreAvisInfMoyenne
FROM
  avis
JOIN
  LieuMoyenne ON avis.id_lieux = LieuMoyenne.id_lieux
WHERE
  avis.note < LieuMoyenne.note_moyenne
GROUP BY
  avis.nom_utilisateur
ORDER BY
  NombreAvisInfMoyenne DESC
LIMIT 1;

