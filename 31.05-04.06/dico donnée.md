Produit
- categorie : Varchar(25)
- prix : decimal(5.2)
- reference interne : varchar(10)
- code EAN : int ()
- stock physique : int()
- stock alerte : int()
- couleur : varchar(25)
- libellé : varchar (25)
- Description : varchar (255)
- date d'ajout : date et heure
- Date modif : date et heure
- nom du fichier photo : varchar (50)
- disponibilité : booleen

Categorie
- Nom : varchar(25)

Sous categorie
- Nom : varchar(25)

Fournisseur
- Nom : varchar(25)

Commercial
- Nom : varchar(25)

Client
- Coordonnées
   - nom : varchar(25)
   - prenom : varchar(25)
   - adresse : varchar(100)
   - ville : varchar(25)
   - CP : varchar(5)
   - telephone : int
- Mot de passe : varchar(25)
- Date d'ajout : date et heure
- Date de modification : date et heure

Commandes
- Suivi de paiements
  - Date de paiement : date et heure
  - Montant du paiement : decimal(6.2)
  - type de paiement (booleen)
- Suivi de livraisons
  - Date d'expedition : date et heure
  - Date de livraison : date et heure
  - Livreur : varchar (20)

Lignes de commandes
- Remise

Employés
    - Poste : Varchar(25)
    - Magasin : Varchar(25)
    - Service : Varchar(25)
    - Salaire Brut Annuel : Décimal(7,2)
    - Ancienneté : Entier
    - Sexe : Varchar(1)
    - Nombre d'enfants : Entier
    - Supérieur : Entier 