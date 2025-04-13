
/*
1. Commencez par vous familiariser avec la table met
*/
SELECT *
FROM met
LIMIT 10;

/*
2. Combien de pièces y a-t-il dans la collection d'art  ?
*/
SELECT COUNT(*)
FROM met;


/*
3. Comptez le nombre de pièces dont la catégorie comprend le mot "Celery".
*/
SELECT COUNT(*)
FROM met
WHERE categorie LIKE '%Celery%';

/*
4. Trouvez le titre et le support de la ou des pièces les plus anciennes de la collection.
*/


SELECT titre, support, MIN(annee_creation) as Min
FROM met
GROUP BY titre, support
ORDER BY 3 ASC;


/*

*/

SELECT category, COUNT(*)
FROM met
GROUP BY 1
HAVING COUNT(*) > 100;



SELECT medium, COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
   OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;