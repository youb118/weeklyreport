/* Creation des 4 roles*/


CREATE ROLE IF NOT EXISTS Visiteur;
CREATE ROLE IF NOT EXISTS Client;
CREATE ROLE IF NOT EXISTS Gestion;
CREATE ROLE IF NOT EXISTS Administrateur;

/* Creation de 2 utilisateurs pour chaque role */

CREATE USER IF NOT EXISTS 'vis1' IDENTIFIED BY 'vis1';
CREATE USER IF NOT EXISTS 'vis2' IDENTIFIED BY 'vis2';
CREATE USER IF NOT EXISTS 'cli1' IDENTIFIED BY 'cli1';
CREATE USER IF NOT EXISTS 'cli2' IDENTIFIED BY 'cli2';
CREATE USER IF NOT EXISTS 'gest1' IDENTIFIED BY 'gest1';
CREATE USER IF NOT EXISTS 'gest2' IDENTIFIED BY 'gest2';
CREATE USER IF NOT EXISTS 'admin1' IDENTIFIED BY 'admin1';
CREATE USER IF NOT EXISTS 'admin2' IDENTIFIED BY 'admin2';


/*Visiteur*/
/*Attibution du privilége de lecture sur le catalogue au rôle visiteur */

GRANT select
ON village_green.produit
TO Visiteur;

/*Affectation du rôle visiteur aux 2  visiteurs*/

GRANT Visiteur
TO 'vis1', 'vis2';

/* Client */
/*Attibution du privilége de lecture sur la base au rôle client */

GRANT select
ON village_green.*
TO Client;

/*Attibution du privilége d'insertion et modification sur les tables client et commande au rôle client */

GRANT insert, update
ON village_green.commande
TO Client;

GRANT insert, update
ON village_green.client
TO Client;

/*Affectation du rôle client aux 2 clients*/

GRANT Client
TO 'cli1', 'cli2';

/*GESTION*/
/*Attibution du privilége de lecture, ecriture sur la base au rôle gestion */
GRANT select, insert, update
ON village_green.*
TO Gestion;


/*Affectation du rôle gestion aux 2 gestionnaires*/
GRANT Gestion
TO 'gest1', 'gest2';

/*ADMINISTRATION*/
/*Attibution du privilége de lecture, ecriture, suppression et création suppression de table sur la base au rôle administrateur */

GRANT ALL
ON village_green.*
TO Administrateur;

/*Affectation du rôle administrateur aux 2 administrateurs*/

GRANT Administrateur
TO 'admin1', 'admin2';



/* 

-- verif des privileges due chaque role
SHOW GRANTS FOR "role";

-- verif des privileges par utilisateur
SHOW GRANTS FOR 'utilisateur1';
SHOW GRANTS FOR 'utilisateur2';
SHOW GRANTS FOR 'utilisateur3';

-- Debug --

set default ROLE 
to 'utilisateur1','utilisateur2','utilisateur3'; */