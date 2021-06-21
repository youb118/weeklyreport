
DROP TABLE IF EXISTS commander_articles;
CREATE TABLE commander_articles (
codart int(10) NOT NULL AUTO_INCREMENT,
qte int(10) NOT NULL,
date date NOT NULL,
PRIMARY KEY (codart),
FOREIGN KEY(codart) REFERENCES products (pro_ref));


DELIMITER //
DROP TRIGGER IF EXISTS  after_products_update //
CREATE TRIGGER after_products_update
    AFTER UPDATE
    on products
    FOR EACH ROW
BEGIN
    IF NEW.pro_stock < NEW.pro_stock_alert THEN
    -- INSERT dans la table 'commander_articles' ID, qte
        INSERT INTO commander_articles (qte,codart,date) 
        -- (qte = stock_alert - stock_physique) pour avoir le nb à commander
        VALUES ((NEW.pro_stock_alert - NEW.pro_stock),NEW.pro_id, CURRENT_DATE());
    END IF;
     END // 
DELIMITER ;

-- cas 2 :
UPDATE products SET pro_stock = 4 WHERE pro_id = 8;
-- cas 3 :
UPDATE products SET pro_stock = 3 WHERE pro_id = 8;





