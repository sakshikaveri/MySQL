USE coffee_store;

DESCRIBE products;

ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

-- Now deleting the recently added column
ALTER TABLE products
DROP COLUMN coffee_origin;

-- Creating a dummy table for deleting it
