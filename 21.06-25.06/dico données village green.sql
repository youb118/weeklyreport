
FOURNISSEUR
ID (Compteur)
Nom (varchar 50) 
Ville (varchar 50) 
Adresse (varchar 200) 
Code Postal (char 5) 
Type de fournisseur (constructeur/importateur) booleen
Téléphone (entier) 
Mail (varchar 255)

CLIENT
ID (Compteur)
Nom (varchar 50) 
Prénom (varchar 50) 
Adresse (varchar 50) 
Code postal (char 5) 
Ville (varchar 50) 
Téléphone (entier) 
Mail (varchar 255) 
Adresse de livraison (varchar 255) 
Ville de livraison (varchar 50)
Code postal de livraison (char 5)
type de client varchar 255


Employé commerciaux
ID (Compteur)
Nom (varchar 50) 
Prénom (varchar 50) 
Téléphone(Entier) 
Mail(varchar 50) 
Fonction (varchar 50)

PRODUITS
ID (Compteur)
Prix vente (Décimal)
prix achat  (Décimal)
Référence (varchar 50) 
Libelle court (varchar 255) 
libellé Long (varchar 255) 
Photo (varchar 50) 
Stock alerte (Entier)
stock physique (entier)

COMMANDE
ID (Compteur)
date commande (Date) 
etat commande(varchar 50)
prix total (decimal)

Ligne de commande 

- ID (Compteur)
- Quantité commandé (Int)
- Prix unitaire(Decimal)

Livraison

ID (Compteur)
Adresse (varchar 250) 
Quantité du produit livré (Entier) 
Date expedition (Date) 
Date livraison (Date)

Catégorie Produit

ID (Compteur)
Nom (varchar 50) 

Sous-catégorie
ID (Compteur NOT NULL)
Nom (Varchar(25))

Facturation
ID(Compteur NOT NULL)
Réduction (Int)
Réduction supplémentaire (Int)
Date de facturation (Date)
Montant total facture (decimal)
Etat de la facture VARCHAR(50)
Type de paiement VARCHAR(50)
