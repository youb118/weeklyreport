-- Exercice :Ecrivez l'appel de la procédure ajoutFournisseur() pour un fournisseur basé en France. 

Call ajoutFournisseur(
    'mark'
    'fr'
    'rue de jean'
    '80000'
    'lewandowski'
    '0654785896'
    'dfdgjdfhjgdfkjg@yahoo.fr'
)


-- Exercice 1 : création d'une procédure stockée sans paramètre
-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée. 

DELIMITER //

CREATE PROCEDURE Lst_Suppliers()

BEGIN

    SELECT sup_name
    FROM suppliers
    JOIN products ON suppliers.sup_id = products.pro_sup_id
    JOIN orders_details ON products.pro_id = orders_details.ode_pro_id
    WHERE pro_id IN (SELECT ode_pro_id FROM orders_details)
    GROUP BY sup_name;

END //

DELIMITER ;

Call Lst_suppliers();

SHOW CREATE PROCEDURE Lst_suppliers;

-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

-- Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente". 

DELIMITER //

CREATE PROCEDURE lst_rush_orders()
BEGIN
  SELECT ord_id AS 'libellé'
  FROM orders
  WHERE ord_status LIKE 'Commande urgente';
END //

DELIMITER;

-- Exercice 3 : création d'une procédure stockée avec plusieurs paramètres
-- Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée. 

DELIMITER |

CREATE PROCEDURE CA_Supplier(
    IN p_sup_id INT, 
    IN p_ord_payment_date INT
)
BEGIN  
        SELECT sup_name, sum(ode_unit_price * ode_quantity) AS "CA"
        from suppliers
        join products ON suppliers.sup_id = products.pro_sup_id
        join orders_details on products.pro_id = orders_details.ode_pro_id
        join orders on orders_details.ode_ord_id = orders.ord_id
        where sup_id = p_sup_id
        and year(ord_payment_date) = p_ord_payment_date
        group by sup_name;
END |
DELIMITER ;