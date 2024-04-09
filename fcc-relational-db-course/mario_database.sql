-- Active: 1712297526513@@127.0.0.1@5432@mario_database
CREATE DATABASE first_database;
CREATE DATABASE second_database;
CREATE TABLE first_table();
CREATE TABLE second_table();
ALTER TABLE second_table ADD COLUMN first_column INT;
ALTER TABLE second_table ADD COLUMN id INT;
ALTER TABLE second_table ADD COLUMN age INT;
ALTER TABLE second_table DROP COLUMN age;
ALTER TABLE second_table DROP COLUMN first_column;
ALTER TABLE second_table ADD COLUMN name VARCHAR(30);
ALTER TABLE second_table RENAME COLUMN name TO username;
INSERT INTO second_table(id, username) VALUES(1, 'Samus');
SELECT * FROM second_table;
INSERT INTO second_table(id, username) VALUES(2, 'Mario');
INSERT INTO second_table(id, username) VALUES(3, 'Luigi');
DELETE FROM second_table WHERE username='Luigi';
DELETE FROM second_table WHERE username='Mario';
DELETE FROM second_table WHERE username='Samus';
ALTER TABLE second_table DROP COLUMN username;
ALTER TABLE second_table DROP COLUMN id;
DROP TABLE second_table;
DROP TABLE first_table;
ALTER DATABASE first_database RENAME TO mario_database;
DROP DATABASE second_database;
CREATE TABLE characters();
ALTER TABLE characters ADD COLUMN character_id SERIAL;
ALTER TABLE characters ADD COLUMN name VARCHAR(30) NOT NULL;
ALTER TABLE characters ADD COLUMN homeland VARCHAR(60);
ALTER TABLE characters ADD COLUMN favorite_color VARCHAR(30);
INSERT INTO characters(name, homeland, favorite_color) VALUES('Mario', 'Mushroom Kingdom', 'Red');
SELECT * FROM characters;
INSERT INTO characters(name, homeland, favorite_color) VALUES('Luigi', 'Mushroom Kingdom', 'Green');
SELECT * FROM characters;
INSERT INTO characters(name, homeland, favorite_color) VALUES('Peach', 'Mushroom Kingdom', 'Pink');
INSERT INTO characters(name, homeland, favorite_color) 
VALUES('Toadstool', 'Mushroom Kingdom', 'Red'),
('Bowser', 'Mushroom Kingdom', 'Green');
INSERT INTO characters(name, homeland, favorite_color) 
VALUES('Daisy', 'Sarasaland', 'Yellow'),
('Yoshi', 'Dinosaur Land', 'Green');
SELECT * FROM characters;
UPDATE characters SET favorite_color='Orange' WHERE name='Daisy';
UPDATE characters SET name='Toad' WHERE favorite_color='Red';
UPDATE characters SET name='Mario' WHERE character_id=1;
UPDATE characters SET favorite_color='Blue' WHERE name='Toad';
UPDATE characters SET favorite_color='Yellow' WHERE name='Bowser';
UPDATE characters SET homeland='Koopa Kingdom' WHERE name='Bowser';
SELECT * FROM characters ORDER BY character_id;
ALTER TABLE characters ADD PRIMARY KEY(name);
ALTER TABLE characters DROP CONSTRAINT characters_pkey;
ALTER TABLE characters ADD PRIMARY KEY(character_id);
CREATE TABLE more_info();
ALTER TABLE more_info ADD COLUMN more_info_id SERIAL;
ALTER TABLE more_info ADD PRIMARY KEY(more_info_id);