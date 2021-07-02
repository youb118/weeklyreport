/*  Vue correspondant à la jointure Produits - Fournisseurs */
/* Pour la clareté de la vue, seul les informations essentiel sont affichées*/
/*un right join est utilisé, pour faire connaitre les fournisseurs du magasin ne fournissant pas encore de produit*/

DROP VIEW IF EXISTS v_Prod_Four ;

CREATE VIEW v_Prod_Four;
AS
SELECT pro_ref as 'Référence Produit', pro_libelle_court as 'Libelle produit', pro_prix_vente as 'Prix produit',pro_stock_phy as 'Stock produit',
        fou_nom as 'Nom du fournisseur', fou_ville as 'Ville du fournisseur', fou_type as 'type de fournisseur',
FROM produits right join fournisseur on pro_fou_id = fou_id
order by fou_nom;


/*Affichage des vues de la base village_green */
/*
SELECT * 
FROM information_schema.views
WHERE table_schema = 'village_green'; 
*/
