-- Supprime la base de donnée "Gescom" si elle existe déjà.
DROP DATABASE IF EXISTS gescom_test;
-- Créer la base de données "Gescom".
CREATE DATABASE gescom_test;
-- Met le focus sur la Base de donnée "Gescom" si une autre base de donnée était utilisé.
USE gescom_test;

-- Création de la table "Catégories" avec une clef primaire défini sur cat_id
DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
  cat_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  cat_name VARCHAR(50) NOT NULL,
  cat_parent_id INT NOT NULL,
  PRIMARY KEY(cat_id)
);

DROP TABLE IF EXISTS countries;
CREATE TABLE IF NOT EXISTS countries (
  cou_id char(2),
  cou_name varchar(45),
  PRIMARY KEY (cou_id)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
  cus_id int(10) NOT NULL AUTO_INCREMENT,
  cus_lastname VARCHAR(50),
  cus_firstname VARCHAR(50),
  cus_adress VARCHAR(150),
  cus_zipcode VARCHAR(5),
  cus_city VARCHAR(50),
  cus_country_id INT,
  cus_mail VARCHAR(255),
  cus_phone INT,
  cus_password VARCHAR(60),
  cus_add_date DATETIME,
  cus_update_date DATETIME,
  cus_cou_id INT NOT NULL,
  PRIMARY KEY(cus_id),
  FOREIGN KEY(cus_cou_id) REFERENCES Countries(cou_id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE IF NOT EXISTS employees (
  emp_id int(10) NOT NULL AUTO_INCREMENT,
  emp_superior_id int(10),
  emp_lastname VARCHAR(50),
  emp_fistname VARCHAR(50),
  emp_adress VARCHAR(150),
  emp_zipcode VARCHAR(5),
  emp_city VARCHAR(50),
  emp_mail VARCHAR(255),
  emp_phone INT,
  emp_salary INT,
  emp_enter_date DATE,
  emp_gender VARCHAR(1),
  emp_children INT,
  emp_pos_id INT NOT NULL,
  PRIMARY KEY(emp_id),
  FOREIGN KEY(emp_pos_id) REFERENCES posts(pos_id)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
  ord_id int(10) NOT NULL AUTO_INCREMENT,
  ord_order_date DATE,
  ord_payment_date DATE,
  ord_ship_date DATE,
  ord_reception_date DATE,
  ord_status VARCHAR(25),
  ord_cus_id INT NOT NULL,
  PRIMARY KEY(ord_id),
  FOREIGN KEY(ord_cus_id) REFERENCES customers(cus_id)
);

DROP TABLE IF EXISTS orders_details;
CREATE TABLE IF NOT EXISTS orders_details (
  ode_id int(10) NOT NULL AUTO_INCREMENT,
  ode_unit_price DECIMAL(15,2),
  ode_discount DECIMAL(15,2),
  ode_quantity INT,
  ode_ord_id INT NOT NULL,
  ode_pro_id INT NOT NULL,
  PRIMARY KEY(ode_id),
  FOREIGN KEY(ode_ord_id) REFERENCES orders(ord_id),
  FOREIGN KEY(ode_pro_id) REFERENCES product(pro_id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  pos_id int(10) NOT NULL AUTO_INCREMENT,
  pos_libelle VARCHAR(30) NOT NULL,
  PRIMARY KEY(pos_id)
);

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
  pro_id int(10) NOT NULL AUTO_INCREMENT,
  pro_price DECIMAL(15,2),
  pro_ref VARCHAR(8),
  pro_ean VARCHAR(13),
  pro_stock INT,
  pro_stock_alert INT,
  pro_color VARCHAR(30),
  pro_name VARCHAR(50),
  pro_desc VARCHAR(255),
  pro_publish INT,
  pro_add_date DATETIME,
  pro_update_date DATETIME,
  pro_picture VARCHAR(50),
  pro_sup_id INT NOT NULL,
  pro_cat_id INT NOT NULL,
  PRIMARY KEY(pro_id),
  FOREIGN KEY(pro_sup_id) REFERENCES suppliers(sup_id),
  FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id)
);

DROP TABLE IF EXISTS suppliers;
CREATE TABLE IF NOT EXISTS suppliers (
  sup_id int(10) NOT NULL AUTO_INCREMENT,
  sup_name VARCHAR(50),
  sum_city VARCHAR(50),
  sup_adress VARCHAR(150),
  sup_zipcode VARCHAR(5),
  sum_contact VARCHAR(100),
  sup_phone VARCHAR(10),
  sup_mail VARCHAR(75),
  sup_cou_id INT NOT NULL,
   PRIMARY KEY(sup_id),
   FOREIGN KEY(sup_cou_id) REFERENCES Countries(cou_id)
);

