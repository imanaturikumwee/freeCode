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
    name character varying(60) NOT NULL,
    diameter_in_light_years numeric(10,2),
    galaxy_type character varying(60),
    age_in_billion_years numeric(4,2),
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_in_miles integer,
    has_life boolean,
    planet_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    planet_type character varying(60),
    diameter_in_miles integer,
    is_spherical boolean,
    has_life boolean,
    age_in_billion_years numeric(4,2),
    number_of_moons integer,
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    description text,
    star_type character varying(60),
    diameter_in_miles integer,
    age_in_million_years integer,
    galaxy_id integer NOT NULL
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(60) NOT NULL,
    number_of_stars integer,
    number_of_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000.00, 'Spiral', 10.00, 'A small companion to the Milky way and Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 120000.00, 'Elliptical', 13.00, 'Contains a supper massive black hole');
INSERT INTO public.galaxy VALUES (5, 'Sembrero', 50000.00, 'Spiral', 10.00, 'Named for its resemblance to a mexican hat');
INSERT INTO public.galaxy VALUES (6, 'Centaurus', 60000.00, 'Elliptical', 10.00, 'A nearby radio galaxy with an active galactic nucleus');
INSERT INTO public.galaxy VALUES (7, 'Sculptor', 50000.00, 'Irregular', 13.00, 'Lack a clear stracture and low in gase content');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152000.00, 'barred spiral', 10.01, 'The nearest major galaxy to the Milk way');
INSERT INTO public.galaxy VALUES (1, 'Milk way', 105700.00, 'spiral', 13.60, 'The home to the incredible solar system');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 7900, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 2618, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 8, false, 4);
INSERT INTO public.moon VALUES (4, 'Titan', 3200, false, 6);
INSERT INTO public.moon VALUES (5, 'Tethys', 3200, false, 6);
INSERT INTO public.moon VALUES (6, 'Dione', NULL, false, 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', NULL, false, 6);
INSERT INTO public.moon VALUES (8, 'Epimetheus', NULL, false, 6);
INSERT INTO public.moon VALUES (9, 'Prometheus', NULL, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, false, 6);
INSERT INTO public.moon VALUES (12, 'Janus', NULL, false, 6);
INSERT INTO public.moon VALUES (13, 'Io', NULL, false, 5);
INSERT INTO public.moon VALUES (14, 'Europa', NULL, false, 5);
INSERT INTO public.moon VALUES (15, 'Ganymede', NULL, false, 5);
INSERT INTO public.moon VALUES (16, 'Callisto', NULL, false, 5);
INSERT INTO public.moon VALUES (17, 'Amalthea', NULL, false, 5);
INSERT INTO public.moon VALUES (18, 'Himalia', NULL, false, 5);
INSERT INTO public.moon VALUES (19, 'Elara', NULL, false, 5);
INSERT INTO public.moon VALUES (20, 'Pasiphae', NULL, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestial', 7907, true, true, 4.54, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Terrestial', 3032, true, false, 4.50, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestial', 7521, true, false, 4.50, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestial', 4212, true, false, 4.60, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 88695, true, false, 4.60, 95, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 74897, true, false, 4.60, 146, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 30598, true, false, 4.60, 14, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Terrestial', 18977, true, false, 4.60, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 'Terrestial', 7907, true, NULL, 8.00, NULL, 6);
INSERT INTO public.planet VALUES (12, 'Osiris', 'Gas giant', 119738, true, false, 4.60, NULL, 8);
INSERT INTO public.planet VALUES (13, 'Wasp-12b', 'Gas giant', 168520, true, false, 4.60, NULL, 10);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice gaint', 31518, true, false, 4.60, 27, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System. It is a massive, hot ball of plasma, inflated and heated by energy produced by nuclear fusion', 'G-type-Yellow dwarth', 864600, 4600, 1);
INSERT INTO public.star VALUES (4, 'Antares', 'Antares is the brightest star in the constellation of Scorpius', 'red supergiant', 835000000, 11, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Betelgeuse is a red supergiant star located in the constellation of Orion. It is the star in Orion upper left shoulder and is considered the brightest or second brightest star in the constellation', 'red supergiant', 700000000, 10, 1);
INSERT INTO public.star VALUES (7, 'iwacu', 'A bright star', 'white dwarth', 100000, 10, 2);
INSERT INTO public.star VALUES (8, 'Ikaze', 'A white star', 'white dwarth', 400000, 11, 3);
INSERT INTO public.star VALUES (9, 'Ihumure', 'A red giant star', 'red dwarth', 500000, 12, 4);
INSERT INTO public.star VALUES (10, 'Imena', 'A brown giant star', 'brown dwarth', 50000, 9, 5);
INSERT INTO public.star VALUES (11, 'Imanzi', 'A brightest  giant star', ' main sequence', 120000, 11, 6);
INSERT INTO public.star VALUES (12, 'Ingenzi', 'A brightest  giant star', ' main sequence', 1200000, 11, 7);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar system', 1, 8, 1);
INSERT INTO public.system VALUES (2, 'Alpha Centauri system', 3, 4, 1);
INSERT INTO public.system VALUES (3, 'TRAPPIST-1 system', 1, 7, 1);
INSERT INTO public.system VALUES (4, 'Kepler-90 system', 1, 8, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 4, true);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


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
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

