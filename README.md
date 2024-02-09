# Database_Postgres

+-------------+     +----------------------+     +------------+
|   Clients   |     |     Fournisseurs     |     |  Employes   |
+-------------+     +----------------------+     +------------+
| ClientID    |     | FournisseurID        |     | EmployeID   |
| Nom         |     | NomFournisseur       |     | Nom         |
| Prenom      |     | Adresse              |     | Prenom      |
| Adresse     |     | Email                |     | Fonction    |
| Email       |     | NumeroTelephone      |     | Email       |
| NumeroTel   |     +----------------------+     | NumeroTel   |
+-------------+                                +------------+
        |                                           |
        |                                           |
        v                                           v
+-------------+                                +------------+
|   Produits  |                                |   Ventes   |
+-------------+                                +------------+
| ProduitID   |                                | VenteID    |
| NomProduit   |                               | DateVente  |
| Description |                               | Quantite   |
| PrixUnitaire |                               | Montant    |
| FournisseurID|                               | ClientID   |
+-------------+                               | ProduitID  |
                                               | EmployeID  |
                                               +------------+
