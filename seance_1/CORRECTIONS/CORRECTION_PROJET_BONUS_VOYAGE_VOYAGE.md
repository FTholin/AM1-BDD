-- 1. Créer la table voyages
CREATE TABLE voyages (
    id INTEGER PRIMARY KEY,
    destination TEXT,
    date_depart DATE,
    date_retour DATE
);

-- 2. Insérer des données pour votre dernier voyage
INSERT INTO voyages (id, destination, date_depart, date_retour)
VALUES (1, 'Paris', '2023-01-01', '2023-01-14');

-- 3. Vérifier les entrées dans la table
SELECT * FROM voyages;

-- 4. Ajouter des informations sur deux autres voyages
INSERT INTO voyages (id, destination, date_depart, date_retour)
VALUES (2, 'Tokyo', '2023-03-05', '2023-03-20'),
       (3, 'New York', '2023-04-15', '2023-04-30');

-- 5. Prolonger un voyage (Exemple pour le voyage à Tokyo)
UPDATE voyages
SET date_retour = '2023-03-25'
WHERE id = 2;

-- 6. Ajouter une colonne commentaires
ALTER TABLE voyages
ADD COLUMN commentaires TEXT;

-- 7. Ajouter des commentaires pour chaque voyage
UPDATE voyages
SET commentaires = 'Incroyable !'
WHERE id = 1;

UPDATE voyages
SET commentaires = 'Aventure culinaire fantastique'
WHERE id = 2;

UPDATE voyages
SET commentaires = 'Ville qui ne dort jamais'
WHERE id = 3;

-- 8. Supprimer un voyage (Exemple pour le voyage à New York)
DELETE FROM voyages
WHERE id = 3;

-- 9. Afficher la table mise à jour
SELECT * FROM voyages;
