# Filtrage et Tri des Données

- Apprendre sur la clause WHERE et son utilisation pour le filtrage des données.
- Étudier la clause ORDER BY pour le tri des données.
- Pratiquer l'écriture de requêtes avec le filtrage et le tri.

**Exemple :**
Écrire une requête SQL pour récupérer toutes les colonnes de la table "employés" où le "salaire" est supérieur à 5000.

**Questions de pratique :**

1. Écrire une requête SQL pour récupérer toutes les colonnes de la table "produits" où la "catégorie" est 'Électronique' et le "prix" est inférieur à 1000.

```sql
SELECT * FROM produits WHERE catégorie = 'Électronique' AND prix < 1000;
```

2. Écrire une requête SQL pour récupérer les noms de tous les clients de la table "clients" par ordre alphabétique.

```sql
SELECT nom FROM clients ORDER BY nom;
```

3. Écrire une requête SQL pour récupérer le nombre total de commandes de la table "commandes".

```sql
SELECT COUNT(*) AS total_commandes FROM commandes;
```

N'oubliez pas d'ajuster les noms de table et les conditions en fonction de votre propre schéma de base de données.