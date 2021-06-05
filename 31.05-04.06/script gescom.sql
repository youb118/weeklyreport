CREATE TABLE Category(
   cat_id INT NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(50),
   cat_subcat VARCHAR(50),
   PRIMARY KEY(cat_id)
);

CREATE TABLE customers(
   cus_id INT NOT NULL AUTO_INCREMENT,
   cus_name VARCHAR(50),
   cus_lastname VARCHAR(50),
   cus_adress VARCHAR(100),
   cus_city VARCHAR(50),
   cus_zipcode VARCHAR(5),
   cus_phone INT,
   cus_password VARCHAR(50),
   cus_add_date DATETIME,
   cus_update_date DATETIME,
   PRIMARY KEY(cus_id)
);

CREATE TABLE orders(
   ord_id INT NOT NULL AUTO_INCREMENT,
   ord_paiement_date DATETIME,
   ord_paiement_total DECIMAL(6,2),
   ord_paiement_type LOGICAL,
   ord_expedition_date DATETIME,
   ord_delivery_man VARCHAR(50),
   ord_delivery_date DATETIME,
   cus_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE employees(
   emp_id INT NOT NULL AUTO_INCREMENT,
   emp_post VARCHAR(50),
   emp_shop VARCHAR(50),
   emp_serv VARCHAR(50),
   emp_annual_gross_salary DECIMAL(7,2),
   emp_seniority INT,
   emp_gender VARCHAR(1),
   emp_child_num INT,
   emp_sup_id INT,
   PRIMARY KEY(emp_id)
);

CREATE TABLE Product(
   pro_id INT NOT NULL AUTO_INCREMENT,
   pro_cate VARCHAR(25),
   pro_price DECIMAL(6,2),
   pro_ref INT,
   pro_ean INT,
   pro_phy_stock INT,
   pro_sto_alert INT,
   pro_color VARCHAR(25),
   pro_name VARCHAR(25),
   pro_description VARCHAR(255),
   pro_date_add DATETIME,
   pro_date_update DATETIME,
   pro_picture VARCHAR(50),
   pro_disponibility LOGICAL,
   cat_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(cat_id) REFERENCES Category(cat_id)
);

CREATE TABLE suppliers(
   sup_id INT NOT NULL AUTO_INCREMENT,
   sup_comm VARCHAR(50),
   sup_name VARCHAR(25),
   pro_id INT NOT NULL,
   PRIMARY KEY(sup_id),
   FOREIGN KEY(pro_id) REFERENCES Product(pro_id)
);

CREATE TABLE Composer(
   pro_id INT,
   ord_id INT,
   orde_discount DECIMAL(5,2),
   PRIMARY KEY(pro_id, ord_id),
   FOREIGN KEY(pro_id) REFERENCES Product(pro_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id)
);
