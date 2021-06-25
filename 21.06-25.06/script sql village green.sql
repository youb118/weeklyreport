
drop database if exists Village_Green;

create database Village_Green;

use Village_Green;

CREATE TABLE fournisseur(
   fou_id Int(10) NOT NULL AUTO_INCREMENT,
   fou_nom VARCHAR(50) NOT NULL,
   fou_ville VARCHAR(50) NOT NULL,
   fou_adresse VARCHAR(255) NOT NULL,
   fou_zipcode VARCHAR(5) NOT NULL,
   fou_type VARCHAR(50) NOT NULL,
   fou_phone INT,
   fou_mail VARCHAR(255) NOT NULL,
   PRIMARY KEY(fou_id)
);

CREATE TABLE employe(
   emp_id  Int(10) NOT NULL AUTO_INCREMENT,
   emp_nom VARCHAR(50) NOT NULL,
   emp_prenom VARCHAR(50) NOT NULL,
   emp_phone INT NOT NULL,
   emp_fontion VARCHAR(50) NOT NULL,
   emp_mail VARCHAR(100) NOT NULL,
   PRIMARY KEY(emp_id)
);

CREATE TABLE categorie(
   cat_id  Int(10) NOT NULL AUTO_INCREMENT,
   cat_nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(cat_id)
);

CREATE TABLE client(
   cli_id  Int(10) NOT NULL AUTO_INCREMENT,
   cli_nom VARCHAR(50) NOT NULL,
   cli_prenom VARCHAR(50) NOT NULL,
   cli_adresse VARCHAR(255) NOT NULL,
   cli_zipcode VARCHAR(5) NOT NULL,
   cli_ville VARCHAR(20) NOT NULL,
   cli_phone INT NOT NULL,
   cli_mail VARCHAR(100) NOT NULL,
   cli_adr_livraison VARCHAR(255) NOT NULL,
   cli_ville_livraison VARCHAR(50) NOT NULL,
   cli_zipcode_livr VARCHAR(5) NOT NULL,
   cli_type VARCHAR(255) NOT NULL,
   cli_emp_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(cli_emp_id) REFERENCES Employé(emp_id)
);

CREATE TABLE commande(
   com_id  Int(10) NOT NULL AUTO_INCREMENT,
   com_date DATE NOT NULL,
   com_etat VARCHAR(50) NOT NULL,
   com_prix_total DECIMAL(8,2) NOT NULL,
   com_cli_id INT NOT NULL,
   PRIMARY KEY(com_id),
   FOREIGN KEY(com_cli_id) REFERENCES Client(cli_id)
);

CREATE TABLE facturation(
   fac_id Int(10) NOT NULL AUTO_INCREMENT,
   fac_reduction INT,
   fac_reduc_sup INT,
   fac_date DATE,
   fac_total DECIMAL(8,2) NOT NULL,
   fac_etat VARCHAR(50) NOT NULL,
   fac_type_paiement VARCHAR(50) NOT NULL,
   fac_com_id INT NOT NULL,
   PRIMARY KEY(fac_id),
   FOREIGN KEY(fac_com_id) REFERENCES commande(com_id)
);

CREATE TABLE sous_categorie(
   sc_id  Int(10) NOT NULL AUTO_INCREMENT,
   sc_nom VARCHAR(50) NOT NULL,
   sc_cat_id INT NOT NULL,
   PRIMARY KEY(sc_id),
   FOREIGN KEY(sc_cat_id) REFERENCES Catégorie(cat_id)
);

CREATE TABLE livraison(
   liv_id  Int(10) NOT NULL AUTO_INCREMENT,
   liv_date DATE,
   liv_quantité INT NOT NULL,
   liv_date_expedition DATE,
   liv_com_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   FOREIGN KEY(liv_com_id) REFERENCES commande(com_id)
);

CREATE TABLE produit(
   pro_id  Int(10) NOT NULL AUTO_INCREMENT,
   pro_prix_vente DECIMAL(8,2) NOT NULL,
   pro_prix_achat DECIMAL(8,2) NOT NULL,
   pro_ref VARCHAR(50) NOT NULL,
   pro_libelle_court VARCHAR(255) NOT NULL,
   pro_libelle_long VARCHAR(255) NOT NULL,
   pro_photo VARCHAR(50) NOT NULL,
   pro_stock_alerte INT NOT NULL,
   pro_stock_phy INT NOT NULL,
   pro_sc_id INT NOT NULL,
   pro_fou_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_sc_id) REFERENCES sous_categorie(sc_id),
   FOREIGN KEY(pro_fou_id) REFERENCES Fournisseur(fou_id)
);

CREATE TABLE ligne_de_commande(
   ligne_com_id  Int(10) NOT NULL AUTO_INCREMENT,
   ligne_com_quantité INT NOT NULL,
   ligne_com_prix_unit INT NOT NULL,
   ligne_com_com_id INT NOT NULL,
   ligne_com_pro_id INT NOT NULL,
   PRIMARY KEY(ligne_com_id),
   FOREIGN KEY(ligne_com_com_id) REFERENCES commande(com_id),
   FOREIGN KEY(ligne_com_pro_id) REFERENCES Produit(pro_id)
);
