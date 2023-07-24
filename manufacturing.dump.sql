--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: devices; Type: TABLE; Schema: public; Owner: lark
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.devices OWNER TO lark;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: lark
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO lark;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lark
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: lark
--

CREATE TABLE public.parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE public.parts OWNER TO lark;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: lark
--

CREATE SEQUENCE public.parts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_id_seq OWNER TO lark;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lark
--

ALTER SEQUENCE public.parts_id_seq OWNED BY public.parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.parts ALTER COLUMN id SET DEFAULT nextval('public.parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: lark
--

INSERT INTO public.devices VALUES (1, 'accelerometer', '2023-07-23 13:54:53.561779');
INSERT INTO public.devices VALUES (2, 'gyroscope', '2023-07-23 13:54:53.561779');
INSERT INTO public.devices VALUES (3, 'Magnetometer', '2023-07-23 16:33:47.506997');


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: lark
--

INSERT INTO public.parts VALUES (1, 1993, 1);
INSERT INTO public.parts VALUES (2, 2271, 1);
INSERT INTO public.parts VALUES (3, 3433, 1);
INSERT INTO public.parts VALUES (4, 473, 2);
INSERT INTO public.parts VALUES (5, 8768, 2);
INSERT INTO public.parts VALUES (6, 8168, 2);
INSERT INTO public.parts VALUES (9, 5329, NULL);
INSERT INTO public.parts VALUES (10, 4595, NULL);
INSERT INTO public.parts VALUES (11, 3607, NULL);
INSERT INTO public.parts VALUES (12, 42, 3);
INSERT INTO public.parts VALUES (7, 5308, 1);
INSERT INTO public.parts VALUES (8, 8680, 1);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lark
--

SELECT pg_catalog.setval('public.devices_id_seq', 3, true);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lark
--

SELECT pg_catalog.setval('public.parts_id_seq', 12, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lark
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- PostgreSQL database dump complete
--

