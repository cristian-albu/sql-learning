--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_of_discovery integer,
    total_missions integer NOT NULL,
    successful_missions integer NOT NULL,
    CONSTRAINT mission_check CHECK ((successful_missions <= total_missions))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    size_km integer,
    color character varying(10) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    distance_to_star integer,
    visited boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    light_years numeric(10,1) NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 964, 50, 49);
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy ', 1910, 44, 36);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 1650, 39, 20);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 1773, 15, 5);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 1781, 12, 11);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 1781, 6, 6);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Mission Alpha', 'Exploration of nearby galaxies.');
INSERT INTO public.mission VALUES (2, 'Mission Beta', 'Study of exoplanets and their atmospheres.');
INSERT INTO public.mission VALUES (3, 'Mission Gamma', 'Search for signs of extraterrestrial life.');
INSERT INTO public.mission VALUES (4, 'Mission Delta', 'Study of celestial phenomena.');
INSERT INTO public.mission VALUES (5, 'Mission Epsilon', 'Exploration of distant star systems.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 3474, 'Gray');
INSERT INTO public.moon VALUES (2, 1, 'Selene', 2890, 'White');
INSERT INTO public.moon VALUES (3, 2, 'Nereid', 340, 'Gray');
INSERT INTO public.moon VALUES (4, 2, 'Triton', 2706, 'Pink');
INSERT INTO public.moon VALUES (5, 3, 'Phobos', 22, 'Gray');
INSERT INTO public.moon VALUES (6, 3, 'Deimos', 12, 'Red');
INSERT INTO public.moon VALUES (7, 4, 'Titan', 5150, 'Yellow');
INSERT INTO public.moon VALUES (8, 4, 'Enceladus', 500, 'White');
INSERT INTO public.moon VALUES (9, 5, 'Ganymede', 5268, 'Gray');
INSERT INTO public.moon VALUES (10, 5, 'Callisto', 4820, 'Brown');
INSERT INTO public.moon VALUES (11, 6, 'Io', 3637, 'Yellow');
INSERT INTO public.moon VALUES (12, 6, 'Europa', 3121, 'White');
INSERT INTO public.moon VALUES (13, 7, 'Miranda', 236, 'Gray');
INSERT INTO public.moon VALUES (14, 7, 'Ariel', 1158, 'Blue');
INSERT INTO public.moon VALUES (15, 8, 'Charon', 1212, 'Gray');
INSERT INTO public.moon VALUES (16, 8, 'Nix', 23, 'Gray');
INSERT INTO public.moon VALUES (17, 9, 'Proteus', 420, 'Gray');
INSERT INTO public.moon VALUES (18, 9, 'Triton II', 2706, 'Pink');
INSERT INTO public.moon VALUES (19, 10, 'Phoebe', 22, 'Gray');
INSERT INTO public.moon VALUES (20, 10, 'Deimos II', 12, 'Red');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 'Andromeda Prime', true, 25000, false);
INSERT INTO public.planet VALUES (2, 2, 'Andromeda Secundus', false, 35000, false);
INSERT INTO public.planet VALUES (3, 2, 'Andromeda Tertius', true, 45000, false);
INSERT INTO public.planet VALUES (4, 3, 'Milky Way Alpha', true, 20000, true);
INSERT INTO public.planet VALUES (5, 3, 'Milky Way Beta', false, 30000, true);
INSERT INTO public.planet VALUES (6, 3, 'Milky Way Gamma', true, 40000, false);
INSERT INTO public.planet VALUES (7, 4, 'Triangulum Prime', false, 15000, false);
INSERT INTO public.planet VALUES (8, 4, 'Triangulum Secundus', true, 25000, true);
INSERT INTO public.planet VALUES (9, 5, 'Whirlpool Alpha', true, 30000, false);
INSERT INTO public.planet VALUES (10, 5, 'Whirlpool Beta', true, 40000, false);
INSERT INTO public.planet VALUES (11, 6, 'Sombrero Prime', false, 35000, true);
INSERT INTO public.planet VALUES (12, 7, 'Pinwheel Prime', true, 25000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Andromeda Star 1', 20000.0, 'A bright star in the Andromeda galaxy.');
INSERT INTO public.star VALUES (2, 2, 'Milky Way Star 1', 25000.0, 'A distant star within the Milky Way.');
INSERT INTO public.star VALUES (3, 3, 'Triangulum Star 1', 30000.0, 'A massive star in the Triangulum galaxy.');
INSERT INTO public.star VALUES (4, 4, 'Whirlpool Star 1', 35000.0, 'A swirling star in the Whirlpool galaxy.');
INSERT INTO public.star VALUES (5, 5, 'Sombrero Star 1', 40000.0, 'A star near the center of the Sombrero galaxy.');
INSERT INTO public.star VALUES (6, 6, 'Pinwheel Star 1', 45000.0, 'A vibrant star within the Pinwheel galaxy.');
INSERT INTO public.star VALUES (7, 1, 'Andromeda Star 2', 22000.0, 'Another star in the Andromeda galaxy.');
INSERT INTO public.star VALUES (8, 2, 'Milky Way Star 2', 27000.0, 'Another distant star within the Milky Way.');
INSERT INTO public.star VALUES (9, 3, 'Triangulum Star 2', 32000.0, 'Another massive star in the Triangulum galaxy.');
INSERT INTO public.star VALUES (10, 4, 'Whirlpool Star 2', 37000.0, 'Another swirling star in the Whirlpool galaxy.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

