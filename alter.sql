CREATE TABLE Persons (
    personId INT,
    lastName VARCHAR(255) NOT NULL,
    firstName VARCHAR(255)
);



------------------------------------------
ALTER TABLE persons
ADD COLUMN age VARCHAR(255);

ALTER TABLE persons
DROP COLUMN age;
------------------------------------------



------------------------------------------
ALTER TABLE Persons
ALTER COLUMN personId SET NOT NULL;

ALTER TABLE Persons
ALTER COLUMN personId DROP NOT NULL;
------------------------------------------



------------------------------------------
ALTER TABLE Persons
ALTER COLUMN personId TYPE VARCHAR(255);

ALTER TABLE Persons
ALTER COLUMN personId TYPE INT
USING personId::INT
------------------------------------------



------------------------------------------
ALTER TABLE Persons
ADD CONSTRAINT personId UNIQUE (personId);

ALTER TABLE Persons
DROP CONSTRAINT personId;
------------------------------------------



------------------------------------------
ALTER TABLE Persons
ADD CONSTRAINT i_personId PRIMARY KEY (personId);

ALTER TABLE Persons
DROP CONSTRAINT i_personId;
------------------------------------------


