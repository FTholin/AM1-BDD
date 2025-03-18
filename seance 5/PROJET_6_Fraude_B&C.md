# Détection des fraudes chez Bross & Clackwell

Bross & Clackwell (BC) a commencé à recevoir des plaintes de la part de son Prestataire de service de paiement concernant des transactions frauduleuses. Aidez votre département financier à identifier les transactions potentiellement risquées avant qu'elles ne terminent leur traitement.

Cet ensemble de données contient une seule table, `data_transactions`.


1. Commencez par vous familiariser avec la table `data_transactions` :
    - Quels sont les noms des colonnes ?
    
    - L'utilisation de `LIMIT` limite le nombre de lignes dans le résultat.

    - C'est un moyen simple d'éviter que les requêtes ne prennent trop de temps à s'exécuter si vous avez affaire à un grand ensemble de données.
   
   
*Le département financier a noté que certaines des transactions frauduleuses ont été enregistrées comme provenant du code postal de Smokey Bear (20252) (L'ours Smokey est le symbole du service forestier des États-Unis pour la prévention des incendies de forêt.).*

Vous convenez que cela est suspect, il est peu probable que la mascotte de la prévention des incendies utilise les services de la société réputée.

2. Trouvez les noms complets et les adresses électroniques des transactions en indiquant 20252 comme code postal.
   
   
3. Le service financier a également remarqué un certain nombre de pseudonymes associés à des transactions frauduleuses.

    - Les fraudeurs ont pensé qu'il serait amusant d'utiliser "Art Vandelay" pour leur nom_prenom ou d'ajouter un "der" pour leur deuxième prénom.

    - Utilisez une requête pour trouver les noms_prenoms et les emails associés à ces transactions.
    
    - Nous pouvons ajouter un espace avant et après pour rechercher un mot individuel : % der %.

    - Si vous utilisez `%der%` à la place, vous remarquerez que la recherche renverra également des noms comme Sanders et Friederike, ce que nous ne voulons pas car nous recherchons un second prénom spécifique.

    - Rappelez-vous que OR renvoie un enregistrement si l'une des conditions est vraie 
    
    
    
4. Il y a quelques irrégularités dans les adresses IP d'où proviennent les transactions.

    - Par exemple, toute adresse IP commençant par '10.' est réservée à un usage interne.

    - Nous ne devrions pas voir de telles adresses IP accéder au service d'une société réputée.

    - Trouvez les adresses IP et les emails listés avec ces transactions.
    
    - L'opérateur `LIKE` est utilisé dans une clause `WHERE` pour rechercher un motif spécifique dans une colonne :
  
  
  
  
5. Les utilisateurs effectuent des transactions frauduleuses en utilisant un service d'adresse électronique temporaire. Ces services fournissent une adresse électronique de courte durée qui peut être vérifiée, puis s'autodétruit.

    - Trouvez les emails dans `data_transactions` avec 'temp_email.com' comme domaine.
   
  
  
6. Le département financier recherche une transaction spécifique. Il sait que la transaction a été effectuée à partir d'une adresse IP commençant par '120' et que son nom complet commence par 'John'.

    - Pouvez-vous trouver la transaction ?