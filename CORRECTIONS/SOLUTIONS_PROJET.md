
1. **Sélectionner toutes les données de la table startups** :
   ```sql
   SELECT *
   FROM startups;
   ```

2. **Calculer la valeur totale de toutes les entreprises** :
   ```sql
   SELECT SUM(valorisation) AS valeur_totale
   FROM startups;
   ```

3. **Trouver le montant le plus élevé levé par une startup** :
   ```sql
   SELECT MAX(montant_levee_de_fond) AS montant_max
   FROM startups;
   ```

4. **Montant maximum levé pendant la phase 'Jeune Pousse'** :
   ```sql
   SELECT MAX(montant_levee_de_fond) AS montant_max_jeune_pousse
   FROM startups
   WHERE stade_entreprise = 'Jeune Pousse';
   ```

5. **Année de fondation de l'entreprise la plus ancienne** :
   ```sql
   SELECT MIN(date_creation) AS annee_plus_ancienne
   FROM startups;
   ```

6. **Valorisation moyenne entre tous les secteurs** :
   ```sql
   SELECT AVG(valorisation) AS valorisation_moyenne
   FROM startups;
   ```

7. **Valorisation moyenne dans chaque catégorie** :
   ```sql
   SELECT categorie, AVG(valorisation) AS valorisation_moyenne
   FROM startups
   GROUP BY categorie;
   ```

8. **Valorisation moyenne dans chaque catégorie, arrondie à deux décimales** :
   ```sql
   SELECT categorie, ROUND(AVG(valorisation), 2) AS valorisation_moyenne
   FROM startups
   GROUP BY categorie;
   ```

9. **Valorisation moyenne dans chaque catégorie, arrondie et triée** :
   ```sql
   SELECT categorie, ROUND(AVG(valorisation), 2) AS valorisation_moyenne
   FROM startups
   GROUP BY categorie
   ORDER BY valorisation_moyenne DESC;
   ```

10. **Nom de chaque catégorie avec le nombre total d'entreprises** :
    ```sql
    SELECT categorie, COUNT(*) AS nombre_entreprises
    FROM startups
    GROUP BY categorie;
    ```

11. **Catégories avec plus de trois entreprises** :
    ```sql
    SELECT categorie, COUNT(*) AS nombre_entreprises
    FROM startups
    GROUP BY categorie
    HAVING COUNT(*) > 3;
    ```

12. **Taille moyenne d'une startup dans chaque lieu** :
    ```sql
    SELECT localisation, AVG(nb_employes) AS taille_moyenne
    FROM startups
    GROUP BY localisation;
    ```

13. **Taille moyenne d'une startup dans chaque lieu, avec des tailles moyennes supérieures à 500** :
    ```sql
    SELECT localisation, AVG(nb_employes) AS taille_moyenne
    FROM startups
    GROUP BY localisation
    HAVING AVG(nb_employes) > 500;
    ```

### Nouvelles Requêtes Intégrées

14. **Nombre total de startups par stade d'entreprise** :
    ```sql
    SELECT stade_entreprise, COUNT(*) AS nombre_startups
    FROM startups
    GROUP BY stade_entreprise;
    ```

15. **Liste des startups fondées après une certaine année avec leur valorisation** :
    ```sql
    SELECT nom, valorisation, date_creation
    FROM startups
    WHERE date_creation > 2010
    ORDER BY date_creation;
    ```

16. **Moyenne du montant levé par secteur** :
    ```sql
    SELECT categorie, ROUND(AVG(montant_levee_de_fond), 2) AS montant_moyen_levé
    FROM startups
    GROUP BY categorie
    ORDER BY montant_moyen_levé DESC;
    ```

17. **Startups avec plus de X employés et leur montant levé** :
    ```sql
    SELECT nom, nb_employes, montant_levee_de_fond
    FROM startups
    WHERE nb_employes > 100
    ORDER BY nb_employes DESC;
    ```

18. **Répartition des startups par localisation et stade d'entreprise** :
    ```sql
    SELECT localisation, stade_entreprise, COUNT(*) AS nombre
    FROM startups
    GROUP BY localisation, stade_entreprise
    ORDER BY nombre DESC;
    ```
