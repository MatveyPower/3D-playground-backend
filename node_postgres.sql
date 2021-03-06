--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2022-06-26 20:14:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 32772)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    name text,
    id integer NOT NULL,
    description text
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 32770)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 205
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 204 (class 1259 OID 24687)
-- Name: map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map (
    id integer NOT NULL,
    name character varying(200),
    personid integer,
    structure text
);


ALTER TABLE public.map OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24685)
-- Name: map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_id_seq OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 203
-- Name: map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_id_seq OWNED BY public.map.id;


--
-- TOC entry 197 (class 1259 OID 24579)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying(200),
    login character varying(200),
    email character varying(200),
    password character varying(200),
    description boolean,
    passedmaps integer,
    algoritms text,
    type text,
    groups text
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24577)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 196
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 198 (class 1259 OID 24588)
-- Name: program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.program (
    personid integer,
    structure text,
    name character varying(200),
    description character varying(200)
);


ALTER TABLE public.program OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24664)
-- Name: robot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.robot (
    id integer NOT NULL,
    name character varying(200),
    description character varying(200),
    personid integer,
    robotsettings integer
);


ALTER TABLE public.robot OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24662)
-- Name: robot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.robot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.robot_id_seq OWNER TO postgres;

--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 200
-- Name: robot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.robot_id_seq OWNED BY public.robot.id;


--
-- TOC entry 202 (class 1259 OID 24677)
-- Name: robotsettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.robotsettings (
    name character varying(200),
    description character varying(200),
    personid integer,
    robotsettingsid integer,
    leftengine double precision,
    rightengine double precision,
    frontsensor double precision,
    backsensor double precision,
    leftsensor double precision,
    rightsensor double precision
);


ALTER TABLE public.robotsettings OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24642)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    personid integer,
    start text,
    pause text,
    restart text,
    forward text,
    left_left text,
    back text,
    rigth text
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 2771 (class 2604 OID 32775)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 24690)
-- Name: map id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map ALTER COLUMN id SET DEFAULT nextval('public.map_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 24582)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 24667)
-- Name: robot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot ALTER COLUMN id SET DEFAULT nextval('public.robot_id_seq'::regclass);


--
-- TOC entry 2921 (class 0 OID 32772)
-- Dependencies: 206
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2919 (class 0 OID 24687)
-- Dependencies: 204
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.map VALUES (11, 'standart2', NULL, '{"walls":[{"size":[20,5,0.8],"position":[0,2,0],"mass":0},{"size":[0.5,5,20],"position":[10,2,0],"mass":0},{"size":[0.5,5,20],"position":[-10,2,0],"mass":0},{"size":[0.5,5,50],"position":[-25,2,0],"mass":0},{"size":[0.5,5,50],"position":[25,2,0],"mass":0},{"size":[50,5,0.5],"position":[0,2,25],"mass":0},{"size":[50,5,0.5],"position":[0,2,-25],"mass":0}],"endPoint":{"position":[0,0,15]}}');


--
-- TOC entry 2912 (class 0 OID 24579)
-- Dependencies: 197
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person VALUES (4, 'user', 'user', NULL, '$2a$05$rORuZRyjjF1t8hwHWrGeiOaQoOZgKPqFChaHD.Sq4wsXUwctJhUAa', NULL, NULL, NULL, 'user', NULL);
INSERT INTO public.person VALUES (5, 'admin', 'admin', NULL, '$2a$05$9SUQD5Fy8MoTixxBdNSfPOfG0EoAWe6P151RwNthL2789sr.6rvt6', NULL, NULL, NULL, 'admin', NULL);


--
-- TOC entry 2913 (class 0 OID 24588)
-- Dependencies: 198
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2916 (class 0 OID 24664)
-- Dependencies: 201
-- Data for Name: robot; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 24677)
-- Dependencies: 202
-- Data for Name: robotsettings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2914 (class 0 OID 24642)
-- Dependencies: 199
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 205
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 203
-- Name: map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_id_seq', 11, true);


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 196
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 6, true);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 200
-- Name: robot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.robot_id_seq', 1, false);


--
-- TOC entry 2783 (class 2606 OID 32780)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 24697)
-- Name: map map_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT map_name_key UNIQUE (name);


--
-- TOC entry 2781 (class 2606 OID 24695)
-- Name: map map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT map_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 24587)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 24669)
-- Name: robot robot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot
    ADD CONSTRAINT robot_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 24671)
-- Name: robot robot_robotsettings_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot
    ADD CONSTRAINT robot_robotsettings_key UNIQUE (robotsettings);


--
-- TOC entry 2789 (class 2606 OID 24698)
-- Name: map map_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map
    ADD CONSTRAINT map_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(id);


--
-- TOC entry 2784 (class 2606 OID 32781)
-- Name: person person_passedmaps_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_passedmaps_fkey FOREIGN KEY (passedmaps) REFERENCES public.map(id);


--
-- TOC entry 2785 (class 2606 OID 24594)
-- Name: program program_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(id);


--
-- TOC entry 2787 (class 2606 OID 24672)
-- Name: robot robot_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robot
    ADD CONSTRAINT robot_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(id);


--
-- TOC entry 2788 (class 2606 OID 24680)
-- Name: robotsettings robotsettings_robotsettingsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.robotsettings
    ADD CONSTRAINT robotsettings_robotsettingsid_fkey FOREIGN KEY (robotsettingsid) REFERENCES public.robot(robotsettings);


--
-- TOC entry 2786 (class 2606 OID 24648)
-- Name: settings settings_personid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_personid_fkey FOREIGN KEY (personid) REFERENCES public.person(id);


-- Completed on 2022-06-26 20:14:38

--
-- PostgreSQL database dump complete
--

