-- Database: COMMERCE

-- DROP DATABASE IF EXISTS "COMMERCE";

CREATE DATABASE "COMMERCE"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'French_France.1252'
    LC_CTYPE = 'French_France.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "COMMERCE"
    IS 'Une base de données commerce, pour s''exercer en SQL';
	
-- Création du schéma COM
CREATE SCHEMA COM;

-- Définir le schéma par défaut pour les nouvelles tables
SET search_path TO COM;


-- Création de la table Clients dans le schéma COM
CREATE TABLE COM.Clients (
    client_id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    email VARCHAR(255)
);

-- Création de la table Employes dans le schéma COM
CREATE TABLE COM.Employes (
    employe_id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    salaire INTEGER
);


-- Création de la table Categories dans le schéma COM
CREATE TABLE COM.Categories (
    categorie_id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);

-- Création de la table Fournisseurs dans le schéma COM
CREATE TABLE COM.Fournisseurs (
    fournisseur_id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);


-- Création de la table Produits dans le schéma COM
CREATE TABLE COM.Produits (
    produit_id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    prix INTEGER,
    quantite INTEGER,
    categorie_id INTEGER REFERENCES COM.Categories(categorie_id),
    fournisseur_id INTEGER REFERENCES COM.Fournisseurs(fournisseur_id)
);

-- Création de la table Commandes dans le schéma COM
CREATE TABLE COM.Commandes (
    commande_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES COM.Clients(client_id),
    commande_date DATE,
    statut VARCHAR(255)
);

-- Création de la table Commandes_Items dans le schéma COM
CREATE TABLE COM.Commandes_Items (
    commandes_id INTEGER REFERENCES COM.Commandes(commande_id),
    produit_id INTEGER REFERENCES COM.Produits(produit_id),
    quantite INTEGER
);


-- Création de la table Inventaires dans le schéma COM
CREATE TABLE COM.Inventaires (
    produit_id INTEGER PRIMARY KEY REFERENCES COM.Produits(produit_id),
    disponible_quantite INTEGER
);

-- Insertion de données dans la table COM.Clients
INSERT INTO COM.Clients (nom, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Michael Johnson', 'michael@example.com'),
('Emily Davis', 'emily@example.com'),
('Chris Brown', 'chris@example.com'),
('Megan Taylor', 'megan@example.com'),
('Daniel White', 'daniel@example.com'),
('Sophia Moore', 'sophia@example.com'),
('Matthew Anderson', 'matthew@example.com'),
('Olivia Wilson', 'olivia@example.com'),
('Aiden Miller', 'aiden@example.com'),
('Emma Jones', 'emma@example.com'),
('James Harris', 'james@example.com'),
('Lily Martinez', 'lily@example.com'),
('Ethan Taylor', 'ethan@example.com'),
('Ava Johnson', 'ava@example.com'),
('Noah Smith', 'noah@example.com'),
('Isabella Davis', 'isabella@example.com'),
('Lucas Brown', 'lucas@example.com'),
('Amelia Wilson', 'amelia@example.com'),
('Logan Taylor', 'logan@example.com'),
('Sophie Anderson', 'sophie@example.com'),
('Jackson Harris', 'jackson@example.com'),
('Aria Martinez', 'aria@example.com');





-- Insertion de données dans la table COM.Produits (continuation)
INSERT INTO  Produits (nom, prix, quantite) VALUES
('Laptop', 1000, 10),
('Mobile', 800, 15),
('Headphones', 100, 50),
('Keyboard', 50, 20),
('Mouse', 20, 30),
('Monitor', 300, 20),
('Camera', 600, 10),
('External Hard Drive', 120, 25),
('Printer Paper', 10, 100),
('Desk Chair', 150, 15),
('Desk', 200, 10),
('Backpack', 30, 40),
('Sunglasses', 50, 30),
('Watch', 100, 20),
('Wallet', 25, 50),
('T-shirt', 15, 60),
('Jeans', 40, 25),
('Sneakers', 50, 35),
('Backpack', 30, 40),
('Bedding Set', 80, 15),
('Dining Table', 250, 8),
('Couch', 300, 5),
('Bookshelf', 80, 12),
('Alarm Clock', 10, 50);

SELECT * FROM produits; 

-- Insertion de données dans la table COM.Categories
INSERT INTO COM.Categories (nom) VALUES
('Furniture'),
('Clothing'),
('Electronics'),
('Home Decor'),
('Kitchen Appliances'),
('Toys'),
('Books'),
('Shoes'),
('Sports Equipment'),
('Beauty Products'),
('Jewelry'),
('Automotive'),
('Garden Supplies'),
('Office Furniture'),
('Musical Instruments'),
('Pet Supplies'),
('Fitness Equipment'),
('Health and Wellness'),
('Outdoor Gear'),
('Baby Products'),
('Party Supplies'),
('Craft Supplies'),
('Travel Accessories'),
('Art and Craft'),
('Stationery');


-- Insertion de données dans la table COM.Fournisseurs
INSERT INTO Fournisseurs (nom) VALUES
('Aplha Reach'),
('Global Space'),
('Tech Solutions'),
('Innovate Producers'),
('Modern Electronics'),
('Mega Suppliers'),
('Trade Masters'),
('Global Innovations'),
('Eco Gadgets'),
('Tech World'),
('Supreme Tech'),
('Future Products'),
('Smart Innovations'),
('Epic Suppliers'),
('Quantum Ventures'),
('Infinite Tech'),
('Alpha Connections'),
('Tech Universe'),
('Galactic Supplies'),
('Quantum Tech'),
('Future Tech'),
('Tech Solutions Plus'),
('Digital Innovators'),
('Cosmic Creations'),
('Global Innovations Plus');


-- Insertion de données dans la table COM.Employes
INSERT INTO COM.Employes (nom, salaire) VALUES
('Aditi Shenoy', 50000),
('Vineeta Sarkar', 60000),
('Shami Bhandari', 40000),
('Gauri Chana', 60000),
('Ananya Ray', 55000),
('John Smith', 70000),
('Emma Johnson', 65000),
('Michael Davis', 75000),
('Sophia White', 55000),
('Matthew Anderson', 60000),
('Olivia Wilson', 50000),
('William Brown', 70000),
('Ava Jones', 60000),
('Ethan Taylor', 55000),
('Mia Miller', 65000),
('Daniel Harris', 60000),
('Lily Martinez', 50000),
('Logan Taylor', 70000),
('Sophie Anderson', 60000),
('Jackson Harris', 55000),
('Aria Martinez', 65000),
('Noah Smith', 60000),
('Isabella Davis', 50000),
('Lucas Brown', 70000);

-- Insertion de données dans la table COM.Inventaires
INSERT INTO Inventaires (produit_id, disponible_quantite) VALUES
(1, 25),
(2, 30),
(3, 40),
(4, 15),
(5, 10),
(6, 50),
(7, 22),
(8, 18),
(9, 33),
(10, 28),
(11, 12),
(12, 5),
(13, 40),
(14, 20),
(15, 7),
(16, 15),
(17, 30),
(18, 25),
(19, 18),
(20, 22),
(21, 10),
(22, 13),
(23, 28),
(24, 35);

-- Insertion de données dans la table COM.Commandes
INSERT INTO COM.Commandes (client_id, commande_date, statut) VALUES
(1, '2023-06-01', 'pending'),
(2, '2023-06-05', 'complete'),
(3, '2023-06-10', 'pending'),
(4, '2023-06-15', 'complete'),
(5, '2023-06-20', 'pending'),
(6, '2023-06-25', 'complete'),
(7, '2023-07-01', 'pending'),
(3, '2023-07-05', 'complete'),
(4, '2023-07-10', 'pending'),
(5, '2023-07-15', 'complete'),
(1, '2023-07-20', 'pending'),
(2, '2023-07-25', 'complete'),
(3, '2023-08-01', 'pending'),
(4, '2023-08-05', 'complete'),
(5, '2023-08-10', 'pending'),
(1, '2023-08-15', 'complete'),
(2, '2023-08-20', 'pending'),
(3, '2023-08-25', 'complete'),
(4, '2023-09-01', 'pending'),
(5, '2023-09-05', 'complete'),
(1, '2023-09-10', 'pending'),
(2, '2023-09-15', 'complete'),
(3, '2023-09-20', 'pending'),
(4, '2023-09-25', 'complete');

 
-- Insertion de données dans la table COM.Commandes_Items
INSERT INTO COM.Commandes_Items (commandes_id, produit_id, quantite) VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 1),
(2, 4, 2),
(3, 5, 1),
(3, 2, 1),
(4, 1, 3),
(4, 3, 2),
(5, 4, 1),
(5, 5, 2),
(6, 1, 1),
(6, 4, 1),
(7, 2, 2),
(7, 5, 1),
(8, 3, 1),
(8, 4, 2),
(9, 1, 2),
(9, 2, 1),
(10, 3, 3),
(10, 4, 1),
(11, 5, 2),
(11, 1, 1),
(12, 2, 3),
(12, 4, 2),
(13, 3, 1),
(13, 5, 2),
(14, 4, 1),
(14, 1, 1),
(15, 2, 2),
(15, 3, 1),
(16, 5, 3),
(16, 1, 2),
(17, 4, 1),
(17, 2, 1),
(18, 1, 1),
(18, 3, 2),
(19, 5, 2),
(19, 4, 1),
(20, 2, 1),
(20, 3, 3),
(21, 1, 1),
(21, 5, 2),
(22, 2, 2),
(22, 4, 1),
(23, 3, 1),
(23, 1, 2),
(24, 5, 1),
(24, 2, 1);
 





/*
Requête SQL pour mettre à jour la colonne "quantité" de la table "produits" à 10 où "product_id" est 5:
*/

UPDATE produits SET quantite = 10 WHERE produit_id = 5;

/*
Requête SQL pour supprimer tous les enregistrements de la table "commandes" où le "statut" est 'annulé':
*/

DELETE 
FROM commandes
WHERE statut ='annulé';

/*
1. Écrire une requête SQL pour récupérer toutes les colonnes de la table "produits" où la "catégorie" est 'Électronique' et le "prix" est inférieur à 1000.

*/
SELECT * FROM produits ;

SELECT *
FROM COM.Produits
JOIN COM.Categories ON COM.Produits.categorie_id = COM.Categories.categorie_id
WHERE COM.Categories.nom = 'Electronic' OR COM.Produits.prix < 300;
 
 
/*
2. Écrire une requête SQL pour récupérer les noms de tous les clients de la table "clients" par ordre alphabétique.
*/
 
SELECT nom FROM clients ORDER BY nom;
 
/*
3. Écrire une requête SQL pour récupérer le nombre total de commandes de la table "commandes".
*/
 
SELECT COUNT(*) AS total_commandes FROM commandes;



SELECT clients.nom AS nom , commandes.montant AS montant_commande
FROM COM.Clients clients
JOIN COM.Commandes commandes ON clients.client_id = commandes.client_id
WHERE commandes.montant > 1000;



