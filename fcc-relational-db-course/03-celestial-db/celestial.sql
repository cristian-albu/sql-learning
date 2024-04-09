-- Active: 1712297526513@@127.0.0.1@5432@universe
CREATE DATABASE universe;

CREATE TABLE galaxy(
    galaxy_id SERIAL PRIMARY KEY, 
    name VARCHAR(30) UNIQUE NOT NULL, 
    year_of_discovery INT , 
    total_missions INT NOT NULL, 
    successful_missions INT NOT NULL,
    CONSTRAINT mission_check CHECK (successful_missions <= total_missions)
);

CREATE TABLE star(
    star_id SERIAL PRIMARY KEY, 
    galaxy_id INT NOT NULL,
    name VARCHAR(30) UNIQUE NOT NULL, 
    light_years NUMERIC(10, 1) NOT NULL,
    description TEXT,
    FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
    planet_id SERIAL PRIMARY KEY,
    star_id INT NOT NULL,
    name VARCHAR(30) UNIQUE NOT NULL, 
    has_life BOOLEAN, 
    distance_to_star INT,  
    visited BOOLEAN DEFAULT false,
    FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE moon(
    moon_id SERIAL PRIMARY KEY,
    planet_id INT,
    name VARCHAR(30) UNIQUE NOT NULL, 
    size_km INT,
    color VARCHAR(10) NOT NULL,
    FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE mission(
    mission_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE mission_destination(
    mission_id INT NOT NULL,
    planet_id INT NOT NULL,
    FOREIGN KEY (mission_id) REFERENCES mission(mission_id),
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
    PRIMARY KEY (mission_id, planet_id)
);


INSERT INTO galaxy(name, year_of_discovery, total_missions, successful_missions) 
VALUES
    ('Andromeda', 964, 50, 49), 
    ('Milky Way Galaxy ', 1910, 44, 36),
    ('Triangulum Galaxy', 1650, 39, 20),
    ('Whirlpool Galaxy', 1773, 15, 5),
    ('Sombrero Galaxy', 1781, 12, 11),
    ('Pinwheel Galaxy', 1781, 6, 6);

SELECT * FROM galaxy;

INSERT INTO star(galaxy_id, name, light_years, description) 
VALUES 
    (1, 'Andromeda Star 1', 20000, 'A bright star in the Andromeda galaxy.'),
    (2, 'Milky Way Star 1', 25000, 'A distant star within the Milky Way.'),
    (3, 'Triangulum Star 1', 30000, 'A massive star in the Triangulum galaxy.'),
    (4, 'Whirlpool Star 1', 35000, 'A swirling star in the Whirlpool galaxy.'),
    (5, 'Sombrero Star 1', 40000, 'A star near the center of the Sombrero galaxy.'),
    (6, 'Pinwheel Star 1', 45000, 'A vibrant star within the Pinwheel galaxy.'),
    (1, 'Andromeda Star 2', 22000, 'Another star in the Andromeda galaxy.'),
    (2, 'Milky Way Star 2', 27000, 'Another distant star within the Milky Way.'),
    (3, 'Triangulum Star 2', 32000, 'Another massive star in the Triangulum galaxy.'),
    (4, 'Whirlpool Star 2', 37000, 'Another swirling star in the Whirlpool galaxy.');
SELECT * FROM star;

INSERT INTO planet(star_id, name, has_life, distance_to_star, visited) 
VALUES 
    (2, 'Andromeda Prime', true, 25000, false),
    (2, 'Andromeda Secundus', false, 35000, false),
    (2, 'Andromeda Tertius', true, 45000, false),
    (3, 'Milky Way Alpha', true, 20000, true),
    (3, 'Milky Way Beta', false, 30000, true),
    (3, 'Milky Way Gamma', true, 40000, false),
    (4, 'Triangulum Prime', false, 15000, false),
    (4, 'Triangulum Secundus', true, 25000, true),
    (5, 'Whirlpool Alpha', true, 30000, false),
    (5, 'Whirlpool Beta', true, 40000, false),
    (6, 'Sombrero Prime', false, 35000, true),
    (7, 'Pinwheel Prime', true, 25000, false);
SELECT * FROM planet;

INSERT INTO moon(planet_id, name, size_km, color) 
VALUES 
    (1, 'Luna', 3474, 'Gray'),
    (1, 'Selene', 2890, 'White'),
    (2, 'Nereid', 340, 'Gray'),
    (2, 'Triton', 2706, 'Pink'),
    (3, 'Phobos', 22, 'Gray'),
    (3, 'Deimos', 12, 'Red'),
    (4, 'Titan', 5150, 'Yellow'),
    (4, 'Enceladus', 500, 'White'),
    (5, 'Ganymede', 5268, 'Gray'),
    (5, 'Callisto', 4820, 'Brown'),
    (6, 'Io', 3637, 'Yellow'),
    (6, 'Europa', 3121, 'White'),
    (7, 'Miranda', 236, 'Gray'),
    (7, 'Ariel', 1158, 'Blue'),
    (8, 'Charon', 1212, 'Gray'),
    (8, 'Nix', 23, 'Gray'),
    (9, 'Proteus', 420, 'Gray'),
    (9, 'Triton II', 2706, 'Pink'),
    (10, 'Phoebe', 22, 'Gray'),
    (10, 'Deimos II', 12, 'Red');
SELECT * FROM moon;

INSERT INTO mission(name, description)
VALUES 
    ('Mission Alpha', 'Exploration of nearby galaxies.'),
    ('Mission Beta', 'Study of exoplanets and their atmospheres.'),
    ('Mission Gamma', 'Search for signs of extraterrestrial life.'),
    ('Mission Delta', 'Study of celestial phenomena.'),
    ('Mission Epsilon', 'Exploration of distant star systems.');

SELECT * FROM mission;

-- Assigning destinations to each mission
INSERT INTO mission_destination(mission_id, planet_id)
VALUES 
    (1, 1), -- Mission Alpha to Andromeda Prime
    (1, 4), -- Mission Alpha to Milky Way Alpha
    (2, 2), -- Mission Beta to Andromeda Secundus
    (2, 5), -- Mission Beta to Whirlpool Alpha
    (3, 3), -- Mission Gamma to Andromeda Tertius
    (3, 6), -- Mission Gamma to Sombrero Prime
    (4, 7), -- Mission Delta to Triangulum Prime
    (4, 10), -- Mission Delta to Phoebe
    (5, 8), -- Mission Epsilon to Whirlpool Beta
    (5, 12); -- Mission Epsilon to Deimos II

SELECT * FROM mission_destination;


SELECT mission.name, planet.name AS planet
FROM mission_destination
JOIN mission ON mission_destination.mission_id = mission.mission_id
JOIN planet ON mission_destination.planet_id = planet.planet_id
WHERE mission.name = 'Mission Alpha';

DROP TABLE mission_destination;
DROP TABLE mission;
DROP TABLE moon;
DROP TABLE planet;
DROP TABLE star;
DROP TABLE galaxy;

