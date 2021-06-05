CREATE ROLE IF NOT EXISTS marketing;

-- peut ajouter modifier et supprimer des produits--

GRANT SELECT, INSERT, DELETE, UPDATE
ON gescom_afpa.products 
TO marketing;

-- peut ajouter modifier et supprimer des categories--

GRANT SELECT, INSERT, DELETE, UPDATE
ON gescom_afpa.categories 
TO marketing;

--Peut consulter des commandes--

GRANT SELECT 
ON gescom_afpa.orders 
TO marketing;

--Peut consulter les details des commandes--

GRANT SELECT
ON gescom_afpa.orders_details
TO marketing;

-- Peut consulter les clients--

GRANT SELECT
ON gescom_afpa.customers 
TO marketing;

-- crée les utilisateurs --
Create user IF NOT EXISTS 'utilisateur1' identified by 'mdp1';
Create user IF NOT EXISTS 'utilisateur2' identified by 'mdp2';
Create user IF NOT EXISTS 'utilisateur3' identified by 'mdp3';

-- Commande pour leur donner les privileges du role marketing

GRANT marketing
TO 'utilisateur1','utilisateur2','utilisateur3';

-- verif des privileges du role marketing
SHOW GRANTS FOR marketing;

-- verif des privileges par utilisateur
SHOW GRANTS FOR 'utilisateur1';
SHOW GRANTS FOR 'utilisateur2';
SHOW GRANTS FOR 'utilisateur3';

-- Debug --

set default ROLE 
to 'utilisateur1','utilisateur2','utilisateur3';
