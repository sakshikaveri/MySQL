
-- CREATING A DATABASE TO STUDY ALTER COMMAND IN DETAIL

CREATE DATABASE test;
USE test;

CREATE TABLE adresses(
	id INT,
    house_number INT,
    city VARCHAR(20),
    postal_code VARCHAR(20)
);

CREATE TABLE people(
	id INT,
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
);

CREATE TABLE pets(
	id INT,
	name VARCHAR(20),
    species VARCHAR(20),
    owner_id INT
);

SHOW TABLES;

-- Adding PRIMARY KEY to a column
DESCRIBE adresses;
ALTER TABLE adresses
ADD PRIMARY KEY (id);

-- removing primary key
ALTER TABLE adresses
DROP PRIMARY KEY;
-- still the Not null constraint remains

-- to remove the null constraint from the id column
ALTER TABLE adresses
MODIFY id INT;

-- People table
DESCRIBE people;
ALTER TABLE people
ADD PRIMARY KEY (id);

-- To add and remove FOREGIN KEY
ALTER TABLE people
ADD CONSTRAINT FK_Peopleaddress
FOREIGN KEY(address_id) REFERENCES adresses(id);

-- to remove foreign key
ALTER TABLE people
DROP FOREIGN KEY FK_Peopleaddress,
DROP INDEX FK_Peopleaddress;

-- Adding UNIQUE constraint
DESCRIBE pets;
ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE(species);

-- removing UNIQUE constraint
ALTER TABLE pets
DROP INDEX u_species;

-- to rename a column by two methods 
ALTER TABLE pets
CHANGE COLUMN species animal_type VARCHAR(20);

ALTER TABLE pets
RENAME COLUMN animal_type TO species;

-- to rename with names inclusding spaces
ALTER TABLE pets
RENAME COLUMN species TO `animal_type`;

ALTER TABLE pets
RENAME COLUMN animal_type TO `animal type`;

ALTER TABLE pets
DROP COLUMN `animal type`;

ALTER TABLE pets
ADD COLUMN species VARCHAR(20);

-- to change datatype of a column using two methods
ALTER TABLE pets
CHANGE COLUMN species species CHAR(5);

ALTER TABLE pets
MODIFY COLUMN species VARCHAR(20);

-- EXERCISES
DESCRIBE pets;
ALTER TABLE pets
ADD PRIMARY KEY(id);

DESCRIBE people;

ALTER TABLE pets
ADD CONSTRAINT FK_Petsowner
FOREIGN KEY(owner_id) REFERENCES people(id);

ALTER TABLE people
ADD COLUMN email VARCHAR(30);

ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE(email);

ALTER TABLE pets
RENAME COLUMN name TO first_name;
-- alternatively
ALTER TABLE pets
CHANGE COLUMN name first_name VARCHAR(20);

ALTER TABLE adresses
MODIFY COLUMN postal_code CHAR(7);
-- alternatively
ALTER TABLE adresses
CHANGE COLUMN postal_code postal_code CHAR(7);