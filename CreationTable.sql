-- Création du schéma "DLC"
--CREATE SCHEMA DLC;
-- Définition du schéma "DLC" par défaut
SET search_path TO DLC;

-- Création des tables dans le schéma "DLC"
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nom VARCHAR(200),
    Prenom VARCHAR(200),
    Adresse VARCHAR(200),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(30)
);

CREATE TABLE Fournisseurs (
    FournisseurID INT PRIMARY KEY,
    NomFournisseur VARCHAR(200),
    Adresse VARCHAR(100),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(200)
);

CREATE TABLE Employes (
    EmployeID INT PRIMARY KEY,
    Nom VARCHAR(200),
    Prenom VARCHAR(200),
    Fonction VARCHAR(200),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(200)
);

CREATE TABLE Produits (
    ProduitID INT PRIMARY KEY,
    NomProduit VARCHAR(200),
    Description TEXT,
    PrixUnitaire DECIMAL(10, 2),
    FournisseurID INT,
    FOREIGN KEY(FournisseurID) REFERENCES Fournisseurs(FournisseurID)
);

CREATE TABLE Ventes (
    VenteID INT PRIMARY KEY,
    DateVente DATE,
    ClientID INT,
    ProduitID INT,
    EmployeID INT,
    FOREIGN KEY(ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY(ProduitID) REFERENCES Produits(ProduitID),
    FOREIGN KEY(EmployeID) REFERENCES Employes(EmployeID),
    QuantiteVendue INT,
    MontantTotal DECIMAL(10, 2)
);

-- Lire des informations dans la base

/*======================================================*/
/*                 Maîtriser la clause SELECT           */
/*======================================================*/

/*======================================================*/
/* Fonctionnalité 1: Sélectionner toutes les informations d'une table 
Syntaxe générale:
SELECT *
FROM nom_table;
*/
/*======================================================*/

-- QUESTION 1: Donner la table complète des produits vendus par l'entreprise 
SELECT *
FROM Produits;

-- QUESTION 2: Donner la table complète des clients de l'entreprise
SELECT *
FROM Clients;

/*======================================================*/
/* Fonctionnalité 2: Sélectionner une seule colonne
Syntaxe générale:
SELECT nom_colonne
FROM nom_table;
*/
/*======================================================*/

-- QUESTION 3: Donner le nom de tous les produits de la base de données
SELECT NomProduit
FROM Produits;


-- QUESTION 4: Donner le nom de tous les fournisseurs de la base de données
SELECT NomFournisseur
FROM Fournisseurs;


SELECT NomFournisseur, FournisseurID,Email, Adresse
FROM Fournisseurs;

/*======================================================*/
/* Fonctionnalité 3: Sélectionner deux ou plusieurs colonnes
Syntaxe générale:
SELECT nom_colonne1, nom_colonne2,..., nom_colonne3
FROM nom_table;
======================================================*/

-- QUESTION 5: Donner le nom et le prénom des employés de l'entreprise
-- QUESTION 6: Donner le nom, le prix et la description de tous les produits

/*======================================================*/
/* Fonctionnalité 4: Sélectionner des valeurs distinctes
Syntaxe générale:
SELECT DISTINCT nom_colonne
FROM nom_table;
======================================================*/

-- QUESTION 7: Donner les différentes dates auxquelles des ventes ont été réalisées
SELECT DISTINCT *
FROM Ventes;

-- QUESTION 8: Donner les noms et prénoms distincts des employés de l'entreprise
SELECT DISTINCT Nom, Prenom
FROM Employes



/*==========================================================================================*/
/*                 Maîtriser la clause WHERE POUR FILTRER suivant des conditions           */
/*==========================================================================================*/

/*======================================================*/
/* Fonctionnalité 6: Filtrer suivant une condition
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition;
======================================================*/
-- Liste produit vendu 
SELECT *
FROM Produits
WHERE PrixUnitaire = 999;


-- Liste produit vendu est à > 200

SELECT *
FROM Produits
WHERE PrixUnitaire > 200;

-- Liste produit vendu est à <= 200
SELECT *
FROM Produits
WHERE PrixUnitaire <= 200;

-- Liste produit vendu compris et 50 et 100
SELECT *
FROM Produits
WHERE PrixUnitaire >=50 AND PrixUnitaire <=100;

-- QUESTION 9: Information sur le produit "Nike Air Max" 
SELECT *
FROM Produits
WHERE NomProduit = 'Nike Air Max';

-- QUESTION 10: Donner la liste des produits du fournisseur numéro 13
SELECT *
FROM Produits
WHERE FournisseurID = 13;

-- Description des produits du fournisseur numéro 13
SELECT description
FROM Produits
WHERE FournisseurID = 13;



/*======================================================*/
/* Fonctionnalité 7: Utilisation de plusieurs conditions avec AND et OR
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition1 AND/OR condition2;
======================================================*/
-- Liste des produits vendu par le fournisseur 13 ou par le fournisseur 11
SELECT *
FROM Produits
WHERE FournisseurID=13 OR FournisseurID=11

/*======================================================*/
/* Fonctionnalité 8: Utilisation de IN dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne IN (valeur1, valeur2, ...);
======================================================*/
SELECT *
FROM Produits
WHERE FournisseurID IN (13, 15, 55, 45, 89, 88);

/*======================================================*/
/* Fonctionnalité 9: Utilisation de BETWEEN dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne BETWEEN valeur1 AND valeur2;
======================================================*/

-- Sélectionner les ventes réalisées entre le 1er janvier 2021 et le 31 décembre 2023
SELECT *
FROM Ventes
WHERE dateVente BETWEEN '2021-01-10' AND '2021-03-31';


/*======================================================*/
/* Fonctionnalité 10: Utilisation de LIKE dans la clause WHERE
Syntaxe générale:
SELECT nom_colonne 
FROM nom_table 
WHERE nom_colonne LIKE 'motif';
======================================================*/
-- Nom des clients qui commencent par la lettre c
SELECT *
FROM Clients
WHERE Nom like 'c%';

-- Nom des clients qui commencent par la lettre c et qui se termine par a
SELECT *
FROM Clients
WHERE Nom LIKE 'c%' ;

SELECT *
FROM Clients
WHERE Nom LIKE 'c%' AND Prenom LIKE '%y';

-- Le nom contient la lettre n
SELECT *
FROM Clients
WHERE Nom LIKE '%n%';

-- Le nom contient  "on"
SELECT *
FROM Clients
WHERE Nom LIKE '%on%';

-- Donner la liste des produits qui commencent par 'a'
-- Donner la liste des produits qui contiennent la lettre 'a'
-- Donner la liste des produits commençant par 'N' et finissant par 'x'

/*==========================================================================================
                 Maîtriser la clause ORDER BY POUR CLASSER
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE condition
ORDER BY nom_colonne [ASC | DESC], autre_nom_colonne [ASC | DESC], ...;
==========================================================================================*/

-- Donner la liste des produits du moins coûteux au plus coûteux
SELECT *
FROM Produits
ORDER BY prixUnitaire ;


-- Donner la liste des produits du prix le plus élevé au prix le moins élevé
SELECT *
FROM Produits
ORDER BY prixUnitaire DESC;

-- Liste des employés ordre alphabétique le nom t décroissant prénom
SELECT *
FROM Employes
ORDER BY nom, prenom DESC;

-- La liste des produits dont le prix est supérieur à 200, résultat par alphabétqiue suivant le nom du produit
SELECT *
FROM Produits
WHERE PrixUnitaire >200
ORDER BY NomProduit;


-- Liste des clients dont le nom contient une seule fois la lettre A
SELECT Nom
FROM Clients
WHERE Nom LIKE '%a%'  AND  Nom NOT LIKE '%a%%a%';




-- Contient deux occurrences de la lettre A

SELECT count(*)
FROM Clients
WHERE  Nom  LIKE '%A%A%';




/*==================================================================================
               Maîtriser les expressions régulières en SQL
==================================================================================*/

-- Expressions régulières en SQL permettent de faire des recherches de texte complexes.

/*======================================================
Fonctionnalité 1: Recherche basique avec REGEXP
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne REGEXP 'pattern';

En PostgreSQL, l'opérateur REGEXP n'est pas utilisé. 
Au lieu de cela, vous pouvez utiliser l'opérateur ~ pour effectuer 
des opérations de correspondance d'expressions régulières.
======================================================*/

-- Liste des produits qui contiennent "TV" (deux possibilités avec LIKE)
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE  '%TV%' ;

-- Avec REGEXP
SELECT count(*)
FROM Produits
WHERE NomProduit ~ 'TV';

/*======================================================
Pour indiquer le début d'une chaîne de caractères, utilisez le caractère "^" au début de l'expression.
======================================================*/

-- Liste des produits dont le nom commence par la lettre "D"
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE  'D%' ;


-- Avec une expression régulière
SELECT count(*)
FROM Produits
WHERE NomProduit  ~'^D';


/*======================================================
Pour indiquer la fin d'une chaîne de caractères, utilisez le caractère "$" à la fin de l'expression.
======================================================*/

-- Liste des produits qui se terminent par "M"
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE '%M';

-- Avec une expression régulière
SELECT count(*)
FROM Produits
WHERE NomProduit  ~ 'M$';


/*======================================================
Rechercher plusieurs patterns dans la chaîne de caractères en utilisant le symbole "|"
======================================================*/

-- Liste des clients dont le numéro contient "05" ou "04"
SELECT count(*)
FROM Clients
WHERE NumeroTelephone LIKE  '%05%'  OR NumeroTelephone LIKE  '%04%'  ;

-- Avec REGEXP
SELECT count(*)
FROM Clients
WHERE NumeroTelephone ~ '05|04' ;

-- Avec REGEXP
SELECT count(*)
FROM Clients
WHERE NumeroTelephone ~  '05|04|09|20 ' ;


/*======================================================================
Exercice 1: Liste des clients dont le numéro commence par "05" ou se termine par "23"
======================================================================*/

-- Avec LIKE
SELECT *
FROM Clients
WHERE NumeroTelephone LIKE  '05%'  OR NumeroTelephone LIKE '%23' ;

-- Avec REGEXP
SELECT *
FROM Clients
WHERE NumeroTelephone ~  '^05|23$' ;


/*======================================================================
Utilisation des caractères spéciaux "." (n'importe quel caractère)
Syntaxe générale:
SELECT nom_colonne
FROM nom_table
WHERE nom_colonne REGEXP 'pattern';
======================================================================*/

-- Exemple: Sélectionner les clients dont le nom contient 'R' suivi de n'importe quel caractère et ensuite 'a'


-- Avec LIKE (underscore)
SELECT count(*)
FROM Clients
WHERE Nom LIKE  '%R_a%';

-- Avec REGEXP
SELECT count(*)
FROM Clients
WHERE Nom ~ 'R.A' ;

/*======================================================================
Exercice: Liste des clients dont le nom commence par "R" et se termine par "z"
======================================================================*/

-- Avec LIKE
SELECT count(*)
FROM Clients
WHERE Nom LIKE  'R%z';

-- Avec REGEXP
SELECT count(*)
FROM Clients
WHERE Nom ~ 'R.*z$';


/*======================================================================
Astuces: []
======================================================================*/

-- Liste des clients dont le nom contient "it" ou "ie" ou "il" ou "is" 
SELECT count(*)
FROM Clients
WHERE Nom LIKE '%ie%' OR Nom LIKE '%it%' OR Nom LIKE '%il%' OR Nom LIKE '%is%';

-- Liste des clients dont le nom contient n'importe quelle lettre de 'a' à 'g' suivie de 'l'
SELECT count(*)
FROM Clients
WHERE Nom ~  'i[a-g]' ;

SELECT count(*)
FROM Clients
WHERE Nom ~ '[etls]i';



/*======================================================================
Limitation des résultats d'une requête avec LIMIT
SELECT nom_colonnes
FROM nom_table
WHERE conditions 
LIMIT nombre_de_lignes;

======================================================================*/

-- Donner la liste des 10 premiers clients par ordre alphabétique
SELECT *
FROM Clients
ORDER BY Nom
LIMIT 1000;


-- Donner la liste des 10 produits les plus chers
SELECT *
FROM Produits
ORDER BY PrixUnitaire DESC 
LIMIT 10;

-- Donner la liste des 10 produits les plus moins
SELECT *
FROM Produits
ORDER BY PrixUnitaire  
LIMIT 10;


/*==================================================================================
               Maîtriser les fonctions d'agrégation en SQL
==================================================================================*/

/*======================================================
Fonctions d'agrégation en SQL
======================================================*/

-- Les fonctions d'agrégation en SQL sont utilisées pour effectuer des calculs sur un ensemble de valeurs dans une colonne. Elles sont couramment utilisées pour obtenir des statistiques résumées à partir des données.

/*======================================================
Fonction COUNT()
======================================================*/

-- La fonction COUNT() permet de compter le nombre de lignes dans un ensemble de données.


-- Question: Combien y a-t-il de clients dans la base de données ?
SELECT COUNT(*) AS  "NombreClient" 
FROM Clients;

SELECT COUNT(ClientID) AS   "NombreClient"  
FROM Clients;

/*======================================================
Fonction SUM()
======================================================*/

-- Exemple: Calculer la somme totale des ventes dans la table "Ventes".
SELECT SUM(MontantTotal) AS Somme_CA
FROM Ventes;


/*======================================================
Fonction AVG()
======================================================*/

-- Déterminer la moyenne des ventes.
SELECT AVG(MontantTotal) AS AVG_CA
FROM Ventes;
/*======================================================
Fonction MIN() et MAX()
======================================================*/

-- Les fonctions MIN() et MAX() permettent de trouver la valeur minimale et maximale dans une colonne, respectivement.
SELECT MIN(MontantTotal) AS MIN_CA
FROM Ventes;

SELECT MAX(MontantTotal) AS MIN_CA
FROM Ventes;
-- Exemple: Quel est le produit le moins cher ? Quel est le produit le plus cher ?
SELECT MIN(MontantTotal) AS Minimum, MAX(MontantTotal) AS Maximum
FROM Ventes;

SELECT MIN(PrixUnitaire) AS Minimum, MAX(PrixUnitaire) AS Maximum
FROM Produits;

/*======================================================
Fonction SUM(DISTINCT)
======================================================*/

-- La fonction SUM(DISTINCT) permet de calculer la somme des valeurs uniques dans une colonne.
SELECT SUM(DISTINCT MontantTotal) AS Somme_CA
FROM Ventes;


-- Exemple: Calculer la somme totale des ventes uniques dans la table "Ventes".

/*======================================================
Fonction AVG(DISTINCT)
======================================================*/

-- La fonction AVG(DISTINCT) permet de calculer la moyenne des valeurs uniques dans une colonne.

-- Exemple: Calculer la moyenne des ventes uniques.
SELECT AVG(DISTINCT MontantTotal) AS MoyenneDist
FROM Ventes;
/*==================================================================================
              Maîtriser le REGROUPEMENT des Données (GROUP BY) en SQL
==================================================================================*/

-- Introduction au Regroupement des Données
-- Le regroupement des données est une fonctionnalité essentielle en SQL qui permet de regrouper les lignes de données en fonction des valeurs d'une ou plusieurs colonnes. Cette opération est souvent utilisée pour effectuer des calculs agrégés sur des groupes de données plutôt que sur l'ensemble des données.

/*Syntaxe de la Clause GROUP BY
-- La clause `GROUP BY` est utilisée pour spécifier les colonnes par lesquelles vous souhaitez regrouper vos données. La syntaxe générale est la suivante :
SELECT colonne1, colonne2, ..., fonction_agrégation(colonne)
FROM nom_table
GROUP BY colonne1, colonne2, ...; */

-- Exemple Pratique : Calculer la somme des ventes par employé.
SELECT EmployeID, SUM(MontantTotal) AS CA_Total
FROM Ventes
GROUP BY EmployeID;

-- Exemple Pratique : Compter le nombre de ventes par employé.
SELECT EmployeID, COUNT(VenteID) AS CA_Total
FROM Ventes
GROUP BY EmployeID;

-- Exemple pratique: Déterminer la somme des ventes par année.
SELECT EXTRACT(YEAR FROM DateVente) as Annee, SUM(MontantTotal) as MntTot
FROM Ventes
GROUP BY Annee
ORDER BY MntTot DESC;

SELECT EXTRACT (YEAR FROM DateVente)  as Annee, SUM(MontantTotal) as MntTot
FROM Ventes
GROUP BY Annee
ORDER BY MntTot DESC;

-- Exemple Pratique : Quelle est la moyenne des ventes par année et par employé ?

SELECT  EXTRACT (YEAR FROM DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
GROUP BY Annee, EmployeID;


-- Utilisation de Fonctions d'Agrégation
-- En combinaison avec la clause `GROUP BY`, vous pouvez utiliser des fonctions d'agrégation telles que SUM(), COUNT(), AVG(), MIN(), MAX(), etc., pour effectuer des calculs sur les groupes de données résultants. Cela vous permet d'obtenir des statistiques résumées par groupe.

/*======================================================
Fonction HAVING
======================================================*/

-- La clause HAVING est utilisée avec GROUP BY pour filtrer les groupes de résultats basés sur une condition agrégée.

-- La clause HAVING ne reconnaît pas les alias définis dans la clause SELECT. Vous devez répéter l'expression dans la clause HAVING

-- Exemple: Donner la liste des employés dont la moyenne des ventes est supérieure à 1000 euros.

SELECT  EXTRACT (YEAR FROM DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
GROUP BY Annee, EmployeID
HAVING AVG(MontantTotal) > 1000;

SELECT EXTRACT (YEAR FROM DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
WHERE MontantTotal > 1000
GROUP BY Annee, EmployeID
;

-- Exercice: Donner la liste des 5 employés ayant la somme des ventes la plus élevée.
SELECT EmployeID, SUM(MontantTotal) AS CA_Total
FROM Ventes
GROUP BY EmployeID
ORDER BY CA_Total
LIMIT 5;

-- Question: Donner pour chaque vente le nom et le prénom de l'employé qui a réalisé la vente

-- Première approche produit cartésien
SELECT VenteID, Ventes.EmployeID, Nom, Prenom
FROM Ventes, Employes
WHERE Ventes.EmployeID = Employes.EmployeID;


SELECT VenteID, Ventes.EmployeID, Nom, Prenom
FROM Ventes, Employes
WHERE Ventes.EmployeID = Employes.EmployeID;

/*==================================================================================
               Maîtriser les Jointures en SQL
==================================================================================*/

/*======================================================
Introduction aux Jointures en SQL
======================================================*/

-- Les jointures en SQL sont utilisées pour combiner des données de deux ou plusieurs tables en fonction d'une relation entre les colonnes de ces tables. Elles permettent de récupérer des informations provenant de plusieurs tables dans une seule requête.

/*======================================================================
Utilisation de INNER JOIN pour combiner des lignes de deux tables
SELECT colonnes
FROM table1
INNER JOIN table2
ON table1.colonne_commune = table2.colonne_commune;

Explication:
- SELECT colonnes: spécifie les colonnes à récupérer dans le résultat final.
- FROM table1: définit la première table à partir de laquelle récupérer 
  les données.
- INNER JOIN table2: spécifie la seconde table à joindre avec la première.
- ON table1.colonne_commune = table2.colonne_commune; établit la condition 
  de jointure, généralement l'égalité entre une colonne de la table1 et une colonne de la table2.

L'opération INNER JOIN retourne uniquement les lignes qui ont une correspondance
dans les deux tables basées sur la condition spécifiée.
======================================================================*/
-- Donner pour chaque vente le nom et le prénom de l'employé qui a réalisé la vente

SELECT VenteID, nom, prenom
FROM Ventes 
INNER JOIN Employes ON Ventes.EmployeID=Employes.EmployeID;

-- Utilisation de USING
SELECT VenteID, nom, prenom
FROM Ventes 
INNER JOIN Employes USING(EmployeID);

-- Utilisation de JOIN
SELECT VenteID, nom, prenom
FROM Ventes 
JOIN Employes USING(EmployeID);

-- Utilisation de JOIN
SELECT VenteID, nom, prenom
FROM Ventes AS v
JOIN Employes USING(EmployeID);



SELECT VenteID, nom, prenom
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;

SELECT *
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;



SELECT *
FROM Ventes AS ve
JOIN Employes AS em USING(EmployeID);


SELECT ve.EmployeID
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;


-- Exercice: Donner pour chaque produit de la base de données le nom et l'adresse de son fournisseur
SELECT ProduitID, NomFournisseur, adresse
FROM Fournisseurs fo 
JOIN Produits pr USING(FournisseurID);

SELECT ProduitID,NomProduit, NomFournisseur, adresse
FROM Fournisseurs fo 
JOIN Produits pr ON fo.FournisseurID = pr.ProduitID;





-- Donner le nom et prénom des employés ayant réalisé la somme des ventes les plus élevées

SELECT EmployeID, Nom, Prenom, SUM(MontantTotal) AS CA
FROM Employes JOIN Ventes USING(EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY CA DESC;



-- Exercice donner pour chaque client le nom, l'adresse ainsi que le nombre d'achat réalisé
SELECT ClientID, Nom, Adresse, COUNT(VenteID) AS NbAchat
FROM Clients JOIN Ventes USING(ClientID)
GROUP BY  ClientID, Nom, Adresse
ORDER BY NbAchat DESC;


/*======================================================================
Utilisation de LEFT JOIN et RIGHT JOIN pour combiner des lignes de deux tables
SELECT colonnes
FROM table1
LEFT JOIN table2 ON table1.colonne_commune = table2.colonne_commune;
RIGHT JOIN table2 ON table1.colonne_commune = table2.colonne_commune;

Explication:
- SELECT colonnes: spécifie les colonnes à récupérer dans le résultat final.
- FROM table1: définit la première table à partir de laquelle récupérer les données.
- LEFT JOIN table2: spécifie la seconde table à joindre avec la première, en incluant toutes les lignes de la première table (table1) même s'il n'y a pas de correspondance dans la seconde table (table2).
- RIGHT JOIN table2: similaire à LEFT JOIN mais inclut toutes les lignes de la seconde table (table2), même s'il n'y a pas de correspondance dans la première table (table1).
- ON table1.colonne_commune = table2.colonne_commune; établit la condition de jointure, généralement l'égalité entre une colonne de la table1 et une colonne de la table2.

L'opération LEFT JOIN retourne toutes les lignes de la table de gauche (table1) et les lignes correspondantes de la table de droite (table2). S'il n'y a pas de correspondance, le résultat inclura des valeurs NULL pour les colonnes de la table de droite.

L'opération RIGHT JOIN fonctionne de manière similaire mais retourne toutes les lignes de la table de droite (table2) et les lignes correspondantes de la table de gauche (table1). S'il n'y a pas de correspondance, le résultat inclura des valeurs NULL pour les colonnes de la table de gauche.
======================================================================*/

-- Question donner pour chaque employé, le nom, le prénom et le nombre de vente réalisé (il faut conserver dans la base les employés qui ont des ventes nulles)
SELECT EmployeID, Nom, Prenom, COUNT(VenteID) as NbVente
FROM Employes 
LEFT JOIN Ventes USING (EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY NbVente;


SELECT EmployeID, Nom, Prenom, COUNT(VenteID) as NbVente
FROM Employes 
JOIN Ventes USING (EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY NbVente;



-- Donner pour chaque fournisseur son nom, son email et le nombre de produits fournis (laisser des fournisseurs qui n'ont aucun produit)
SELECT nomFournisseur, email, COUNT(ProduitID) as nbproduit
FROM Fournisseurs f 
LEFT JOIN Produits USING (FournisseurID)
GROUP BY nomFournisseur, email
ORDER BY nbproduit;


SELECT nomFournisseur, email, COUNT(ProduitID) as nbproduit
FROM Fournisseurs f 
JOIN Produits USING (FournisseurID)
GROUP BY nomFournisseur, email
ORDER BY nbproduit;



-- Donner le nom, le prénom et la moyenne des ventes par client (conservez la liste des clients qui n'ont acheté aucun produit)

SELECT Nom, Prenom, AVG(MontantTotal) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;


-- Remplacez dans la requête précédente les valeurs NULL par 0

-- COALESCE
SELECT Nom, Prenom, COALESCE(AVG(MontantTotal),0) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;


SELECT Nom, Prenom, ROUND(COALESCE(AVG(MontantTotal),0),2) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;

SELECT Nom, Prenom, ROUND(COALESCE(AVG(MontantTotal),0),2) as CAAvg
FROM Ventes
RIGHT JOIN Clients USING(ClientID)
GROUP BY Nom, Prenom;


-- Exercice: Donner le nom, le prénom et la somme des achats réalisés par chaque client, et affichez zéro si le montant des achats est nul
SELECT ClientID,Nom, Prenom, COALESCE(SUM(MontantTotal),0) as CA
FROM Clients 
LEFT JOIN Ventes USING(ClientID)
GROUP BY ClientID, Nom, Prenom;



-- Refaire les exercices précédents en utilisant RIGHT JOIN

SELECT ClientID,Nom, Prenom, COALESCE(SUM(MontantTotal),0) as CA
FROM Ventes 
RIGHT JOIN Clients USING(ClientID)
GROUP BY ClientID, Nom, Prenom;


/*======================================================================
Création et utilisation de vues dans SQL
CREATE VIEW nom_vue AS
SELECT colonnes
FROM table1
JOIN table2 ON table1.colonne_commune = table2.colonne_commune;

Explication:
- CREATE VIEW nom_vue: commence la définition d'une nouvelle vue nommée 'nom_vue'. Les vues sont des tables virtuelles basées sur le résultat d'une requête SQL.
- SELECT colonnes: spécifie les colonnes à inclure dans la vue. Ces colonnes peuvent provenir d'une ou plusieurs tables.
- FROM table1: indique la ou les tables de base pour la vue. Les vues peuvent combiner des données de plusieurs tables via des jointures.
- JOIN table2 ON table1.colonne_commune = table2.colonne_commune; définit comment les tables sont reliées pour former la vue. Les jointures peuvent être INNER JOIN, LEFT JOIN, RIGHT JOIN, etc., selon les données à inclure.

Les vues permettent de:
1. Simplifier les requêtes complexes en masquant la complexité des jointures et des calculs.
2. Réutiliser des requêtes SQL fréquemment exécutées sans avoir à les réécrire.
3. Limiter l'accès aux données en présentant seulement une partie des données d'une table ou de plusieurs tables.
======================================================================*/

-- Créez une vue des ventes de l'année 2021`
CREATE VIEW Vente2021 AS 
SELECT *
FROM Ventes
WHERE EXTRACT (YEAR FROM DateVente) = 2021;

SELECT *
FROM Vente2021;

-- Quelle est la liste des clients qui ont réalisé plus de 2 achats en 2021
SELECT ClientID, Nom, Prenom, COUNT(VenteID) as NbAchat
FROM Clients 
LEFT JOIN Vente2021 USING(ClientID)
GROUP BY ClientID
HAVING COUNT(VenteID) > 1;


-- Quelle est la liste des employés qui ont les ventes moyennes supérieures à 500 en 2021?
SELECT EmployeID, Nom, Prenom, AVG(MontantTotal) as AvgVente
FROM Employes 
LEFT JOIN Vente2021 USING(EmployeID)
GROUP BY EmployeID, Nom, Prenom
HAVING AVG(MontantTotal) >500;

-- Créez une vue contenant les produits dont le prix est supérieur à 500 euros
CREATE VIEW ProduitSup500 AS
SELECT *
FROM Produits
WHERE PrixUnitaire >500;

/*====================*/
/*

Créez une vue contenant pour chaque client le nom, le prénom ainsi que 
la somme des achats par année 

Quelle est pour chaque client la moyenne des CA générés par année?

*/


/*====================*/
/* Sous-requête en SQL*/
/*====================*/
-- Liste des clients qui n'ont réalisé aucun achat

SELECT *
FROM Clients
WHERE ClientID NOT IN (SELECT ClientID FROM Ventes);

-- Liste des employés au moins une vente
SELECT *
FROM Employes
WHERE EmployeID IN (SELECT EmployeID FROM Ventes);

-- Exercice: Écrire une requête qui permet de donner pour chaque 
-- client son nom, son prénom, la somme des achats ainsi que 
-- la moyenne annuelle des achats


SELECT 
	cl.ClientID, 
	cl.nom, 
	cl.prenom, 
	SUM(v.MontantTotal) AS SommeAchats,
	AVG(v.MontantTotal) AS MoyenneAnnuelleAchat
FROM
	Clients cl 
JOIN
	Ventes v ON cl.ClientID = v.ClientID
GROUP BY
	cl.ClientID, 	cl.nom, 	cl.prenom;




/*======================================================================
Maitriser CASE WHEN
======================================================================*/





/*======================================================================
Utilisation de CASE WHEN pour appliquer une logique conditionnelle
SELECT colonnes,
       CASE
           WHEN condition THEN resultat1
           ELSE resultat2
       END AS nom_colonne_resultat
FROM table;

Explication:
- SELECT colonnes: spécifie les colonnes à récupérer dans le résultat final, ainsi que la colonne conditionnelle.
- 	CASE WHEN condition THEN resultat1 ELSE resultat2 END: applique 
	une logique conditionnelle sur les données récupérées. 
	Si la condition est vraie, alors le 'resultat1' est retourné. 
	Sinon, le 'resultat2' est utilisé.
	
- 	AS nom_colonne_resultat: attribue un nom à la colonne résultante de 
	l'expression CASE.

	Cette instruction est utile pour transformer des données en fonction de 
	conditions spécifiques directement dans la requête SQL, permettant de 
	simplifier la logique de traitement des données et de réduire le besoin 
	de logique conditionnelle dans l'application cliente.
	
======================================================================*/

-- Ecrire une requête SQL permettant de classifier pour chaque produit sa catégorie
-- "Petit Budget" si le prixUnitaire est <200 euros
-- "Moyen Budget" si le prixUnitaire est compris entre 200 et 500
-- "Grand Budget" si le prix unitaire est supérieur à 500 

SELECT
    ProduitID,
    NomProduit,
    PrixUnitaire,
    CASE
        WHEN PrixUnitaire < 200 THEN 'Petit Budget'
        WHEN PrixUnitaire BETWEEN 200 AND 500 THEN 'Moyen Budget'
        WHEN PrixUnitaire > 500 THEN 'Grand Budget'
        ELSE 'Non classifié'
    END AS CategorieBudget
FROM
    Produits;


SELECT *, 
		CASE 
			WHEN PrixUnitaire < 200 THEN 'Petit Budget'
            WHEN PrixUnitaire >= 200 AND PrixUnitaire <= 500 THEN 'Moyen Budget'
            ELSE 'Grand Budget'
		END AS Categorie
FROM Produits; 


SELECT count(*), 
		CASE 
			WHEN PrixUnitaire < 200 THEN 'Petit Budget'
            WHEN PrixUnitaire >= 200 AND PrixUnitaire <= 500 THEN 'Moyen Budget'
            ELSE 'Grand Budget'
		END AS Categorie
FROM Produits 
GROUP BY PrixUnitaire;

/*
-- 	Ecrire une requête permettant d'afficher pour chaque son nom, son prénom, 
	employé
-- 	le nombre de vente et une étique qui indique 
-- 	si le nombre de vente est inférieur à 50, compris entre 50 et 100 ou 
	supérieur à 100

*/
SELECT EmployeID, Nom, Prenom, 
CASE
WHEN COUNT(VenteID) < 50 THEN '<50'
WHEN COUNT(VenteID)>=50 AND COUNT(VenteID)< 100 THEN  'entre 30 et 100 '
ELSE ' >=100' 
END AS nbvente                                
                                 
FROM Employes em
	LEFT JOIN Ventes ve USING(EmployeID)
GROUP BY EmployeID, Nom, Prenom;


/*
-- 	Créer une requête qui donne le nom,le prenom et sa catégorie:
-- 	<1000 Silver si les achat sont inférieur à 2, GOLD entre 1000 et 5000, 
	premium >5000

*/

SELECT ClientID, Nom, Prenom, SUM(MontantTotal) as CA, CASE 
	WHEN SUM(MontantTotal) <1000 THEN  'Silver' 
    WHEN SUM(MontantTotal) <=1000 AND  SUM(MontantTotal) >=5000  THEN  'GOLD' 
    ELSE  'Premium' 
	END AS Categorie
FROM Clients cl 
	LEFT JOIN Ventes ve USING(ClientID)
GROUP BY ClientID, Nom, Prenom;



SELECT ClientID, Nom, Prenom, SUM(MontantTotal) as CA, CASE 
	WHEN SUM(MontantTotal) <1000 THEN  'Silver' 
    WHEN SUM(MontantTotal) <=1000 AND  SUM(MontantTotal) >=5000  THEN  'GOLD' 
    ELSE  'Premium' 
	END AS Categorie 
FROM Clients cl 
	LEFT JOIN Ventes ve USING(ClientID)
GROUP BY ClientID, Nom, Prenom;
    


/* Comprendre les sous requêtes */

/*
	Les sous-requêtes (ou sous-interrogations) sont des requêtes SQL imbriquées à l'intérieur 
	d'une requête principale. Elles peuvent être utilisées dans différentes parties d'une requête, 
	comme dans la clause SELECT, FROM, WHERE, ou HAVING. 

	Il est important de noter que les sous-requêtes doivent retourner un seul résultat ou 
	une seule colonne lorsqu'elles sont utilisées dans des endroits tels que la clause WHERE. 
	Si une sous-requête retourne plusieurs lignes ou colonnes, elle doit être correctement gérée 
	dans le contexte de la requête principale.
*/

/* Utilisation des sous requêtes dans la clause WHERE */

/*=======================================================================


Utilisation de sous-requêtes dans la clause WHERE pour des filtres avancés

SELECT colonne1, colonne2, ...
FROM table1
WHERE colonneX [NOT] IN (SELECT colonneY FROM table2 WHERE condition);

Explication:
- 	La clause WHERE avec sous-requête permet de filtrer les enregistrements 
	de la requête principale en fonction des résultats de la sous-requête.
	
-	L'opérateur [NOT] IN est utilisé pour inclure ou exclure les enregistrements 
	correspondant aux valeurs retournées par la sous-requête.

Conseil:
- 	Utilisez des sous-requêtes dans WHERE pour des comparaisons qui 
	nécessitent des ensembles de valeurs ou des conditions complexes.
	
- 	Assurez-vous que les sous-requêtes sont bien indexées pour éviter les 
	performances lentes sur de grandes bases de données.
======================================================================*/


-- Donner la listes des produits qui n'ont pas été vendu en 2023
SELECT *
FROM Produits
WHERE ProduitID NOT IN (SELECT ProduitID FROM Ventes 
						WHERE EXTRACT (YEAR FROM dateVente)=2023);


SELECT ProduitID 
FROM Ventes 
WHERE EXTRACT (YEAR FROM dateVente)=2023;


-- Quels clients ont un historique d'achat supérieur à la moyenne des achats ?
SELECT *
FROM Clients 
LEFT JOIN Ventes USING (ClientID)
WHERE MontantTotal > (SELECT AVG(MontantTotal) FROM Ventes );


-- Quels sont les noms des produits qui ont un prix unitaire supérieur
-- à la moyenne des prix de tous les produits ?

SELECT *
FROM Produits
WHERE PrixUnitaire > (SELECT AVG(PrixUnitaire) FROM Produits);


-- Donner la liste des employés qui n'ont réalisé aucune vente durant 
-- le mois de décembre 2022

SELECT EmployeID, Nom, Prenom
FROM Employes
LEFT JOIN Ventes USING(EmployeID)
WHERE EmployeID NOT IN (SELECT EmployeID FROM Ventes 
						WHERE EXTRACT (YEAR FROM dateVente)=2022 
						AND EXTRACT (MONTH FROM DateVente)=12);


-- employes ayant réalisé des ventes durant le mois de déc 2022
SELECT EmployeID
FROM Ventes
WHERE 
	EXTRACT (YEAR FROM dateVente)=2022 
	AND EXTRACT (MONTH FROM DateVente)=12 ;






-- Exercice: Ecrire une requête qui permet de lister les clients 
-- qui n'ont jamais réalisé d'achat

SELECT ClientID, nom, prenom
FROM Clients
WHERE ClientID NOT IN (SELECT ClientID FROM Ventes);


/* Utilisation des sous requêtes dans la clause FROM */

/*======================================================================
	Utilisation de sous-requêtes dans la clause FROM pour créer des tables 
	temporaires
	
SELECT colonne1, colonne2, ...
FROM (SELECT colonneA, colonneB FROM table2 WHERE condition) AS sub_table
WHERE sub_table.colonneA = condition;

Explication:
- 	La clause FROM avec sous-requête crée une vue temporaire 'sub_table' 
	qui peut être utilisée comme n'importe quelle autre table dans la requête 
	principale.
	
- 	La sous-requête dans FROM est souvent utilisée pour simplifier des requêtes 
	complexes ou pour effectuer des pré-filtrages.

Conseil:
- 	Donnez des alias clairs aux sous-tables pour améliorer la lisibilité de 
	vos requêtes.
	
- 	Préfiltrez autant que possible dans la sous-requête pour réduire la charge 
	de traitement dans la requête principale.
======================================================================*/


-- Donner pour chaque employé, le nom, le prénom et la moyenne des ventes annuelle
SELECT EmployeID,YEAR(DateVente) as Annee, SUM(MontantTotal) as CA
FROM Ventes
GROUP BY EmployeID,YEAR(DateVente);

SELECT EmployeID, AVG(CA) as MeanCA
FROM 
			(SELECT EmployeID,YEAR(DateVente) as Annee, SUM(MontantTotal) as CA
			FROM Ventes
			GROUP BY EmployeID,YEAR(DateVente)) AS temp
GROUP BY EmployeID;


-- Quelle est le taux de croissance du chiffre d'affaire entre 2021 et 2022?
SELECT SUM(MontantTotal) AS CA2021
FROM Ventes
WHERE YEAR(DateVente)=2021;

SELECT SUM(MontantTotal) AS CA2022
FROM Ventes
WHERE YEAR(DateVente)=2022;

SELECT (CA2022-CA2021)/CA2021 AS TxCroissance

FROM 

	(SELECT SUM(MontantTotal) AS CA2022
		FROM Ventes
		WHERE YEAR(DateVente)=2022) AS temp, 
        
	(SELECT SUM(MontantTotal) AS CA2021
	FROM Ventes
	WHERE YEAR(DateVente)=2021) AS temp2
;


-- Exercice:  Donner la liste des 10 clients dont la moyenne du nombre d'achat annuelle 
-- le plus élevé
SELECT ClientID,Nom, Prenom, AVG(nbachat) as moyenne
FROM 
	(SELECT ClientID,YEAR(dateVente) AS annee, COUNT(VenteID) AS nbachat
	FROM Ventes
	GROUP BY ClientID,YEAR(dateVente) ) AS temp
    JOIN Clients USING(ClientID)
GROUP BY ClientID, Nom, Prenom
ORDER BY moyenne DESC
LIMIT 10
;





/* Utilisation des sous requête dans la clause SELECT*/

/*======================================================================

	Utilisation de sous-requêtes dans la clause SELECT pour des calculs par ligne
	
	SELECT colonne1, (SELECT COUNT(*) FROM table2 WHERE table2.colonneY = table1.colonneX) AS count_colonne
	FROM table1;

Explication:
- 	La sous-requête dans SELECT permet de retourner des valeurs calculées pour chaque ligne de 
	la table principale, idéal pour des agrégations ou des calculs conditionnels.
	
- 	Ces sous-requêtes sont souvent corrélées, c'est-à-dire qu'elles font référence à des colonnes 
	de la requête principale.

Conseil:

- 	Utilisez les sous-requêtes dans SELECT pour des calculs détaillés ou des conditions 
	qui varient par ligne.
	
- 	Veillez à ce que les requêtes soient optimisées pour éviter un impact négatif sur les performances, 
	surtout avec des sous-requêtes corrélées dans des tables volumineuses.
	
======================================================================*/


-- Quels sont les produits qui ont un prix unitaire supérieur à la moyenne des prix unitaires de 
-- tous les produits vendus,et combien de fois ont-ils été vendus?

SELECT 
    P.NomProduit, 
    P.PrixUnitaire, 
    (SELECT COUNT(*) FROM Ventes WHERE ProduitID = P.ProduitID) AS NombreDeVentes
FROM 
    Produits P
WHERE 
    P.PrixUnitaire > (SELECT AVG(PrixUnitaire) FROM Produits) 
GROUP BY 
    P.ProduitID, P.NomProduit, P.PrixUnitaire
ORDER BY 
    NombreDeVentes DESC;
	
/*Joindre plusieurs table*/

-- Lister les noms des employés avec le détail des produits et les informations sur 
-- les clients ayant réalisé la 

SELECT count(*)
FROM Employes em 
	 LEFT JOIN Ventes ve USING(EmployeID)
     LEFT JOIN Produits pr USING(ProduitID);

-- Donner la liste des nom de fournisseur, le nom de produit et 
-- les noms des clients pour tous les produits 
-- qui ont été acheté plus de 2 fois


SELECT * 
FROM 
		(SELECT ProduitID, COUNT(VenteID) AS nbproduit
		FROM Ventes 
		GROUP BY ProduitID
		HAVING COUNT(VenteID)>2
		) as t
        JOIN Clients ON t.ProduitID = Clients.ClientID
		JOIN Produits ON t.ProduitID = Produits.ProduitID
		JOIN Ventes ON t.ProduitID = Ventes.ProduitID;


-- Quels produits ont été vendus par plus d'un employé ?


SELECT Produits.ProduitID, Produits.NomProduit, COUNT(DISTINCT Ventes.EmployeID) AS NombreEmployes
FROM Ventes
JOIN Produits ON Ventes.ProduitID = Produits.ProduitID
GROUP BY Produits.ProduitID, Produits.NomProduit
HAVING COUNT(DISTINCT Ventes.EmployeID) > 1;


-- Qui sont les clients ayant acheté le plus grand nombre de produits différents ?
SELECT Ventes.ClientID , COUNT(DISTINCT Ventes.ProduitID) AS NombreProduitsDifferents
FROM Ventes
JOIN Clients ON Ventes.ClientID = Clients.ClientID
GROUP BY Ventes.ClientID 
ORDER BY NombreProduitsDifferents DESC
LIMIT 1;





/* Maitriser les opérations ensemblistes */


/*======================================================================
Utilisation des opérations ensemblistes pour combiner les résultats de requêtes
SELECT colonne1, colonne2, ...
FROM table1
UNION [ALL] / INTERSECT / EXCEPT
SELECT colonne1, colonne2, ...
FROM table2;

Explication:
- SELECT colonne1, colonne2, ...: spécifie les colonnes à récupérer dans les résultats des requêtes.
- UNION: combine les résultats de deux requêtes en une seule liste de résultats sans doublons.
- UNION ALL: combine les résultats de deux requêtes en une seule liste de résultats avec doublons.
- INTERSECT: retourne uniquement les lignes communes aux deux requêtes.
- EXCEPT: retourne les lignes de la première requête qui ne sont pas présentes dans la seconde requête.
======================================================================*/

 

-- 	Donner la liste des employé qui ont plus de 100 ventes ou dont le chiffres d'affaires 
--	annuelle réalisé est supérieure à 2000 euro

SELECT Employes.EmployeID, Employes.Nom, COUNT(VenteID) AS NombreVentes, SUM(MontantTotal) AS ChiffreAffaires
FROM Ventes
JOIN Employes ON Ventes.EmployeID = Employes.EmployeID
GROUP BY Employes.EmployeID, Employes.Nom
HAVING COUNT(VenteID) > 100 OR SUM(MontantTotal) > 2000
ORDER BY NombreVentes ASC ;

-- 	Donner la liste des employé qui ont réalisé plus de 100 ventes et dont le CA annuelle 
--	est supérieure à 2000 euros

SELECT Employes.EmployeID, Employes.Nom, COUNT(VenteID) AS NombreVentes, SUM(MontantTotal) AS ChiffreAffaires
FROM Ventes
JOIN Employes ON Ventes.EmployeID = Employes.EmployeID
GROUP BY Employes.EmployeID, Employes.Nom
HAVING COUNT(VenteID)> 100 AND SUM(MontantTotal) > 2000
ORDER BY NombreVentes DESC ;



-- 	Quels employés n'ont réalisé aucune vente au premièr trimestre 2021 , contrairement au 
--	deuxième trimestre de 2021 ?

-- Utilisation de NOT EXISTS :

SELECT Employes.EmployeID, Employes.Nom 
FROM Employes
WHERE NOT EXISTS (
    SELECT 1
    FROM Ventes
    WHERE Employes.EmployeID = Ventes.EmployeID
    AND EXTRACT(QUARTER FROM DateVente) = 1 AND EXTRACT(YEAR FROM DateVente) = 2021
)
AND EXISTS (
    SELECT 1
    FROM Ventes
    WHERE Employes.EmployeID = Ventes.EmployeID
    AND EXTRACT(QUARTER FROM DateVente) = 2 AND EXTRACT(YEAR FROM DateVente) = 2021
);




-- Utilisation de LEFT JOIN et NULL :

SELECT Employes.EmployeID, Employes.Nom
FROM Employes
LEFT JOIN Ventes ON Employes.EmployeID = Ventes.EmployeID
    AND EXTRACT(QUARTER FROM DateVente) = 1 AND EXTRACT(YEAR FROM DateVente) = 2021
WHERE Ventes.EmployeID IS NULL
AND EXISTS (
    SELECT 1
    FROM Ventes
    WHERE Employes.EmployeID = Ventes.EmployeID
    AND EXTRACT(QUARTER FROM DateVente) = 2 AND EXTRACT(YEAR FROM DateVente) = 2021
);




/*==================================================================================
            Fonctions de fenêtrage
==================================================================================*/
-- Syntaxe de Base pour les Fonctions de Fenêtrage en SQL
/*
SELECT colonnes,
       FONCTION_DE_FENETRAGE() OVER (
           PARTITION BY colonne_de_partitionnement
           ORDER BY colonne_de_tri
           RANGE | ROWS BETWEEN debut AND fin
       ) AS nom_colonne_resultat
FROM table;

Explication:
- SELECT colonnes: Spécifie les colonnes à récupérer dans le résultat final, incluant la colonne résultante de la fonction de fenêtrage.
- FONCTION_DE_FENETRAGE() OVER (...): Applique une fonction de fenêtrage à un ensemble de lignes.
- PARTITION BY colonne_de_partitionnement: Divise les données en partitions pour le traitement par la fonction de fenêtrage.
- ORDER BY colonne_de_tri: Détermine l'ordre des lignes dans chaque partition.
- RANGE | ROWS BETWEEN debut AND fin: Définit le cadre de lignes pour l'application de la fonction.

*/

/* La somme des quantités vendues par produit*/

SELECT ProduitID, SUM(QuantiteVendue) as nbVente
FROM Ventes
GROUP BY ProduitID
ORDER BY nbVente DESC;

/* Donner le classement des produits en fonction de la quantité vendue QuantiteVendue(vente) RANK()*/

SELECT ProduitID, 
	   SUM(QuantiteVendue) as nbVente,
       RANK() 
       OVER(ORDER BY SUM(QuantiteVendue)  DESC)  AS classement
FROM Ventes
GROUP BY ProduitID;

SELECT ProduitID, 
	   SUM(QuantiteVendue) as nbVente,
       DENSE_RANK() 
       OVER(ORDER BY SUM(QuantiteVendue) DESC)  AS classement
FROM Ventes
GROUP BY ProduitID;


/* Ajouter le classement des employés qui on réalisé le plus grand chiffre d'affaire*/

SELECT EmployeID, SUM(MontantTotal) as MntTotal,
		DENSE_RANK() 
		OVER(ORDER BY SUM(MontantTotal)  DESC) As Classement
FROM Ventes
GROUP BY EmployeID;


/* 	Donner le Top 3 des meilleurs vendeur en terme de chiffre d'affaire par année (DENSE_RANK) 
	Pour les exaequo sans saut: Sous requête */

/* CA par année et par employé*/
SELECT EmployeID, EXTRACT (YEAR FROM dateVente) AS Annee, SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY EmployeID, Annee
ORDER BY CA DESC;


SELECT EmployeID, EXTRACT (YEAR FROM dateVente) AS Annee, SUM(MontantTotal) AS CA, 
	   DENSE_RANK()
	   OVER (PARTITION BY EXTRACT (YEAR FROM dateVente) 
       ORDER BY SUM(MontantTotal) DESC) As Classement
FROM Ventes
GROUP BY EmployeID, Annee;


SELECT temp.EmployeID, temp.Annee, temp.CA, temp.Classement
FROM
		(SELECT EmployeID, EXTRACT (YEAR FROM dateVente) AS Annee, SUM(MontantTotal) AS CA, 
			   DENSE_RANK()
			   OVER (PARTITION BY EXTRACT (YEAR FROM dateVente)
			   ORDER BY SUM(MontantTotal) DESC) As Classement
		FROM Ventes
		GROUP BY EmployeID, Annee) AS temp
        
WHERE Classement BETWEEN 1 AND 3;


SELECT Nom, Prenom, temp.EmployeID, temp.Annee, temp.CA, temp.Classement
FROM
		(SELECT EmployeID, EXTRACT (YEAR FROM dateVente) AS Annee, SUM(MontantTotal) AS CA, 
			   DENSE_RANK()
			  OVER (PARTITION BY EXTRACT (YEAR FROM dateVente)
			  ORDER BY SUM(MontantTotal) DESC) As Classement
		FROM Ventes
		GROUP BY EmployeID, Annee) AS temp JOIN Employes USING(EmployeID)
        
WHERE Classement BETWEEN 1 AND 3;






CREATE VIEW classement AS
SELECT EmployeID,EXTRACT (YEAR FROM dateVente) AS Annee, SUM(MontantTotal) AS CA, 
			   DENSE_RANK()
			   OVER (PARTITION BY EXTRACT (YEAR FROM dateVente)
			   ORDER BY SUM(MontantTotal) DESC) As Classement
		FROM Ventes
		GROUP BY EmployeID, Annee;

SELECT EmployeID, Annee, CA, Classement
FROM classement
WHERE Classement BETWEEN 1 AND 3;


/* 	Donner le top 3 des meilleurs clients en terme de chiffre d'affaire par trimestre (Quater) 
	pour chaque année*/

/*CA par client et par trimestre*/
SELECT ClientID, 
	EXTRACT (YEAR FROM dateVente) AS Annee, 
	EXTRACT(QUARTER FROM DateVente) as Trimestre, 
	AVG(MontantTotal) AS  "Chiffre Affaire" 
	
FROM Ventes
GROUP BY ClientID, EXTRACT (YEAR FROM dateVente), EXTRACT(QUARTER FROM DateVente);

SELECT ClientID, 
	    EXTRACT (YEAR FROM dateVente) AS Annee, 
	    EXTRACT(QUARTER FROM DateVente) as Trimestre, 
	    AVG(MontantTotal) AS "Chiffre Affaire",
	    RANK()
        OVER(
		    PARTITION BY EXTRACT (YEAR FROM dateVente), 
			EXTRACT(QUARTER FROM DateVente) 
			ORDER BY AVG(MontantTotal)) AS Classement
FROM Ventes
GROUP BY ClientID, EXTRACT (YEAR FROM dateVente), EXTRACT(QUARTER FROM DateVente);


SELECT ClientID, Annee, Trimestre, CA, Classement
FROM 
		(SELECT ClientID, 
			   EXTRACT (YEAR FROM dateVente) AS Annee, 
			   EXTRACT(QUARTER FROM DateVente) as Trimestre, 
			   AVG(MontantTotal) AS CA,
			   RANK()
			   OVER(PARTITION BY EXTRACT (YEAR FROM dateVente), EXTRACT(QUARTER FROM DateVente) ORDER BY AVG(MontantTotal)) AS Classement
		FROM Ventes
		GROUP BY ClientID, EXTRACT (YEAR FROM dateVente), EXTRACT(QUARTER FROM DateVente)) AS temp
        
WHERE Classement BETWEEN 1 AND 3; 




/* 	Utilisation de LAG: LAG(value_expression [, offset [, default]]) OVER ([partition_by_clause] 
	order_by_clause)*/


/* Donner la différence du chiffre d'affaire entre t et t-1*/
SELECT EXTRACT(YEAR FROM DateVente) as Annee, SUM(MontantTotal) as CA
FROM Ventes
GROUP BY Annee;

SELECT EXTRACT (YEAR FROM  DateVente) AS Annee, 
		SUM(MontantTotal) AS CA,
        SUM(MontantTotal) - LAG(SUM(MontantTotal),1,0)
        OVER(ORDER BY EXTRACT (YEAR FROM DateVente)) AS Diff
FROM Ventes
GROUP BY Annee;

/* Determiner le taux de croissance*/

SELECT 
    EXTRACT(YEAR FROM DateVente) AS Annee, 
    SUM(MontantTotal) AS CA,
    CASE 
        WHEN LAG(SUM(MontantTotal), 1, 0) OVER (ORDER BY EXTRACT(YEAR FROM DateVente)) = 0 THEN NULL
        ELSE (SUM(MontantTotal) - LAG(SUM(MontantTotal), 1, 0) OVER (ORDER BY EXTRACT(YEAR FROM DateVente))) / LAG(SUM(MontantTotal), 1, 0) OVER (ORDER BY EXTRACT(YEAR FROM DateVente))
    END AS Txcroissance
FROM Ventes
GROUP BY Annee
ORDER BY Annee;

/* Ajouter le montant total de l'année n-1*/

SELECT EXTRACT(YEAR FROM DateVente) as Annee, 
		SUM(MontantTotal) AS CA,
		LAG(SUM(MontantTotal),1,0) 
        OVER(ORDER BY EXTRACT(YEAR FROM DateVente)) as CAprecedent
FROM Ventes
GROUP BY Annee;



SELECT EXTRACT(YEAR FROM DateVente) as Annee, 
	   MAX(MontantTotal)
       OVER(PARTITION BY EXTRACT(YEAR FROM DateVente) ORDER BY SUM(MontantTotal) ) AS Maximum
FROM Ventes
GROUP BY Annee;



/* Quelle est le montant total des ventes par trimestres pour chaque année 
-- et comment les ventes évoluent d'un trimestre à l'autre*/
SELECT EXTRACT(YEAR FROM DateVente) AS Annee, 
	   EXTRACT (QUARTER FROM DateVente) AS Trimestre, 
	   SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY EXTRACT(YEAR FROM DateVente), EXTRACT (QUARTER FROM DateVente);



SELECT EXTRACT(YEAR FROM DateVente) AS Annee, 
	   EXTRACT (QUARTER FROM DateVente) AS Trimestre, 
	   SUM(MontantTotal) AS CA,
       SUM(MontantTotal) - LAG(SUM(MontantTotal), 1, 0)
       OVER(ORDER BY EXTRACT (QUARTER FROM DateVente), EXTRACT (QUARTER FROM DateVente)) as Evolution
FROM Ventes
GROUP BY EXTRACT(YEAR FROM DateVente), EXTRACT (QUARTER FROM DateVente);

/*==================================================================================
           Fonctions ensemblistes
==================================================================================*/
-- UNION: Combine les résultats de deux requêtes en éliminant les doublons.
/*
SELECT colonne FROM table1
UNION
SELECT colonne FROM table2;

Explication:
- L'opérateur UNION est utilisé pour combiner les résultats de deux requêtes distinctes.
- Il élimine les lignes en double pour ne retourner que des lignes distinctes.
- Les deux requêtes doivent avoir le même nombre de colonnes dans le résultat, avec des types de données compatibles.
*/

-- Quelle est la liste combinée des noms de tous les employés et de tous les clients ?


-- UNION ALL: Combine les résultats de deux requêtes en conservant les doublons.
/*
SELECT colonne FROM table1
UNION ALL
SELECT colonne FROM table2;

Explication:
- L'opérateur UNION ALL combine les résultats de deux requêtes sans éliminer les doublons.
- Cela peut être utile si vous souhaitez conserver toutes les lignes, y compris les répétitions.
- Comme pour UNION, les requêtes combinées doivent avoir des résultats avec le même nombre et type de colonnes.
*/

-- Quels sont tous les noms des employés et des clients, en incluant les noms répétés ?

-- INTERSECT: Retourne les lignes communes à deux requêtes.
/*
SELECT colonne FROM table1
INTERSECT
SELECT colonne FROM table2;

Explication:
- L'opérateur INTERSECT trouve les lignes qui sont communes aux deux requêtes.
- Il est moins fréquemment supporté que UNION et UNION ALL dans certains systèmes de gestion de bases de données.
- Les deux requêtes doivent avoir des structures de résultat compatibles.
*/

-- Quelles sont les employés ayant réalisé plus de 1000 euros de chiffres d'affaire et qui on réalisé plus de 10 ventes


-- EXCEPT ou MINUS: Retourne les lignes de la première requête qui ne sont pas présentes dans la seconde.
/*
SELECT colonne FROM table1
EXCEPT
SELECT colonne FROM table2;

Explication:
- L'opérateur EXCEPT (ou MINUS, selon le système de gestion de base de données) soustrait les résultats de la seconde requête de la première.
- Le résultat contient uniquement les lignes uniques de la première requête qui ne sont pas trouvées dans la seconde.
- Les deux requêtes doivent retourner le même nombre de colonnes avec des types de données compatibles.
*/


-- Quels employés n'ont jamais réalisé de vente ?
-- Quels employés n'ont pas géré de clients VIP ? (clients achete plus de 5000 euros)




/*==================================================================================
            Fonctions de fenêtrage
==================================================================================*/
-- Syntaxe de Base pour les Fonctions de Fenêtrage en SQL
/*
SELECT colonnes,
       FONCTION_DE_FENETRAGE() OVER (
           PARTITION BY colonne_de_partitionnement
           ORDER BY colonne_de_tri
           RANGE | ROWS BETWEEN debut AND fin
       ) AS nom_colonne_resultat
FROM table;

Explication:
- SELECT colonnes: Spécifie les colonnes à récupérer dans le résultat final, incluant la colonne résultante de la fonction de fenêtrage.
- FONCTION_DE_FENETRAGE() OVER (...): Applique une fonction de fenêtrage à un ensemble de lignes.
- PARTITION BY colonne_de_partitionnement: Divise les données en partitions pour le traitement par la fonction de fenêtrage.
- ORDER BY colonne_de_tri: Détermine l'ordre des lignes dans chaque partition.
- RANGE | ROWS BETWEEN debut AND fin: Définit le cadre de lignes pour l'application de la fonction.

*/

-- Rownumber: créer une requête qui permet d'afficher la table vente en ajoutant le numéro de la ligne
SELECT *,
		ROW_NUMBER()
        OVER(ORDER BY MontantTotal) AS NumeroLigne
FROM Ventes
ORDER BY MontantTotal;


-- Ajouter le rang avec RANK() et DENSE_RANK()
SELECT *,
		RANK()
        OVER(ORDER BY MontantTotal) AS Rang
FROM Ventes
ORDER BY MontantTotal;

SELECT *,
		DENSE_RANK()
        OVER(ORDER BY MontantTotal) AS Rang
FROM Ventes
ORDER BY MontantTotal;

/* LEAD LAG*/
-- Pour chaque année donner le CA de l'année précédente et le CA de l'année suivante
SELECT EXTRACT (YEAR FROM DateVente) AS Annee, SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY Annee;


SELECT  EXTRACT (YEAR FROM DateVente) AS Annee, 
	   SUM(MontantTotal) AS CA,
       LAG( SUM(MontantTotal),1,0)
       OVER(ORDER BY  EXTRACT (YEAR FROM DateVente)) AS CAPrecedent,
       LEAD(SUM(MontantTotal),1,0)
       OVER(ORDER BY  EXTRACT (YEAR FROM DateVente)) AS CASuivant
       
FROM Ventes
GROUP BY Annee;



/*FIRST_VALUE() et LAST_VALUE()*/
/*ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING: garantit que la fonction FIRST_VALUE() prend en compte toutes les lignes dans la fenêtre de partitionnement pour trouver le premier produit acheté*/


-- Pour chaque client quel était le premier produit qu'il a acheté
SELECT ClientID, 
	   ProduitID, 
       DateVente,
       FIRST_VALUE(ProduitID)
       OVER(PARTITION BY ClientID
				   ORDER BY DateVente
                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) As PremierAchat
FROM Ventes;


-- Pour chaque client quel était le dernier produit acheté
SELECT ClientID, 
	   ProduitID, 
       DateVente,
       LAST_VALUE(ProduitID)
       OVER(PARTITION BY ClientID
				   ORDER BY DateVente
                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) As DernierAchat
FROM Ventes;




/*==================================================================================
           Maitriser les CTE
==================================================================================*/

/*
Les CTE, ou 'Expressions de Table Communes', permettent de créer des ensembles de résultats temporaires accessibles dans une requête SELECT, INSERT, UPDATE ou DELETE. Elles sont définies avec le mot-clé WITH suivi du nom de la CTE et du mot-clé AS qui introduit la requête de la CTE.

Forme Générale:
WITH Nom_CTE AS (
    -- Requête de la CTE ici
)
SELECT * FROM Nom_CTE;

Utilisation :
- Simplifier les jointures complexes et les sous-requêtes.
- Activer la récursivité pour le traitement de données hiérarchiques.
- Améliorer la lisibilité et la maintenance du code SQL.

Note :
- Une CTE est valide uniquement dans le contexte d'une seule instruction SQL.
- Les CTEs récursives doivent inclure un UNION ALL entre les membres ancre et récursif.
- Plusieurs CTEs peuvent être définies dans une seule clause WITH, séparées par des virgules.
*/


-- écrire une requête qui permet d'obtenir le top 3 des meilleurs clients (en terme de CA) par année

-- Donner pour chaque client le chiffre d'affaires 
SELECT ClientID, SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY ClientID;

-- Donner pour chaque client le chiffre d'affaires  par année
SELECT ClientID,
	EXTRACT (YEAR FROM DateVente) AS Annee, SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY ClientID, Annee;

-- Classement par année
CREATE VIEW Temp as (
	SELECT ClientID,
		EXTRACT (YEAR FROM DateVente) AS Annee,
		SUM(MontantTotal) AS CA,
		RANK()
		OVER(PARTITION BY EXTRACT (YEAR FROM DateVente)
			ORDER BY SUM(MontantTotal) DESC) As Classement
	FROM Ventes
	GROUP BY ClientID, Annee);

SELECT *
FROM Temp
WHERE Classement BETWEEN 1 AND 3; 


-- Deuxième option : Sous requête
SELECT *
FROM (SELECT ClientID,
		EXTRACT (YEAR FROM DateVente) AS Annee,
		SUM(MontantTotal) AS CA,
		RANK()
		OVER(PARTITION BY EXTRACT (YEAR FROM DateVente)
			ORDER BY SUM(MontantTotal) DESC) As Classement
	FROM Ventes
	GROUP BY ClientID, Annee) As Temp
WHERE Classement BETWEEN 1 AND 3; 

-- Troisième option CTE
WITH tempCA AS (

	SELECT ClientID,
			EXTRACT (YEAR FROM DateVente) AS Annee,
			SUM(MontantTotal) AS CA,
			RANK()
			OVER(PARTITION BY EXTRACT (YEAR FROM DateVente)
				ORDER BY SUM(MontantTotal) DESC) As Classement
		FROM Ventes
		GROUP BY ClientID, Annee
)
SELECT *
FROM tempCA
WHERE Classement BETWEEN 1 AND 3;


WITH tempCA AS (

	SELECT ClientID,
			EXTRACT (YEAR FROM DateVente) AS Annee,
			SUM(MontantTotal) AS CA,
			RANK()
			OVER(PARTITION BY EXTRACT (YEAR FROM DateVente)
				ORDER BY SUM(MontantTotal) DESC) As Classement
		FROM Ventes
		GROUP BY ClientID, Annee
)
SELECT *
FROM tempCA
WHERE Classement BETWEEN 1 AND  3 ;


-- Liste des clients qui ont dépensé plus que la moyenne des dépenses de tous les clients:

-- Donner pour chaque client le chiffre d'affaires 
WITH temp1 AS (

SELECT ClientID, SUM(MontantTotal) AS CA
FROM Ventes
GROUP BY ClientID

)
SELECT *
FROM temp1
WHERE CA > (SELECT AVG(MontantTotal) AS Moyenne FROM Ventes);

SELECT *
FROM (
	SELECT ClientID, SUM(MontantTotal) AS CA
	FROM Ventes
	GROUP BY ClientID) as temp
WHERE CA >(SELECT AVG(MontantTotal) AS Moyenne FROM Ventes);

SELECT AVG(MontantTotal) AS Moyenne FROM Ventes;

SELECT ClientID, MontantTotal 
FROM Ventes
WHERE MontantTotal > (SELECT AVG(MontantTotal) AS Moyenne FROM Ventes);

SELECT AVG(MontantTotal) AS Moyenne FROM Ventes;

/*==================================================================================
           Fonctions ensemblistes
==================================================================================*/

/* CTE Réutilisable
WITH CTE1 AS (
    SELECT * FROM TableA
), CTE2 AS (
    SELECT * FROM TableB
)
SELECT * FROM CTE1
UNION ALL
SELECT * FROM CTE2;
*/

-- UNION: Combine les résultats de deux requêtes en éliminant les doublons.
/*
SELECT colonne FROM table1
UNION
SELECT colonne FROM table2;

Explication:
- L'opérateur UNION est utilisé pour combiner les résultats de deux requêtes distinctes.
- Il élimine les lignes en double pour ne retourner que des lignes distinctes.
- Les deux requêtes doivent avoir le même nombre de colonnes dans le résultat, avec des types de données compatibles.
*/

-- Quelle est la liste combinée des noms de tous les employés et de tous les clients ?
SELECT Nom
FROM Employes
UNION
SELECT Nom
FROM Clients;

/* Ajouter le nom des fournisseurs */
SELECT Nom
FROM Employes

UNION

SELECT Nom
FROM Clients

UNION

SELECT NomFournisseur AS Nom
FROM Fournisseurs;

-- Nom et prenom de tous les employés
SELECT Nom,Prenom
FROM Employes

UNION

SELECT Nom,Prenom
FROM Clients;

WITH NomClients AS (SELECT Nom,Prenom
					FROM Employes),
                    
	 NomEmployes AS (SELECT Nom, Prenom
					 FROM Employes)
			
SELECT * 
FROM NomClients

UNION 

SELECT * 
FROM NomEmployes;



/*
A = (a,b,c,d) B= (e,f,g)
A UNION B
(a,b,c,d,e,f,g)*/
-- UNION ALL: Combine les résultats de deux requêtes en conservant les doublons.

/*
SELECT colonne FROM table1
UNION ALL
SELECT colonne FROM table2;

Explication:
- L'opérateur UNION ALL combine les résultats de deux requêtes sans éliminer les doublons.
- Cela peut être utile si vous souhaitez conserver toutes les lignes, y compris les répétitions.
- Comme pour UNION, les requêtes combinées doivent avoir des résultats avec le même nombre et type de colonnes.
*/

SELECT Nom,Prenom
FROM Employes

UNION ALL 

SELECT Nom,Prenom
FROM Clients;

-- Quels sont tous les noms des employés et des clients, en incluant les noms répétés ?
/*
(1,3,5,6) = A
(3,6,2,7)= B
A UNION B (1,3,5,6,2,7)
A INTERSECT B (3,6)*/


-- INTERSECT: Retourne les lignes communes à deux requêtes.
/*
SELECT colonne FROM table1
INTERSECT
SELECT colonne FROM table2;

Explication:
- L'opérateur INTERSECT trouve les lignes qui sont communes aux deux requêtes.
- Il est moins fréquemment supporté que UNION et UNION ALL dans certains systèmes de gestion de bases de données.
- Les deux requêtes doivent avoir des structures de résultat compatibles.
*/


-- Quelles sont les employés ayant réalisé plus de 1000 euros de chiffres d'affaire et qui ont réalisé plus de 10 ventes


-- EXCEPT ou MINUS: Retourne les lignes de la première requête qui ne sont pas présentes dans la seconde.
/*
SELECT colonne FROM table1
EXCEPT
SELECT colonne FROM table2;

Explication:
- L'opérateur EXCEPT (ou MINUS, selon le système de gestion de base de données) soustrait les résultats de la seconde requête de la première.
- Le résultat contient uniquement les lignes uniques de la première requête qui ne sont pas trouvées dans la seconde.
- Les deux requêtes doivent retourner le même nombre de colonnes avec des types de données compatibles.
*/


-- Quels employés n'ont jamais réalisé de vente ?
-- Première approche

SELECT *
FROM Employes
WHERE EmployeID NOT IN (SELECT EmployeID FROM Ventes);





-- Quels employés n'ont pas géré de clients VIP ? (clients achete plus de 5000 euros)

/*CTE Recursive

WITH RECURSIVE CTERecursive (colonne) AS (
    SELECT colonne FROM TableInitiale WHERE condition
    UNION ALL
    SELECT t.colonne FROM TableInitiale t INNER JOIN CTERecursive c ON t.condition = c.colonne
)
SELECT * FROM CTERecursive;
*/




/*
INSERT INTO table (colonne1, colonne2, ..., colonneN)
VALUES (valeur1, valeur2, ..., valeurN);

Explication:
- INSERT INTO table: Déclare l'intention d'insérer des données dans la table spécifiée.
- (colonne1, colonne2, ..., colonneN): Spécifie les colonnes cibles pour l'insertion. L'ordre des colonnes doit correspondre à l'ordre des valeurs fournies.
- VALUES (valeur1, valeur2, ..., valeurN): Définit les valeurs à insérer pour les colonnes spécifiées. Chaque ensemble de valeurs entre parenthèses représente une ligne à insérer dans la table.

Variantes:
1. Insertion de multiples lignes:
   INSERT INTO table (colonne1, colonne2)
   VALUES (valeur1A, valeur2A),
          (valeur1B, valeur2B),
          ...;
   - Cette syntaxe permet d'insérer plusieurs lignes en une seule commande, en séparant chaque ensemble de valeurs par des virgules.

2. Insertion à partir d'une sélection:
   INSERT INTO table1 (colonne1, colonne2)
   SELECT colonneA, colonneB
   FROM table2
   WHERE condition;
   - Cette méthode permet d'insérer des données dans table1 directement à partir d'un sous-ensemble de données sélectionnées dans table2 ou toute autre table, en fonction d'une condition spécifiée.

Conseils:
- Assurez-vous que les types de données des valeurs correspondent aux types de données des colonnes.
- Lors de l'insertion de données dans une table avec une colonne ID auto-incrémentée, il n'est pas nécessaire de spécifier une valeur pour cette colonne, sauf si vous souhaitez écraser le comportement auto-incrémenté.
- Utilisez la clause ON DUPLICATE KEY UPDATE pour mettre à jour la ligne si l'insertion aboutit à un doublon de clé primaire ou unique.

*/


/* Ajout d'un nouvel employe*/

INSERT INTO Employes(EmployeID,Nom,Prenom,Email,NumeroTelephone)
VALUES (200,'Abdelaz','Grek','temp@gmail.com',0978349);

-- Remplacer tous les produits <200 par 100

UPDATE Produits
SET PrixUnitaire=100
WHERE NomProduit =  'Nike Air Max' ;


/*
UPDATE table
SET colonne1 = nouvelle_valeur1,
    colonne2 = nouvelle_valeur2,
    ...
WHERE condition_de_filtrage;

Explication:
- UPDATE table: Déclare l'intention de mettre à jour des données dans la table spécifiée.
- SET colonne1 = nouvelle_valeur1, ... : Spécifie les colonnes à mettre à jour et les nouvelles valeurs à leur attribuer. Vous pouvez mettre à jour une ou plusieurs colonnes en même temps.
- WHERE condition_de_filtrage: Détermine les lignes à mettre à jour grâce à une condition spécifiée. Si la clause WHERE est omise, toutes les lignes de la table seront mises à jour, ce qui n'est généralement pas recommandé.

Variantes:
1. Mise à jour conditionnelle:
   UPDATE table
   SET colonne = nouvelle_valeur
   WHERE colonne_condition = certaine_valeur;
   - Cette syntaxe permet de mettre à jour des lignes spécifiques qui correspondent à la condition énoncée dans la clause WHERE.

2. Mise à jour avec jointures:
   UPDATE table1
   JOIN table2 ON table1.colonne_jointure = table2.colonne_jointure
   SET table1.colonne = nouvelle_valeur
   WHERE table2.colonne_condition = certaine_valeur;
   - Permet de mettre à jour une table en se basant sur les données d'une autre table, en utilisant une condition de jointure.

Conseils:
- Faites preuve de prudence avec la clause WHERE pour éviter de mettre à jour plus de lignes que prévu.
- Il est souvent utile de tester votre clause WHERE avec une commande SELECT avant de l'exécuter avec UPDATE, pour s'assurer qu'elle sélectionne les bonnes lignes.
- Pour des raisons de performance, essayez de limiter le nombre de colonnes mises à jour uniquement à celles qui doivent réellement être changées.
- Pensez à utiliser des transactions pour regrouper plusieurs opérations de mise à jour en une seule unité de travail, permettant ainsi de les annuler toutes ensemble en cas d'erreur.

*/



/*
UPDATE table
SET colonne1 = nouvelle_valeur1,
    colonne2 = nouvelle_valeur2,
    ...
WHERE condition_de_filtrage;

Explication:
- UPDATE table: Déclare l'intention de mettre à jour des données dans la table spécifiée.
- SET colonne1 = nouvelle_valeur1, ... : Spécifie les colonnes à mettre à jour et les nouvelles valeurs à leur attribuer. Vous pouvez mettre à jour une ou plusieurs colonnes en même temps.
- WHERE condition_de_filtrage: Détermine les lignes à mettre à jour grâce à une condition spécifiée. Si la clause WHERE est omise, toutes les lignes de la table seront mises à jour, ce qui n'est généralement pas recommandé.

Variantes:
1. Mise à jour conditionnelle:
   UPDATE table
   SET colonne = nouvelle_valeur
   WHERE colonne_condition = certaine_valeur;
   - Cette syntaxe permet de mettre à jour des lignes spécifiques qui correspondent à la condition énoncée dans la clause WHERE.

2. Mise à jour avec jointures:
   UPDATE table1
   JOIN table2 ON table1.colonne_jointure = table2.colonne_jointure
   SET table1.colonne = nouvelle_valeur
   WHERE table2.colonne_condition = certaine_valeur;
   - Permet de mettre à jour une table en se basant sur les données d'une autre table, en utilisant une condition de jointure.

Conseils:
- Faites preuve de prudence avec la clause WHERE pour éviter de mettre à jour plus de lignes que prévu.
- Il est souvent utile de tester votre clause WHERE avec une commande SELECT avant de l'exécuter avec UPDATE, pour s'assurer qu'elle sélectionne les bonnes lignes.
- Pour des raisons de performance, essayez de limiter le nombre de colonnes mises à jour uniquement à celles qui doivent réellement être changées.
- Pensez à utiliser des transactions pour regrouper plusieurs opérations de mise à jour en une seule unité de travail, permettant ainsi de les annuler toutes ensemble en cas d'erreur.

*/


/* Pour Supprimer la table*/
/* DROP TABLE table; our DROP TABLE IF EXISTS table;



/*-- Supprime la colonne des colonnes
ALTER TABLE table
DROP COLUMN colonne;*/

-- Supprimer prixUnitaire
ALTER TABLE Produits
DROP COLUMN NomProduit;

/*Supprimer plusieurs colonnes
ALTER TABLE table
DROP COLUMN colonne1
DROP COLUMN colonne1;;*/


/*Modifie le nom de la colonne `ancien_nom` en `nouveau_nom` dans la table `ma_table`: RENAME
ALTER TABLE ma_table
CHANGE COLUMN ancien_nom nouveau_nom nouveau_type;*/

DROP TABLE IF EXISTS table;















































































