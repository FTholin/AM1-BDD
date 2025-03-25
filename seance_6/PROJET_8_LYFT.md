# Voyager avec  Lyft

Mettons en pratique ce que nous avons appris sur les jointures en combinant des lignes provenant de différentes tables.

Supposons que vous soyez un analyste de données chez Lyft, une plateforme de service de voitures de transport avec chauffeur (VTC). Pour un projet, on vous a confié trois tables :

- `trajets` : informations sur les trajets
- `chauffeurs` : données sur les utilisateurs
- `voitures` : voitures 


## À vous de jouer ! 🤠

### Quelques jointures

1. Charger le contenu du fichier `DATABASE_PROJET_LYFT`.


2. Examinez les trois tables et essayez d'en comprendre la structure.


3. Quelques clés primaires
	- Quelle est la clé primaire de la table trajets ?
	- Quelle est la clé primaire de la table chauffeurs ?
	- Quelle est la clé primaire de la table voitures ?



4. Essayez une  jointure entre les chauffeurs et les voitures.

	Le résultat est-il utile ?



5. Supposons que nous voulions créer un Journal des trajets avec les trajets et leurs chauffeurs respectifs.

   - Trouvez les colonnes à jointer entre les courses et les utilisateurs et combinez les deux tables en utilisant une `LEFT JOIN`.

   - Prendre `courses` comme table de gauche.


6. Supposons que nous voulions créer un lien entre les courses et les voitures utilisées pendant ces courses.

	- Trouvez les colonnes à jointer et combinez les tableaux des courses et des voitures à l'aide d'une `INNER JOIN`.

7. Les données des nouveaux chauffeurs sont arrivées !

	- Il y a trois nouveaux utilisateurs ce mois-ci.

	- Empilez la table chauffeurs sur la nouvelle table chauffeurs2.


###  Requêtes et agrégats


9. Quel est le coût moyen d'un voyage ?


10. Lyft cherche à faire une campagne d'emailing pour tous les chauffeurs irréguliers.

	- Trouvez tous les chauffeurs qui ont utilisé Lyft moins de 500 fois !

11. Calculez le nombre de voitures qui sont actives.



12. C'est l'heure du rappel de sécurité pour les voitures qui sont sur la route depuis un certain temps.

	- Rédigez une requête qui trouve les deux voitures qui ont le plus grand nombre de voyages avec `total_trajets_complets`.


13. Quels sont les détails de toutes les courses effectuées le 5 décembre 2017 ?


14. Quel est le nombre total de trajets complets effectués par toutes les voitures ?


15. Quel est le total des prix de toutes les courses effectuées par Laura Breiman ?


16. Quel est le pseudo et la note du chauffeur ayant effectué la course ayant le plus grand prix ?


17. Quel est le nombre total de trajets effectués par les chauffeurs ayant une note supérieure à 4.5 ?


18. Quel est le nombre total de trajets effectués par les chauffeurs ayant été référencés ?


19. Quel est le nombre total de trajets effectués par les chauffeurs ayant une note supérieure à 4.5 et ayant effectué plus de 500 trajets ?


20. Quel est le prix moyen de toutes les courses effectuées le 5 décembre 2017 ?


21. Quel est le modèle de voiture ayant effectué le plus grand nombre de trajets complets ?


22. Quel est le total des prix de toutes les courses effectuées en utilisant la voiture ayant effectué le plus grand nombre de trajets complets ?
