# Joindre des Tables

 - Comprendre le concept de jointure de tables.
- Apprendre les différents types de jointures : INNER JOIN, LEFT JOIN, RIGHT JOIN et FULL JOIN.
- Pratiquer l'écriture de requêtes impliquant la jointure de plusieurs tables.

**Exemple :**
Écrire une requête SQL pour récupérer le nom du client et la date de commande des tables "clients" et "commandes", en les joignant sur la colonne "customer_id".

**Questions de pratique :**

1. Écrire une requête SQL pour récupérer le nom du produit, la catégorie et le nom du fournisseur des tables "produits", "catégories" et "fournisseurs", en les joignant sur les colonnes appropriées.

```sql
SELECT produits.nom AS nom_produit, categories.nom AS categorie, fournisseurs.nom AS nom_fournisseur
FROM COM.Produits produits
JOIN COM.Categories categories ON produits.categorie_id = categories.categorie_id
JOIN COM.Fournisseurs fournisseurs ON produits.fournisseur_id = fournisseurs.fournisseur_id;

```

2. Écrire une requête SQL pour récupérer le nom de l'employé et le nom du département des tables "employés" et "départements", en les joignant sur la colonne "department_id".

```sql
SELECT employes.nom AS nom_employe, departements.nom AS nom_departement
FROM COM.Employes employes
JOIN COM.Departements departements ON employes.department_id = departements.department_id;

```

3. Écrire une requête SQL pour récupérer le nom du client et le montant de la commande des tables "clients" et "commandes", en les joignant sur la colonne "customer_id", et en incluant uniquement les commandes dont le montant est supérieur à 1000.

```sql
SELECT clients.nom AS nom_client, commandes.montant AS montant_commande
FROM COM.Clients clients
JOIN COM.Commandes commandes ON clients.client_id = commandes.client_id
WHERE commandes.montant > 1000;

```

 