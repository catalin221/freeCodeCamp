--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean
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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    classic_planet boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    radius numeric(10,1) NOT NULL,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Earth is here', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'No clue about this one', 112233, false);
INSERT INTO public.galaxy VALUES (3, 'Ricky Gervais', 'Its a whole universe', 100001, true);
INSERT INTO public.galaxy VALUES (4, 'Hocus Pocus Preparatus', 'Some magic galaxy', 9999999, true);
INSERT INTO public.galaxy VALUES (5, 'Here we go', 'Here we go?', 1212, false);
INSERT INTO public.galaxy VALUES (6, 'Mario universe', 'SHROOOOOOOOMS', 911, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', 'WE LIVE HEEEEEEREEEE!', 10000, 1);
INSERT INTO public.moon VALUES (2, '2', 'WE DO NOT LIVE HEEEEEEREEEE!', 10000, 1);
INSERT INTO public.moon VALUES (3, '3', 'WE DO NOT LIVE HEEEEEEREEEE!', 20000, 2);
INSERT INTO public.moon VALUES (4, '4', 'WE DO NOT LIVE HEEEEEEREEEE!', 30000, 2);
INSERT INTO public.moon VALUES (5, '5', 'WE DO NOT LIVE HEEEEEEREEEE!', 40000, 3);
INSERT INTO public.moon VALUES (6, '6', 'WE DO NOT LIVE HEEEEEEREEEE!', 50000, 3);
INSERT INTO public.moon VALUES (7, '7', 'WE DO NOT LIVE HEEEEEEREEEE!', 60000, 4);
INSERT INTO public.moon VALUES (8, '8', 'WE DO NOT LIVE HEEEEEEREEEE!', 70000, 4);
INSERT INTO public.moon VALUES (9, '9', 'WE DO NOT LIVE HEEEEEEREEEE!', 80000, 5);
INSERT INTO public.moon VALUES (10, '10', 'WE DO NOT LIVE HEEEEEEREEEE!', 90000, 5);
INSERT INTO public.moon VALUES (11, '11', 'WE DO NOT LIVE HEEEEEEREEEE!', 99000, 7);
INSERT INTO public.moon VALUES (12, '12', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 6);
INSERT INTO public.moon VALUES (13, '13', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 5);
INSERT INTO public.moon VALUES (14, '14', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 4);
INSERT INTO public.moon VALUES (15, '15', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 3);
INSERT INTO public.moon VALUES (16, '16', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 2);
INSERT INTO public.moon VALUES (17, '17', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 1);
INSERT INTO public.moon VALUES (18, '18', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 2);
INSERT INTO public.moon VALUES (19, '19', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 3);
INSERT INTO public.moon VALUES (20, '20', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Eaaaarth', 'WE LIVE HEEEEEEREEEE!', 10000, true, 1);
INSERT INTO public.planet VALUES (2, 'NotEaaaarth', 'WE DO NOT LIVE HEEEEEEREEEE!', 10000, true, 1);
INSERT INTO public.planet VALUES (3, 'AgainNotEaaaarth', 'WE DO NOT LIVE HEEEEEEREEEE!', 20000, true, 2);
INSERT INTO public.planet VALUES (4, 'WellNotEaaaarth', 'WE DO NOT LIVE HEEEEEEREEEE!', 30000, true, 2);
INSERT INTO public.planet VALUES (5, 'PlanetNotEaaaarth', 'WE DO NOT LIVE HEEEEEEREEEE!', 40000, true, 3);
INSERT INTO public.planet VALUES (6, 'Venuss', 'WE DO NOT LIVE HEEEEEEREEEE!', 50000, true, 3);
INSERT INTO public.planet VALUES (7, 'Bogus', 'WE DO NOT LIVE HEEEEEEREEEE!', 60000, true, 4);
INSERT INTO public.planet VALUES (8, 'BingBong', 'WE DO NOT LIVE HEEEEEEREEEE!', 70000, true, 4);
INSERT INTO public.planet VALUES (9, 'Bongus', 'WE DO NOT LIVE HEEEEEEREEEE!', 80000, true, 5);
INSERT INTO public.planet VALUES (10, 'Pisces', 'WE DO NOT LIVE HEEEEEEREEEE!', 90000, true, 5);
INSERT INTO public.planet VALUES (11, 'Wotah', 'WE DO NOT LIVE HEEEEEEREEEE!', 99000, true, 6);
INSERT INTO public.planet VALUES (12, 'Fiiiiif', 'WE DO NOT LIVE HEEEEEEREEEE!', 98000, true, 6);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Regular', 'This is beautiful', true, 1);
INSERT INTO public.planet_type VALUES (2, 'Irregular', 'This too!', true, 2);
INSERT INTO public.planet_type VALUES (3, 'TripleDouble', 'Well not this one :(', false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A', 'A', 13600, true, 10000.0, 1);
INSERT INTO public.star VALUES (2, 'B', 'B', 112233, false, 12345.0, 2);
INSERT INTO public.star VALUES (3, 'C', 'C', 100001, true, 123456.0, 3);
INSERT INTO public.star VALUES (4, 'D', 'D', 9999999, true, 911.0, 4);
INSERT INTO public.star VALUES (5, 'E', 'E', 1212, false, 90909.0, 5);
INSERT INTO public.star VALUES (6, 'F', 'F', 911, true, 111222.0, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet_type planet_types_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

