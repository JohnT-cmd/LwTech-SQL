/*
This sql file serves as the file for the submission for your team's Final Group Project
*/

/*
List here:
1) PM: Taylor Beall
	- Stored Procedure
    - Updatable View
    - Analytical Query
    - Indexes
    - Documentation
2) Josiah Kjellin
	- Stored Function
    - Subquery
    - Multi-table Query
    - Backup & Restore
    - ERD Update
3) The PM submits the sql file
*/

/*
Right below here, list your team's updated 
and best sql code for the midterm group project
i.e.
-creating the database
-creating tables
-creating constraints
insert statements
select statements to list what was inserted
in the tables
*/

/* Database Creation */
DROP DATABASE IF EXISTS tcg_shop;
CREATE DATABASE tcg_shop;
USE tcg_shop;

/* Tables */
CREATE TABLE categories (
category_id			INT				PRIMARY KEY   AUTO_INCREMENT,
category_name		VARCHAR(60)		NOT NULL,
CONSTRAINT UQ_categories_name UNIQUE (category_name)
);

CREATE TABLE products (
product_id			INT				PRIMARY KEY   AUTO_INCREMENT,
category_id			INT				NOT NULL,
product_name		VARCHAR(60)		NOT NULL,
product_brand		VARCHAR(60)		NOT NULL,
description			TEXT			NOT NULL,
product_price		DECIMAL(10,2)	NOT NULL,
product_discount 	DECIMAL(10,2)   NOT NULL      DEFAULT(0.0),
stock_amount		INT				NOT NULL,
release_date		DATETIME		NOT NULL,
product_language	VARCHAR(60)		NOT NULL	  DEFAULT('English'),
CONSTRAINT FK_products_categories
  FOREIGN KEY (category_id)
  REFERENCES categories (category_id)
);

CREATE TABLE customers (
customer_id			INT				PRIMARY KEY		AUTO_INCREMENT,
email_address		VARCHAR(60)		NOT NULL,
account_username	VARCHAR(60)		NOT NULL,
account_password	VARCHAR(60)		NOT NULL,
first_name			VARCHAR(60)		NOT NULL,
last_name			VARCHAR(60)		NOT NULL,
shipping_address	VARCHAR(60)		NOT NULL,
billing_address		VARCHAR(60)		NOT NULL,
favorite_game		VARCHAR(60)		NOT NULL		DEFAULT 'None',
tournaments_played  INT				NOT NULL		DEFAULT 0
);

CREATE TABLE orders (
order_id			INT				PRIMARY KEY		AUTO_INCREMENT,
customer_id			INT				NOT NULL,
order_date			DATETIME		DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT FK_orders_customers
	FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);

CREATE TABLE order_details (
order_detail_id		INT				PRIMARY KEY AUTO_INCREMENT,
order_id			INT				NOT NULL,
product_id			INT				NOT NULL,
quantity			INT				NOT NULL,
CONSTRAINT FK_order_details_orders
	FOREIGN KEY (order_id)
	REFERENCES orders (order_id),
CONSTRAINT FK_order_details_products
	FOREIGN KEY (product_id)
    REFERENCES products (product_id),
CONSTRAINT CK_order_details_quantity
	CHECK (quantity > 0)
);

/* Insert Statements */
INSERT INTO categories (category_id, category_name) VALUES /*Received Approval by Dave to have less than 10 statements for this table only. */
(1, 'Singles'),
(2, 'Booster Boxes'),
(3, 'Booster Packs');

INSERT INTO products (product_id, category_id, product_name, product_brand, description, product_price, product_discount, stock_amount, release_date, product_language) VALUES
(1, 1, 'Monkey D. Luffy', 'One Piece', 'An extremely hard to get Japanese Shonen Jump magazine promotional card. This card has yet to have an English counterpart and has been extremely sought after since it came out in Japan.', '79.99', '0.00', '3', '2025-10-3 13:22:45', 'Japanese'),
(2, 1, 'Portgas D. Ace', 'One Piece', 'A red and blue alternate art leader card from the 13th set of One Piece, Carrying On His Will. This leader has been dominating the meta and still remains one of the best leaders you can play.', '64.99', '0.00', '11', '2025-11-7 9:06:32', 'English'),
(3, 2, 'Carrying On His Will', 'One Piece', 'A booster box of the 13th set of One Piece, containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.', '215.99', '20.00', '6', '2025-11-7 9:06:32', 'English'),
(4, 2, 'Extra Booster -One Piece Heroines Edition-', 'One Piece', 'A booster box of the 3rd extra booster set of One Piece, containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.', '299.99', '30.00', '13', '2026-2-20 12:02:45', 'English'),
(5, 1, 'The One Ring', 'Magic: The Gathering', 'Extremely rare one of one card from The Lord of the Rings set that released back in 2023. There is only one of these cards in existence.', '500000.00', '0.00', '1', '2023-6-23 4:29:59', 'English'),
(6, 3, 'Lorwyn Eclipsed Collector Booster', 'Magic: The Gathering', 'A special booster pack of Magic: The Gathering that comes with 15 different holo-foil or better cards. These packs are great if you want to make your deck look nice!', '39.99', '2.00', '48', '2026-1-23 12:49:21', 'English'),
(7, 2, 'Dual Impact', 'Gundam', 'A booster box of the 2nd set from the Gundam Card Game containing 24 booster packs and a gurantee of 2-3 alternate art cards or better.', '104.99', '5.00', '4', '2025-10-24 12:44:53', 'English'),
(8, 1, 'Charizard', 'Pokemon', 'An original 1999 1st edition holo charizard card. This card is what changed pokemon for so many people and is still a legend in the community today.', '5000.00', '0.00', '1', '1999-4-25 1:43:21', 'English'),
(9, 3, 'Phantasmal Flames', 'Pokemon', 'A booster pack from one of the newest sets of Pokemon. This set contains the ultra rare golden mega charizard ex card that only a few people have been able to pull.', '6.99', '0.00', '46', '2025-12-5 05:42:04', 'English'),
(10, 2, 'Prismatic Evolutions', 'Pokemon', 'A booster pack containing 36 packs of prismatic evolutions. This set is known for its unforgiving hit rates, and with no guranteed hits, opening this set can be quite the gamble', '249.99', '10.00', '2', '2025-1-12 06:08:31', 'English');

INSERT INTO customers (customer_id, email_address, account_username, account_password, first_name, last_name, shipping_address, billing_address, favorite_game, tournaments_played) VALUES
(1, 'kurtrussell2310@yahoo.com', 'KurtTheMan42', 'ghaeui23498sfnakhd9823hrn2urbksifgnhiu', 'Kurt', 'Russell', '308 Negra Arroyo Lane, Albequerque, New Mexico, 87104', '308 Negra Arroyo Lane, Albequerque, New Mexico, 87104', 'One Piece', '4'),
(2, 'thelebronj3802@gmail.com', 'TheGoat23', 'thiuowen4q3nmwmtj43iqfkj2gjkhqkhblfoa983nghnjes32n5ll8jmlw', 'Lebron', 'James', '356 North Duncan Street, Tracy, New York, 10205', '356 North Duncan Street, Tracy, New York, 10205', 'Magic: The Gathering', '1'),
(3, 'marketablepliars4123@outlook.com', 'MustacheMan68', 'kjngraenbk2ipovf9naeknkyh4ubhj5ku8s43uihhaknhhbaghr', 'Mark', 'Fischbach', '9677, 3874 Paxton Ave, Cincinnati, Ohio 45209', '825 Maxwell Farm Road, Chico, California 95928', 'Magic: The Gathering', '0'),
(4, 'timthetatman432@gmail.com', 'TimothyShatterer50', 'gbhnkerk892nflk2byiy3rkkjsfgr7knjuy4guyakngbjbys', 'Timothy', 'Chalamet', '118 Cerullo Road, Louisville, Kentucky 4024', '118 Cerullo Road, Louisville, Kentucky 4024', 'Pokemon', '15'),
(5, 'antoniobannedfromtheus352@gmail.com', 'AntonioBanters65', 'fnaregnie5hh53w4bkjqh2bkjq35jkhbne5k2knfgajh', 'Antonio', 'Banderas', '4960 Rosewood Lane, New York, New York 10018', '4960 Rosewood Lane, New York, New York 10018', 'Gundam', '32'),
(6, 'swiftlytaylor721@yahoo.com', 'SwifferT52', 'ngwui5o87q2hnfuoy23ibfo8h7843hngquy39mcw23inghw45yun', 'Taylor', 'Swift', '371 Scenic Way, Latham, Illinois 62543', '371 Scenic Way, Latham, Illinois 62543', 'One Piece', '0'),
(7, 'thecreatorofmusic@gmail.com', 'BigPoe029', 'ngjkasor9g8a2nb3bkfhay4bbj34nlkangkuy48bhjksbgfyuq3kubi24', 'Tyler', 'Okonma', '329 William Street, Stroudsburg, Pennsylvania 18360', '329 William Street, Stroudsburg, Pennsylvania 18360', 'Pokemon', '6'),
(8, 'bigthinkere492@outlook.com', 'HugeBrain391', 'rgfnkhjawkrhbgakuwefnlkaieryg9432nnk2buiu5482hbnkhn223i', 'Albert', 'Einstein', '83 Main Street, West Crown Point, Indiana 46307', '83 Main Street, West Crown Point, Indiana 46307', 'Gundam', '78'),
(9, 'everyonewannabeme938@gmail.com', 'TheDriver942', 'aregnhuy3b4ninq2i3nc7834h87q34ncnhq2m3cr87q23nc9782mchi', 'Ryan', 'Gosling', '3641 Cambridge Place, Windsor Mill, Maryland 21244', '3641 Cambridge Place, Windsor Mill, Maryland 21244', 'One Piece', '52'),
(10, 'icandothisallday4820@yahoo.com', 'WhateverMan311', 'ariugnaiwurgiqu348goq98fno8q34hqo98nff8qo47cn98q2c38m0h8ou', 'Chris', 'Evans', '2435 B Street, New Brighton, Minnesota 55112', '2435 B Street, New Brighton, Minnesota 55112', 'Pokemon', '22'); 

INSERT INTO orders (customer_id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 3, 1),
(4, 4, 1),
(5, 5, 10),
(6, 6, 1),
(7, 7, 3),
(8, 8, 1),
(9, 9, 2),
(10, 10, 1);

/* Queries */
SELECT TABLE_NAME, COLUMN_NAME /* Check primary keys */
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME = 'PRIMARY'
  AND TABLE_SCHEMA = 'tcg_shop';

SELECT  /* Check foreign keys */
    table_name AS 'Table',
    column_name AS 'Column',
    constraint_name AS 'Constraint',
    referenced_table_name AS 'Referenced Table',
    referenced_column_name AS 'Referenced Column'
FROM  
    information_schema.key_column_usage
WHERE  
    referenced_table_name IS NOT NULL
    AND table_schema = 'tcg_shop';
    
SELECT  /* Check unique constraints */
    TC.TABLE_NAME,  
    KCU.COLUMN_NAME,  
    TC.CONSTRAINT_NAME
FROM  
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU
    ON TC.CONSTRAINT_NAME = KCU.CONSTRAINT_NAME
WHERE  
    TC.CONSTRAINT_TYPE = 'UNIQUE'
    AND TC.TABLE_SCHEMA = 'tcg_shop';
    
    SELECT /*Check Constraints */
    TC.TABLE_NAME,  
    CC.CONSTRAINT_NAME,  
    CC.CHECK_CLAUSE
FROM  
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS CC
    JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
    ON CC.CONSTRAINT_NAME = TC.CONSTRAINT_NAME
WHERE  
    CC.CONSTRAINT_SCHEMA = 'tcg_shop';

SELECT  /*Default Constraints */
    TABLE_NAME,  
    COLUMN_NAME,  
    COLUMN_DEFAULT
FROM  
    INFORMATION_SCHEMA.COLUMNS
WHERE  
    COLUMN_DEFAULT IS NOT NULL
    AND TABLE_SCHEMA = 'tcg_shop';


/* SELECT Statements */
SELECT COUNT(*) AS 'Total Categories' FROM categories;
SELECT * FROM categories;

SELECT COUNT(*) AS 'Total Products' FROM products;
SELECT * FROM products;

SELECT COUNT(*) AS 'Total Customers' FROM customers;
SELECT * FROM customers;

SELECT COUNT(*) AS 'Total Orders' FROM orders;
SELECT * FROM orders;

SELECT COUNT(*) AS 'Total Order Details' FROM order_details;
SELECT * FROM order_details;

/*
-List right below this set of comments, the code for the 
Programming Problem - Indexes
-Keep this set of comments in your team's submission
-"Indexes must be listed first so that they 
take effect for all queries run subsequently
in this file."
*/
CREATE INDEX idx_products_category_id 
ON products (category_id);

CREATE INDEX idx_orders_customer_id 
ON orders (customer_id);

CREATE INDEX idx_order_details_order_id_product_id 
ON order_details (order_id, product_id);

CREATE INDEX idx_products_product_name 
ON products (product_name);

CREATE INDEX idx_customers_last_name_first_name 
ON customers (last_name, first_name);

/*
-List right below this set of comments, the code for the 
Programming Problem - Subquery
-Keep this set of comments in your team's submission
*/
SELECT *
FROM customers
WHERE tournaments_played > (SELECT AVG(tournaments_played) FROM customers);

/*
-List right below this set of comments, the code for the 
Programming Problem - Updatable Single Table View
-Keep this set of comments in your team's submission
*/
-- Creating view for products over $100
CREATE OR REPLACE VIEW vw_premium_products AS
SELECT product_id, product_name, product_price, stock_amount
FROM products
WHERE product_price > 100;

-- 1. Query the view:
SELECT * FROM vw_premium_products;

-- 2. Update a record that satisfies the 'where' clause: Reduced 'Carrying on His Will' price
UPDATE vw_premium_products
SET product_price = 199.99
WHERE product_id = 3;

-- 3. Re-query to confirm the update
SELECT * FROM vw_premium_products;

/*
-List right below this set of comments, the code for the 
Programming Problem - Stored Procedure
-Keep this set of comments in your team's submission
*/
DELIMITER //

CREATE PROCEDURE sp_check_stock_levels()
BEGIN
    DECLARE p_name VARCHAR(60);
    DECLARE p_stock INT;
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE stock_cursor CURSOR FOR 
        SELECT product_name, stock_amount FROM products;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN stock_cursor;
    
    stock_loop: LOOP
        FETCH stock_cursor INTO p_name, p_stock;
        IF done THEN 
            LEAVE stock_loop; 
        END IF;
        
        IF p_stock < 5 THEN
            SELECT CONCAT('RESTOCK ALERT: ', p_name, ' only has ', p_stock, ' units left.') AS Alert;
        ELSE
            SELECT CONCAT('Inventory OK: ', p_name, ' (', p_stock, ' units)') AS Status;
        END IF;
        
    END LOOP;
    CLOSE stock_cursor;
END //

DELIMITER ;

CALL sp_check_stock_levels();

/*
-List right below this set of comments, the code for the 
Programming Problem - Stored Function
-Keep this set of comments in your team's submission
*/

DROP FUNCTION IF EXISTS fn_item_stock_status;
DELIMITER //
CREATE FUNCTION fn_item_stock_status
(
	product_id_param	INT
)
RETURNS VARCHAR(60)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE item_stock_var		INT;
    DECLARE stock_status	VARCHAR(60);
    
    SELECT stock_amount
    INTO item_stock_var
    FROM products
    WHERE product_id = product_id_param;
    
    IF item_stock_var < 10 THEN
		SET stock_status = "Product is low on stock.";
	ELSE
		SET stock_status = "Product is good on stock!";
	END IF;
    
    RETURN stock_status;
END //
DELIMITER ;

SELECT product_id, fn_item_stock_status(product_id) AS stock_status
FROM products;

/*
-List right below this set of comments, the code for the 
Problem - Evaluate and Synthesize Query
-Keep this set of comments in your team's submission
*/

DROP DATABASE IF EXISTS BusinessAnalytics;
CREATE DATABASE BusinessAnalytics;
USE BusinessAnalytics;

-- Hierarchical Tables
CREATE TABLE Region (
    region_id INT AUTO_INCREMENT,
    region_name VARCHAR(50),
    CONSTRAINT PK_Region PRIMARY KEY (region_id)
);

CREATE TABLE Department (
    department_id INT AUTO_INCREMENT,
    department_name VARCHAR(50),
    region_id INT,
    CONSTRAINT PK_Department PRIMARY KEY (department_id),
    CONSTRAINT FK_Department_Region FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    CONSTRAINT PK_Employee PRIMARY KEY (employee_id),
    CONSTRAINT FK_Employee_Department FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Insert data into Region
INSERT INTO Region (region_name) VALUES ('North'), ('South');

-- Insert data into Department
INSERT INTO Department (department_name, region_id) VALUES 
  ('HR', 1), ('Sales', 1), ('IT', 2), ('Finance', 2);


INSERT INTO Employee (employee_name, department_id, salary) VALUES
  -- HR Department (ID 1, Region 1)
  ('Alice', 1, 60000),
  ('Bob', 1, 71000),
  ('Clara', 1, 73000),
  ('David', 1, 75000),

  -- Sales Department (ID 2, Region 1)
  ('Ethan', 2, 72000),
  ('Fiona', 2, 74000),
  ('George', 2, 76000),

  -- IT Department (ID 3, Region 2)
  ('Hannah', 3, 80000),
  ('Ian', 3, 82000),
  ('Julia', 3, 79000),

  -- Finance Department (ID 4, Region 2)
  ('Kevin', 4, 75000),
  ('Laura', 4, 77000),
  ('Mason', 4, 78000);


-- disable ONLY_FULL_GROUP_BY mode, which is the default, to get the below to work
SET SESSION sql_mode = (SELECT REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SELECT @@SESSION.sql_mode;

-- Example of a Analytical Query with ROLLUP
CREATE OR REPLACE VIEW vw_avg_salary_by_region_department AS
SELECT 
    r.region_name,
    d.department_name,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM 
    Employee e
    JOIN Department d ON e.department_id = d.department_id
    JOIN Region r ON d.region_id = r.region_id
WHERE 
    e.salary > 60000
GROUP BY 
    r.region_name, d.department_name WITH ROLLUP
HAVING 
    AVG(e.salary) > 65000
ORDER BY 
  CASE WHEN r.region_name IS NULL THEN 2
       WHEN d.department_name IS NULL THEN 1
       ELSE 0 END,
  r.region_name,
  d.department_name;

-- Select from the view
SELECT * FROM vw_avg_salary_by_region_department;

-- re-ennable ONLY_FULL_GROUP_BY mode to get back to the default
SET SESSION sql_mode = CONCAT_WS(',', @@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY');
SELECT @@SESSION.sql_mode;

/* Josiah's code */
USE BusinessAnalytics; 
SELECT r.region_name, d.department_name, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employee e JOIN department d ON e.department_id = d.department_id JOIN region r ON d.region_id = r.region_id
WHERE e.salary > 60000
GROUP BY r.region_name, d.department_name WITH ROLLUP
HAVING AVG(e.salary) > 65000
ORDER BY 
  CASE WHEN r.region_name = 'North' THEN 1
       WHEN r.region_name = 'South' THEN 2
       WHEN r.region_name IS NULL THEN 3 -- Grand Total at the very bottom
       ELSE 4 END,
  CASE WHEN d.department_name IS NULL THEN 1 ELSE 0 END,
  d.department_name;