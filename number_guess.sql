--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: record_of_players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.record_of_players (
    player_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.record_of_players OWNER TO freecodecamp;

--
-- Name: record_of_players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.record_of_players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.record_of_players_player_id_seq OWNER TO freecodecamp;

--
-- Name: record_of_players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.record_of_players_player_id_seq OWNED BY public.record_of_players.player_id;


--
-- Name: record_of_players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record_of_players ALTER COLUMN player_id SET DEFAULT nextval('public.record_of_players_player_id_seq'::regclass);


--
-- Data for Name: record_of_players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.record_of_players VALUES (1, 'user_1776991920777', 0, 0);
INSERT INTO public.record_of_players VALUES (2, 'user_1776991920776', 0, 0);
INSERT INTO public.record_of_players VALUES (4, 'user_1776992100808', 0, 0);
INSERT INTO public.record_of_players VALUES (5, 'user_1776992100807', 0, 0);
INSERT INTO public.record_of_players VALUES (6, 'user_1776992344200', 0, 0);
INSERT INTO public.record_of_players VALUES (7, 'user_1776992344199', 0, 0);
INSERT INTO public.record_of_players VALUES (9, 'user_1776992466527', 2, 406);
INSERT INTO public.record_of_players VALUES (8, 'user_1776992466528', 5, 49);
INSERT INTO public.record_of_players VALUES (3, 'sam', 4, 10);
INSERT INTO public.record_of_players VALUES (11, 'user_1776992638166', 2, 527);
INSERT INTO public.record_of_players VALUES (10, 'user_1776992638167', 5, 329);
INSERT INTO public.record_of_players VALUES (13, 'user_1776992658942', 2, 89);
INSERT INTO public.record_of_players VALUES (12, 'user_1776992658943', 5, 104);
INSERT INTO public.record_of_players VALUES (15, 'user_1776992662772', 2, 187);
INSERT INTO public.record_of_players VALUES (14, 'user_1776992662773', 5, 482);
INSERT INTO public.record_of_players VALUES (17, 'user_1776992669328', 2, 230);
INSERT INTO public.record_of_players VALUES (16, 'user_1776992669329', 5, 129);
INSERT INTO public.record_of_players VALUES (19, 'user_1776992693922', 2, 550);
INSERT INTO public.record_of_players VALUES (18, 'user_1776992693923', 5, 5);
INSERT INTO public.record_of_players VALUES (21, 'user_1776992715547', 2, 482);
INSERT INTO public.record_of_players VALUES (20, 'user_1776992715548', 5, 166);
INSERT INTO public.record_of_players VALUES (23, 'user_1776992757680', 2, 405);
INSERT INTO public.record_of_players VALUES (22, 'user_1776992757681', 5, 40);
INSERT INTO public.record_of_players VALUES (25, 'user_1776992765662', 2, 540);
INSERT INTO public.record_of_players VALUES (24, 'user_1776992765663', 5, 212);
INSERT INTO public.record_of_players VALUES (27, 'user_1776992800316', 2, 36);
INSERT INTO public.record_of_players VALUES (26, 'user_1776992800317', 5, 350);


--
-- Name: record_of_players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.record_of_players_player_id_seq', 27, true);


--
-- Name: record_of_players record_of_players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record_of_players
    ADD CONSTRAINT record_of_players_pkey PRIMARY KEY (player_id);


--
-- Name: record_of_players record_of_players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.record_of_players
    ADD CONSTRAINT record_of_players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

