

## 1. Conception du Schéma de Base de Données

Avant de commencer à créer physiquement la base de données, il est crucial de **concevoir le schéma** : c’est-à-dire l’ensemble des tables, leurs colonnes, et les relations entre elles.

### Exemple de schéma

Pour ce tutoriel, imaginons que nous voulons gérer une base de données pour une **librairie**. Nous allons créer 4 tables :  
1. `Auteur` (Informations sur les auteurs)  
2. `Livre` (Informations sur les livres)  
3. `Client` (Informations sur les clients de la librairie)  
4. `Commande` (Registre des commandes passées par les clients, reliant clients et livres)

**Relations :**  
- Un auteur peut avoir écrit plusieurs livres, et un livre est écrit par un seul auteur (relation 1-N entre Auteur et Livre).  
- Un client peut passer plusieurs commandes, et une commande peut contenir plusieurs livres.  
- Pour simplifier, nous allons supposer qu’une commande porte sur un seul livre à la fois (1-N entre Livre et Commande, et 1-N entre Client et Commande).  

*(Dans un cas réel, on gérerait souvent une table « LigneDeCommande » pour des commandes de plusieurs livres, mais nous restons sur un exemple simple.)*

---

## 2. Création de la Base de Données et des Tables


### 2.1 Création des Tables

Dans la console SQLite (ou dans un script), exécutez les commandes suivantes :

#### Table `Auteur`
```sql
CREATE TABLE IF NOT EXISTS Auteur (
    auteur_id INTEGER PRIMARY KEY AUTOINCREMENT, 
    nom TEXT NOT NULL, 
    prenom TEXT NOT NULL,
    nationalite TEXT,
    date_naissance DATE
);
```
**Explications et indications supplémentaires :**  
- `IF NOT EXISTS` évite une erreur si la table existe déjà.  
- `auteur_id` est la clé primaire (auto-incrémentée).  
- `nom` et `prenom` sont obligatoires (`NOT NULL`).  
- `nationalite` et `date_naissance` sont optionnels.

#### Table `Livre`
```sql
CREATE TABLE IF NOT EXISTS Livre (
    livre_id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    genre TEXT,
    prix REAL DEFAULT 0.0,
    auteur_id INTEGER NOT NULL,
    FOREIGN KEY(auteur_id) REFERENCES Auteur(auteur_id)
);
```
**Explications et indications supplémentaires :**  
- `livre_id` est la clé primaire (auto-incrémentée).  
- `titre` est obligatoire, `genre` est facultatif.  
- `prix` est un `REAL` pour stocker des valeurs décimales et utilise `0.0` par défaut.  
- `auteur_id` fait référence à l’ID de l’auteur (clé étrangère).

#### Table `Client`
```sql
CREATE TABLE IF NOT EXISTS Client (
    client_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE,
    telephone TEXT
);
```
**Explications et indications supplémentaires :**  
- `client_id` est la clé primaire.  
- `nom` et `prenom` sont obligatoires.  
- `email` est défini comme `UNIQUE`, empêchant les doublons d’adresses.

#### Table `Commande`
```sql
CREATE TABLE IF NOT EXISTS Commande (
    commande_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_commande DATE NOT NULL,
    client_id INTEGER NOT NULL,
    livre_id INTEGER NOT NULL,
    quantite INTEGER DEFAULT 1,
    FOREIGN KEY(client_id) REFERENCES Client(client_id),
    FOREIGN KEY(livre_id) REFERENCES Livre(livre_id)
);
```
**Explications et indications supplémentaires :**  
- `commande_id` est la clé primaire.  
- `date_commande` est obligatoire.  
- `client_id` et `livre_id` sont des clés étrangères (vers `Client` et `Livre`).  
- `quantite` a une valeur par défaut de 1.

---

## 3. Insertion des Données

### 3.1 Insérer des données dans `Auteur`

```sql
INSERT INTO Auteur (nom, prenom, nationalite, date_naissance)
VALUES 
    ('Hugo', 'Victor', 'Française', '1802-02-26'),
    ('Camus', 'Albert', 'Française', '1913-11-07'),
    ('Orwell', 'George', 'Anglaise', '1903-06-25');
```
**Indications supplémentaires :**  
- `auteur_id` s’incrémente automatiquement.  
- Les champs obligatoires sont complétés (nom, prenom).

### 3.2 Insérer des données dans `Livre`

```sql
INSERT INTO Livre (titre, genre, prix, auteur_id)
VALUES
    ('Les Misérables', 'Roman', 15.99, 1),
    ('Le Dernier Jour d\'un Condamné', 'Roman', 6.50, 1),
    ('La Peste', 'Roman', 8.90, 2),
    ('L\'Étranger', 'Roman', 7.20, 2),
    ('1984', 'Dystopie', 12.00, 3),
    ('La Ferme des animaux', 'Satire', 9.50, 3);
```
**Indications supplémentaires :**  
- Veillez à échapper les apostrophes (ex. `\'`).  
- `auteur_id` correspond aux ID de la table `Auteur` (1 = Hugo, 2 = Camus, 3 = Orwell).

### 3.3 Insérer des données dans `Client`

```sql
INSERT INTO Client (nom, prenom, email, telephone)
VALUES
    ('Martin', 'Jean', 'jean.martin@example.com', '0600000001'),
    ('Dupont', 'Marie', 'marie.dupont@example.com', '0600000002'),
    ('Durand', 'Pierre', 'pierre.durand@example.com', '0600000003');
```

### 3.4 Insérer des données dans `Commande`

```sql
INSERT INTO Commande (date_commande, client_id, livre_id, quantite)
VALUES
    ('2025-04-15', 1, 1, 1),
    ('2025-04-15', 1, 2, 2),
    ('2025-04-16', 2, 3, 1),
    ('2025-04-16', 2, 6, 1),
    ('2025-04-17', 3, 5, 1);
```
**Indications supplémentaires :**  
- Le format de date est `YYYY-MM-DD`.  
- `quantite` est ici précisé, sinon la valeur par défaut (1) s’applique.

---

## 4. Requêtes Exemplaires (15 Exemples)

1. **Sélectionner tous les auteurs**  
   ```sql
   SELECT * FROM Auteur;
   ```

2. **Lister tous les livres**  
   ```sql
   SELECT * FROM Livre;
   ```

3. **Obtenir la liste des clients (nom complet et email)**  
   ```sql
   SELECT nom || ' ' || prenom AS nom_complet, email
   FROM Client;
   ```

4. **Lister toutes les commandes avec le nom du client et le titre du livre**  
   ```sql
   SELECT 
       Commande.commande_id,
       Client.nom || ' ' || Client.prenom AS client,
       Livre.titre,
       Commande.quantite,
       Commande.date_commande
   FROM Commande
   INNER JOIN Client ON Commande.client_id = Client.client_id
   INNER JOIN Livre ON Commande.livre_id = Livre.livre_id;
   ```

5. **Lister les livres et leur prix, en affichant également le nom complet de l’auteur**  
   ```sql
   SELECT 
       Livre.titre,
       Livre.prix,
       Auteur.nom || ' ' || Auteur.prenom AS auteur
   FROM Livre
   INNER JOIN Auteur ON Livre.auteur_id = Auteur.auteur_id;
   ```

6. **Filtrer les livres dont le prix est supérieur à 10**  
   ```sql
   SELECT titre, prix
   FROM Livre
   WHERE prix > 10;
   ```

7. **Rechercher un client par email**  
   ```sql
   SELECT *
   FROM Client
   WHERE email = 'marie.dupont@example.com';
   ```

8. **Afficher le total des commandes passées par chaque client** (agrégation)  
   ```sql
   SELECT 
       Client.client_id,
       Client.nom || ' ' || Client.prenom AS client,
       SUM(Commande.quantite) AS total_livres_commandes
   FROM Commande
   JOIN Client ON Commande.client_id = Client.client_id
   GROUP BY Client.client_id;
   ```

9. **Lister les livres dans l’ordre décroissant de prix**  
   ```sql
   SELECT titre, prix
   FROM Livre
   ORDER BY prix DESC;
   ```

10. **Affichage limité à 3 clients** (pour paginer ou consulter rapidement)  
    ```sql
    SELECT *
    FROM Client
    LIMIT 3;
    ```

11. **Mettre à jour le prix d’un livre**  
    ```sql
    UPDATE Livre
    SET prix = 10.50
    WHERE livre_id = 1;
    ```

12. **Supprimer un client**  
    ```sql
    DELETE FROM Client
    WHERE client_id = 3;
    ```
    *(Assurez-vous qu’il n’a pas de commandes associées pour éviter une erreur d’intégrité référentielle.)*

13. **Compter le nombre total de livres**  
    ```sql
    SELECT COUNT(*) AS nombre_de_livres
    FROM Livre;
    ```

14. **Afficher la date de commande la plus récente**  
    ```sql
    SELECT MAX(date_commande) AS derniere_commande
    FROM Commande;
    ```

15. **Rechercher tous les livres avec ‘Roman’ dans leur genre**  
    ```sql
    SELECT titre, genre
    FROM Livre
    WHERE genre = 'Roman';
    ```
    *(Pour une recherche plus large, on pourrait utiliser `LIKE '%Roman%'`.)*

---
