/*Délai moyen entre la date de commande et la date de facturation*/

DROP PROCEDURE IF EXISTS DelaiMoyen;

DELIMITER |

CREATE PROCEDURE DelaiMoyen()
BEGIN
    select round(avg(datediff(com_date,com_etat)),1) as 'Nombre de jours du délai moyen entre la date de commande et la date de facturation' from commande where com_date is not null;
END |

DELIMITER ;

/*Appel de la procédure*/
Call DelaiMoyen();

/*Caractéristique de la procédure*/
SHOW CREATE PROCEDURE DelaiMoyen;

/*Listage des procédure stocké sur la base*/
SHOW PROCEDURE STATUS;