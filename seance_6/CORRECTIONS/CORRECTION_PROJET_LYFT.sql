--- 1.

SELECT * FROM courses;
 
SELECT * FROM chauffeurs;
 
SELECT * FROM voitures;

-- 5. Si on fait un LEFT JOIN sur courses.id_chauffeur et chauffeurs.id:

```sql
SELECT *
FROM courses
LEFT JOIN chauffeurs 
  ON courses.id_chauffeur = chauffeurs.id;
```

-- Le résultat comporte beaucoup de colonnes vous pouvez également spécifier les colonnes que vous désirez.


-- 6.  Pour une INNER JOIN:


SELECT *
FROM courses
JOIN voitures
  ON courses.id_voiture = voitures.id;

-- Le mot-clé JOIN peut également être INNER JOIN.

-- 7. Pour empiler un ensemble de données sur un autre, nous utilisons UNION :
    
```sql
SELECT *
FROM chauffeurs
UNION
SELECT *
FROM chauffeurs2;
```


-- 8. 

SELECT AVG(prix_course)
FROM courses;

--Le résultat est 31.915

-- Si nous utilisons la fonction ROUND() pour arrondir le résultat à 2 décimales :

SELECT ROUND(AVG(prix_course), 2)
FROM courses;

-- Le coût moyen est de 31,92 dollars !

-- 10. Si nous ne cherchons que dans le tableau des chauffeurs :

```sql
SELECT *
FROM chauffeurs
WHERE total_trajets < 500;
```

-- Si nous voulons rechercher à la fois dans `chauffeurs` et `chauffeurs2`, alors nous devrons faire quelque chose comme ceci :

```sql
SELECT *
FROM chauffeurs
WHERE total_trajets < 500
UNION
SELECT *
FROM chauffeurs2
WHERE total_trajets < 500;
```

-- 11. 

SELECT COUNT(*)
FROM voitures
WHERE status = 'active';


-- 12.

SELECT *
FROM voitures
ORDER BY total_trajets_complets DESC
LIMIT 2;


-- 13.
SELECT * FROM courses WHERE date = '2017-12-05';

-- 14. 
SELECT SUM(total_trajets_complets) AS nombre_total_trajets FROM voitures;

-- 15. 
SELECT SUM(prix_course) AS total_prix_courses FROM courses 
JOIN chauffeurs ON courses.id_chauffeur = chauffeurs.id 
WHERE chauffeurs.nom = 'Breiman' AND chauffeurs.prenom = 'Laura';

-- 16. 
SELECT chauffeurs.pseudo, chauffeurs.note FROM courses 
JOIN chauffeurs ON courses.id_chauffeur = chauffeurs.id 
WHERE courses.prix_course = (SELECT MAX(prix_course) FROM courses);

-- 17.
SELECT SUM(total_trajets) AS nombre_total_trajets FROM chauffeurs WHERE note > 4.5;

-- 18. 
SELECT SUM(total_trajets) AS nombre_total_trajets FROM chauffeurs WHERE reference IS NOT NULL;

-- 19. 
SELECT SUM(total_trajets) AS nombre_total_trajets FROM chauffeurs WHERE note > 4.5 AND total_trajets > 500;

-- 20.
SELECT AVG(prix_course) AS prix_moyen_courses FROM courses WHERE date = '2017-12-05';


-- 21.
SELECT modele FROM voitures 
WHERE total_trajets_complets = (SELECT MAX(total_trajets_complets) FROM voitures);


-- 22.
SELECT SUM(prix_course) AS total_prix_courses FROM courses 
WHERE id_voiture = (SELECT id FROM voitures WHERE total_trajets_complets = (SELECT MAX(total_trajets_complets) FROM voitures));


