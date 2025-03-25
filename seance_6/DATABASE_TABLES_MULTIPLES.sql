-- Création de la table "commandes"
CREATE TABLE commandes (
    id_commande INT PRIMARY KEY,
    id_client INT,
    id_abonnement INT,
    date_souscription DATE
);

-- Création de la table "abonnements"
CREATE TABLE abonnements (
    id_abonnement INT PRIMARY KEY,
    description VARCHAR(256),
    prix_mensuel INT,
    duree_abonnement TEXT
);

-- Création de la table "clients"
CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(256),
    adresse VARCHAR(256)
);



-- Ajout des données à la table "commandes"
INSERT INTO commandes (id_commande, id_client, id_abonnement, date_souscription)
VALUES 
    (1, 3, 2, '2017-10-01'),
    (2, 2, 4, '2017-09-01'),
    (3, 3, 4, '2017-01-26'),
    (4, 9, 9, '2017-01-04'),
    (5, 7, 5, '2017-01-25');

-- Ajout des données à la table "abonnements"
INSERT INTO abonnements (id_abonnement, description, prix_mensuel, duree_abonnement)
VALUES
    (1, 'Le Monde du Pouvoir', 10, '12 mois'),
    (2, 'Le Monde du Pouvoir', 11, '6 mois'),
    (3, 'Le Monde du Pouvoir', 12, '3 mois'),
    (4, 'Art de la Mode', 15, '12 mois'),
    (5, 'Art de la Mode', 17, '6 mois');

-- Ajout des données à la table "clients"
INSERT INTO clients (id_client, nom_client, adresse)
VALUES
    (1, 'Allie Rahaim', '34 Rue de la Liberté, 75002 Paris'),
    (2, 'Jacqueline Derna', '12 Rue du Vieux Port, 13002 Marseille'),
    (3, 'ELizabeth Letsche', '7 Place de la République, 69001 Lyon'),
    (4, 'Jessica Butman', '25 Rue Saint-Jacques, 44000 Nantes'),
    (5, 'Inocencia Goyco', '18 Rue des Fleurs, 67000 Strasbourg');



-- Création de la table "abonnés_journal_papier"

CREATE TABLE abonnés_journal_papier (
    id INT PRIMARY KEY,
    prenom VARCHAR(256),
    nom VARCHAR(256),
    email VARCHAR(256),
    debut_mois INT,
    fin_mois INT
);

-- Ajout des données à la table "abonnés_journal_papier"

INSERT INTO abonnés_journal_papier (id, prenom, nom, email, debut_mois, fin_mois) VALUES
(21253, 'Vinnie', 'Sagaser', 'Vinnie.Sagaser@yoohoo.com', 1, 5),
(39075, 'Francesco', 'Maddron', 'FrancescoMaddron81@gsnail.com', 1, 5),
(30648, 'Hellen', 'Broadwater', 'HBroadwater1992@gsnail.com', 2, 3),
(71778, 'Ouida', 'Pardini', 'Ouida.Pardini@gsnail.com', 2, 6),
(32436, 'Wenona', 'Tankson', 'WTankson1989@gsnail.com', 2, 6),
(55580, 'Clora', 'Werking', 'CWerking1996@gsnail.com', 2, 5),
(79652, 'Esteban', 'Pitner', 'Esteban.Pitner@gsnail.com', 2, 4),
(11322, 'Carmel', 'Deasis', 'CD3012@gsnail.com', 2, 6),
(73893, 'Jessi', 'Vinson', 'JessiVinson65@gsnail.com', 2, 6),
(84750, 'Ayana', 'Hodapp', 'AHodapp1976@coldmail.com', 3, 6),
(34187, 'Francoise', 'Feliberty', 'FFeliberty1984@inlook.com', 3, 7),
(82566, 'Dusty', 'Morrical', 'DMorrical1977@gsnail.com', 3, 7),
(31446, 'Collin', 'Dobos', 'CollinDobos57@coldmail.com', 3, 5),
(23496, 'Fredia', 'Bi', 'Fredia.Bi@gsnail.com', 4, 8),
(34664, 'Troy', 'Underwood', 'Troy.Underwood@gsnail.com', 4, 6),
(58869, 'Cordia', 'Schingeck', 'CordiaSchingeck82@gsnail.com', 4, 6),
(96977, 'Peter', 'Haddaway', 'Peter.Haddaway@gsnail.com', 4, 8),
(17873, 'Vilma', 'Colaizzi', 'VColaizzi1973@gsnail.com', 4, 5),
(49633, 'Lane', 'Dittman', 'LaneDittman80@gsnail.com', 5, 9),
(37471, 'Sharice', 'Mcmindes', 'SM2234@gsnail.com', 5, 6),
(14227, 'Grady', 'Antinore', 'Grady.Antinore@gsnail.com', 5, 7);


-- Création de la table "abonnés_journal_web"

CREATE TABLE abonnés_journal_web (
id INT PRIMARY KEY,
prenom VARCHAR(256),
nom VARCHAR(256),
email VARCHAR(256),
debut_mois INT,
fin_mois INT
);

-- Ajout des données à la table "abonnés_journal_web"

INSERT INTO abonnés_journal_web (id, prenom, nom, email, debut_mois, fin_mois) VALUES
(39075, 'Francesco', 'Maddron', 'FrancescoMaddron81@gsnail.com', 1, 5),
(12770, 'Yer', 'Carpio', 'YerCarpio49@coldmail.com', 1, 4),
(21253, 'Vinnie', 'Sagaser', 'Vinnie.Sagaser@yoohoo.com', 1, 5),
(73893, 'Jessi', 'Vinson', 'JessiVinson65@gsnail.com', 2, 6),
(11322, 'Carmel', 'Deasis', 'CD3012@gsnail.com', 2, 6),
(55580, 'Clora', 'Werking', 'CWerking1996@gsnail.com', 2, 5),
(32436, 'Wenona', 'Tankson', 'WTankson1989@gsnail.com', 2, 6),
(30648, 'Hellen', 'Broadwater', 'HBroadwater1992@gsnail.com', 2, 3),
(31446, 'Collin', 'Dobos', 'CollinDobos57@coldmail.com', 3, 5),
(47660, 'Stephnie', 'Alsberry', 'StephnieAlsberry43@coldmail.com', 3, 5),
(84750, 'Ayana', 'Hodapp', 'AHodapp1976@coldmail.com', 3, 6),
(34187, 'Francoise', 'Feliberty', 'FFeliberty1984@inlook.com', 3, 7),
(82566, 'Dusty', 'Morrical', 'DMorrical1977@gsnail.com', 3, 7),
(34664, 'Troy', 'Underwood', 'Troy.Underwood@gsnail.com', 4, 6),
(17873, 'Vilma', 'Colaizzi', 'VColaizzi1973@gsnail.com', 4, 5),
(96977, 'Peter', 'Haddaway', 'Peter.Haddaway@gsnail.com', 4, 8),
(23496, 'Fredia', 'Bi', 'Fredia.Bi@gsnail.com', 4, 8),
(81936, 'Xavier', 'Roelfs', 'XR3616@gsnail.com', 4, 5),
(72101, 'Brittny', 'Donato', 'Brittny.Donato@gsnail.com', 4, 8),
(71246, 'Betty', 'Peth', 'BPeth1985@gsnail.com', 4, 5),
(58255, 'Lala', 'Rauzman', 'LRauzman1980@gsnail.com', 4, 8),
(58869, 'Cordia', 'Schingeck', 'CordiaSchingeck82@gsnail.com', 4, 6);


-- Table etudiants
CREATE TABLE etudiants (
  id INT PRIMARY KEY,
  prenom VARCHAR(256),
  nom VARCHAR(256),
  email VARCHAR(256),
  id_cours INT
);

-- Insertion de données dans la table etudiants

INSERT INTO etudiants (id, prenom, nom, email, id_cours)
VALUES
(74262, 'Berry', 'Bartelson', 'Berry.Bartelson@gsnail.com', 3),
(67047, 'Pearlie', 'Palomar', 'PP7361@gsnail.com', 4),
(42490, 'Tillie', 'Brinlee', 'TillieBrinlee10@gsnail.com', 4),
(33442, 'Malika', 'Giannetti', 'Malika.Giannetti@gsnail.com', 2),
(82591, 'Collen', 'Margis', 'CMargis1980@gsnail.com', 2),
(61559, 'Leigha', 'Mani', 'LM1846@gsnail.com', 4),
(19006, 'Cristi', 'Funderburk', 'CFunderburk1988@coldmail.com', 4),
(52156, 'Arcelia', 'Rendler', 'ArceliaRendler75@gsnail.com', 2),
(51370, 'Penelope', 'Skemp', 'Penelope.Skemp@gsnail.com', 3),
(53818, 'Breana', 'Pree', 'Breana.Pree@coldmail.com', 3),
(45985, 'Emelia', 'Shum', 'EShum1988@gsnail.com', 1),
(92215, 'Aurora', 'Flavors', 'AuroraFlavors39@gsnail.com', 2),
(91494, 'Ali', 'Roskop', 'AR5364@gsnail.com', 4),
(53042, 'Lidia', 'Ashfield', 'LidiaAshfield31@gsnail.com', 1),
(48447, 'Edwin', 'Voigtlander', 'EdwinVoigtlander24@gsnail.com', 1),
(88153, 'Cleo', 'Delaurie', 'CD5205@gsnail.com', 4),
(25862, 'Larita', 'Wadden', 'LW6686@gsnail.com', 4),
(54061, 'Eric', 'Ximenez', 'EXimenez1990@inlook.com', 1),
(48361, 'Maricela', 'Haith', 'MHaith1990@gsnail.com', 3),
(52074, 'Lanny', 'Doop', 'Lanny.Doop@gsnail.com', 4),
(70627, 'Jack', 'Haney', 'Jack.Haney@coldmail.com', 1),
(76849, 'Faustina', 'Marchello', 'FM9997@gsnail.com', 3),
(96009, 'Kirstin', 'Kahre', 'KKahre1981@gsnail.com', 4),
(38832, 'Minda', 'Oberlander', 'MindaOberlander44@inlook.com', 1);


-- Table cours
CREATE TABLE cours (
id INT PRIMARY KEY,
description VARCHAR(256),
weeks INT,
effectif_max INT
);

-- Insertion de données dans la table cours
INSERT INTO cours (id, description, weeks, effectif_max)
VALUES
(1, 'Introduction à Javascript', 10, 30),
(2, 'Introduction à Python', 12, 35),
(3, 'SQL Avancé', 8, 32),
(4, 'Mathématiques avancés', 6, 35),
(5, 'Probabilités et Statistiques', 10, 31);


-- Table mois
CREATE TABLE mois (
mois INT PRIMARY KEY
);

-- Insertion de données initiales
INSERT INTO mois (mois) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
