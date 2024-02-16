# Introduction à SQL et aux Bases de Données Relationnelles

Comprendre ce qu'est SQL et son rôle dans la gestion des bases de données.
Apprendre sur les bases de données relationnelles et leurs composants.
Étudier les commandes SQL de base : SELECT, INSERT, UPDATE, DELETE.
Pratiquer l'écriture de requêtes simples et la récupération de données depuis une base de données.

**Exemple :**
Écrire une requête SQL pour récupérer toutes les colonnes de la table "clients".

**Questions de pratique :**
1. Écrire une requête SQL pour insérer un nouvel enregistrement dans la table "employés". 
2. Écrire une requête SQL pour mettre à jour la colonne "quantité" de la table "produits" à 10 où "product_id" est 5.
3. Écrire une requête SQL pour supprimer tous les enregistrements de la table "commandes" où le "statut" est 'annulé'.

**Réponse :**

1. Requête SQL pour insérer un nouvel enregistrement dans la table "employés":
	```sql
	SELECT * FROM clients;
	```
	
2. Requête SQL pour mettre à jour la colonne "quantité" de la table "produits" à 10 où "product_id" est 5:
	```sql 
	UPDATE produits SET quantité = 10 WHERE produit_id = 5;
	```
	
1. Requête SQL pour supprimer tous les enregistrements de la table "commandes" où le "statut" est 'annulé':
```sql
	DELETE FROM commandes WHERE statut = 'annulé';
```
	
