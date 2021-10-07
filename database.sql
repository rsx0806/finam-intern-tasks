--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18 (Ubuntu 10.18-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.18 (Ubuntu 10.18-0ubuntu0.18.04.1)

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genres OWNER TO root;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genre_id_seq OWNER TO root;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- Name: singers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.singers (
    singer_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.singers OWNER TO root;

--
-- Name: singers_singer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.singers_singer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.singers_singer_id_seq OWNER TO root;

--
-- Name: singers_singer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.singers_singer_id_seq OWNED BY public.singers.singer_id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying(255),
    singer integer,
    genre integer[],
    duration integer,
    release_date date
);


ALTER TABLE public.songs OWNER TO root;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO root;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- Name: singers singer_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.singers ALTER COLUMN singer_id SET DEFAULT nextval('public.singers_singer_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.genres (genre_id, name) FROM stdin;
1	Rock
2	Pop
3	R&B
4	Blues
\.


--
-- Data for Name: singers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.singers (singer_id, name) FROM stdin;
1	ABBA
2	Mariah Carey
3	Pink Floyd
4	Led Zeppelin
5	Rammstein
6	AC/DC
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.songs (id, name, singer, genre, duration, release_date) FROM stdin;
1	Waterloo	1	{1,2}	180	1974-04-20
2	Ring Ring	1	{1,2}	190	1974-07-13
3	SOS	1	{1,2}	280	1975-04-20
4	FERNANDO	1	{1,2}	120	1976-03-27
5	I HAVE A DREAM	1	{1,2}	180	1979-12-15
6	5/4	5	{1}	330	2000-04-16
7	Adios	5	{1}	231	2002-07-13
8	Amerika	5	{1}	231	2004-10-13
9	All in Your Mind	2	{2}	280	1990-02-13
10	I Wish You Knew	2	{2}	214	2005-10-13
11	A Great Day for Freedom	3	{1,4}	280	1994-07-09
12	A New Machine (Part 1)	3	{1,4}	106	1987-03-25
13	Desire (bonus)	4	{1,4}	310	2015-07-09
14	LA Drone	4	{1,4}	250	2003-05-25
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 4, true);


--
-- Name: singers_singer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.singers_singer_id_seq', 6, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.songs_id_seq', 14, true);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: singers singers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.singers
    ADD CONSTRAINT singers_pkey PRIMARY KEY (singer_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs fk_singer; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT fk_singer FOREIGN KEY (singer) REFERENCES public.singers(singer_id);


--
-- PostgreSQL database dump complete
--

