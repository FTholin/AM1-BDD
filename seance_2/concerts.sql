CREATE TABLE concerts (
    id_concert SERIAL PRIMARY KEY,
    nom_artiste VARCHAR(255),
    genre_musical VARCHAR(50),
    date_concert DATE,
    heure_concert TIME,
    scene VARCHAR(50),
    duree INTEGER,
    prix_billet NUMERIC(10, 2)
);


INSERT INTO concerts (id_concert, nom_artiste, genre_musical, date_concert, heure_concert, scene, duree, prix_billet) VALUES
(1, 'The Cosmic Keys', 'Rock', '2024-06-20', '21:00', 'Grande Scène', 120, 50.00),
(2, 'ElectroLune', 'Électronique', '2024-06-20', '22:00', 'Scène Club', 90, 35.00),
(3, 'The Silent Poets', 'Jazz', '2024-06-21', NULL, 'Scène Acoustique', 60, 25.00),
(4, 'Folklore Tales', 'Folk', '2024-06-21', '18:00', 'Scène Acoustique', 75, 20.00),
(5, 'Reggae Revival', 'Reggae', '2024-06-22', '19:00', 'Grande Scène', 90, 30.00),
(6, 'Classic Harmony', 'Classique', '2024-06-22', '20:00', 'Scène Club', 60, 40.00),
(7, 'The Groove Masters', 'Funk', '2024-06-23', '21:00', 'Grande Scène', 120, 55.00),
(8, 'The Choral Beats', 'Chorale', '2024-06-23', '17:00', 'Scène Club', 90, 0.00),
(9, 'Lunar Soundscapes', 'Électronique', '2024-06-24', '22:00', 'Scène Club', 90, 45.00),
(10, 'Acoustic Waves', 'Acoustique', '2024-06-24', '16:00', 'Scène Acoustique', 60, 15.00),
(11, 'The Vintage Vibes', 'Rock', '2024-06-25', '21:00', 'Grande Scène', 120, 60.00),
(12, 'Melodic Sun', 'Pop', '2024-06-25', '20:00', 'Scène Acoustique', 80, 25.00),
(13, 'Urban Echoes', 'Hip-Hop', '2024-06-26', '18:00', 'Scène Club', 90, 35.00),
(14, 'The String Quartet', 'Classique', '2024-06-26', '19:00', 'Scène Acoustique', 70, 0.00),
(15, 'Night Beats', 'Électronique', '2024-06-27', '23:00', 'Scène Club', 120, 50.00);