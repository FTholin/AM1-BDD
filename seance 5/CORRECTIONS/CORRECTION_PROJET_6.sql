/*
1. Commencez par vous familiariser avec la table `data_transactions` :
Utiliser limit
*/
SELECT *
FROM data_transactions
LIMIT 10;


/*
2. Trouvez les noms prenoms et les emails des transactions ayant 20252 comme code postal 
*/
SELECT nom_prenom, email, code_postal
FROM data_transactions
WHERE code_postal = 20252;


/*
3. Utilisez une requête pour trouver les noms et les emails associés à ces transactions.
*/
SELECT nom_prenom, email
FROM data_transactions
WHERE nom_prenom = 'Art Vandelay'
   OR nom_prenom LIKE '% der %';
    
    
/*
4. Trouvez les adresses IP et les e-mails associés à ces transactions.
*/

SELECT adresse_ip, email
FROM data_transactions
WHERE adresse_ip LIKE '10.%';


/*
5. Trouver les emails dans data_transactions avec 'temp_email.com' comme domaine.
*/
SELECT email
FROM data_transactions
WHERE email LIKE '%temp_email.com';


/*
 6. transaction a été effectuée à partir d'une adresse IP commençant par '120' et que son nom complet commence par 'John'
*/

SELECT *
FROM data_transactions
WHERE nom_prenom LIKE 'John%'
  AND adresse_ip LIKE '120.%';