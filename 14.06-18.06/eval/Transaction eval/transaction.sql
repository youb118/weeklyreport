/*Transactions*/

/*Amity HANAH, Manageuse au sein du magasin d'Arras, vient de prendre sa retraite. 
Il a été décidé, après de nombreuses tractations, de confier son poste au pépiniériste le plus ancien en poste dans ce magasin. 
Ce dernier voit alors son salaire augmenter de 5% et ses anciens collègues pépiniéristes passent sous sa direction.*/

/*Ecrire la transaction permettant d'acter tous ces changements en base des données.*/

START TRANSACTION;

INSERT INTO posts  (pos_libelle) VALUES ('Retraités'); 

/*je recupère l'emp_pos_id d'Amity HANAH*/
SET @v_id_post = (SELECT emp_pos_id FROM employees WHERE emp_lastname = 'HANNAH' AND emp_firstname = 'Amity' 
AND emp_sho_id = (SELECT sho_id FROM shops WHERE sho_city = 'Arras'));

/*je recupère l'emp_superior_id d'Amity HANAH*/
SET @v_id_sup_man = (SELECT emp_superior_id FROM employees WHERE emp_lastname = 'HANNAH' AND emp_firstname = 'Amity' 
AND emp_sho_id = (SELECT sho_id FROM shops WHERE sho_city = 'Arras')); 

/*je recupère l'emp_id du nouvel arrivant au poste de manager*/
SET @v_id_emp = (SELECT emp_id FROM employees JOIN posts ON pos_id = emp_pos_id WHERE pos_libelle = 'Pépiniériste' 
AND  emp_enter_date = (SELECT min(emp_enter_date) FROM employees  JOIN posts ON pos_id = emp_pos_id WHERE pos_libelle = 'Pépiniériste'));


/*Modification du supérieur des pépiniéristes*/
UPDATE  employees 
SET emp_superior_id = @v_id_emp 
WHERE emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle = 'Pépiniériste');

/*Modification des informations concernant le nouveau manager*/
UPDATE employees 
SET emp_superior_id =  @v_id_sup_man,  emp_salary = emp_salary * 1.05, emp_pos_id = @v_id_post  
WHERE emp_id = @v_id_emp ; 

/*Modification*/
UPDATE employees 
SET emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle = 'Retraité') 
WHERE emp_lastname = 'HANNAH' AND emp_firstname = 'Amity' 
AND emp_sho_id = (SELECT sho_id FROM shops WHERE sho_city = 'Arras');

COMMIT;


-- requete pour voir les informations sup_id

SELECT CONCAT(employees.emp_lastname, ' ',employees.emp_firstname) AS "Nom & Prénom", employees.emp_id AS "Identifiant", employees.emp_superior_id AS "Identifiant_Superieur", CONCAT(shops.sho_name,' | ', shops.sho_city) AS "Boutique"
FROM employees
JOIN shops ON employees.emp_sho_id = shops.sho_id
JOIN posts ON employees.emp_pos_id = posts.pos_id
WHERE posts.pos_libelle LIKE 'Pépiniériste' AND shops.sho_city LIKE 'Arras'
ORDER BY employees.emp_superior_id;






-- La base de données ne contient actuellement que des employés en postes. Il a été choisi de garder en base une liste des anciens collaborateurs de l'entreprise parti en retraite. Il va donc vous falloir ajouter une ligne dans la table posts pour référencer les employés à la retraite.
INSERT INTO posts (pos_libelle) VALUES ('retraités');


/*Décrire les opérations qui seront à réaliser sur la table posts.*/
/*Il faut ajouter une colonne 'retraités' à la table posts afin d'y inserer les noms des retraités, changer le statut du plus ancien pépiniériste et 
changer son statut en supérieur afin que ses anciens collègues deviennent ses subordonnés.*/

/*Ecrire les requêtes correspondant à ces opéarations.*/

/*Récupération de la date la plus ancienne des pépiniériste */
SELECT * FROM employees 
WHERE emp_enter_date =
(SELECT min(emp_enter_date) FROM employees LIMIT 1);

/*le magasin d'arras*/
SELECT * FROM employees 
WHERE emp_sho_id =
(SELECT sho_id FROM shops WHERE sho_city = 'Arras');

/*employé le plus ancien et d'arras*/
SELECT * FROM employees WHERE emp_enter_date =
(SELECT min(emp_enter_date) FROM employees WHERE emp_sho_id = (SELECT sho_id FROM shops WHERE sho_city = 'Arras') LIMIT 1);

/*Poste*/

SELECT * 
FROM employees p
WHERE p.emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle ='pépiniériste');

/*requete du pépiériste le plus ancien du magasin d'Arras */
SELECT * FROM employees WHERE employees.emp_enter_date =
(SELECT MIN(emp_enter_date) FROM employees  WHERE emp_sho_id = (SELECT sho_id FROM shops WHERE sho_city = 'Arras' 
AND emp_pos_id = (SELECT pos_id FROM posts WHERE pos_libelle ='pépiniériste'))LIMIT 1);

/*la requete pour trouver la manageuse du magasin d'Arras Amity HANAH*/

SELECT *
FROM employees
WHERE emp_sho_id =(SELECT sho_id FROM shops WHERE sho_city = 'Arras' 
AND emp_pos_id IN (SELECT pos_id FROM posts WHERE pos_libelle LIKE '%manager%'))
AND emp_lastname ='Hannah' 
AND emp_firstname ='Amity';

/*Cet employé est SIMONE George qui a l'id 38*/