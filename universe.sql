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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    hemisphere character varying(60),
    info text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    visible_with_naked_eye boolean,
    distance_from_earth_in_light_years integer,
    constellation_id integer,
    apparent_magnitude numeric(3,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_in_km integer,
    year_discovered date,
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
    name character varying(60) NOT NULL,
    type character varying(60),
    is_habitable boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_earth_in_light_years integer,
    type character varying(60),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Northern', NULL);
INSERT INTO public.constellation VALUES (2, 'Canes Venatici', 'Northern', NULL);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Northern Circumpolar', NULL);
INSERT INTO public.constellation VALUES (4, 'Virgo', 'Southern', NULL);
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'Southern', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', true, 0, 5, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', true, 2500000, 1, 3.4);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'starburst', false, 11500000, 3, 8.4);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'spiral', false, 20870000, 3, 7.9);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'barred spiral', false, 29350000, 4, 8.4);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'spiral', false, 30000000, 2, 8.4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 23, '1877-01-01', 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 13, '1877-01-01', 5);
INSERT INTO public.moon VALUES (4, 'Io', 3630, '1610-01-01', 7);
INSERT INTO public.moon VALUES (5, 'Europa', 3138, '1610-01-01', 7);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, '1610-01-01', 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 4800, '1610-01-01', 7);
INSERT INTO public.moon VALUES (8, 'Amalthea', 200, '1892-01-01', 7);
INSERT INTO public.moon VALUES (9, 'Thebe', 90, '1979-01-01', 7);
INSERT INTO public.moon VALUES (10, 'Mimas', 394, '1789-01-01', 8);
INSERT INTO public.moon VALUES (11, 'Enceladus', 502, '1789-01-01', 8);
INSERT INTO public.moon VALUES (12, 'Tethys', 1048, '1684-01-01', 8);
INSERT INTO public.moon VALUES (13, 'Dione', 1120, '1684-01-01', 8);
INSERT INTO public.moon VALUES (14, 'Rhea', 1530, '1672-01-01', 8);
INSERT INTO public.moon VALUES (15, 'Titan', 5150, '1655-01-01', 8);
INSERT INTO public.moon VALUES (16, 'Hyperion', 270, '1848-01-01', 8);
INSERT INTO public.moon VALUES (17, 'Iapetus', 1435, '1671-01-01', 8);
INSERT INTO public.moon VALUES (18, 'Phoebe', 220, '1899-01-01', 8);
INSERT INTO public.moon VALUES (19, 'Janus', 178, '1966-01-01', 8);
INSERT INTO public.moon VALUES (20, 'Ariel', 1160, '1851-01-01', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'terrestrial', true, 1);
INSERT INTO public.planet VALUES (2, 'Kepler-186f', 'exoplanet', true, 11);
INSERT INTO public.planet VALUES (3, 'Gliese 581g', 'exoplanet', true, 7);
INSERT INTO public.planet VALUES (4, 'HD 40307g', 'exoplanet', true, 8);
INSERT INTO public.planet VALUES (5, 'Mars', 'terrestrial', false, 1);
INSERT INTO public.planet VALUES (6, 'Venus', 'terrestrial', false, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'gas giant', false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 'gas giant', false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 'ice giant', false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'ice giant', false, 1);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'exoplanet', true, 9);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'exoplanet', false, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 97, 'sub-giant', 2);
INSERT INTO public.star VALUES (3, 'Dubhe', 123, 'red giant', 3);
INSERT INTO public.star VALUES (4, 'Mizar', 83, 'main sequence', 4);
INSERT INTO public.star VALUES (5, 'Spica', 261, 'blue giant', 5);
INSERT INTO public.star VALUES (6, 'Alkaid', 104, 'main sequence', 6);
INSERT INTO public.star VALUES (7, 'Gliese 581', 20, 'red dwarf', 1);
INSERT INTO public.star VALUES (8, 'HD 40307', 42, 'orange main sequence', 1);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 4, 'red dwarf', 1);
INSERT INTO public.star VALUES (10, '51 Pegasi', 50, 'main sequence', 1);
INSERT INTO public.star VALUES (11, 'Kepler-186', 580, 'red dwarf', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

