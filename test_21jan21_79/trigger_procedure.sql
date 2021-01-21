# TRIGGER INSERT, UPDATE, DELETE
# PROCEDURE INSERT

# TRIGGER insert_product

CREATE TRIGGER insert_product 
AFTER INSERT ON products
FOR EACH ROW 
BEGIN
INSERT INTO product_log(
	id,
	product_name,
	product_price,
	action,
	product_id 
) 
VALUES(
	NULL, 
	new.product_name,
	new.product_price, 
	"INSERT",
	new.id
);
END

# TRIGGER update_product

CREATE TRIGGER update_product 
AFTER UPDATE ON products
FOR EACH ROW 
BEGIN
INSERT INTO product_log(
	id,
	product_name,
	product_price,
	action,
	product_id 
) 
VALUES(
	NULL, 
	old.product_name,
	old.product_price, 
	"UPDATE",
	old.id
);
END

# TRIGGER delete_product

CREATE TRIGGER delete_product
AFTER DELETE ON products 
FOR EACH ROW 
BEGIN 
INSERT INTO product_log(
	id,
	product_name,
	product_price, 
	action,
	product_id 
) 
VALUES(
	NULL, 
	old.product_name,
	old.product_price, 
	"DELETE",
	old.id
); 
END

# PROCEDURE insert_products

DELIMITER $$
CREATE PROCEDURE `insert_products`(
	IN `product_name` VARCHAR(50), 
	IN `product_details` VARCHAR(200), 
	IN `product_price` DECIMAL(5, 2)
	)
BEGIN
INSERT INTO products(
	product_name,
	product_details,
	product_price
) 
VALUES(
	product_name,
	product_details,
	product_price)
END $$
DELIMITER ;