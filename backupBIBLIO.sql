--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Prestamos" (
    id_prestamo integer NOT NULL,
    registro integer,
    codigo integer,
    fecha_prestamo timestamp with time zone,
    fecha_devolucion_estimada timestamp with time zone,
    fecha_devolucion_real timestamp with time zone,
    estado character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Prestamos" OWNER TO postgres;

--
-- Name: Prestamos_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Prestamos_id_prestamo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Prestamos_id_prestamo_seq" OWNER TO postgres;

--
-- Name: Prestamos_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Prestamos_id_prestamo_seq" OWNED BY public."Prestamos".id_prestamo;


--
-- Name: Sancions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sancions" (
    id_sancion integer NOT NULL,
    id_usuario integer NOT NULL,
    tipo_sancion integer NOT NULL,
    estado boolean NOT NULL,
    fecha_inicio timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Sancions" OWNER TO postgres;

--
-- Name: Sancions_id_sancion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sancions_id_sancion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Sancions_id_sancion_seq" OWNER TO postgres;

--
-- Name: Sancions_id_sancion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sancions_id_sancion_seq" OWNED BY public."Sancions".id_sancion;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    categoria integer NOT NULL,
    sexo character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Usuario_cedhis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario_cedhis" (
    codigo integer NOT NULL,
    nombres character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    categoria character varying(255) NOT NULL,
    sexo character varying(255) NOT NULL,
    existe_sancion boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Usuario_cedhis" OWNER TO postgres;

--
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    registro integer NOT NULL,
    ubicacion_estanteria character varying(255),
    titulo text,
    autor text,
    codigo_dewey character varying(255),
    notacion_interna character varying(255),
    codigo character varying(255),
    isbn character varying(255),
    editorial text,
    tema text,
    idioma text,
    tipo_material text,
    num_paginas text,
    num_edicion character varying(255),
    ciudad character varying(255),
    ano character varying(255),
    tabla_contenido text,
    disponibilidad boolean,
    url_cover character varying(255)
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- Name: libros_favoritos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_favoritos (
    id_favorito integer NOT NULL,
    codigo integer NOT NULL,
    registro integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.libros_favoritos OWNER TO postgres;

--
-- Name: libros_favoritos_id_favorito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_favoritos_id_favorito_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_favoritos_id_favorito_seq OWNER TO postgres;

--
-- Name: libros_favoritos_id_favorito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_favoritos_id_favorito_seq OWNED BY public.libros_favoritos.id_favorito;


--
-- Name: libros_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_registro_seq OWNER TO postgres;

--
-- Name: libros_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_registro_seq OWNED BY public.libros.registro;


--
-- Name: Prestamos id_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamos" ALTER COLUMN id_prestamo SET DEFAULT nextval('public."Prestamos_id_prestamo_seq"'::regclass);


--
-- Name: Sancions id_sancion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sancions" ALTER COLUMN id_sancion SET DEFAULT nextval('public."Sancions_id_sancion_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Name: libros registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN registro SET DEFAULT nextval('public.libros_registro_seq'::regclass);


--
-- Name: libros_favoritos id_favorito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_favoritos ALTER COLUMN id_favorito SET DEFAULT nextval('public.libros_favoritos_id_favorito_seq'::regclass);


--
-- Data for Name: Prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Prestamos" (id_prestamo, registro, codigo, fecha_prestamo, fecha_devolucion_estimada, fecha_devolucion_real, estado, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Sancions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sancions" (id_sancion, id_usuario, tipo_sancion, estado, fecha_inicio, "createdAt", "updatedAt") FROM stdin;
6	60246806	37	t	2024-11-05 19:30:29.437-05	2024-11-05 19:30:29.438-05	2024-11-05 19:30:29.438-05
3	60246806	37	f	2024-11-05 19:28:58.197-05	2024-11-05 19:28:58.198-05	2024-11-05 20:03:09.153-05
4	60246806	37	f	2024-11-05 19:29:25.605-05	2024-11-05 19:29:25.605-05	2024-11-05 20:07:06.52-05
5	60246806	37	f	2024-11-05 19:29:54.475-05	2024-11-05 19:29:54.476-05	2024-11-05 20:09:46.873-05
7	60246806	7	t	2024-11-05 23:37:17.543-05	2024-11-05 23:37:17.544-05	2024-11-05 23:37:17.544-05
8	60246806	7	t	2024-11-05 23:45:50.634-05	2024-11-05 23:45:50.635-05	2024-11-05 23:45:50.635-05
9	60246806	7	t	2024-11-05 23:45:50.634-05	2024-11-05 23:45:50.635-05	2024-11-05 23:45:50.635-05
10	60246806	7	t	2024-11-05 23:45:50.634-05	2024-11-05 23:45:50.636-05	2024-11-05 23:45:50.636-05
11	60246806	7	t	2024-11-05 23:46:33.092-05	2024-11-05 23:46:33.092-05	2024-11-05 23:46:33.092-05
12	60246806	7	t	2024-11-05 23:46:33.092-05	2024-11-05 23:46:33.093-05	2024-11-05 23:46:33.093-05
13	60246806	7	t	2024-11-05 23:46:33.092-05	2024-11-05 23:46:33.093-05	2024-11-05 23:46:33.093-05
14	60246806	7	t	2024-11-05 23:47:41.469-05	2024-11-05 23:47:41.47-05	2024-11-05 23:47:41.47-05
15	60246806	7	t	2024-11-05 23:47:41.469-05	2024-11-05 23:47:41.47-05	2024-11-05 23:47:41.47-05
16	60246806	7	t	2024-11-05 23:47:41.469-05	2024-11-05 23:47:41.47-05	2024-11-05 23:47:41.47-05
17	60246806	7	t	2024-11-05 23:47:49.848-05	2024-11-05 23:47:49.849-05	2024-11-05 23:47:49.849-05
18	60246806	7	t	2024-11-05 23:47:49.848-05	2024-11-05 23:47:49.849-05	2024-11-05 23:47:49.849-05
19	60246806	7	t	2024-11-05 23:47:49.848-05	2024-11-05 23:47:49.849-05	2024-11-05 23:47:49.849-05
20	60246806	7	t	2024-11-05 23:47:50.948-05	2024-11-05 23:47:50.948-05	2024-11-05 23:47:50.948-05
21	60246806	7	t	2024-11-05 23:47:50.948-05	2024-11-05 23:47:50.949-05	2024-11-05 23:47:50.949-05
22	60246806	7	t	2024-11-05 23:47:50.948-05	2024-11-05 23:47:50.949-05	2024-11-05 23:47:50.949-05
23	60246806	7	t	2024-11-05 23:48:54.397-05	2024-11-05 23:48:54.398-05	2024-11-05 23:48:54.398-05
24	60246806	7	t	2024-11-05 23:48:54.397-05	2024-11-05 23:48:54.399-05	2024-11-05 23:48:54.399-05
25	60246806	7	t	2024-11-05 23:48:54.397-05	2024-11-05 23:48:54.399-05	2024-11-05 23:48:54.399-05
26	60246806	7	t	2024-11-05 23:52:13.435-05	2024-11-05 23:52:13.437-05	2024-11-05 23:52:13.437-05
27	60246806	7	t	2024-11-05 23:52:13.435-05	2024-11-05 23:52:13.437-05	2024-11-05 23:52:13.437-05
28	60246806	7	t	2024-11-05 23:52:13.435-05	2024-11-05 23:52:13.437-05	2024-11-05 23:52:13.437-05
29	60246806	7	t	2024-11-05 23:56:59.888-05	2024-11-05 23:56:59.889-05	2024-11-05 23:56:59.889-05
30	60246806	7	t	2024-11-05 23:56:59.888-05	2024-11-05 23:56:59.89-05	2024-11-05 23:56:59.89-05
31	60246806	7	t	2024-11-06 00:01:15.86-05	2024-11-06 00:01:15.861-05	2024-11-06 00:01:15.861-05
32	60246806	7	t	2024-11-06 00:01:15.86-05	2024-11-06 00:01:15.861-05	2024-11-06 00:01:15.861-05
33	60246806	7	t	2024-11-06 00:32:32.876-05	2024-11-06 00:32:32.877-05	2024-11-06 00:32:32.877-05
34	60246806	7	t	2024-11-06 00:32:32.876-05	2024-11-06 00:32:32.877-05	2024-11-06 00:32:32.877-05
35	60246806	7	t	2024-11-06 00:36:50.106-05	2024-11-06 00:36:50.106-05	2024-11-06 00:36:50.106-05
36	60246806	7	t	2024-11-06 00:36:50.106-05	2024-11-06 00:36:50.106-05	2024-11-06 00:36:50.106-05
37	60246806	7	t	2024-11-06 00:36:50.978-05	2024-11-06 00:36:50.978-05	2024-11-06 00:36:50.978-05
38	60246806	7	t	2024-11-06 00:36:50.978-05	2024-11-06 00:36:50.979-05	2024-11-06 00:36:50.979-05
39	60246806	7	t	2024-11-06 00:36:51.537-05	2024-11-06 00:36:51.538-05	2024-11-06 00:36:51.538-05
40	60246806	7	t	2024-11-06 00:36:51.537-05	2024-11-06 00:36:51.538-05	2024-11-06 00:36:51.538-05
41	60246806	7	t	2024-11-06 00:36:52.028-05	2024-11-06 00:36:52.028-05	2024-11-06 00:36:52.028-05
42	60246806	7	t	2024-11-06 00:36:52.028-05	2024-11-06 00:36:52.028-05	2024-11-06 00:36:52.028-05
43	60246806	7	t	2024-11-06 00:36:52.518-05	2024-11-06 00:36:52.518-05	2024-11-06 00:36:52.518-05
44	60246806	7	t	2024-11-06 00:36:52.518-05	2024-11-06 00:36:52.518-05	2024-11-06 00:36:52.518-05
45	60246806	7	t	2024-11-06 00:36:53.272-05	2024-11-06 00:36:53.272-05	2024-11-06 00:36:53.272-05
46	60246806	7	t	2024-11-06 00:36:53.272-05	2024-11-06 00:36:53.272-05	2024-11-06 00:36:53.272-05
47	60246806	7	t	2024-11-06 00:36:53.738-05	2024-11-06 00:36:53.738-05	2024-11-06 00:36:53.738-05
48	60246806	7	t	2024-11-06 00:36:53.738-05	2024-11-06 00:36:53.738-05	2024-11-06 00:36:53.738-05
49	60246806	7	t	2024-11-06 00:36:54.236-05	2024-11-06 00:36:54.236-05	2024-11-06 00:36:54.236-05
50	60246806	7	t	2024-11-06 00:36:54.236-05	2024-11-06 00:36:54.236-05	2024-11-06 00:36:54.236-05
51	60246806	7	t	2024-11-06 00:36:54.752-05	2024-11-06 00:36:54.752-05	2024-11-06 00:36:54.752-05
52	60246806	7	t	2024-11-06 00:36:54.752-05	2024-11-06 00:36:54.752-05	2024-11-06 00:36:54.752-05
53	60246806	7	t	2024-11-06 00:36:55.279-05	2024-11-06 00:36:55.279-05	2024-11-06 00:36:55.279-05
54	60246806	7	t	2024-11-06 00:36:55.279-05	2024-11-06 00:36:55.279-05	2024-11-06 00:36:55.279-05
55	60246806	7	t	2024-11-06 00:36:55.826-05	2024-11-06 00:36:55.826-05	2024-11-06 00:36:55.826-05
56	60246806	7	t	2024-11-06 00:36:55.826-05	2024-11-06 00:36:55.827-05	2024-11-06 00:36:55.827-05
57	60246806	7	t	2024-11-06 00:36:56.374-05	2024-11-06 00:36:56.375-05	2024-11-06 00:36:56.375-05
58	60246806	7	t	2024-11-06 00:36:56.374-05	2024-11-06 00:36:56.375-05	2024-11-06 00:36:56.375-05
59	60246806	7	t	2024-11-06 00:36:56.972-05	2024-11-06 00:36:56.972-05	2024-11-06 00:36:56.972-05
60	60246806	7	t	2024-11-06 00:36:56.972-05	2024-11-06 00:36:56.972-05	2024-11-06 00:36:56.972-05
61	60246806	7	t	2024-11-06 00:36:57.605-05	2024-11-06 00:36:57.605-05	2024-11-06 00:36:57.605-05
62	60246806	7	t	2024-11-06 00:36:57.605-05	2024-11-06 00:36:57.605-05	2024-11-06 00:36:57.605-05
63	60246806	7	t	2024-11-06 00:36:58.409-05	2024-11-06 00:36:58.409-05	2024-11-06 00:36:58.409-05
64	60246806	7	t	2024-11-06 00:36:58.409-05	2024-11-06 00:36:58.409-05	2024-11-06 00:36:58.409-05
65	60246806	7	t	2024-11-06 00:36:58.978-05	2024-11-06 00:36:58.978-05	2024-11-06 00:36:58.978-05
66	60246806	7	t	2024-11-06 00:36:58.978-05	2024-11-06 00:36:58.978-05	2024-11-06 00:36:58.978-05
2	72865556	13	t	2025-10-22 16:04:36.305-05	2025-10-22 16:04:36.309-05	2025-10-22 16:04:36.309-05
69	49004836	5	t	2025-10-22 20:09:29.153-05	2025-10-22 20:09:29.168-05	2025-10-22 20:09:29.168-05
70	2230	0	t	2025-10-22 20:09:29.153-05	2025-10-22 20:09:29.171-05	2025-10-22 20:09:29.171-05
71	77151137	14	t	2025-10-23 16:56:27.725-05	2025-10-23 16:56:27.728-05	2025-10-23 16:56:27.728-05
72	80879008	0	t	2025-10-23 17:53:24.869-05	2025-10-23 17:53:24.882-05	2025-10-23 17:53:24.882-05
76	123456	0	f	2025-10-24 12:57:31.113-05	2025-10-24 12:57:31.118-05	2025-10-24 12:57:55.466-05
1	2225	0	f	2025-10-22 16:01:10.38-05	2025-10-22 16:01:10.387-05	2025-10-23 22:04:34.586-05
68	2228	9	f	2025-10-22 20:09:29.153-05	2025-10-22 20:09:29.16-05	2025-10-23 22:04:58.759-05
73	123456	0	f	2025-10-23 23:21:56.401-05	2025-10-23 23:21:56.407-05	2025-10-24 12:56:40.862-05
75	123456	0	f	2025-10-24 12:56:46.311-05	2025-10-24 12:56:46.316-05	2025-10-24 12:57:18.739-05
77	123456	2	f	2025-10-24 13:01:55.192-05	2025-10-24 13:01:55.197-05	2025-11-02 02:09:51.603-05
74	2226	2	f	2025-10-24 12:55:39.385-05	2025-10-24 12:55:39.396-05	2025-11-02 02:10:31.123-05
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, nombre, apellidos, email, password, categoria, sexo, "createdAt", "updatedAt") FROM stdin;
2	Admin	Principal	admin@admin.com	$2b$10$rAngtCN91oNA5CtUW2am5epyh3yluH/7NLuqSzeLWFZNQ1HKNxp4i	1	M	2025-09-11 11:08:24.900518-05	2025-09-11 11:08:24.900518-05
4	Ana	Ramirez	ana.bibliotecaria@cedhi.edu.pe	$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36Vr1Oa4YpqcT8C0.0G6FZa	2	F	2025-09-13 20:31:56.547262-05	2025-09-13 20:31:56.547262-05
5	Luis	Gonzales	luis.tutor@cedhi.edu.pe	$2b$10$8hOszU7hYMRG9z4vDDWqa.ZoEVaHi5sDL9vx4AjxK7o4C41/xSqi6	3	M	2025-09-13 20:32:40.875117-05	2025-09-13 20:32:40.875117-05
8	Lucia	Martinez	luica.bibliotecaria@cedhi.edu.pe	$2b$10$25uodUH9JOvZVq2U5gM1fu8jXR5hPE62uS2XE/v3EJm3hbEd60PL6	2	F	2025-09-13 20:40:56.256-05	2025-09-13 20:40:56.256-05
9	John	Doe	johntutor@cedhi.edu.pe	$2b$10$/NM6t5MruuY1QTI/Fxkrp.0skACrXR3XSkHyzShOelpJZ/xdkvN02	3	M	2025-09-13 20:44:07.972-05	2025-09-13 20:44:07.972-05
\.


--
-- Data for Name: Usuario_cedhis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario_cedhis" (codigo, nombres, email, categoria, sexo, existe_sancion, "createdAt", "updatedAt") FROM stdin;
2222	Aulavirtual01CEDHI	acedhi01@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.138-05	2024-12-30 18:15:04.138-05
2223	Aula virtual 02 CEDHI	acedhi02@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.283-05	2024-12-30 18:15:04.283-05
2224	Aula virtual 03 CEDHI	acedhi03@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.422-05	2024-12-30 18:15:04.422-05
2227	Aula virtual 06 CEDHI	acedhi06@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.839-05	2024-12-30 18:15:04.839-05
2229	Aula virtual 08 CEDHI	acedhi08@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.124-05	2024-12-30 18:15:05.124-05
2231	Carlos Morales	cmorales@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.406-05	2024-12-30 18:15:05.406-05
2232	CEDHI Nueva Arequipa	contacto@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.544-05	2024-12-30 18:15:05.544-05
2233	Eugenia Aurora Chambi Herpanocca	echambi@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.686-05	2024-12-30 18:15:05.686-05
2234	Edwin Delgado	edelgado@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.823-05	2024-12-30 18:15:05.823-05
2235	Fernando Javier Contreras Nuñez	fcontreras@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:05.962-05	2024-12-30 18:15:05.962-05
2236	Informes Informes	informes@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.101-05	2024-12-30 18:15:06.101-05
2237	Juan Ignacio Angulo Cuba	jangulo@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.238-05	2024-12-30 18:15:06.238-05
2238	Javier Delgado	jdelgado@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.373-05	2024-12-30 18:15:06.373-05
2239	Josué Aron Pinto Lobatón	jpinto@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.509-05	2024-12-30 18:15:06.509-05
2240	Kent Zuñiga	kzunniga@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.646-05	2024-12-30 18:15:06.646-05
2241	Logistica Cedhi	logistica@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.784-05	2024-12-30 18:15:06.784-05
2242	Luis Manuel Uscamayta Oxa	loxa@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:06.921-05	2024-12-30 18:15:06.921-05
2243	Medalith Paola Cueva Huamani	mcueva@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.058-05	2024-12-30 18:15:07.058-05
2244	Mesa de Ayuda CEDHI	mesa_de_ayuda@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.195-05	2024-12-30 18:15:07.195-05
2245	Mesa de Partes	mesadepartes@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.332-05	2024-12-30 18:15:07.332-05
2246	Mónica Gómez de la Torre Urquieta	mgomezdelatorre@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.469-05	2024-12-30 18:15:07.469-05
2247	MARYERITH DEL ROSARIO SALGADO BARREDA	msalgado@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.606-05	2024-12-30 18:15:07.606-05
2248	Nelani Lourdes De la Torre Vera	ndelatorre@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.746-05	2024-12-30 18:15:07.746-05
2249	Nataly Macias	nmacias@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:07.884-05	2024-12-30 18:15:07.884-05
2250	Naydu Maricielo Serrano Guzman	nserrano@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.021-05	2024-12-30 18:15:08.021-05
2251	PERCY JESÚS TARQUI CARPIO	ptarqui@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.158-05	2024-12-30 18:15:08.158-05
2252	Renato Kevin Neyra Tapia	rneyra@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.295-05	2024-12-30 18:15:08.295-05
2253	Secretaría Académica	secretaria.academica@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.432-05	2024-12-30 18:15:08.432-05
2254	Secretaría CEDHI	secretaria@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.574-05	2024-12-30 18:15:08.574-05
2255	Sergio Tejada	stejada@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.711-05	2024-12-30 18:15:08.711-05
2256	Tesoreria Tesoreria	tesoreria@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.848-05	2024-12-30 18:15:08.848-05
2257	Tutoria Cedhi	tutoria@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:08.984-05	2024-12-30 18:15:08.984-05
2258	Victoria Medina	vmedina@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:09.12-05	2024-12-30 18:15:09.12-05
2259	Yonel Erick Panibra Sulla	ypanibra@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:09.258-05	2024-12-30 18:15:09.258-05
2260	CEDHI Jaguar Soft	jaguarsoft@cedhinuevaarequipa.edu.pe	Sistemas	M	f	2024-12-30 18:15:09.397-05	2024-12-30 18:15:09.397-05
2261	Sistemas Administrador	sistemas@cedhinuevaarequipa.edu.pe	Sistemas	M	f	2024-12-30 18:15:09.533-05	2024-12-30 18:15:09.533-05
2262	Soporte TAC CEDHI	soportetac@cedhinuevaarequipa.edu.pe	Sistemas	M	f	2024-12-30 18:15:09.67-05	2024-12-30 18:15:09.67-05
2263	Super Usuario CEDHI	superusuario@cedhinuevaarequipa.edu.pe	Sistemas	M	f	2024-12-30 18:15:09.807-05	2024-12-30 18:15:09.807-05
2264	CETPRO CEDHI Nueva Arequipa	cetpro@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:09.944-05	2024-12-30 18:15:09.944-05
2265	Información CEDHI	info@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:10.082-05	2024-12-30 18:15:10.082-05
2266	Marketing CEDHI	marketing@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:10.219-05	2024-12-30 18:15:10.219-05
845607	Gonzalez Crespo Padre Jose 	jcrespo@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:10.357-05	2024-12-30 18:15:10.357-05
1345092	Guzmán Casas Edgar René 	eguzman@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:10.494-05	2024-12-30 18:15:10.494-05
2445719	PAULINA DORIS RIVERA SALAZAR	02445719@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:10.632-05	2024-12-30 18:15:10.632-05
2883620	Jennifer Kitzain Cortez Varela	02883620@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:10.77-05	2024-12-30 18:15:10.77-05
4170940	Diego Alexander Revete Rojas	004170940@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:10.906-05	2024-12-30 18:15:10.906-05
7766788	Reveggino Sosa Luis Pedro 	lreveggino@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:11.045-05	2024-12-30 18:15:11.045-05
29202052	Rodriguez Muñoz Jorge Luis 	jrodriguez@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:11.18-05	2024-12-30 18:15:11.18-05
29207538	Zegarra Valdivia Manuel Antonio 	mzegarra@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:11.321-05	2024-12-30 18:15:11.321-05
29441851	Tarqui Carpio Reyna Ysabel 	rtarqui@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:11.458-05	2024-12-30 18:15:11.458-05
29596165	Gonzales Silva Jesús Alberto 	jgonzales@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:11.596-05	2024-12-30 18:15:11.596-05
29603294	Corrales de Guillen Ana María Wong	awong@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:11.734-05	2024-12-30 18:15:11.734-05
29604176	Canazas Cari Yuri Abdel	ycanazas@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:11.873-05	2024-12-30 18:15:11.873-05
29636392	Roxana Karla Valderrama Valdivia	29636392@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.011-05	2024-12-30 18:15:12.011-05
29650521	JULIBEE SONIA ARENAS ARANA	29650521@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:12.148-05	2024-12-30 18:15:12.148-05
29665838	PROFETA MARUJA PUMA QUISPE	29665838@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.286-05	2024-12-30 18:15:12.286-05
29688869	Vera Falconí Manuel Javier 	mvera@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:12.422-05	2024-12-30 18:15:12.422-05
29705413	Maria Rossana Eguiluz Salinas	29705413@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.559-05	2024-12-30 18:15:12.559-05
29708341	OLGA FLORANGEL SALCEDO CHARCA	29708341@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.695-05	2024-12-30 18:15:12.695-05
29733514	ELIZABETH NILA ROQUE VILCA	29733514@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.832-05	2024-12-30 18:15:12.832-05
30674585	Juliana Navarrete Aparicio	30674585@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:12.97-05	2024-12-30 18:15:12.97-05
2230	Bienestar Estudiantil Cedhi	bienestar.estudiantil@cedhinuevaarequipa.edu.pe	Docentes	M	t	2024-12-30 18:15:05.267-05	2025-10-22 20:09:29.18-05
2228	Aula virtual 07 CEDHI	acedhi07@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.985-05	2025-10-23 22:04:58.828-05
2226	Aula virtual 05 CEDHI	acedhi05@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.701-05	2025-11-02 02:10:31.19-05
30675024	Rodriguez Rodriguez Yessy Elizabeth	yrodriguez@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:13.108-05	2024-12-30 18:15:13.108-05
40393134	Paredes Medina Paulo Cesar	pparedes@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:13.245-05	2024-12-30 18:15:13.245-05
40451135	Agripino Justo Ccancce Rivas	40451135@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:13.382-05	2024-12-30 18:15:13.382-05
40669550	Escudero Rivera Alan 	aescudero@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:13.866-05	2024-12-30 18:15:13.866-05
40698384	SADITH TTITO ALVAREZ	40698384@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:14.003-05	2024-12-30 18:15:14.003-05
40734317	Lujan Marquez Hayler	hlujan@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:14.141-05	2024-12-30 18:15:14.141-05
40750222	Carreón Valdez Mariela Anabel 	mcarreon@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:14.279-05	2024-12-30 18:15:14.279-05
40932620	Pinto Quiroz Blanca Gilda	40932620@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:14.418-05	2024-12-30 18:15:14.418-05
41331016	Miriam Edivia Taboada Cavalcanti	41331016@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:14.556-05	2024-12-30 18:15:14.556-05
41548590	Anco Benavente Tania Lucia 	tanco@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:14.693-05	2024-12-30 18:15:14.693-05
42005938	Diaz Muñoz Erick Steve	ediaz@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:14.829-05	2024-12-30 18:15:14.829-05
42327887	Ayala Cervantes Herbert José 	hayala@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:14.965-05	2024-12-30 18:15:14.965-05
42492222	JOSÉ LUIS FRANCISCO SOTO PAREDES	42492222@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:15.102-05	2024-12-30 18:15:15.102-05
42829064	Castañón Huaracha Johan Jaime	jcastanon@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:15.238-05	2024-12-30 18:15:15.238-05
42966958	Reyes Aponte John Paul 	jreyes@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:15.38-05	2024-12-30 18:15:15.38-05
43167194	María del Carmen Armejo Colque	43167194@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:15.516-05	2024-12-30 18:15:15.516-05
43276357	SATURNINO MARCELINO ALARCÓN COLQUE	43276357@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:15.654-05	2024-12-30 18:15:15.654-05
43287646	Indira Quiroz Lopez	43287646@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:15.795-05	2024-12-30 18:15:15.795-05
43356656	Nancy Choque Ancasi	43356656@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:15.932-05	2024-12-30 18:15:15.932-05
43571268	Marleni Luque Allasi	43571268@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:16.07-05	2024-12-30 18:15:16.07-05
43694351	JUANA IRIS NEYRA LAYME DE CHUCTAYA	43694351@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:16.207-05	2024-12-30 18:15:16.207-05
44022287	MILAGROS CRISTAL MAMANI CABANA	44022287@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:16.345-05	2024-12-30 18:15:16.345-05
44080694	Jesica Janeth Soncco Quispe	44080694@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:16.481-05	2024-12-30 18:15:16.481-05
44181307	Catacora Ccacya Juan Carlos	jcatacora@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:16.618-05	2024-12-30 18:15:16.618-05
44209849	Maria del Rosario Nina Chambi	44209849@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:16.755-05	2024-12-30 18:15:16.755-05
44218145	LIZ MAGALI QUISPE FERNANDEZ	44218145@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:16.891-05	2024-12-30 18:15:16.891-05
44256361	RUTH MILAGROS MONTALVO SULCA	44256361@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:17.027-05	2024-12-30 18:15:17.027-05
44354819	Roxana Carolina Anahua Llampi	44354819@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:17.163-05	2024-12-30 18:15:17.163-05
44379075	Ramírez Vargas César Mezzich 	cramirez@cedhinuevaarequipa.edu.pe	Sistemas	M	f	2024-12-30 18:15:17.3-05	2024-12-30 18:15:17.3-05
44521610	LIDIA MENDIGURE CHAÑI	44521610@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:17.443-05	2024-12-30 18:15:17.443-05
44577158	ROSA LUZ HUANCA GARCIA	44577158@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:17.58-05	2024-12-30 18:15:17.58-05
44671817	Morochara Huamani Nati Andrea	44671817@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:17.722-05	2024-12-30 18:15:17.722-05
44756615	Hilda Velazco Ala	44756615@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:17.859-05	2024-12-30 18:15:17.859-05
45227641	Marissa Mendoza Choque	45227641@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:18-05	2024-12-30 18:15:18-05
45331244	Vanesa Irene Alejo Huamani	45331244@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:18.136-05	2024-12-30 18:15:18.136-05
45512201	Jonathan Ciro Mattos Almonte	45512201@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:18.274-05	2024-12-30 18:15:18.274-05
45513124	Roxana Lucia Yucra Yucra	45513124@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:18.418-05	2024-12-30 18:15:18.418-05
45548218	ORLANDO EDER JUSTO AGUILAR	45548218@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:18.555-05	2024-12-30 18:15:18.555-05
45628206	Sandra Margarita Sucari Quilla	45628206@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:18.697-05	2024-12-30 18:15:18.697-05
46081635	Grimaldos Gamero Angel Gustavo 	agrimaldos@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:18.833-05	2024-12-30 18:15:18.833-05
46107957	NOELY APAZA CACHA	46107957@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:18.97-05	2024-12-30 18:15:18.97-05
46196828	RUTH DEIZ PFUTURI CHARA	46196828@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:19.107-05	2024-12-30 18:15:19.107-05
46294978	Pedro Henry Sullca Quispe	46294978@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:19.244-05	2024-12-30 18:15:19.244-05
46309146	Núñez Linares Diana Elizabeth 	dnunnez@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:19.383-05	2024-12-30 18:15:19.383-05
46410932	Yolanda Yeny Peña Otazu	46410932@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:19.523-05	2024-12-30 18:15:19.523-05
46417939	Vicentina Peña Huallpa	46417939@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:19.658-05	2024-12-30 18:15:19.658-05
46554432	Olga Haydely Roque Sergo	46554432@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:19.796-05	2024-12-30 18:15:19.796-05
46645406	Areli Helen Antacabana Medina	46645406@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:19.934-05	2024-12-30 18:15:19.934-05
46822685	JUAN JOSE CHURA APAZA	46822685@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:20.073-05	2024-12-30 18:15:20.073-05
46940531	Kelly Margarita Arana Vilca	46940531@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:20.215-05	2024-12-30 18:15:20.215-05
46944243	Huacho Cayllahua Katty	46944243@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:20.352-05	2024-12-30 18:15:20.352-05
46953687	Luz Marina Quispe Huahuasonco	46953687@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:20.49-05	2024-12-30 18:15:20.49-05
46961785	MARTHA EULALIA COLQUE ARQUI	46961785@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:20.626-05	2024-12-30 18:15:20.626-05
47004225	Lourdes Lisbeth Quispe Apaza	47004225@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:20.763-05	2024-12-30 18:15:20.763-05
47445193	BETY EFIFANIA VENEGAS ESPINAL	47445193@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:20.9-05	2024-12-30 18:15:20.9-05
47454505	MIRIAM LIZBETH MESTAS ALARCON	47454505@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:21.037-05	2024-12-30 18:15:21.037-05
47493451	FRANKLIN QUISPE PUMA	47493451@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:21.173-05	2024-12-30 18:15:21.173-05
47511736	Manuelo Puma Sandra Maria 	smanuelo@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:21.31-05	2024-12-30 18:15:21.31-05
47554352	Ruth Noemi Mamani Huayta	47554352@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:21.447-05	2024-12-30 18:15:21.447-05
47601911	SUSANA PERALTA MOLLAPAZA	47601911@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:21.583-05	2024-12-30 18:15:21.583-05
47620965	MARIA LEONARDA HUARACCALLO CARBAJAL	47620965@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:21.72-05	2024-12-30 18:15:21.72-05
40873622	GLORIA PUMA CUSI	40873622@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:21.857-05	2024-12-30 18:15:21.857-05
47690347	CESAR CHOQUEPATA GUTIERREZ	47690347@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:21.994-05	2024-12-30 18:15:21.994-05
47694473	WILFREDO SOLORZANO AQUINO	47694473@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:22.132-05	2024-12-30 18:15:22.132-05
47871394	Olga Montañez Urbina	47871394@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:22.269-05	2024-12-30 18:15:22.269-05
47971376	GRACIELA SAPACAYO HUAMANI	47971376@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:22.408-05	2024-12-30 18:15:22.408-05
47972521	LENIN CHAMBI CONDORI	47972521@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:22.545-05	2024-12-30 18:15:22.545-05
48025600	ROSMERY APAZA SAYME	48025600@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:22.692-05	2024-12-30 18:15:22.692-05
48043004	Mariluz Lupo Arias	48043004@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:22.833-05	2024-12-30 18:15:22.833-05
48101551	Maribel Torres Luque	48101551@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:22.969-05	2024-12-30 18:15:22.969-05
48140312	CINTHIA DAYANA ROJAS CORRALES	48140312@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.106-05	2024-12-30 18:15:23.106-05
48150195	AXCEL SANCHEZ MACEDO	48150195@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.242-05	2024-12-30 18:15:23.242-05
48200043	FLOR KARINA QUISPE HUMPIRE	48200043@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.382-05	2024-12-30 18:15:23.382-05
48238129	Abigail Fabiola Chura Mendoza	48238129@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.518-05	2024-12-30 18:15:23.518-05
48273257	ROXANA MÓNICA VILLA COYLA	48273257@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.659-05	2024-12-30 18:15:23.659-05
48666311	Dina Karina Apaza Mamani	48666311@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:23.805-05	2024-12-30 18:15:23.805-05
48820944	MICHAEL ARIZACA MENDOZA	48820944@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:23.942-05	2024-12-30 18:15:23.942-05
60014828	FLOR ANALY LLACTAHUAMANI PORTILLO	60014828@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:24.218-05	2024-12-30 18:15:24.218-05
60016856	Gianella Ivette Rojas Mallqui	60016856@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:24.355-05	2024-12-30 18:15:24.355-05
60018717	AYDE ESTEFANY PUMACALLAHUI VILCA	60018717@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:24.493-05	2024-12-30 18:15:24.493-05
60018719	Lisbeth Vianca Jara Salcedo	60018719@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:24.633-05	2024-12-30 18:15:24.633-05
60058258	DARWIN RONALDO VARGAS SAAVEDRA	60058258@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:24.769-05	2024-12-30 18:15:24.769-05
60059383	MEDALY ELIZABETH CHOQUEANCO APAZA	60059383@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:24.907-05	2024-12-30 18:15:24.907-05
60059391	KELLY DEISY OLLACHICA CHOQUEANCO	60059391@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.044-05	2024-12-30 18:15:25.044-05
60060614	RUTH NATALI QUISPE CAHUANA	60060614@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.18-05	2024-12-30 18:15:25.18-05
60062626	Larry Jeancarlos Pilares Nina	60062626@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.316-05	2024-12-30 18:15:25.316-05
60062820	DAMARIS VERONICA CAHUI ALA	60062820@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.452-05	2024-12-30 18:15:25.452-05
60062861	NELY SANDRA GUTIERREZ MAQUE	60062861@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.589-05	2024-12-30 18:15:25.589-05
60201088	FLOR DE MARIA QUISPE QUISPE	60201088@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.725-05	2024-12-30 18:15:25.725-05
60202285	MIRIAN YANETH QUISPE QUISPE	60202285@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:25.861-05	2024-12-30 18:15:25.861-05
60202299	Torres Diaz Medaly Sunmi	60202299@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:25.998-05	2024-12-30 18:15:25.998-05
60221694	Ccorahua Conde Silvia	60221694@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:26.134-05	2024-12-30 18:15:26.134-05
60295513	RUDMEL VICENTE CHISE LLOCLLE	60295513@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.273-05	2024-12-30 18:15:26.273-05
60436089	JUAN YOJHAN PACCO ANDIA	60436089@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.409-05	2024-12-30 18:15:26.409-05
60438338	YULISA CHAVEZ CHACNAMA	60438338@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.544-05	2024-12-30 18:15:26.544-05
60489137	JESUS ANGEL MOREANO CONDORI	60489137@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.681-05	2024-12-30 18:15:26.681-05
60503082	WENCESLAO TUPAC STAÑIS TICONA VERA	60503082@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.818-05	2024-12-30 18:15:26.818-05
60622742	Celedonia Cahuana Maldonado	60622742@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:26.955-05	2024-12-30 18:15:26.955-05
60624465	Franco Alex Ccoro Soto	60624465@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.091-05	2024-12-30 18:15:27.091-05
60746440	BRAD FOUR YUSTIN ZAPATA FLORES	60746440@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.227-05	2024-12-30 18:15:27.227-05
60758769	Michael Jordan Flores Huamani	60758769@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.366-05	2024-12-30 18:15:27.366-05
60793567	Edson Michael Villa Jacobo	60793567@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.501-05	2024-12-30 18:15:27.501-05
60794850	LUCERO CRISTINA RIMARACHIN MAYTA	60794850@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.638-05	2024-12-30 18:15:27.638-05
60864716	ITZEL MELANIE VILLAVICENCIO PAUCAR	60864716@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.779-05	2024-12-30 18:15:27.779-05
60935233	BRYAN YENDER SURI APAZA	60935233@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:27.915-05	2024-12-30 18:15:27.915-05
60949628	EDITH VERONICA ZEGARRA LEIVA	60949628@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.051-05	2024-12-30 18:15:28.051-05
60956002	Puma Rivera Nikole Alisson	60956002@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:28.187-05	2024-12-30 18:15:28.187-05
60958374	NILDA CRUZ PFOCCO	60958374@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.33-05	2024-12-30 18:15:28.33-05
60966801	YAMILE BENITA BARRIOS QUISPE	60966801@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.468-05	2024-12-30 18:15:28.468-05
60967909	FERNANDO ARTURO MALLMA CESPEDES	60967909@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.605-05	2024-12-30 18:15:28.605-05
60968490	Yamile Lucia Turpo Zuñiga	60968490@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.741-05	2024-12-30 18:15:28.741-05
61049447	EVERT DIEGO LAZARTE CACERES	61049447@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:28.896-05	2024-12-30 18:15:28.896-05
61217800	Shiamel Daniela Apaza Lara	61217800@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.032-05	2024-12-30 18:15:29.032-05
61366425	ALEJANDRA MARIELA HUARCA COAQUIRA	61366425@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.167-05	2024-12-30 18:15:29.167-05
61540372	JOSELIN MELIZA MUCHO QUISPE	61540372@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.302-05	2024-12-30 18:15:29.302-05
61564391	Ylenia Mavet Salazar Tapia	61564391@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.438-05	2024-12-30 18:15:29.438-05
61839752	VICTOR ANDRES DIAZ SULLA	61839752@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.574-05	2024-12-30 18:15:29.574-05
61847555	Yhanela Katherine Condo Condori	61847555@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.71-05	2024-12-30 18:15:29.71-05
61867371	Treyci Evelin Huanca Zapacayo	61867371@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:29.846-05	2024-12-30 18:15:29.846-05
62097279	Luz Clarita Lucana Cusilayme	62097279@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:29.983-05	2024-12-30 18:15:29.983-05
62107136	ALEXANDRO RECSI HUACHACA	62107136@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.119-05	2024-12-30 18:15:30.119-05
60246806	NAYALY GLENI APANCHO CHAMPI	60246806@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.255-05	2024-12-30 18:15:30.255-05
62380326	YUREMA CHASKA QUENAYA TTITO	62380326@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.391-05	2024-12-30 18:15:30.391-05
62928152	Delia Carolina Cuyo Zamata	62928152@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.527-05	2024-12-30 18:15:30.527-05
70144053	Emilia Lisbet Zapana Mamani	70144053@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.663-05	2024-12-30 18:15:30.663-05
70149296	Yina Benavente Mendoza	70149296@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.826-05	2024-12-30 18:15:30.826-05
70165461	ALEX PAUSAN CHOQUE CARCAUSTO	70165461@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:30.964-05	2024-12-30 18:15:30.964-05
70171592	VIANCA CUEVAS ACSARA	70171592@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:31.099-05	2024-12-30 18:15:31.099-05
70208496	LISBETH CALDERÓN GAMARRA	70208496@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:31.236-05	2024-12-30 18:15:31.236-05
70218324	FROILAN GIOVANY PUMA CRUZ	70218324@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:31.372-05	2024-12-30 18:15:31.372-05
70218887	Amilcar Llallacachi Sisa	70218887@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:31.509-05	2024-12-30 18:15:31.509-05
70269073	LEONARDO RUBEN CHANI VELASQUEZ	70269073@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:31.645-05	2024-12-30 18:15:31.645-05
70297443	YESSICA EUSEBIA TAYPE OTAZU	70297443@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:31.786-05	2024-12-30 18:15:31.786-05
70302535	DEYSI ABIGAIL QUISPE MAYTA	70302535@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:31.922-05	2024-12-30 18:15:31.922-05
70302541	MAYCOL GEDEON QUISPE CAYLLAHUA	70302541@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:32.059-05	2024-12-30 18:15:32.059-05
70302549	JIMY ERNESTO IBARRA CAYLLAHUA	70302549@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:32.194-05	2024-12-30 18:15:32.194-05
70342598	Deysi Chacca Llaique	70342598@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:32.343-05	2024-12-30 18:15:32.343-05
70520457	JORGE LUIS MERMA YAURI	70520457@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:32.488-05	2024-12-30 18:15:32.488-05
70520923	ANA LISBETH GONZALES CCONISLLA	70520923@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:32.624-05	2024-12-30 18:15:32.624-05
70545038	JESUS FLORES VIZA	70545038@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:32.761-05	2024-12-30 18:15:32.761-05
70562817	EINER EDUARDO BENITO SILVA	70562817@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:32.897-05	2024-12-30 18:15:32.897-05
70583753	LIZET FIORELLA MAMANI QUISPE	70583753@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.034-05	2024-12-30 18:15:33.034-05
70583779	Lizbeth Milagros Huisa Achinquipa	70583779@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.172-05	2024-12-30 18:15:33.172-05
70600906	Gedeón Nescher Hilpanocca Quispe	70600906@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.308-05	2024-12-30 18:15:33.308-05
70663459	Nieves Ramos Tacca	70663459@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.444-05	2024-12-30 18:15:33.444-05
70663821	YENIFER MICHELL PACHECO GALINDO	70663821@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:33.579-05	2024-12-30 18:15:33.579-05
70670380	MARCO ANTONIO CJURO GERI	70670380@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.714-05	2024-12-30 18:15:33.714-05
70676507	Condori Mamani Nadia Jessica	ncondori@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:33.849-05	2024-12-30 18:15:33.849-05
70679674	MARIA CONCEPCION QUISPE CONDORI	70679674@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:33.988-05	2024-12-30 18:15:33.988-05
70683854	MILAGROS MISHEL CRUZ PUMA	70683854@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:34.128-05	2024-12-30 18:15:34.128-05
70684224	Alexis Richar Hidalgo Hihuaña	70684224@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:34.264-05	2024-12-30 18:15:34.264-05
70685964	Chirinos Lipa Angie Esperanza 	achirinos@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:34.403-05	2024-12-30 18:15:34.403-05
70770183	Maribel Yesica Yujra Mamani	70770183@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:34.541-05	2024-12-30 18:15:34.541-05
70907059	FLOR DE MARIA SUCA CHAMBI	70907059@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:34.68-05	2024-12-30 18:15:34.68-05
70913583	ROSA LUZ CHINCHERCOMA CHOQUEMAQUI	70913583@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:34.816-05	2024-12-30 18:15:34.816-05
70928999	ARIANA FABELLA AROTAYPE CALERO	70928999@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:34.952-05	2024-12-30 18:15:34.952-05
70943845	MARIBEL FIORELLA CHOQUEMAQUI TACURI	70943845@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:35.092-05	2024-12-30 18:15:35.092-05
70989696	LEIDY DAYNA CHOQUE CUTIPA	70989696@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:35.23-05	2024-12-30 18:15:35.23-05
70991479	JESUS ANTHONY TRELLES CHOQUE	70991479@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:35.366-05	2024-12-30 18:15:35.366-05
71004389	Jazmin Araceli Mamani Valdivia	71004389@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:35.501-05	2024-12-30 18:15:35.501-05
71049108	HERNAN YOSIMAR MAMANI MENDOZA	71049108@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:35.638-05	2024-12-30 18:15:35.638-05
71067641	MAYKER EMERSON SANO CARI	71067641@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:35.776-05	2024-12-30 18:15:35.776-05
71067722	Quispe Puma Nancy Sonia	71067722@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:35.912-05	2024-12-30 18:15:35.912-05
71074596	JHON WILFREDO AHUMADA PACCO	71074596@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:36.048-05	2024-12-30 18:15:36.048-05
71076093	Edith Esclavet Gutierrez Calla	71076093@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:36.191-05	2024-12-30 18:15:36.191-05
71077337	MADELEYNE ELISA MAMANI CHOQUE	71077337@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:36.326-05	2024-12-30 18:15:36.326-05
71077909	SHARON KATERINE TACO YAHUA	71077909@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:36.469-05	2024-12-30 18:15:36.469-05
71078226	YHYMY DANIEL SOTOMAYOR MAQUE	71078226@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:36.609-05	2024-12-30 18:15:36.609-05
71079358	JAQUELINE ZENAIDA MEDINA RAMOS	71079358@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:36.746-05	2024-12-30 18:15:36.746-05
71079368	HENRY SALAZAR OSORIO	71079368@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:36.883-05	2024-12-30 18:15:36.883-05
71079510	Yudith Juana Condori Yahua	71079510@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.02-05	2024-12-30 18:15:37.02-05
71079517	Magda Aracely Tola Mollocahuana	71079517@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.157-05	2024-12-30 18:15:37.157-05
71079534	EDITH SUSAN CONDORI HUARACHA	71079534@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:37.296-05	2024-12-30 18:15:37.296-05
71080542	SANTOS ALEXANDER QUISPE PATATINGO	71080542@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.433-05	2024-12-30 18:15:37.433-05
71105530	Yesica Adela Alccaccahua Alhuirca	71105530@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.573-05	2024-12-30 18:15:37.573-05
71221213	Gregoria Adela Peña Huallpa	71221213@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.71-05	2024-12-30 18:15:37.71-05
71405406	ESTHEFANO EDUARDO ARIAS AZANA	71405406@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.847-05	2024-12-30 18:15:37.847-05
71418168	Luis Alberto Álvarez Castillo	71418168@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:37.981-05	2024-12-30 18:15:37.981-05
71481007	Achaco Cayani Yasmin Caterin	71481007@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:38.118-05	2024-12-30 18:15:38.118-05
71482316	STEPHANIE MILUSKA CHAMBI HUANCA	71482316@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.278-05	2024-12-30 18:15:38.278-05
71482970	SAUL RODRIGO QUISPE UGARTE	71482970@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.417-05	2024-12-30 18:15:38.417-05
71483241	KEVIN ALEXANDER CONDE MENDOZA	71483241@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.556-05	2024-12-30 18:15:38.556-05
71485269	Italo Juan Pari Huanca	71485269@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.693-05	2024-12-30 18:15:38.693-05
71485322	AINEE DEYSI CASTELLANOS QUISPE	71485322@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.828-05	2024-12-30 18:15:38.828-05
71497669	Juan David Cuenca Gutiérrez	71497669@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:38.965-05	2024-12-30 18:15:38.965-05
71527477	VICTOR HUISA PUMA	71527477@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:39.103-05	2024-12-30 18:15:39.103-05
71531582	DENIS PACOMPIA CHIPANA	71531582@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:39.245-05	2024-12-30 18:15:39.245-05
71534425	OLIVER SCHNEIDER PUMA ZELA	71534425@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:39.383-05	2024-12-30 18:15:39.383-05
71550501	MARIA YESENIA MAMANI PEREZ	71550501@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:39.522-05	2024-12-30 18:15:39.522-05
71581665	JESSICA LUZ CALCINA VERDUZCO	71581665@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:39.659-05	2024-12-30 18:15:39.659-05
71636790	Diego Duval Santos Zapana	71636790@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:39.797-05	2024-12-30 18:15:39.797-05
71651813	BRYAN RICHARD QUISPE ARCE	71651813@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:39.933-05	2024-12-30 18:15:39.933-05
71652509	JEAN POL TINTA JACOBO	71652509@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.071-05	2024-12-30 18:15:40.071-05
71652556	LIZBETH DIANA APAZA ARANA	71652556@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:40.21-05	2024-12-30 18:15:40.21-05
71656725	BENJAMIN ERICK RIVERA HEREDIA	71656725@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.347-05	2024-12-30 18:15:40.347-05
71659914	LUIS MIGUEL HUAMANI CAYLLAHUA	71659914@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.483-05	2024-12-30 18:15:40.483-05
71692032	Jhoselyn Maritza Suico Canaza	71692032@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.62-05	2024-12-30 18:15:40.62-05
71692047	ZULY MEDALIT VILCA TAPIA	71692047@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.759-05	2024-12-30 18:15:40.759-05
71716645	FELIPE ESTEBAN CASTILLO CERDEÑA	71716645@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:40.897-05	2024-12-30 18:15:40.897-05
71722026	Bernedo Valderrama Diana Carolina 	dbernedo@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:15:41.034-05	2024-12-30 18:15:41.034-05
71786176	Soly Reyna Puma Bustinza	71786176@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:41.185-05	2024-12-30 18:15:41.185-05
71786848	Huacho Ramos Estela	71786848@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:41.324-05	2024-12-30 18:15:41.324-05
71828402	EDDY ARNOLD SAHUINCO VARGAS	71828402@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:41.464-05	2024-12-30 18:15:41.464-05
71829047	GUIDO ADOLFO CAJIA PACCO	71829047@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:41.613-05	2024-12-30 18:15:41.613-05
71868529	EVELYN ROSMERI MAMANI UTANI	71868529@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:41.752-05	2024-12-30 18:15:41.752-05
71941982	JULIO BRAHIN PACCO CHAÑI	71941982@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:41.887-05	2024-12-30 18:15:41.887-05
71953751	Celedonio Williams Sacari Laramani	71953751@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.023-05	2024-12-30 18:15:42.023-05
72036921	ANGEL GABRIEL MAMANI RAMOS	72036921@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.159-05	2024-12-30 18:15:42.159-05
72038007	DIANE GABRIELA CALCINO UMASI	72038007@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.296-05	2024-12-30 18:15:42.296-05
72045650	Anderson Paúl Tapia Soto	72045650@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.432-05	2024-12-30 18:15:42.432-05
72045666	ADEMIR YERSON CACERES PONCE	72045666@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.577-05	2024-12-30 18:15:42.577-05
72073015	LUZ MILAGROS ESTEFANERO VILLEGAS	72073015@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:42.717-05	2024-12-30 18:15:42.717-05
72073047	Nelly Mercedes Diaz Calderon	72073047@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:42.853-05	2024-12-30 18:15:42.853-05
72079995	JUANA QUISPE HANCCO	72079995@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:42.991-05	2024-12-30 18:15:42.991-05
72091876	ROSSMERY CELINA MAMANI CHEJE	72091876@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:43.128-05	2024-12-30 18:15:43.128-05
72101295	Josue Andrés Chambi Condori	72101295@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.265-05	2024-12-30 18:15:43.265-05
72111040	Marco Antonio Zapana Ccos	72111040@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.402-05	2024-12-30 18:15:43.402-05
72144158	Julissa Jennyfer Gonzales Caceres	72144158@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.539-05	2024-12-30 18:15:43.539-05
72170722	ALEJANDRINA HOLGUIN MARAZA	72170722@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.678-05	2024-12-30 18:15:43.678-05
72171553	Belen Turpo Idme	72171553@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.816-05	2024-12-30 18:15:43.816-05
72235185	LUZ MARINA HUAÑAHUI CHAVEZ	72235185@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:43.955-05	2024-12-30 18:15:43.955-05
72241422	Odela Maria Huamani Mallma	72241422@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:44.092-05	2024-12-30 18:15:44.092-05
72244114	Marlon Calderon Arapa	72244114@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:44.229-05	2024-12-30 18:15:44.229-05
72249471	Yanet Soto Quispe	72249471@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:44.365-05	2024-12-30 18:15:44.365-05
72249527	EDWIN PEDRO JAUJA YANQUI	72249527@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:44.501-05	2024-12-30 18:15:44.501-05
72263899	ROBERT CESAR AROTOMA DE LA CRUZ	72263899@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:44.639-05	2024-12-30 18:15:44.639-05
72264449	ELVIS SAMUEL VILCA PUMA	72264449@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:44.779-05	2024-12-30 18:15:44.779-05
72319996	EDITH DINA ANCONEYRA LLAZA	72319996@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:44.916-05	2024-12-30 18:15:44.916-05
72320911	YEFERSON ANTONIO CCAMA GUEVARA	72320911@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:45.054-05	2024-12-30 18:15:45.054-05
72377946	DORA BRICILA CARPIO SANTOS	72377946@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:45.19-05	2024-12-30 18:15:45.19-05
72377957	SHARON NICOLF CARPIO SANTOS	72377957@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:45.327-05	2024-12-30 18:15:45.327-05
72433108	MAYBELY MAEVA CAYANI CALACHUA	72433108@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:45.462-05	2024-12-30 18:15:45.462-05
72460635	YINA SOFIA PONCE NINA	72460635@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:45.6-05	2024-12-30 18:15:45.6-05
72460640	CARMEN ELENA CHOQUE SAHUANAYA	72460640@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:45.736-05	2024-12-30 18:15:45.736-05
72490975	MILAGROS GENESIS CHOQUE MOGROVEJO	72490975@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:45.876-05	2024-12-30 18:15:45.876-05
72507841	SONALY FIORELLA COAGUILA NINA	72507841@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.012-05	2024-12-30 18:15:46.012-05
72510270	Marleny Sucapuca Pari	72510270@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.149-05	2024-12-30 18:15:46.149-05
72510271	Lourdes Sucapuca Pari	72510271@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.286-05	2024-12-30 18:15:46.286-05
72518904	JUSTO ANTONIO MALAGA PUMA	72518904@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:46.434-05	2024-12-30 18:15:46.434-05
72533231	DEINA MARICELA PACHECO VÁSQUEZ	72533231@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.577-05	2024-12-30 18:15:46.577-05
72535998	MANUEL ENRIQUE RIVERO ARIAS	72535998@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.717-05	2024-12-30 18:15:46.717-05
72537708	Gamero Mita Erick Berly	egamero@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:46.855-05	2024-12-30 18:15:46.855-05
72566684	CRISTOPHER ARMANDUÍ ORE SALCEDO	72566684@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:46.997-05	2024-12-30 18:15:46.997-05
72612872	GABRIELA ALEJANDRA HUILLCA CAPAJAÑA	72612872@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:47.133-05	2024-12-30 18:15:47.133-05
72618890	Jessica Beatriz Mollo Surco	72618890@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:47.269-05	2024-12-30 18:15:47.269-05
72626972	Soto Quispe Lizbeth Diana	72626972@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:47.423-05	2024-12-30 18:15:47.423-05
72627181	BRIYIT ESTER GOMEZ CASTRO	72627181@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:47.564-05	2024-12-30 18:15:47.564-05
72629063	VIDAL RODRIGO HUARACHA MALCOACCHA	72629063@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:47.7-05	2024-12-30 18:15:47.7-05
72633168	NICANOR LEONARDO HUANCA ANCCO	72633168@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:47.977-05	2024-12-30 18:15:47.977-05
72640871	Maria Fernanda Sulla Zela	72640871@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:48.115-05	2024-12-30 18:15:48.115-05
72665628	Fabiola Sullca Quispe	72665628@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:48.25-05	2024-12-30 18:15:48.25-05
72672694	Rosangela Eneyda Quispe Ramos	72672694@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:48.387-05	2024-12-30 18:15:48.387-05
72677798	CARINA PAMELA MOGROVEJO APARICIO	72677798@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:48.525-05	2024-12-30 18:15:48.525-05
72685226	Frisancho Bustamante Melendy Gabriela	psicologia@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:48.66-05	2024-12-30 18:15:48.66-05
72797053	Nicole Tarqui Gonzales	72797053@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:48.798-05	2024-12-30 18:15:48.798-05
72851605	SAUL GIOVANNI LLALLAQUE MOLLO	72851605@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:48.934-05	2024-12-30 18:15:48.934-05
72897420	Cielo Brisceyda Aracely Vargas Chura	72897420@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:49.21-05	2024-12-30 18:15:49.21-05
72968087	AIDA RAQUEL MEDINA CHUTA	72968087@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:49.35-05	2024-12-30 18:15:49.35-05
72972524	Rosmery Quispe Anconeira	72972524@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:49.487-05	2024-12-30 18:15:49.487-05
73025886	CHRISTOPHER SEBASTIAN DIAZ ALPACA	73025886@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:49.623-05	2024-12-30 18:15:49.623-05
73031258	LEONARDO EVERSON NUÑEZ HUARACHA	73031258@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:49.758-05	2024-12-30 18:15:49.758-05
73088767	PIERINA YERALDINE GUERRA LLERENA	73088767@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:49.895-05	2024-12-30 18:15:49.895-05
73101133	Milagros Cruz Sarmiento	73101133@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:50.03-05	2024-12-30 18:15:50.03-05
73101247	CINTHIA SOLEDAD FERATA MAQQUE	73101247@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:50.171-05	2024-12-30 18:15:50.171-05
73135960	MARY CIELO AUCCAPUMA QUISPE	73135960@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:50.318-05	2024-12-30 18:15:50.318-05
73175652	DIEGO ALONSO MENA SUPO	73175652@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:50.461-05	2024-12-30 18:15:50.461-05
73205834	ALEX YHON CCOSCCO TURPO	73205834@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:50.6-05	2024-12-30 18:15:50.6-05
73207651	DIEGO ARMANDO CUEVA ALLASI	73207651@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:50.735-05	2024-12-30 18:15:50.735-05
73250219	FERNANDO ANGEL OCHOA OCHOA	73250219@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:50.872-05	2024-12-30 18:15:50.872-05
73305479	ANIKA MARIA JOSE DIAZ HUISA	73305479@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:51.009-05	2024-12-30 18:15:51.009-05
73364191	EDITH NOEMI CARREON CCANSAYA	73364191@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:51.146-05	2024-12-30 18:15:51.146-05
73386736	Ruth Karina Karina Choquemaqui Tacuri	73386736@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:51.284-05	2024-12-30 18:15:51.284-05
73440827	Brenda Carol Chuctaya Ancca	73440827@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:51.422-05	2024-12-30 18:15:51.422-05
73441575	ERIKA JANETH CHISE LAZARTE	73441575@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:51.558-05	2024-12-30 18:15:51.558-05
73449629	BREYNER CIRO RIVEROS PURGUAYA	73449629@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:51.695-05	2024-12-30 18:15:51.695-05
73458073	RIBERT CLINTON CCAYUSE QUISPE	73458073@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:51.832-05	2024-12-30 18:15:51.832-05
73475819	FABRICIO ORE COAQUIRA	73475819@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:51.969-05	2024-12-30 18:15:51.969-05
73478657	Julissa Lucia Mendoza Ancco	73478657@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.105-05	2024-12-30 18:15:52.105-05
73487381	SHEYLA FERNANDA QUISPE ALMANZA	73487381@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.242-05	2024-12-30 18:15:52.242-05
73488963	Melissa Milene Merma Ccansaya	73488963@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.378-05	2024-12-30 18:15:52.378-05
73493732	Freddy Anderson Tapara Pacompia	73493732@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.516-05	2024-12-30 18:15:52.516-05
73498665	Mileiny Michela Paredes Flores	73498665@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.653-05	2024-12-30 18:15:52.653-05
73513556	Sajeli Candy Jarata Condori	73513556@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.79-05	2024-12-30 18:15:52.79-05
73517738	JANS WILLIANS PEREZ LLANOS	73517738@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:52.925-05	2024-12-30 18:15:52.925-05
73520390	Melany Shiomara Anco Machaca	73520390@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.062-05	2024-12-30 18:15:53.062-05
73524553	Ana Lisbeth Tito Casani	73524553@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.203-05	2024-12-30 18:15:53.203-05
73623809	ANGIE MELIZA BEGAZO GONZALES	73623809@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.343-05	2024-12-30 18:15:53.343-05
73632615	Sonia Pacco Arovilca	73632615@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.478-05	2024-12-30 18:15:53.478-05
73632616	NAYDA PACCO AROVILCA	73632616@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.617-05	2024-12-30 18:15:53.617-05
73700603	Yadhira Deliz Escarcina Cornejo	73700603@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.755-05	2024-12-30 18:15:53.755-05
73714384	EMERSON DAVID TAYPE OTAZU	73714384@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:53.892-05	2024-12-30 18:15:53.892-05
73761219	Leydi Alejandrina Alejandrina García Huanaco	73761219@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.029-05	2024-12-30 18:15:54.029-05
73765472	LIDIA HANCCO CCOMPI	73765472@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.166-05	2024-12-30 18:15:54.166-05
73768902	Moisés Washington Suaña Suaña	73768902@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.305-05	2024-12-30 18:15:54.305-05
73773248	Yennyfer Mehely Miranda Mamani	73773248@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.441-05	2024-12-30 18:15:54.441-05
73775352	Indira Huayllani Gutierrez	73775352@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.578-05	2024-12-30 18:15:54.578-05
73776175	WILY OLGER FLOREZ MERMA	73776175@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.715-05	2024-12-30 18:15:54.715-05
73861834	LIZBETH IRMA ARQQUE CHILE	73861834@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.851-05	2024-12-30 18:15:54.851-05
73862823	EDMUNDO YLACHOQUE SAICO	73862823@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:54.989-05	2024-12-30 18:15:54.989-05
73864108	ESTEBAN RENZO RAMÍREZ ZAPANA	73864108@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.125-05	2024-12-30 18:15:55.125-05
73883924	LISBETH SARITA UYUQUIPA TANTACUELLO	73883924@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.265-05	2024-12-30 18:15:55.265-05
73884254	MILAGROS GLADYS ANCONEIRA RAMOS	73884254@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.402-05	2024-12-30 18:15:55.402-05
73888854	Maricielo Victoria Paco Cacya	73888854@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.538-05	2024-12-30 18:15:55.538-05
73903452	Madeley Ammi Ocsa Tancayllo	73903452@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.675-05	2024-12-30 18:15:55.675-05
73965727	Ruth Kiara Araoz Huaman	73965727@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:55.811-05	2024-12-30 18:15:55.811-05
73965728	Araoz Huaman Ana Lucia	73965728@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:55.947-05	2024-12-30 18:15:55.947-05
73973677	Sebastián Rodrigo Quispe Bolivar	73973677@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:56.083-05	2024-12-30 18:15:56.083-05
74026223	Leyda Anarela Quispecondori Aguilar	74026223@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:56.221-05	2024-12-30 18:15:56.221-05
72865556	LUIS ALBERTO VARGAS VARGAS	72865556@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	t	2024-12-30 18:15:49.073-05	2025-10-22 16:04:36.323-05
74056639	Ronaldino Huayta Quispe	74056639@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:56.357-05	2024-12-30 18:15:56.357-05
74072378	MARÍA ISABEL CHUQUINAYRA GOMEZ	74072378@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:56.494-05	2024-12-30 18:15:56.494-05
74073445	GABRIEL ISAAC SILVA DELGADO	74073445@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:56.629-05	2024-12-30 18:15:56.629-05
74075848	Evelin Justina Chullunquia Uscamayta	74075848@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:56.765-05	2024-12-30 18:15:56.765-05
74075900	Milagros Nora Meneses Apaza	74075900@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:56.9-05	2024-12-30 18:15:56.9-05
74084045	MABEL MARILIN CHAMBI CAHUANA	74084045@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.039-05	2024-12-30 18:15:57.039-05
74094727	ERICKSON CHANEEL LINARES HANCCO	74094727@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.174-05	2024-12-30 18:15:57.174-05
74094742	Diego De La Cruz Ñahui Flores	74094742@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.313-05	2024-12-30 18:15:57.313-05
74128291	MILAGROS YANETH CHAMBI MENA	74128291@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.449-05	2024-12-30 18:15:57.449-05
74148378	JAVIER JESUS APAZA PILINCO	74148378@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:57.584-05	2024-12-30 18:15:57.584-05
74165408	EVERTH YONNY CAYLLAHUA MONTESINOS	74165408@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.72-05	2024-12-30 18:15:57.72-05
74167950	YULIANA VILCA LEQQUE	74167950@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.855-05	2024-12-30 18:15:57.855-05
74206472	CLARA MADELEYNE OTAZU PEÑA	74206472@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:57.99-05	2024-12-30 18:15:57.99-05
74206771	Yhon Arnol Mamani Mamani	74206771@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:58.127-05	2024-12-30 18:15:58.127-05
74207823	JASON MANUEL MAMANI CHAMBI	74207823@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:58.261-05	2024-12-30 18:15:58.261-05
74238286	Apaza Laura Claudia	74238286@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:15:58.396-05	2024-12-30 18:15:58.396-05
74241351	Jenifer Belinda Coaquira Tapia	74241351@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:58.53-05	2024-12-30 18:15:58.53-05
74242714	Ana Esther Lopez Huaylla	74242714@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:58.667-05	2024-12-30 18:15:58.667-05
74247309	ANFANY ALISON QUICAÑA BUSTINZA	74247309@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:58.802-05	2024-12-30 18:15:58.802-05
74247325	YANET NOEMI QUICAÑO PACSI	74247325@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:58.943-05	2024-12-30 18:15:58.943-05
74247383	JUAN DANIEL HUARCAYA FLOREZ	74247383@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.078-05	2024-12-30 18:15:59.078-05
74247384	Huarcaya Flores Mishel Madiel	74247384@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.214-05	2024-12-30 18:15:59.214-05
74247385	Yoel Cristian Huarcaya Flores	74247385@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.351-05	2024-12-30 18:15:59.351-05
74319645	SERGIO LUIS LLANQUE SANTOS	74319645@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.488-05	2024-12-30 18:15:59.488-05
74319710	SERGIO ANTONI HANCCO VILLAVICENCIO	74319710@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:15:59.627-05	2024-12-30 18:15:59.627-05
74319711	LIZBETH ZONALLY HANCCO VILLAVICENCIO	74319711@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.763-05	2024-12-30 18:15:59.763-05
74351251	Yuby Jackelyn Caura Huanca	74351251@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:15:59.9-05	2024-12-30 18:15:59.9-05
74351252	LUIS ANTONY CAIRA HUANCA	74351252@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.035-05	2024-12-30 18:16:00.035-05
74378499	VLADIMIR JOHN DE LA CRUZ QUISPE	74378499@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.173-05	2024-12-30 18:16:00.173-05
74379006	CARMEN ROSA PIZARRO ALA	74379006@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:00.308-05	2024-12-30 18:16:00.308-05
74384182	Challco Millio Alejandra	74384182@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:00.444-05	2024-12-30 18:16:00.444-05
74412180	SUMILDA TORRES CHOQQUEPURA	74412180@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.579-05	2024-12-30 18:16:00.579-05
74432752	Baneza Hancco Cuti	74432752@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.716-05	2024-12-30 18:16:00.716-05
74455488	Melany Jasmyn Vargas Utani	74455488@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.852-05	2024-12-30 18:16:00.852-05
74475974	Hilda Torres Choqquepura	74475974@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:00.99-05	2024-12-30 18:16:00.99-05
74490190	JUAN JOSE HUAMANI CARDENAS	74490190@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:01.133-05	2024-12-30 18:16:01.133-05
74496597	JESUS GUIDO CCACYA HANCCONAIRA	74496597@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.271-05	2024-12-30 18:16:01.271-05
74575240	Yulia Laybe Huanca Gonzales	74575240@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.412-05	2024-12-30 18:16:01.412-05
74575670	RUTH MERY RAMOS CCUNO	74575670@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.55-05	2024-12-30 18:16:01.55-05
74582011	Luis Cuba Vilca	74582011@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.69-05	2024-12-30 18:16:01.69-05
74601596	MIREYA LUZ GAMERO QUISPE	74601596@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.826-05	2024-12-30 18:16:01.826-05
74639476	HEIDY JHANET LEO CABRERA	74639476@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:01.965-05	2024-12-30 18:16:01.965-05
74647628	Olivia Conza Salcedo	74647628@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.101-05	2024-12-30 18:16:02.101-05
74708115	JUAN CARLOS ROJAS CCALLO	74708115@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.241-05	2024-12-30 18:16:02.241-05
74736540	Absalon Emerson Velasquez Quispe	74736540@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.379-05	2024-12-30 18:16:02.379-05
74779109	ANA ROCIO QUISPE ARENAS	74779109@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.521-05	2024-12-30 18:16:02.521-05
74859842	STIF STING SALLUCA CANAZA	74859842@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.659-05	2024-12-30 18:16:02.659-05
74915028	Arias Baca Erika	74915028@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:02.795-05	2024-12-30 18:16:02.795-05
75005276	Heydee Gabriela Gamero Huayhua	75005276@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:02.933-05	2024-12-30 18:16:02.933-05
75051852	CRISTIAN SERGIO CONDORI APAZA	75051852@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:03.073-05	2024-12-30 18:16:03.073-05
75106018	PAOLA JHAKELINE ZEGARRA CHOQUE	75106018@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:03.209-05	2024-12-30 18:16:03.209-05
75136605	Choqueluque Quispe Euricia Marisol	75136605@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:03.347-05	2024-12-30 18:16:03.347-05
75146248	CLENY APFATA CJURO	75146248@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:03.485-05	2024-12-30 18:16:03.485-05
75213925	Rossemey Bustamante Huarca	75213925@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:03.623-05	2024-12-30 18:16:03.623-05
75217169	Pilar Salluca Gomez	75217169@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:03.764-05	2024-12-30 18:16:03.764-05
75252004	SHARON TATIANA VERA CALDERON	75252004@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:03.903-05	2024-12-30 18:16:03.903-05
75283027	Franklin Deizler Mamani Llaiqui	75283027@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.039-05	2024-12-30 18:16:04.039-05
75348042	Huayhua Quispe Dianet Thalia	75348042@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:04.177-05	2024-12-30 18:16:04.177-05
75359218	ALEXANDRA DIANA CJURO VERA	75359218@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.311-05	2024-12-30 18:16:04.311-05
75367106	Ccalla Canaza Luz Aydee	75367106@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:04.447-05	2024-12-30 18:16:04.447-05
75375815	KEVIN HUILLCA HANCCO	75375815@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.582-05	2024-12-30 18:16:04.582-05
75375822	ELIAS COCOLISO FRANKLIN SUMERINDE CONDORI	75375822@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.717-05	2024-12-30 18:16:04.717-05
75386873	Jaime Arturo Huanacune Huamani	75386873@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.854-05	2024-12-30 18:16:04.854-05
75473569	JEAN MARKO CCAYUSE QUISPE	75473569@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:04.99-05	2024-12-30 18:16:04.99-05
75473570	RONY ISAURO CCAYUSE QUISPE	75473570@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.127-05	2024-12-30 18:16:05.127-05
75493020	BRISSA MARYORI CCAMA CONDORI	75493020@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.264-05	2024-12-30 18:16:05.264-05
75581739	ANDREA RAQUEL PLASENCIA FUENTES	75581739@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.401-05	2024-12-30 18:16:05.401-05
75676942	MIGUEL ANGEL PACCO HUAYHUA	75676942@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.536-05	2024-12-30 18:16:05.536-05
75690583	Yenny Roxana Alvarado Mamani	75690583@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.678-05	2024-12-30 18:16:05.678-05
75721253	Ana Lucía Condorpusa Umiyauri	75721253@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:05.815-05	2024-12-30 18:16:05.815-05
75727623	Morales Quispe Regina Guadalupe	75727623@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:05.954-05	2024-12-30 18:16:05.954-05
75728026	Vivian Belen Turpo Quico	75728026@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:06.091-05	2024-12-30 18:16:06.091-05
75736613	SANDRA FIORELLA ZEBALLOS SUNI	75736613@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:06.226-05	2024-12-30 18:16:06.226-05
75764312	Mamani Choque Helen Brytney	75764312@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:06.363-05	2024-12-30 18:16:06.363-05
75782823	ALVARO ALFONSO APAZA HUAMAN	75782823@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:06.499-05	2024-12-30 18:16:06.499-05
75783710	LEIDY LUCIA HUAYTA MAMANI	75783710@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:06.635-05	2024-12-30 18:16:06.635-05
75785901	LUZ MARINA ROJAS ROJAS	75785901@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:06.774-05	2024-12-30 18:16:06.774-05
75803370	Perla Sofia Mamani Galdos	75803370@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:06.914-05	2024-12-30 18:16:06.914-05
75803376	YERALDI XIOMARA BENIQUE PONCE	75803376@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:07.051-05	2024-12-30 18:16:07.051-05
75803378	Casani Valeriano Claudia Alejandra 	ccasani@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:16:07.189-05	2024-12-30 18:16:07.189-05
75804353	Deborah Esther Achahui Panibra	75804353@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:07.325-05	2024-12-30 18:16:07.325-05
75853377	Jesus Quispe Mamami	75853377@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:07.461-05	2024-12-30 18:16:07.461-05
75864411	Cjuno Yauri Julia Anita 	jcjuno@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:16:07.597-05	2024-12-30 18:16:07.597-05
75864987	KEYDI SARITA SURCO OSNAYO	75864987@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:07.732-05	2024-12-30 18:16:07.732-05
75865537	NATALY EULALIA CHANCOLLA YANQUE	75865537@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:07.872-05	2024-12-30 18:16:07.872-05
75872850	Fany Karen Huamani Pacco	75872850@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.01-05	2024-12-30 18:16:08.01-05
75916644	LEONARDO CRUZ RODRIGUEZ	75916644@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.146-05	2024-12-30 18:16:08.146-05
75927962	SEBASTIAN LUIS ANDRE VELASQUEZ GALARRETA	75927962@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.284-05	2024-12-30 18:16:08.284-05
75940794	KEVIN ARNOLD NINA CANAZA	75940794@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.422-05	2024-12-30 18:16:08.422-05
75956865	MARIA ELENA HUALLPA RAMOS	75956865@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.559-05	2024-12-30 18:16:08.559-05
75967232	ELVIA JANELA QUICO LLANQUI	75967232@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.696-05	2024-12-30 18:16:08.696-05
75974025	YERALDINE HUARCA COAQUIRA	75974025@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.833-05	2024-12-30 18:16:08.833-05
75979980	Julver Aurelio Pallani Chara	75979980@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:08.969-05	2024-12-30 18:16:08.969-05
75980351	JEANET NATALY PARI FLORES	75980351@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:09.112-05	2024-12-30 18:16:09.112-05
75981972	ALEJANDRA ROSA ARANA HUARCA	75981972@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:09.435-05	2024-12-30 18:16:09.435-05
75987995	María Sucapuca Janaluca	75987995@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:09.577-05	2024-12-30 18:16:09.577-05
76032020	Alexander Samayani Ccapira	76032020@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:09.712-05	2024-12-30 18:16:09.712-05
76043935	Quispe Sulla Yanet	76043935@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:09.85-05	2024-12-30 18:16:09.85-05
76074268	VICTOR RAUL FARFAN HUISA	76074268@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:09.985-05	2024-12-30 18:16:09.985-05
76078137	SILVIA SANDRA CHAHUARA AQEPUCHO	76078137@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:10.124-05	2024-12-30 18:16:10.124-05
76161145	Zenaida Maribel Choquecota Alave	76161145@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:10.26-05	2024-12-30 18:16:10.26-05
76186720	MARIANELA VEGA SALAS	76186720@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:10.399-05	2024-12-30 18:16:10.399-05
76189554	OSCAR SUPO HUAYPUNA	76189554@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:10.537-05	2024-12-30 18:16:10.537-05
76196126	MAYDE MASIEL ROJAS CORRALES	76196126@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:10.673-05	2024-12-30 18:16:10.673-05
76222421	ANGELA CHUA HUAMAN	76222421@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:10.808-05	2024-12-30 18:16:10.808-05
76227418	AQUILES WILBER TITO PONCE	76227418@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:10.943-05	2024-12-30 18:16:10.943-05
76239636	Cristian Huber Delgado Choquehuanca	76239636@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:11.079-05	2024-12-30 18:16:11.079-05
76374932	JOSUE GIANCARLOS SALAS SAVEDRA	76374932@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:11.214-05	2024-12-30 18:16:11.214-05
76375870	Rosa Quispe Gutierrez	76375870@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:11.351-05	2024-12-30 18:16:11.351-05
76405477	MARISOL CLAUDIA CHOQUEHUAYTA CHARA	76405477@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:11.486-05	2024-12-30 18:16:11.486-05
76448948	THALIA ESTEFANY CANSAYA PERALTA	76448948@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:11.624-05	2024-12-30 18:16:11.624-05
76451868	NOEL ERALDO TACO GUEVARA	76451868@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:11.761-05	2024-12-30 18:16:11.761-05
76453540	Mendoza Sarco Yaquelin	ymendoza@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:16:11.896-05	2024-12-30 18:16:11.896-05
76507572	MICHEL GIONANI HUALLPARTUPA PUMA	76507572@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:12.033-05	2024-12-30 18:16:12.033-05
76519552	BRAYAN ALEXIS CABANA SUMARI	76519552@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:12.17-05	2024-12-30 18:16:12.17-05
76540504	Ccacya Sueros Cesar Augusto 	cccacya@cedhinuevaarequipa.edu.pe	Administrativos	M	f	2024-12-30 18:16:12.306-05	2024-12-30 18:16:12.306-05
76545647	ERICA SURI CHOQUEANCO	76545647@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:12.442-05	2024-12-30 18:16:12.442-05
76621087	ROSA CARMEN CHOQQUEPURA HUAMANI	76621087@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:12.578-05	2024-12-30 18:16:12.578-05
76626819	ALICIA ROGELIA LLALLACACHI TAIPE	76626819@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:12.714-05	2024-12-30 18:16:12.714-05
76626874	KAREN PAOLA QUISPE PUMA	76626874@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:12.85-05	2024-12-30 18:16:12.85-05
76630864	LUIS WILFREDO MACHACA ARQQUE	76630864@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:12.987-05	2024-12-30 18:16:12.987-05
76643205	ROSA ISELA CCAMA QUISPE	76643205@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:13.122-05	2024-12-30 18:16:13.122-05
76659255	VICTOR HUGO VELASQUEZ ASTULLE	76659255@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:13.257-05	2024-12-30 18:16:13.257-05
76681797	RICHARD YLACHOQUE SAICO	76681797@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:13.393-05	2024-12-30 18:16:13.393-05
76685351	CLEIVER RICARDO LAURA CALISAYA	76685351@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:13.529-05	2024-12-30 18:16:13.529-05
76752826	Jessica Abril Paricahua Vita	76752826@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:13.666-05	2024-12-30 18:16:13.666-05
76777024	RAQUEL FIORELA CCAPA QUISPE	76777024@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:13.808-05	2024-12-30 18:16:13.808-05
76795959	KATHERIN QUISPE ARIAS	76795959@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:13.943-05	2024-12-30 18:16:13.943-05
76869365	Maribel Cahuapaza Quispe	76869365@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.088-05	2024-12-30 18:16:14.088-05
76869366	Adelaida Cahuapaza Quispe	76869366@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.232-05	2024-12-30 18:16:14.232-05
76869488	NATALY AYDEE ILLACHURA GALDOS	76869488@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.37-05	2024-12-30 18:16:14.37-05
76882518	Ruth Norit Sencca Miranda	76882518@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.509-05	2024-12-30 18:16:14.509-05
76907488	MICHAEL ANTONY TICONA HUACASI	76907488@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.645-05	2024-12-30 18:16:14.645-05
76909158	NORELIA JOMELY CARPIO CONDORI	76909158@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.779-05	2024-12-30 18:16:14.779-05
76910524	Jalleska Shyomara Bolivar Calle	76910524@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:14.916-05	2024-12-30 18:16:14.916-05
76918917	WENDY YOSELIN ROJAS NINA	76918917@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.054-05	2024-12-30 18:16:15.054-05
76921439	Ursula Yohana Bobadilla Marquez	76921439@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:15.19-05	2024-12-30 18:16:15.19-05
76921440	Josue Antonio Callata Marquez	76921440@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.328-05	2024-12-30 18:16:15.328-05
76924836	MARIBEL CORAIMA SISA QUISPE	76924836@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.465-05	2024-12-30 18:16:15.465-05
76933615	JOSUE EDISON DUEÑAS CARI	76933615@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.6-05	2024-12-30 18:16:15.6-05
76935029	Katherine Oriele Añamuro Barrios	76935029@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.736-05	2024-12-30 18:16:15.736-05
76940601	SAMUEL URBANO HUALLPA CRUZ	76940601@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:15.874-05	2024-12-30 18:16:15.874-05
76965213	RUTH DELIA COLQUE SAICO	76965213@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.009-05	2024-12-30 18:16:16.009-05
77014896	Brayan Aylton Chipana Chambilla	77014896@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.145-05	2024-12-30 18:16:16.145-05
77031221	Jeaneth Yucra Llasa	77031221@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.282-05	2024-12-30 18:16:16.282-05
77040874	KEVIN ANIBAL AGUILAR HUAYTA	77040874@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.421-05	2024-12-30 18:16:16.421-05
77046820	Arianet Lucero Yucra Mollizaca	77046820@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.559-05	2024-12-30 18:16:16.559-05
77068530	BROOKE NATALY PAPEL NUÑEZ	77068530@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:16.695-05	2024-12-30 18:16:16.695-05
77068533	FIORELLA PAMELA BALCÓN NUÑEZ	77068533@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:16.834-05	2024-12-30 18:16:16.834-05
77130485	GONZALO JESÚS ZEGARRA ALCCAHUAMAN	77130485@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:16.973-05	2024-12-30 18:16:16.973-05
77140166	SANDRA LISBETH CJURO VERA	77140166@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:17.113-05	2024-12-30 18:16:17.113-05
77141845	ELMER NANI QUISPE TACO	77141845@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:17.251-05	2024-12-30 18:16:17.251-05
77141846	Dilman Quispe Taco	77141846@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:17.387-05	2024-12-30 18:16:17.387-05
77147873	JULIO CESAR RECSI HUACHACA	77147873@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:17.523-05	2024-12-30 18:16:17.523-05
77151136	Luis Angel Apaza Rojas	77151136@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:17.663-05	2024-12-30 18:16:17.663-05
77171688	Margoth Lidia Margoth Lidia	77171688@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:17.936-05	2024-12-30 18:16:17.936-05
77214558	Ruth Nayda Condori Huamani	77214558@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:18.073-05	2024-12-30 18:16:18.073-05
77223526	NERY ELIZABETH CHAUPI SARAYASI	77223526@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:18.209-05	2024-12-30 18:16:18.209-05
77237287	Anacely Anyela Gomez Montalvo	77237287@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:18.346-05	2024-12-30 18:16:18.346-05
77245973	ROLANDO CUNO SARCO	77245973@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:18.481-05	2024-12-30 18:16:18.481-05
77333733	YESSICA MILAGROS MACHACA BARRAZA	77333733@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:18.621-05	2024-12-30 18:16:18.621-05
77337766	RUTH KARINA RECSI MARQUEZ	77337766@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:18.757-05	2024-12-30 18:16:18.757-05
77340344	BIELKA FIORELLA PACAYA CALACHUA	77340344@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:18.892-05	2024-12-30 18:16:18.892-05
77341821	Paucar Ccama Mary Zunilda	77341821@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:19.027-05	2024-12-30 18:16:19.027-05
77435997	Luther Cortez Arias	77435997@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.162-05	2024-12-30 18:16:19.162-05
77477927	Angi Jimena Vilca Ramos	77477927@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.297-05	2024-12-30 18:16:19.297-05
77478477	SAYRA KEETT LORENZO JAMANCA	77478477@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.433-05	2024-12-30 18:16:19.433-05
77710413	YAJAIDA CUYO ZAMATA	77710413@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.569-05	2024-12-30 18:16:19.569-05
77908533	Esmeralda Choque Anco	77908533@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.704-05	2024-12-30 18:16:19.704-05
78015083	SHIRLE LUCERO NUÑONCCA PUMA	78015083@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.84-05	2024-12-30 18:16:19.84-05
78018491	IRMA CELIA CHOQUE FLORES	78018491@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:19.977-05	2024-12-30 18:16:19.977-05
78018969	Ismael Jefferson Quispe Llaza	78018969@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:20.114-05	2024-12-30 18:16:20.114-05
78113293	Wendi Anadalai Gutierrez Iquise	78113293@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:20.25-05	2024-12-30 18:16:20.25-05
78374391	Llallacachi Taipe Eliana Elsa	78374391@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:20.386-05	2024-12-30 18:16:20.386-05
78546457	Fiorella Noemi Herrera Osorio	78546457@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:20.526-05	2024-12-30 18:16:20.526-05
79300613	Yina Mónica Ramos Soto	79300613@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:20.666-05	2024-12-30 18:16:20.666-05
79382261	Samuel Felipe Ramos Chicaña	79382261@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:20.802-05	2024-12-30 18:16:20.802-05
80389135	Beniranda Copaja Huayna	80389135@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:20.943-05	2024-12-30 18:16:20.943-05
80611091	ANGEL PEÑA TACO	80611091@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	f	2024-12-30 18:16:21.077-05	2024-12-30 18:16:21.077-05
81629463	Luis Daniel Hilario Mamani	81629463@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:21.35-05	2024-12-30 18:16:21.35-05
43377794	Callo Quispe Monica Ysabel	43377794@cedhinuevaarequipa.edu.pe	AlumnosCETPRO	M	f	2024-12-30 18:16:21.487-05	2024-12-30 18:16:21.487-05
60836826	Dieved Obel Sucapuca Aguilar	60836826@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	f	2024-12-30 18:16:21.635-05	2024-12-30 18:16:21.635-05
49004836	SOLEDAD PLACIDA QQUELCCA CASTELO	49004836@cedhinuevaarequipa.edu.pe	EgresadosCEDHI	M	t	2024-12-30 18:15:24.082-05	2025-10-22 20:09:29.178-05
80879008	Edwin Recsi Leandres	80879008@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	t	2024-12-30 18:16:21.215-05	2025-10-23 17:53:24.886-05
2225	Aula virtual 04 CEDHI	acedhi04@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.561-05	2025-10-23 22:04:34.599-05
77151137	CARMEN NATALIA VEGA SANCA	77151137@cedhinuevaarequipa.edu.pe	AlumnosCEDHI	M	t	2024-12-30 18:16:17.8-05	2025-10-23 16:56:27.77-05
123456	TEST Sistemas CEDHI	test@cedhinuevaarequipa.edu.pe	Docentes	M	f	2024-12-30 18:15:04.138-05	2025-11-02 02:09:51.677-05
54321	ESTUDIANTE TEST	testestudiante7@gmail.com	AlumnosCEDHI	F	\N	2025-11-02 11:27:13.864-05	2025-11-02 11:27:13.864-05
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (registro, ubicacion_estanteria, titulo, autor, codigo_dewey, notacion_interna, codigo, isbn, editorial, tema, idioma, tipo_material, num_paginas, num_edicion, ciudad, ano, tabla_contenido, disponibilidad, url_cover) FROM stdin;
1000001	Formación humana	Sal de los cerros	Stefano Varese	\N	\N	\N	9972-221-12-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	350 páginas	Primera reimpresión	Lima	2010	Etnología. Localización, lengua, demografia. Las relaciones ecológicas. La organización social. a) Algunas características sociales. b) Un modelo flexible. El mundo espiritual. Míticos y Místicos. Chunchos y Antis. Los Pilcozones. El jesuita Font. Las entradas franciscanas del siglo XVII. Biedma y Huerta, exploradores del Tambo. Contribuciones etnográficas de los documentos de 1686. El siglo de la rebelión. Años de víspera. Juan Santos el Mesías. "... Y a los españoles se les acabó su tiempo...". "... Desapareció su cuerpo echando humo...". El cerco se angosta. Cañones para los chunchos. La voz de un humanista. Correrías y buena vida. Sal y herrerías. Unos pocos etnógrafos. ... Y muchos misioneros. El mito del origen del hombre blanco. El chamanismo heroico. Pachakamáite. Resistencia y utopía en la Amazonía peruana. Multietnicidad y construcción hegemónica: proyectos indios y futuro global (1988). Pueblos indígenas y globalización en el umbral del tercer milenio (1993). Crítica de la razón distópica. Homenaje a la imaginación utópica de Martin Diskin y Guillermo Bonfil Batalla (1998). Economía política moral y territorialidad indígena en la Amazonía (2004). La impronta de La sal de los cerros en los estudios amazónicos, Frederica Barclay Rey de Castro.	t	\N
1000002	Formación humana	Sal de los cerros	Stefano Varese	\N	\N	\N	9972-221-12-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	350 páginas	Primera reimpresión	Lima	2010	\N	t	\N
1000003	Formación humana	Sal de los cerros	Stefano Varese	\N	\N	\N	9972-221-12-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	350 páginas	Primera reimpresión	Lima	2010	\N	t	\N
1000004	\N	Vallejo en los infiernos	Eduardo Gonzáles Viaña	\N	\N	\N	978-9972-221-83-5	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	514 páginas	Primera reimpresión	Lima	2009	\N	t	\N
1000005	\N	Vallejo en los infiernos	Eduardo Gonzáles Viaña	\N	\N	\N	978-9972-221-83-5	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	514 páginas	Primera reimpresión	Lima	2009	\N	t	\N
1000006	\N	Vallejo en los infiernos	Eduardo Gonzáles Viaña	\N	\N	\N	978-9972-221-83-5	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	514 páginas	Primera reimpresión	Lima	2009	\N	t	\N
1000007	\N	Guerra a la luz de las velas	Daniel Alarcón	\N	\N	\N	978-9972-232-13-8	Alfaguara	LITERATURA	Español	LIBRO	265 páginas	Tercera reimpresion	Lima	2012	\N	t	\N
1000008	\N	Cuentos inolvidables	Julio Cortázar	\N	\N	\N	978-612-4039-21-8	Alfaguara	LITERATURA	Español	LIBRO	343 páginas	Primera reimpresión	Lima	2011	\N	t	\N
1000009	\N	Radio ciudad perdida	Daniel Alarcón	\N	\N	\N	978-9972-232-66-4	Alfaguara	LITERATURA	Español	LIBRO	386 páginas	Primera reimpresión	Lima	2012	\N	t	\N
1000010	\N	Dimensión de la piedra	Julio Garrido Malaver	\N	\N	\N	978-612-4075-04-9	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	183 páginas	Primera edición	Lima	2010	\N	t	\N
1000011	\N	Dimensión de la piedra	Julio Garrido Malaver	\N	\N	\N	978-612-4075-04-9	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	183 páginas	Primera edición	Lima	2010	\N	t	\N
1000012	\N	Dimensión de la piedra	Julio Garrido Malaver	\N	\N	\N	978-612-4075-04-9	Fondo Editorial del Congreso del Perú	LITERATURA	Español	LIBRO	183páginas	Primera edición	Lima	2010	\N	t	\N
1000013	\N	Vida política en la Arequipa Republicana (1890- 2009)	Héctor Ballón Lozada- Jorge Luis Cáceres Arce	\N	\N	\N	\N	LPG _Editores	CIENCIAS SOCIALES	Español	LIBRO	464 páginas	Se terminó de imprimir	Lima	2009	\N	t	\N
1000014	Formación humana	Racismo y mestizaje y otros ensayos	Gonzalo Portocarrero	\N	\N	\N	978-9972-221-36-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	405 páginas	Primera reimpresion	Lima	2009	RACISMO Y MESTIZAJE. La dominación total. Castigo sin culpa; culpa sin castigo. Los fantasmas de la clase media. LA CUESTIÓN RACIAL: ESPEJISMO Y REALIDAD. La realidad de los deseos. La cuestión racial: espejismo y realidad. Las (sin) razones de la violencia. RESPUESTAS AL SUFRIMIENTO EN LA CULTURA PERUANA. El silencio, la queja y la acción. Las últimas reflexiones de José María Arguedas. OTROS ENSAYOS. Sacaojos: crisis social y fantasmas coloniales. El fundamento invisible: función y lugar de las ideas racistas en la República Aristocrática. Perú; el país de las memorias heridas: entre el (auto) desprecio y la amargura.	t	\N
1000015	Formación humana	Racismo y mestizaje y otros ensayos	Gonzalo Portocarrero	\N	\N	\N	978-9972-221-36-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	405 páginas	Primera reimpresion	Lima	2009	RACISMO Y MESTIZAJE. La dominación total. Castigo sin culpa; culpa sin castigo. Los fantasmas de la clase media. LA CUESTIÓN RACIAL: ESPEJISMO Y REALIDAD. La realidad de los deseos. La cuestión racial: espejismo y realidad. Las (sin) razones de la violencia. RESPUESTAS AL SUFRIMIENTO EN LA CULTURA PERUANA. El silencio, la queja y la acción. Las últimas reflexiones de José María Arguedas. OTROS ENSAYOS. Sacaojos: crisis social y fantasmas coloniales. El fundamento invisible: función y lugar de las ideas racistas en la República Aristocrática. Perú; el país de las memorias heridas: entre el (auto) desprecio y la amargura.	t	\N
1000016	Formación humana	Racismo y mestizaje y otros ensayos	Gonzalo Portocarrero	\N	\N	\N	978-9972-221-36-1	Fondo Editorial del Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	405 páginas	Primera reimpresion	Lima	2009	RACISMO Y MESTIZAJE. La dominación total. Castigo sin culpa; culpa sin castigo. Los fantasmas de la clase media. LA CUESTIÓN RACIAL: ESPEJISMO Y REALIDAD. La realidad de los deseos. La cuestión racial: espejismo y realidad. Las (sin) razones de la violencia. RESPUESTAS AL SUFRIMIENTO EN LA CULTURA PERUANA. El silencio, la queja y la acción. Las últimas reflexiones de José María Arguedas. OTROS ENSAYOS. Sacaojos: crisis social y fantasmas coloniales. El fundamento invisible: función y lugar de las ideas racistas en la República Aristocrática. Perú; el país de las memorias heridas: entre el (auto) desprecio y la amargura.	t	\N
1000017	\N	Adaptación: Edipo Rey. Edipo en Colona. Electra	Sófocles-Eurípides	\N	\N	\N	\N	"La Confianza" S.A.	LITERATURA	Español	LIBRO	209 páginas	Primera edición	Lima	1994	\N	t	\N
1000018	\N	Defensa de la hispanidad	Ramiro de Maeztu	\N	\N	\N	978-84-934595-3-6	Bibliotheca Homo Legens	CIENCIAS SOCIALES	Español	LIBRO	227 páginas	Primera edición	España	2006	\N	t	\N
1000019	\N	Reminiscencias	Juan José Alzugaray	\N	\N	\N	84-7490-745-4	Ediciones Encuentro	LITERATURA	Español	LIBRO	3273 paginas	\N	España	2004	\N	t	\N
1000020	\N	Vascos relevantes del siglo XX	Juan José Alzugaray	\N	\N	\N	84-7490-733-0	Ediciones Encuentro, S.A.	LITERATURA	Español	LIBRO	3272 paginas	\N	España	2004	\N	t	\N
1000021	\N	Penúltimas voluntades	Juan José Alzugaray	\N	\N	\N	84-7490-569-9	Ediciones Encuentro, S.A.	LITERATURA	Español	LIBRO	3271 paginas	\N	España	2005	\N	t	\N
1000022	\N	Don Quijote de la Mancha (adaptación)	Miguel de Cervantes	\N	\N	\N	978-9972-847-83-7	Alfaguara / Infantil	LITERATURA	Español	LIBRO	3270 paginas	Tercera reimpresión	Lima	2010	\N	t	\N
1000023	\N	Leyendas de los Otori (El suelo del ruiseñor)	Gillian Rubinstein	\N	\N	\N	978-9972-232-85-5	Alfaguara/Serie Otori	LITERATURA	Español	LIBRO	3269 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000024	\N	Leyendas de los Otori (El suelo del ruiseñor)	Gillian Rubinstein	\N	\N	\N	978-9972-232-85-5	Alfaguara/Serie Otori	LITERATURA	Español	LIBRO	3268 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000025	\N	Cinco para las nueve y otros cuentos	Alonso Cueto	\N	\N	\N	978-612-309-037-1	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3267 paginas	Tercera edición	Lima	2012	\N	t	\N
1000026	\N	Arena sucia	Mario Puzo	\N	\N	\N	84-253-0372-9	Ediciones Grijalbo, S.A	LITERATURA	Español	LIBRO	3266 paginas	Veinteava edición	Barcelona	1975	\N	t	\N
1000027	\N	Cholito en los Andes mágicos	Óscar Colchado Lucio	\N	\N	\N	978-9972-847-39-4	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3265 paginas	Séptima reimpresión	Lima	2011	\N	t	\N
1000028	\N	Cholito y los dioses de Chavín	Óscar Colchado Lucio	\N	\N	\N	978-9972-232-68-8	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3264 paginas	Segunda reimpresión	Lima	2010	\N	t	\N
1000029	\N	Yaxes	Rosa Carrasco Zuleta	\N	\N	\N	978-9972-232-62-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3263 paginas	Cuarta reimpresión	Lima	2012	\N	t	\N
1000030	\N	Caballero Carmelo (adaptación)	Abraham Valdelomar	\N	\N	\N	978-9972-00-522-0	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3262 paginas	Séptima reimpresión	Lima	2010	\N	t	\N
1000031	\N	Horca del pirata	Jorge Eslava	\N	\N	\N	978-612-4039-97-3	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3261 paginas	Primera edición	Lima	2011	\N	t	\N
1000032	\N	Amaro y el enigma de la montaña	Flor Sánchez Zúñiga	\N	\N	\N	978-603-4016-92-7	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3260 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000033	\N	Hay espacio para todos	Diana Cornejo	\N	\N	\N	978-9972-847-47-9	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3259 paginas	Sexta reimpresión	Lima	2011	\N	t	\N
1000034	\N	Francis Drake: el azote de Dios	Óscar E. Espinar La Torre	\N	\N	\N	978-612-4039-70-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3258 paginas	Primera edición	Lima	2010	\N	t	\N
1000035	\N	Caminantes del Sol - Inti Runañan	Edna Iturralde	\N	\N	\N	978-603-4016-74-3	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3257 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000036	\N	Alforja del Jorobado	Rosa Cerna Guardia	\N	\N	\N	978-612-4039-82-9	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3256 paginas	Primera edición	Lima	2010	\N	t	\N
1000037	\N	Mi amigo el glumpo y el ave fénix	Heriberto Tejo	\N	\N	\N	978-9972-232-71-8	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3255 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000038	\N	Días de carbón	Rosa Cerna Guardia	\N	\N	\N	978-9972-847-41-7	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3254 paginas	Séptima reimpresión	Lima	2011	\N	t	\N
1000039	\N	Perdidos en la montaña	Virginia Wiese Miró Quesada	\N	\N	\N	978-612-4039-32-4	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3253 paginas	Primera reimpresión	Lima	2011	\N	t	\N
1000040	formacion humana 	Inclusión social como desafío de la democracia.	Fredy Otárola Peñaranda	\N	\N	\N	978-612-4075-37-7	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	203 paginas	Primera	Lima	2012	La exclusión como cuestión histórica: un problema de Perú como nación. Apuntes en perspectiva histórica: los excluidos de hoy, los excluidos de siempre. El sentido político de la exclusión: Un asunto de poder, derechos, libertades y postergación. Exclusión social: la ausencia de herramientas institucionales para la propia expresión de la identidad y la cultura. La ley de Consulta de Previa: un esfuerzo democrático para la inclusión. La ausencia de voluntad política y el aumento de la conflictividad social. El tiempo perdido: Bagua, ciudadanos de "segunda categoria" y los muertos de la democracia de papel. Tiempos de cambio y una propuesta renovada: Comisión de Constitución y Reglamento 2011-2012 y la aprobación de la Ley de Consulta Previa. La gran transformación como compromiso para romper la inercia de la exclusión social. La agenda legislativa y el reto de legislar para incluir. El nuevo escenario legal para el diálogo y la inclusión: enfoque de capacidades e interculturalidad. El carácter intercultural de la ley de consulta y la apuesta por el desarrollo de las capacidades. Consulta para qué, consulta para quiénes. Sujetos del derecho a la consulta. ¿Qué medidas son objeto de consulta?. Principios de la consulta. Un acuerdo vinculante para una verdadera democracia. El deber del Estado de ejecutar medidas colectivas e individuales para la protección.	t	\N
1000041	formacion humana 	Inclusión social como desafío de la democracia.	Fredy Otárola Peñaranda	\N	\N	\N	978-612-4075-37-7	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	203 paginas	Primera	Lima	2012	La exclusión como cuestión histórica: un problema de Perú como nación. Apuntes en perspectiva histórica: los excluidos de hoy, los excluidos de siempre. El sentido político de la exclusión: Un asunto de poder, derechos, libertades y postergación. Exclusión social: la ausencia de herramientas institucionales para la propia expresión de la identidad y la cultura. La ley de Consulta de Previa: un esfuerzo democrático para la inclusión. La ausencia de voluntad política y el aumento de la conflictividad social. El tiempo perdido: Bagua, ciudadanos de "segunda categoria" y los muertos de la democracia de papel. Tiempos de cambio y una propuesta renovada: Comisión de Constitución y Reglamento 2011-2012 y la aprobación de la Ley de Consulta Previa. La gran transformación como compromiso para romper la inercia de la exclusión social. La agenda legislativa y el reto de legislar para incluir. El nuevo escenario legal para el diálogo y la inclusión: enfoque de capacidades e interculturalidad. El carácter intercultural de la ley de consulta y la apuesta por el desarrollo de las capacidades. Consulta para qué, consulta para quiénes. Sujetos del derecho a la consulta. ¿Qué medidas son objeto de consulta?. Principios de la consulta. Un acuerdo vinculante para una verdadera democracia. El deber del Estado de ejecutar medidas colectivas e individuales para la protección.	t	\N
1000042	formacion humana 	Inclusión social como desafío de la democracia.	Fredy Otárola Peñaranda	\N	\N	\N	978-612-4075-37-7	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	203 paginas	Primera	Lima	2012	La exclusión como cuestión histórica: un problema de Perú como nación. Apuntes en perspectiva histórica: los excluidos de hoy, los excluidos de siempre. El sentido político de la exclusión: Un asunto de poder, derechos, libertades y postergación. Exclusión social: la ausencia de herramientas institucionales para la propia expresión de la identidad y la cultura. La ley de Consulta de Previa: un esfuerzo democrático para la inclusión. La ausencia de voluntad política y el aumento de la conflictividad social. El tiempo perdido: Bagua, ciudadanos de "segunda categoria" y los muertos de la democracia de papel. Tiempos de cambio y una propuesta renovada: Comisión de Constitución y Reglamento 2011-2012 y la aprobación de la Ley de Consulta Previa. La gran transformación como compromiso para romper la inercia de la exclusión social. La agenda legislativa y el reto de legislar para incluir. El nuevo escenario legal para el diálogo y la inclusión: enfoque de capacidades e interculturalidad. El carácter intercultural de la ley de consulta y la apuesta por el desarrollo de las capacidades. Consulta para qué, consulta para quiénes. Sujetos del derecho a la consulta. ¿Qué medidas son objeto de consulta?. Principios de la consulta. Un acuerdo vinculante para una verdadera democracia. El deber del Estado de ejecutar medidas colectivas e individuales para la protección.	t	\N
1000043	\N	Antología / Los mejores relatos Latinoamericanos	Jorge Luis Borges / Alejo Carpentier / Julio Cortázar / Juan Rulfo / Adolfo Bioy Casares / Gabriel Garcia Márquez	\N	\N	\N	978-9972-232-47-3	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3249 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000044	\N	Antología / Los mejores relatos Latinoamericanos	Jorge Luis Borges / Alejo Carpentier / Julio Cortázar / Juan Rulfo / Adolfo Bioy Casares / Gabriel Garcia Márquez	\N	\N	\N	978-9972-232-47-3	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3248 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000045	\N	Antología. La mala nota / El colegio en el cuento peruano	Ricardo Palma -Manuel Gonzáles Prada -César Vallejo y otros.	\N	\N	\N	978-603-4016-91-0	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3247 paginas	Segunda reimpresión	Lima	2010	\N	t	\N
1000046	\N	A la hora de la tarde y de los juegos	Edgardo Rivera Martínez	\N	\N	\N	978-603-4016-94-1	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3246 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000047	\N	¿Por qué a mi?	Valéria Piassa Polizzi	\N	\N	\N	978-9972-232-20-6	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3245 paginas	Tercera reimpresión	Lima	2010	\N	t	\N
1000048	\N	Chicas de alambre	Jordi Sierra i Fabra	\N	\N	\N	978-603-4016-23-1	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3244 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000049	\N	Antología / Los mejores relatos Latinoámericanos	Jorge Luis Borges / Alejo Carpentier / Julio Cortázar / Juan Rulfo / Adolfo Bioy Casares / Gabriel Garcia Márquez	\N	\N	\N	978-9972-232-47-3	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3243 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000050	\N	Perverso	Mauricio Paredes	\N	\N	\N	978-612-4039-77-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3242 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000051	\N	Patas arriba	María Fernanda Heredia	\N	\N	\N	978-612-4107-04-7	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3241 paginas	Primera edeicion	Lima	2011	\N	t	\N
1000052	\N	Ojitos de Ángel	Ramón Fonseca Mora	\N	\N	\N	978-612-4039-06-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3240 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000053	\N	Ojitos de Ángel	Ramón Fonseca Mora	\N	\N	\N	978-612-4039-06-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3239 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000054	\N	Ojitos de Ángel	Ramón Fonseca Mora	\N	\N	\N	978-612-4039-06-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3238 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000055	\N	Odas femeninas	Juan José Alzugaray	\N	\N	\N	84-7490-744-6	Ediciones Encuentro S.A.	LITERATURA	Español	LIBRO	3237 paginas	Primera	España	2004	\N	t	\N
1000056	\N	Segundo libro del Yo	Juan Fernández Figueroa	\N	\N	\N	84-7490-103-0	Ediciones Encuentro S.A.	FILOSOFIA Y PSICOLOGIA	Español	LIBRO	3236 paginas	Primera	Madrid	1984	\N	t	\N
1000057	\N	Gran conexión	Arnie Warren	\N	\N	\N	84-7953-422-2	Ediciones Urano S.A.	LITERATURA	Español	LIBRO	3235 paginas	Primera	España	2001	\N	t	\N
1000058	Formaciòn humana	Artesanías tradicionales en México	Carlos Espejel	\N	\N	\N	\N	Bdemex S.A	ARTE	Español	LIBRO	158	Primera	México	1972	\N	t	\N
1000059	\N	Jefes / Los cachorros	Mario Vargas Llosa	\N	\N	\N	978-9972-847-63-9	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3233 paginas	Cuarta reimpresion	Lima	2011	\N	t	\N
1000060	\N	Hora de la tarde y de los juegos	Edgardo Rivera Martínez	\N	\N	\N	978-603-4016-94-1	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3232 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000061	\N	Yo también tengo padre	Christine Nöstlinger	\N	\N	\N	978-9972-232-33-6	Santillana S.A.	LITERATURA	Español	LIBRO	3231 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000062	\N	Dedo mágico	Roald Dahl	\N	\N	\N	978-9972-232-98-5	Santillana S.A.	LITERATURA	Español	LIBRO	3230 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000063	\N	Cristo Villenas	Carlos Eduardo Zavaleta	\N	\N	\N	978-9972-232-29-9	Santillana S.A.	LITERATURA	Español	LIBRO	3229 paginas	Primera reimpresion	Lima	2009	\N	t	\N
1000064	\N	Escarabajo de oro y otros cuentos	Edgar Allan Poe	\N	\N	\N	978-612-4039-41-6	Santillana S.A.	LITERATURA	Español	LIBRO	3228 paginas	Primera edición	Lima	2010	\N	t	\N
1000065	\N	Almohadón de plumas y otros cuentos	Horacio Quiroga	\N	\N	\N	978-612-4039-42-3	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3227 paginas	Primera reimpresion	Lima	2010	\N	t	\N
1000066	\N	Casa de Cartón	Rafael de la Fuente Benavides	\N	\N	\N	978-9972-232-15-2	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3226 paginas	Primera reimpresión	Lima	2007	\N	t	\N
1000067	\N	Cholito en la maravillosa Amazonía	Óscar Colchado Lucio	\N	\N	\N	978-603-4016-26-2	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3225 paginas	Cuarta reimpresión	Lima	2012	\N	t	\N
1000068	\N	Pequeño Nicolás	René Goscinny	\N	\N	\N	978-9972-847-59-2	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3224 paginas	Cuarta reimpresion	Lima	2011	\N	t	\N
1000069	\N	Hola, Andrés, soy María otra vez…	María Fernanda Heredia	\N	\N	\N	978-612-4039-25-6	Alfaguara	LITERATURA	Español	LIBRO	3223 paginas	Tercera reimpresion	Lima	2011	\N	t	\N
1000070	\N	Secreto de las islas de Pachacamac	Hernán Garrido-Lecca	\N	\N	\N	978-9972-847-07-3	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3222 paginas	Octava reimpresion	Lima	2011	\N	t	\N
1000071	\N	Dedo mágico	Roald Dahl	\N	\N	\N	978-9972-232-98-5	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3221 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000072	\N	Rugor, el dragón enamorado	Santiago Roncagliolo	\N	\N	\N	978-603-4016-28-6	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3220 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000073	\N	Rugor, el dragón enamorado	Santiago Roncagliolo	\N	\N	\N	978-603-4016-28-6	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3219 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000074	\N	Cómo domesticar a tus papás	Mauricio Paredes	\N	\N	\N	978-612-4039-78-2	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3218 paginas	Primera reimpresión	Lima	2011	\N	t	\N
1000075	\N	Cómo domesticar a tus papás	Mauricio Paredes	\N	\N	\N	978-612-4039-78-2	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3217 paginas	Primera reimpresión	Lima	2011	\N	t	\N
1000076	\N	Poesía en custodia	Edgar O´Hara	\N	\N	\N	9972-890-74-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3216 paginas	Primera	Lima	2005	\N	t	\N
1000077	\N	Poesía en custodia	Edgar O´Hara	\N	\N	\N	9972-890-74-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3215 paginas	Primera	Lima	2005	\N	t	\N
1000078	\N	Poesía en custodia	Edgar O´Hara	\N	\N	\N	9972-890-74-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3214 paginas	Primera	Lima	2005	\N	t	\N
1000079	\N	Instituto enraizado en la sociedad	Juan José Alzugaray	\N	\N	\N	84-7490-085-9	Ediciones Encuentro S.A.	HISTORIA	Español	LIBRO	349	Primera	Madrid	2005	\N	t	\N
1000105	\N	Hermanos Karamazov	Fiódor Dostoyevski	\N	\N	\N	2011-12554	Cultura Peruana	LITERATURA	Español	LIBRO	3187 paginas	Primera	Lima	2011	\N	t	\N
1000106	\N	Dama de las Camelias	Alejandro Dumas	\N	\N	\N	2011-08398	Cultura Peruana	LITERATURA	Español	LIBRO	3186 paginas	Segunda edición	Lima	2011	\N	t	\N
1000107	\N	Hombre que calculaba	Tahan Malba-Julio César de Mello y Souza	\N	\N	\N	150101-2004-4720	Cultura Peruana	LITERATURA	Español	LIBRO	3185 paginas	Primera	Lima	2004	\N	t	\N
1000080	formacion humana	Desborde popular y crisis del Estado / Veinte años después	José Matos Mar	\N	\N	\N	9972-890-62-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	227 paginas	Primera	Lima	2004	INTRODUCCIÓN. Legado andino y patria criolla: una nación inconclusa. El nuevo rostro del Perú. El nuevo rostro urbano: la forja de una identidad. La crisis del Estado y el desborde popular SEGUNDA PARTE LA NUEVA LIMA. 2004. Desborde popular y crisis del Estado, veinte años después. TERCERA PARTE COMENTARIOS. Desborde popular y crisis del Estado: Comentarios a un libro de José Matos Mar. Francisco Miró Quesada Cantuarias. Del Desborde de Matos Mar a los desbordes. Ilave y Polladas. Retorno a la cuestión de la anomia. Hugo Neira. Desborde Popular, veinte años después. Luis pasara. Veinte años después: una tremenda vigencia. Juan Sheput. ¿Desborde o incursión democratizadora?. Sinesio López Jiménez.	t	\N
1000081	formacion humana	Desborde popular y crisis del Estado / Veinte años después	José Matos Mar	\N	\N	\N	9972-890-62-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	227 paginas	Primera	Lima	2004	INTRODUCCIÓN. Legado andino y patria criolla: una nación inconclusa. El nuevo rostro del Perú. El nuevo rostro urbano: la forja de una identidad. La crisis del Estado y el desborde popular SEGUNDA PARTE LA NUEVA LIMA. 2004. Desborde popular y crisis del Estado, veinte años después. TERCERA PARTE COMENTARIOS. Desborde popular y crisis del Estado: Comentarios a un libro de José Matos Mar. Francisco Miró Quesada Cantuarias. Del Desborde de Matos Mar a los desbordes. Ilave y Polladas. Retorno a la cuestión de la anomia. Hugo Neira. Desborde Popular, veinte años después. Luis pasara. Veinte años después: una tremenda vigencia. Juan Sheput. ¿Desborde o incursión democratizadora?. Sinesio López Jiménez.	t	\N
1000082	fomacion humana	Breve Historia de la esclavitud /Una herida que no deja de sangrar	Carlos Aguirre	\N	\N	\N	9972-890-72-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	280 paginas	Primera reimpresión	Lima	2010	Capítulo 1. Orígenes y características de la esclavitud en el Perú colonial. Capítulo 2. La esclavitud y la agricultura colonial. Capítulo 3. La esclavitud urbana. Capítulo 4. Religión y cultura en las comunidades negras. Capítulo 5. Los caminos de la libertad. Capítulos 6. La desintegración de la esclavitud. Epílogo. Bibliografia. Anexo Documental.	t	\N
1000083	fomacion humana	Breve Historia de la esclavitud /Una herida que no deja de sangrar	Carlos Aguirre	\N	\N	\N	9972-890-72-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	280 paginas	Primera reimpresión	Lima	2010	Capítulo 1. Orígenes y características de la esclavitud en el Perú colonial. Capítulo 2. La esclavitud y la agricultura colonial. Capítulo 3. La esclavitud urbana. Capítulo 4. Religión y cultura en las comunidades negras. Capítulo 5. Los caminos de la libertad. Capítulos 6. La desintegración de la esclavitud. Epílogo. Bibliografia. Anexo Documental.	t	\N
1000084	fomacion humana	Breve Historia de la esclavitud /Una herida que no deja de sangrar	Carlos Aguirre	\N	\N	\N	9972-890-72-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	280 paginas	Primera reimpresión	Lima	2010	Capítulo 1. Orígenes y características de la esclavitud en el Perú colonial. Capítulo 2. La esclavitud y la agricultura colonial. Capítulo 3. La esclavitud urbana. Capítulo 4. Religión y cultura en las comunidades negras. Capítulo 5. Los caminos de la libertad. Capítulos 6. La desintegración de la esclavitud. Epílogo. Bibliografia. Anexo Documental.	t	\N
1000085	\N	Endgame. La llamada.	James Frey . Nils Johnson Shelton	\N	\N	\N	978-612-4249-05-1	Planeta Perú S.A.	LITERATURA	Español	LIBRO	3207 paginas	Primera edición	EE.UU.	2014	\N	t	\N
1000086	\N	Aldea encantada	Abraham Valdelomar	\N	\N	\N	978-603-4016-54-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3206 paginas	Segunda reimpresion	Lima	2011	\N	t	\N
1000087	\N	Aldea encantada	Abraham Valdelomar	\N	\N	\N	978-603-4016-54-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3205 paginas	Segunda reimpresion	Lima	2011	\N	t	\N
1000088	\N	Del claro del bosque a las galaxias / La novela de la astronomía	Enrique López-Dóriga Oller	\N	\N	\N	978-612-403-988-1	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	3204 paginas	Primera	Lima	2011	\N	t	\N
1000089	\N	Memorias de un amigo casi verdadero	Mónica Beltrán Brozon	\N	\N	\N	978-612-4039-44-7	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	3203 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000090	\N	Vida es sueño	Pedro Calderón de la Barca	\N	\N	\N	978-603-4039-01-8	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3202 paginas	Primera	Lima	2008	\N	t	\N
1000091	\N	Historia de Mayta	Mario Vargas Llosa	\N	\N	\N	978-612-45982-7-2	Santillana S.A.	LITERATURA	Español	LIBRO	3201 paginas	Primera	Lima	2011	\N	t	\N
1000092	A1	Tartufo / El avaro	Molière	\N	\N	\N	978-612-45201-1-2	Santillana S.A.	LITERATURA	Español	LIBRO	3200 paginas	Segunda edición	Lima	2009	1. Tartufo. 2. El Avaro. 3. Estudio de Tartufo y el Avaro: Sociedad y cultura de la época: Contexto histórico, contexto cultural. 4. El autor y su obra: Perfil biográfico. 5. Análisis de Tartufo: Génesis de la obra, fuentes, contenido y estructura, personajes, estilo. 6. Análisis de El avaro: Significación y fuentes de la obra, contenido y estructura, personajes, estilo. 7. Influencia posterior. 8. Opiniones sobre el autor. 9. Cuadro cronológico. Bibliografía comentada.	t	\N
1000093	\N	Tartufo / El avaro	Molière	\N	\N	\N	978-612-45201-1-2	Santillana S.A.	LITERATURA	Español	LIBRO	3199 paginas	Segunda edición	Lima	2009	\N	t	\N
1000094	\N	Tía Julia y el escribidor	Mario Vargas Llosa	\N	\N	\N	978-612-45870-3-0	Santillana S.A.	LITERATURA	Español	LIBRO	3198 paginas	Segunda reimpresion	Lima	2011	\N	t	\N
1000095	\N	7 Ensayos de interpretación de la Realidad Peruana	José Carlos Mariátegui	\N	\N	\N	\N	Ediciones Cultura Peruana	CIENCIAS SOCIALES	Español	LIBRO	3197 paginas	Primera	Lima	2004	\N	t	\N
1000096	\N	Política	Aristóteles	\N	\N	\N	\N	Ediciones Cultura Peruana	POLÍTICA Y ESTADO	Español	LIBRO	3196 paginas	Primera edición	Lima	2003	\N	t	\N
1000097	\N	República	Platón	\N	\N	\N	\N	Ediciones Cultura Peruana	POLÍTICA Y ESTADO	Español	LIBRO	3195 paginas	Primera	Lima	2002	\N	t	\N
1000098	Cristianismo	Santa María Tonantzintla. El relato en imagen	Luisa Ruiz Moreno	\N	\N	\N	968-29-5590-4	Consejo Nacional para la Cultural y las Artes	RELIGIÓN	Español	LIBRO	228 paginas	Primera	México	1993	\N	t	\N
1000099	\N	Apología de Sócrates	Platón	\N	\N	\N	2007-03039	Ediciones Cultura Peruana	LITERATURA	Español	LIBRO	3193 paginas	Primera reimpresión	Lima	2007	\N	t	\N
1000100	\N	Decamerón	Giovanni Boccaccio	\N	\N	\N	2012-09911	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3192 paginas	Segunda edición	Perú	2012	\N	t	\N
1000101	\N	Así habló Zaratustra	Friedrich Nietzsche	\N	\N	\N	2010-05186	Cultura Peruana	LITERATURA	Español	LIBRO	3191 paginas	Primera	Lima	2010	\N	t	\N
1000102	\N	Nuestra señora de París	Víctor Hugo	\N	\N	\N	1501012003-3647	Cultura Peruana	LITERATURA	Español	LIBRO	3190 paginas	Primera	Lima	\N	\N	t	\N
1000103	\N	Hombre mediocre	José Ingenieros	\N	\N	\N	2010-03639	Cultura Peruana	LITERATURA	Español	LIBRO	3189 paginas	Primera	Lima	2010	\N	t	\N
1000104	\N	Madame Bovary	Gustavo Flaubert	\N	\N	\N	2007-00923	Cultura Peruana	LITERATURA	Español	LIBRO	3188 paginas	Primera	Lima	2007	\N	t	\N
1001409	\N	Ser Mujer T3	\N	\N	\N	\N	\N	\N	ENCICLOPEDIA	Español	LIBRO	1883 paginas	\N	\N	\N	\N	t	\N
1000108	\N	Las mil y una noches	Anónimo	\N	\N	\N	\N	Cultura Peruana	LITERATURA	Español	LIBRO	3184 paginas	Primera	Lima	2002	\N	t	\N
1000109	\N	Niña de la lámpara azul y otros poemas peruanos	José María Eguren	\N	\N	\N	2008-06813	Cultura Peruana	LITERATURA	Español	LIBRO	3183 paginas	Primera edicion	Lima	2008	\N	t	\N
1000110	\N	Cuentos Peruanos	Jorge Espinoza Sánchez	\N	\N	\N	2005-5932	Cultura Peruana	LITERATURA	Español	LIBRO	3182 paginas	Primera	Lima	2005	\N	t	\N
1000111	\N	Conde de Montecristo	Alejandro Dumas	\N	\N	\N	2012-01682	Cultura Peruana	LITERATURA	Español	LIBRO	3181 paginas	Segunda edición	Lima	2012	\N	t	\N
1000112	\N	Isla del tesoro	Robert Louis Stevenson	\N	\N	\N	2010-02873	Cultura Peruana	LITERATURA	Español	LIBRO	3180 paginas	Primera	Lima	2010	\N	t	\N
1000113	\N	Palabra permanente. Verba Manent, Scripta Volant: Teoría y prácticas de la oralidad en el discurso social del Perú.	Juan Biondi . Eduardo Zapata	\N	\N	\N	9972-221-11-3	Congreso del Perú	SOCIOLOGÍA	Español	LIBRO	3179 paginas	Primera	Lima	2006	\N	t	\N
1000114	\N	Palabra permanente. Verba Manent, Scripta Volant: Teoría y prácticas de la oralidad en el discurso social del Perú.	Juan Biondi .Eduardo Zapata	\N	\N	\N	9972-221-11-3	Congreso del Perú	SOCIOLOGÍA	Español	LIBRO	3178 paginas	Primera	Lima	2006	\N	t	\N
1000115	\N	Palabra permanente. Verba Manent, Scripta Volant: Teoría y prácticas de la oralidad en el discurso social del Perú.	Juan Biondi . Eduardo Zapata	\N	\N	\N	9972-221-11-3	Congreso del Perú	SOCIOLOGÍA	Español	LIBRO	3177 paginas	Primera	Lima	2006	\N	t	\N
1000116	\N	Andrés Townsend / Libertad e integración en América Latina.	Hugo Vallenas Málaga	\N	\N	\N	9972-890-66-X	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3176 paginas	Primera	Lima	2004	\N	t	\N
1000117	\N	Andrés Townsend . Libertad e integración en América Latina.	Hugo Vallenas Málaga	\N	\N	\N	9972-890-66-X	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3175 paginas	Primera	Lima	2004	\N	t	\N
1000118	\N	Andrés Townsend .Libertad e integración en América Latina.	Hugo Vallenas Málaga	\N	\N	\N	9972-890-66-X	Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3174 paginas	Primera	Lima	2004	\N	t	\N
1000119	\N	Utopía libertaria en el Perú.	Manuel y Delfín Lévano.	\N	\N	\N	9972-221-05-9	Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	3173 paginas	Primera	Lima	2006	\N	t	\N
1000120	\N	Utopía libertaria en el Perú.	Manuel y Delfín Lévano.	\N	\N	\N	9972-221-05-9	Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	3172 paginas	Primera	Lima	2006	\N	t	\N
1000121	\N	Utopía libertaria en el Perú.	Manuel y Delfín Lévano	\N	\N	\N	9972-221-05-9	Congreso del Perú	CIENCIAS SOCIALES	Español	LIBRO	3171 paginas	Primera	Lima	2006	\N	t	\N
1000122	\N	Artículos periodísticos. Leonidas Yerovi . Obra Completa. / Tomo 2	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-99-6	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3170 paginas	Primera	Lima	2006	\N	t	\N
1000123	\N	Artículos periodísticos. Leonidas Yerovi . Obra Completa. / Tomo 2	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-99-6	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3169 paginas	Primera	Lima	2006	\N	t	\N
1000124	\N	Artículos periodísticos. Leonidas Yerovi . Obra Completa. / Tomo 2	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-99-6	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3168 paginas	Primera	Lima	2006	\N	t	\N
1000125	\N	Letrillas poíticas. Leonidas Yerovi. Obra Completa / Tomo 1	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-81-3	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3167 paginas	Primera	Lima	2005	\N	t	\N
1000126	\N	Letrillas poíticas. Leonidas Yerovi. Obra Completa / Tomo 1	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-81-3	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3166 paginas	Primera	Lima	2005	\N	t	\N
1000127	\N	Letrillas poíticas. Leonidas Yerovi. Obra Completa / Tomo 1	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-81-3	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3165 paginas	Primera	Lima	2005	\N	t	\N
1000128	\N	Teatro, poesía festiva y poesía lírica. Leonidas Yerovi. Obra completa / Tomo 3	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-98-8	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3164 paginas	Primera	Lima	2006	\N	t	\N
1000129	\N	Teatro, poesía festiva y poesía lírica. Leonidas Yerovi. Obra completa / Tomo 3	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-98-8	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3163 paginas	Primera	Lima	2006	\N	t	\N
1000130	\N	Teatro, poesía festiva y poesía lírica. Leonidas Yerovi. Obra completa / Tomo 3	Marcel Velázquez Castro / Juana Yerovi Douat	\N	\N	\N	9972-890-98-8	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	3162 paginas	Primera	Lima	2006	\N	t	\N
1000131	\N	Huella republicana liberal en el Perú	Manuel Pardo	\N	\N	\N	9972-890-44-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3161 paginas	Primera	Lima	2004	\N	t	\N
1000132	\N	Memoria y destino del Perú: Textos escenciales	Ernesto Yepes del Castillo	\N	\N	\N	9972-890-31-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	3160 paginas	Primera	Lima	2010	\N	t	\N
1000133	\N	Oceano Uno - Diccionario Ilustrado	José Llius Monreal	\N	\N	\N	84-7764-217-6	Ediciones Océano	COMUNICACIÓN	Español	DICCIONARIO	3159 paginas	Primera	Barcelona	1991	\N	t	\N
1000134	\N	Comentarios reales de los Incas	Inca Garcilazo de la Vega	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3158 paginas	\N	Arequipa	2009	\N	t	\N
1000135	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3157 paginas	\N	Arequipa	2010	\N	t	\N
1000136	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3156 paginas	\N	Arequipa	2010	\N	t	\N
1000137	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3155 paginas	\N	Arequipa	2010	\N	t	\N
1000138	\N	Antología poética	Guillermo Mercado	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3154 paginas	\N	Arequipa	2010	\N	t	\N
1000139	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3153 paginas	\N	Arequipa	2010	\N	t	\N
1000140	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3152 paginas	\N	Arequipa	2010	\N	t	\N
1000141	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3151 paginas	\N	Arequipa	2010	\N	t	\N
1000142	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3150 paginas	\N	Arequipa	2010	\N	t	\N
1000143	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3149 paginas	\N	Arequipa	2010	\N	t	\N
1000144	\N	Escuela profesional de historia	Universidad Nacional de San Agustín	\N	\N	\N	2220-3826	\N	HISTORIA	\N	\N	3148 paginas	\N	\N	2010	\N	t	\N
1000292	\N	Gran cocina - ensaladas verduras y hortalisas	El Comercio	\N	\N	\N	9972-617-785	el comercio S.A.	GASTRONOMÍA	\N	\N	3000 paginas	\N	\N	2002	\N	t	\N
1000145	\N	Niños invisibles / Niñez con dicapacidad en el Perú	Liliana Peñaherrera/Guillermo Vega Espejo	\N	\N	\N	978-9972-221-48-4	Fondo editorial del Congreso del Perú	FILOSOFIA Y PSICOLOGIA	Español	LIBRO	3147 paginas	Primera	Lima	2008	Prevalencia y análisis estadístico. Marco legal. Políticas públicas y niñez con discapacidad. ¿Logros o derechos trasgredidos? Conclusiones y recomendaciones. Proyecto de Ley que regula los juegos de loterías.	t	\N
1000146	\N	Capitán Centella derrotado por el rey Toxicom	Jorge Eslava	\N	\N	\N	978-603-4016-49-1	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3146 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000147	\N	Fonchito y la Luna	Mario Vargas Llosa	\N	\N	\N	978-612-4039-50-8	Alfaguara/Infantil	LITERATURA	\N	\N	3145 paginas	Segunda reimpresión	\N	2011	\N	t	\N
1000148	\N	Capitán Centella enfrenta a la profesora Hierbamala	Jorge Eslava	\N	\N	\N	978-9972-232-12-1	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3144 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000149	\N	Capitán Centella en la persecución del doctor deforme	Jorge Eslava	\N	\N	\N	978-603-4016-24-8	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3143 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000150	\N	Capitán centella en la batalla contra el comandante Smog	Jorge Eslava	\N	\N	\N	978-9972-847-71-4	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3142 paginas	Tercera reimpresión	Lima	2010	\N	t	\N
1000151	\N	Blackie, el gato negro	Eva Lewitus	\N	\N	\N	978-9972-847-19-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3141 paginas	Quinta reimpresión	Lima	2011	\N	t	\N
1000152	\N	Mena y Anisilla	Hernán Garrido-Lecca	\N	\N	\N	978-612-4039-94-2	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3140 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000153	\N	En el techo de un Olmo	Jorge Eslava	\N	\N	\N	978-612-4107-01-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3139 paginas	Primera ed.	Lima	2011	\N	t	\N
1000154	\N	6 amigos van al Colca	Beatriz Canny De Bustamante	\N	\N	\N	978-9972-847-74-5	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3138 paginas	Sexta reimpresión	Lima	2011	\N	t	\N
1000155	\N	6 amigos van al Colca	Beatriz Canny De Bustamante	\N	\N	\N	978-9972-847-74-5	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3137 paginas	Sexta reimpresión	Lima	2011	\N	t	\N
1000156	\N	Blackie, el gato negro	Eva Lewitus	\N	\N	\N	978-9972-847-19-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3136 paginas	Quinta reimpresión	Lima	2011	\N	t	\N
1000157	\N	Guilherme. El Koala que llegó al Perú	Eduardo Chirinos	\N	\N	\N	978-603-4016-57-6	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3135 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000158	\N	Magos del silencio	Hernán Garrido-Lecca	\N	\N	\N	978-603-4016-07-1	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3134 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000159	\N	Cuidado con lo que deseas	Manuel L. Alonso	\N	\N	\N	978-9972-232-40-4	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3133 paginas	Segunda reimpresión	Lima	2011	\N	t	\N
1000160	\N	Trance de Ramces	Ricardo García Villoslada	\N	\N	\N	84-7490-032-8	\N	LITERATURA	\N	\N	3132 paginas	\N	\N	1980	\N	t	\N
1000161	\N	Enseñar y aprender a escribir	Orlando Mazeyra Guillén	\N	\N	\N	978-612-46511-3-7	Univercidad la salle	FORMACIÓN HUM	Español	LIBRO	3131 paginas	Primera	Arequipa	2014	\N	t	\N
1000162	Cristianismo	Juicio en Nisapur	Abdelwahhab Al-Bayati	\N	\N	\N	84-7490-052-2	Ediciones Encuentro S.A.	LITERATURA	Español	LIBRO	75 paginas	Primera	Madrid	1981	\N	t	\N
1000163	\N	Poemas	César Calvo	\N	\N	\N	978-612-4097-40-9	Fondo Editorial UAP/caretas	LITERATURA	Español	LIBRO	3129 paginas	Primera	Lima	2012	\N	t	\N
1000164	Cristianismo	Cuentos de Navidad	Varios	\N	\N	\N	2014-19239 (Depósito Biblioteca Nacional del Perú)	Hermanos Grimm, Charles Dckens, Hans Christian Andersen, Fiódor Dostoyevski, Guy de Maupassant, Antón Chéjov, Oscar Wilde, William Sydney Porter, Juan Ramòn Jiménez, Amado Nervo, Ventura garcìa Calderón, Sidonie Colette, Ciro Alegría, Truman Capote, Paul Auster, Gabriel Márquez, Ray Bradbury, Santiago Roncagliolo, Elard Serruto Dancuart	Literatura/Cuentos	Español	LIBRO	131 paginas	Primera	Arequipa	2014	\N	t	\N
1000165	\N	Pajaritos en la cabeza	Jorge Eslava	\N	\N	\N	978-9972-9985-5-3	Grupo Santillana/Altea	LITERATURA	\N	\N	3127 paginas	Segunda reimpresión	\N	2011	\N	t	\N
1000166	\N	Como te vaca	Juan Luis Dammert	\N	\N	\N	978-9972-9985-8-4	Grupo Santillana/Altea	LITERATURA	\N	\N	3126 paginas	Primera reimpresión	\N	2012	\N	t	\N
1000167	\N	Pequeño vampiro	Angela Sommer-Bodenburg	\N	\N	\N	978-9972-847-82-0	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3125 paginas	Cuarta reimpresion	Lima	2011	\N	t	\N
1000168	\N	De carta en carta	Ana María Machado	\N	\N	\N	978-9972-232-07-7	Alfaguara/Infantil	LITERATURA	Español	\N	3124 paginas	Quinta reimpresión	Lima	2011	\N	t	\N
1000169	\N	Guillermo y el miedo	Christine Nostlinger	\N	\N	\N	978-9972-232-21-3	Alfaguara/Infantil	LITERATURA	\N	\N	3123 paginas	Quinta reimpresión	\N	2010	\N	t	\N
1000170	\N	Pizarrón encantado	Emilio Carballido	\N	\N	\N	978-9972-232-36-7	Alfaguara/Infantil	LITERATURA	\N	\N	3122 paginas	Tercera reimpresión	\N	2011	\N	t	\N
1000171	\N	El Socio	Jhon Grisham	\N	\N	\N	978-84-8346-878-4	\N	LITERATURA	\N	\N	3121 paginas	Tercera	\N	2009	\N	t	\N
1000172	\N	Maravillosa creación de Dios	Paúl Orlob	\N	\N	\N	\N	\N	LITERATURA	\N	\N	3120 paginas	\N	\N	\N	La Palabra de Dios: Interpelación y reto para la Iglesia. La Palabra de Dios: Llamada apremiante de la Iglesia. La Palabra de Dios: Reto comprometedor para la iglesia. Historia de la lectio divina. Historia explicativa de la expresión lectio divina. Los santos Padres. El Monacato. Sistematización de la lectio divina. Guigo, el cartujano. Exilio de la Palabra de Dios en la Iglesia. Retorno a la Palabra. Epifania gloriosa de la Palabra de Dios. Congregaciones religiosas. «Movimientos y caminos» dentro de la Iglesia. Conclusión. La Constitución conciliar Dei Verbum, «La nueva entrega de la Bliblia a la Iglesia». La Constitución Dei Verbum.Carta magna de la Sagrada Escritura en la Iglesia. Historia del texto. La escritura se entiende dentro de la revelación de Dios. La Sagrada Escritura es un hablar de Dios, actual y presente. Valoración global. La Sagrada Escritura en la vida de la Iglesia. Lectura del texto. Veneración de la Iglesia por la Escritura (n. 21). Dos panes en la mesa de la iglesia (n. 21). La escritura, diálogo con Dios. Eficacia  de la Escritura. La Escritura es un libro abierto para todos.La lectio divina (n. 25). Balance y perspectivas. Conclución. Lectura de la Biblia en Cristo. Cristo ilumina la Biblia o El Libro de la Vida.	t	\N
1000208	\N	Casa de cartón	Rafael de la Fuente Benavides	\N	\N	\N	2013-04953(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3084 paginas	\N	Perú	2013	\N	t	\N
1000209	\N	Ña Catita	Manuel Ascencio Segura	\N	\N	\N	2013-05364(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3083 paginas	\N	Perú	2013	\N	t	\N
1000210	\N	Lazarillo de Tormes	Anónimo	\N	\N	\N	2013-01399(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3082 paginas	\N	Perú	2013	\N	t	\N
1000211	\N	Orígen de la vida	Alexander Oparin	\N	\N	\N	2013-06938(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3081 paginas	\N	Perú	2013	\N	t	\N
1000212	\N	Diario de Ana Frank	Ana Frank	\N	\N	\N	2013-05366(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3080 paginas	\N	Perú	2013	\N	t	\N
1001410	\N	Ser Mujer T4	\N	\N	\N	\N	\N	\N	ENCICLOPEDIA	Español	LIBRO	1882 paginas	\N	\N	\N	\N	t	\N
1000173	FOMACION HUMANA	Maravillosa creación de Dios	Paúl Orlob	\N	\N	\N	\N	\N	LITERATURA	\N	\N	3119 paginas	\N	\N	\N	La Palabra de Dios: Interpelación y reto para la Iglesia. La Palabra de Dios: Llamada apremiante de la Iglesia. La Palabra de Dios: Reto comprometedor para la iglesia. Historia de la lectio divina. Historia explicativa de la expresión lectio divina. Los santos Padres. El Monacato. Sistematización de la lectio divina. Guigo, el cartujano. Exilio de la Palabra de Dios en la Iglesia. Retorno a la Palabra. Epifania gloriosa de la Palabra de Dios. Congregaciones religiosas. «Movimientos y caminos» dentro de la Iglesia. Conclusión. La Constitución conciliar Dei Verbum, «La nueva entrega de la Bliblia a la Iglesia». La Constitución Dei Verbum.Carta magna de la Sagrada Escritura en la Iglesia. Historia del texto. La escritura se entiende dentro de la revelación de Dios. La Sagrada Escritura es un hablar de Dios, actual y presente. Valoración global. La Sagrada Escritura en la vida de la Iglesia. Lectura del texto. Veneración de la Iglesia por la Escritura (n. 21). Dos panes en la mesa de la iglesia (n. 21). La escritura, diálogo con Dios. Eficacia  de la Escritura. La Escritura es un libro abierto para todos.La lectio divina (n. 25). Balance y perspectivas. Conclución. Lectura de la Biblia en Cristo. Cristo ilumina la Biblia o El Libro de la Vida.	t	\N
1000174	\N	Viajes de Gulliver	Jonathan Swift	\N	\N	\N	2005-5764(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3118 paginas	Primera	Perú	2005	\N	t	\N
1000175	\N	Don Juan Tenorio	José Zorrilla	\N	\N	\N	2011-03716(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3117 paginas	Segunda	Perú	2011	\N	t	\N
1000176	\N	Oliver Twist	Charles Dickens	\N	\N	\N	2011-04413(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3116 paginas	Segunda	Perú	2001	\N	t	\N
1000177	\N	El príncipe y el mendigo	Mark Twain	\N	\N	\N	2011-12557(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3115 paginas	Segunda	Perú	2011	\N	t	\N
1000178	\N	Bertoldo, Bertoldino y Cacaseno	Julio César Croce	\N	\N	\N	2008-11349(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3114 paginas	\N	Perú	2008	\N	t	\N
1000179	\N	Narraciones extrordinarias	Edgar Allan Poe	\N	\N	\N	1501352002-3001(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3113 paginas	\N	Perú	\N	\N	t	\N
1000180	\N	Viaje al centro de la Tierra	Julio Verne	\N	\N	\N	2007-05366(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3112 paginas	\N	Perú	2007	\N	t	\N
1000181	\N	Capitán de quince años	Julio Verne	\N	\N	\N	\N	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3111 paginas	\N	Perú	2008	\N	t	\N
1000182	\N	Enfermo imaginario	Moliére	\N	\N	\N	2012-06092(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3110 paginas	Primera	Perú	2012	\N	t	\N
1000183	\N	Minas del rey Salomón	Rider Haggard	\N	\N	\N	2009-08530(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3109 paginas	\N	Perú	2009	\N	t	\N
1000184	\N	Amante de Lady Chatterley	David Herbert Lawrence	\N	\N	\N	2009-09091(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3108 paginas	\N	Perú	2009	\N	t	\N
1000185	\N	De la Tierra a la Luna	Julio Verne	\N	\N	\N	2006-4390(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3107 paginas	\N	Perú	2006	\N	t	\N
1000186	\N	Isla misteriosa	Julio Verne	\N	\N	\N	2011-07606(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3106 paginas	Primera	Perú	2011	\N	t	\N
1000187	\N	Colmillo Blanco	Jack London	\N	\N	\N	2007-04520(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3105 paginas	\N	Perú	2007	\N	t	\N
1000188	\N	Mago De Oz	Lyman Frank Baum	\N	\N	\N	2012-07553(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3104 paginas	Primera	Perú	2012	\N	t	\N
1000189	\N	Fausto	Wolfgang Von Goethe	\N	\N	\N	2010-07403(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3103 paginas	\N	Perú	2010	\N	t	\N
1000190	\N	Retrato de Dorian Gray	Óscar Wilde	\N	\N	\N	2011-06768(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3102 paginas	Segunda Edicion	Perú	2011	\N	t	\N
1000191	\N	El Profeta	Gibrán Jalil Gibrán	\N	\N	\N	2005-6742(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3101 paginas	\N	Perú	2006	\N	t	\N
1000192	\N	Tres Mosqueteros	Alejandro Dumas	\N	\N	\N	2005-6741(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3100 paginas	\N	Perú	2006	\N	t	\N
1000193	\N	Divina Comedia	Dante Alighieri	\N	\N	\N	2013-04950(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3099 paginas	\N	Perú	2013	\N	t	\N
1000194	\N	María	Jorge Isaacs	\N	\N	\N	2013-04952(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3098 paginas	\N	Perú	2013	\N	t	\N
1000195	\N	Fantasma de la Ópera	Gastón Leroux	\N	\N	\N	2010-11467(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3097 paginas	Primera	Perú	2010	\N	t	\N
1000196	\N	Aventuras de Sherlock Holmes	Arthur Conan Doyle	\N	\N	\N	2010-08597(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3096 paginas	Primera	Perú	2010	\N	t	\N
1000197	\N	Fantasma de Canterville\r\ny Otros Cuentos	Óscar Wilde	\N	\N	\N	2010-04549(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3095 paginas	\N	Perú	2010	\N	t	\N
1000198	\N	El sí de las Niñas	Leandro Fernández De Moratín	\N	\N	\N	2013-05489(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3094 paginas	\N	Perú	2013	\N	t	\N
1000199	\N	Tom Sawyer	Mark Twain	\N	\N	\N	2011-03717(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3093 paginas	Segunda	Perú	2011	\N	t	\N
1000200	\N	Vuelta al mundo en 80 días	Julio Verne	\N	\N	\N	2007-11824(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3092 paginas	\N	Perú	2007	\N	t	\N
1000201	\N	Robinson Crusoe	Daniel Defoe	\N	\N	\N	2012-01680(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3091 paginas	Segunda	Perú	2012	\N	t	\N
1000202	\N	Los miserables	Víctor Hugo	\N	\N	\N	2013-02906(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3090 paginas	\N	Perú	2013	\N	t	\N
1000203	\N	Fuenteovejuna	Lope De Vega	\N	\N	\N	2013-03156(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3089 paginas	\N	Perú	2013	\N	t	\N
1000204	\N	Extraño caso \r\n del Dr. Jekyll y Mr. Hyde	Robert Louis Balfour Stevenson	\N	\N	\N	2007-05421(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3088 paginas	\N	Perú	2007	\N	t	\N
1000205	\N	Anticristo	Friedrich Nietzsche	\N	\N	\N	2013-07391(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3087 paginas	Segunda	Perú	2013	\N	t	\N
1000206	\N	Crimen y Castigo	Fiódor Dostoyevski	\N	\N	\N	\N	\N	LITERATURA	\N	\N	3086 paginas	\N	\N	2013	\N	t	\N
1000207	\N	Hamlet	William Shakespeare	\N	\N	\N	2013-06700(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3085 paginas	Segunda	Perú	2013	\N	t	\N
1000290	\N	Estofados, guisos secos y otros potajes de olla	Gaston Acurio Jaramillo	\N	\N	\N	\N	orbis Ventures SAC	GASTRONOMÍA	\N	\N	3002 paginas	\N	\N	2005	\N	t	\N
1000213	\N	Interpretación de los sueños	Sigmund Freud	\N	\N	\N	2013-12967(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3079 paginas	Primera	Perú	2013	\N	t	\N
1000214	\N	Cabaña del tío Tom	Harriet Beecher Stowe	\N	\N	\N	2013-03148(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3078 paginas	\N	Perú	2013	\N	t	\N
1000215	\N	Cantar del Mío Cid	Anónimo	\N	\N	\N	2013-01482(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3077 paginas	Primera	Lima	2013	\N	t	\N
1000216	\N	Tungsteno. Fabla Salvaje. Paco Yunque	César Vallejo	\N	\N	\N	2013-02547(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3076 paginas	Primera	Lima	2013	\N	t	\N
1000217	\N	Corazón	Edmundo de Amicis	\N	\N	\N	2013-02447(Biblioteca Nacional)	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3075 paginas	Primera	Lima	2013	\N	t	\N
1000218	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3074 paginas	\N	Arequipa	2010	\N	t	\N
1000219	\N	Robin Hood	Walter Scott	\N	\N	\N	2007-05640(Biblioteca Nacional)	Fondo Editorial Cultura Peruana	LITERATURA	Español	LIBRO	3073 paginas	Primera	Lima	2007	\N	t	\N
1000220	\N	Vida es sueño	Calderón de la Barca	\N	\N	\N	2013-02905	Biblioteca Latinoamericana	LITERATURA	Español	LIBRO	3072 paginas	Primera	Lima	2013	\N	t	\N
1000221	\N	Fuerza de Sheccid	Carlos Cuauhtémoc Sánchez	\N	\N	\N	968-7277-14-1	Ediciones Selectas Diamante, S.A. de C.V.	LITERATURA	Español	LIBRO	3071 paginas	Primera	México	1997	\N	t	\N
1000222	\N	Volar sobre el pantano	Carlos Cuauhtémoc Sánchez	\N	\N	\N	968-7277-13-4	Ediciones Selectas Diamante, S.A. de C.V.	LITERATURA	Español	LIBRO	3070 paginas	Primera	México	1997	La soledad. Ley de advertencia. Corrupción Gradual. Asociados. Zonas de atención. Alcoholismo y Cerrazón. Liberarse interiormente. Violación. Diferencia sexuales. Venganza. Causa y efecto. Careo amoroso. Adopción. El rascacielos. ¿Por qué me excluyeron? Abuso a menores. Volar sobre el platano.	t	\N
1000223	\N	Contraveneno	Carlos Cuauhtémoc Sánchez	\N	\N	\N	968-7277-36-X	Ediciones Selectas Diamante, S.A. de C.V.	LITERATURA	Español	LIBRO	3069 paginas	Primera	México	\N	\N	t	\N
1000224	\N	Grito desesperado	Carlos Cuauhtémoc Sánchez	\N	\N	\N	968-7277-10-3	Ediciones Selectas Diamante, S.A. de C.V.	LITERATURA	Español	LIBRO	3068 paginas	Primera	México	1998	\N	t	\N
1000225	\N	Planta de naranja-lima	José Mauro de Vanconcelos	\N	\N	\N	84-7021-059-9	Editorial "El Ateneo"	LITERATURA	Español	LIBRO	3067 paginas	Séptima edicion	Barcelona	1988	\N	t	\N
1000226	\N	Selección de pensamientos y máximas	Nita Ferreyros de Gamio	\N	\N	\N	\N	\N	LITERATURA	Español	LIBRO	3066 paginas	\N	\N	\N	\N	t	\N
1000227	\N	Edipo Rey. Eletra	Sófocles-Eurípides	\N	\N	\N	\N	Editorial "La Confianza"	LITERATURA	\N	\N	3065 paginas	\N	\N	1994	\N	t	\N
1000228	\N	Juego del Digger	George V.Higgins	\N	\N	\N	84-253-0473-3	Ediciones Grijalbo S.A.	LITERATURA	Español	LIBRO	3064 paginas	Primera	España	1973	\N	t	\N
1000229	\N	Arena sucia	Mario Puzo	\N	\N	\N	84-253-0372-9	Ediciones Grijalbo,s.a	LITERATURA	\N	\N	3063 paginas	Tercera	\N	1975	\N	t	\N
1000230	\N	Antología de la Poesía Actual	Festival de La Literatura Española Contemporánea	\N	\N	\N	\N	Ediciones Tawantinsuyu	LITERATURA	Español	LIBRO	3062 paginas	Primera	Lima	1960	\N	t	\N
1000231	\N	Antología de Ensayistas	Festival de la Literatura Española Contemporánea	\N	\N	\N	\N	Ediciones Tawantinsuyu	LITERATURA	Español	LIBRO	3061 paginas	Primera	Lima	1960	\N	t	\N
1000232	\N	Teatro (En la Ardiente Obscuridad Jacinta escuadra hacia la muerte)	Festival de la Literatura Española Contemporánea	\N	\N	\N	\N	Ediciones Tawantinsuyu	LITERATURA	Español	LIBRO	3060 paginas	Primera	Lima	1960	\N	t	\N
1000233	\N	Familia de Pascual Duarte	Camilo José Cela	\N	\N	\N	\N	Ediciones Tawantinsuyu	LITERATURA	Español	LIBRO	3059 paginas	Primera	Lima	1960	\N	t	\N
1000234	\N	Poesía en Custodia	Emilio Adolfo Westphalem	\N	\N	\N	9972-890-74-0	Fondo editorial del Congreso del Perú	LITERATURA	\N	\N	3058 paginas	Impreso	\N	2005	\N	t	\N
1000235	\N	Jorge, el hijo del pueblo	\N	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3057 paginas	\N	Arequipa	2010	\N	t	\N
1000236	\N	Historia 9	Universidad Nacional de San Agustín . Escuela Profesional de Historia	\N	\N	\N	2220-3826	Revista de la Escuela Profesional de Historia Universidad Nacional de San Agustín.	HISTORIA	Español	REVISTA	3056 paginas	Primera Edicion	Arequipa	2010	\N	t	\N
1000237	\N	Radio ciudad perdida	Daniel Alarcón	\N	\N	\N	978-9972-232-66-4	Alfaguara	LITERATURA	\N	\N	3055 paginas	Primera reimpresión	\N	2012	\N	t	\N
1000238	\N	Dimensión de la piedra	Julio Garrido Malaver	\N	\N	\N	978-612-4075-04-9	Fondo editorial del Congreso del Perú	LITERATURA	\N	\N	3054 paginas	Primera	\N	2010	\N	t	\N
1000239	\N	Manuel Pardo y el partido civil. Apogeo y crisis del primer partido político del Perú	Valentín Paniagua	\N	\N	\N	978-9972-221-89-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	3053 paginas	Primera	Lima	2009	\N	t	\N
1000240	\N	Vida política en la Arequipa republicana (1890- 2009)	Héctor Ballón Lozada- Jorge Luis Cáceres Arce	\N	\N	\N	\N	LPG _Editors	LITERATURA	\N	\N	3052 paginas	Se terminó de imprimir	\N	2009	\N	t	\N
1000241	\N	Vallejo en los infiernos	Eduardo Gonzales Viána	\N	\N	\N	978-9972-221-83-5	Fondo editorial del Congreso del Perú	LITERATURA	\N	\N	3051 paginas	Primera reimpresión	\N	2009	\N	t	\N
1000242	\N	Antología. Los mejores relatos de terror llevados al cine	Robert L.Stevenson. - Edgar Allan Poe. -Alexéi Tolstoi. -Daphne Du Maurier . -Ray Bradbury.-Geroge Langelaan.	\N	\N	\N	978-9972-847-90-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3050 paginas	Segunda reimpresión	Lima	2010	\N	t	\N
1000243	\N	Antología. Los mejores relatos de terror llevados al cine	Robert L.Stevenson. - Edgar Allan Poe. -Alexéi Tolstoi. -Daphne Du Maurier . -Ray Bradbury.-Geroge Langelaan.	\N	\N	\N	978-9972-847-90-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	3049 paginas	Segunda reimpresión	Lima	2010	\N	t	\N
1000244	\N	Huella republicano liberal en el Perú. Manuel Pardo. Escritos fundamentales	Carmen Mc Evoy	\N	\N	\N	9972-890-44-9	Fondo editorial del Congreso del Perú	LITERATURA	\N	\N	3048 paginas	Impreso	\N	2004	\N	t	\N
1000245	Cristianismo	En trance de Renacer. Selección de poemas.	Ricardo García Villoslada	\N	\N	\N	84-7490-032-8	Ediciones Encuentro	LITERATURA	Español	LIBRO	135 paginas	Primera	Madrid	1980	\N	t	\N
1000246	\N	Capitán Centella en la batalla contra el comandante Smog	Jorge Eslava	\N	\N	\N	978-9972-847-71-4	Alfaguara/Infantil	LITERATURA	Español	LIBRO	3046 paginas	Tercera reimpresión	Lima	2010	\N	t	\N
1000247	\N	A History of our Country	David Saville Muzzley	\N	\N	\N	\N	The Athenaum Press	HISTORIA	Inglés	LIBRO	3045 paginas	Primera	Boston	1946	\N	t	\N
1000248	\N	Francis Drake: El azote de Dios	Óscar E. Espinar De La Torre	\N	\N	\N	978-612-4039-70-6	Alfaguara/Cuentos Cosas	LITERATURA	\N	\N	3044 paginas	Primera	\N	2010	\N	t	\N
1000249	\N	Ojitos de Ángel	Ramón Fonseca Mora	\N	\N	\N	978-612-4039-06-5	Alfaguara/Serie Roja	LITERATURA	\N	\N	3043 paginas	Primera reimpresión	\N	2010	\N	t	\N
1000250	\N	Días de carbón	Rosa Cerna Guardia	\N	\N	\N	978-9972-847-41-7	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	3042 paginas	Séptima reimpresión	Lima	2011	\N	t	\N
1000291	\N	Gran cocina - ensaladas verduras y hortalisas	El Comercio	\N	\N	\N	9972-617-785	el comercio S.A.	GASTRONOMÍA	\N	\N	3001 paginas	\N	\N	2002	\N	t	\N
1000251	Formación Humana	Vidrieras	Paolo Prada - Wanda Ricciuti	\N	\N	\N	84-315-2267-4	De Vecchi,S.A	ARTE	Español	COLECCIÓN	3041 paginas	Primera	Barcelona	1999	VIDRIOS, MATERIALES Y TÉCNICAS DE REALIZACIÓN. Tipos de Vidrios. Materiales y utensilios. CÓMO EFECTUAR EL CORTE DEL VIDRIO. TÉCNICAS DE REALIZACIÓN. Decoración con resina (contornos en relieve) La ejecución. Cómo utilizar la cinta del cobre. Colocación plana. Bordes con la cinta de cobre: técnicas "Tiffany" Montaje y soldadura. Cómo utilizar la cinta de plomo. Técnicas mixta y otros métodos. Colores para el Vidrio. Segunda parte. REALIZACIÓN DE LAS VIDRIERAS. Decoraciones con resina. Gallinas y pollitos. Un gran sol. Diosa otoñal modernista. Rosa estilizada. Árbol de vidrio. Técnica mixta. Flor estilizada. Paisaje. Vidriera-collage marina. Vidriera-collage. Espejo-collage contorneado. Vidriera decorada con conchas. Marco en vidrio. Decoración con plástico o vinilos adhesivos. Vidriera con cisnes. Aplicación plana de la cinta de cobre. Árbol. Técnica "Tiffany" con cinta de cobre. Árbol con estrella. Mariposa. Técnica "Tiffany" con guía de plomo. Fantasía. Cómo hacer los patrones de cartulina. Las causas de eventuales errores. Apéndice. Dibujos para copiar.	t	\N
1000252	\N	Huella republicana liberal en el Perú	Manuel Pardo	\N	\N	\N	9972-890-44-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3040 paginas	Primera	Lima	2004	\N	t	\N
1000253	\N	Huella republicana liberal en el Perú	Manuel Pardo	\N	\N	\N	9972-890-44-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	3039 paginas	Primera	Lima	2004	\N	t	\N
1000254	\N	Loar la poesia bilingue	Elizabeth Altamirano	\N	\N	\N	\N	Universidad Católica de Santa María	LITERATURA	\N	\N	3038 paginas	Primera	\N	2013	\N	t	\N
1000255	\N	Bolita	M. B. Brozon	\N	\N	\N	978-603-4016-40-8	Alfaguara/Infantil	LITERATURA	\N	\N	3037 paginas	Segunda reimpresión	\N	2010	\N	t	\N
1000256	\N	Pregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	\N	\N	3036 paginas	\N	\N	2010	\N	t	\N
1000257	\N	Capitán Fush	Rosa María Bedoya	\N	\N	\N	978-9972-847-21-9	Alfaguara/Cuentos Cosas	LITERATURA	\N	\N	3035 paginas	Novena reimpresión	\N	2011	\N	t	\N
1000258	\N	Amores que matan. Historias de amor y de terror	Lucía Laragione	\N	\N	\N	978-9972-232-35-0	Alfaguara/ Juvenil	LITERATURA	\N	\N	3034 paginas	Tercera reimpresion	\N	2012	\N	t	\N
1000259	\N	Cuentos inolvidables	Julio Cortázar	\N	\N	\N	978-612-4039-21-8	Alfaguara	LITERATURA	\N	\N	3033 paginas	Primera reimpresión	\N	2011	\N	t	\N
1000260	\N	Guerra a la luz de las velas	Daniel Alarcón	\N	\N	\N	978-9972-232-13-8	Alfaguara	LITERATURA	\N	\N	3032 paginas	Tercera reimpresion	\N	2012	\N	t	\N
1000261	\N	Racismo y mestizaje y otros ensayos.	Gonzalo Portocarrero	\N	\N	\N	978-9972-221-36-1	Fondo editorial del Congreso del Perú	LITERATURA	\N	\N	3031 paginas	Primera reimpresion	\N	2009	\N	t	\N
1000262	\N	Adios al barrio	José Antonio Galloso	\N	\N	\N	978-612-4039-08-9	Alfaguara/Serie Roja	LITERATURA	\N	\N	3030 paginas	Primera reimpresión	\N	2010	\N	t	\N
1000263	\N	Templado	Jorge Eslava	\N	\N	\N	978-9972-847-42-4	Alfaguara/Serie Roja	LITERATURA	\N	\N	3029 paginas	Sexta reimpresión	\N	2010	\N	t	\N
1000264	\N	Matilda	Roald Dahl	\N	\N	\N	978-9972-232-14-5	Alfaguara/Juvenil	LITERATURA	\N	\N	3028 paginas	Cuarta reimpresion	\N	2011	\N	t	\N
1000265	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3027 paginas	\N	Arequipa	2010	\N	t	\N
1000266	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3026 paginas	\N	Arequipa	2010	\N	t	\N
1000267	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3025 paginas	\N	Arequipa	2010	\N	t	\N
1000268	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3024 paginas	\N	Arequipa	2010	\N	t	\N
1000269	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3023 paginas	\N	Arequipa	2010	\N	t	\N
1000270	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3022 paginas	\N	Arequipa	2010	\N	t	\N
1000271	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3021 paginas	\N	Arequipa	2010	\N	t	\N
1000272	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3020 paginas	\N	Arequipa	2010	\N	t	\N
1000273	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3019 paginas	\N	Arequipa	2010	\N	t	\N
1000274	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3018 paginas	\N	Arequipa	2010	\N	t	\N
1000275	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3017 paginas	\N	Arequipa	2010	\N	t	\N
1000276	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3016 paginas	\N	Arequipa	2010	\N	t	\N
1000277	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3015 paginas	\N	Arequipa	2010	\N	t	\N
1000278	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3014 paginas	\N	Arequipa	2010	\N	t	\N
1000279	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3013 paginas	\N	Arequipa	2010	\N	t	\N
1000280	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3012 paginas	\N	Arequipa	2010	\N	t	\N
1000281	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3011 paginas	\N	Arequipa	2010	\N	t	\N
1000282	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3010 paginas	\N	Arequipa	2010	\N	t	\N
1000283	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3009 paginas	\N	Arequipa	2010	\N	t	\N
1000284	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	3008 paginas	\N	Arequipa	2010	\N	t	\N
1000285	\N	Filosofía-una guía gráfica de la \r\n Historia del pensamiento	Dave Robinson- Judy Groves	\N	\N	\N	\N	\N	LITERATURA	\N	\N	3007 paginas	\N	\N	\N	\N	t	\N
1000286	Gastronomia	Armonía de sabores	Soledad Marroqin Muñoz & Jann Van Oordt	\N	\N	\N	978-612-45824-1-7	Apus grand ediciones	GASTRONOMÍA	Español	Recetas	157 paginas	Primera Edicion	Lima	2010	Presentación. Prólogo. Introducción. Vivir para dar placer. Capítulo I: Algunos conceptos sobre el vino y el maridaje. Capítulo II: Para entender el vino. Capítulo III: Maridaje: Nos habíamos amado tanto. Entradas. Platos de fondo. Postres. Bases para una mejor cocina. Fisiología del gusto. Epílogo. Agradecimientos.	t	\N
1000287	\N	Colección cocina fácil/pescados y mariscos	George Bernard Shaw	\N	\N	\N	\N	Correo	GASTRONOMÍA	\N	\N	3005 paginas	\N	\N	2003	\N	t	\N
1000288	\N	Cocina según Sato (pescados y mariscos)	Mariela Balbi	\N	\N	\N	\N	quebecor world Peru S.A.	GASTRONOMÍA	\N	\N	3004 paginas	\N	\N	\N	\N	t	\N
1000289	\N	Ceviches del Perú	Varios	\N	\N	\N	\N	gráfica biblos	GASTRONOMÍA	\N	\N	3003 paginas	\N	\N	2008	\N	t	\N
1000293	\N	Más noble causa - salsitas, ensaladas y entremeses	Gaston Acurio Jaramillo	\N	\N	\N	9972-20549-5	orbis Ventures SAC	GASTRONOMÍA	\N	\N	2999 paginas	\N	\N	2005	\N	t	\N
1000294	\N	Ahuacate- Historia realidad y sueños de la palta	Walter H. Wust	\N	\N	\N	978-612-4017-3-8	walter H. Wust ediciones SAC.	GASTRONOMÍA	ESPAÑOL/INGLÉS	\N	164 paginas	\N	\N	2016	Ahuacatl. La historia de la palta en el contexto mundial ahuancatl. The history of teh avocada in global in a blobal context. Persea americana en la botánica persa americana in botanic . Hass, a la conquista del mundo  the hass avocado is  conquering the world .  la plata y los súperalimentos avocado and the superfoods . cerro prieto. un  desierto verde cerro prieto . a green desert. la plata  y nuestro sabor. chefs peruanos para el mundo avocado and the peruvian flavor . Our chefs to the world.	t	\N
1000295	\N	Cocina del alto vuelo- Turismo gastronomía en el Perú	Obra Colectiva Por Comercio S.A.	\N	\N	\N	978-603-45377-0-5	el comercio S.A.	GASTRONOMÍA	ESPAÑOL/INGLÉS	-	205 paginas	Primera edición	\N	2008	\N	t	\N
1000296	Gastronomia 	Gran cocina. Pastas y arroces	El Comercio	\N	\N	\N	9972-617-78-6	el comercio S.A.	GASTRONOMÍA	Español	Recetas	179 paginas	Primera edición	Lima	2002	\N	t	\N
1000297	\N	Gran cocina. Pastas y arroces	El Comercio	\N	\N	\N	9972-617-78-6	el comercio S.A.	GASTRONOMÍA	Español	Recetas	189 paginas	Primera edición	Lima	2002	\N	t	\N
1000298	\N	Arroces y pastas con sabor Nacional	Gaston Acurio Jaramillo	\N	\N	\N	9972-205-56-B	orbis ventures SAC	GASTRONOMÍA	\N	\N	2994 paginas	\N	\N	2005	\N	t	\N
1000299	\N	Del anticucho y de las entradas calientes	Gaston Acurio Jaramillo	\N	\N	\N	9972.205-49-5	orbis ventures SAC	GASTRONOMÍA	\N	\N	2993 paginas	\N	\N	2005	\N	t	\N
1000300	\N	Del anticucho y de las entradas calientes	Gaston Acurio Jaramillo	\N	\N	\N	9972.205-49-5	orbis ventures SAC	GASTRONOMÍA	\N	\N	2992 paginas	\N	\N	2005	\N	t	\N
1000301	\N	Ceviches , Tiraditos y el arte de los pescados	Gaston Acurio Jaramillo	\N	\N	\N	9972-205-49-5	orbis venturse SAC	GASTRONOMÍA	\N	\N	2991 paginas	\N	\N	2005	\N	t	\N
1000302	\N	Ceviches , Tiraditos y el arte de los pescados	Gaston Acurio Jaramillo	\N	\N	\N	9972-205-49-5	orbis venturse SAC	GASTRONOMÍA	\N	\N	2990 paginas	\N	\N	2005	\N	t	\N
1000303	Gastronomia 	Pisco, copteles y piqueos - Una pasión Nacional	Gaston Acurio Jaramillo	\N	\N	\N	9972-205-49-6	orbis venturse SAC	GASTRONOMÍA	Español	Resetas	180 paginas	primera edicion	Lima	2005	\N	t	\N
1000304	\N	Gran cocina -Sopas, cremas y salsas	El Comercio	\N	\N	\N	9972-617-78-5	el comercio S.A.	GASTRONOMÍA	\N	\N	2988 paginas	\N	\N	2002	\N	t	\N
1000305	\N	Gran cocina -Sopas, cremas y salsas	El Comercio	\N	\N	\N	9972-617-78-6	el comercio S.A.	GASTRONOMÍA	\N	\N	2987 paginas	\N	\N	2002	\N	t	\N
1000306	\N	Gran cocina -Sopas, cremas y salsas	El Comercio	\N	\N	\N	9972-617-78-6	el comercio S.A.	GASTRONOMÍA	\N	\N	2986 paginas	\N	\N	2002	\N	t	\N
1000307	\N	Gran cocina -Sopas, cremas y salsas 2	El Comercio	\N	\N	\N	9972-617-78-6	el comercio S.A.	GASTRONOMÍA	\N	\N	2985 paginas	\N	\N	2002	\N	t	\N
1000308	\N	Ajíes del Perú	Backus	\N	\N	\N	9972-746-01-1	walter H. Wust ediciones SAC.	GASTRONOMÍA	ESPAÑOL/INGLÉS	\N	173 paginas	\N	\N	2006	Presentación institucional backus & johnshon. Prólogo el aji augusto soberano de la picanteria raúl vargas . El ají en la cocina precolombina fernando cabieses. Se sufer pero se goza antonio cisneros . Ají  peruano para el mundo fermando cabieses . De guapos, ajies y  cervezas guillermo reaño . el ají en la culinaria peruana cucho  la rosa . aderezos y pastas de aí cucho la rosa . nuestra recetas . presentation backus & jhnston . prologue : the aji pepper august sovereign of the picanteria raúl vargas. the aji pepper in pre: columbian cooking fernando cabieses . it buerns , but you love it antonio cisneros . peruvian aji pepper for the world fernando cabieses. of machos , aji pepper, and beers guillermo reaño . the aji pepper in peruvian cuisine cucho la rosa . dressings and aji pepper pastes cucho la rosa . Our recipes.	t	\N
1000309	\N	Su majestad el Rocoto	Usil	\N	\N	\N	978-612-4119-82-8	super grafica EIRL.	GASTRONOMÍA	ESPAÑOL	\N	188 paginas	Primera edición	\N	2016	El sabor del misti. Los ajíes del Perú. Las sustancias mágicas del rocoto. Las comidas arequipeñas y el rocoto. El picor de la salud. El rocoto en competencia.	t	\N
1000310	\N	Secretos de cocina ( Licores, bebidas y piqueos )	El Comercio	\N	\N	\N	9972-617-52-1	el comercio S.A.	GASTRONOMÍA	\N	\N	2982 paginas	\N	\N	2001	\N	t	\N
1000311	\N	Piura - La cocina peruana tiene un norte	Adolfo Perret	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2981 paginas	\N	\N	\N	\N	t	\N
1000312	\N	Bitute - El sabor de Lima	Gaston Acurio Jaramillo - Javier Masias	\N	\N	\N	978-612-46775-2-6	latino publicaciones SA	GASTRONOMÍA	ESPAÑOL	\N	239 paginas	\N	\N	2015	\N	t	\N
1000313	\N	Bitute - El sabor de Lima EJ2	Gaston Acurio Jaramillo - Javier Masias	\N	\N	\N	978-612-46775-2-7	latino publicaciones SA	GASTRONOMÍA	ESPAÑOL	\N	239 paginas	\N	\N	2015	\N	t	\N
1000314	\N	Bitute - El sabor de Lima EJ3	Gaston Acurio Jaramillo - Javier Masias	\N	\N	\N	978-612-46775-2-8	latino publicaciones SA	GASTRONOMÍA	ESPAÑOL	\N	239 paginas	\N	\N	2015	\N	t	\N
1000315	\N	As Doceiras	Carla Pernambuco - Carolina Brandao	\N	\N	\N	978-85-04-011197	companhia editora nacional	GASTRONOMÍA	\N	\N	2977 paginas	\N	\N	2007	\N	t	\N
1000316	\N	Umami	Thomas Keller - Harold Mcgee	\N	\N	\N	978-4-88996-391-5	Dai-chitsushinsha	GASTRONOMÍA	INGLÉS	\N	159 paginas	\N	\N	2014	FOREWORDS ; thomas keller , harold mcgee. INTRODUCION yoshiriro muestra the science of savory : umami taste and  food preferences  john precontt , ph, D.  UMAMI COOKING OF THE WORLD , EUROPE,heston blumenthal the fat  duck Alexandre Bourdas saquana .  NORTH AMERICA Michael Anthony Gramercy  tavern  David kinch manresa. SOUTH AMERICA Virgilio Martinez central Pedro miguel schiaffino  malabar . JAPAN Nobu mastsuhisa nobu londro Yoshihiro murarta  kikunoi . DESSERTS Regis cursan Nobu lomdro Keiko nagae paris . ESSAYS ol G, mouritsen , professor Ph, D, Dsc, tradicional sources of umami in nordic cuisine. morder appoaches to umani in nordic cuisine . dashi from nordic seaweeds . umami synergy: it works . A PRACTICAL CUIDE TO DASHI AND UMAMI  masking dashi . dashi and umami : basic information and ways to learn more. kumiro ninomiya , ph, D, and yuriyo  katsuta . glossary . conversions. index. restaurant list.	t	\N
1000317	Gastronomia	Gran cocina mestiza de Arequipa	Alonso Ruiz Rosas	\N	\N	\N	978-612-45437-8-4	cuzzi y cia SA	GASTRONOMÍA	Español	Recetas	520 paginas	Primera Edecion	Arequipa	2012	\N	t	\N
1000318	\N	Recetario forro negro- copias	El Comercio	\N	\N	\N	\N	copias	GASTRONOMÍA	\N	\N	2974 paginas	\N	\N	\N	\N	t	\N
1000319	\N	Cultura gastronómica y maridaje	Esthefani Narvaez	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2973 paginas	\N	\N	\N	\N	t	\N
1000320	\N	Cocina según Sato	Mariela Balbi	\N	\N	\N	\N	copias	GASTRONOMÍA	\N	\N	2972 paginas	\N	\N	\N	\N	t	\N
1000321	\N	Servicio del vino	Mauricio Wiesenthal & Francesc Navarro	\N	\N	\N	978-612-4069-43-7	cantabria SAC.	GASTRONOMÍA	\N	\N	2971 paginas	\N	\N	2010	\N	t	\N
1000322	\N	Bodega en Casa	Erik Schulz Schomburgk	\N	\N	\N	978-612-4069-30-7	cantabria SAC.	GASTRONOMÍA	\N	\N	2970 paginas	\N	\N	2010	\N	t	\N
1000382	Formacion humana	Identidades múltiples (Memoria, modernidad y cultura popular en el valle del Mantaro)	Raúl R. Romero	\N	\N	\N	9972-890-43-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	247 paginas	Impreso	Lima	2004	Región, cultura e identidades. Perpetuando el pasado rural. Autenticidad y organizaciones musicales. Conquistando nuevos espacios. Memorias oficiales, populares y debatidas. Ejemplos musicales. Discografía. Bibliografía.	t	\N
1001411	\N	Ser Mujer T5	\N	\N	\N	\N	\N	\N	ENCICLOPEDIA	Español	LIBRO	1881 paginas	\N	\N	\N	\N	t	\N
1000323	Gastronomia	Vino y comida	Mauricio Wiesenthal & Francesc Navarro	\N	\N	\N	978-612-4069-31-4	cantabria SAC.	GASTRONOMÍA	Español	Enciclopedia	2969 paginas	Primera edicion	Lima	2010	Las sensaciones en la comida. Los colores. Los aromas. Los sabores. Las texturas. El vino en la preparación de la cocina. Una cocina apropiada para los vinos. Los acordes clásicos. Los vinos y las textura de los alimentos. Los vinos en la mesa. ¡Cuidado con el aperitivo!. Las sopas y los caldos. Ensaladas y verduras. Setas y vinos. Vinos jóvenes y embutidos. Acordes con los ahumados. Vinos y arroces. Los mariscos. Los pescados. Vinos y aves. El cordero y los grandes vinos tintos. Los vinos y las cocinas exóticas. Los peligrosos quesos. Los acordes del vino espumoso. Los inesperados juegos del jerez. Los vinos dulces y los postres. Vinos para situaciones comprometidas. A cada especie su vino. Ajedrea. Albahaca. Azafrán. Canela. Curry. Clavo. Estragón. Hinojo. Laurel. Nuez moscada. Orégano. Perejil. Pimienta. Pimentón. Romero. Tomillo. Vainilla. Los enemigos del vino.	t	\N
1000324	\N	Latin Americas 50 Best Restaurants 2014	William Drew	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2968 paginas	\N	\N	2014	\N	t	\N
1000325	\N	Latin Americas 50 Best Restaurants 2015	William Drew	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2967 paginas	\N	\N	2014	\N	t	\N
1000326	\N	Latin Americas 50 Best Restaurants 2016	William Drew	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2966 paginas	\N	\N	2014	\N	t	\N
1000327	\N	Peruanos nuevos grandes Chefs	Roxana Belaunde y Marina García Burgos	\N	\N	\N	978-612-4247-13-2	grupo editorial SA.	GASTRONOMÍA	\N	\N	2965 paginas	\N	\N	2015	\N	t	\N
1000328	\N	Bebidas, brebajes y pócimas del Perú	Edelnor	\N	\N	\N	978-612-46697-1-2	edelnor SAA	GASTRONOMÍA	\N	\N	94 páginas	\N	\N	2014	\N	t	\N
1000329	Gastronomia	Elaboración del vino	Mauricio Wiesenthal	\N	\N	\N	978-612-4069-28-4	cantabria SAC.	GASTRONOMÍA	Español	Enciclopedia	2963 paginas	Primera edicion	Lima	2010	Elaboración y crianza del vino. El laboratorio natural de la fotosintesis. Vendimia: más que una fecha, un momento. La importancia de la vendimia madura. El vino según la vendimia. Los métodos de recolección. Los secretos de la buena elaboración. La materia prima: la uva. La extracción del mosto. La preparación de los mostos. Fermentación de los mostos: la vinificación. La vinificación en tinto. La maceración carbónica. Los vinos rosados, el matiz del color. Proceso de crianza y embotellado. La crianza de los vinos. Diferentes tipos de crianza. Crianza oxidativa moderada. Crianza en madera de roble. Los envases de crianza. Maduración y reducción en botella. Crianza biológica. El sistema de soleras. Vinificaciones especiales. Vinos espumosos. El aristocrático vino generoso andaluz. Vinos de Oporto.	t	\N
1000330	\N	Postres del Perú	Edelnor	\N	\N	\N	978-612-45302-2-7	ENDESA	GASTRONOMÍA	\N	\N	95 páginas	\N	\N	2010	\N	t	\N
1000331	\N	Recetario de dulces	Anonimo - Color Marron	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2961 paginas	\N	\N	\N	\N	t	\N
1000332	gastronomia	Pasiones - Gastronomía y arte	Gonzalo Ferrand Y Marcelo Wong	\N	\N	\N	978-612-46579-0-0	editorial GFMW SAC.	GASTRONOMÍA	Español	Recetas	2960 paginas	Primera edicion	Lima	2015	Ají amarillo relleno de morcilla y piquillo. Arroz con mariscos. Arroz con pato a mi manera. Asado de tira, ginger scallion al ají. Atún en costra de sésamo. Buñuelos rellenos de arroz  con leche y fresas laqueadas  en chicha morada. Camembert crocante. Canilla de cordero al Saint-Émilion. Carne y aves. Carpaccio de salmón. Carré de cordero en costran provenzal. Causa de pulpa de cangrejo y langostino. Causa nikkei. Causa olivada. Ceviche de camarones a la piedra. Ceviche de champiñones, setas y portobello. Ceviche de confit de pato a la huaralina. Ceviche de mero al ají amarillo. Ceviches, causas y tiraditos. Champiñones al ajillo amarillo. chateaubriand de lomo con béarnaise peruana. Chuoe de camarones de Lunahuaná. Churros con sopa tibia de Nutella al Frangelico. Cilindro de oro con crocnates marengues y chirimoya alegre. Codorniz rellena de trufa y foie gras. Concha s a la meuniere pachamanquera. Contenido. Corvina Rosa Náutica deconstruida. Crème Brullée de ají amarrillo y chocolate. Dedicatoria de Gonzalo Ferrand. Dedicatoria de Marcelo Wong. Dúo tartare Juanjuí-Kioto. Envidias con cambozola y praliné de pecanas. Ensalada de langostas  y caviar  de salmón. Entre hojas de mousse blanco, dados de pitahaya y frambuesas. Esfera de chocolate rellena  de sorrento y centro líquido. Foie  gras mi-cuit al sauternes. Fotografías. Glosario culinario. Gnocchi de papa amarila y ricotta. Grand Prix de Patisserie, Trophée Passion 2006. Introducción de Ginzalo ferrand. Introducción d e Marco Wong. Langosta al grill. Langostinos  al panko y mucha pasíon. Lomo saltado a la criolla. Magret de pato al sauco y ají amarillo. Mero en salsa de ají amrillo al grand marnier. Mi pavo  tradicional  de navidad. Mousse de lúcuma con espume de vainilla y pisco torontel,gelée de fresas. Muffins de frambuesas y arándanos. Mundo Ferrand. Mundo Wong. Ossobuco cocido a baja temperatura en malbec. Pansotti de ají de gallina. Pappardelle a la huancaína. Pastas y arroces. Pastel de choclo rreleno de ossobuco. Pescados y mariscos. Piqueos  y entradas. Pollo crujiente relleno de causa. Ponderaciones con el clásico suspiro limeño. Postres. Prime rib. Prefacio de Mauricio Fernandini. Pulpo al grill en salsa anticuchera  moderna. Raviol relleno de cola de buey. Recetas básicas. Risotto a los cuatro funghi. Risotto de camarones. Risotto saltado a la criolla. Salmón alle vongole. Sopa bouillabaisse peruanizada.  Steak tartare al ají amarillo. Sushi  causa acevichada. Tabbouleh de quinua con langostino crocante. Tierno de  lechocito al horno. Tiradito bicolor. Tiradito sensei. Tortilla de patatas deconstruida. Trucha en salsa de choclo. Tuna tataki. Vol au vent de camarones JP.	t	\N
1000333	\N	Cocinas del Mundo	El Comercio	\N	\N	\N	9972-752-17-8	el comercio SA.	GASTRONOMÍA	ESPAÑOL	Recetas	197 paginas	\N	\N	2005	\N	t	\N
1000334	\N	Nikkeiesperu	Josefina Barron Y Mitsuharu Tsumura	\N	\N	\N	978-612-45819-2-2	telefonica del peru	GASTRONOMÍA	\N	\N	2958 paginas	\N	\N	2013	\N	t	\N
1000335	\N	Nikkeiesperu	Josefina Barron Y Mitsuharu Tsumura	\N	\N	\N	978-612-45819-2-3	telefonica del peru	GASTRONOMÍA	\N	\N	2957 paginas	\N	\N	2013	\N	t	\N
1000336	\N	Gata	Mauricio Wiesenthal & Francesc Navarro	\N	\N	\N	978-612-4069-29-1	cantabria SAC.	GASTRONOMÍA	\N	\N	2956 paginas	\N	\N	2010	\N	t	\N
1000337	\N	Mi Cocina	Alicia Berger	\N	\N	\N	950-28-0358-2	sudamericana SA.	GASTRONOMÍA	Español	Receta	226 paginas	Primera edicion	Buenos Aires	2004	INTRODUCIÓN , LA COCINA Y YO, recetas base términos culinarios y consejos . COCKTAIL crocante pescaditos en gardenia de tela  sambae ( fritura thail) queso feta marinado cazuelitas de berberechos al tomate y albahaca mousse de champigones  de paris y hogos negros pinchos de cerdo " satay" al ananá pequeño blinis de salmón . ENTRADAS  jalousie al roquefor y espárragos verdes foire gras a las tres uvas crocantes tortillistas de papas con salmón  y caviar rombos de hojalder rellenos al  estilo  de mar y campo huevos  en milanesa con crocantes papas y champignones pulpo a la gallega sopa fria de centolla  composición  geométrica con lasagnas  verdes terrine francesa de higados de ave . PESCADO Y MARISCO  postas de salmón a los  espárragos pejerreyes en crocante masa phila con zuchinis y salsa  de limón  trucha sabre colorido arroz y liviano puré  de puerros . AVES  chickes pie pollo  frio a la griega  con queso feta chop - suey de pollo con almendras .	t	\N
1000338	\N	Camarón	Blanca Chávez	\N	\N	\N	978-612-4221-41-5	fondo editorial / univercidad san martin de porres	GASTRONOMÍA	\N	\N	2954 paginas	\N	\N	2015	\N	t	\N
1000339	\N	Quinua Perú	Edelnor	\N	\N	\N	978-612-45302-8-9	edelnor SAA.	GASTRONOMÍA	\N	\N	94 páginas	\N	\N	2013	\N	t	\N
1000340	\N	Sabor a futuro Perú Brasil	Odebrecht	\N	\N	\N	978-612-4247-13-2	grafica biblos SA.	GASTRONOMÍA	\N	\N	2952 paginas	\N	\N	2010	\N	t	\N
1000341	\N	Curso de cocina	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2951 paginas	\N	\N	\N	\N	t	\N
1000342	\N	Curso de cocina	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2950 paginas	\N	\N	\N	\N	t	\N
1000343	\N	Cocina de la abuela	El Comercio	\N	\N	\N	9972-02-115-7	El Comercio S.A.	GASTRONOMÍA	Español	COLECCIÓN	2949 paginas	Primera	Lima	2004	\N	t	\N
1000344	\N	Mistura 2011	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2948 paginas	\N	\N	\N	\N	t	\N
1000345	\N	Sabor y color	El Comercio	\N	\N	\N	9972-02-135-1	el comercio SA.	GASTRONOMÍA	\N	\N	2947 paginas	\N	\N	2006	\N	t	\N
1000346	\N	Mistura 2010	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2946 paginas	\N	\N	\N	\N	t	\N
1000347	\N	Uva y el viñedo	Mauricio Wiesenthal & Francesc Navarro	\N	\N	\N	978-612-4069-27-7	cantabria SAC.	GASTRONOMÍA	\N	\N	2945 paginas	\N	\N	2010	\N	t	\N
1000383	Formacion humana	Identidades múltiples (Memoria, modernidad y cultura popular en el valle del Mantaro)	Raúl R. Romero	\N	\N	\N	9972-890-43-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2909 paginas	Impreso	Lima	2004	Región, cultura e identidades. Perpetuando el pasado rural. Autenticidad y organizaciones musicales. Conquistando nuevos espacios. Memorias oficiales, populares y debatidas. Ejemplos musicales. Discografía. Bibliografía.	t	\N
1000384	Formacion humana	Identidades múltiples (Memoria, modernidad y cultura popular en el valle del Mantaro)	Raúl R. Romero	\N	\N	\N	9972-890-43-0	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2908 paginas	Impreso	Lima	2004	Región, cultura e identidades. Perpetuando el pasado rural. Autenticidad y organizaciones musicales. Conquistando nuevos espacios. Memorias oficiales, populares y debatidas. Ejemplos musicales. Discografía. Bibliografía.	t	\N
1000385	\N	Profesía y patria en la historia del Perú	David A.Brading	\N	\N	\N	978-612-4075-24-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2907 paginas	Primera	Lima	2011	\N	t	\N
1000386	\N	Profesía y patria en la historia del Perú	David A.Brading	\N	\N	\N	978-612-4075-24-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2906 paginas	Primera	Lima	2011	\N	t	\N
1000387	\N	Profesía y patria en la historia del Perú	David A.Brading	\N	\N	\N	978-612-4075-24-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2905 paginas	Primera	Lima	2011	\N	t	\N
1000348	\N	Comida rica y sana	El Comercio	\N	\N	\N	978-9972-02-191-6	el comercio SA.	GASTRONOMÍA	\N	\N	2944 paginas	\N	\N	2009	ALMUERZO . Arroz con pollo albóndigas . Coliflor salteada con lomo   estofado de res. Caiguas rellenas ajiaco de papas . Arroz chaufa pastel de fideos . Tallarines con salsa roja sopa de  frejoles . Adobo  de cerdo  milanesa  de pescado . Arroz  tapado  menstrón  . Carapulcra  fideos  canuto a la huancaina . Aguadito de pollo  asado d crillo . humbruguesas mixtas pollo al horno  rostizado . Aji  de gallina guiso  de lentejas . Sopa de trigo  pepita de choclo.  Pescado a la chorrillana bistec  apanado . locro  de zapallo  tallarin saltado .  Pollo a la king arroz  con cerdo .  Escabeche  olluquito  con chárqui .  Tacu tacu fideos verdes.  Cau cau lomo lastado.  Garbanzos con  acelega chupin  de pescado. Cauche  de queso papa rellena . Sopa seca  seco  de pollo . Curry  de pollo   hambruguesas  de pescado  y arroz  pilat .   trigo  atamalado  espaguetis  a la carbonara  con pollo .  Picante  de zapallios  frejoles  escabechados . Anticucho  de pescado y chaufa blanco  guisito  de crane  y verdura . Pescado al horno  con puré  de pallares  verdes  papitas  con mani .  CENAS . tortilla de papa y verdura  pastel  de crane .  Palta rellena sopa  de cebolla . Pollo salteado con verdura  soufflé  de brócoli .  salpicón  de pollo  alcachofas  rellenas . Crema  de zapallo  ensalada  de atún  . Paltel de espinaca  canelones  de pollo  y verduras . Papas al horno  croquetas  de atún  . Ensalada  césar  sopa  de pollo  y sémola . Ensalada de quinua soufflé de queso . Crema  de apio  ensalada  capresse . Causa  rellena  de pollo  sopa  criolla .  Yuquitas  de jamón y queso  crepes rellenas  de espinaca  . Ensalada  de fideos pastel  de choclo .  Alitas de pollo  teriyaki  huevo  rellenos . Budin  de alcachofa  empanadas  mixtas .  Pallades  guisados  choclo con queso.  Tortilla  española  pimienta  rellenos .  Quiche de cebolla pollo salteado estilo oriental . salterito pastel de papa y jamón . fetuccini  a lo alfredo  torrejitas  de colifor .  Ensalada  de arroz  integral zapallitos reññenos . Ensalada de col  chaufa  de quinua .  Crema de tomate  reoles de berenjena . Tomate  rellenos  de atún  pizza  vegetariana .  frejoles  verdes  salteados ensalada  de papa . Brócoli  a la crema  omelette de espárragos . COMIDA ESPECIALES .  Arroz con masriscos ajies rellenos .  lasaña cuatro quesos  lomo  a la pimienta con risotto a la jardinera .  Pechugas enrolladas sancochado. Sálmo al eneldo picante de camarones . Ñoquis  en salsade nuevos  pato a la naranja . Atún  en salsa  de sauco calamares  rellenos ,  pachamanca a la olla  raviotes de zapallo de zapallo loche y ricota .  Hongos portobelo rellenos  de cargrejo . Asado a la crema con champiñones . Ossobuco a la milanesa paella. Lomo  strogonoff con puré gratinado  enrollado de cerdo .	t	\N
1000349	\N	Sanguches del Perú	Edelnor	\N	\N	\N	978-612-45302-9-6	edelnor SAA.	GASTRONOMÍA	\N	\N	96 páginas	\N	\N	2012	\N	t	\N
1000350	\N	Delicias para crecer	Bernardo Roca Rey Miro Quesada	\N	\N	\N	9972-02-133-5	El Comercio	GASTRONOMÍA	\N	\N	2942 paginas	\N	\N	2006	\N	t	\N
1000351	Gastronomia	Mini chefs	El Comercio	\N	\N	\N	\N	El Comercio	GASTRONOMÍA	Español	Revista	168 paginas	Primera Edicion	Lima	-	-	t	\N
1000352	\N	Todos los colores bajo el sol	Anonimo	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2940 paginas	\N	\N	\N	\N	t	\N
1000353	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2939 paginas	\N	Arequipa	2010	\N	t	\N
1000354	\N	Chilcanomanía	BBVA Continental	\N	\N	\N	978-612-4151-43-9	planeta Peru SA.	GASTRONOMÍA	\N	\N	2938 paginas	\N	\N	2012	\N	t	\N
1000355	\N	Secretos del Chef	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2937 paginas	\N	\N	\N	\N	t	\N
1000356	Gastronomia	Lima espacios restaurantes	Mixmade Sac.	\N	\N	\N	978-603-45-228-00	grafica biblos SA.	GASTRONOMÍA	Español	Revista	2936 paginas	Primera Edicion	Lima	2008	\N	t	\N
1000357	\N	Club de cocina al mejor estilo- Recetario	M. Santa Isabel	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2935 paginas	\N	\N	\N	\N	t	\N
1000358	Gastronomia	Orígenes del vino	Mauricio Wiesenthal	\N	\N	\N	978-612-4069-26-0	cantabria SAC.	GASTRONOMÍA	Español	Enciclopedia	2934 paginas	\N	\N	2010	Los orígenes del vino. El desarrollo de la agricultura. Los primeros agricultores. La uva: el fruto fermentable y mágico. La civilización agrícola. Algunas referencias legendarias. Los primeros vinos de los Montes Zagros. La embriaguez de las etimologías. La expanción de la cultura del vino. Sumerios, babilonios, judíos, fenicios: Pueblos del vino. El culto de Dionisos y Baco. Los vinos del Mediterráneo. Los vinos de la Edad Media. El Renacimiento: cultura del vino. Los imperios del vino. Las plagas del siglo XIX.	t	\N
1000359	\N	Club de cocina al mejor estilo- Recetario ej.2	M. Santa Isabel	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2933 paginas	\N	\N	\N	\N	t	\N
1000360	\N	Club de cocina al mejor estilo- Recetario ej.3	M. Santa Isabel	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2932 paginas	\N	\N	\N	\N	t	\N
1000361	\N	Dulce placer de Donofrio	Sandra Plevisani	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2931 paginas	\N	\N	\N	\N	t	\N
1000362	\N	Anchoveta para todos	Edelnor	\N	\N	\N	978-612-45302-0-3	edelnor SAA.	GASTRONOMÍA	\N	\N	99 páginas	\N	\N	2009	\N	t	\N
1000363	Gastronomia	Servicio del vino	Mauricio Wiesenthal  y Francesc Navarro	\N	\N	\N	\N	Cantabria SAC	GASTRONOMÍA	Español	Enciclopedia	2929 paginas	Primera edicion	Lima	2010	\N	t	\N
1000364	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2928 paginas	\N	Arequipa	2010	\N	t	\N
1000365	\N	Comercialización y marketing	Giancarlo Jose Paz Rojas	\N	\N	\N	\N	caritas	GASTRONOMÍA	\N	\N	2927 paginas	\N	\N	\N	\N	t	\N
1000366	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2926 paginas	\N	Arequipa	2010	\N	t	\N
1000367	\N	Recetario Has Sandwich- Alimento Ideal	Bimbo	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	2925 paginas	\N	\N	\N	\N	t	\N
1000368	\N	Secretos del Chef ej.2	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	2924 paginas	\N	\N	\N	\N	t	\N
1000369	Gastronomia	Mejores recetas del buen hogar	Anonimo	\N	\N	\N	\N	America	GASTRONOMÍA	Español	Revista	188 paginas	Primera Edicion	Panama	1977	\N	t	\N
1000370	formacion humana	Qué hacer con el colesterol alto	Harvard Health Publications	\N	\N	\N	978-956-8827-16-8	-	GASTRONOMÍA	español	libro	112 paginas	primera	chile	2009	\N	t	\N
1000371	formacion humana	Cómo perder peso sin recuperarlo	Harvard Health Publications	\N	\N	\N	978-956-8827-19-9	-	GASTRONOMÍA	español	libro	95 paginas	primera	chile	2009	\N	t	\N
1000372	formacion humana	Qué hacer con los dolores de espalda	Harvard Health Publications	\N	\N	\N	978-956-8827-25-0	-	GASTRONOMÍA	español	libro	106 paginas	primera	chile	2009	\N	t	\N
1000373	formacion humana 	Entendiendo la depresión	Harvard Health Publications	\N	\N	\N	978-956-8827-15-1	-	GASTRONOMÍA	español	libro	122 paginas	primera ediciòn	chile	2009	\N	t	\N
1000374	formacion humana 	Como mejorar su sueño	Harvard Health Publications	\N	\N	\N	978-956-8827-21-2	-	GASTRONOMÍA	español	libro	122 paginas	primera ediciòn	washington	2005	\N	t	\N
1000375	formacion humana 	Ejercicio. Programa vida cotidiana	Harvard Health Publications	\N	\N	\N	978-956-8827-23-6	-	GASTRONOMÍA	español	libro	119 paginas	primera ediciòn	chile	2009	\N	t	\N
1000376	formacion humana	Sexualidad en la adultez y la tercera edad	Harvard Health Publications	\N	\N	\N	978-956-8827-18-2	-	GASTRONOMÍA	español	libro	119 paginas	primera	chile	2009	\N	t	\N
1000377	formacion humana	Recargue su energía	Harvard Health Publications	\N	\N	\N	978-956-8827-22-9	-	GASTRONOMÍA	español	libro	121 paginas	primera	chile	2009	\N	t	\N
1000378	formacion humana	Las emociones y los problemas en la digestión	Harvard Health Publications	\N	\N	\N	978-956-8827-26-7	-	GASTRONOMÍA	español	libro	120 paginas	primera	chile	2009	\N	t	\N
1000379	formacion humana	Qué hacer con las alergías	Harvard Health Publications	\N	\N	\N	978-956-8827-20-5	-	GASTRONOMÍA	español	libro	114 paginas	primera	chile	2009	\N	t	\N
1000380	formacion humana	Controle su estrés	Harvard Health Publications	\N	\N	\N	978-956-8827-17-5	-	GASTRONOMÍA	español	libro	100 paginas	primera	chile	2009	\N	t	\N
1000381	\N	Alivie y prevenga los dolores de cabeza	Harvard Health Publications	\N	\N	\N	978-956-8827-24-3	\N	GASTRONOMÍA	\N	\N	2911 paginas	\N	\N	2009	\N	t	\N
1000388	\N	La vida son los ríos	Isaac Goldemberg	\N	\N	\N	9972-980-92-9	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2904 paginas	Primera	Lima	2005	\N	t	\N
1002692	\N	ESPASA CALPE 12	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	600 paginas	\N	\N	\N	\N	t	\N
1000389	\N	La vida son los ríos	Isaac Goldemberg	\N	\N	\N	9972-980-92-9	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2903 paginas	Primera	Lima	2005	\N	t	\N
1000390	\N	La vida son los ríos	Isaac Goldemberg	\N	\N	\N	9972-980-92-9	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2902 paginas	Primera	Lima	2005	\N	t	\N
1000391	\N	Graú. Los hijos de los libertadores	Guillermo Thorndike	\N	\N	\N	9972-221-01-6	Fondo editorial del Congreso del Perú/Fondo editorial del Banco de Crédito de Perú	HISTORIA	Español	LIBRO	2901 paginas	Primera	Lima	2011	\N	t	\N
1000392	\N	Graú. Los hijos de los libertadores	Guillermo Thorndike	\N	\N	\N	9972-221-01-6	Fondo editorial del Congreso del Perú/Fondo editorial del Banco de Crédito de Perú	HISTORIA	Español	LIBRO	2900 paginas	Primera reimpresión	Lima	2011	\N	t	\N
1000393	\N	Graú. Los hijos de los libertadores	Guillermo Thorndike	\N	\N	\N	9972-221-01-6	Fondo editorial del Congreso del Perú/Fondo editorial del Banco de Crédito de Perú	HISTORIA	Español	LIBRO	2899 paginas	Primera reimpresión	Lima	2011	\N	t	\N
1000394	\N	Manuel Pardo y el partido Civil/ apogeo y crisis del primer partido político del Perú	Valentín Paniagua	\N	\N	\N	978-9972-221-89-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2898 paginas	Primera	Lima	2009	\N	t	\N
1000395	\N	Rostros y rastros / Un caminante cusqueño en el siglo XX	Sergio Caller	\N	\N	\N	9972-221-33-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2897 paginas	Primera	Lima	2006	\N	t	\N
1000396	\N	Rostros y rastros / Un caminante cusqueño en el siglo XX	Sergio Caller	\N	\N	\N	9972-221-33-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2896 paginas	Primera	Lima	2006	\N	t	\N
1000397	\N	Rostros y rastros / Un caminante cusqueño en el siglo XX	Sergio Caller	\N	\N	\N	9972-221-33-4	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2895 paginas	Primera	Lima	2006	\N	t	\N
1000398	\N	Manuel Pardo y el partido Civil/ apogeo y crisis del primer partido político del Perú	Valentín Paniagua	\N	\N	\N	978-9972-221-89-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2894 paginas	Primera	Lima	2009	\N	t	\N
1000399	Formaciòn humana	Niños Invisibles / Niñez con discapacidad en el Perú	Liliana Peñaherrera/Gullermo Vega Espejo	\N	\N	\N	978-9972-221-48-4	Fondo editorial del Congreso del Perú	FILOSOFIA Y PSICOLOGIA	Español	LIBRO	142 paginas	Primera	Lima	2008	\N	t	\N
1000400	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2892 paginas	\N	Arequipa	2010	\N	t	\N
1000401	fomacion humana 	Infancia en vilo / Iniciativas para la infancia y la educación nacional	Rafael Vásquez Rodríguez / Luis Tejada Ripalda (compiladores)	\N	\N	\N	978-9972-221-77-4	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	218 paginas	Primera	Lima	2009	\N	t	\N
1000402	fomacion humana 	Infancia en vilo / Iniciativas para la infancia y la educación nacional	Rafael Vásquez Rodríguez / Luis Tejada Ripalda (compiladores)	\N	\N	\N	978-9972-221-77-4	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	218 paginas	Primera	Lima	2009	\N	t	\N
1000403	fomacion humana 	Infancia en vilo / Iniciativas para la infancia y la educación nacional	Rafael Vásquez Rodríguez / Luis Tejada Ripalda (compiladores)	\N	\N	\N	978-9972-221-77-4	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	218 paginas	Primera	Lima	2009	\N	t	\N
1000404	\N	El sueño del Libertador Haya de la Torre y la unidad de América / Antología de homenaje	Luis Alva Castro	\N	\N	\N	9972-890-63-5	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2888 paginas	Primera	Lima	2004	\N	t	\N
1000405	\N	El sueño del Libertador Haya de la Torre y la unidad de América / Antología de homenaje	Luis Alva Castro	\N	\N	\N	9972-221-08-5	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2887 paginas	Primera	Lima	2004	\N	t	\N
1000406	\N	El sueño del Libertador Haya de la Torre y la unidad de América. Antología de homenaje	Luis Alva Castro	\N	\N	\N	9972-221-08-3	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2886 paginas	Segunda Edición	Lima	2006	\N	t	\N
1000407	\N	Comprobando nuestros aprendizajes	Didios Peña	\N	\N	\N	2015-07713	METROCOLOR	\N	\N	\N	2885 paginas	Primera	\N	2015	\N	t	\N
1000408	\N	Civilización de los jubilados	Didier Péne	\N	\N	\N	84-7490-532-X	Encuentro ediciones	ADMINISTRACIÓN	Español	LIBRO	255	Primera	Madrid	1997-1999	\N	t	\N
1000409	\N	Presente y futuro de las pensiones en España	Maximino Carpio Eugenio Domingo	\N	\N	\N	84-7490-386-6	\N	ADMINISTRACIÓN	\N	\N	2883 paginas	Primera	\N	1996	\N	t	\N
1000410	\N	¿Está el estado Español en quiebra ?	José Barea / Dolores Dizy	\N	\N	\N	84-7490-367-X	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2882 paginas	Primera	Madrid	1995	\N	t	\N
1000411	\N	Unión ecónomica y monetaria. La UEM en entredicho	Emilio Ontiveros - Francisco José Valero	\N	\N	\N	84-7490-400-5	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2881 paginas	Primera	Madrid	1996	\N	t	\N
1000412	\N	¿Trabajo para todos? Un debate necesario	Luis Enrique Alonse / Lourdes Pérez Ortiz	\N	\N	\N	84-7490-399-8	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2880 paginas	Primera	Madrid	1996	\N	t	\N
1000413	Formaciòn humana	Derecho a la salud y los de los enfermos	Carlos Nicolás Ortiz	\N	\N	\N	84-7490-080-8	Ediciones Encuentro	POLÍTICA Y ESTADO	Español	LIBRO	211	Primera	Madrid	1983	\N	t	\N
1000414	\N	La privatización en las fronteras en la Unión Europea	Alvaro Cuervo	\N	\N	\N	84-7490-461-7	\N	ADMINISTRACIÓN	\N	\N	2878 paginas	\N	\N	1997	\N	t	\N
1000415	\N	Imigración en las fronteras de la Unión Europea	Aljandro Lorca Marcos Alonso Luis Antonio Lozano	\N	\N	\N	84-7490-453-6	\N	ADMINISTRACIÓN	\N	\N	2877 paginas	\N	\N	1997	\N	t	\N
1000416	\N	Ni emires ni ayatollahs. Los orígenes de un conflicto político cultural y la actualidad de la guerra entre Irak e Irán	Bechir Boumaza	\N	\N	\N	84-7490-109-x	Ediciones Encuentro	HISTORIA	Español	LIBRO	342	Primera	Madrid	1984	\N	t	\N
1000417	\N	El arte de gobernar según Peter Drucker	Guido Stein	\N	\N	\N	84-8088-377-4	Gestión 2000 S.A	ADMINISTRACIÓN	Español	LIBRO	2875 paginas	Primera	Barcelona	1999	\N	t	\N
1000418	\N	Meta	Eliyahm M. Goldratt y Jeff Cox	\N	\N	\N	968-6635-34-3	Castillo	ADMINISTRACIÓN	\N	\N	2874 paginas	\N	\N	1993	\N	t	\N
1000419	\N	Cumbre nacional de microfinanzas	Maritza Fattorini / José Granados	\N	\N	\N	249-9158-2	Cecosami	ADMINISTRACIÓN	Español	LIBRO	2873 paginas	Primera	Lima	1998	\N	t	\N
1000420	\N	Microempresas de confección. Una aproximación	Aconsur	\N	\N	\N	\N	Cooperazíone italiana	ADMINISTRACIÓN	Español	REVISTA	2872 paginas	\N	Lima	1997	\N	t	\N
1000421	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2871 paginas	\N	Arequipa	2010	\N	t	\N
1000422	\N	Principios del Marketing	Agueda Esteban; Telaya Jesús; Marcos Gonzales; Cristina Olarte; Pascual Eva; Marina Reynares Lara; Manuela Saco Velazquez	\N	\N	\N	978-84-7356-572-1	\N	ADMINISTRACIÓN	\N	\N	2870 paginas	4	\N	2008	\N	t	\N
1000423	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2869 paginas	\N	Arequipa	2010	\N	t	\N
1000424	\N	Actividad coboral	Instituto Pacifíco S.A.C	\N	\N	\N	\N	\N	ADMINISTRACIÓN	\N	\N	2868 paginas	1	\N	2011	\N	t	\N
1002693	\N	ESPASA CALPE 13	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	599 paginas	\N	\N	\N	\N	t	\N
1000425	Administracion	Exclusión y oportunidad	Jaime Saavedra - Juan Chacaltana	\N	\N	\N	9972-615-16-2	Didi de arteta S.A.	ADMINISTRACIÓN	Español	LIBRO	 181 paginas	Primera	Lima	2001	\N	t	\N
1000426	\N	Puente cultural entre Asia y Latino América	Raúl Diez Canseco Terry	\N	\N	\N	\N	Puente al futuro	ADMINISTRACIÓN	Español	LIBRO	2866 paginas	41974	Lima	2014	\N	t	\N
1000427	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2865 paginas	\N	Arequipa	2010	\N	t	\N
1000428	\N	Curso de mercadotecnia	Carl Mcdaniel Jr.	\N	\N	\N	968-6034- 60-9	HARLA	ADMINISTRACIÓN	Español	LIBRO	2864 paginas	Segunda Edición	Nueva York	1982	\N	t	\N
1000429	\N	Economía de hoy	Matthew Bishop	\N	\N	\N	978-612-4069-18-5	The Economist	ADMINISTRACIÓN	Español	LIBRO	2863 paginas	Primera	Lima	2010	\N	t	\N
1000430	Administración	Comunicación con números	Richard Stutely	\N	\N	\N	978-612-4069-25-3	El comercio S.A.	ARITMETICA	Español	LIBRO	239 paginas	Primera	Lima	2010	\N	t	\N
1000431	\N	Los orígenes de coaching. El mundo que hemos perdido. Los coach.Reglamentación.¿Funcióna el coaching?Cómo elegir el coach correcto.Mujeres en coaching y mentoring. Coaching y mentoring para el liderazgo. Perspectiva de los clientes. El futuro.	Jane Renton	\N	\N	\N	978-612-4069-24-6	El comercio	ADMINISTRACIÓN	Español	LIBRO	2861 paginas	Primera	Lima	2010	Los orígenes de coaching. El mundo que hemos perdido. Los coach. Reglamentación.¿Funcióna el coaching? Cómo elegir el coach correcto. Mujeres en coaching y mentoring.Coaching y mentoring para el liderazgo.Perspectiva de los clientes.El futuro.	t	\N
1000432	\N	Gestión financiera	John Tennent	\N	\N	\N	978-612-4069-20-8	El comercio	ADMINISTRACIÓN	Español	LIBRO	2860 paginas	Primera	Lima	2010	\N	t	\N
1000433	\N	Negociación	Gavin Kennedy	\N	\N	\N	978-612-4069-23-9	Producciones cantabria S:A	ADMINISTRACIÓN	Español	LIBRO	2859 paginas	Primera	Lima	2010	\N	t	\N
1000434	\N	Diseño de organización ej2	Naomi Stanford	\N	\N	\N	978-612-4069-17-8	Producciones cantabria S:A	ADMINISTRACIÓN	Español	LIBRO	2858 paginas	Primera	Lima	2010	Prefacio.Introducción al diseño de la organización.Modelos, abordajes y diseño.Estructuras organizacionales.Planeamiento y puesta en secuencia del diseño organizacional.Medición.Compromiso de los participantes.El liderazgo y el diseño de organizaciones.La cultura y los procesos de grupo.Metamorfosis, no a prueba de futuro.Notas.Modelos de diseños organizacionales.Fuentes útiles de informacion.Glosario.	t	\N
1000435	\N	Guía esencial de inversiones	Philip Ryland	\N	\N	\N	978-612-4069-15-4	El comercio	ADMINISTRACIÓN	Español	GUÍA	2857 paginas	Primera	Lima	2010	\N	t	\N
1000436	Administración	Estrategia de inversión	Peter Stanyer	\N	\N	\N	978-612-4069-16-1	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	278 paginas	Primera	Lima	2010	\N	t	\N
1000437	\N	Marketing	Patrick Forsyth	\N	\N	\N	978-612-4069-19-2	The Economist	ADMINISTRACIÓN	\N	\N	2855 paginas	Primera	\N	2010	Perspectiva general.El marketing en contexto.Las realidades del marketing.El proceso de marketing.Consideraciones sobre el "producto".Política de fijación de precios y estrategias.Investigación de mercado:reducir el riesgo.Rutas a los mercados:canales de distribución y metodología.Planificación de la estrategia y de marketing.Estrategia del marketing.Coordinación y control.Comunicaciones de marketing.Influir en la conducta del comprador.Las comunicaciones del marketing:el detalle.Influencias persuasivas personales.	t	\N
1000438	Administración	Estrategias de Negocio	Michel Syrett	\N	\N	\N	978-612-4069-16-1	The Economist	ADMINISTRACIÓN	Español	LIBRO	2854 paginas	Primera	LIMA	2010	\N	t	\N
1000439	Administración	Análisis de los indicadores económicos	The economist	\N	\N	\N	978-987-1456-19-2	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	242 paginas	Primera	LIMA	2008	\N	t	\N
1000440	Administración	Management. Las 100 ideas que hicieron historia.	Tim Hindle	\N	\N	\N	978-987-1456-14-7	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	243 paginas	Primera	LIMA	2008	\N	t	\N
1000441	Administración	Economía moderna (Características, hechos y protagonistas)	The economist	\N	\N	\N	978-987-1456-23-9	Simon cox	ADMINISTRACIÓN	Español	LIBRO	2851 paginas	Primera	Lima	2008	\N	t	\N
1000442	Administración	Consultoría de negocios	Gilbert Toppin y Fiona Czerniawska	\N	\N	\N	978-987-1456-22-2	the Economist	ADMINISTRACIÓN	Español	LIBRO	2850 paginas	Primera	Lima	2008	La consultoría de negocios hoy.La consultoría de negocios en la encrucijada.El nuevo ecosistema de la consultoría de negocios.El mundo del cliente.El mercado del cliente.La organización de los clientes.Los proyectos.El mundo de la consultoría.La industria de la consultoría.Las empresas consultoras.Los consultores.Los mundos se conectan.Siete temas de interacción.La reputación.El aislamiento.La metamorfosis.Las relaciones.El portafolio.La carrera profesional.El ciclo de vida.Caminos hacia el éxito.El éxito.La empresa consultora exitosa.El consultor exitoso.Un proyecto para el futuro.La evaluación probable de negocios de la consultoría.Empresas consultoras líderes.Notas y referencias.	t	\N
1000443	\N	Miscelánea de negocios	The economist	\N	\N	\N	978-987-1456-24-6	El comercio	ADMINISTRACIÓN	Español	LIBRO	2849 paginas	Primera	Lima	2008	Las empresas en sus inicios.Las empresas familiares mas antiguas.Los periódicos mas antiguos que aún se encuentran en la circulación.La prensa de negocios.Las empresas mas grandes del mundo.Las empresas mas grandes de EE.UU.Las empresas grandes, grandes hechos.Detrás de la marca.Las mas grandes IPOs.Las quiebras mas grandes de los EE.UU.Privatizaciones.Fiascos en los negocios.Billetes grandes.Las marcas mas valiosas del mundo.Las empresas más admiradas del mundo.Las empresas más admiradas de Gran Bretaña.Lo que las empresas dicen de sí mismas.Gobierno corporativo:Estilos de directorio.Los juegos que practican los directores.Ciclos comerciales.Comienzos y fracasos de los negocios.Días y procedimientos para comenzar un  negocio.Corrupción:percepción en los negocios.Coeficiente útil para los negocios.Costos de los negocios.El derrumbe de la fuerza laboral.La fuerza laboral cambiante.Cambios en horas laborables.Cambios en la edad de jubilación.Días perdidos en huelgas de empleados y huelgas de la patronal.Poder de los sindicatos.Federaciones de sindicatos.Grandes sindicatos.Salarios internacionales comparados.Salario mínimo y salario promedio.Salario del director ejecutivo en EE.UU.Salario del director ejecutivo en el Reino Unido.Cantidad de contadores.Principales estudios contables.Un mundo de abogados.Principales estudios jurídicos.Las mujeres en los negocios.Tercerización nacional e internacional.Rascacielos.Grandes centros comerciales.Principales headhunters.Principales mentiras de los CV.Principales agencias de publicidad.Gastos de publicidad.Algunos tributos publicitarios.Tres desaciertos publicitarios.Algunos slogans publicitarios famosos.Grandes empresarios del pasado.La filantropía y el sector que no produce ganancias.Las personas más adineradas.Presidentes de bancos centrales desde 1900.Con sus propias palabras.Muchos badboys...y una chica mala.Principales pecadores del management.Los mercados de valores mas antiguos.Principales mercados de valores.Explicaión de los índices de algunos mercados de valores.Rendimiento del mercado de valores.Mercado de valores:los mejores y los peores momentos.La hora del mercado de valores.Bonos.Burbujas que explotaron.Reservas y precios del petróleo.Reservas y  precios del oro.Hechos relacionados con el oro.Productores ricos.Hechos relacionados con el diamante y el platino.El mercado de divisas.Capital de riesgo.Hedge funds.Fórmulas de inversión.Detrás del nombre de la divisa.Las monedas y los billetes más antiguos.Más superlativos de dinero.Billetes y monedas en circulación.Euros impresos.La  vida de los billetes de USD y .Tipos de cambio.Divisas locales frente al dólar.Fijación de la tasa de cambio.Algunas devoluciones notables.La cambiante economía mundial.Principales exportadores.Dependencia comercial.Inversión extranjera directa.Envíos de dinero al hogar.Tasa de interés.Tasa de interés empresarial.Impuestos que pagan las empresas.Impuestos que pagan los particulares.Cómo fijar impuestos para las personas con los más altos ingresos.IVA y tasas de impuestos a las ventas.Riqueza y deudas.Atracciones en el extranjero.Grandes libros de negocios.Lo que esconde una palabra.El latín que prefieren los abogados.Nombres de marcas que incorporó el idioma.Siglas:toda una elección."Jerga" de negocios.Principios y leyes de negocios.Principales escuelas de negocios.Algunos estilos de management.Asistentes digitales.Computadores portátiles y de escritorio.El poder del chip.El impacto de la piratería de los programas de computación.Spam y correo electrónico.Sufijos de internet.La vida empresarial en las alturas.Grandes aerolíneas.Datos de aeropuertos.Viajar con millaje de premio.¡Barco a la vista!¿La era del tren?El poder del pedal.Inventores e invensiones.Patentes famosas.Consejos útiles para los negocios de etiqueta.	t	\N
1000444	Administración	El futuro de la tecnología	The economist	\N	\N	\N	978-987-1456-15-4	El comercio S.A.	TECNOLOGÍA	Español	LIBRO	368 paginas	Primera	Lima	2008	1. La tecnología informática crece: madurez, asegurando la nube, hágalo fácil, un mundo de trabajo. 2. El cambio hacia la electrónica de consumo: teléfonos móviles, videojuegos, el hogar digital. 3. En busca de la próxima gran novedad: subiendo la escalera helicoidal, energía, pequeñas maravillas, robots e inteligencia artificial	t	\N
1000445	Administración	Wall street. Mercados, mecanismos y participantes.	Richard Roberts	\N	\N	\N	978-987-1456-17-8	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	252 paginas	Primera	Lima	2008	¿Qué es el wall street?Cómo llegamos a esta situación.Escándalos de wall street.Mercados, mercados, mercados.La industria de isntrumentos financieros.Bancos.Compañías de seguros y fondos de pensiones.Fondos comunes de inversión.Bolsas de valores.Negociación de futuros y opciones.Sistema de pago, cámaras de compensación y compañías depositarias.Regulaciones y reguladores.Centro monetario global.Wall street en crisis.Instituciones y organizaciones de la industria de servicios financieros.Actores principales.Sucesos clave,1792-2003.Lectura adicional.Índice temático.	t	\N
1000446	Administración	Análisis estratégico de compañías	Bob Vause	\N	\N	\N	978-987-1456-21-5	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	311 paginas	Primera	Lima	2008	La comprensión de los fundamentos. La memoria anual - y lo que subyace. El balance. El estado de resultados. El estado de flujo de caja. Otros estados. Evaluación de los hechos. Lineamiento para el análisi financiero. La medición de la rentabilidad. La mediciòn de la eficiencia. Capital de trabajo y liquidiez. Capital y evaluación. Estratégia, exitos y fracazos. Puntos de referencia útiles. Ejemplo Práctico de análisis de coeficiente.	t	\N
1000447	\N	Cómo medir el rendimiento de la empresa	P.F Drucker, R. G Eccles y otros	\N	\N	\N	958-42-1151-X	Planeta Colombiana S. A	ADMINISTRACIÓN	\N	\N	2845 paginas	deusto	\N	2003	\N	t	\N
1000448	\N	Dirigir personas en la empresa	R. Goffee, G. Jones	\N	\N	\N	958-42-1157-9	Planeta Colombiana S. A	ADMINISTRACIÓN	\N	\N	2844 paginas	deusto	\N	1999	\N	t	\N
1000449	Administración	Junior Achievement	Carla Muñiz / Rosa Zavaleta / Estefania Jacobs/ Lucía Palma / Entre otros.	\N	\N	\N	\N	Editorial Jaw Perú	ADMINISTRACIÓN	Español	Revista	52	Primera	Lima	2012	Presentacion sean rush,Presidente CEO de Junior Achievement Worldwide.Presentacion Raul Diez Canseco Terry,Presidente de directorio de JAW PERU. Directorio de JAM PERU. Presentacion Carla Muñiz de los Rios Directora Ejecutiva de JAM PERU. Nuestro equipo. Conoce mas de JAM PERU. Nuestros logros a nivel nacional. Nuestros aliados. Exitos internacionales de JAM PERU. Programas de jovenes emprendedores. Programas de JAM PERU. Programas de educacion primaria. Programas de educacion secundaria. Eventos nacionales. Voluntariado.	t	\N
1000450	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2842 paginas	\N	Arequipa	2010	\N	t	\N
1000451	Administración	La Empresa y los factores que influyen en su funcionamiento	Robbins Stephen P. / Coulter Mary	\N	\N	\N	978-607-32-2767-4	Editorial Pearson	ADMINISTRACIÓN	Español	LIBRO	233 paginas	primera edicion	México	2014	\N	t	\N
1000452	Administracion	\N	Oficina Internacional del trabajo Ginebra	\N	\N	\N	\N	Editorial OIT	ADMINISTRACIÓN	\N	\N	2840 paginas	Octava Edición	\N	1984	\N	t	\N
1000453	Administracion	Enciclopedia de Gestión y Administración de empresas "Management" T1	Carl Heyel	\N	\N	\N	92-2-300021-1	Técnicos Editoriales Asociados S.A	ADMINISTRACIÓN	Español	ENCICLOPEDIA	404 paginas	Tercera Edición	Nueva York		\N	t	\N
1000454	Administracion	Enciclopedia de Gestión y Administración de empresas "Management" T2	Carl Heyel	\N	\N	\N	84-253-1653-7	Técnicos Editoriales Asociados S.A	ADMINISTRACIÓN	Español	ENCICLOPEDIA	404 paginas	Tercera Edición	Nueva York	\N	\N	t	\N
1000455	Administracion	Enciclopedia de Gestión y Administración de empresas "Management" T3	Carl Heyel	\N	\N	\N	84-253-1654-5	Técnicos Editoriales Asociados S.A	ADMINISTRACIÓN	Español	ENCICLOPEDIA	404 paginas	Tercera Edición	Nueva York	\N	\N	t	\N
1000456	\N	Análisis estratégico de compañías	Bob Vause	\N	\N	\N	978-987-1456-21-5	El comercio	ADMINISTRACIÓN	Español	LIBRO	2836 paginas	Primera	Lima	2008	La comprensión de los fundamentos. La memoria anual - y lo que subyace. El balance. El estado de resultados. El estado de flujo de caja. Otros estados. Evaluación de los hechos. Lineamiento para el análisi financiero. La medición de la rentabilidad. La mediciòn de la eficiencia. Capital de trabajo y liquidiez. Capital y evaluación. Estratégia, exitos y fracazos. Puntos de referencia útiles. Ejemplo Práctico de análisis de coeficiente.	t	\N
1000457	\N	Management (Las 100 ideas que hicieron historia)	The economist	\N	\N	\N	978-987-1456-14-7	El Comercio	ADMINISTRACIÓN	Español	LIBRO	2835 paginas	Primera	Buenos Aires	2008	Cálculo de costos basado en la actividad.Tablero de comando(balanced scorecard).Barreras al ingreso y a la salida del mercado.Evaluación por comparación(benchmarking brainstorming).Creación del valor de la marca(branding).Ciclo de negocio.Creación de modelos de negocio.El plan de negocios.Canibalización.Defensa(championing).La gestión del cambio.Elegir solo lo mejor(cherry-picking).Agrupamiento(clustering).Ventajas competitivas.Convergencia.Competencias esenciales(core competences).Gobierno corporativo(corporate governance).Responsabilidad social empresaria.Análisis de costos y beneficios.Gestión de crisis.Análisis de camino crítico.Venta cruzada(cross-selling).Cultura.Gestión de relaciones con el cliente(CRM).Descentralización.Reducción de niveles jerárquicos(delayering).Diferenciación.Diversificación.Aprendizaje de doble ciclo(double-loop learning).Achicamiento(downsizing).Comercio electrónico(E-commerce).Economíasde escala.Economía de alcance.Delegación de responsabilidades(empowerment).Planificación de recursos empresariales.Iniciativa empresarial(entrepreneurship).Excelencia.La curva de la experiencia.Empresas familiares.Concesion de franquicias.Teoría del juego.El techo de cristal.Globalización.Matriz de crecimiento-participación.El efecto de Hawthrone.La jerarquía de las necesidades.Innovación.Iniciativa empresarial intracorporativa.Sistema justo a tiempo(just-in time).Kaizen.Keiretsu.Gestión de conocimiento.Liderazgo.Producción ajustada.La organización de aprendizaje.Gestión por objetivos(MBO).Gestión itinerante(MBWA).Personalización en masa.Producción en masa.Gestión por competencia(matrix management).Mentoría(mentoring).Declaración de misión.Nicho de mercado.Gestión a libro abierto.Investigación operativa.Subcontratación.El principio de Pareto(la regla 80/20).Remuneraciones por rendimiento.El principio de Peter.Obsolescencia planificada.Trabajo con cartera de clientes.Integracios post-función.Mejora de procesos.Ciclo de vida de un producto.Círculo de calidad.Reingeniería.Conductas satisfactorias.Planificación de escenarios.Administración científica.Segmentación.Las siete eses.Six sigma.Lo pequeño es hermoso.El espacio de control.Alianza estratégica.Planificación estratégica.Estructura.Planificación de la sucesión.Análisis FODA.Sinergia.Transferencia de tecnología.La teoría X y Y.Gestión de calidad total.Verdadero y justo.Desagrupación(umbunddling).Propuesta única de venta.Cadena de valor.Integración vertical.La organización virtual.Visión.Presupuesto base 0.	t	\N
1000458	A2	El futuro de la tecnología	The economist	\N	\N	\N	978-987-1456-15-4	El Comercio	Economía	Español	LIBRO	2834 paginas	Primera	Lima	2008	1. La tecnología informática crece: madurez, asegurando la nube, hágalo fácil, un mundo de trabajo. 2. El cambio hacia la electrónica de consumo: teléfonos móviles, videojuegos, el hogar digital. 3. En busca de la próxima gran novedad: subiendo la escalera helicoidal, energía, pequeñas maravillas, robots e inteligencia artificial.	t	\N
1000459	\N	Wall street (Mercados, mecanismos y participantes)	Richard Roberts	\N	\N	\N	978-987-1456-17-8	El Comercio	ADMINISTRACIÓN	Español	LIBRO	2833 paginas	Primera	Lima	2008	\N	t	\N
1000460	Administración	Diseño de organización	Naomi Stanford	\N	\N	\N	978-612-4069-17-8	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	319 paginas	Primera	Lima	2010	\N	t	\N
1000461	Administración	Dirección corporativa	Bob Tricker	\N	\N	\N	978-612-4069-21-5	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	288 paginas	Primera	Lima	2010	Directores efectivos y directorios exitosos.A-Z.Directores y la crisis financiera global.El código combinado del Reino Unido sobre el gobierno corporativo.Los principios de la OCDE para el gobierno corporativo.Las competencias fundamentales de los directores de la compañía.Lista de verificación para la iniciación de los nuevos directores.Lista de verificación para la efectividad de los directorios.Fuentes de información.Lecturas recomendadas.	t	\N
1000462	Administración	Cadena de Suministros. Guía para una gestión exitosa.	David Jacoby	\N	\N	\N	978-612-4069-22-2	Producciones cantabria S:A	ADMINISTRACIÓN	Español	GUÍA	2830 paginas	Primera	Lima	2010	\N	t	\N
1000463	Administración	MBA"Estrategia de gestión"	Daniel F. Spulber	\N	\N	\N	978-84-96998-41-4	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	90 paginas	Primera	Barcelona	2010	\N	t	\N
1000464	Administración	MBA "Macroeconomía en la empresa"	Peter Navarro	\N	\N	\N	978-84-96998-42-1	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	2828 paginas	Primera	Barcelona	2010	Macroecnomía en el mundo real de la empresa. Las diferentes escuelas de macroeconomía. Definición del siglo economico PIB. Gestión del ciclo economico según la teoria. Gestion del ciclo economico según la práctica.	t	\N
1000465	Administración	MBA "Posicionamiento de marca"	Richard J. Lutz y Barton A. Weitz	\N	\N	\N	978-84-96998-48-3	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	2827 paginas	Primera	Barcelona	2010	\N	t	\N
1000466	Administración	MBA "Gestión de operaciones"	Steven Nahmias	\N	\N	\N	978-84-96998-44-5	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	2826 paginas	Primera	Barcelona	2010	\N	t	\N
1000467	Administración	MBA "Contabilidad financiera"	Leslie K. Breitner	\N	\N	\N	978-84-96998-45-2	Bresca Editorial	CONTABILIDAD	Español	LIBRO	110 paginas	Primera	Barcelona	2010	\N	t	\N
1000468	Administración	MBA "Contabilidad de gestión"	Peter Navarro	\N	\N	\N	978-84-96998-46-9	Bresca Editorial	CONTABILIDAD	Español	LIBRO	110 paginas	Primera	Barcelona	2010	\N	t	\N
1000469	Administración	MBA "Finanzas corporativas"	Stephen A. Ross, Randolph W. Westerfield y Jeffrey F. Jaffe	\N	\N	\N	978-84-96998-47-6	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	111 paginas	Primera	Barcelona	2010	\N	t	\N
1000470	Administración	MBA "Liderazgo y recursos humanos"	Steven L. McShane y Mary Ann Von Glinow	\N	\N	\N	978-84-96998-48-3	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	2822 paginas	Primera	Barcelona	2010	Comportamiento y procesos individuales. Equipo y liderazgo. Procesos empresariales. El departamento de RRHH. Buenas practicas y bench marketing en recursos humanos. Ranking de mejores empresas para trabajar.	t	\N
1000471	Administración	MBA "Decisiones y estadísticas"	Charles P. Bonini	\N	\N	\N	978-84-96998-49-0	Barcelona	ADMINISTRACIÓN	Español	LIBRO	111 paginas	Primera	Barcelona	2010	Análisis estratégico y evolución de datos. Análisis de las decisiones y el riesgo. Formulación de modelos y análisis. La importancia de la ecometría de la toma de decisiones. Toma de decisiones y evaluación de estrategias empresariales.	t	\N
1000472	Administración	MBA "Microeconomía para directivos"	Peter Navarro	\N	\N	\N	978-84-96998-50-6	Bresca Editorial	ADMINISTRACIÓN	Español	LIBRO	111 paginas	Primera	Barcelona	2010	\N	t	\N
1000473	Administración	MBA "Resolución de conflictos"	Lluís Casado y Tino Prat	\N	\N	\N	978-612-300-061-5	Punto y coma editores S.A	ADMINISTRACIÓN	Español	LIBRO	152 paginas	Primera	Lima	2010	El conflicto en las organizaciones. El mapa de conflict mentoring. Afrontar el conflicto.	t	\N
1001412	\N	Diálogo T1	\N	\N	\N	\N	\N	Cuantica Editora S.A.	ENCICLOPEDIA	Español	LIBRO	1880 paginas	\N	\N	\N	\N	t	\N
1000474	Administración	MBA "Plan de negocio"	Wallace Stettinius-D. Robley Wood Jr.-Jacqueline L. Doyle-John L. Colley Jr	\N	\N	\N	978-612-300-045-5	Punto y coma editores S.A	ADMINISTRACIÓN	Español	LIBRO	107 paginas	Primera	Lima	2010	\N	t	\N
1000475	Administración	MBA "Cómo mejorar el rendimiento"	Robert Bacal	\N	\N	\N	978-612-300-044-8	Punto y coma editores S.A	ADMINISTRACIÓN	\N	\N	2817 paginas	Primera	\N	2010	\N	t	\N
1000476	Administración	MBA "Habilidades personales en los negocios"	Allan y Bárbara Pease	\N	\N	\N	978-612-300-060-8	Punto y coma editores S.A	ADMINISTRACIÓN	Español	LIBRO	125 paginas	Primera	Lima	2010	\N	t	\N
1000477	\N	Negocios son negocios	Daniel Muchnik	\N	\N	\N	958-04-6198-8	Norma	ADMINISTRACIÓN	Español	LIBRO	2815 paginas	Segunda	colombia	2001	\N	t	\N
1000478	\N	Microempresas de confección. Una aproximación	Aconsur	\N	\N	\N	\N	Coperazíone	ADMINISTRACIÓN	\N	\N	2814 paginas	Primera	\N	1997	\N	t	\N
1000479	Cristianismo	Consultoría de procesos: Su papel en el desarrollo organizacional	Sshein Edgar	\N	\N	\N	\N	Fondo Educativo Interamericano	Relaciones industriales	Español	Libro	2813 paginas	Primera	México	1969	\N	t	\N
1000480	\N	Dirección de marketing	Philip Kotler / Kevin Lane Keller	\N	\N	\N	978-607-32-1245-8	Editorial Edamsa Impresiones	ADMINISTRACIÓN	Inglés	LIBRO	2812 paginas	Decimocuarta Edición	México	2012	\N	t	\N
1000481	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2811 paginas	\N	Arequipa	2010	\N	t	\N
1000482	\N	Curso de mercadotecnia	Carl Mcdaniel Jr.	\N	\N	\N	968-6034- 60-9	HARLA	ADMINISTRACIÓN	Español	LIBRO	2810 paginas	Segunda Edición	Nueva York	1986	\N	t	\N
1000483	\N	Marketing según Kotler (Cómo crear, ganar y dominar los mercados)	Federico Villegas	\N	\N	\N	84-493-0754-6	Editorial Paidós	ADMINISTRACIÓN	\N	\N	2809 paginas	Primera Edición	\N	1999	\N	t	\N
1000484	\N	Marketing directo	Frank Jefkins	\N	\N	\N	84-368-0801-0	Ediciones Pirámide	ADMINISTRACIÓN	Español	LIBRO	2808 paginas	Primera Edición	\N	1994	\N	t	\N
1000485	Adminitración 	Marketing (Las herramientas más novedosas)	Patrick Forsyth	\N	\N	\N	978-612-4069-19-2	the Economist	MARKETING	Español	LIBRO	2807 paginas	Primera Edición	Lima	2010	\N	t	\N
1000486	\N	Enciclopedia práctica de Economía	Federico Segura Roda	\N	\N	\N	84-7530-170-3	Editorial ORBIS	ADMINISTRACIÓN	Español	ENCICLOPEDIA	2806 paginas	Primera Edición	Barcelona	1983	\N	t	\N
1000487	\N	Sociedad Nacional de Minería Petróleo y Energía	Sociedad Nacional de Minería,Petróleo y Energía.	\N	\N	\N	98-165 (Depósito Legal)	Industria Gráfica Cimagraf	Economía	Español	LIBRO	2805 paginas	Primera Edición	Lima	2017	\N	t	\N
1000488	\N	Ni Emires ni Ayatollahs (Los orígenes de un conflicto político cultural y la actualidad de la guerra entre Irak e Irán)	Bechir Boumaza	\N	\N	\N	84-7490-109-X	Ediciones Encuentro	HISTORIA	Español	LIBRO	2804 paginas	Primera Edición	Madrid	1984	\N	t	\N
1000489	\N	Economía y salud (Fundamentos y Políticas)	Guillem López i Casasnovas / Vicente Ortún Rubio	\N	\N	\N	84-7490-467-6	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2803 paginas	Primera Edición	Madrid	1998	\N	t	\N
1000490	\N	Después de Maastricht, ¿qué?	José Barea y Maite Barea	\N	\N	\N	84-7490-507-9	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2802 paginas	Primera Edición	Madrid	1998	\N	t	\N
1000491	\N	Inmigración en las fronteras de la Unión Europea	Alejandro Lorca / Marcos Alonso / Luis Antonio Lozano	\N	\N	\N	84-7490-453-6	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2801 paginas	Primera Edición	Madrid	1997	\N	t	\N
1000492	\N	Privatización de la empresa pública	Álvaro Cuervo	\N	\N	\N	84-7490-461-7	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2800 paginas	Primera Edición	Madrid	1997	\N	t	\N
1000493	Administración	Economía de hoy	Matthew Bishop	\N	\N	\N	978-612-4069-18-5	The Economist	ADMINISTRACIÓN	Español	LIBRO	336 paginas	Primera Edición	Lima	2010	\N	t	\N
1000494	\N	Economía moderna (Características,hechos y protagonistas)	The economist	\N	\N	\N	978-987-1456-23-9	Simon cox	ADMINISTRACIÓN	Español	LIBRO	2798 paginas	Primera Edición	Lima	2008	El nuevo liberalismo.El argumento de la globalización.La torcida economía mundial.La falsa recuperación.Los desequilibrios de EE.UU.El surgimiento de China.Los resagados.Las arterias del capitalismo.Finanzas.Bancos centrales.Globalización del capital.Filosofía mundana.Los usos y abusos de la economía.	t	\N
1000495	\N	Análisis de los indicadores económicos	The economist	\N	\N	\N	978-987-1456-19-2	El Comercio	ADMINISTRACIÓN	Español	LIBRO	2797 paginas	Primera Edición	Buenos Aires	2008	Interpretación de los indicadores económicos. Mecanismos básicos. Medición de la actividad económica. Crecimiento: Tendencia y ciclos. Población, empleo y desempleo. Indicadores fiscales. Consumidores. Inversiones y ahorros. Industria y comercio. La balanza de pagos. Tasa de cambios. Dinero y mercado financiero. Precio y salarios.	t	\N
1000496	Administracion	El Malestar en la globalización	Joseph E.Stiglitz	\N	\N	\N	950-511-789-2	Editorial Taurus	ADMINISTRACIÓN	Español	LIBRO	 350 paginas	Primera Edición	Buenos Aires	2002	\N	t	\N
1000497	\N	Atlas de Economía. El comercio en la era Global	Rafael Marfil	\N	\N	\N	978-84-342-3613-4	Parramón Ediciones S.A	ADMINISTRACIÓN	Español	LIBRO	2795 paginas	Primera Edición	Barcelona	2010	\N	t	\N
1000498	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2794 paginas	\N	Arequipa	2010	\N	t	\N
1000499	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2793 paginas	\N	Arequipa	2010	\N	t	\N
1000500	\N	Presente y futuro de las pensiones en España	Maximino Carpio / Eugenio Domingo	\N	\N	\N	84-7490-386-6	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2792 paginas	Primera Edición	Madrid	1996	\N	t	\N
1000501	\N	Unión económica y monetaria. La UEM en entredicho	Emilio Untiveros / Francisco José Valero	\N	\N	\N	84-7490-400-5	Ediciones Encuentro	ADMINISTRACIÓN	Español	LIBRO	2791 paginas	Primera Edición	Madrid	1996	\N	t	\N
1000502	\N	Viabilidad de América Latina	Manuel Ulloa / Jorge Morelli S. / Jaime de Althaus	\N	\N	\N	\N	Editorial Lumen S.A	ADMINISTRACIÓN	Español	LIBRO	2790 paginas	Primera Edición	Lima	1985	\N	t	\N
1000503	\N	Curso de dinámica para Líderes (Un entrenamineto práctico y sencillo para el trabajo en equipo)	P. Jorge Borán CSSp	\N	\N	\N	9972-05-009-02	Editorial Paulinas	ADMINISTRACIÓN	Español	Libro	155	Primera Edición	Lima	2004	\N	t	\N
1000504	\N	Rompa las reglas	William A.Cohen	\N	\N	\N	84-234-1860-X	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2788 paginas	Primera Edición	Barcelona	2002	\N	t	\N
1000505	\N	Secretos del éxito personal	John Tmperley	\N	\N	\N	84-234-1839-1	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2787 paginas	Primera Edición	Barcelona	2002	\N	t	\N
1000506	\N	101 métodos para generar ideas	T.R. Foster	\N	\N	\N	84-234-1874-X	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2786 paginas	Primera Edición	Lima	2002	\N	t	\N
1000507	\N	Decálogo de la excelencia	Jesús Mondría	\N	\N	\N	84-234-2177-5	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2785 paginas	Primera Edición	Lima	2003	\N	t	\N
1000508	\N	Arte de hablar en público	G. Janner	\N	\N	\N	84-234-0622-6	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2784 paginas	Primera Edición	Lima	2002	\N	t	\N
1000509	\N	Inteligencia del Líder	Tony Buzan / Tony Dottino / Richard Israel	\N	\N	\N	84-234-1676-3	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2783 paginas	Primera Edición	Lima	2003	\N	t	\N
1000510	\N	Uso eficaz del tiempo	José María Acosta	\N	\N	\N	84-234-2178-3	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2782 paginas	Primera Edición	Lima	1998	\N	t	\N
1000511	\N	Cómo convecer	Michael A. Gilbert	\N	\N	\N	84-234-1629-1	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	GUÍA	2781 paginas	Primera Edición	Lima	2003	\N	t	\N
1000512	\N	Cómo trabajar en equipo	Francesc Borrell	\N	\N	\N	84-234-2179-1	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	LIBRO	2780 paginas	Primera Edición	Lima	2003	\N	t	\N
1000513	\N	Comunicación escrita	William Himstreet / Wayne Baty	\N	\N	\N	84-234-0738-1	Ediciones Deusto S.A	ADMINISTRACIÓN	Español	GUÍA	2779 paginas	Primera Edición	Lima	2003	\N	t	\N
1000514	Administración	Coaching y mentoring	Jane Renton	\N	\N	\N	978-612-4069-24-6	El Comercio	ADMINISTRACIÓN	Español	LIBRO	214 paginas	Primera Edición	Lima	2010	\N	t	\N
1000515	Administración	Negociación y resolución de conflictos	Harvard Business Review	\N	\N	\N	84-234-1817-0	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2777 paginas	Primera Edición	Barcelona	2001	La gestión de las diferencias.El equipo que no funcionaba como tal.Cómo superar la guerra entre grupos.Ocho estrategias para negociar positivamente con un cliente difícil.Cómo convertir la negociación en una capacidad de la empresa.Cuando consultores y clientes chocan.Cinco formas de mantener los conflictos alejados de los contenciosos legales.La resolución alternativa de conflictos:Porque unas veces funciona y otras no.	t	\N
1000516	Administración	Comunicación eficaz	Harvard Business Review	\N	\N	\N	84-234-2227-5	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2776 paginas	Primera Edición	Barcelona	2000	\N	t	\N
1000517	Administración	Dirigir personas en la empresa	Harvard Business Review	\N	\N	\N	84-234-1682-8	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	296 paginas	Primera Edición	Barcelona	1999	\N	t	\N
1000518	Administración	Nuevas tendencias en marketing	Harvard Business Review	\N	\N	\N	84-234-2007-8	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	197 paginas	Primera Edición	Barcelona	2002	\N	t	\N
1000519	Administración	Iniciativa emprendedora	Harvard Business Review	\N	\N	\N	84-234--1681-X	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	234 paginas	Primera Edición	Barcelona	1999	Las preguntas que todo emprendedor ha de responder.Cómo confeccionar un excelente plan de negocio.Cómo elaboran los emprendedores estrategias que funcionan.¿Cuánto dinero necesita su nueva empresa de riesgo?Hitos para la planificacion exitosa.Estrategias y tácticas analizadas por un inversionista de capital riesgo.Financiación autogenerada:el arte de las empresas de nueva creación.Comercializar tecnología:lo que hacen las mejores empresas.Los autores.Índice alfabético.	t	\N
1000520	Administración	Liderazgo	Harvard Business Review	\N	\N	\N	84-234-1656-9	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	250 paginas	-------	Barcelona	1999	\N	t	\N
1000521	Administración	Estrategias de crecimiento	Harvard Business Review	\N	\N	\N	84-234-1658-5	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2771 paginas	Primera Edición	Barcelona	1999	Eliminar las imposiciones para conseguir un crecimiento notable.Innovación de valor:Lógica estratégica para un alto crecimiento de la empresa.Crecimiento mediante la adquisición de empresas:un enfoque nuevo.Diversificar o no diversificar.La empresa superviviente.Para hacer realidad la funció:Cómo integra GE capital de nuevas empresas.Aprovechar el valor de los servicios suplementarios.Aprovechar la cadena de valor virtual.	t	\N
1000522	Administración	Toma de decisiones	Harvard Business Review	\N	\N	\N	84-234-1856-1	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2770 paginas	Primera Edición	Barcelona	2002	La desición eficaz. Canjes equitativos: un método racional para adoptar soluciones de compromiso. La adoptación de desiciones humildes. Barreras interpersonales para vla adoptación de desiciones. ¿Puede analizar este problema? Cómo analizar ese problema? Las trampas ocultas de la adoptación de desiciones. Cuándo confiar en el instinto.	t	\N
1000523	Administración	Cómo medir el rendimiento de la empresa	Harvard Business Review	\N	\N	\N	84-234-1650-X	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2769 paginas	Primera Edición	Barcelona	2003	La información que los directivos necesitan realmente. Manifiesto sobre la medida de rendimiento. La actualización de todo el potencial del método del ABC. ¿Qué nivel tiene la rentabilidad de su gestión? Cómo ayudan a destacar a los equipos las medidas adecuadas. El cuadro de mando integral: medidas que impulsan el rendimiento. Cómo poner el cuadro de mando integral en funcionamiento. La utilización del cuadro del mando integral como sistema estarégico de gestión.	t	\N
1000524	Administración	Gestión del cambio	Harvard Business Review	\N	\N	\N	84-234-1818-9	Editorial Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	2768 paginas	Primera Edición	Barcelona	2000	\N	t	\N
1000525	\N	La meta	Eliyahm M. Goldratt y Jeff Cox	\N	\N	\N	968-6635-34-3	Castillo	ADMINISTRACIÓN	Español	LIBRO	2767 paginas	Segunda	\N	1993	\N	t	\N
1000526	Cristianismo	El Poder del Carisma	Miguel Angel Cornejo	\N	\N	\N	968-6210-10-5	Editorial Grand	Literatura	Español	LIBRO	123 paginas	Séptima	Mexico	1996	\N	t	\N
1000527	\N	Liderazgo al estilo de los Jesuitas	Chris Lowney	\N	\N	\N	978-958-45-0667-2	Editorial Norma	ADMINISTRACIÓN	\N	\N	2765 paginas	Primera	\N	2008	\N	t	\N
1000528	Administración	Mujeres en el sistema Financiero	Maria Isabel Talledo Arana	\N	\N	\N	9972-9760-1-7	Ediciones Atenea	ADMINISTRACIÓN	Español	Libro	112	Primera	San Jose	2011	Socorro Acuña Otero.Carlota Arce Torres. Marita Venavides Ferreiros. Yanina Caceres Monroe.Marylin Choy Chong.Claudia Cooper Fort. Claridad de la Puente Wiese. Ana Rocio del Carpio Cuba. Maria Graciela Elejalde Franco. Alicia Franco Temple. Jacinta Hamann. Maria Jesus Hume Hurtado. Ana Gimenes Diaz. Lorena Masias Quiroga. Roxana Percyvale Rivero. Maria del Pilar Ruiz Oblitas. Laura Rumiche Briceño. Elizabeth Ventura Egoavil. Maria del Milagro Zegarra Lei.	t	\N
1000529	Administracion	Gestión de riesgos exógenos en instituciones financieras que sirven a los sectores más vulnerables de la población	Ligia María Castro Monge	\N	\N	\N	\N	-	ADMINISTRACIÓN	Español	\N	2763 paginas	Primera	\N	2011	\N	t	\N
1000530	Administracion	Administración financiera	Robert W. Johnson	\N	\N	\N	968-26-0021-9	Ediciones Allyn and Bacon	ADMINISTRACIÓN	Español	LIBRO	2762 paginas	Primera	-	1980	\N	t	\N
1000531	Administracion	Comunicación con números	Richard Stutely	\N	\N	\N	978-612-4069-25-3	Producciones Cantabria S.A.C	ADMINISTRACIÓN	Español	LIBRO	2761 paginas	Primera	Lima	2010	\N	t	\N
1000532	Administracion	Guía esencial de inversiones	Philip Ryland	\N	\N	\N	978-612-4069-15-4	El comercio S.A.	ADMINISTRACIÓN	Español	GUÍA	272 paginas	Primera	Lima	2010	Pasado y futuro de las inversiones.A-Z.Retornos de los mercados de acciones.Comportamiento de los mercados de acciones.Retorno de los bonos del gobierno e inflación.Los mercados de acciones líderes del mundo, fines del 2008.Fórmulas de inversion.Lecturas recomendadas.	t	\N
1000533	\N	Estrategia de inversión	Peter Stanyer	\N	\N	\N	978-612-4069-16-1	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	2759 paginas	Primera	Lima	2010	\N	t	\N
1000534	Administración	Gestión financiera	John Tennent	\N	\N	\N	978-612-4069-20-8	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	287 paginas	Primera	Lima	2010	Prefacio.Definición de negocios exitosos.Estructuras comerciales.El rol del departamento de finanzas.Estados financieros y sistemas contables.Conceptos y principios contables.Inversores.Costos del servicio.Precios del producto y rentabilidad.Gestión de la cartera.Evaluación de la inversión.Planificación, presupuesto e información del negocio.Coeficientes y métricas operativos.Mercados accionarios y medidas del inversor.Gestión del capital de trabajo.Informes y estados contables publicados.Complejidades contables.Glosario de términos contables.Referencias.	t	\N
1000535	\N	Cumbre nacional de microfinanzas	Maritza Fattorini / José Granados	\N	\N	\N	249-9158-2	Editorial Cecosami	ADMINISTRACIÓN	Español	LIBRO	2757 paginas	Primera	Lima	1998	\N	t	\N
1000536	\N	Atlas de Matemáticas. Entre la abstracción y lo cotidiano.	Rafael Marfil	\N	\N	\N	978-84-342-3605-9	Parramón ediciones S.A	MATEMÁTICA	Español	LIBRO	2756 paginas	Segunda	Barcelona	2010	\N	t	\N
1000537	\N	Gestión de la complejidad en las organizaciones	Jorge R. Etkin	\N	\N	\N	970-613-089-6	Oxford University Press	ADMINISTRACIÓN	\N	\N	2755 paginas	Primera	\N	2003	\N	t	\N
1000538	\N	La Gerencia (Tareas, responsabilidades y prácticas)	Peter F. Drucker	\N	\N	\N	\N	Editorial "El Ateneo"	ADMINISTRACIÓN	\N	\N	2754 paginas	Cuarta	\N	1981	\N	t	\N
1000539	\N	El arte de gobernar según Peter Drucker	Guido Stein	\N	\N	\N	84-8088-377-4	Gestión 2000 S.A	ADMINISTRACIÓN	Español	LIBRO	2753 paginas	Primera	Barcelona	1999	\N	t	\N
1000540	\N	Gerencia para el fururo	Peter Drucker	\N	\N	\N	958-04-2144-7	Norma S.A	ADMINISTRACIÓN	Español	LIBRO	2752 paginas	Primera	Nueva York	1992	\N	t	\N
1000541	formacion humana 	Sistematización de experiencias en la gestión de riesgos	Miembros del Comité Directivo Gride Sur	\N	\N	\N	\N	Oxfam América	ADMINISTRACIÓN	Español	libro	115paginas	Primera	arequipa	2006	\N	t	\N
1000542	formacion humana 	Sistematización de experiencias en la gestión de riesgos	Miembros del Comité Directivo Gride Sur	\N	\N	\N	\N	Oxfam América	ADMINISTRACIÓN	Español	libro	115 paginas	Primera	arequipa	2006	\N	t	\N
1000543	formacion humana 	Sistematización de experiencias en la gestión de riesgos	Miembros del Comité Directivo Gride Sur	\N	\N	\N	\N	Oxfam América	ADMINISTRACIÓN	Español	libro	115 paginas	Primera	arequipa	2006	\N	t	\N
1000544	Administración	10 Tecnologías que están cambiando el mundo de los negocios	Semana Económica (Revista)	\N	\N	\N	\N	Editorial Perú Económico	INFORMÁTICA	Español	REVISTA	101 paginas	Primera	\N	2015	\N	t	\N
1000545	\N	Sintonizando al candidato	Semana Económica (Revista)	\N	\N	\N	\N	Editorial Perú Económico	Economía	Español	REVISTA	2747 paginas	Primera	\N	2015	\N	t	\N
1000546	Administraciòn	Guía de negocios e inversión en el Perú (2015-2016)	Proinversión	\N	\N	\N	\N	Editorial Ey Perú	ADMINISTRACIÓN	Español	REVISTA	263 paginas	Primera	Lima	2016/2017	\N	t	\N
1000547	\N	Consultoría de negocios	Gilbert Toppin y Fiona Czerniawska	\N	\N	\N	978-987-1456-22-2	El comercio	ADMINISTRACIÓN	Español	LIBRO	2745 paginas	Primera	Lima	2008	\N	t	\N
1000548	Administracion	Miscelánea de negocios	---------------------------------------	\N	\N	\N	978-987-1456-24-6	El comercio S.A.	ADMINISTRACIÓN	Español	LIBRO	2744 paginas	Primera	Lima	2008	Las empresas en sus inicios.Las empresas familiares mas antiguas.Los periódicos mas antiguos que aún se encuentran en la circulación.La prensa de negocios.Las empresas mas grandes del mundo.Las empresas mas grandes de EE.UU.Las empresas grandes, grandes hechos.Detrás de la marca.Las mas grandes IPOs.Las quiebras mas grandes de los EE.UU.Privatizaciones.Fiascos en los negocios.Billetes grandes.Las marcas mas valiosas del mundo.Las empresas más admiradas del mundo.Las empresas más admiradas de Gran Bretaña.Lo que las empresas dicen de sí mismas.Gobierno corporativo:Estilos de directorio.Los juegos que practican los directores.Ciclos comerciales.Comienzos y fracasos de los negocios.Días y procedimientos para comenzar un  negocio.Corrupción:percepción en los negocios.Coeficiente útil para los negocios.Costos de los negocios.El derrumbe de la fuerza laboral.La fuerza laboral cambiante.Cambios en horas laborables.Cambios en la edad de jubilación.Días perdidos en huelgas de empleados y huelgas de la patronal.Poder de los sindicatos.Federaciones de sindicatos.Grandes sindicatos.Salarios internacionales comparados.Salario mínimo y salario promedio.Salario del director ejecutivo en EE.UU.Salario del director ejecutivo en el Reino Unido.Cantidad de contadores.Principales estudios contables.Un mundo de abogados.Principales estudios jurídicos.Las mujeres en los negocios.Tercerización nacional e internacional.Rascacielos.Grandes centros comerciales.Principales headhunters.Principales mentiras de los CV.Principales agencias de publicidad.Gastos de publicidad.Algunos tributos publicitarios.Tres desaciertos publicitarios.Algunos slogans publicitarios famosos.Grandes empresarios del pasado.La filantropía y el sector que no produce ganancias.Las personas más adineradas.Presidentes de bancos centrales desde 1900.Con sus propias palabras.Muchos badboys...y una chica mala.Principales pecadores del management.Los mercados de valores mas antiguos.Principales mercados de valores.Explicaión de los índices de algunos mercados de valores.Rendimiento del mercado de valores.Mercado de valores:los mejores y los peores momentos.La hora del mercado de valores.Bonos.Burbujas que explotaron.Reservas y precios del petróleo.Reservas y  precios del oro.Hechos relacionados con el oro.Productores ricos.Hechos relacionados con el diamante y el platino.El mercado de divisas.Capital de riesgo.Hedge funds.Fórmulas de inversión.Detrás del nombre de la divisa.Las monedas y los billetes más antiguos.Más superlativos de dinero.Billetes y monedas en circulación.Euros impresos.La  vida de los billetes de USD y .Tipos de cambio.Divisas locales frente al dólar.Fijación de la tasa de cambio.Algunas devoluciones notables.La cambiante economía mundial.Principales exportadores.Dependencia comercial.Inversión extranjera directa.Envíos de dinero al hogar.Tasa de interés.Tasa de interés empresarial.Impuestos que pagan las empresas.Impuestos que pagan los particulares.Cómo fijar impuestos para las personas con los más altos ingresos.IVA y tasas de impuestos a las ventas.Riqueza y deudas.Atracciones en el extranjero.Grandes libros de negocios.Lo que esconde una palabra.El latín que prefieren los abogados.Nombres de marcas que incorporó el idioma.Siglas:toda una elección."Jerga" de negocios.Principios y leyes de negocios.Principales escuelas de negocios.Algunos estilos de management.Asistentes digitales.Computadores portátiles y de escritorio.El poder del chip.El impacto de la piratería de los programas de computación.Spam y correo electrónico.Sufijos de internet.La vida empresarial en las alturas.Grandes aerolíneas.Datos de aeropuertos.Viajar con millaje de premio.¡Barco a la vista!¿La era del tren?El poder del pedal.Inventores e invensiones.Patentes famosas.Consejos útiles para los negocios de etiqueta.	t	\N
1000549	\N	Estrategia de negocio	Michel Syrett	\N	\N	\N	978-612-4069-16-1	Producciones Cantabria S.A.C	ADMINISTRACIÓN	Español	LIBRO	2743 paginas	Primera	Lima	2010	Crear las condiciones. El problema definido: La visión sin ejecución no significa nada. Mirar hacia atrás: British Airways. Mirar hacia atrás: General Electric. Mirar el presente: Domaine Chandon. Mirar el presente: Los Ejemplos de casos en este libro. Fricción. General Electric: transformar el eslogan en mantra en la Hungría de la década de 1990. Pfizer: ocuparse de la discordancia. Fricción, el origen militar. Fricción: la versión de negocio.. Estrategia: el rol clave de la línea. De la fricción al enfoque. Enfoque. Luxfer Gas Cylinders: más allá de la exelencia operacional. Concentrarse en los "puntos clave". Domaine Chandon: del enfoque a la claridad. Lipper: la claridad como fundamento. Pfizer: reacomodar sus equipos. Delegación y poderes discrecionales: la esencia del mando militar. De la claridad a la comunicación. Comunicación. Diageo Moët Hennessy Japón: las palabras realmente importan. Comunicación o consulta: las nuevas realidades. IBM: test marketing de nuevos valores. Redes, no jerarquías: el nuevo imperativo social. Reuters: transformación corporativa de avance rápido. Conducta. Luncheon Vouchers en 1989: crear un entorno competitivo. La conducta y cómo se forja. Deutsche Bank y el compromiso del empleado: una nueva área de riesgo. Conducta: el desafío de ejecución de la estratégia. Entrenamiento y apoyo personal: la agenda del aprendizaje. Apoyo de consultoría interno y externo: la agenda cambiante. De la capacitación a la medición. Medición. HSBC Rail (Reino Unido): diagramar el futuro por medio de la cartografía corporativa. Herramienta de medición estratégica 1: el mapa de la estrategia. Ejecución de la estrategia: la importancia de las medidas de rendimiento efectivo. Herramienta de medición estratégica 2: el cuadro de mando integral. British Telecom: alinear los recursos humanos con la estrategia del negocio. Herramienta de medición estratégica 3: el panel de información de la misión. Thomson Financial: usar medidas claras para lograr un gran rendimiento. De la medición al liderazgo. Liderazgo. Seis roles de liderazgo para la ejecución exitosa de la estrategia. Infundir enfoque y claridad. Generar compromiso y participación. Asignar recursos escasos. Crear los hitos correctos de logro. Fomentar la colaboración. Administrar el ritmo. Cambio. Reuters: hacer cambios si las circunstancias lo exigen. Management de cambio de la estratégia: el nuevo contexto. Administrar la incertidumbre: una nueva disciplina de management. Innovación. East African Breweries: explorar los lazos entre la claridad y la creatividad. La necesidad subyacente y el deseo de innovación. Mirar debajo de la superficie.Goldman Sachs: llevar los cambios de rumbo a la superficie de modo tal que apoyen la estrategia. El camino. Un camino hacia la ejecución exitosa de la estrategia. Management de cambio efectivo: una espiral virtuosa. Management de cambio ineficienete: una espiral viciosa.	t	\N
1000550	\N	Negociación	Gavin Kennedy	\N	\N	\N	978-612-4069-23-9	Producciones Cantabria S.A.C	ADMINISTRACIÓN	Español	LIBRO	2742 paginas	Primera	Lima	2010	\N	t	\N
1000551	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2741 paginas	\N	Arequipa	2010	\N	t	\N
1000552	\N	Véritas "Investigación, innovación y desarrollo"	Luis Alberto Ponce	\N	\N	\N	1684-7822	Centro de Impresiones y Publicaciones de la UCSM	ADMINISTRACIÓN	\N	\N	2740 paginas	Primera	\N	2014	\N	t	\N
1000553	\N	Revista de Investigación	Raúl Jáuregui Mercado / Maria Luisa Belón Hidalgo / Iván Montes Iturrizaga / Entre Otros	\N	\N	\N	2307-2660	Fondo Editorial	ADMINISTRACIÓN	\N	\N	2739 paginas	Primera	\N	2012	\N	t	\N
1000554	Administración	Investigación Científica en el Horizonte de la racionalidad abierta a la trascendencia	Juan Roger Rodriguez Ruíz	\N	\N	\N	2222-3060	Imprenta Editora Gráfica Real	ADMINISTRACIÓN	Español	LIBRO	211	Primera	Chimbote	2013	\N	t	\N
1000555	Administración	Investigación Científica en el Horizonte de la racionalidad abierta a la trascendencia	Juan Roger Rodriguez Ruíz	\N	\N	\N	2222-3061	Imprenta Editora Gráfica Real	ADMINISTRACIÓN	Español	LIBRO	211	Primera	Chimbote	2013	\N	t	\N
1000556	Administración	Investigación Científica científica contribuye al desarrollo pleno del ser humano	Juan Roger Rodriguez Ruíz	\N	\N	\N	2307-5261	Imprenta Editora Gráfica Real	ADMINISTRACIÓN	Español	LIBRO	407	Primera	Chimbote	2014	\N	t	\N
1000557	\N	Metodología de la investigación	Roberto Hernandéz Sampieri	\N	\N	\N	978-1-4562-2396-0	Mc Graw Hill Education	INVESTIGACIÓN	Español	LIBRO	2735 paginas	Sexta Edición	México	2014	\N	t	\N
1000558	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2734 paginas	\N	Arequipa	2010	\N	t	\N
1000559	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2733 paginas	\N	Arequipa	2010	\N	t	\N
1000560	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2732 paginas	\N	Arequipa	2010	\N	t	\N
1000561	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2731 paginas	\N	Arequipa	2010	\N	t	\N
1000562	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2730 paginas	\N	Arequipa	2010	\N	t	\N
1000563	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2729 paginas	\N	Arequipa	2010	\N	t	\N
1000564	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2728 paginas	\N	Arequipa	2010	\N	t	\N
1000565	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2727 paginas	\N	Arequipa	2010	\N	t	\N
1000566	\N	Actualidad Laboral	Instituto Pacífico S.A.C	\N	\N	\N	1818-2143	Pacífico Editores	ADMINISTRACIÓN	Español	PIONER	2726 paginas	Primera	Lima	2011	\N	t	\N
1000567	\N	Actualidad Contable	Instituto Pacífico S.A.C	\N	\N	\N	1818-2143	Pacífico Editores	CONTABILIDAD	Español	PIONER	2725 paginas	Quinta Edición	Lima	2012	\N	t	\N
1000568	\N	Actualidad Tributaria	Instituto Pacífico S.A.C	\N	\N	\N	1818-2144	Pacífico Editores	CONTABILIDAD	Español	PIONER	2724 paginas	Primera	Lima	2011	\N	t	\N
1000628	\N	María sombra de Gracia	Megan McKenna	\N	\N	\N	84-293-1345-1	Editorial Sal Terrae	FORMACIÓN HUM	Español	LIBRO	2664 paginas	Primera	\N	1995	\N	t	\N
1000569	administracion	Manual de infracciones y sanciones tributarias 2010	Fernando Effio Pereda	\N	\N	\N	978-612-45835-1-3	Real time E.I.R.L	CONTABILIDAD	Español	LIBRO	494 paginas	Primera	Lima	2010	\N	t	\N
1000570	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2722 paginas	\N	Arequipa	2010	\N	t	\N
1000571	ADMINISTRACION	Nuevo plan contable general empresarial	Jaime Flores Soria / Fernando Effio Pereda	\N	\N	\N	978-603-45229-8-5	Real time E.I.R.L	CONTABILIDAD	Español	LIBRO	396 paginas	Primera	Lima	2008	\N	t	\N
1000572	ADMINISTRACION	Sistemas de detracciones, retenciones y percepciones. Procesos recaudatorios del IGV.	Insituto Pacífico S.A.C	\N	\N	\N	978-612-4118-37-1	Pacífico Editores S.A.C	CONTABILIDAD	Español	LIBRO	318 paginas	Primera	Lima	2012	\N	t	\N
1000573	\N	Gastos deducibles. Análisis tributario y contable.	CP.CC José Luis García CP.C Edison Gonzales Peña	\N	\N	\N	978-612-4118-19-7	Pacífico Editores S.A.C	CONTABILIDAD	Español	LIBRO	2719 paginas	Primera	Lima	2012	\N	t	\N
1000574	\N	Contabilidad y negocios (2009)	Óscar Díaz Becerra	\N	\N	\N	1992-1896	Fondo Editorial PUCP	CONTABILIDAD	Español	REVISTA	2718 paginas	Primera	Lima	2009	Editorial 3. Contabilidad de gestión. Propuesta de un procedimiento para el proceso de planificación del inventario en el hotel herradura. Banca y finanzas riesgos financieros despues de las crisis subprime. Microfinanzas:diagnósticos del sector de la micro y pequeña empresa y su tecnología crediticia. Administración . En el enfoque transaccional en los límites de la empresa. La evaluación del desempeño, como la percepción de justicia y las reacciones de los empleados. Metodología para implementar un modelo de responsabilidad social empresarial (RSE) en la industria de la curtiembre en Colombia. Formación profesional. L aeducación continua con proceso de formación académica de los alumnos egresados de las instituciones de educación superior en el estado de sorana (México). Colaboradores.	t	\N
1000575	adnimistracion	Manual Practico laboral	Oscar H. Bernuy Alvarez	\N	\N	\N	978-603-45229-1-6	Real time E.I.R.L	CONTABILIDAD	Español	LIBRO	2717 paginas	Primera	Lima	2008	\N	t	\N
1000576	\N	Manual laboral	Oscar H. Bernuy Alvarez	\N	\N	\N	978-612-45414-1-4	Real time E.I.R.L	CONTABILIDAD	\N	\N	2716 paginas	\N	\N	\N	\N	t	\N
1000577	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2715 paginas	\N	Arequipa	2010	\N	t	\N
1000578	Administración	Auditoría Tributaria	Victor Vargas Calderon/ Marysol LeónHuayanca	\N	\N	\N	978-612-309-032-6	Pacífico Editores	CONTABILIDAD	Español	LIBRO	740 paginas	Primera	Lima	1999	Auditoría tributaria y compulsa tributaria. Auditoria tributaria del impuesto a la renta. Auditoria tributaria integral. Casos piráticos integral.	t	\N
1000579	\N	Costa de Piura	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2713 paginas	\N	\N	\N	\N	t	\N
1000580	\N	Lambayeque y la Libertad ( surf y buseo)	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2712 paginas	\N	\N	\N	\N	t	\N
1000581	\N	Colan y alrededores (vida silvestre)	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2711 paginas	\N	\N	\N	\N	t	\N
1000582	\N	Islas, islotes y puntas guaneras del Perú	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2710 paginas	\N	\N	\N	\N	t	\N
1000583	\N	Lima y Callao, Costa Verde	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2709 paginas	\N	\N	\N	\N	t	\N
1000584	\N	Formación del Universo	Jaca Book M.	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2708 paginas	\N	\N	1984	\N	t	\N
1000585	\N	Formación del Universo	Jaca Book M.	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2707 paginas	\N	\N	1985	\N	t	\N
1000586	\N	Formación del Universo	Jaca Book M.	\N	\N	\N	\N	\N	CULTURA GRAL	\N	\N	2706 paginas	\N	\N	1986	\N	t	\N
1000587	Administración	Historia de la presidencia del Consejo de Ministros. Democracia y buen gobierno. T1	José Francisco Gálvez y Enrique Silvestre Gracía	\N	\N	\N	\N	Empresa Peruana de Servicios Editoriales S.A	POLÍTICA Y ESTADO	Español	LIBRO	2705 paginas	Primera	Lima	2016	\N	t	\N
1000588	Administración	Historia de la presidencia del Consejo de Ministros. Democracia y buen gobierno. T2	José Francisco Gálvez y Enrique Silvestre Gracía	\N	\N	\N	\N	Empresa Peruana de Servicios Editoriales S.A	POLÍTICA Y ESTADO	Español	LIBRO	2704 paginas	Primera	Lima	2016	\N	t	\N
1000589	Cristianismo	Contemplar la Navidad	Norberto Alcover	\N	\N	\N	84-285-2980-9	Editorial: "San Pablo"	TEOLOGÌA	Español	LIBRO	2703 paginas	Primera	Madrid	2006	Prefacio para caminar juntos. Adoración de los pastores Luca signorelli. La Navidad como oferta. Una pintura sintomática. Un largo camino a recorrer. Navidad para evangelizar. La gracia del conocimiento interno. Ecos del Concilio. Canciones del llamamiento a los pastores. Plegaria de gracia. Anunciación es Encarnación todo comenzó en Nazaret. La anunciación Fra Angelico. La tentación de finitud. La invitacion de Dios. La respuesta de María. La tentación de infinitud. Y la Palabra se hizo carne. Ecos de Concilio. Anunciación. Plegaria de humildad. La encarnación compartida. El encuentro con Isabel. La visitación Fra Angelico. Contemplación de Fra Angelico. Las razones de María embarazada. El discernimiento como plenitud. Ecos del Concilio. Visita a Isabel. Plegaria de compartir. La explosión de la plenitud. El nacimiento de Jesucristo. Escenas del nuevo testamento:el nacimiento,Giotto. El desvelamiento del disignio paternal. Como un pobrecito y esclavito indigno. La teología de Giotto. Las inspiraciones de Dios. Ecos del Concilio. Al Niño Dios. Plegaria de la carnalidad. Dios y el César en Belén. El misterioso decreto imperial. Natividad,Tadeo Gaddi. Dios en la historia humana. El reino de Dios como realidad histórica. La tención entre Dios y el César. El Reino se proyecta en la Iglesia. Ecos del Concilio. Nochebuena íntima. Plegaria del Reino. El lugar de la Plenitud.Belén de pobreza,soledad y marginilidad.Natividad,Giovanni de Milán. Los orígenes del cristianismo. El testimonio de Giovanni de Milán. La pobreza,la soledad. La marginación eclesiales. Sobre la pobreza anterior. Todo esto es esperanza. Ecos del Concilio. Vuelve la Navidad. Plegaria de la pobreza. Entre pastores y reyes. La adoración de los pastores y de los Magos. Adoración de los Magos,Giotto. ¿Qué tendrá ese niño recién nacido ? Las mediaciones de la revelación. Lo importante es Jesucristo. Un mismo Niño para contemplar. Ecos del Concilio. Epifanía. Plegaria de los signos. Matar al hombre es matar a Dios.Cuando. Herodes mata a los niños. La matanza de los inocentes,Giotto. La muerte aparece en Navidad. El problema de la realeza. Un fresco revelador. Sobre niños y daños colaterales. Matar al hombre es matar a Dios. Ecos de Concilio. Huida a Egipto y fantasía de la palmera. Plegaria de la niñez. Conservar la plenitud en el corazón. María.Virgen es María Madre. El nacimiento de Jesús,Federico Barocci. Elogio de la Virgen y de la Madre. La Mujer de la voluntad de Dios. Hacer memoria de Jesucristo. La plenitud de la mujer. Ecos del Concilio. Ingreso en el silencio. Plegaria de la maternidad. Navidad de muerte y de resurección. De Belén a la Presentación en el Templo. Presentación del Niño Dios,Luis de Morales.Salvador en cuanto que judío. La belleza de Luis de Morales. Las palabras de Simeón. Ecos del Concilio. Glosa de la purificación. Plegaria de Navidad pascual. La Iglesia,plenitud de la Navidad, misterio de pentecostés. Pentecostés, Juan Bautista Maino. La Navidad eclesial. El pentecostés de Juan Bautista Maino. La Navidad eclesial. El pentecostés de la Iglesia desde Maino. Pentecostés de pañales y de pesebre. Ecos de Concilio. Creando una vez más. Plegaria de Pentecostés. Conclusión. Desde Navidad, a la misión. Adoración de los pastores, Luca Signorelli. Ecos de Concilio. Del pastor ciego que abrió sus ojos a nueva vida. Plegaria de la misión.	t	\N
1000590	\N	Cristianismo en 50 lecciones	Teresio Bosco	\N	\N	\N	956-7433-88-7	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	LIBRO	2702 paginas	Primera	\N	1996	\N	t	\N
1000591	Cristianismo	La iglesia y la democratización de la comunicación.	Joana T. Puntel,fsp	\N	\N	\N	958-669-106-3	Paulinas	FORMACIÓN HUM	Español	LIBRO	296 paginas	Primera	Sao Paulo	1998	Por qué concentrarse a la Iglesia y en la Comunicación Alternativa?. Aproximación metodológia: Términos y parámetros Procedimiento. Itinerario de los capítulos. Capítulo I. La relación entre la Iglesia Católica y las Tecnologías de la Comunicación. Mirada al pasado. Vigilanti Cura-Apoyo a la legión  de la decencia en el cine. Miranda Prorsus: el primer gran documento de la Comunicación. El Concilio Vaticano II: Un punto de partida. Inter Mirifica - La aceptación oficial por parte de los medios de comuniación  para realizar un trabajo pastoral. Communio et Progressio: Más allá del Concilio. Capítulo II. Teología de la liberación - Una nueva manera de evangelizar. Perspectiva Histórica. La teología de la liberación: Una reflexión crítica.  La teología de la liberación: Interpretación de los términos.  La teología de la Liberación y la Crítica. Capítulo III. La iglesia Católica y la Comunicaión en América Latina. La iglesia Católica y la Comunicaión desde los orígenes. Radio educativa. MEB-Experiencia con las escuelas Radiofónicas. Medellín y Puebla. Comunicación Social y Cambios (1960-1969). Medios de comunicación y Desarrollo. Comunicación Social y Liberación (1970-1974). El significados de los "Minimedios". Comunicación Social y Nuevas situaciones. (1975-1979). - las perspectivas de Puebla. Comuniación Social: Desafíos de la Década del 80. Comunicación Grupal. Comunicación Popular -La comunicación de Pueblo. Capítulo IV: La Iglesia Católica y el nuevo orden mundial de la información y comunicación. ¿El debate de la NOMIC ya se acabó?. El pueblo: Nuevo Agente Socialde la NOMIC. La Iglesia apoya la igualdad de derechos a la información y a la comunicación. El Documento de Quito - El derecho de participar y de comunicar y la comunicación alternativa como opción para el Nuevo Orden. Comunicación Alternativa como opción para un Nueva Orden. El documento de Embu - La Democratización de la comunicación una "Mini-NOMIC" al interior de la misma iglesia. Embu y las Políticas de Comunicación Nacional. Embu: Una "Mini-NOMIC" dentro de la Iglesia. Capítulo V. El concepto de democratización de la comunicación. El "Derecho a Comunicar". Comunicación Alternativa: En el camino de la democratización de la comunicación. Comunicación Popular. Experiencias en el proceso participativo de la comunicación. La cuestión del "Proceso Participativo". Capítulo VI. La comunicación alternativa y los mass-media. Alternativas en la práctica (Dos casos estudiados en Brasil). Orígenes de las comunidades eclesiales de base (CEBs) en Brasil. Contexto religoso y socio-político de las CEBs. Comunidades eclesialesde base. Proceso de comunicación en las comunidades de base. Comunidad de base: Proceso de participación. Centro de comunicación de Sao Miguel - CEMI. CEMI: Actividades. Comunicacion Horizontal. Capítulo VII. Democratización de la comunicación un desafío para la Iglesia de América Latina (concluciones). Teología de la liberación: Su influjo en la Comunicación. Democratización al interior de la Iglesia. Bibliografía. Documentos. Periódicos y boletines. Apéndice I. NOMIC. Las naciones no-alineadas y el nuevo orden mundial de la información y de la comunicación. Noticias: La primera preocupación del debate de la NOMIC. La relación MacBride. Reacción de los Estados Unidos - El concepto de "Libertad de información". La UNESCO cambia su posición.	t	\N
1000592	Cristianismo	El evangelio como Promoción del Reino.	Marco Bonatti	\N	\N	\N	980-207-507-8	Torino	Cristianismo	Español	LIBRO	104 paginas	-	Caracas	1999	\N	t	\N
1000593	Cristianismo	Venid, adoremos	Maximiliano Calvo	\N	\N	\N	978-84-9842-293-1	Editorial CCS	Cristianismo	Español	LIBRO	214 paginas	Cuarta Edición	Madrid	2011	\N	t	\N
1000594	Cristianismo	Venid, adoremos	Maximiliano Calvo	\N	\N	\N	978-84-9842-293-1	Editorial CCS	Cristianismo	Español	LIBRO	214 paginas	Cuarta Edición	Madrid	2011	\N	t	\N
1000595	Cristianismo	Nueva Evangelización. Promoción humana cultura Cristiana	IV Conferencia General del Episcopado Latinoamericano	\N	\N	\N	1501032005-1552	Editorial Paulinas	cristianismo	Español	LIBRO	246 paginas	Primera Edición	Santo Domingo	2005	\N	t	\N
1000596	Cristianismo	Medellín (Conclusiones)	II Conferencia General del Episcopado Latinoamericano	\N	\N	\N	9972-05-030-0	Editorial Paulinas	Formación humana	Español	LIBRO	160 paginas	Octava Edición	Lima	2005	\N	t	\N
1000597	Cristianismo	Aparecida (Documento Final)	V Conferencia General del Episcopado Latinoamericano y de el Caribe	\N	\N	\N	978-958-625-653-7	Editorial Paulinas	Cristianismo	Español	LIBRO	298 paginas	Primera	Lima	2007		t	\N
1000598	Cristianismo	San Pablo "Vida, íconos y encuentros"	Teresa Groselj	\N	\N	\N	978-9972-05-071-8	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	109 paginas	Primera	Lima	2008	\N	t	\N
1000599	Cristianismo	Tú y yo crecemos en la fe	Anibal Altamirano Herrera/ Magdalena T. Cruz Herrera	\N	\N	\N	9972-05-053-X	Asociación hijas de San Pablo	RELIGION/TEOLOGIA	Español	LIBRO	222 paginas	Primera	Lima	2006	\N	t	\N
1000600	Cristianismo	Espíritu y palabra. Itinerario de Fe, servicio y amor	Maximiliano Calvo Ariño	\N	\N	\N	978-84-96281-30-1	Grafite Ediciones	RELIGION/TEOLOGIA	Español	LIBRO	154 paginas	Sexta Edición	baracaldo	2008	Adoración. Alabanza. Amor. Amor de Dios. Ángeles. Camino. Carne. Combate espiritual. Comunidad. Conversión. Crecimiento. Cruz. Descanso. Desierto. Diablo. Dios. Discernimiento. Discípulos de Jesucristo. Duda. Dureza de corazón. Enseñanza. Envidia. Escucha. Esperanza. Espíritu humano. Espíritu santo. Evangelización. Fe. Felicidad. Gloria de Dios. Gracia. Hijos de Dios. Hipocresía. Hombre. Humanismo. Humildad. Humillación. Iglesia. Intercesión. Jesucristo. Lengua. Ley. Libertad. Luz. Mente. Miedo. Misericordia. Misterio. Muerte. Mundo. Obediencia. Obras. Oración. Orgullo. Paciencia. Palabra. Palabra de Dios. Pastores. Paz. Pecado. Perdón. Perseverancia. Purificación. Reino de Dios. Relación con Dios. Relaciones fraternas. Resurrección. Sabiduría. Salvación. Santidad. Seguridades. Señorío de Cristo. Servicio. Silencio. Soledad. Sufrimiento. Tiempo. Transformación. Unidad. Verdad. Vida. Voluntad de Dios.	t	\N
1000601	Cristianismo	Espíritu y palabra. Itinerario de Fe, servicio y amor	Maximiliiano Calvo Ariño	\N	\N	\N	978-84-96-281-30-1	Grafite Ediciones	RELIGION/TEOLOGIA	Español	LIBRO	154 paginas	Sexta Edición	Baracaldo	2008	Adoración. Alabanza. Amor. Amor de Dios. Ángeles. Camino. Carne. Combate espiritual. Comunidad. Conversión. Crecimiento. Cruz. Descanso. Desierto. Diablo. Dios. Discernimiento. Discípulos de Jesucristo. Duda. Dureza de corazón. Enseñanza. Envidia. Escucha. Esperanza. Espíritu humano. Espíritu santo. Evangelización. Fe. Felicidad. Gloria de Dios. Gracia. Hijos de Dios. Hipocresía. Hombre. Humanismo. Humildad. Humillación. Iglesia. Intercesión. Jesucristo. Lengua. Ley. Libertad. Luz. Mente. Miedo. Misericordia. Misterio. Muerte. Mundo. Obediencia. Obras. Oración. Orgullo. Paciencia. Palabra. Palabra de Dios. Pastores. Paz. Pecado. Perdón. Perseverancia. Purificación. Reino de Dios. Relación con Dios. Relaciones fraternas. Resurrección. Sabiduría. Salvación. Santidad. Seguridades. Señorío de Cristo. Servicio. Silencio. Soledad. Sufrimiento. Tiempo. Transformación. Unidad. Verdad. Vida. Voluntad de Dios.	t	\N
1000602	\N	Signos en la sociedad	Osvaldo A. Dallera	\N	\N	\N	958-9419-55-0	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2690 paginas	Primera Edición	\N	1996	\N	t	\N
1000603	\N	Formación profesional y….¡Algo más!	Ángel Miranda	\N	\N	\N	84-8316-586-4	Editorial CCS	FORMACIÓN HUM	Español	LIBRO	2689 paginas	Primera	\N	2002	\N	t	\N
1000604	\N	¿A qué viene este silencio?	Alfredo Cenini	\N	\N	\N	84-293-1474-1	Editorial Sal Terrae	FORMACIÓN HUM	\N	\N	2688 paginas	Primera	\N	2001	\N	t	\N
1000605	\N	Desarrollo y crecimiento	Ezio Aceti	\N	\N	\N	956-7433-60-7	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2687 paginas	Primera	\N	1998	\N	t	\N
1000606	\N	Mediación escolar (Un camino para la gestión del conflicto escolar)	José Antonio San Martín	\N	\N	\N	84-8316-668-2	Editorial CCS	FORMACIÓN HUM	Español	LIBRO	2686 paginas	Primera	\N	2003	\N	t	\N
1000607	\N	La verdad, el amor y la rentabilidad	Gonzalo M. Casas Lazo	\N	\N	\N	9972-720-18-7	Edición a cargo del Instituto de Investigación	FORMACIÓN HUM	Español	LIBRO	2685 paginas	Primera	Lima	\N	\N	t	\N
1000608	\N	Comportamiento de los más pequeños	Sue Roffey y Terry O Reirdan	\N	\N	\N	84-277-1455-6	Narcea,S.a de Ediciones Madrid	FORMACIÓN HUM	\N	\N	2684 paginas	Primera	\N	2004	\N	t	\N
1000609	\N	Orar con los Iconos	Jim forest	\N	\N	\N	84-293-1447-4	Editorial Sal Terrae	LITURGIA	Español	LIBRO	2683 paginas	Primera	Santander	2002	\N	t	\N
1000610	Formacion humana	Creatividad y Educación	Marco Hernán Flores Velazco	\N	\N	\N	98-2579	Editorial "San Marcos"	FORMACIÓN HUM	Español	LIBRO	167	Primera	Lima	1998	\N	t	\N
1000611	Cristianismo	El espíritu del mundo	Maximiliano Calvo	\N	\N	\N	978-84-96281-99-8	Grafite Ediciones, S.L:	Formación humana	Español	LIBRO	226 paginas	Primera	Madrid	2010	\N	t	\N
1000612	Cristianismo	El espíritu del mundo	Maximiliano Calvo	\N	\N	\N	978-84-96281-99-8	Grafite Ediciones, S.L.	Formación humana	Español	LIBRO	226 paginas	Primera	Madrid	2010	\N	t	\N
1000613	Cristianismo	Revista del Archivo Arzobispal de Arequipa	Alvaro M. Espinoza de la Borda	\N	\N	\N	2409-9635	Talleres Gráficos de SCRIPT	Cristianismo	Español	LIBRO	251 paginas	Primera	Arequipa	2016	\N	t	\N
1000614	\N	Cantos de Libertad	Melina Gamarra del Castillo	\N	\N	\N	\N	Editorial Unsa	FORMACIÓN HUM	\N	\N	2678 paginas	Primera	\N	2010	\N	t	\N
1000615	\N	Formación de las virtudes Humanas y Sociales	P. Luis Alonso Orozco	\N	\N	\N	978-9972-05-115-9	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	2677 paginas	Primera	\N	2010	\N	t	\N
1000616	\N	Páginas de los hombres, páginas de Dios	Pedro Moreno	\N	\N	\N	84-89021-17-1	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2676 paginas	Primera	\N	\N	\N	t	\N
1000617	Cristianismo	Entre la penumbra y la luz	Maximiliano Calvo	\N	\N	\N	978-84-96281-29-5	Grafite Ediciones	FORMACIÓN HUM	Español	LIBRO	180 paginas	Octava Edición	Baracaldo	2012	\N	t	\N
1000618	Cristianismo	Entre la penumbra y la luz	Maximiliano Calvo	\N	\N	\N	978-84-96281-29-5	Grafite Ediciones	FORMACIÓN HUM	Español	LIBRO	180 paginas	Octava Edición	Baracaldo	2012	\N	t	\N
1000619	\N	Según se viva	Maximiliano Calvo	\N	\N	\N	978-84-8316-758-8	Editorial CCS	FORMACIÓN HUM	Español	LIBRO	2673 paginas	Séptima Edición	\N	2013	\N	t	\N
1000620	\N	Según se viva	Maximiliano Calvo	\N	\N	\N	978-84-8316-758-8	Editorial CCS	FORMACIÓN HUM	Español	LIBRO	2672 paginas	Séptima Edición	\N	2013	\N	t	\N
1000621	\N	Filosofía. Una guía gráfica de la historia del pensamiento	Dave Robinson/ Judy Groves	\N	\N	\N	978-84-493-2416-1	Editorial Paidós Iberiaca	FILOSOFIA Y PSICOLOGIA	Español	LIBRO	2671 paginas	Primera Edición	Barcelona	2010	\N	t	\N
1000622	\N	Fijos los ojos en Jesús	Maximiliano Calvo	\N	\N	\N	978-84-8316-090-9	Editorial CCS	FORMACIÓN HUM	\N	\N	2670 paginas	Undécima Edición	\N	2015	\N	t	\N
1000623	\N	Fijos los ojos en Jesús	Maximiliano Calvo	\N	\N	\N	978-84-8316-090-9	Editorial CCS	FORMACIÓN HUM	\N	\N	2669 paginas	Undécima Edición	\N	2015	\N	t	\N
1000624	\N	En la escucha del corazón	Enzo Pelvi	\N	\N	\N	9972-686-18-3	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2668 paginas	Primera Edición	\N	1998	\N	t	\N
1000625	\N	La Palabra a los jóvenes	Segio Esteban	\N	\N	\N	9972-686-25-6	Grupo Editorial Latinoamicano	FORMACIÓN HUM	Español	LIBRO	2667 paginas	Primera Edición	\N	1998	\N	t	\N
1000626	\N	Tolerancia (Para una ética de Solidaridad y Paz)	Bernhard Haring Valentino Salvoldi	\N	\N	\N	958-9419-01-1	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	2666 paginas	Primera	\N	1994	\N	t	\N
1000627	\N	Rezar la vida	Alberto Iniesta	\N	\N	\N	84-89-021-15-5	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2665 paginas	Primera	\N	1995	\N	t	\N
1002694	\N	ESPASA CALPE 14	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	598 paginas	\N	\N	\N	\N	t	\N
1000629	\N	Secreto del Adviento (Tiempo alegre Espera)	Maritza Flores Pinedo/ Arsenio Vásquez Palomino	\N	\N	\N	9972-05-028-9	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2663 paginas	Primera Edición	\N	2004	\N	t	\N
1000630	\N	Secreto de la Navidad (Dios con nosotros)	Maritza Flores Pinedo/ Arsenio Vásquez Palomino	\N	\N	\N	978-9972-05-080-0	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2662 paginas	Segunda Edición	\N	2008	\N	t	\N
1000631	\N	Secreto de la Pascua	Miguel Flores Suclla	\N	\N	\N	978-9972-05-094-7	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2661 paginas	Primera Edición	\N	2009	\N	t	\N
1000632	\N	¿Somos verdaderamente libres?	Eugenio Fizzotti Ignazio Punzi	\N	\N	\N	980-207-448-9	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2660 paginas	Primera Edición	\N	1995	\N	t	\N
1000633	\N	El secreto de la Cuaresma (Tiempo de Conversión)	Maritza Flores Pinedo/ Arsenio Vásquez Palomino	\N	\N	\N	9972-05-035-1	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2659 paginas	Primera Edición	\N	2006	\N	t	\N
1000634	\N	Detalles y ecos de familia	Miguel Ángel Mesa	\N	\N	\N	84-95221-02-0	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2658 paginas	Primera Edición	\N	1998	\N	t	\N
1000635	\N	Jesús de Nazaret (para amar y servir a Dios y a usted)	P. Arturo Moscoso Pacheco	\N	\N	\N	9972-686-99-X	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2657 paginas	Primera Edición	\N	2004	\N	t	\N
1000636	\N	Trampa de la seducción	Valerio Albisetti	\N	\N	\N	980-207-457-8	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2656 paginas	Primera Edición	\N	1995	\N	t	\N
1000637	Cristianismo	Crecer en la vida	Ciriaco Izquierdo Moreno	\N	\N	\N	978-9972-05-033-6	Paulinas	FORMACIÓN HUM	Español	LIBRO	94 paginas	Primera Edición	Lima	2004	\N	t	\N
1000638	\N	El arte de ser feliz	Ignacio Larrañaga	\N	\N	\N	978-9972-05-124-1	Grupo Editorial Latinoamicano	FORMACIÓN HUM	Español	LIBRO	2654 paginas	Primera Edición	\N	2010	\N	t	\N
1000639	\N	La alegría y entusiasmo de vivir	Ciriaco Izquierdo Moreno	\N	\N	\N	978-9972-05-128-9	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	2653 paginas	Primera Edición	\N	2010	\N	t	\N
1000640	Formaciòn humana	Atendiendo a la Diversidad (Trabajo con padres y madres de niños)	Cáritas	\N	\N	\N	2013-11754 (Biblioteca Nacional)	Tarea Asociación Gráfica Educativa	FORMACIÓN HUM	Español	LIBRO	85	Primera Edición	Perù	2013	Mirando con otros ojos a nuestros hijos. Un nuevo enfoque. Mejorando nuestras relaciones familiares, nos enfocamos en un buen trato. Y … ¿Qué saben hacer nuestros hijos?. Visión de desarrollo humano. Dimensiones y características del desarrollo. Dando la oportunidad de aprender. Mejores padres = Mejores hijos. Descubriendo patrones de crianza. Generando un cambio de actitud. Los padres tienen el control. Identificando conductas inadecuadas y peligrosas. Técnicas para mejorar conductas. Oportunidades laborales. Posibilidades de ocupación laboral. La vida sexual de mi hijo o hija con discapacidad. El desarrollo humano y la sexualidad del niño.	t	\N
1000641	\N	Atendiendo a la Diversidad (Trabajo con docentes de Estudiantes)	Cáritas	\N	\N	\N	2013-20158 (Biblioteca Nacional)	Tarea Asociación Gráfica Educativa	FORMACIÓN HUM	Español	LIBRO	2651 paginas	Primera Edición	\N	2013	\N	t	\N
1000642	Cristianismo	Nuevo Testamento Latinoaméricano	Bernardo Hurault	\N	\N	\N	\N	Paulinas	Cristianismo	Español	LIBRO	510 paginas	Sexta	Lima	-	\N	t	\N
1000643	\N	"Caminar de la mano con Jesucristo, Supremo Pastor"	Arzobispado de Arequipa	\N	\N	\N	\N	\N	FORMACIÓN HUM	\N	\N	2649 paginas	Primera Edición	\N	2004	\N	t	\N
1000644	Cristianismo	"Año de la Eucaristía"	Arzobispado de Arequipa	\N	\N	\N	\N	-	Cristianismo	Español	LIBRO	16 paginas	Primera	Arequipa	2005	\N	t	\N
1000645	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2647 paginas	\N	Arequipa	2010	\N	t	\N
1000646	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2646 paginas	\N	Arequipa	2010	\N	t	\N
1000647	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2645 paginas	\N	Arequipa	2010	\N	t	\N
1000648	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2644 paginas	\N	Arequipa	2010	\N	t	\N
1000649	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2643 paginas	\N	Arequipa	2010	\N	t	\N
1000650	\N	Atlas de Economía. El comercio en la era Global.	Rafael Marfil	\N	\N	\N	978-84-342-3613-4	Parramón Ediciones	Economía	Español	LIBRO	2642 paginas	Primera Edición	Barcelona	2010	\N	t	\N
1000651	\N	Juan Pablo II. Un Pontificado entre dos milenios	José Antonio Benito Rodriguez	\N	\N	\N	978-9972-05-141-8	Grupo Editorial Latinoamicano	FORMACIÓN HUM	\N	\N	2641 paginas	Primera Edición	\N	2011	\N	t	\N
1000652	Cristianismo	Mensaje del Señor Arzobispo de Arequipa	Arzobispado de Arequipa	\N	\N	\N	\N	-	Cristianismo	Español	Libro	24 paginas	Primera Edición	Arequipa	2005	\N	t	\N
1000653	\N	Desde el tiempo y los días	Alberto Iniesta	\N	\N	\N	84-89-021-12-0	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2639 paginas	Primera Edición	\N	1995	\N	t	\N
1000654	\N	Pequeña Enciclopedia Mariana	P. José Gabriel Tisnés Jiménez	\N	\N	\N	958-654-032-4	Editorial Don Bosco	FORMACIÓN HUM	\N	\N	2638 paginas	Cuarta Edición	\N	2008	\N	t	\N
1000655	\N	Ejemplos Marianos	P. Eliécer Salesman	\N	\N	\N	958-9492-21-5	Editorial Don Bosco	FORMACIÓN HUM	\N	\N	2637 paginas	Octava Edición	\N	\N	\N	t	\N
1000656	\N	Cómo hacer una buena Confesión	P. Eliécer Salesman	\N	\N	\N	958-9492-21-5	Editorial Don Bosco	FORMACIÓN HUM	\N	\N	2636 paginas	Diesiochoava Edición	\N	2008	\N	t	\N
1000657	Cristianismo	Verbum Domini	Benedicto XVI	\N	\N	\N	978-9972-05-133-3	Editorial Paulinas	Cristianismo	Español	LIBRO	203 paginas	Primera Edición	Lima	2010	\N	t	\N
1000658	Cristianismo	Spe Salvi	Benedicto XVI	\N	\N	\N	978-9972-05-066-4	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	77 paginas	Primera Edición	Lima	2007	\N	t	\N
1000659	Cristianismo	Evangelium Vitae	Juan Pablo II	\N	\N	\N	978-9972-05-118-0	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	168 paginas	Tercera Edición	Lima	2010	\N	t	\N
1000660	\N	Veritatis Splendor	Juan Pablo II	\N	\N	\N	9972-686-62-0	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	2632 paginas	Primera Edición	\N	2002	\N	t	\N
1000661	Cristianismo	Fides et Ratio	Juan Pablo II	\N	\N	\N	978-9972-05-063-3	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	142  paginas	Segunda Edición	Lima	2007	\N	t	\N
1000662	Cristianismo	Dies Domini	Juan Pablo II	\N	\N	\N	9972-05-011-4	Editorial Paulinas	FORMACIÓN HUM	Español	LIBRO	85 paginas	Primera Edición	Lima	2004	Dies domini. Celebración de la obra del Creador. "Por medio de la Palabra se hizo todo"(Jn 1,3)."Al principio creó Dios el cielo y la tierra"(Gn 1,1). El "shabbat":gozoso descanso del crador. "Bendijo Dios el dia séptimo y lo santificó"(Gn 2,3). "Recordar" para "santificar". Del sábado al domingo. Dies christi. El dia del señor resucitado y el don del Espíritu. La pascua semanal. El primer día de la semana. Diferencia progresiva del sábado. El día de la nueva creación. El octavo día, figura de la eternidad. El día de Cristo-luz. El día del don del Espíritu. El día de la fe. ¡Un día irrenunciable!. Dies ecclesiae. La asamblea eucarística, centro del domingo. La presencia del Resucitado. La asamblea eucarística. La eucaristía dominical. El día de la Iglesia. Pueblo peregrino. Día de la esperenaza.	t	\N
1000663	\N	La Sagrada Biblia	Cardenal Vicente Enrique y Taracón	\N	\N	\N	84-670-1722-8	Editorial Planeta de Agostini	FORMACIÓN HUM	\N	\N	2629 paginas	Primera Edición	\N	\N	\N	t	\N
1000664	Cristianismo	Leer la biblia como Palabra de Dios	Francisco Contreras Molina	\N	\N	\N	978-84-8169-729-2	Editorial Verbo Divino	Cristianismo	Español	Libro	2628 paginas	Primera Edición	Madrid	2007	La Palabra de Dios: Interpelación y reto para la Iglesia. La Palabra de Dios: Llamada apremiante de la Iglesia. La Palabra de Dios: Reto comprometedor para la iglesia. Historia de la lectio divina. Historia explicativa de la expresión lectio divina. Los santos Padres. El Monacato. Sistematización de la lectio divina. Guigo, el cartujano. Exilio de la Palabra de Dios en la Iglesia. Retorno a la Palabra. Epifania gloriosa de la Palabra de Dios. Congregaciones religiosas. «Movimientos y caminos» dentro de la Iglesia. Conclusión. La Constitución conciliar Dei Verbum, «La nueva entrega de la Bliblia a la Iglesia». La Constitución Dei Verbum.Carta magna de la Sagrada Escritura en la Iglesia. Historia del texto. La escritura se entiende dentro de la revelación de Dios. La Sagrada Escritura es un hablar de Dios, actual y presente. Valoración global. La Sagrada Escritura en la vida de la Iglesia. Lectura del texto. Veneración de la Iglesia por la Escritura (n. 21). Dos panes en la mesa de la iglesia (n. 21). La escritura, diálogo con Dios. Eficacia  de la Escritura. La Escritura es un libro abierto para todos.La lectio divina (n. 25). Balance y perspectivas. Conclución. Lectura de la Biblia en Cristo. Cristo ilumina la Biblia o El Libro de la Vida (Apocalipsis). La humanidad sin el libro de a vida anda herrática, sumida en llanto. Jesús lee el libro y lo interpreta para todos nosotros. Jesús lee el libro y lo interpreta para todos nosotros. Respuesta gozosa de la humanidad.¡Tenemos ya un libro que nos descubre nuestra vocación y destino de vida! Cristo es la plenitud de la revelacion (Dei Verbum, 4). Carta a los Hebreos 1,1-2. Evangelio de san Juan 1,18. Cristo nos enseña a leer la biblia. Cristo, Maestro y Guia de la Escritura. La culminación en la celebración de la Eucaristía. La presencia iluminadora del Espíritu Santo. Es Jesús mismo quien nos abre la inteligencia para entender las Escrituras. El Resucitado nos envía a la misión. Conclusión. Lectura de la biblia en el Espíritu Santo. El Espíritu Santo en la encarnación de la Palabra. La Palabra de Dios y el Espritu.	t	\N
1000665	Cristianismo	In Te, Domine Speravi	Álvaro M.Espinoza de la Borda	\N	\N	\N	978-612-46011-0-1	Impresiones GEMSA	FORMACIÓN HUM	Español	Libro	314 paginas	Primera Edición	Arequipa	2011	\N	t	\N
1000666	Cristianismo	In Te, Domine Speravi	Álvaro M.Espinoza de la Borda	\N	\N	\N	978-612-46011-0-1	Impresiones GEMSA	FORMACIÓN HUM	Español	Libro	314 paginas	Primera Edición	Arequipa	2011	\N	t	\N
1000667	Cristianismo	In Te, Domine Speravi	Álvaro M.Espinoza de la Borda	\N	\N	\N	978-612-46011-0-1	Impresiones GEMSA	FORMACIÓN HUM	Español	LIBRO	314 paginas	Primera Edición	Arequipa	2011	\N	t	\N
1000668	Cristianismo	Actas del Congreso Internacional Histórico	Arzobispado de Arequipa	\N	\N	\N	978-612-46047-0-6	Alvaro M. Espinoza de la Borda	FORMACIÓN HUM	Español	LIBRO	374 paginas	Primera Edición	Arequipa	2013	\N	t	\N
1000669	Cristianismo	Actas del Congreso Internacional Histórico	Arzobispado de Arequipa	\N	\N	\N	978-612-46047-0-6	Alvaro M. Espinoza de la Borda	FORMACIÓN HUM	Español	LIBRO	374 pagínas	Primera Edición	Arequipa	2013	\N	t	\N
1000670	Cristianismo	Actas del Congreso Internacional Histórico	Arzobispado de Arequipa	\N	\N	\N	978-612-46047-0-6	Alvaro M. Espinoza de la Borda	FORMACIÓN HUM	Español	LIBRO	374 pagínas	Primera Edición	Arequipa	2013	\N	t	\N
1000671	\N	Fe y Arquitectura, las Iglesias de Arequipa	Arzobispado de Arequipa	\N	\N	\N	2013-02964 (Biblioteca Nacional)	Talleres de IMPRESA	FORMACIÓN HUM	\N	\N	2621 paginas	Primera Edición	\N	2013	\N	t	\N
1000672	Formaciòn humana	Vidas	Pensión 65	\N	\N	\N	2014-18880 (Biblioteca Nacional)	-	FORMACIÓN HUM	Español	LIBRO	2620 paginas	Primera Edición	Lima	2014	\N	t	\N
1000673	\N	20 Historias, 20 Momentos	Telefónica	\N	\N	\N	\N	\N	FORMACIÓN HUM	\N	\N	2619 paginas	Primera Edición	\N	2014	\N	t	\N
1000674	\N	Virgen de Guadalupe	Tomie de Paola	\N	\N	\N	84-7490-106-5	Ediciones Encuentro	FORMACIÓN HUM	\N	\N	2618 paginas	Primera Edición	\N	1984	\N	t	\N
1000675	\N	El amor más grande (Santa Gianna Beretta)	Gonzalo M. Casas Lazo	\N	\N	\N	978-9972-05-138-8	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2617 paginas	Primera Edición	\N	2011	\N	t	\N
1000676	\N	Santo Toribio (Segundo Arzobispo de Lima)	Rubén Vargas Ugarte,S.J.	\N	\N	\N	9972-05-063-X	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2616 paginas	Primera Edición	\N	2005	\N	t	\N
1000677	\N	El Santo de los Pobres	Rubén Vargas Ugarte,S.J.	\N	\N	\N	978-9972-05-084-8	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2615 paginas	Primera Edición	\N	2008	\N	t	\N
1000678	\N	La Flor de Lima (Santa Rosa)	Rubén Vargas Ugarte,S.J.	\N	\N	\N	9972-05-024-6	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2614 paginas	Primera Edición	\N	2004	\N	t	\N
1000679	\N	Peruanos ejemplares	José Antonio Benito Rodriguez	\N	\N	\N	978-9972-05-084-8	Editorial Paulinas	FORMACIÓN HUM	\N	\N	2613 paginas	Primera Edición	\N	2009	\N	t	\N
1000680	\N	Vida de San Pablo	Antonio Salas	\N	\N	\N	978-84-285-2136-9	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2612 paginas	Tercera Edición	\N	1998	\N	t	\N
1000681	\N	Debajo de los pies. Vida de Santa Teresa de Jesús	Eduardo T.Gil de Muro	\N	\N	\N	84-285-1603-0	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2611 paginas	Tercera Edición	\N	1993	\N	t	\N
1000682	\N	Vida de San Isidro Labrador	Carlos Ros	\N	\N	\N	978-84-285-1546-7	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2610 paginas	Cuarta Edición	\N	\N	\N	t	\N
1000683	\N	Beata Teresa de Calcuta	José Luis Gonzalez Balado	\N	\N	\N	978-84-285-2565-7	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2609 paginas	Tercera Edición	\N	2003	\N	t	\N
1000684	\N	Vivir en la presencia de Dios	Hermano Lorenzo	\N	\N	\N	950-861-540-0	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2608 paginas	Primera Edición	\N	2001	\N	t	\N
1000685	\N	Todo será para el bien	Juliana de Norwich	\N	\N	\N	950-861-535-4	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2607 paginas	Primera Edición	\N	2002	\N	t	\N
1000686	\N	Nada te turbe	Teresa de Avila	\N	\N	\N	950-861-506-0	Editorial San Pablo	FORMACIÓN HUM	\N	\N	2606 paginas	Primera Edición	\N	2003	\N	t	\N
1000687	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2605 paginas	\N	Arequipa	2010	\N	t	\N
1000688	formacion humana	Inteligencia Emocional	Maria Elena Lopez de Bernal Maria Teresa Arango De Narvaes	\N	\N	\N	958-9308-70-8	Ediciones Gamma	FORMACIÓN HUM	Español	LIBRO	2604 paginas	Segunda Edición	Bogotá	2003	\N	t	\N
1000689	formacion humana	Inteligencia Emocional	Maria Elena Lopez de Bernal Maria Teresa Arango De Narvaes	\N	\N	\N	958-9308-71-6	Ediciones Gamma	FORMACIÓN HUM	Español	LIBRO	2603 paginas	Segunda Edición	Bogotá	2003	\N	t	\N
1000690	formacion humana	Inteligencia Emocional	Maria Elena Lopez de Bernal Maria Teresa Arango De Narvaes	\N	\N	\N	958-9308-72-4	Ediciones Gamma	FORMACIÓN HUM	Español	LIBRO	2602 paginas	Segunda Edición	Bogotá	2003	\N	t	\N
1000691	\N	Atlas y geografía del mundo	Juan Olivar	\N	\N	\N	9972-625-20-6	\N	FORMACIÓN HUM	\N	\N	2601 paginas	\N	\N	\N	\N	t	\N
1000692	\N	Sopena- gran atlas colombus	Editorial Ramon Sopena	\N	\N	\N	84-303-0859-8	\N	FORMACIÓN HUM	\N	\N	2600 paginas	\N	\N	\N	\N	t	\N
1000693	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2599 paginas	\N	Arequipa	2010	\N	t	\N
1000694	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2598 paginas	\N	Arequipa	2010	\N	t	\N
1000695	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2597 paginas	\N	Arequipa	2010	\N	t	\N
1000696	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2596 paginas	\N	Arequipa	2010	\N	t	\N
1000697	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2595 paginas	\N	Arequipa	2010	\N	t	\N
1000698	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2594 paginas	\N	Arequipa	2010	\N	t	\N
1000699	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2593 paginas	\N	Arequipa	2010	\N	t	\N
1000700	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2592 paginas	\N	Arequipa	2010	\N	t	\N
1000701	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2591 paginas	\N	Arequipa	2010	\N	t	\N
1000702	\N	Formación del universo	Jacs Book M.	\N	\N	\N	\N	obra cmpleta III-II-IV	FORMACIÓN HUM	\N	\N	2590 paginas	\N	\N	\N	\N	t	\N
1000703	\N	El Derecho. Revista. Órgano de difusión del ilustre Colegio de abogados de Arequipa.	José Alejandro Suárez Zanabria	\N	\N	\N	\N	Editorial Adrus	DERECHO	Español	REVISTA	2589 paginas	Primera	Arequipa	2011	\N	t	\N
1000704	\N	Ratio Procurando Justicia y Actio	Julia Marmanillo de Torreblanca	\N	\N	\N	\N	LVCerna Editores	DERECHO	Español	REVISTA	2588 paginas	Primera	Arequipa	2010	\N	t	\N
1000705	\N	El Derecho. Revista del Colegio de abogados de Arequipa.	Hugo César Salas Ortiz	\N	\N	\N	\N	Editorial Adrus	DERECHO	Español	REVISTA	2587 paginas	Primera	Arequipa	2009	\N	t	\N
1000706	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2586 paginas	\N	Arequipa	2010	\N	t	\N
1000707	\N	El fiscal (Revista Institucional del Ministerio Público Arequipa)	Hugo Ramos Hurtado	\N	\N	\N	2008-05628 (Biblioteca Nacional del Perú)	Editorial ADRUS	DERECHO	Español	LIBRO	2585 paginas	Primera	\N	2008	\N	t	\N
1000708	formacion humana	Seguridad ciudadana. Política de Estado	Luis Gonzales Posada Luis	\N	\N	\N	9972-890-91-0	Fondo Editorial del Congreso del Perú	DERECHO	Español	LIBRO	139 paginas	Primera	Lima	2005	Presentación por Alan García. Prólogo por Luis Gonzales Posada. Problemática actual. Policía Nacional. Instituto Nacional Penitenciario. Poder Judicial y Ministerio Público. Municipalidades. Juntas Vecinales. La Sociedad Civil. Empresas Privadas de Seguridad. Licencias de armas. Educación. Seguridad Ciudadana: Política de Estado. Marco legal de la seguridad ciudadana. Una Política de seguridad ciudadana eficaz (CEPAL). Expeciencias Sudamericanas: Colombia y Chile. Conclusiones y Recomendaciones. Aportes a la seguridad Ciudadana.	t	\N
1000709	formacion humana	Seguridad ciudadana. Política de Estado	Luis Gonzales Posada Luis	\N	\N	\N	9972-890-91-0	Fondo Editorial del Congreso del Perú	DERECHO	Español	LIBRO	139 paginas	Primera	Lima	2005	Presentación por Alan García. Prólogo por Luis Gonzales Posada. Problemática actual. Policía Nacional. Instituto Nacional Penitenciario. Poder Judicial y Ministerio Público. Municipalidades. Juntas Vecinales. La Sociedad Civil. Empresas Privadas de Seguridad. Licencias de armas. Educación. Seguridad Ciudadana: Política de Estado. Marco legal de la seguridad ciudadana. Una Política de seguridad ciudadana eficaz (CEPAL). Expeciencias Sudamericanas: Colombia y Chile. Conclusiones y Recomendaciones. Aportes a la seguridad Ciudadana.	t	\N
1000710	formacion humana	Seguridad ciudadana. Política de Estado	Luis Gonzales Posada Luis	\N	\N	\N	9972-890-91-0	Fondo Editorial del Congreso del Perú	DERECHO	Español	LIBRO	139 paginas	Primera	Lima	2005	Presentación por Alan García. Prólogo por Luis Gonzales Posada. Problemática actual. Policía Nacional. Instituto Nacional Penitenciario. Poder Judicial y Ministerio Público. Municipalidades. Juntas Vecinales. La Sociedad Civil. Empresas Privadas de Seguridad. Licencias de armas. Educación. Seguridad Ciudadana: Política de Estado. Marco legal de la seguridad ciudadana. Una Política de seguridad ciudadana eficaz (CEPAL). Expeciencias Sudamericanas: Colombia y Chile. Conclusiones y Recomendaciones. Aportes a la seguridad Ciudadana.	t	\N
1000711	Administración	Constitución y sociedad política	Macial Rubio Correa / Enrique Bernales Ballesteros	\N	\N	\N	\N	Mesa Redonda Editoras	DERECHO	Español	LIBRO	2581 paginas	Segunda	Lima	1983	\N	t	\N
1000712	\N	Sociedad enferma (Un enfoque sociomédico de la corrupción)	José S. Bedoya	\N	\N	\N	\N	\N	DERECHO	Español	LIBRO	2580 paginas	Primera	\N	\N	\N	t	\N
1000713	\N	Texto Único Ordenado "Reglamento de la ley General de Servicios de Saneamiento Ley N°.26338	Socios del Comité electoral de agua y Saneamiento	\N	\N	\N	\N	\N	DERECHO	Español	REVISTA	2579 paginas	Primera	Lima	2006	\N	t	\N
1000714	\N	Compendio de Procedimientos Judiciales	Fernando Gomez Arteaga	\N	\N	\N	\N	Editorial "San Marcos"	DERECHO	Español	LIBRO	2578 paginas	Primera	Lima	1991	\N	t	\N
1000715	\N	Nueva Ley Orgánica del Poder Judicial	Gemán Berrio Boza	\N	\N	\N	\N	Editorial Berrio	DERECHO	\N	\N	2577 paginas	Primera	\N	1993	\N	t	\N
1000716	\N	Nuevo Código Procesal Civil	Gemán Berrio Boza	\N	\N	\N	\N	Editorial Berrio	DERECHO	\N	\N	2576 paginas	Primera	\N	1993	\N	t	\N
1000717	\N	Código Penal	Juan Portocarreo Hidalgo	\N	\N	\N	n° 003-91-UJS/DGAJ	Editorial Portocarrero	DERECHO	\N	\N	2575 paginas	Primera	\N	1991	\N	t	\N
1000718	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2574 paginas	\N	Arequipa	2010	\N	t	\N
1000719	Administración	Código de procedimientos penales	Luis Escudero Gonzales	\N	\N	\N	\N	Editorial Eddili S.A	DERECHO	Español	LIBRO	2573 paginas	No oficial	Lima	1992	\N	t	\N
1000720	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2572 paginas	\N	Arequipa	2010	\N	t	\N
1000721	Administracion	Compendio de Derecho Público interno y externo	Silvestre Pinheiro Ferreira	\N	\N	\N	978-612-4075-74-2	Fondo Editorial del Congreso del Perú	DERECHO	Español	LIBRO	 311 paginas	Primera	Lima	2017	\N	t	\N
1000722	\N	Office I : Word	Mar Serrano	\N	\N	\N	9972-217-33-7	Planeta de Agostini	INFORMÁTICA	\N	\N	2570 paginas	Primera	\N	2006	\N	t	\N
1000723	\N	Office II: Excel	Mar Serrano	\N	\N	\N	9972-217-34-5	Planeta de Agostini	INFORMÁTICA	\N	\N	2569 paginas	Primera	\N	2006	\N	t	\N
1000724	\N	Office III: Access y Outlook	Mar Serrano	\N	\N	\N	9972-217-35-3	Planeta de Agostini	INFORMÁTICA	\N	\N	2568 paginas	Primera	\N	2006	\N	t	\N
1000725	\N	Office III: PowerPoint y Frontpage	Mar Serrano	\N	\N	\N	9972-217-36-1	Planeta de Agostini	INFORMÁTICA	\N	\N	2567 paginas	Primera	\N	2006	\N	t	\N
1000726	\N	Multimedia y Nuevas Tecnologías	Mar Serrano	\N	\N	\N	9972-217-37-X	Planeta de Agostini	INFORMÁTICA	\N	\N	2566 paginas	Primera	\N	2006	\N	t	\N
1000727	\N	Imagen: Fotografía y Video	Mar Serrano	\N	\N	\N	9972-217-38-8	Planeta de Agostini	INFORMÁTICA	\N	\N	2565 paginas	Primera	\N	2006	\N	t	\N
1000728	\N	Sáquele partido a Windows XP	Mar Serrano	\N	\N	\N	9972-217-39-6	Planeta de Agostini	INFORMÁTICA	\N	\N	2564 paginas	Primera	\N	2006	\N	t	\N
1000729	\N	Windows XP para expertos	Mar Serrano	\N	\N	\N	9972-217-40-X	Planeta de Agostini	INFORMÁTICA	\N	\N	2563 paginas	Primera	\N	2006	\N	t	\N
1000730	\N	Todo está en Internet	Mar Serrano	\N	\N	\N	9972-217-41-8	Planeta de Agostini	INFORMÁTICA	\N	\N	2562 paginas	Primera	\N	2006	\N	t	\N
1000731	\N	Internet para expertos	Mar Serrano	\N	\N	\N	9972-217-42-6	Planeta de Agostini	INFORMÁTICA	\N	\N	2561 paginas	Primera	\N	2006	\N	t	\N
1000732	\N	Conozca su PC a fondo	Mar Serrano	\N	\N	\N	9972-217-43-4	Planeta de Agostini	INFORMÁTICA	\N	\N	2560 paginas	Primera	\N	2006	\N	t	\N
1000733	\N	Misterios del Antiguo Egipto	Lewis Spence	\N	\N	\N	\N	Ariel Isotérica	CULTURA GRAL	\N	\N	2559 paginas	Primera	\N	1975	\N	t	\N
1000734	\N	Historia gráfica de la Segunda Guerra Mundial / Volumen 1	Abraham Rothberg	\N	\N	\N	D.L. B. 17.966 - 1967	Ediciones Aura	HISTORIA	Español	LIBRO	2558 paginas	Primera	Valencia	1967	\N	t	\N
1000735	\N	Historia gráfica de la Segunda Guerra Mundial / Volumen 3	Abraham Rothberg	\N	\N	\N	D.L. B. 17.968 - 1967	Ediciones Aura	HISTORIA	Español	LIBRO	2557 paginas	Primera	Valencia	1967	\N	t	\N
1000736	\N	Historia Universal / Prehistoria y primeras Civilizaciones	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891755	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2556 paginas	Primera	Lima	2003	\N	t	\N
1000737	\N	Historia Universal / Grandes Imperios de la Antigüedad	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891763	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2555 paginas	Primera	Lima	2003	\N	t	\N
1000738	\N	Historia Universal / El mundo Griego	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891771	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2554 paginas	Primera	Lima	2003	\N	t	\N
1000739	\N	Historia Universal / Esplendedor y decadencia de Roma	Bernardo Roca Rey Miró Quesada	\N	\N	\N	997289178X	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2553 paginas	Primera	Lima	2003	\N	t	\N
1000740	\N	Historia Universal / América precolombina	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891798	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2552 paginas	Primera	Lima	2003	\N	t	\N
1000741	\N	Historia Universal / El Auge de las Culturas Orientales	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891801	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2551 paginas	Primera	Lima	2003	\N	t	\N
1000742	\N	Historia Universal / La alta edad media y el Islam	Bernardo Roca Rey Miró Quesada	\N	\N	\N	997289181X	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2550 paginas	Primera	Lima	2003	\N	t	\N
1000743	\N	Historia Universal / La baja edad media	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891828	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2549 paginas	Primera	Lima	2003	\N	t	\N
1000744	\N	Historia Universal / Los inicios de la Edad Moderna	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891836	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2548 paginas	Primera	Lima	2003	\N	t	\N
1000745	\N	Historia Universal / América: de la Conquista a la Independencia	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891844	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2547 paginas	Primera	Lima	2003	\N	t	\N
1000746	\N	Historia Universal / El mundo bajo el signo del Absolutismo	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891852	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2546 paginas	Primera	Lima	2003	\N	t	\N
1000747	\N	Historia Universal / La era de las Revoluciones	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891860	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2545 paginas	Primera	Lima	2003	\N	t	\N
1000748	\N	Historia Universal / Europa y América en el siglo XIX	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891879	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2544 paginas	Primera	Lima	2003	\N	t	\N
1000749	\N	Historia Universal / Industrialización e imperialismo	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891887	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2543 paginas	Primera	Lima	2003	\N	t	\N
1000750	\N	Historia Universal / Un mundo en guerra	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891895	Editorial Sol 90	HISTORIA	Español	COLECCIÓN	2542 paginas	Primera	Lima	2003	\N	t	\N
1000751	\N	Historia Universal / De la guerra fría hasta nuestros días	Bernardo Roca Rey Miró Quesada	\N	\N	\N	9972891909	Editorial Sol 90	HISTORIA	\N	\N	2541 paginas	Primera	\N	2003	\N	t	\N
1000752	\N	Personajes del Perú y el Mundo / Tomo 1 / Aachen - Arcipreste	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-59-8	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2540 paginas	Primera	\N	2003	\N	t	\N
1000753	\N	Personajes del Perú y el Mundo / Tomo 2 / Arcipreste de Talavera - Bogart	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-60-1	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2539 paginas	Primera	\N	2003	\N	t	\N
1000754	\N	Personajes del Perú y el Mundo / Tomo 3 / Bogdanov - Catulo	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-61-X	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2538 paginas	Primera	\N	2003	\N	t	\N
1000755	\N	Personajes del Perú y el Mundo / Tomo 4 / Cauchy - Corrigan	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-58-4	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2537 paginas	Primera	\N	2003	\N	t	\N
1000756	\N	Personajes del Perú y el Mundo / Tomo 5 / Corro - Éluard	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-63-6	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2536 paginas	Primera	\N	2003	\N	t	\N
1000757	\N	Personajes del Perú y el Mundo / Tomo 6 / Elvira - Fontaine	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-64-4	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2535 paginas	Primera	\N	2003	\N	t	\N
1000758	\N	Personajes del Perú y el Mundo / Tomo 7 / Fontana - Haider	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-65-2	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2534 paginas	Primera	\N	2003	\N	t	\N
1000759	\N	Personajes del Perú y el Mundo / Tomo 8 / Hailé - Jacob	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-66-0	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2533 paginas	Primera	\N	2003	\N	t	\N
1000760	\N	Personajes del Perú y el Mundo / Tomo 9 / Jacobi - Lozano	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-67-9	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2532 paginas	Primera	\N	2003	\N	t	\N
1000761	\N	Personajes del Perú y el Mundo / Tomo 10 / Luaces - Müelich	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-69-7	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2531 paginas	Primera	\N	2003	\N	t	\N
1000762	\N	Personajes del Perú y el Mundo / Tomo 11 / Mugabe - Papini	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-69-5	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2530 paginas	Primera	\N	2003	\N	t	\N
1000763	\N	Personajes del Perú y el Mundo / Tomo 12 / Papp - Prowazek	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-70-9	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2529 paginas	Primera	\N	2003	\N	t	\N
1000764	\N	Personajes del Perú y el Mundo / Tomo 13 / Prudencio - Russell	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-71-7	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2528 paginas	Primera	\N	2003	\N	t	\N
1000765	\N	Personajes del Perú y el Mundo / Tomo 14 / Russo - Strauss	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-72-5	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2527 paginas	Primera	\N	2003	\N	t	\N
1000766	\N	Personajes del Perú y el Mundo / Tomo 15 / Stravinskij - Turner	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-73-3	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2526 paginas	Primera	\N	2003	\N	t	\N
1000767	\N	Personajes del Perú y el Mundo / Tomo 16 / Turpin - Zworykin	Bernardo Roca Rey Miró Quesada	\N	\N	\N	84-95978-74-1	Ediciones El Comercio	HISTORIA	Español	COLECCIÓN	2525 paginas	Primera	\N	2003	\N	t	\N
1000768	\N	Historia Universal	Atlas	\N	\N	\N	\N	\N	HISTORIA	\N	\N	2524 paginas	Primera	\N	\N	\N	t	\N
1000769	\N	Historia Universal	Atlas	\N	\N	\N	\N	\N	HISTORIA	\N	\N	2523 paginas	Primera	\N	\N	\N	t	\N
1000770	\N	Historia Universal	Atlas	\N	\N	\N	\N	\N	HISTORIA	\N	\N	2522 paginas	Primera	\N	\N	\N	t	\N
1000771	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2521 paginas	Séptima	\N	1963	\N	t	\N
1000772	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2520 paginas	Séptima	\N	1963	\N	t	\N
1000773	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Monterrico	HISTORIA	\N	\N	2519 paginas	Séptima	\N	1963	\N	t	\N
1000774	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Monterrico	HISTORIA	\N	\N	2518 paginas	Séptima	\N	1963	\N	t	\N
1000775	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2517 paginas	Séptima	\N	1963	\N	t	\N
1000776	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2516 paginas	Séptima	\N	1963	\N	t	\N
1000777	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2515 paginas	Séptima	\N	1963	\N	t	\N
1000778	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2514 paginas	Séptima	\N	1963	\N	t	\N
1000779	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Universo S.A-	HISTORIA	\N	\N	2513 paginas	Séptima	\N	1963	\N	t	\N
1000780	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Brasa	HISTORIA	\N	\N	2512 paginas	Séptima	\N	1963	\N	t	\N
1000781	\N	Historia de la República del Perú	Jorge Basadre	\N	\N	\N	\N	Editorial Científica	HISTORIA	\N	\N	2511 paginas	Séptima	\N	1963	\N	t	\N
1000782	\N	Historia Marítima del Perú	Georg Petersen Gaulke Ramón Mugica Martínez	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2510 paginas	Segunda	\N	1975	\N	t	\N
1000783	\N	Historia Marítima del Perú	Jorge Sánchez Romero Esteban Zímic Vidal	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2509 paginas	Segunda	\N	1975	\N	t	\N
1000784	\N	Historia Marítima del Perú	Epoca Prehistórica Hermann Buse	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2508 paginas	Segunda	\N	1975	\N	t	\N
1000785	\N	Historia Marítima del Perú	Epoca Prehistórica Hermann Buse	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2507 paginas	Segunda	\N	1975	\N	t	\N
1000786	\N	Historia Marítima del Perú	Siglo XVI-Historia Interna José A. del Busto Dutburburu	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2506 paginas	Segunda	\N	1975	\N	t	\N
1000787	\N	Historia Marítima del Perú	Siglo XVI-Historia Externa José A. del Busto Dutburburu	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2505 paginas	Segunda	\N	1975	\N	t	\N
1000788	\N	Historia Marítima del Perú	Siglo XVIII y XVIII Guillermo Lobmam Villena	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2504 paginas	Segunda	\N	1975	\N	t	\N
1000789	\N	Historia Marítima del Perú	La Independencia 1970 a 1826 José A. de la Puente Candamo	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2503 paginas	Segunda	\N	1975	\N	t	\N
1000790	\N	Historia Marítima del Perú	La Independencia 1970 a 1826 José A. de la Puente Candamo	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2502 paginas	Segunda	\N	1975	\N	t	\N
1000791	\N	Historia Marítima del Perú	La República 1826 a 1851 Félix Denegri Luna	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2501 paginas	Segunda	\N	1975	\N	t	\N
1000792	\N	Historia Marítima del Perú	La República 1826 a 1851 Félix Denegri Luna	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2500 paginas	Segunda	\N	1975	\N	t	\N
1000793	\N	Historia Marítima del Perú	La Intervención de las potencias Europeas en Latinoamérica-1864 a 1868 Alberto Wagner de Reyna	\N	\N	\N	\N	Editorial Eusonia	HISTORIA	\N	\N	2499 paginas	Segunda	\N	1975	\N	t	\N
1000794	\N	Historia del Perú. Perú Antiguo	Augusto Cardich/Ramiro Matos/ Roger Ravines/Federico Kauffmann	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2498 paginas	Primera	\N	1980	\N	t	\N
1000795	\N	Historia del Perú. Perú Antiguo	Luis Lumbreras/Rogger Ravines/ Franklin Pease/ Jorge Silva	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2497 paginas	Primera	\N	1980	\N	t	\N
1000796	\N	Historia del Perú. Perú Antiguo	Alejandro Ortiz/ Luis Varcácel/Juan Ossio	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2496 paginas	Primera	\N	1980	\N	t	\N
1000797	\N	Historia del Perú. Perú Colonial	Edmundo Guillén/ Waldemar Espinoza/Javier Tord/ Carlos Lazo	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2495 paginas	Primera	\N	1980	\N	t	\N
1000798	\N	Historia del Perú. Perú Colonial	Javier Tord/ carlos Lazo/Luis Sánchez/Luis Millones	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2494 paginas	Primera	\N	1980	\N	t	\N
1000799	\N	Historia del Perú. Perú Republicano	Virgilio Roel/Heraclio Bonilla	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2493 paginas	Primera	\N	1980	\N	t	\N
1000800	\N	Historia del Perú. Perú Republicano	Jorge Basadre/ Percy Cayo7 ernesto Yepes	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2492 paginas	Primera	\N	1980	\N	t	\N
1000801	\N	Historia del Perú. Perú Republicano	Antonio Cornejo/baltazar Caravedo	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2491 paginas	Primera	\N	1980	\N	t	\N
1000802	\N	Historia del Perú. Procesos e Instituciones	José García/ Luis Tord/ Enrique Pinilla	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2490 paginas	Primera	\N	1980	\N	t	\N
1000803	\N	Historia del Perú. Procesos e Instituciones	Enrique González/ Virglio Galdo/ Fernando Cabieses/ Raúl Rivera	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2489 paginas	Primera	\N	1980	\N	t	\N
1000804	\N	Historia del Perú. Procesos e Instituciones	Manuel Burga/ Alberto Flores/ David Sobrevilla/ Armando Nieto	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2488 paginas	Primera	\N	1980	\N	t	\N
1000805	\N	Historia del Perú. Procesos e Instituciones	Fernando Silva/ Wilfredo Kapsoli/ Alberto Chirif/ Luis Pásara	\N	\N	\N	\N	Editorial Juan Mejia Baca	HISTORIA	\N	\N	2487 paginas	Primera	\N	1980	\N	t	\N
1000806	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2486 paginas	\N	Arequipa	2010	\N	t	\N
1000807	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2485 paginas	\N	Arequipa	2010	\N	t	\N
1000808	\N	Agua. Los escoleros Warma Kuyay Oda al Jet ¿Qué es el flolkore? No soy un aculturado	Jose Maria Arguedas	\N	\N	\N	\N	Editorial Horizonte	HISTORIA	Español	LIBRO	2484 paginas	Primera	Lima	1988	\N	t	\N
1000809	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2483 paginas	Decima	\N	1973	\N	t	\N
1000810	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2482 paginas	Decima	\N	1973	\N	t	\N
1000811	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2481 paginas	Decima	\N	1973	\N	t	\N
1000812	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2480 paginas	Decima	\N	1973	\N	t	\N
1000813	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2479 paginas	Decima	\N	1973	\N	t	\N
1000814	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2478 paginas	Decima	\N	1973	\N	t	\N
1000815	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2477 paginas	Decima	\N	1973	\N	t	\N
1000816	\N	Diccionario Enciclopédico Quillet	Ricardo Farfan	\N	\N	\N	\N	Editorial ArgentinaEdístides Quillet	CULTURA GRAL	Español	DICCIONARIO	2476 paginas	Decima	\N	1973	\N	t	\N
1000817	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0040-6	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2475 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1001413	\N	Diálogo T2	\N	\N	\N	\N	\N	Cuantica Editora S.A.	ENCICLOPEDIA	Español	LIBRO	1879 paginas	\N	\N	\N	\N	t	\N
1000818	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0041-4	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2474 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000819	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0042-2	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2473 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000820	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0043-0	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2472 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000821	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0044-9	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2471 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000822	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0045-7	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2470 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000823	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0046-5	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2469 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000824	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0047-3	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2468 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000825	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0048-1	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2467 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000826	\N	Diccionario de la Lengua Española	Real Academia Española	\N	\N	\N	84-670-0049-X	Editorial Epasa	CULTURA GRAL	Español	DICCIONARIO	2466 paginas	Vigésima Segunda	\N	2001	\N	t	\N
1000827	\N	Diccionario Sinónimos Antónimos	Educar Editores	\N	\N	\N	84-8279-072-2	Editorial Andes	LITERATURA	Español	DICCIONARIO	2465 paginas	Primera	Bogotá	1982	\N	t	\N
1000828	\N	Así se escribe	María Eloísa Álvarez del Rea	\N	\N	\N	81-72103	Editorial América	CULTURA GRAL	Español	DICCIONARIO	2464 paginas	Quinta	\N	1985	\N	t	\N
1000829	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-191-0	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2463 paginas	Primera	\N	2010	\N	t	\N
1000830	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-192-7	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2462 paginas	Primera	\N	2010	\N	t	\N
1000831	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-193-4	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2461 paginas	Primera	\N	2010	\N	t	\N
1000832	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-194-1	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2460 paginas	Primera	\N	2010	\N	t	\N
1000833	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-195-8	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2459 paginas	Primera	\N	2010	\N	t	\N
1000834	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-196-5	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2458 paginas	Primera	\N	2010	\N	t	\N
1000835	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-197-2	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2457 paginas	Primera	\N	2010	\N	t	\N
1000836	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-198-9	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2456 paginas	Primera	\N	2010	\N	t	\N
1000837	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-199-6	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2455 paginas	Primera	\N	2010	\N	t	\N
1000838	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-200-9	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2454 paginas	Primera	\N	2010	\N	t	\N
1000839	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-201-6	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2453 paginas	Primera	\N	2010	\N	t	\N
1000840	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-202-3	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2452 paginas	Primera	\N	2010	\N	t	\N
1000841	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-203-0	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2451 paginas	Primera	\N	2010	\N	t	\N
1000842	\N	Diccionario LAROUSE (Bilingüe Ilustrado)	QA Internacional	\N	\N	\N	978-956-311-204-71	Editions Larousse	CULTURA GRAL	Inglés	DICCIONARIO	2450 paginas	Primera	\N	2010	\N	t	\N
1000843	\N	César Ritz. Life and work	Adalbert Chastonay	\N	\N	\N	3-907816-60-9	César Ritz Colleges	HISTORIA	Inglés	LIBRO	2449 paginas	Primera	Le Bouveret	2005	\N	t	\N
1000844	\N	Costa de Piura	El Comercio	\N	\N	\N	\N	\N	CULTURA GRAL	\N	ENCICLOPEDIA	2448 paginas	\N	\N	\N	\N	t	\N
1000845	\N	Enciclopedia "El estudiante"	El Comercio	\N	\N	\N	9972-02-042-8	Empresa Editora El Comercio	CULTURA GRAL	\N	ENCICLOPEDIA	2447 paginas	Primera	\N	2003	\N	t	\N
1000846	\N	Guinness Words Record 2012	Planeta	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2446 paginas	\N	\N	\N	\N	t	\N
1000847	\N	Guinness Words Record 2013	Planeta	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2445 paginas	\N	\N	\N	\N	t	\N
1000848	\N	Guinness Words Record 2014	Planeta	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2444 paginas	\N	\N	\N	\N	t	\N
1000849	\N	Cone 1	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2443 paginas	\N	\N	\N	\N	t	\N
1000850	\N	Cone 2	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2442 paginas	\N	\N	\N	\N	t	\N
1000851	\N	Cone 3	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2441 paginas	\N	\N	\N	\N	t	\N
1000852	\N	Cone 4	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2440 paginas	\N	\N	\N	\N	t	\N
1000853	\N	Cone 5	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2439 paginas	\N	\N	\N	\N	t	\N
1000854	\N	Cone 6	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2438 paginas	\N	\N	\N	\N	t	\N
1000855	\N	Cone 7	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2437 paginas	\N	\N	\N	\N	t	\N
1000856	\N	Cone 8	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2436 paginas	\N	\N	\N	\N	t	\N
1000857	\N	Cone 9	Televisa/Chile	\N	\N	\N	\N	\N	ENTRETENIMIENTO	\N	\N	2435 paginas	\N	\N	\N	\N	t	\N
1000866	fomacion humana 	Parlamento y Justicia Constitucional	Javier Velásquez Quesquén	\N	\N	\N	978-9972-221-84-2	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	152 paginas	Primera	Lima	2009	Derecho constitucional. Las sentencias del Tribunal Constitucional, o sentencias constitucionales, y el sistema de fuentes del derecho. La autonomía procesal del Tribunal Constitucional. Luces y sombras en torno a un concepto no cerrado. Interpretación conforme a la Constitución y sentencias interpretativas (con especial referencia a la experiencia alemana). Innovando en control constitucional: el control difuso de leyes inconstitucionales por tribunales y órganos administrativos. Derecho parlamentario. Sistema electoral y representación. Derecho parlamentario. La inmunidad parlamentaria como prerrogativa.	t	\N
1000867	formacion humana	En la noche infinita	Miguel De La Mata	\N	\N	\N	9972-221-17-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	200 paginas	Segunda	Lima	2006	Presentación. Eduardo Carhuaricra Meza. Tercer vicepresidente del Congreso de la República del Perú. Carmen Salazar-Soler. "En la noche infinita" o el rescate del olvido. Luis Pajuelo Frías. En la noche infinita.	t	\N
1000886	\N	Operativo corazón partido	María Fernanda Heredia	\N	\N	\N	978-612-4107-09-2	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	2406 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000858	formacion humana	Perú indígena (poder y religión en los Andes centrales)	Luis Millones	\N	\N	\N	978-9972-221-60-6	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	207 paginas	Primera	Lima	2008	DIOSES DE DEMONIOS DE LOS ANDES. Los libros sagrados. El génesis. Los dioses mayores. Otras voces divinas. SER INDÍGENA EN EL PERÚ. Reordenamiento de las poblaciones indígenas. De los incas al período republicano. La población del área andina. Los dramáticos cambios en el siglo XVI. Causas y consecuencias de la caída y recuperación demográfica. Siglo XVI al XIX. Distribución demográfica y ubicación social de las poblaciones indígenas en el Perú contemporáneo. ¿Quiénes son indígenas? La mirada externa. Los conquistadores y las tierras de los gentiles. Los viajeros de los siglos XVIII y XIX y el americano invisible. La etnografía moderna y los indígenas de los siglos XX y XXI. ¿Quiénes son indígenas? La mirada de los otros peruanos. El punto de vista de los criollos del siglo XIX. El debate indigenista y el despertar de las provincias. Estereotipos y prejuicios contemporáneos. Los indígenas apartir de sus testimonios. Los cronistas indígenas d elos siglos XIX y XVII. El poder y la imagen. Los siglos XVII y XIX. Las rebeliones indígenas del siglo XIX. Las instituciones nacionales y sociedad indígena. La compleja relación entre la iglesia Católica y la población aborigen. Las iglesias protestantes. Estrategias y desencuentros con el universo nativo. El estado peruano y las visiones políticas actuales del problema indígena. LAS MIRADAS Y LAS HISTORIAS QUE NO SE ENCUENTRAN. La mirada del Estado. Desde el otro lado del espejo.	t	\N
1000859	formacion humana	Perú indígena (poder y religión en los Andes centrales)	Luis Millones	\N	\N	\N	978-9972-221-60-6	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	207 paginas	Primera	Lima	2008	DIOSES DE DEMONIOS DE LOS ANDES. Los libros sagrados. El génesis. Los dioses mayores. Otras voces divinas. SER INDÍGENA EN EL PERÚ. Reordenamiento de las poblaciones indígenas. De los incas al período republicano. La población del área andina. Los dramáticos cambios en el siglo XVI. Causas y consecuencias de la caída y recuperación demográfica. Siglo XVI al XIX. Distribución demográfica y ubicación social de las poblaciones indígenas en el Perú contemporáneo. ¿Quiénes son indígenas? La mirada externa. Los conquistadores y las tierras de los gentiles. Los viajeros de los siglos XVIII y XIX y el americano invisible. La etnografía moderna y los indígenas de los siglos XX y XXI. ¿Quiénes son indígenas? La mirada de los otros peruanos. El punto de vista de los criollos del siglo XIX. El debate indigenista y el despertar de las provincias. Estereotipos y prejuicios contemporáneos. Los indígenas apartir de sus testimonios. Los cronistas indígenas d elos siglos XIX y XVII. El poder y la imagen. Los siglos XVII y XIX. Las rebeliones indígenas del siglo XIX. Las instituciones nacionales y sociedad indígena. La compleja relación entre la iglesia Católica y la población aborigen. Las iglesias protestantes. Estrategias y desencuentros con el universo nativo. El estado peruano y las visiones políticas actuales del problema indígena. LAS MIRADAS Y LAS HISTORIAS QUE NO SE ENCUENTRAN. La mirada del Estado. Desde el otro lado del espejo.	t	\N
1000860	formacion humana	Perú indígena (poder y religión en los Andes centrales)	Luis Millones	\N	\N	\N	978-9972-221-60-6	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	207 paginas	Primera	Lima	2008	DIOSES DE DEMONIOS DE LOS ANDES. Los libros sagrados. El génesis. Los dioses mayores. Otras voces divinas. SER INDÍGENA EN EL PERÚ. Reordenamiento de las poblaciones indígenas. De los incas al período republicano. La población del área andina. Los dramáticos cambios en el siglo XVI. Causas y consecuencias de la caída y recuperación demográfica. Siglo XVI al XIX. Distribución demográfica y ubicación social de las poblaciones indígenas en el Perú contemporáneo. ¿Quiénes son indígenas? La mirada externa. Los conquistadores y las tierras de los gentiles. Los viajeros de los siglos XVIII y XIX y el americano invisible. La etnografía moderna y los indígenas de los siglos XX y XXI. ¿Quiénes son indígenas? La mirada de los otros peruanos. El punto de vista de los criollos del siglo XIX. El debate indigenista y el despertar de las provincias. Estereotipos y prejuicios contemporáneos. Los indígenas apartir de sus testimonios. Los cronistas indígenas d elos siglos XIX y XVII. El poder y la imagen. Los siglos XVII y XIX. Las rebeliones indígenas del siglo XIX. Las instituciones nacionales y sociedad indígena. La compleja relación entre la iglesia Católica y la población aborigen. Las iglesias protestantes. Estrategias y desencuentros con el universo nativo. El estado peruano y las visiones políticas actuales del problema indígena. LAS MIRADAS Y LAS HISTORIAS QUE NO SE ENCUENTRAN. La mirada del Estado. Desde el otro lado del espejo.	t	\N
1000861	\N	Adiós a Mariátegui (Pensar el Perú en perspectiva postmoderna)	José Ignacio López Soria	\N	\N	\N	978-9972-221-42-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2431 paginas	Primera	Lima	2007	\N	t	\N
1000862	\N	Adiós a Mariátegui (Pensar el Perú en perspectiva postmoderna)	José Ignacio López Soria	\N	\N	\N	978-9972-221-42-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2430 paginas	Primera	Lima	2007	\N	t	\N
1000863	\N	Adiós a Mariátegui (Pensar el Perú en perspectiva postmoderna)	José Ignacio López Soria	\N	\N	\N	978-9972-221-42-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	2429 paginas	Primera	Lima	2007	\N	t	\N
1000864	fomacion humana 	Parlamento y Justicia Constitucional	Javier Velásquez Quesquén	\N	\N	\N	978-9972-221-84-2	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	152 paginas	Primera	Lima	2009	Derecho constitucional. Las sentencias del Tribunal Constitucional, o sentencias constitucionales, y el sistema de fuentes del derecho. La autonomía procesal del Tribunal Constitucional. Luces y sombras en torno a un concepto no cerrado. Interpretación conforme a la Constitución y sentencias interpretativas (con especial referencia a la experiencia alemana). Innovando en control constitucional: el control difuso de leyes inconstitucionales por tribunales y órganos administrativos. Derecho parlamentario. Sistema electoral y representación. Derecho parlamentario. La inmunidad parlamentaria como prerrogativa.	t	\N
1000865	fomacion humana 	Parlamento y Justicia Constitucional	Javier Velásquez Quesquén	\N	\N	\N	978-9972-221-84-2	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	152 paginas	Primera	Lima	2009	Derecho constitucional. Las sentencias del Tribunal Constitucional, o sentencias constitucionales, y el sistema de fuentes del derecho. La autonomía procesal del Tribunal Constitucional. Luces y sombras en torno a un concepto no cerrado. Interpretación conforme a la Constitución y sentencias interpretativas (con especial referencia a la experiencia alemana). Innovando en control constitucional: el control difuso de leyes inconstitucionales por tribunales y órganos administrativos. Derecho parlamentario. Sistema electoral y representación. Derecho parlamentario. La inmunidad parlamentaria como prerrogativa.	t	\N
1000868	fomacion humana 	En la noche infinita	Miguel De La Mata	\N	\N	\N	9972-221-17-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	200 paginas	Segunda	Lima	2006	Presentación. Eduardo Carhuaricra Meza. Tercer vicepresidente del Congreso de la República del Perú. Carmen Salazar-Soler. "En la noche infinita" o el rescate del olvido. Luis Pajuelo Frías. En la noche infinita.	t	\N
1000869	formacion humana	En la noche infinita	Miguel De La Mata	\N	\N	\N	9972-221-17-2	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	200paginas	Segunda	Lima	2006	Presentación. Eduardo Carhuaricra Meza. Tercer vicepresidente del Congreso de la República del Perú. Carmen Salazar-Soler. "En la noche infinita" o el rescate del olvido. Luis Pajuelo Frías. En la noche infinita.	t	\N
1000870	\N	Memoria y destino del Perú: Textos Escenciales	Ernesto Yepes del Castillo	\N	\N	\N	9972-890-31-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2422 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000871	\N	Memoria y destino del Perú: Textos Escenciales	Ernesto Yepes del Castillo	\N	\N	\N	9972-890-31-7	Fondo editorial del Congreso del Perú	HISTORIA	Español	LIBRO	2421 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000872	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2420 paginas	\N	Arequipa	2010	\N	t	\N
1000873	\N	Tres días para Mateo	José Antonio Galloso	\N	\N	\N	978-603-4016-41-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	2419 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000874	\N	Tres días para Mateo	José Antonio Galloso	\N	\N	\N	978-603-4016-41-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	2418 paginas	Tercera edición	Lima	2008	\N	t	\N
1000875	\N	Tres días para Mateo	José Antonio Galloso	\N	\N	\N	978-603-4016-41-5	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	2417 paginas	Primera reimpresión	Lima	2010	\N	t	\N
1000876	\N	Ollantay: El rigor de un padre y la generosidad de un rey	Anónimo	\N	\N	\N	978-9972-00-297-7	Santillana	LITERATURA	Español	LIBRO	2416 paginas	Quinta reimpresion	Lima	2010	\N	t	\N
1000877	\N	Ollantay: El rigor de un padre y la generosidad de un rey	Anónimo	\N	\N	\N	978-9972-00-297-7	Santillana	LITERATURA	Español	LIBRO	2415 paginas	Quinta reimpresion	Lima	2010	\N	t	\N
1000878	\N	Ollantay: El rigor de un padre y la generosidad de un rey	Anónimo	\N	\N	\N	978-9972-00-297-7	Santillana	LITERATURA	Español	LIBRO	2414 paginas	Quinta reimpresion	Lima	2010	\N	t	\N
1000879	formacion humana 	Juan Pablo Viscardo y Guzmán/ Ideólogo y promotor de la Independencia Hispanoamericana	Javier de Belaunde Ruiz de Somocurcio	\N	\N	\N	9972-870-20-1	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	223paginas	\N	Lima	2002	Juan Pablo Viscardo y Guzmán. Ideólogo y promotor de la Independencia de Hispanoamérica. Ambiente familiar. Entre Pampacolca, Majes y Arequipa. El valle de Majes y los Viscardo. Formación doctrinaria de Juan Pablo Viscardo y Guzmán. La Compañía de Jesús y la Independencia de América Latina. Antecedentes filosóficos y políticos contrarios a los jesuitas. Expulsión de la Compañía de Jesús. Consecuencias de la expulsión de los jesuitas. Extinción de la Compañía de Jesús. Surge el ideólogo. Descontento y rebeldía en las colonias de España. Los pasquines. Visión del Conde de Aranda. Preludios del primer viaje de los hermanos Viscardo y Guzmán a Londres. Primer viaje de los Viscardo a Londres. Los hermanos Viscardo renuevan gestiones reclamando sus herencias. Proyecto para independizar la América española. Segunda permanencia de Viscardo en Londres. La Carta a los Españoles Americanos. Difusión de la Carta a los Españoles Americanos. Escrito de Viscardo sobre la situación actual de la América Española y sobre los medios de estrategia para facilitar su independencia. Carta del 28 de marzo de 1793. Cartas de 1795. La paz y la dicha del nuevo siglo. Viscardo y Guzmán, hombre de pensamiento y acción. Viscardo y Guzmán y Rufus King. Rufus King y Miranda. Se corre el velo del olvido. Aportes personales e institucionales. Bibliografía.	t	\N
1000880	formacion humana 	Juan Pablo Viscardo y Guzmán/ Ideólogo y promotor de la Independencia Hispanoamericana	Javier de Belaunde Ruiz de Somocurcio	\N	\N	\N	9972-870-20-1	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	223 paginas	\N	Lima	2002	Juan Pablo Viscardo y Guzmán. Ideólogo y promotor de la Independencia de Hispanoamérica. Ambiente familiar. Entre Pampacolca, Majes y Arequipa. El valle de Majes y los Viscardo. Formación doctrinaria de Juan Pablo Viscardo y Guzmán. La Compañía de Jesús y la Independencia de América Latina. Antecedentes filosóficos y políticos contrarios a los jesuitas. Expulsión de la Compañía de Jesús. Consecuencias de la expulsión de los jesuitas. Extinción de la Compañía de Jesús. Surge el ideólogo. Descontento y rebeldía en las colonias de España. Los pasquines. Visión del Conde de Aranda. Preludios del primer viaje de los hermanos Viscardo y Guzmán a Londres. Primer viaje de los Viscardo a Londres. Los hermanos Viscardo renuevan gestiones reclamando sus herencias. Proyecto para independizar la América española. Segunda permanencia de Viscardo en Londres. La Carta a los Españoles Americanos. Difusión de la Carta a los Españoles Americanos. Escrito de Viscardo sobre la situación actual de la América Española y sobre los medios de estrategia para facilitar su independencia. Carta del 28 de marzo de 1793. Cartas de 1795. La paz y la dicha del nuevo siglo. Viscardo y Guzmán, hombre de pensamiento y acción. Viscardo y Guzmán y Rufus King. Rufus King y Miranda. Se corre el velo del olvido. Aportes personales e institucionales. Bibliografía.	t	\N
1000881	formacion humana 	Juan Pablo Viscardo y Guzmán/ Ideólogo y promotor de la Independencia Hispanoamericana	Javier de Belaunde Ruiz de Somocurcio	\N	\N	\N	9972-870-20-1	Fondo editorial del Congreso del Perú	LITERATURA	Español	LIBRO	223 paginas	\N	Lima	2002	Juan Pablo Viscardo y Guzmán. Ideólogo y promotor de la Independencia de Hispanoamérica. Ambiente familiar. Entre Pampacolca, Majes y Arequipa. El valle de Majes y los Viscardo. Formación doctrinaria de Juan Pablo Viscardo y Guzmán. La Compañía de Jesús y la Independencia de América Latina. Antecedentes filosóficos y políticos contrarios a los jesuitas. Expulsión de la Compañía de Jesús. Consecuencias de la expulsión de los jesuitas. Extinción de la Compañía de Jesús. Surge el ideólogo. Descontento y rebeldía en las colonias de España. Los pasquines. Visión del Conde de Aranda. Preludios del primer viaje de los hermanos Viscardo y Guzmán a Londres. Primer viaje de los Viscardo a Londres. Los hermanos Viscardo renuevan gestiones reclamando sus herencias. Proyecto para independizar la América española. Segunda permanencia de Viscardo en Londres. La Carta a los Españoles Americanos. Difusión de la Carta a los Españoles Americanos. Escrito de Viscardo sobre la situación actual de la América Española y sobre los medios de estrategia para facilitar su independencia. Carta del 28 de marzo de 1793. Cartas de 1795. La paz y la dicha del nuevo siglo. Viscardo y Guzmán, hombre de pensamiento y acción. Viscardo y Guzmán y Rufus King. Rufus King y Miranda. Se corre el velo del olvido. Aportes personales e institucionales. Bibliografía.	t	\N
1000882	\N	Historia de Manú	Ana María del Rio	\N	\N	\N	978-603-4016-53-8	Alfaguara/Infantil	LITERATURA	Español	LIBRO	2410 paginas	Primera	Lima	2008	\N	t	\N
1000883	\N	Historia de Manú	Ana María del Rio	\N	\N	\N	978-603-4016-53-8	Alfaguara/Infantil	LITERATURA	Español	LIBRO	2409 paginas	Primera	Lima	2008	\N	t	\N
1000884	\N	También las estatuas tienen miedo	Andrea Ferrari	\N	\N	\N	978-612-4107-07-8	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	2408 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000885	\N	También las estatuas tienen miedo	Andrea Ferrari	\N	\N	\N	978-612-4107-07-8	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	2407 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000887	\N	Operativo corazón partido	María Fernanda Heredia	\N	\N	\N	978-612-4107-09-2	Alfaguara/Juvenil	LITERATURA	Español	LIBRO	2405 paginas	Primera reimpresión	Lima	2012	\N	t	\N
1000888	\N	Ben quiere a Anna	Peter Härtling	\N	\N	\N	978-9972-232-26-8	Alfaguara/ Juvenil	LITERATURA	Español	LIBRO	2404 paginas	Tercera reimpresion	Lima	2011	\N	t	\N
1000889	\N	Ben quiere a Anna	Peter Härtling	\N	\N	\N	978-9972-232-26-8	Alfaguara/ Juvenil	LITERATURA	Español	LIBRO	2403 paginas	Tercera reimpresion	Lima	2011	\N	t	\N
1000890	\N	Antenor Orrego / Modernidad y culturas Americanas/ Páginas escogidas	Eugenio Chang - Rodríguez	\N	\N	\N	9972-890-61-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2402 paginas	Impreso	Lima	2004	\N	t	\N
1000891	\N	Antenor Orrego / Modernidad y culturas Americanas/ Páginas escogidas	Eugenio Chang - Rodríguez	\N	\N	\N	9972-890-61-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2401 paginas	Impreso	Lima	2004	\N	t	\N
1000892	\N	Antenor Orrego / Modernidad y culturas Americanas/ Páginas escogidas	Eugenio Chang - Rodríguez	\N	\N	\N	9972-890-61-9	Fondo editorial del Congreso del Perú	POLÍTICA Y ESTADO	Español	LIBRO	2400 paginas	Impreso	Lima	2004	\N	t	\N
1000893	\N	Arequipeñismos	Juan Guillermo Carpio Muñoz	\N	\N	\N	978-612-4049-66-8	Adrus	SOCIOLOGÍA	Español	LIBRO	2399 paginas	Segunda	Lima	2012	\N	t	\N
1000894	\N	Arequipeñismos	Juan Guillermo Carpio Muñoz	\N	\N	\N	978-612-4049-66-8	Adrus	SOCIOLOGÍA	Español	LIBRO	2398 paginas	Segunda	Lima	2012	\N	t	\N
1000895	\N	Arequipeñismos	Juan Guillermo Carpio Muñoz	\N	\N	\N	978-612-4049-66-8	Adrus	SOCIOLOGÍA	Español	LIBRO	2397 paginas	Segunda	Lima	2012	\N	t	\N
1000896	\N	Arequipeñismos	Juan Guillermo Carpio Muñoz	\N	\N	\N	978-612-4049-66-8	Adrus	SOCIOLOGÍA	Español	LIBRO	2396 paginas	Segunda	Lima	2012	\N	t	\N
1000897	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2395 paginas	\N	Arequipa	2010	\N	t	\N
1000898	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2394 paginas	\N	Arequipa	2010	\N	t	\N
1000899	Cristianismo	Gottes wunderbare schöpfung - Südamerika / La maravillosa creación de Dios - América del Sur.	Paul Orlob	\N	\N	\N	\N	ACAPE Don Bosco	RELIGIÒN/TEOLOGÌA	Español/Aleman	LIBRO	2393 paginas	Primera	Arequipa	2008	Dedicado a los niños del Perú "5 Llagas de la Cruz" P. Paul Orlob. Agradecimiento a colaboraciones. Prólogo: Secretario Privado del Papa Benedicto XVI. Salmo 8. Maravillarse de Dios. El mundo rustico de Dios. Introduccion. Credo de Nicea = Constantinopla. La corona de la creacion / P. Paúl. De Nico Mölle. Cántico Dan. 3,57-88. Alabanza y agradecimiento. Te Deum. Mártir. Poema de Max Josef Metzger, Nosotros creemos en Dios. Grandes son las obras del Señor = P. Paúl. Quien cimienta su vida en el Señor = P. Paúl. Alegria y optimismo / P. Paúl. Credo Apostólico. La fe efusiva/ Papa Benedicto XVI. El Mundo en que vivimos/ Card. Shönborn. Himno a Dios, el Omnipotente/ P.H. Orlob. La alabanza a Dios Salmo 148. Epilogo = Padre Paúl Orlob. Índice. El Autor. El libro " Los abrazados  exclusivos" Propaganda". En el contacto con la naturaleza, Benedicto XVI.	t	\N
1000900	\N	Los Misterios del Antiguo Egipto	Lewis Spence	\N	\N	\N	\N	Ariel Isotérica	\N	\N	\N	2392 paginas	Primera	\N	1975	\N	t	\N
1000901	\N	Jorge, el hijo del pueblo	María Nieves y Bustamante	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2391 paginas	\N	Arequipa	2010	\N	t	\N
1000902	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2390 paginas	\N	Arequipa	2010	\N	t	\N
1000903	\N	Venenos que curan ¿El futuro de la medicina está aquí?	. Yasuni-ITT	\N	\N	\N	\N	Talleres de servicios editoriales y gráficos de FIRMART S.A.C	\N	\N	\N	2389 paginas	Primera	\N	\N	\N	t	\N
1000904	\N	Manual de conocimientos básicos para comités de defensa Civil y oficinas de Defensa Civil	SINADECI	\N	\N	\N	\N	Talleres de servicios editoriales y gráficos de FIRMART S.A.C	\N	\N	\N	2388 paginas	Primera	\N	2004	\N	t	\N
1000905	\N	Antología del tercer curso Nacional de cuento	Organizada por Municipalidad Distrital de Paucarpata	\N	\N	\N	\N	Talleres de Egrentus	\N	\N	\N	2387 paginas	Primera	\N	1994	\N	t	\N
1000906	\N	Miguel Graú	Alberto Alexander	\N	\N	\N	978-612-46349-0-1	\N	\N	\N	\N	2386 paginas	Segunda	\N	2016	\N	t	\N
1000907	\N	Mariano Melgar	Mauricio Novoa Cain	\N	\N	\N	978-612-00-2297-9	\N	\N	\N	\N	2385 paginas	Primera	\N	2016	\N	t	\N
1000908	\N	Suyajruna "Una mirada al artista popular peruano"	Sebastián Correa Ehlers	\N	\N	\N	978-603-00-2297-10	Pacíficos	\N	\N	\N	2384 paginas	Primera	\N	2008	\N	t	\N
1000909	\N	Microcosmos.Visión andina de los espacios prehispánicos	Adine Gavazzi	\N	\N	\N	978-612-00-2297-11	Apus Graph Ediciones	\N	\N	\N	2383 paginas	Primera	\N	\N	\N	t	\N
1000910	\N	Paraíso amazónico del Perú. Manú "Parque Nacional de la Biosfera"	Kim Macquarrie/André Bartschi	\N	\N	\N	84-89119-12-0	\N	\N	\N	\N	2382 paginas	Segunda	\N	1998	\N	t	\N
1000911	\N	Perú submarino	Yuri Hooker	\N	\N	\N	978-612-45824-8-4	Apus Graph Ediciones	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2381 paginas	Primera	\N	2014	\N	t	\N
1000912	\N	Mensajes de nuestros antepasados petroglifos de Nazca y Palpa	Giuseppe Orefici	\N	\N	\N	Depósito legal 201213948	Apus Graph Ediciones	HISTORIA	Español	LIBRO	2380 paginas	Primera	\N	2012	\N	t	\N
1000913	\N	Pasión por las personas. La vuelta a Lima,Cuzco e Iquitos en 24 horas	Jaime Saenz Tejada Pulido	\N	\N	\N	978-603-45114-0-8	\N	\N	\N	\N	2379 paginas	Primera	\N	\N	\N	t	\N
1000914	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2378 paginas	\N	Arequipa	2010	\N	t	\N
1000915	\N	Perú sabe. La cocina, arma social	Gastón Acurio y Ferran Adria	\N	\N	\N	\N	\N	\N	\N	\N	2377 paginas	\N	\N	\N	\N	t	\N
1000916	\N	Buscando a Gastón	Patricia Perez	\N	\N	\N	\N	\N	\N	\N	\N	2376 paginas	\N	\N	\N	\N	t	\N
1000917	\N	Reino Oceánico	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	2375 paginas	\N	\N	\N	\N	t	\N
1000918	Formaciòn humana	Artesanía en la sociedad actual	C.Laorden,M.Montalvo, J.M.Moreno y R.Rivas	\N	\N	\N	84-345-7801-8	Salva Editores,S.A. Barcelona	ARTE	Español	LIBRO	64	Primera	Barcelona	1982	\N	t	\N
1000919	Formaciòn humana	Cerámica sin retorno	K. Drake	\N	\N	\N	\N	Editorial Kapelusz	ARTE	Español	LIBRO	127	Primera	Argentina	1972	\N	t	\N
1000920	\N	Contemporary Ceramic Formulas	John W. Conrad, Ph.D.	\N	\N	\N	0-02-527640-9	\N	\N	\N	\N	2372 paginas	Primera	\N	\N	\N	t	\N
1000921	\N	Ceramic skilbooks saltglaze	Peter Starkey	\N	\N	\N	0 8230 4629	Murray Fieldhouse	\N	\N	\N	2371 paginas	Primera	\N	1977	\N	t	\N
1000922	\N	Over 150 Hints for the Ceramists	Dorothy B.Rush	\N	\N	\N	\N	\N	\N	\N	\N	2370 paginas	Primera	\N	\N	\N	t	\N
1000923	\N	Approaches to clay modelling	John and Eric Fisher	\N	\N	\N	\N	\N	\N	\N	\N	2369 paginas	Primera	\N	\N	\N	t	\N
1000924	\N	Dictionary ceramics stains glass	Dorothy B.Rush	\N	\N	\N	\N	\N	\N	\N	\N	2368 paginas	Primera	\N	\N	\N	t	\N
1000925	\N	Woodturning	Eldon Rebhorn	\N	\N	\N	87345-047-7	Lithographed in U.S.A	\N	\N	\N	2367 paginas	Primera	\N	1970	\N	t	\N
1000926	\N	Book of pottery and porcelain	A.M.Lounsbery	\N	\N	\N	0-517-589314	Revised and Augmented Editin	\N	\N	\N	2366 paginas	Primera	\N	\N	\N	t	\N
1000927	\N	2000 years of chinese ceramics	Valrae Reynolds Phillip H.Curtis Yen Fen Pei	\N	\N	\N	\N	-	Historia	Español	Libro	72	Primera	China	1977	\N	t	\N
1000928	\N	World of Japanese ceramics	Herbert H.Sanders Kenkichi Tomimoto	\N	\N	\N	0-87011-557-X	Printed in Japan	\N	\N	\N	2364 paginas	Primera	\N	1967	\N	t	\N
1002695	\N	ESPASA CALPE 15	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	597 paginas	\N	\N	\N	\N	t	\N
1000929	\N	Complete book of pottery making	Jhon B. Kenny drawing by Carla Kenny	\N	\N	\N	0-8019-5933-0	\N	\N	\N	\N	2363 paginas	Segunda	\N	1949	\N	t	\N
1000930	\N	Creating ceramic miniatures	Carla and John B.Kenny	\N	\N	\N	0-517-535920	\N	\N	\N	\N	2362 paginas	Primera	\N	1979	\N	t	\N
1000931	\N	Ceramics a Potter as Handbook	Glenn C. Nelson	\N	\N	\N	0-03086000-8	\N	\N	\N	\N	2361 paginas	Primera	\N	1960	\N	t	\N
1000932	\N	Porcelain. The elite of ceramics	Ronald Serfass	\N	\N	\N	0-517-536218	\N	\N	\N	\N	2360 paginas	Primera	\N	1979	\N	t	\N
1000933	\N	Creative pottery	Peter Cosentino	\N	\N	\N	1-55521-149-6	Printed en Singapore	\N	\N	\N	2359 paginas	Primera	\N	\N	\N	t	\N
1000934	\N	Joys of porcelain	Helen Schaeffer	\N	\N	\N	0-916809-18-8	Printed in U.S.A	\N	\N	\N	2358 paginas	Primera	\N	\N	\N	t	\N
1000935	\N	Artistic Woodturning	Dale L.Nish	\N	\N	\N	0-8425-1842-8	Printed in U.S.A	\N	\N	\N	2357 paginas	Primera	\N	1980	\N	t	\N
1000936	Formacion Humana	Artesanía de la cerámica	Frank Howell Carol Woodward Robert H.Woodward	\N	\N	\N	968-26 0012- X	Editorial Continental	Arte	Español	Libro	173	Primera	Mexico	1979	\N	t	\N
1000937	\N	Ceramics complete introduction to craft of ceramics. Ilustrated in full color	Jolyon Hfsted	\N	\N	\N	67-13488	\N	\N	\N	\N	2355 paginas	Primera	\N	1967	\N	t	\N
1000938	\N	Modeling a likeness in Clay	Daisy Grubbs	\N	\N	\N	0-8230-3094-6	Manufactured in USA	\N	\N	\N	2354 paginas	Primera	\N	1982	\N	t	\N
1000939	\N	Book of Rookwood pottery	Herbert Peck	\N	\N	\N	0-0517-530465	Manufactured in USA	\N	\N	\N	2353 paginas	Primera	\N	1986	\N	t	\N
1000940	\N	Sculpture, modeling and ceramics	Barry Midgley	\N	\N	\N	0 89009-471-3	Printed in Hong Kong	\N	\N	\N	2352 paginas	Primera	\N	\N	\N	t	\N
1000941	\N	Una flor de cuentos para llevar en el corazón	Rosa Cerna Guardia	\N	\N	\N	978-9972-232-53-4	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	2351 paginas	Segunda reimpresión	\N	2010	\N	t	\N
1000942	\N	Una flor de cuentos para llevar en el corazón	Rosa Cerna Guardia	\N	\N	\N	978-9972-232-53-4	Alfaguara/Cuenta Cosas	LITERATURA	Español	LIBRO	2350 paginas	Tercera reimpresión	\N	2011	\N	t	\N
1000943	\N	Cartas a María Elena	José Luis Mejía	\N	\N	\N	978-9972-232-31-2	Alfaguara/Serie Roja	LITERATURA	Español	LIBRO	2349 paginas	Tercera reimpresión	Lima	2011	\N	t	\N
1000944	\N	Nosotros el pueblo. La Historia del Capitolio de los Estados Unidos	Sociedad Historica del Capitolio de los Estados Unidos/ Sociedad Geografica Nacional	\N	\N	\N	65-20721	National Geographic Society	HISTORIA	Español	LIBRO	2348 paginas	Octava	Washington	1972	\N	t	\N
1000945	\N	Enciclopedia Visor T1	Visor Enciclopedia	\N	\N	\N	987-522-033-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2347 paginas	Primera	Argentina	1999	\N	t	\N
1000946	\N	Enciclopedia Visor T2	Visor Enciclopedia	\N	\N	\N	987-522-032-9	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2346 paginas	Primera	Argentina	1999	\N	t	\N
1000947	\N	Enciclopedia Visor T3	Visor Enciclopedia	\N	\N	\N	397-522-040-X	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2345 paginas	Primera	Argentina	1999	\N	t	\N
1000948	\N	Enciclopedia Visor T4	Visor Enciclopedia	\N	\N	\N	987-522-035-3	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2344 paginas	Primera	Argentina	1999	\N	t	\N
1000949	\N	Enciclopedia Visor T5	Visor Enciclopedia	\N	\N	\N	987-522-036-1	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2343 paginas	Primera	Argentina	1999	\N	t	\N
1000950	\N	Enciclopedia Visor T6	Visor Enciclopedia	\N	\N	\N	987-522-037-X	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2342 paginas	Primera	Argentina	1999	\N	t	\N
1000951	\N	Enciclopedia Visor T7	Visor Enciclopedia	\N	\N	\N	987-522-038-8	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2341 paginas	Primera	Argentina	1999	\N	t	\N
1000952	\N	Enciclopedia Visor T8	Visor Enciclopedia	\N	\N	\N	987-522-033-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2340 paginas	Primera	Argentina	1999	\N	t	\N
1000953	\N	Enciclopedia Visor T9	Visor Enciclopedia	\N	\N	\N	987-522-042-6	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2339 paginas	Primera	Argentina	1999	\N	t	\N
1000954	\N	Enciclopedia Visor T10	Visor Enciclopedia	\N	\N	\N	987-522-043-4	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2338 paginas	Primera	Argentina	1999	\N	t	\N
1000955	\N	Enciclopedia Visor T11	Visor Enciclopedia	\N	\N	\N	987-522-044-2	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2337 paginas	Primera	Argentina	1999	\N	t	\N
1000956	\N	Enciclopedia Visor T12	Visor Enciclopedia	\N	\N	\N	987-522-045-0	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2336 paginas	Primera	Argentina	1999	\N	t	\N
1000957	\N	Enciclopedia Visor T13	Visor Enciclopedia	\N	\N	\N	987-522-046-9	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2335 paginas	Primera	Argentina	1999	\N	t	\N
1000958	\N	Enciclopedia Visor T14	Visor Enciclopedia	\N	\N	\N	987-522-047-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2334 paginas	Primera	Argentina	1999	\N	t	\N
1000959	\N	Enciclopedia Visor T15	Visor Enciclopedia	\N	\N	\N	987-522-048-5	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2333 paginas	Primera	Argentina	1999	\N	t	\N
1000960	\N	Enciclopedia Visor T16	Visor Enciclopedia	\N	\N	\N	987-522-049-3	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2332 paginas	Primera	Argentina	1999	\N	t	\N
1000961	\N	Enciclopedia Visor T17	Visor Enciclopedia	\N	\N	\N	987-522-050-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2331 paginas	Primera	Argentina	1999	\N	t	\N
1000962	\N	Enciclopedia Visor T18	Visor Enciclopedia	\N	\N	\N	987-522-051-5	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2330 paginas	Primera	Argentina	1999	\N	t	\N
1000963	\N	Enciclopedia Visor T19	Visor Enciclopedia	\N	\N	\N	987-522-052-3	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2329 paginas	Primera	Argentina	1999	\N	t	\N
1000964	\N	Enciclopedia Visor T20	Visor Enciclopedia	\N	\N	\N	987-522-053-1	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2328 paginas	Primera	Argentina	1999	\N	t	\N
1000965	\N	Enciclopedia Visor T21	Visor Enciclopedia	\N	\N	\N	987-522-059-0	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2327 paginas	Primera	Argentina	1999	\N	t	\N
1000966	\N	Enciclopedia Visor T22	Visor Enciclopedia	\N	\N	\N	987-522-060-4	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2326 paginas	Primera	Argentina	1999	\N	t	\N
1000967	\N	Enciclopedia Visor T23	Visor Enciclopedia	\N	\N	\N	987-522-061-2	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2325 paginas	Primera	Argentina	1999	\N	t	\N
1000968	\N	Enciclopedia Visor T24	Visor Enciclopedia	\N	\N	\N	987-522-033-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2324 paginas	Primera	Argentina	1999	\N	t	\N
1000969	\N	Enciclopedia Visor T25	Visor Enciclopedia	\N	\N	\N	987-522-033-7	Visor E.A.S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2323 paginas	Primera	Argentina	1999	\N	t	\N
1000970	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2322 paginas	\N	Arequipa	2010	\N	t	\N
1000971	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2321 paginas	\N	Arequipa	2010	\N	t	\N
1000972	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2320 paginas	\N	Arequipa	2010	\N	t	\N
1000973	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2319 paginas	\N	Arequipa	2010	\N	t	\N
1002696	\N	ESPASA CALPE 16	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	596 paginas	\N	\N	\N	\N	t	\N
1000974	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2318 paginas	\N	Arequipa	2010	\N	t	\N
1000975	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2317 paginas	\N	Arequipa	2010	\N	t	\N
1000976	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2316 paginas	\N	Arequipa	2010	\N	t	\N
1000977	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2315 paginas	\N	Arequipa	2010	\N	t	\N
1000978	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2314 paginas	\N	Arequipa	2010	\N	t	\N
1000979	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2313 paginas	\N	Arequipa	2010	\N	t	\N
1000980	\N	Enciclopedia universal ilustrada T1	Encyclopedia Britannica	\N	\N	\N	956-8402-80-2	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2312 paginas	\N	\N	\N	\N	t	\N
1000981	\N	Enciclopedia universal ilustrada T2	Encyclopedia Britannica	\N	\N	\N	956-8402-81-0	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2311 paginas	\N	\N	\N	\N	t	\N
1000982	\N	Enciclopedia universal ilustrada T3	Encyclopedia Britannica	\N	\N	\N	956-8402-82-9	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2310 paginas	\N	\N	\N	\N	t	\N
1000983	\N	Enciclopedia universal ilustrada T4	Encyclopedia Britannica	\N	\N	\N	956-8402-83-7	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2309 paginas	\N	\N	\N	\N	t	\N
1000984	\N	Enciclopedia universal ilustrada T5	Encyclopedia Britannica	\N	\N	\N	956-8402-84-5	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2308 paginas	\N	\N	\N	\N	t	\N
1000985	\N	Enciclopedia universal ilustrada T6	Encyclopedia Britannica	\N	\N	\N	956-8402-85-3	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2307 paginas	\N	\N	\N	\N	t	\N
1000986	\N	Enciclopedia universal ilustrada T7	Encyclopedia Britannica	\N	\N	\N	956-8402-86-1	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2306 paginas	\N	\N	\N	\N	t	\N
1000987	\N	Enciclopedia universal ilustrada T8	Encyclopedia Britannica	\N	\N	\N	956-8402-87-7	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2305 paginas	\N	\N	\N	\N	t	\N
1000988	\N	Enciclopedia universal ilustrada T9	Encyclopedia Britannica	\N	\N	\N	956-8402-88-8	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2304 paginas	\N	\N	\N	\N	t	\N
1000989	\N	Enciclopedia universal ilustrada T10	Encyclopedia Britannica	\N	\N	\N	956-8402-89-6	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2303 paginas	\N	\N	\N	\N	t	\N
1000990	\N	Enciclopedia universal ilustrada T11	Encyclopedia Britannica	\N	\N	\N	956-8402-90-X	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2302 paginas	\N	\N	\N	\N	t	\N
1000991	\N	Enciclopedia universal ilustrada T12	Encyclopedia Britannica	\N	\N	\N	956-8402-91-8	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2301 paginas	\N	\N	\N	\N	t	\N
1000992	\N	Enciclopedia universal ilustrada T13	Encyclopedia Britannica	\N	\N	\N	956-8402-92-6	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2300 paginas	\N	\N	\N	\N	t	\N
1000993	\N	Enciclopedia universal ilustrada T14	Encyclopedia Britannica	\N	\N	\N	956-8402-93-4	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2299 paginas	\N	\N	\N	\N	t	\N
1000994	\N	Enciclopedia universal ilustrada T15	Encyclopedia Britannica	\N	\N	\N	956-8402-94-2	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2298 paginas	\N	\N	\N	\N	t	\N
1000995	\N	Enciclopedia universal ilustrada T16	Encyclopedia Britannica	\N	\N	\N	956-8402-95-0	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2297 paginas	\N	\N	\N	\N	t	\N
1000996	\N	Enciclopedia universal ilustrada T17	Encyclopedia Britannica	\N	\N	\N	956-8402-96-9	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2296 paginas	\N	\N	\N	\N	t	\N
1000997	\N	Enciclopedia universal ilustrada T18	Encyclopedia Britannica	\N	\N	\N	956-8402-97-7	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2295 paginas	\N	\N	\N	\N	t	\N
1000998	\N	Enciclopedia universal ilustrada T19	Encyclopedia Britannica	\N	\N	\N	956-8402-98-5	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2294 paginas	\N	\N	\N	\N	t	\N
1000999	\N	Enciclopedia universal ilustrada T20	Encyclopedia Britannica	\N	\N	\N	956-8402-99-3	Britannica	ENCICLOPEDIA	Español	ENCICLOPEDIA	2293 paginas	\N	\N	\N	\N	t	\N
1001000	\N	Museo del Louvre T1	Museos Del Mundo	\N	\N	\N	978-9972-2984-1-7	Centro editor PDA,S.L.	ARTE	Español	COLECCIÓN	2292 paginas	\N	\N	\N	\N	t	\N
1001001	\N	Museo del Louvre T2	Museos Del Mundo	\N	\N	\N	978-9972-2984-2-4	Centro editor PDA,S.L.	ARTE	Español	COLECCIÓN	2291 paginas	\N	\N	\N	\N	t	\N
1001002	\N	Museo del Prado T1	Museos Del Mundo	\N	\N	\N	978-9972-2984-3-1	Centro editor PDA,S.L.	ARTE	Español	COLECCIÓN	2290 paginas	\N	\N	\N	\N	t	\N
1001003	\N	Museo del Prado T2	Museos Del Mundo	\N	\N	\N	978-9972-2984-4-8	Centro editor PDA,S.L.	ARTE	Español	COLECCIÓN	2289 paginas	\N	\N	\N	\N	t	\N
1001004	\N	COUSTEAU. Enciclopedia del Mar T1	Folio	\N	\N	\N	84-7583-494-9	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2288 paginas	\N	\N	\N	\N	t	\N
1001005	\N	COUSTEAU. Enciclopedia del Mar T2	Folio	\N	\N	\N	84-7583-495-7	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2287 paginas	\N	\N	\N	\N	t	\N
1001006	\N	COUSTEAU. Enciclopedia del Mar T3	Folio	\N	\N	\N	84-7583-496-5	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2286 paginas	\N	\N	\N	\N	t	\N
1001007	\N	COUSTEAU. Enciclopedia del Mar T4	Folio	\N	\N	\N	84-7583-497-3	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2285 paginas	\N	\N	\N	\N	t	\N
1001008	\N	COUSTEAU. Enciclopedia del Mar T5	Folio	\N	\N	\N	84-7583-498-1	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2284 paginas	\N	\N	\N	\N	t	\N
1001009	\N	COUSTEAU. Enciclopedia del Mar T6	Folio	\N	\N	\N	84-7583-499-X	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2283 paginas	\N	\N	\N	\N	t	\N
1001010	\N	COUSTEAU. Enciclopedia del Mar T7	Folio	\N	\N	\N	84-7583-500-7	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2282 paginas	\N	\N	\N	\N	t	\N
1001011	\N	COUSTEAU. Enciclopedia del Mar T8	Folio	\N	\N	\N	84-7583-501-5	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2281 paginas	\N	\N	\N	\N	t	\N
1001012	\N	COUSTEAU. Enciclopedia del Mar T9	Folio	\N	\N	\N	84-7583-502-3	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2280 paginas	\N	\N	\N	\N	t	\N
1001013	\N	COUSTEAU. Enciclopedia del Mar T10	Folio	\N	\N	\N	84-7583-503-1	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2279 paginas	\N	\N	\N	\N	t	\N
1001014	\N	COUSTEAU. Enciclopedia del Mar T11	Folio	\N	\N	\N	84-7583-504-X	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2278 paginas	\N	\N	\N	\N	t	\N
1001015	\N	COUSTEAU. Enciclopedia del Mar T12	Folio	\N	\N	\N	84-7583-505-8	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2277 paginas	\N	\N	\N	\N	t	\N
1001016	\N	COUSTEAU. Enciclopedia del Mar T13	Folio	\N	\N	\N	84-7583-506-6	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2276 paginas	\N	\N	\N	\N	t	\N
1001017	\N	COUSTEAU. Enciclopedia del Mar T14	Folio	\N	\N	\N	84-7583-507-4	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2275 paginas	\N	\N	\N	\N	t	\N
1001018	\N	COUSTEAU. Enciclopedia del Mar T15	Folio	\N	\N	\N	84-7583-508-2	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2274 paginas	\N	\N	\N	\N	t	\N
1001019	\N	COUSTEAU. Enciclopedia del Mar T16	Folio	\N	\N	\N	84-7583-509-0	Ediciones Folio,S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2273 paginas	\N	\N	\N	\N	t	\N
1001020	\N	COUSTEAU. Enciclopedia del Mar T17	Folio	\N	\N	\N	84-7583-510-4	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2272 paginas	\N	\N	\N	\N	t	\N
1002697	\N	ESPASA CALPE 17	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	595 paginas	\N	\N	\N	\N	t	\N
1001021	\N	COUSTEAU. Enciclopedia del Mar T18	Folio	\N	\N	\N	84-7583-511-2	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2271 paginas	\N	\N	\N	\N	t	\N
1001022	\N	COUSTEAU. Enciclopedia del Mar T19	Folio	\N	\N	\N	84-7583-512-0	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2270 paginas	\N	\N	\N	\N	t	\N
1001023	\N	COUSTEAU. Viajes T20	Folio	\N	\N	\N	84-7583-513-9	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2269 paginas	\N	\N	\N	\N	t	\N
1001024	\N	COUSTEAU. Viajes T21	Folio	\N	\N	\N	84-7583-514-7	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2268 paginas	\N	\N	\N	\N	t	\N
1001025	\N	COUSTEAU. Viajes T22	Folio	\N	\N	\N	84-7583-515-5	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2267 paginas	\N	\N	\N	\N	t	\N
1001026	\N	COUSTEAU. Viajes T23	Folio	\N	\N	\N	84-7583-516-3	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2266 paginas	\N	\N	\N	\N	t	\N
1001027	\N	COUSTEAU. Viajes T24	Folio	\N	\N	\N	84-7583-517-1	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2265 paginas	\N	\N	\N	\N	t	\N
1001028	\N	COUSTEAU. Viajes T25	Folio	\N	\N	\N	84-7583-518-X	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2264 paginas	\N	\N	\N	\N	t	\N
1001029	\N	COUSTEAU. Viajes T26	Folio	\N	\N	\N	84-7583-519-8	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2263 paginas	\N	\N	\N	\N	t	\N
1001030	\N	COUSTEAU. Viajes T27	Folio	\N	\N	\N	84-7583-522-8	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2262 paginas	\N	\N	\N	\N	t	\N
1001031	\N	COUSTEAU. Viajes T28	Folio	\N	\N	\N	84-7583-523-6	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2261 paginas	\N	\N	\N	\N	t	\N
1001032	\N	COUSTEAU. Viajes T29	Folio	\N	\N	\N	84-7583-524-4	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2260 paginas	\N	\N	\N	\N	t	\N
1001033	\N	COUSTEAU. Viajes T30	Folio	\N	\N	\N	84-7583-525-2	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2259 paginas	\N	\N	\N	\N	t	\N
1001034	\N	COUSTEAU. Viajes T31	Folio	\N	\N	\N	84-7583-527-9	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2258 paginas	\N	\N	\N	\N	t	\N
1001035	\N	COUSTEAU. Viajes T32	Folio	\N	\N	\N	84-7583-528-7	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2257 paginas	\N	\N	\N	\N	t	\N
1001036	\N	COUSTEAU. Viajes T33	Folio	\N	\N	\N	84-7583-529-5	Ediciones Folio,S.A.	LITERATURA	Español	ENCICLOPEDIA	2256 paginas	\N	\N	\N	\N	t	\N
1001037	\N	Santuarios nacionales del Perú T1	Walter H. Wust	\N	\N	\N	9972-40-274-6	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2255 paginas	\N	\N	\N	\N	t	\N
1001038	\N	Santuarios nacionales del Perú T2	Walter H. Wust	\N	\N	\N	9972-40-275-4	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2254 paginas	\N	\N	\N	\N	t	\N
1001039	\N	Santuarios nacionales del Perú T3	Walter H. Wust	\N	\N	\N	9972-40-276-2	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2253 paginas	\N	\N	\N	\N	t	\N
1001040	\N	Santuarios nacionales del Perú T4	Walter H. Wust	\N	\N	\N	9972-40-277-0	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2252 paginas	\N	\N	\N	\N	t	\N
1001041	\N	Santuarios nacionales del Perú T5	Walter H. Wust	\N	\N	\N	9972-40-278-9	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2251 paginas	\N	\N	\N	\N	t	\N
1001042	\N	Santuarios nacionales del Perú T6	Walter H. Wust	\N	\N	\N	9972-40-279-7	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2250 paginas	\N	\N	\N	\N	t	\N
1001043	\N	Santuarios nacionales del Perú T7	Walter H. Wust	\N	\N	\N	9972-40-280-0	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2249 paginas	\N	\N	\N	\N	t	\N
1001044	\N	Santuarios nacionales del Perú T8	Walter H. Wust	\N	\N	\N	9972-40-281-9	Ediciones PEISA S.A.C.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2248 paginas	\N	\N	\N	\N	t	\N
1001045	\N	Desde china, un país fascinante y misterioso	Guillermo Danino	\N	\N	\N	9972-606-33-3	Ediciones COPÉ,LIMA	CULTURA GRAL	Español	LIBRO	2247 paginas	\N	\N	\N	\N	t	\N
1001046	\N	Enciclopedia V1	Salvat Editores	\N	\N	\N	84-9789-297-6	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2246 paginas	\N	\N	\N	\N	t	\N
1001047	\N	Enciclopedia V2	Salvat Editores	\N	\N	\N	84-9789-298-4	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2245 paginas	\N	\N	\N	\N	t	\N
1001048	\N	Enciclopedia V3	Salvat Editores	\N	\N	\N	84-9789-299-2	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2244 paginas	\N	\N	\N	\N	t	\N
1001049	\N	Enciclopedia V4	Salvat Editores	\N	\N	\N	84-9789-300-X	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2243 paginas	\N	\N	\N	\N	t	\N
1001050	\N	Enciclopedia V5	Salvat Editores	\N	\N	\N	84-9789-301-8	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2242 paginas	\N	\N	\N	\N	t	\N
1001051	\N	Enciclopedia V6	Salvat Editores	\N	\N	\N	84-9789-302-6	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2241 paginas	\N	\N	\N	\N	t	\N
1001052	\N	Enciclopedia V7	Salvat Editores	\N	\N	\N	84-9789-303-4	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2240 paginas	\N	\N	\N	\N	t	\N
1001053	\N	Enciclopedia V8	Salvat Editores	\N	\N	\N	84-9789-304-2	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2239 paginas	\N	\N	\N	\N	t	\N
1001054	\N	Enciclopedia V9	Salvat Editores	\N	\N	\N	84-9789-305-0	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2238 paginas	\N	\N	\N	\N	t	\N
1001055	\N	Enciclopedia V10	Salvat Editores	\N	\N	\N	84-9789-7474-8	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2237 paginas	\N	\N	\N	\N	t	\N
1001056	\N	Enciclopedia V11	Salvat Editores	\N	\N	\N	84-9789-7475-6	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2236 paginas	\N	\N	\N	\N	t	\N
1001057	\N	Enciclopedia V12	Salvat Editores	\N	\N	\N	84-9789-7476-4	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2235 paginas	\N	\N	\N	\N	t	\N
1001058	\N	Enciclopedia V13	Salvat Editores	\N	\N	\N	84-9789-309-3	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2234 paginas	\N	\N	\N	\N	t	\N
1001059	\N	Enciclopedia V14	Salvat Editores	\N	\N	\N	84-9789-310-7	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2233 paginas	\N	\N	\N	\N	t	\N
1001060	\N	Enciclopedia V15	Salvat Editores	\N	\N	\N	84-9789-311-5	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2232 paginas	\N	\N	\N	\N	t	\N
1001061	\N	Enciclopedia V16	Salvat Editores	\N	\N	\N	84-9789-312-3	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2231 paginas	\N	\N	\N	\N	t	\N
1001062	\N	Enciclopedia V17	Salvat Editores	\N	\N	\N	84-9789-313-1	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2230 paginas	\N	\N	\N	\N	t	\N
1001063	\N	Enciclopedia V18	Salvat Editores	\N	\N	\N	84-9789-314-X	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2229 paginas	\N	\N	\N	\N	t	\N
1001064	\N	Enciclopedia V19	Salvat Editores	\N	\N	\N	84-9789-315-8	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2228 paginas	\N	\N	\N	\N	t	\N
1001065	\N	Enciclopedia V20	Salvat Editores	\N	\N	\N	84-9789-316-6	Salvat Editores S.A.	ENCICLOPEDIA	Español	ENCICLOPEDIA	2227 paginas	\N	\N	\N	\N	t	\N
1001066	\N	Mundo de National Geographic T1	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-385-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2226 paginas	\N	\N	\N	\N	t	\N
1001067	\N	Mundo de National Geographic T2	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-386-1	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2225 paginas	\N	\N	\N	\N	t	\N
1001068	\N	Mundo de National Geographic T3	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-792-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2224 paginas	\N	\N	\N	\N	t	\N
1001069	\N	Mundo de National Geographic T4	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-374-8	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2223 paginas	\N	\N	\N	\N	t	\N
1001070	\N	Mundo de National Geographic T5	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-376-4	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2222 paginas	\N	\N	\N	\N	t	\N
1001071	\N	Mundo de National Geographic T6	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-377-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2221 paginas	\N	\N	\N	\N	t	\N
1001072	\N	Mundo de National Geographic T7	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-379-9	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2220 paginas	\N	\N	\N	\N	t	\N
1001073	\N	Mundo de National Geographic T8	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-380-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2219 paginas	\N	\N	\N	\N	t	\N
1001074	\N	Mundo de National Geographic T9	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-382-9	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2218 paginas	\N	\N	\N	\N	t	\N
1001075	\N	Mundo de National Geographic T10	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-383-7	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2217 paginas	\N	\N	\N	\N	t	\N
1001076	\N	Mundo de National Geographic T11	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-363-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2216 paginas	\N	\N	\N	\N	t	\N
1001077	\N	Mundo de National Geographic T12	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-364-0	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2215 paginas	\N	\N	\N	\N	t	\N
1001078	\N	Mundo de National Geographic T13	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-388-8	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2214 paginas	\N	\N	\N	\N	t	\N
1001079	\N	Mundo de National Geographic T14	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-389-6	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2213 paginas	\N	\N	\N	\N	t	\N
1001080	\N	Mundo de National Geographic T15	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-391-8	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2212 paginas	\N	\N	\N	\N	t	\N
1001081	\N	Mundo de National Geographic T16	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-392-6	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2211 paginas	\N	\N	\N	\N	t	\N
1001082	\N	Mundo de National Geographic T17	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-394-2	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2210 paginas	\N	\N	\N	\N	t	\N
1001083	\N	Mundo de National Geographic T18	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-395-0	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2209 paginas	\N	\N	\N	\N	t	\N
1001084	\N	Mundo de National Geographic T19	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-397-7	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2208 paginas	\N	\N	\N	\N	t	\N
1001085	\N	Mundo de National Geographic T20	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-398-5	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2207 paginas	\N	\N	\N	\N	t	\N
1001086	\N	Mundo de National Geographic T21	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-403-5	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2206 paginas	\N	\N	\N	\N	t	\N
1001087	\N	Mundo de National Geographic T22	NATIONAL GEOGRAPHIC SOCIETY	\N	\N	\N	84-7583-404-3	Folio S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2205 paginas	\N	\N	\N	\N	t	\N
1001088	\N	Enciclopedia universal T1	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1430-6	EDITORIAL SALVART, S.L. 2009	ENCICLOPEDIA	Español	ENCICLOPEDIA	2204 paginas	\N	\N	\N	\N	t	\N
1001089	\N	Enciclopedia universal T2	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1431-3	EDITORIAL SALVART, S.L. 2010	ENCICLOPEDIA	Español	ENCICLOPEDIA	2203 paginas	\N	\N	\N	\N	t	\N
1001090	\N	Enciclopedia universal T3	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1432-0	EDITORIAL SALVART, S.L. 2011	ENCICLOPEDIA	Español	ENCICLOPEDIA	2202 paginas	\N	\N	\N	\N	t	\N
1001091	\N	Enciclopedia universal T4	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1433-7	EDITORIAL SALVART, S.L. 2012	ENCICLOPEDIA	Español	ENCICLOPEDIA	2201 paginas	\N	\N	\N	\N	t	\N
1001092	\N	Enciclopedia universal T5	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1434-4	EDITORIAL SALVART, S.L. 2013	ENCICLOPEDIA	Español	ENCICLOPEDIA	2200 paginas	\N	\N	\N	\N	t	\N
1001093	\N	Enciclopedia universal T6	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1435-1	EDITORIAL SALVART, S.L. 2014	ENCICLOPEDIA	Español	ENCICLOPEDIA	2199 paginas	\N	\N	\N	\N	t	\N
1001094	\N	Enciclopedia universal T7	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1436-8	EDITORIAL SALVART, S.L. 2015	ENCICLOPEDIA	Español	ENCICLOPEDIA	2198 paginas	\N	\N	\N	\N	t	\N
1001095	\N	Enciclopedia universal T8	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1437-5	EDITORIAL SALVART, S.L. 2016	ENCICLOPEDIA	Español	ENCICLOPEDIA	2197 paginas	\N	\N	\N	\N	t	\N
1001096	\N	Enciclopedia universal T9	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1438-2	EDITORIAL SALVART, S.L. 2017	ENCICLOPEDIA	Español	ENCICLOPEDIA	2196 paginas	\N	\N	\N	\N	t	\N
1001097	\N	Enciclopedia universal T10	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1439-9	EDITORIAL SALVART, S.L. 2018	ENCICLOPEDIA	Español	ENCICLOPEDIA	2195 paginas	\N	\N	\N	\N	t	\N
1001098	\N	Enciclopedia universal T11	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1440-5	EDITORIAL SALVART, S.L. 2019	ENCICLOPEDIA	Español	ENCICLOPEDIA	2194 paginas	\N	\N	\N	\N	t	\N
1001099	\N	Enciclopedia universal T12	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1441-2	EDITORIAL SALVART, S.L. 2020	ENCICLOPEDIA	Español	ENCICLOPEDIA	2193 paginas	\N	\N	\N	\N	t	\N
1001100	\N	Enciclopedia universal T13	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1442-9	EDITORIAL SALVART, S.L. 2021	ENCICLOPEDIA	Español	ENCICLOPEDIA	2192 paginas	\N	\N	\N	\N	t	\N
1001101	\N	Enciclopedia universal T14	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1443-6	EDITORIAL SALVART, S.L. 2022	ENCICLOPEDIA	Español	ENCICLOPEDIA	2191 paginas	\N	\N	\N	\N	t	\N
1001102	\N	Enciclopedia universal T15	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1444-3	EDITORIAL SALVART, S.L. 2023	ENCICLOPEDIA	Español	ENCICLOPEDIA	2190 paginas	\N	\N	\N	\N	t	\N
1001103	\N	Enciclopedia universal T16	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1445-0	EDITORIAL SALVART, S.L. 2024	ENCICLOPEDIA	Español	ENCICLOPEDIA	2189 paginas	\N	\N	\N	\N	t	\N
1001104	\N	Enciclopedia universal T17	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1446-7	EDITORIAL SALVART, S.L. 2025	ENCICLOPEDIA	Español	ENCICLOPEDIA	2188 paginas	\N	\N	\N	\N	t	\N
1001105	\N	Enciclopedia universal T18	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1447-4	EDITORIAL SALVART, S.L. 2026	ENCICLOPEDIA	Español	ENCICLOPEDIA	2187 paginas	\N	\N	\N	\N	t	\N
1001106	\N	Enciclopedia universal T19	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1448-1	EDITORIAL SALVART, S.L. 2027	ENCICLOPEDIA	Español	ENCICLOPEDIA	2186 paginas	\N	\N	\N	\N	t	\N
1001107	\N	Enciclopedia universal T20	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1449-8	EDITORIAL SALVART, S.L. 2028	ENCICLOPEDIA	Español	ENCICLOPEDIA	2185 paginas	\N	\N	\N	\N	t	\N
1001108	\N	Enciclopedia universal T21	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1450-4	EDITORIAL SALVART, S.L. 2029	ENCICLOPEDIA	Español	ENCICLOPEDIA	2184 paginas	\N	\N	\N	\N	t	\N
1001109	\N	Enciclopedia universal T22	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1451-1	EDITORIAL SALVART, S.L. 2030	ENCICLOPEDIA	Español	ENCICLOPEDIA	2183 paginas	\N	\N	\N	\N	t	\N
1001110	\N	Enciclopedia universal T23	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1452-8	EDITORIAL SALVART, S.L. 2031	ENCICLOPEDIA	Español	ENCICLOPEDIA	2182 paginas	\N	\N	\N	\N	t	\N
1001111	\N	Enciclopedia universal T24	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1453-5	EDITORIAL SALVART, S.L. 2032	ENCICLOPEDIA	Español	ENCICLOPEDIA	2181 paginas	\N	\N	\N	\N	t	\N
1001112	\N	Enciclopedia universal T25	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1454-2	EDITORIAL SALVART, S.L. 2033	ENCICLOPEDIA	Español	ENCICLOPEDIA	2180 paginas	\N	\N	\N	\N	t	\N
1001113	\N	Enciclopedia universal T26	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1455-9	EDITORIAL SALVART, S.L. 2034	ENCICLOPEDIA	Español	ENCICLOPEDIA	2179 paginas	\N	\N	\N	\N	t	\N
1001114	\N	Enciclopedia universal T27	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1456-6	EDITORIAL SALVART, S.L. 2035	ENCICLOPEDIA	Español	ENCICLOPEDIA	2178 paginas	\N	\N	\N	\N	t	\N
1001115	\N	Enciclopedia universal T28	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1457-3	EDITORIAL SALVART, S.L. 2036	ENCICLOPEDIA	Español	ENCICLOPEDIA	2177 paginas	\N	\N	\N	\N	t	\N
1001116	\N	Enciclopedia universal T29	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1458-0	EDITORIAL SALVART, S.L. 2037	ENCICLOPEDIA	Español	ENCICLOPEDIA	2176 paginas	\N	\N	\N	\N	t	\N
1001117	\N	Enciclopedia universal T30	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1459-7	EDITORIAL SALVART, S.L. 2038	ENCICLOPEDIA	Español	ENCICLOPEDIA	2175 paginas	\N	\N	\N	\N	t	\N
1001118	\N	Enciclopedia universal T31	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1460-3	EDITORIAL SALVART, S.L. 2039	ENCICLOPEDIA	Español	ENCICLOPEDIA	2174 paginas	\N	\N	\N	\N	t	\N
1001119	\N	Enciclopedia universal T32	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1461-0	EDITORIAL SALVART, S.L. 2040	ENCICLOPEDIA	Español	ENCICLOPEDIA	2173 paginas	\N	\N	\N	\N	t	\N
1001120	\N	Enciclopedia universal T33	EDITORIAL SALVAT, S.L.	\N	\N	\N	978-84-471-1462-7	EDITORIAL SALVART, S.L. 2041	ENCICLOPEDIA	Español	ENCICLOPEDIA	2172 paginas	\N	\N	\N	\N	t	\N
1001121	\N	Viaje a través del universo V1	TIME LIFE-FOLIO	\N	\N	\N	84-7583-926-6	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2171 paginas	\N	\N	\N	\N	t	\N
1001122	\N	Viaje a través del universo V2	TIME LIFE-FOLIO	\N	\N	\N	84-7583-927-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2170 paginas	\N	\N	\N	\N	t	\N
1001123	\N	Viaje a través del universo V3	TIME LIFE-FOLIO	\N	\N	\N	84-7583-928-2	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2169 paginas	\N	\N	\N	\N	t	\N
1001124	\N	Viaje a través del universo V4	TIME LIFE-FOLIO	\N	\N	\N	84-7583-929-0	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2168 paginas	\N	\N	\N	\N	t	\N
1001125	\N	Viaje a través del universo V5	TIME LIFE-FOLIO	\N	\N	\N	84-7583-930-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2167 paginas	\N	\N	\N	\N	t	\N
1001126	\N	Viaje a través del universo V6	TIME LIFE-FOLIO	\N	\N	\N	84-7583-931-2	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2166 paginas	\N	\N	\N	\N	t	\N
1001127	\N	Viaje a través del universo V7	TIME LIFE-FOLIO	\N	\N	\N	84-7583-932-0	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2165 paginas	\N	\N	\N	\N	t	\N
1001128	\N	Viaje a través del universo V8	TIME LIFE-FOLIO	\N	\N	\N	84-7583-933-9	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2164 paginas	\N	\N	\N	\N	t	\N
1001129	\N	Viaje a través del universo V9	TIME LIFE-FOLIO	\N	\N	\N	84-7583-934-7	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2163 paginas	\N	\N	\N	\N	t	\N
1001130	\N	Viaje a través del universo V10	TIME LIFE-FOLIO	\N	\N	\N	84-7583-935-5	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2162 paginas	\N	\N	\N	\N	t	\N
1001131	\N	Viaje a través del universo V11	TIME LIFE-FOLIO	\N	\N	\N	84-7583-936-3	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2161 paginas	\N	\N	\N	\N	t	\N
1001132	\N	Viaje a través del universo V12	TIME LIFE-FOLIO	\N	\N	\N	84-7583-937-1	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2160 paginas	\N	\N	\N	\N	t	\N
1001133	\N	Viaje a través del universo V13	TIME LIFE-FOLIO	\N	\N	\N	84-7583-938-X	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2159 paginas	\N	\N	\N	\N	t	\N
1001134	\N	Viaje a través del universo V14	TIME LIFE-FOLIO	\N	\N	\N	84-7583-939-8	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2158 paginas	\N	\N	\N	\N	t	\N
1001135	\N	Viaje a través del universo V15	TIME LIFE-FOLIO	\N	\N	\N	84-7583-940-1	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2157 paginas	\N	\N	\N	\N	t	\N
1001136	\N	Viaje a través del universo V16	TIME LIFE-FOLIO	\N	\N	\N	84-7583-941-X	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2156 paginas	\N	\N	\N	\N	t	\N
1001137	\N	Viaje a través del universo V17	TIME LIFE-FOLIO	\N	\N	\N	84-7583-942-8	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2155 paginas	\N	\N	\N	\N	t	\N
1001138	\N	Viaje a través del universo V18	TIME LIFE-FOLIO	\N	\N	\N	84-7583-943-6	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2154 paginas	\N	\N	\N	\N	t	\N
1001139	\N	Viaje a través del universo V19	TIME LIFE-FOLIO	\N	\N	\N	84-7583-944-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2153 paginas	\N	\N	\N	\N	t	\N
1001140	\N	Viaje a través del universo V20	TIME LIFE-FOLIO	\N	\N	\N	84-7583-779-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2152 paginas	\N	\N	\N	\N	t	\N
1001141	\N	Viaje a través del universo V21	TIME LIFE-FOLIO	\N	\N	\N	84-7583-780-8	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2151 paginas	\N	\N	\N	\N	t	\N
1001142	\N	Viaje a través del universo V22	TIME LIFE-FOLIO	\N	\N	\N	84-7583-781-6	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2150 paginas	\N	\N	\N	\N	t	\N
1001143	\N	Viaje a través del universo V23	TIME LIFE-FOLIO	\N	\N	\N	84-7583-782-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2149 paginas	\N	\N	\N	\N	t	\N
1001144	\N	Viaje a través del universo V24	TIME LIFE-FOLIO	\N	\N	\N	84-7583-782-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2148 paginas	\N	\N	\N	\N	t	\N
1001145	\N	Viaje a través del universo V25	TIME LIFE-FOLIO	\N	\N	\N	84-7583-784-0	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2147 paginas	\N	\N	\N	\N	t	\N
1001146	\N	Viaje a través del universo V26	TIME LIFE-FOLIO	\N	\N	\N	84-7583-785-9	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2146 paginas	\N	\N	\N	\N	t	\N
1001147	\N	Viaje a través del universo V27	TIME LIFE-FOLIO	\N	\N	\N	84-7583-786-7	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2145 paginas	\N	\N	\N	\N	t	\N
1001148	\N	Viaje a través del universo V28	TIME LIFE-FOLIO	\N	\N	\N	84-7583-787-5	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2144 paginas	\N	\N	\N	\N	t	\N
1001149	\N	Viaje a través del universo V29	TIME LIFE-FOLIO	\N	\N	\N	84-7583-788-3	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2143 paginas	\N	\N	\N	\N	t	\N
1001150	\N	Viaje a través del universo V30	TIME LIFE-FOLIO	\N	\N	\N	84-7583-789-3	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2142 paginas	\N	\N	\N	\N	t	\N
1001151	\N	Viaje a través del universo V31	TIME LIFE-FOLIO	\N	\N	\N	84-7583-790-5	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2141 paginas	\N	\N	\N	\N	t	\N
1001152	\N	Viaje a través del universo V32	TIME LIFE-FOLIO	\N	\N	\N	84-7583-791-3	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2140 paginas	\N	\N	\N	\N	t	\N
1001153	\N	Viaje a través del universo V33	TIME LIFE-FOLIO	\N	\N	\N	84-7583-792-1	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2139 paginas	\N	\N	\N	\N	t	\N
1001154	\N	Viaje a través del universo V34	TIME LIFE-FOLIO	\N	\N	\N	\N	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2138 paginas	\N	\N	\N	\N	t	\N
1001155	\N	Viaje a través del universo V35	TIME LIFE-FOLIO	\N	\N	\N	84-7583-794-8	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2137 paginas	\N	\N	\N	\N	t	\N
1002698	\N	ESPASA CALPE 18	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	594 paginas	\N	\N	\N	\N	t	\N
1001156	\N	Viaje a través del universo V36	TIME LIFE-FOLIO	\N	\N	\N	84-7583-795-6	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2136 paginas	\N	\N	\N	\N	t	\N
1001157	\N	Viaje a través del universo V37	TIME LIFE-FOLIO	\N	\N	\N	84-7583-796-4	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2135 paginas	\N	\N	\N	\N	t	\N
1001158	\N	Viaje a través del universo V38	TIME LIFE-FOLIO	\N	\N	\N	84-7583-797-2	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2134 paginas	\N	\N	\N	\N	t	\N
1001159	\N	Viaje a través del universo V39	TIME LIFE-FOLIO	\N	\N	\N	84-413-0205-7	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2133 paginas	\N	\N	\N	\N	t	\N
1001160	\N	Viaje a través del universo V40	TIME LIFE-FOLIO	\N	\N	\N	84-413-0205-5	EDITORIAL FOLIO, S.A.	GEOGRAFÍA Y NATURALEZA	Español	COLECCIÓN	2132 paginas	\N	\N	\N	\N	t	\N
1001161	\N	Atlas del Perú T1	EL COMERCIO	\N	\N	\N	978-612-4032-50-9	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2131 paginas	\N	\N	\N	\N	t	\N
1001162	\N	Atlas del Perú T2	EL COMERCIO	\N	\N	\N	978-612-4032-51-6	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2130 paginas	\N	\N	\N	\N	t	\N
1001163	\N	Atlas del Perú T3	EL COMERCIO	\N	\N	\N	978-612-4032-52-3	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2129 paginas	\N	\N	\N	\N	t	\N
1001164	\N	Atlas del Perú T4	EL COMERCIO	\N	\N	\N	978-612-4032-53-0	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2128 paginas	\N	\N	\N	\N	t	\N
1001165	\N	Atlas del Perú T5	EL COMERCIO	\N	\N	\N	978-612-4032-54-7	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2127 paginas	\N	\N	\N	\N	t	\N
1001166	\N	Atlas del Perú T6	EL COMERCIO	\N	\N	\N	978-612-4032-55-4	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2126 paginas	\N	\N	\N	\N	t	\N
1001167	\N	Atlas del Perú T7	EL COMERCIO	\N	\N	\N	978-612-4032-56-1	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2125 paginas	\N	\N	\N	\N	t	\N
1001168	\N	Atlas del Perú T8	EL COMERCIO	\N	\N	\N	978-612-4032-57-8	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2124 paginas	\N	\N	\N	\N	t	\N
1001169	\N	Atlas del Perú T9	EL COMERCIO	\N	\N	\N	978-612-4032-58-5	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2123 paginas	\N	\N	\N	\N	t	\N
1001170	\N	Atlas del Perú T10	EL COMERCIO	\N	\N	\N	978-612-4032-59-2	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2122 paginas	\N	\N	\N	\N	t	\N
1001171	\N	Atlas del Perú T11	EL COMERCIO	\N	\N	\N	978-612-4032-60-8	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2121 paginas	\N	\N	\N	\N	t	\N
1001172	\N	Atlas del Perú T12	EL COMERCIO	\N	\N	\N	978-612-4032-61-5	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2120 paginas	\N	\N	\N	\N	t	\N
1001173	\N	Atlas del Perú T13	EL COMERCIO	\N	\N	\N	978-612-4032-62-2	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2119 paginas	\N	\N	\N	\N	t	\N
1001174	\N	Atlas del Perú T14	EL COMERCIO	\N	\N	\N	978-612-4032-63-9	PRODUCCIONES CANTABRIA S.A.C.	CIENCIAS SOCIALES	Español	COLECCIÓN	2118 paginas	\N	\N	\N	\N	t	\N
1001175	\N	Atlas y geografía del mundo	LEXUS	\N	\N	\N	9972-625-20-6	LEXUS EDITORES S.A.	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	2117 paginas	\N	\N	\N	\N	t	\N
1001176	\N	SOPENA- Gran atlas columbus	EDITORIAL RAMÓN SOPENA, S.A.	\N	\N	\N	84-303-0859-8	EDITORIAL RAMÓN SOPENA,S.A.	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	2116 paginas	\N	\N	\N	\N	t	\N
1001177	\N	Guía de práctica de álgebra y geometría - Facultad de ingeniería y computación	José Alberto Carpio Alatrista, Vidal Martín Bolaños, Dugán Nina, Matide Peña,Nancy Quispe, Fredy Tito, Luz Vasquez	\N	\N	\N	978-612-4353-17-8	Universidad Católica San Pablo	MATEMÁTICA	Español	COLECCIÓN	2115 paginas	\N	\N	\N	\N	t	\N
1001178	\N	Guía de prácticas de física I - Facultad de ingeniería y computación	Henry Javier Ccallata, Jessica Mosteira Yauri	\N	\N	\N	978-612-4353-04-8	Universidad Católica San Pablo	FÍSICA	Español	GUÍA	2114 paginas	\N	\N	\N	\N	t	\N
1001179	\N	Guía de práctica de física II - Facultad de ingeniería y computación	Jim Chávez, Jessica Mosqueira, Lourdes Soria, Wilmer Sucasaire	\N	\N	\N	978-612-4353-12-3	Universidad Católica San Pablo	FÍSICA	Español	GUÍA	2113 paginas	\N	\N	\N	\N	t	\N
1001180	\N	Guías de problemas de química I - Escuela profesional de ingeniería industral	Lizandra Lopéz,Gonzalo Delange,Mónica Díaz,Jaime Muñoz,Violeta Rojas,Alejandro Zegarra	\N	\N	\N	978-612-4353-19-2	Universidad Católica San Pablo	QUÍMICA	Español	GUÍA	2112 paginas	\N	\N	\N	\N	t	\N
1001181	\N	Cuaderno de trabajo de introducción a la matemática	Renzo Acosta,Magaly Alvarez,Freddy Begazo,Mirian Carpio,Jorge Chambi,Jimmy Cruz,Gonzalo Mendoza,Juan Ortega,Christian Ortiz,Matilde Peña,Clauida Salas,Luz Vásquez	\N	\N	\N	978-9972-825-44-6	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	2111 paginas	\N	\N	\N	\N	t	\N
1001182	\N	Guía de prácticas de fundamentos de contabilidad	Giovanna García Jarufe	\N	\N	\N	978-9972-825-85-9	Universidad Católica San Pablo	CONTABILIDAD	Español	GUÍA	2110 paginas	\N	\N	\N	\N	t	\N
1001183	\N	Guía de prácticas de estadísticas y probabilidades	Luz Ramos, Claudia Luque,Fredy Tito, Edwin Chaiña, Jimmy Mercado.	\N	\N	\N	978-612-4353-10-9	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	2109 paginas	\N	\N	\N	\N	t	\N
1001184	\N	Guía de prácticas de álgebra y geometría - Facultad de ciencias económicas y empresariales	Yaan Bedoya, Freddy Begaso, Vidal Bolaños, José Carpio, Dugán Nina, Ingrid Villanueva	\N	\N	\N	978-9972-825-77-0	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	2108 paginas	\N	\N	\N	\N	t	\N
1001185	\N	Guía de prácticas de cálculo en una variable - Facultad de ingeniería y computación	Magaly Alvarez, Edgar Apaza, Freddy Begazo, Ana Cano, Adela Cano, José Carpio, Dugán Nina,Matilde Peña	\N	\N	\N	978-9972-825-74-3	Universidad Católica San Pablo	INFORMÁTICA	Español	GUÍA	2107 paginas	\N	\N	\N	\N	t	\N
1001186	\N	Invocando al infinito	Javier Fernando Rodríguez Canales	\N	\N	\N	978-9972-825-51-4	Universidad Católica San Pablo	LITERATURA	Español	CATÁLOGO	2106 paginas	\N	\N	\N	\N	t	\N
1001212	\N	Cocina rápida y fácil: Pizzas y pastas	\N	\N	\N	\N	1582794316	TRIDENT PRESS INTERNATIONAL	GASTRONOMÍA	Español	FOTOCOPIA	2080 paginas	\N	\N	\N	\N	t	\N
1001213	\N	Secretos de la repostería y la cocina	Sabina de Flores	\N	\N	\N	999972-773-01-9	Fascículo 1	GASTRONOMÍA	Español	REVISTA	2079 paginas	\N	\N	\N	\N	t	\N
1001214	\N	Todo chocolatería	Ana Maria Lazo del Solar	\N	\N	\N	978-9972-58-906-5	setiembre	GASTRONOMÍA	Español	REVISTA	2078 paginas	\N	\N	\N	\N	t	\N
1001215	GASTRONOMÍA	Panadería y pastelería peruana N°166	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001216	GASTRONOMÍA	Panadería y pastelería peruana N°168	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001217	GASTRONOMÍA	Panadería y pastelería peruana N°172	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001218	GASTRONOMÍA	Panadería y pastelería peruana N°173	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001219	GASTRONOMÍA	Panadería y pastelería peruana N°174	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001414	\N	Diálogo T3	\N	\N	\N	\N	\N	Cuantica Editora S.A.	ENCICLOPEDIA	Español	LIBRO	1878 paginas	\N	\N	\N	\N	t	\N
1001187	formacion humana	Los Duncker. Vida y obra	Néstor Ríos Checllo	\N	\N	\N	978-9972-825-94-1	Universidad Católica San Pablo	ARTE	Español	LIBRO	355 paginas	\N	\N	\N	Juan Federico Guillermo Duncker Van Goch (1826-1901). Siglo XX: Alemania y Perú. Actividad en Arequipa y vida familiar. Ultimos años. Adolfo Eduardo Jesús Duncker Lavalle (1880-1921). Infancia. Maestro de capilla. Músico multifacético. Fallecimiento. Luis Roberto Jorge Gerardo Adalberto Duncker Lavalle (1871-1946). Infancia prodigiosa. Profesor en Santiago de Chile. Discípulos: Rosa Renard y Claudio Arrau. Juan Reyes Ureta. Desaparición. Luis Germán Guillermo Carmen Duncker Lavalle (1874-1922). Labor en el observatorio de Harvard instalado en Arequipa. Inicio de su actividad musical en Arequipa. El grupo Aquelarre. Anécdotas. Viaje a Norteamérica. Fallecimiento. Homenajes posteriores. Apreciación crítica de su obra musical. Comentarios sobre su obra. Homenaje de Francisco Mostajo y el grupo Arequepay. Primeros registros sonoros de la obra de Luis Duncker. Partiduras. Vals En Secreto. Vals Aristocrático. Vals Caricias. Vals Cholita. Guitarras Peruanas. Polka Grand Coquette. Leggenda Apassionata. Vals Luz y Sombra. Vals Llanto y Risa. Vals Marina. Vals Margaritas. "Ella" Mazurka patética (primera edición). Mazurka Patética(segunda edición). Minuetto. Nostalgia (improvisación). Nostalgia. Vals Mariposas Blancas. Vals Poesía. Vals Quenas. El Picaflor y la Doncella Desconsolada. Lágrimas (romanza). El Cielo está Nublado. La Plegaria del Huérfano. Yaraví ¡Ya la Nieve se deshace!. Vals Flottante. Minuetto de Manuel Aguirre dedicado a Luis Duncker. Vals Ensueño de Manuel Aguirre dedicado a Luis Duncker.	t	\N
1001188	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	2104 paginas	\N	Arequipa	2010	\N	t	\N
1001189	\N	La medicina, la vida y la Doctrina Social de la Iglesia	Cardenal Carlo Caffarra, Renzo Puccetti, Giampaolo Crepaldi, Maria Cristina del Poggetto, Mons. Javier del Río Alba	\N	\N	\N	\N	Universidad Católica San Pablo	RELIGION/TEOLOGIA	Español	BOLETÍN	2103 paginas	\N	\N	\N	\N	t	\N
1001190	\N	Sistema internacional de unidades	Juan José Milón Guzmán	\N	\N	\N	9972-825-11-6	Universidad Católica San Pablo	FÍSICA	Español	LIBRO	2102 paginas	\N	\N	\N	\N	t	\N
1001191	\N	Identidad, cultura y desarrollo en América Latina	Alejandro Estenós Loaysa	\N	\N	\N	978-9972-825-22-4	Universidad Católica San Pablo	FORMACIÓN HUM	Español	LIBRO	2101 paginas	\N	\N	\N	\N	t	\N
1001192	\N	Azul de mar adentro	José Chávez - Fernández Postigo	\N	\N	\N	978-9972-825-63-7	Universidad Católica San Pablo	LITERATURA	Español	LIBRO	2100 paginas	\N	\N	\N	Hombre de piedra. Promesa. La red. Sabe el navegante. Bandera naval. Hecho hombre. Arte poética. Maria duce. OTROS POEMAS AZULES. Alguien llama. No es pedregal. Si duerme la ballesta. Virtud. Ofrenda de guerrero. En el jardín. Voz del hombre solo. Con los pies en la tierra. Certeza.	t	\N
1001193	Cristianismo	Hacia una cultura de la verdad	Card. Paul Poupard	\N	\N	\N	9972-825-01-9	Universidad Católica San Pablo	Teología/Cultura	Español	LIBRO	81 paginas	Primera	Arequipa	\N	\N	t	\N
1001194	Cristianismo	San Agustín y la reconciliación - Vigencia de un tema urgente	Gustavo Sánchez Rojas	\N	\N	\N	978-9972-825-39-2	Biblioteca Nacional del Perú 12952	RELIGION/TEOLOGIA	Español	LIBRO	229 paginas	Primera	Arequipa	2011	El Espíritu Santo reconciliación en la teología de San Agustín de Hipona. Dios Padre, origen y meta de la reconciliación en San Agustín. Paz y reconciliación en San Agustín. El señor Jesús, mediador  reconciliador. Ecclesia, mundus reconciliatus.	t	\N
1001195	Cristianismo	La luz habita en los trigales	José Chávez - Fernández Postigo	\N	\N	\N	978-612-4353-06-2	Lettera Gráfica S.A.C.	Formación humana	Español	LIBRO	68 paginas	Primera	Arequipa	2017	\N	t	\N
1001196	formacion humana	Educación de la virtud en los ámbitos familiar y escolar	María Lorena Diez canseco Briceño	\N	\N	\N	978-612-4353-22-2	Universidad Católica San Pablo	FORMACIÓN HUM	Español	LIBRO	291 paginas	pimera	Arequipa	2018	\N	t	\N
1001197	\N	Iglesia y la educación en el Perú	Andrés Cardó Franco	\N	\N	\N	9972-825-06-X	Universidad Católica San Pablo	RELIGIÓN	Español	LIBRO	2095 paginas	\N	\N	\N	\N	t	\N
1001198	cristianismo	El Cardenal Van Thuan: La fuerza de la esperanza	Annachara Valle	\N	\N	\N	978-9972-825-31-6	Biblioteca Nacional del Perú 10744	LITERATURA	Español	LIBRO	115 paginas	Primera	Arequipa	2010	VOZ  DESDE EL TRIGAL. La luz habita en los trigales. Lenguaje de hombres. Poema de sangre. Dos sacerdotes conversan. Elección. Breve tratado de lo eterno. Misericordia. El niño en el trigal. Tras la ventana. Río y lago. Natalicio de la luz. TRES LÁMPARAS  Y UNA PLEGARIA. Tristísima luz. Tísica luz. Sucia luz. La plegaria. NO OLVIDEMOS LAS SOMBRAS. Llora la niña. Río de tierra. En ese verano no hay lluvia. El engaño. Oscuro canto de guerra. Las piedras, el río y la luna. La única pregunta. TRIDUO PASCUAL. Misa vespertina de la Cena del Señor. Celebración de la Pasión del Señor. Vigilia Pascual.SABIDURÍA DE ÁRBOLES Y PÁJAROS .Sobre árboles y pájaros.Jacarandá. Morada de ave migratoria. Permaneciendo. El ave escondida. Memoria de árbol. El gorrión, la luz y su entraña. El bosque de pinos. Martirio de águila. La muralla oyente. Redección. Corazón de cedro. Apreciación crítica al canto de las aves de corral. Cristo Moreno (o Jacarandá en octubre).LUNA MADRE.Luna Madre.	t	\N
1001199	Administracion	Aspectos innovadores de la empresa en la Centesimus Annus	Diego Arias Padilla	\N	\N	\N	978-612-4353-21-5	Universidad Católica San Pablo	ADMINISTRACIÓN	Español	LIBRO	 105 paginas	-	Arequipa	2018	\N	t	\N
1001200	Administracion	Aspectos innovadores de la empresa en la Centesimus Annus	Diego Arias Padilla	\N	\N	\N	978-612-4353-21-5	Universidad Católica San Pablo	ADMINISTRACIÓN	Español	LIBRO	 105 paginas	-	Arequipa	2018	\N	t	\N
1001201	Administracion	Aspectos innovadores de la empresa en la Centesimus Annus	Diego Arias Padilla	\N	\N	\N	978-612-4353-21-6	Universidad Católica San Pablo	ADMINISTRACIÓN	Español	LIBRO	 105 paginas	-	Arequipa	2018	\N	t	\N
1001202	\N	Menú de cada día	Karlos Arguiñano	\N	\N	\N	84-7628-130-7	EDICIONES DEL SERBAL	GASTRONOMÍA	Español	FOTOCOPIA	2090 paginas	\N	\N	\N	\N	t	\N
1001203	\N	¡Huumm! ¡Qué delicias!	Sucy R. de Quiróz	\N	\N	\N	9972-9501-0-7	LA EDITORIAL MODELO	GASTRONOMÍA	Español	FOTOCOPIA	2089 paginas	\N	\N	\N	\N	t	\N
1001204	\N	Menú de cada día	Karlos Arguiñano	\N	\N	\N	84-7628-107-2	EDICIONES DEL SERBAL	GASTRONOMÍA	Español	FOTOCOPIA	2088 paginas	\N	\N	\N	\N	t	\N
1001205	\N	Sopas y cremas	Alonzo Ruiz Rosa	\N	\N	\N	\N	EL COMERCIAL S.A.	GASTRONOMÍA	Español	REVISTA	179 paginas	Primera Edicion	Lima	2002	\N	t	\N
1001206	\N	Cocina rápida y fácil: Postres	Sucy Smith, Anna Phillips	\N	\N	\N	1582794324	TRIDENT PRESS INTERNATIONAL	GASTRONOMÍA	Español	FOTOCOPIA	2086 paginas	\N	\N	\N	\N	t	\N
1001207	\N	Platos de fondo	\N	\N	\N	\N	\N	\N	GASTRONOMÍA	Español	FOTOCOPIA	2085 paginas	\N	\N	\N	\N	t	\N
1001208	\N	Arte del azúcar T1	Nicholas Lodge	\N	\N	\N	\N	ESCUELA INTERNACIONAL	GASTRONOMÍA	Español	FOTOCOPIA	2084 paginas	\N	\N	\N	\N	t	\N
1001209	\N	Arte del azúcar T2	Nicholas Lodge	\N	\N	\N	\N	ESCUELA INTERNACIONAL	GASTRONOMÍA	Español	FOTOCOPIA	2083 paginas	\N	\N	\N	\N	t	\N
1001210	\N	Arte del azúcar T3	Nicholas Lodge	\N	\N	\N	\N	ESCUELA INTERNACIONAL	GASTRONOMÍA	Español	FOTOCOPIA	2082 paginas	\N	\N	\N	\N	t	\N
1001211	\N	Panadería y pastelaría profesional	Palma tropical	\N	\N	\N	\N	EDITORIAL PALMA TROPICAL	GASTRONOMÍA	Español	FOTOCOPIA	2081 paginas	\N	\N	\N	\N	t	\N
1002699	\N	ESPASA CALPE 19	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	593 paginas	\N	\N	\N	\N	t	\N
1001220	GASTRONOMÍA	Panadería y pastelería peruana N°175	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001221	GASTRONOMÍA	Panadería y pastelería peruana N°176	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001222	GASTRONOMÍA	Cup cakes	Hermanos Espinosa	\N	\N	\N	\N	decorart	GASTRONOMÍA	Español	REVISTA	2070 paginas	Primera Edición	\N	\N	\N	t	\N
1001223	GASTRONOMÍA	Secretos de la repostería y la cocina	Sabina de Flores	\N	\N	\N	999972-73-04-9	fascículo 4	GASTRONOMÍA	Español	REVISTA	2069 paginas	\N	\N	\N	\N	t	\N
1001224	GASTRONOMÍA	Secretos de la repostería	Sabina de Flores	\N	\N	\N	\N	cear sabi E.I.R.L	GASTRONOMÍA	Español	REVISTA	2068 paginas	\N	\N	\N	\N	t	\N
1001225	GASTRONOMÍA	Todo tortas	Ana Maria Lazo del Solar	\N	\N	\N	978-9972-58-6781	setiembre	GASTRONOMÍA	Español	REVISTA	2067 paginas	\N	\N	\N	\N	t	\N
1001226	GASTRONOMÍA	Menú de cada día	Karlos Arguiñano	\N	\N	\N	84-7628-130-7	serbal	GASTRONOMÍA	Español	FOTOCOPIA	2066 paginas	\N	\N	\N	\N	t	\N
1001227	GASTRONOMÍA	Panadería y pastelería peruana N°163	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001228	GASTRONOMÍA	Panadería y pastelería peruana N°171	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001229	GASTRONOMÍA	Panadería y pastelería peruana N°177	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001230	GASTRONOMÍA	Panadería y pastelería peruana N°178	Esagesac	\N	\N	\N	\N	esagesac comunicadores	GASTRONOMÍA	Español	REVISTA	 71 páginas	Primera Edición	Lima	\N	\N	t	\N
1001231	GASTRONOMÍA	Canela colección: Hierbas & especias	Mnr comunicaciones proyectos editoriales	\N	\N	\N	978-958-45-0009-0	norma	GASTRONOMÍA	Español	REVISTA	2061 paginas	\N	\N	\N	\N	t	\N
1001232	\N	Gourmet latino	Gourmet latino	\N	\N	\N	\N	gourmet latino S.A.C.	GASTRONOMÍA	Español	REVISTA	2060 paginas	\N	\N	\N	\N	t	\N
1001233	\N	Navidad América latina brinda en la mesa de fin de año	Grupo Q S.A.	\N	\N	\N	\N	El comercio s.a.	GASTRONOMÍA	Español	REVISTA	2059 paginas	\N	\N	\N	\N	t	\N
1001234	Gastronomia	180 Menús ricos y nutritivos T10	Angelica Saaki	\N	\N	\N	978-9972-58-755-9	EDITORIAL SETIEMBRE S.A.C.	GASTRONOMÍA	Español	REVISTA	63 paginas	Primera Edicion	Lima	2008	\N	t	\N
1001235	Gastronomia	180 Menús ricos y nutritivos T11	Angelica Sasaki	\N	\N	\N	978-9972-58-755-6	EDITORIAL SETIEMBRE S.A.C.	GASTRONOMÍA	Español	REVISTA	63 paginas	Primera Edicion	Lima	2008	\N	t	\N
1001236	Gastronomia	180 Menús ricos y nutritivos T12	Angelica Sasaki	\N	\N	\N	978-9972-58-757-3	EDITORIAL SETIEMBRE S.A.C.	GASTRONOMÍA	Español	REVISTA	63 paginas	Primera Edicion	Lima	2008	\N	t	\N
1001237	\N	Verduras y hortalizas I	Anne Wilson	\N	\N	\N	978-9972-58-755-11	KÖNEMANI	GASTRONOMÍA	Español	REVISTA	2055 paginas	\N	\N	\N	\N	t	\N
1001238	Cristianismo	San Agustín y la reconciliación. Vigencia de un tema urgente	Gustavo Sánchez Rojas	\N	\N	\N	978-9972-825-39-2	Biblioteca Nacional del Perú 12952	FORMACIÓN HUM	Español	LIBRO	229 paginas	Primera	Arequipa	2011	\N	t	\N
1001239	\N	Azul de mar adentro	José Chavéz-Fernández Postigo	\N	\N	\N	978-9972-825-63-7	Lettera Gráfica S.A.C	FORMACIÓN HUM	Español	LIBRO	2053 paginas	Primera	Arequipa	2014	\N	t	\N
1001240	\N	Educación de la virtud en los ámbitos familiar y escolar	María Lorena Diez Canseco Briceño	\N	\N	\N	978-612-4353-22-2	Lettera Gráfica S.A.C	FORMACIÓN HUM	Español	LIBRO	2052 paginas	Primera	Arequipa	2018	\N	t	\N
1001241	Cristianismo	La luz habita en los trigales	José Chavéz-Fernández Postigo	\N	\N	\N	978-612-4353-06-2	Lettera Gráfica S.A.C	Formación humana	Español	LIBRO	68 paginas	Primera	Arequipa	2017	\N	t	\N
1001242	\N	Aspectos innovadores de la empresa en la Centesimus annus	Diego Arias Padilla	\N	\N	\N	978-612-4353-21-5	Lettera Gráfica S.A.C	FORMACIÓN HUM	Español	LIBRO	2050 paginas	Primera	Arequipa	2018	\N	t	\N
1001243	\N	Identidad, cultura y desarrollo en América Latina. Principales líneas de reflexión en la actualidad	Alejandro Estenós Loayza	\N	\N	\N	978-9972-825-22-4	Lettera Gráfica S.A.C	FORMACIÓN HUM	Español	LIBRO	2049 paginas	Primera	Arequipa	2008	\N	t	\N
1001244	Cristianismo	La Iglesia y la educación en el Perú	Andrés Cardó Franco	\N	\N	\N	9972--825-06-X	IMPRESA- Impresores, Editores y Servicios Gráficos S.A	Religión/educación	Español	LIBRO	184 paginas	Segunda	Arequipa	2005	\N	t	\N
1001245	\N	El sistema Interncional de Unidades	Juan José Milón Guzmán	\N	\N	\N	9972-825-11-6	Lettera Gráfica S.A.C	MATEMÁTICA	Español	REVISTA	2047 paginas	Primera	Arequipa	2006	\N	t	\N
1001246	Cristianismo	Hacia una cultura de la verdad	Card. Paul Poupard	\N	\N	\N	9972-825-01-9	Universidad Católica San Pablo	Teología/Cultura	Español	LIBRO	81 paginas	Primera	Arequipa	-	\N	t	\N
1001247	\N	Invocando al infinito	Javier Fernando Rodríguez Canales	\N	\N	\N	978-9972-825-51-4	Lettera Gráfica S.A.C	ARTE	Español	LIBRO	2045 paginas	Primera	Arequipa	2012	\N	t	\N
1001248	\N	Guía de práctica de fundamentos de contabilidad	Giovanna García Jarufe	\N	\N	\N	978-9972-825-85-9	Lion Publicidad SRL	CONTABILIDAD	Español	GUÍA	2044 paginas	Primera	Arequipa	2015	\N	t	\N
1001249	formaciòn humana	Los Duncker. Vida y obra	Néstor Ríos Checlllo	\N	\N	\N	978-9972-825-94-1	Lettera Gráfica S.A.C	LITERATURA	Español	LIBRO	355 paginas	Primera	Arequipa	2016	\N	t	\N
1001250	\N	Guía de práctica de física I - Facultad de ingeniería y computación	Henry Javier Ccallata- Jessica Monqueira Yauri	\N	\N	\N	978-612-4353-04-8	Adolfo Eduardo Callata	FÍSICA	Español	GUÍA	2042 paginas	Segunda	Arequipa	2018	\N	t	\N
1001251	\N	Guía de práctica de álgebra y geometría - Facultad de ingeniería y computación	José Alberto Carpio Alatrista, Vidal Martín Bolaños, Dugán Nina, Matide Peña,Nancy Quispe, Fredy Tito, Luz Vasquez	\N	\N	\N	978-612-4353-17-8	Adolfo Eduardo Callata	MATEMÁTICA	Español	GUÍA	2041 paginas	Segunda	Arequipa	2018	\N	t	\N
1001252	\N	Guía de práctica de álgebra y geometría - Facultad de ingeniería y computación	José Alberto Carpio Alatrista, Vidal Martín Bolaños, Dugán Nina, Matide Peña,Nancy Quispe, Fredy Tito, Luz Vasquez	\N	\N	\N	978-612-4353-17-8	Adolfo Eduardo Callata	MATEMÁTICA	Español	GUÍA	2040 paginas	Primera	Arequipa	2018	\N	t	\N
1001253	\N	Cuaderno de trabajo de introducción a la matemática	Renzo Acosta,Magaly Alvarez,Freddy Begazo,Mirian Carpio,Jorge Chambi,Jimmy Cruz,Gonzalo Mendoza,Juan Ortega,Christian Ortiz,Matilde Peña,Clauida Salas,Luz Vásquez	\N	\N	\N	978-9972-825-44-6	Lettera Gráfica S.A.C	MATEMÁTICA	Español	GUÍA	2039 paginas	Segunda	Arequipa	2018	\N	t	\N
1001254	\N	Guía de práctica de física II - Facultad de ingeniería y computación	Jim Chávez, Jessica Mosqueira, Lourdes Soria, Wilmer Sucasaire	\N	\N	\N	978-612-4353-12-3	AZA GRAFIPH PERÚ S.A.C	MATEMÁTICA	Español	GUÍA	2038 paginas	Segunda	Arequipa	2018	\N	t	\N
1001255	\N	Guía de problemas de química I - Escuela profesional de ingeniería industral	Lizandra López, Gonzalo Delange, Mónica Díaz,Jaime Muñoz, Violeta Rojas, Alejandro Zegarra	\N	\N	\N	978-612-353-19-2	Lettera Gráfica S.A.C	QUÍMICA	Español	GUÍA	2037 paginas	Primera	Arequipa	2018	\N	t	\N
1002700	\N	ESPASA CALPE 2	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	592 paginas	\N	\N	\N	\N	t	\N
1001256	\N	La nueva Evangelización y la Doctrina Social de la Iglesia	Stefano Fontana	\N	\N	\N	\N	Edizioni Cantagalli S.R.L	RELIGION/TEOLOGIA	Español	BOLETÍN	2036 paginas	Primera	Arequipa	2016	\N	t	\N
1001257	\N	La medicina, la vida y la Doctrina Social de la Iglesia	Stefano Fontana	\N	\N	\N	\N	Edizioni Cantagalli S.R.L	RELIGION/TEOLOGIA	Español	BOLETÍN	2035 paginas	Primera	Arequipa	2016	\N	t	\N
1001258	formacion humana	Qué hacer con los dolores de espalda	Harvard Health Publications	\N	\N	\N	978-956-8827-25-0	-	MEDICINA	Español	LIBRO	106 paginas	Primera	Santiago	2009	\N	t	\N
1001259	\N	Entendiendo la depresión	Urmila Parlikar	\N	\N	\N	978-956-8827-15-1	Impact Media	MEDICINA	Español	LIBRO	2033 paginas	Primera	Santiago	2009	\N	t	\N
1001260	\N	Controle su estrés: Comó prevenirlo y reducirlo	Urmila Parlikar	\N	\N	\N	978-956-8827-17-5	Impact Media	MEDICINA	Español	LIBRO	2032 paginas	Primera	Santiago	2009	\N	t	\N
1001261	Formacion Humana	Las emociones y los problemas en la digestión	Urmila Parlikar	\N	\N	\N	978-956-8827-26-7	Impact Media	MEDICINA	Español	LIBRO	120  paginas	Primera	Santiago	2009	\N	t	\N
1001262	\N	Recargue su energía	Urmila Parlikar	\N	\N	\N	978-956-8827-22-9	Impact Media	MEDICINA	Español	LIBRO	2030 paginas	Primera	Santiago	2009	\N	t	\N
1001263	formaciòn humana	Sexualidad en la adultez y la tercera edad	Urmila Parlikar	\N	\N	\N	978-956-8827-18-2	Impact Media	MEDICINA	Español	LIBRO	119 paginas	Primera	Santiago	2009	\N	t	\N
1001264	\N	Qué hacer con el colesterol alto	Urmila Parlikar	\N	\N	\N	978-956-8827-16-8	Impact Media	MEDICINA	Español	LIBRO	2028 paginas	Primera	Santiago	2009	\N	t	\N
1001265	\N	Comó mejorar su sueño: Una guía para el buen dormir	Urmila Parlikar	\N	\N	\N	978-956-8827-21-2	Impact Media	MEDICINA	Español	LIBRO	2027 paginas	Primera	Santiago	2009	\N	t	\N
1001266	\N	Qué hacer con las alergías	Urmila Parlikar	\N	\N	\N	978-956-8827-20-5	Impact Media	MEDICINA	Español	LIBRO	2026 paginas	Primera	Santiago	2009	\N	t	\N
1001267	\N	Ejercicio un programa para su vida cotidiana	Urmila Parlikar	\N	\N	\N	978-956-8827-23-6	Impact Media	MEDICINA	Español	LIBRO	2025 paginas	Primera	Santiago	2009	\N	t	\N
1001268	\N	Anatómica. Enciclopedia visual del cuerpo humano: T1 Sistema esquelético	Adolfo Cassan	\N	\N	\N	978-603-4012-37-0	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001269	\N	Anatómica. Enciclopedia visual del cuerpo humano: T2 Sistemas muscular, linfático, inmunitario y respiratorio	Adolfo Cassan	\N	\N	\N	978-603-4012-38-7	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001270	\N	Anatómica. Enciclopedia visual del cuerpo humano:T3 Sistema nevioso	Adolfo Cassan	\N	\N	\N	978-603-4012-39-4	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001271	\N	Anatómica. Enciclopedia visual del cuerpo humano: T4 Sistema circulatorio y digestivo	Adolfo Cassan	\N	\N	\N	978-603-4012-40-0	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001272	\N	Anatómica. Enciclopedia visual del cuerpo humano: T5 Sistemas urinario, reproductor y endocrino	Adolfo Cassan	\N	\N	\N	978-603-4012-41-7	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001273	\N	Anatómica. Enciclopedia visual del cuerpo humano: T6 La piel	Adolfo Cassan	\N	\N	\N	978-603-4012-42-4	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001274	\N	Anatómica. Enciclopedia visual del cuerpo humano: T7 Cabeza, cráneo y ojos	Adolfo Cassan	\N	\N	\N	978-603-4012-43-1	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001275	\N	Anatómica. Enciclopedia visual del cuerpo humano: T8 Boca y nariz	Adolfo Cassan	\N	\N	\N	978-603-4012-44-8	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001276	\N	Anatómica. Enciclopedia visual del cuerpo humano: T9 Oídos y cuello	Adolfo Cassan	\N	\N	\N	978-603-4012-45-5	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001277	\N	Anatómica. Enciclopedia visual del cuerpo humano: T10 Encéfalo	Adolfo Cassan	\N	\N	\N	978-603-4012-46-2	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001278	\N	Anatómica.Enciclopedia visual del cuerpo humano: T11 Tronco, diafragma y esófago	Adolfo Cassan	\N	\N	\N	978-603-4012-47-9	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001279	\N	Anatómica. Enciclopedia visual del cuerpo humano: T12 Corazón, páncreas y bazo	Adolfo Cassan	\N	\N	\N	978-603-4012-48-6	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001280	\N	Anatómica. Enciclopedia visual del cuerpo humano: T13 Pulmones, abdomen y estómago	Adolfo Cassan	\N	\N	\N	978-603-4012-49-3	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001281	\N	Anatómica. Enciclopedia visual del cuerpo humano: T14 Intestinos e hígado	Adolfo Cassan	\N	\N	\N	978-603-4012-50-9	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	\N	t	\N
1001282	\N	Anatómica. Enciclopedia visual del cuerpo humano: T15 Aparato urinario y órganos reproductores masculinos	Adolfo Cassan	\N	\N	\N	978-603-4012-51-6	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001283	\N	Anatómica. Enciclopedia visual del cuerpo humano: T16 Órganos reproductores femeninos	Adolfo Cassan	\N	\N	\N	978-603-4012-52-3	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001284	\N	Anatómica. Enciclopedia visual del cuerpo humano: T17 Extremidades superiores	Adolfo Cassan	\N	\N	\N	978-603-4012-53-0	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	55	Primera	Lima	2008	LAS EXTREMIDADES. Huesos. Músculos. Vasos Circulatorios. Nervios. EXTREMIDADES SUPERIORES. El hombro. Principales huesos del hombro. Clavícula. Escápula. Articulación acromioclavicular. Articulación del hombro. Movimientos del hombro. Músculo del hombro. El brazo. Húmero. Radio. Cúbito. Músculo del brazo. Codo. Muñeca. La mano. Hueso de la mano. Palma de la mano. Músculo y tendones de la mano. Nervios y vasos sanguíneos de la mano. Movimientos de la mano. Nervios y vasos sanguíneos de hombro y brazos. Articulación del hombro. Trastornos del hombro. Luxación del hombro. Periarttitis del hombro. Transtornos del codo. Transtorno de la muñeca. La enfermedad de De Quervain. Artritis y astrosis . Sindrome del túnel.Ttranstornos de la mano. Lesión de los nervios. Dedo en gatillo. Ganglión. Artrosis de la mano.	t	\N
1001285	\N	Anatómica. Enciclopedia visual del cuerpo humano: T18 Extremidades inferiores	Adolfo Cassan	\N	\N	\N	978-603-4012-54-7	Producciones Cantabria S.A.C	ANATOMÍA	Español	ENCICLOPEDIA	56	Primera	Lima	2008	\N	t	\N
1001286	Cristianismo	-	Cardenal Paúl Poupard	\N	\N	\N	9972-825-01-9	Universidad Católica San Pablo	Teología/Cultura	Español	LIBRO	81paginas	Primera	Arequipa	\N	\N	t	\N
1001287	\N	Aspectos innovadores de la empresa en la Centesimus annus	Diego Arias Padilla	\N	\N	\N	978-612-4353-21-5	Lettera Gráfica S.A.C	ADMINISTRACIÓN	Español	LIBRO	2005 paginas	Primera	Arequipa	2018	\N	t	\N
1001354	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1938 paginas	\N	Arequipa	2010	\N	t	\N
1001288	cristianisno	El cardenal Van Thuan: La fuerza de la esperanza	Annachiara Valle	\N	\N	\N	978-9972-825-31-6	Biblioteca Nacional del Perú 10744	RELIGION/TEOLOGIA	Español	LIBRO	115 paginas	Primera	Arequipa	2010	VOZ  DESDE EL TRIGAL. La luz habita en los trigales. Lenguaje de hombres. Poema de sangre. Dos sacerdotes conversan. Elección. Breve tratado de lo eterno. Misericordia. El niño en el trigal. Tras la ventana. Río y lago. Natalicio de la luz. TRES LÁMPARAS  Y UNA PLEGARIA. Tristísima luz. Tísica luz. Sucia luz. La plegaria. NO OLVIDEMOS LAS SOMBRAS. Llora la niña. Río de tierra. En ese verano no hay lluvia. El engaño. Oscuro canto de guerra. Las piedras, el río y la luna. La única pregunta. TRIDUO PASCUAL. Misa vespertina de la Cena del Señor. Celebración de la Pasión del Señor. Vigilia Pascual.SABIDURÍA DE ÁRBOLES Y PÁJAROS .Sobre árboles y pájaros.Jacarandá. Morada de ave migratoria. Permaneciendo. El ave escondida. Memoria de árbol. El gorrión, la luz y su entraña. El bosque de pinos. Martirio de águila. La muralla oyente. Redección. Corazón de cedro. Apreciación crítica al canto de las aves de corral. Cristo Moreno (o Jacarandá en octubre).LUNA MADRE.Luna Madre.	t	\N
1001289	\N	Pioner laboral	Contadores & empresas	\N	\N	\N	2072-6880	Gaceta jurídica S.A	ADMINISTRACIÓN	Español	PIONER	2003 paginas	Sexta	Lima	2014	\N	t	\N
1001290	\N	Pioner tributario T1	Contadores & empresas	\N	\N	\N	2072-8492	Gaceta jurídica S.A	CONTABILIDAD	Español	PIONER	2002 paginas	Primera	Lima	2014	\N	t	\N
1001291	\N	Pioner tributario T2	Contadores & empresas	\N	\N	\N	2072-8492	Gaceta jurídica S.A	CONTABILIDAD	Español	PIONER	2001 paginas	Primera	Lima	\N	\N	t	\N
1001292	\N	Memorial anual 2012	Caja Arequipa	\N	\N	\N	\N	Layconsa	ADMINISTRACIÓN	Español	GUÍA	2000 paginas	Primera	Arequipa	2012	\N	t	\N
1001293	\N	Memorial anual 2012	Caja Arequipa	\N	\N	\N	\N	Layconsa	ADMINISTRACIÓN	Español	GUÍA	1999 paginas	Primera	Arequipa	2012	\N	t	\N
1001294	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1998 paginas	\N	Arequipa	2010	\N	t	\N
1001295	\N	Nada te faltará	Richard Chelson	\N	\N	\N	950-861-532-X	Editorial San Pablo	RELIGIÓN	Español	LIBRO	1997 paginas	Primera Edición	Buenos Aires	2001	\N	t	\N
1001296	\N	National Geographic	National Geografic	\N	\N	\N	\N	\N	\N	\N	\N	1996 paginas	\N	\N	\N	\N	t	\N
1001297	\N	Guía de práctica de álgebra y geometría - Facultad de ingeniería y computación ej3	José Alberto Carpio Alatrista, Vidal Martín Bolaños, Dugán Nina, Matide Peña,Nancy Quispe, Fredy Tito, Luz Vasquez	\N	\N	\N	978-612-4353-17-8	Adolfo Eduardo Callata	MATEMÁTICA	Español	GUÍA	1995 paginas	Segunda	Arequipa	2018	\N	t	\N
1001298	\N	Guía de práctica de fundamentos de contabilidad	Giovanna García Jarufe	\N	\N	\N	978-9972-825-85-9	Lion Publicidad SRL	CONTABILIDAD	Español	GUÍA	1994 paginas	Primera	Arequipa	2015	\N	t	\N
1001299	\N	Guía de práctica de fundamentos de contabilidad	Giovanna García Jarufe	\N	\N	\N	978-9972-825-85-9	Lion Publicidad SRL	CONTABILIDAD	Español	GUÍA	1993 paginas	Primera	Arequipa	2015	\N	t	\N
1001300	\N	Guía de práctica de fisica I - Facultad de ingeniería y computación	Henry Javier Ccallata- Jessica Monqueira Yauri	\N	\N	\N	978-612-4353-04-8	Adolfo Eduardo Callata	FÍSICA	Español	GUÍA	1992 paginas	Segunda	Arequipa	2018	\N	t	\N
1001301	\N	Guía de práctica de física I - Facultad de ingeniería y computación	Henry Javier Ccallata- Jessica Monqueira Yauri	\N	\N	\N	978-612-4353-04-8	Adolfo Eduardo Callata	FÍSICA	Español	GUÍA	1991 paginas	Segunda	Arequipa	2018	\N	t	\N
1001302	\N	Guía de práctica de física I - Facultad de ingeniería y computación	Henry Javier Ccallata- Jessica Monqueira Yauri	\N	\N	\N	978-612-4353-04-8	Adolfo Eduardo Callata	FÍSICA	Español	GUÍA	1990 paginas	Segunda	Arequipa	2018	\N	t	\N
1001303	\N	Guía de práctica de física II - Facultad de ingeniería y computación	Jim Chávez, Jessica Mosqueira, Lourdes Soria, Wilmer Sucasaire	\N	\N	\N	978-612-4353-12-3	AZA GRAFIPH PERÚ S.A.C	MATEMÁTICA	Español	GUÍA	1989 paginas	Segunda	Arequipa	2018	\N	t	\N
1001304	\N	Guía de práctica de física II - Facultad de ingeniería y computación	Jim Chávez, Jessica Mosqueira, Lourdes Soria, Wilmer Sucasaire	\N	\N	\N	978-612-4353-12-3	AZA GRAFIPH PERÚ S.A.C	MATEMÁTICA	Español	GUÍA	1988 paginas	Segunda	Arequipa	2018	\N	t	\N
1001305	\N	Guía de práctica de física II - Facultad de ingeniería y computación	Jim Chávez, Jessica Mosqueira, Lourdes Soria, Wilmer Sucasaire	\N	\N	\N	978-612-4353-12-3	AZA GRAFIPH PERÚ S.A.C	MATEMÁTICA	Español	GUÍA	1987 paginas	Segunda	Arequipa	2018	\N	t	\N
1001306	\N	Guía de prácticas de estadísticas y probabilidades	Luz Ramos, Claudia Luque,Fredy Tito, Edwin Chaiña, Jimmy Mercado.	\N	\N	\N	978-612-4353-10-9	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	1986 paginas	Segunda	Arequipa	2018	\N	t	\N
1001307	\N	Guía de problemas de química I - Escuela profesional de ingeniería industrial	Lizandra López, Gonzalo Delange, Mónica Díaz,Jaime Muñoz, Violeta Rojas, Alejandro Zegarra	\N	\N	\N	978-612-353-19-2	Lettera Gráfica S.A.C	QUÍMICA	Español	GUÍA	1985 paginas	Primera	Arequipa	2018	\N	t	\N
1001308	\N	Guía de problemas de química I - Escuela profesional de ingeniería industrial	Lizandra López, Gonzalo Delange, Mónica Díaz,Jaime Muñoz, Violeta Rojas, Alejandro Zegarra	\N	\N	\N	978-612-353-19-2	Lettera Gráfica S.A.C	QUÍMICA	Español	GUÍA	1984 paginas	Primera	Arequipa	2018	\N	t	\N
1001309	\N	Guía de problemas de química I - Escuela profesional de ingeniería industrial	Lizandra López, Gonzalo Delange, Mónica Díaz,Jaime Muñoz, Violeta Rojas, Alejandro Zegarra	\N	\N	\N	978-612-353-19-2	Lettera Gráfica S.A.C	QUÍMICA	Español	GUÍA	1983 paginas	Primera	Arequipa	2018	\N	t	\N
1001310	\N	Guía de prácticas de cálculo en una variable - Facultad de ingeniería y computación	Magaly Alvarez, Edgar Apaza, Freddy Begazo, Ana Cano, Adela Cano, José Carpio, Dugán Nina,Matilde Peña	\N	\N	\N	978-9972-825-74-3	Universidad Católica San Pablo	INFORMÁTICA	Español	GUÍA	1982 paginas	Primera	Arequipa	2018	\N	t	\N
1001311	\N	Guía de prácticas de cálculo en una variable - Facultad de ingeniería y computación	Magaly Alvarez, Edgar Apaza, Freddy Begazo, Ana Cano, Adela Cano, José Carpio, Dugán Nina,Matilde Peña	\N	\N	\N	978-9972-825-74-3	Universidad Católica San Pablo	INFORMÁTICA	Español	GUÍA	1981 paginas	Primera	Arequipa	2018	\N	t	\N
1001312	\N	Guía de prácticas de cálculo en una variable - Facultad de ingeniería y computación	Magaly Alvarez, Edgar Apaza, Freddy Begazo, Ana Cano, Adela Cano, José Carpio, Dugán Nina,Matilde Peña	\N	\N	\N	978-9972-825-74-3	Universidad Católica San Pablo	INFORMÁTICA	Español	GUÍA	1980 paginas	Primera	Arequipa	2018	\N	t	\N
1001313	\N	Cuaderno de trabajo de introducción a la matemática	Renzo Acosta,Magaly Alvarez,Freddy Begazo,Mirian Carpio,Jorge Chambi,Jimmy Cruz,Gonzalo Mendoza,Juan Ortega,Christian Ortiz,Matilde Peña,Clauida Salas,Luz Vásquez	\N	\N	\N	978-9972-825-44-6	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	1979 paginas	\N	\N	\N	\N	t	\N
1001314	\N	Cuaderno de trabajo de introducción a la matemática	Renzo Acosta,Magaly Alvarez,Freddy Begazo,Mirian Carpio,Jorge Chambi,Jimmy Cruz,Gonzalo Mendoza,Juan Ortega,Christian Ortiz,Matilde Peña,Clauida Salas,Luz Vásquez	\N	\N	\N	978-9972-825-44-6	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	1978 paginas	\N	\N	\N	\N	t	\N
1001407	\N	Ser Mujer T1	\N	\N	\N	\N	\N	\N	ENCICLOPEDIA	Español	LIBRO	1885 paginas	\N	\N	\N	\N	t	\N
1001315	\N	Guía de prácticas de estadísticas y probabilidades	Luz Ramos, Claudia Luque,Fredy Tito, Edwin Chaiña, Jimmy Mercado.	\N	\N	\N	978-612-4353-10-9	Universidad Católica San Pablo	MATEMÁTICA	Español	GUÍA	1977 paginas	\N	\N	\N	\N	t	\N
1001316	\N	Guía de practica de práctica de álgebra y geometría - Facultad de ingeniería y computación	José Alberto Carpio Alatrista, Vidal Martín Bolaños, Dugán Nina, Matide Peña,Nancy Quispe, Fredy Tito, Luz Vasquez	\N	\N	\N	978-612-4353-17-8	Adolfo Eduardo Callata	MATEMÁTICA	Español	GUÍA	1976 paginas	Segunda	Arequipa	2018	\N	t	\N
1001317	Cristianismo	La Iglesia y la educación en el Perú	Andrés Cardó Franco	\N	\N	\N	9972--825-06-X	IMPRESA- Impresores, Editores y Servicios Gráficos S.A	Educación	Español	LIBRO	184 paginas	Segunda	Arequipa	2005	\N	t	\N
1001318	\N	Los Duncker. Vida y obra	Néstor Ríos Checllo	\N	\N	\N	978-9972-825-94-1	Universidad Católica San Pablo	ARTE	Español	LIBRO	1974 paginas	\N	\N	\N	\N	t	\N
1001319	\N	Invocando al infinito	Javier Fernando Rodríguez Canales	\N	\N	\N	978-9972-825-51-4	Universidad Católica San Pablo	LITERATURA	Español	CATÁLOGO	1973 paginas	\N	\N	\N	\N	t	\N
1001320	Cristianismo	San Agustín y la reconciliación - Vigencia de un tema urgente	Gustavo Sánchez Rojas	\N	\N	\N	978-9972-825-39-2	Biblioteca Nacional del Perú 12952	RELIGION/TEOLOGIA	Español	LIBRO	229 paginas	Primera	Arequipa	2011	\N	t	\N
1001321	\N	Educación de la virtud en los ámbitos familiar y escolar	MARÍA LORENA DIEZ CANSECO BRICEÑO	\N	\N	\N	978-612-4353-22-2	Universidad Católica San Pablo	FORMACIÓN HUM	Español	LIBRO	1971 paginas	\N	\N	\N	\N	t	\N
1001322	\N	Identidad, cultura y desarrollo en América Latina	Alejandro Estenós Loaysa	\N	\N	\N	978-9972-825-22-4	Universidad Católica San Pablo	FORMACIÓN HUM	Español	LIBRO	1970 paginas	\N	\N	\N	\N	t	\N
1001323	\N	El sistema Interncional de Unidades	Juan José Milón Guzmán	\N	\N	\N	9972-825-11-6	Lettera Gráfica S.A.C	MATEMÁTICA	Español	REVISTA	1969 paginas	Primera	Arequipa	2006	\N	t	\N
1001324	\N	El sistema Interncional de Unidades	Juan José Milón Guzmán	\N	\N	\N	9972-825-11-6	Lettera Gráfica S.A.C	MATEMÁTICA	Español	REVISTA	1968 paginas	Primera	Arequipa	2006	\N	t	\N
1001325	\N	El sistema Interncional de Unidades	Juan José Milón Guzmán	\N	\N	\N	9972-825-11-6	Lettera Gráfica S.A.C	MATEMÁTICA	Español	REVISTA	1967 paginas	Primera	Arequipa	2006	\N	t	\N
1001326	Cristianismo	La luz habita en los trigales	José Chavéz-Fernández Postigo	\N	\N	\N	978-612-4353-06-2	Lettera Gráfica S.A.C	Formación humana	Español	LIBRO	68 paginas	Primera	Arequipa	2017	\N	t	\N
1001327	informacion humana 	Azul de mar adentro	José Chávez - Fernández Postigo	\N	\N	\N	978-9972-825-63-7	Universidad Católica San Pablo	LITERATURA	Español	LIBRO	46 paginas	Primera	Arequipa	2014	\N	t	\N
1001328	Cristianismo	Catecismo de la Iglesia Católica	Librería Editrice Vaticano, stato cittá del vaticano	\N	\N	\N	978-9972-05-205-7	VIP impresiones en general S.R.L.	RELIGION/TEOLOGIA	Español	LIBRO	655 paginas	Tercera reimpresión.	Lima	2017	\N	t	\N
1001329	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	\N	\N	Arequipa	2010	\N	t	\N
1001330	\N	Orientaciones para los salmistas	Luis - Camino Neocatecumenal	\N	\N	\N	-	-	LITURGIA	Español	LIBRO	1962 paginas	-	-	-	\N	t	\N
1001331	\N	Quinta montaña	Paulo Coelho	\N	\N	\N	958-42-0557-9	Planeta Colombiana S.A	RELIGIÓN	Portugués	LIBRO	1961 paginas	Segunda	Bogotá	2003	\N	t	\N
1001332	formacion humana 	Pilares de la Sociedad. Panorama mundial. Volumen I.	Edwin Heredia Rojas	\N	\N	\N	\N	Julio Calixto Mesía	FORMACIÓN HUM	Español	LIBRO	182 paginas	Primera	Lima	2018	\N	t	\N
1001333	\N	Managing strategic surprise	Paul Backen / Ian Bremmer / David Gordon	\N	\N	\N	978-0-521-70960-6	Cambridge University Press	ADMINISTRACIÓN	Inglés	LIBRO	1959 paginas	Primera	Cambridge	2008	\N	t	\N
1001334	\N	Firing Back. How Great leaders rebound after carreer disasters.	Jeffrey Sonnenfeld / Andrew Ward	\N	\N	\N	978-1-59139-301-6	Harvard Business Review Press	ADMINISTRACIÓN	Inglés	LIBRO	1958 paginas	Primera	Boston	2007	\N	t	\N
1001335	\N	Global war for internet goernance	Laura Denardis	\N	\N	\N	978-0-300-21252-5	Yale University Press	ADMINISTRACIÓN	Inglés	LIBRO	1957 paginas	Segunda	EE.UU.	2014	\N	t	\N
1001336	Cristianismo	Camino	San JoseMaría Escrivá	\N	\N	\N	978-9972-2794-9-2	INFROBAX ASOCIACION CIVIL	Cristianismo	Español	LIBRO	214 paginas	Sexta	Lima	2009	\N	t	\N
1001337	Cristianismo	Escuchad la voz	Franz Werfel	\N	\N	\N	84-7490-592-3	Encuentro S.A	Literatura	Español	LIBRO	758 paginas	Primera	Madrid	2000	\N	t	\N
1001338	Cistianismo	Actas del Congreso Internacional Histórico-Teológico Pastoral	Arzobispado de Arequipa	\N	\N	\N	978-612-46047-0-6	Alvaro M. Espinoza de la Borda	FORMACIÓN HUM	Español	LIBRO	374 paginas	Primera	Arequipa	2013	\N	t	\N
1001339	\N	Las aguas del Eden	Aryeh Kaplan	\N	\N	\N	84-330-0734-3	Desclée De Brouwer	\N	Español	LIBRO	1953 paginas	Primera	España	1988	\N	t	\N
1001340	\N	Laicos, discípulos y misioneros de Jesucristo. Luz del mundo	Conferencia Episcopal Peruana	\N	\N	\N	\N	\N	\N	Español	\N	1952 paginas	\N	\N	\N	\N	t	\N
1001341	\N	Fruto Terapia	Ausberto Medina Rodriguez	\N	\N	\N	\N	Cultura Peruana E.I.R.L	\N	Español	FOLLETO	1951 paginas	Primera	Perú	2018	\N	t	\N
1001342	\N	Productos y Servicios Financieros Operaciones Bancarias	Armando Villacorta Cavero	\N	\N	\N	\N	Pacífico	\N	Español	LIBRO	1950 paginas	Primera	Lima	2001	\N	t	\N
1001343	Formaciòn humana	Teodoro Nuñez Ureta: Bocetos	Teodoro Nuñez Ureta	\N	\N	\N	\N	Novaprint S.A.C	ARTE	Español	CATÁLOGO	24	Primera	Lima	2010	\N	t	\N
1001344	\N	Conversación en la catedral	Mario Vargas Llosa	\N	\N	\N	84-322-1322-5	Seix Barral S.A	LITERATURA	Español	LIBRO	1948 paginas	Octava	Barcelona	1974	\N	t	\N
1001345	\N	Credo símbolo de la fe de la Iglesia	Emiliano Jiménez Hernández	\N	\N	\N	978-612-47562-0-7	Seminario Diocesano y Misionero Redemptoris Mater	RELIGION/TEOLOGIA	Español	LIBRO	1947 paginas	Primera	Lima	2017	\N	t	\N
1001346	\N	Fe y bautismo en Benedicto XVI	Rvdo.D.Manuel de Jesús Celestino Reyes	\N	\N	\N	\N	\N	RELIGION/TEOLOGIA	Español	TESINA	1946 paginas	\N	Madrid	2015	\N	t	\N
1001347	Cristianismo	Historia de la iglesia: La iglesia: Comunidad e intitución, protagosnista de la historia	José Uriel Patiño F.	\N	\N	\N	958-607-351-3	Sociedad de San Pablo	Cristianismo	Español	LIBRO	270 paginas	Segunda	Bogotá	2004	\N	t	\N
1001348	\N	Cruz gloriosa	Facultad de teologia Redemptoris	\N	\N	\N	\N	\N	\N	Español	REVISTA	1944 paginas	\N	\N	\N	\N	t	\N
1001349	\N	Sexualidad según Juan Pablo II	Yves Semen	\N	\N	\N	84-330-1964-3	Desclée de Brouwer S.A	\N	Español	LIBRO	1943 paginas	Primera	París	2005	\N	t	\N
1001350	\N	Pisco patrimonio	Adam L.Weintraub	\N	\N	\N	978-0-692-96049-3	Iñigo Maneiro	\N	Español	LIBRO	1942 paginas	Primera	Perú	\N	\N	t	\N
1001351	\N	Detracciones, percepciones y retenciones. Sistemas de pago adepantado del IGV.	Staff Tributario.	\N	\N	\N	978-612-45835-5-1	Entrelíneas S.R. Ltda.	CONTABILIDAD	Español	LIBRO	1941 paginas	Primera	Lima	2010	\N	t	\N
1001352	\N	Proyecto de inversión de la empresa Tequemanía	Daniel Antonio Velásquez Velásquez	\N	\N	\N	\N	\N	ADMINISTRACIÓN	Español	TESINA	1940 paginas	\N	Arequipa	2017	\N	t	\N
1001353	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1939 paginas	\N	Arequipa	2010	\N	t	\N
1001408	\N	Ser Mujer T2	\N	\N	\N	\N	\N	\N	ENCICLOPEDIA	Español	LIBRO	1884 paginas	\N	\N	\N	\N	t	\N
1001355	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1937 paginas	\N	Arequipa	2010	\N	t	\N
1001356	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1936 paginas	\N	Arequipa	2010	\N	t	\N
1001357	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1935 paginas	\N	Arequipa	2010	\N	t	\N
1001358	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1934 paginas	\N	Arequipa	2010	\N	t	\N
1001359	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1933 paginas	\N	Arequipa	2010	\N	t	\N
1001360	\N	Nuevas tendencias en marketing	Keller K.	\N	\N	\N	958-42-1152-8	\N	\N	\N	LIBRO	1932 paginas	\N	\N	\N	\N	t	\N
1001361	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1931 paginas	\N	Arequipa	2010	\N	t	\N
1001362	\N	Nueva enciclopedia temática T1	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1930 paginas	Décima	Panamá	1969	\N	t	\N
1001363	\N	Nueva enciclopedia temática T2	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1929 paginas	Décima	Panamá	1969	\N	t	\N
1001364	\N	Nueva enciclopedia temática T3	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1928 paginas	Décima	Panamá	1969	\N	t	\N
1001365	\N	Nueva enciclopedia temática T4	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1927 paginas	Décima	Panamá	1969	\N	t	\N
1001366	\N	Nueva enciclopedia temática T5	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1926 paginas	Décima	Panamá	1969	\N	t	\N
1001367	\N	Nueva enciclopedia temática T6	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1925 paginas	Décima	Panamá	1969	\N	t	\N
1001368	\N	Nueva enciclopedia temática T7	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1924 paginas	Décima	Panamá	1969	\N	t	\N
1001369	\N	Nueva enciclopedia temática T8	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1923 paginas	Décima	Panamá	1969	\N	t	\N
1001370	\N	Nueva enciclopedia temática T9	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1922 paginas	Décima	Panamá	1969	\N	t	\N
1001371	\N	Nueva enciclopedia temática T10	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1921 paginas	Décima	Panamá	1969	\N	t	\N
1001372	\N	Nueva enciclopedia temática T11	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1920 paginas	Décima	Panamá	1969	\N	t	\N
1001373	\N	Nueva enciclopedia temática T12	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1919 paginas	Décima	Panamá	1969	\N	t	\N
1001374	\N	Nueva enciclopedia temática T13	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1918 paginas	Décima	Panamá	1969	\N	t	\N
1001375	\N	Nueva enciclopedia temática T14	Richards Topical Encyclopedia	\N	\N	\N	\N	Editorial Richards S.A	ENCICLOPEDIA	Español	LIBRO	1917 paginas	Décima	Panamá	1969	\N	t	\N
1001376	\N	Mente Sagaz T1	Angel Luis Garcia Jerez	\N	\N	\N	\N	Vergara, Barcelona	\N	Español	\N	1916 paginas	\N	\N	\N	\N	t	\N
1001377	\N	Mente Sagaz T2	Angel Luis Garcia Jerez	\N	\N	\N	\N	Vergara, Barcelona	\N	\N	\N	1915 paginas	\N	\N	\N	\N	t	\N
1001378	\N	Mente Sagaz T3	Angel Luis Garcia Jerez	\N	\N	\N	\N	Vergara, Barcelona	\N	\N	\N	1914 paginas	\N	\N	\N	\N	t	\N
1001379	\N	Ciencia Ilustrada T1	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1913 paginas	\N	\N	\N	\N	t	\N
1001380	\N	Ciencia Ilustrada T2	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1912 paginas	\N	\N	\N	\N	t	\N
1001381	\N	Ciencia Ilustrada T3	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1911 paginas	\N	\N	\N	\N	t	\N
1001382	\N	Ciencia Ilustrada T4	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1910 paginas	\N	\N	\N	\N	t	\N
1001383	\N	Ciencia Ilustrada T5	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1909 paginas	\N	\N	\N	\N	t	\N
1001384	\N	Ciencia Ilustrada T6	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1908 paginas	\N	\N	\N	\N	t	\N
1001385	\N	Ciencia Ilustrada T7	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1907 paginas	\N	\N	\N	\N	t	\N
1001386	\N	Ciencia Ilustrada T8	Iris Gottlieb	\N	\N	\N	\N	Abril S.A.	\N	\N	\N	1906 paginas	\N	\N	\N	\N	t	\N
1001387	\N	Nuevo tesoro de la Juventud T1	Federico Daus/ Benedetto Osvaldo/ Julio Pastor/ Manuel Mercader/ Ramón Villasuso/ Ángel Cabrera/ María Mantecón/ Adalberto Gentile	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1905 paginas	Octava	México	1976	\N	t	\N
1001388	\N	Nuevo tesoro de la Juventud T2	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1904 paginas	Octava	México	1976	\N	t	\N
1001389	\N	Nuevo tesoro de la Juventud T3	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1903 paginas	Octava	México	1976	\N	t	\N
1001390	\N	Nuevo tesoro de la Juventud T4	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1902 paginas	Octava	México	1976	\N	t	\N
1001391	\N	Nuevo tesoro de la Juventud T5	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1901 paginas	Octava	México	1976	\N	t	\N
1001392	\N	Nuevo tesoro de la Juventud T6	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1900 paginas	Octava	México	1976	\N	t	\N
1001393	\N	Nuevo tesoro de la Juventud T7	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1899 paginas	Octava	México	1976	\N	t	\N
1001394	\N	Nuevo tesoro de la Juventud T8	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1898 paginas	Octava	México	1976	\N	t	\N
1001395	\N	Nuevo tesoro de la Juventud T9	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1897 paginas	Octava	México	1976	\N	t	\N
1001396	\N	Nuevo tesoro de la Juventud T10	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1896 paginas	Octava	México	1976	\N	t	\N
1001397	\N	Nuevo tesoro de la Juventud T11	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1895 paginas	Octava	México	1976	\N	t	\N
1001398	\N	Nuevo tesoro de la Juventud T12	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1894 paginas	Octava	México	1976	\N	t	\N
1001399	\N	Nuevo tesoro de la Juventud T13	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1893 paginas	Octava	México	1976	\N	t	\N
1001400	\N	Nuevo tesoro de la Juventud T14	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1892 paginas	Octava	México	1976	\N	t	\N
1001401	\N	Nuevo tesoro de la Juventud T15	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1891 paginas	Octava	México	1976	\N	t	\N
1001402	\N	Nuevo tesoro de la Juventud T16	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1890 paginas	Octava	México	1976	\N	t	\N
1001403	\N	Nuevo tesoro de la Juventud T17	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1889 paginas	Octava	México	1976	\N	t	\N
1001404	\N	Nuevo tesoro de la Juventud T18	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1888 paginas	Octava	México	1976	\N	t	\N
1001405	\N	Nuevo tesoro de la Juventud T19	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1887 paginas	Octava	México	1976	\N	t	\N
1001406	\N	Nuevo tesoro de la Juventud T20	\N	\N	\N	\N	\N	Cumbre S.A.	ENCICLOPEDIA	Español	LIBRO	1886 paginas	Octava	México	1976	\N	t	\N
1001415	\N	Enciclopedia de la vida T1	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1877 paginas	\N	\N	\N	\N	t	\N
1001416	\N	Enciclopedia de la vida T2	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1876 paginas	\N	\N	\N	\N	t	\N
1001417	\N	Enciclopedia de la vida T3	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1875 paginas	\N	\N	\N	\N	t	\N
1001418	\N	Enciclopedia de la vida T4	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1874 paginas	\N	\N	\N	\N	t	\N
1001419	\N	Enciclopedia de la vida T5	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1873 paginas	\N	\N	\N	\N	t	\N
1001420	\N	Enciclopedia de la vida T6	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1872 paginas	\N	\N	\N	\N	t	\N
1001421	\N	Enciclopedia de la vida T7	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1871 paginas	\N	\N	\N	\N	t	\N
1001422	\N	Biblioteca de la lengua T1	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1870 paginas	\N	\N	\N	\N	t	\N
1001423	\N	Biblioteca de la lengua T2	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1869 paginas	\N	\N	\N	\N	t	\N
1001424	\N	Biblioteca de la lengua T3	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1868 paginas	\N	\N	\N	\N	t	\N
1001425	\N	Biblioteca de la lengua T4	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1867 paginas	\N	\N	\N	\N	t	\N
1001426	\N	Biblioteca de la lengua T5	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1866 paginas	\N	\N	\N	\N	t	\N
1001427	\N	Biblioteca de la lengua T6	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1865 paginas	\N	\N	\N	\N	t	\N
1001428	\N	Biblioteca de la lengua T7	Victor Civita	\N	\N	\N	\N	Abril S.A.	ENCICLOPEDIA	Español	LIBRO	1864 paginas	\N	\N	\N	\N	t	\N
1001429	\N	El túnel	Ernesto Sábato	\N	\N	\N	\N	\N	LITERATURA	Español	LIBRO	1863 paginas	\N	Lima	1948	\N	t	\N
1001430	Cristianismo	Reconciliación de la historia personal	Humberto Del Castillo Drago	\N	\N	\N	978-958-58848-4-7	Areté	Formación humana	Español	LIBRO	158 paginas	Segunda	Medellín	2016	\N	t	\N
1001431	\N	Historia Universal: La prehistoria I	Insituto Gallach. La República.	\N	\N	\N	9789972582158	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1861 paginas	Segunda	Lima	2005	\N	t	\N
1001432	\N	Historia Universal: La prehistoria II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1860 paginas	Segunda	Lima	2005	\N	t	\N
1001433	\N	Historia Universal: Los grandes imperios de Mesopotamia I	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1859 paginas	Segunda	Lima	2005	\N	t	\N
1001434	\N	Historia Universal: Los grandes imperios de Mesopotamia II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1858 paginas	Segunda	Lima	2005	\N	t	\N
1001435	\N	Historia Universal: Grecia I	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1857 paginas	Segunda	Lima	2005	\N	t	\N
1001436	\N	Historia Universal: Grecia II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1856 paginas	Segunda	Lima	2005	\N	t	\N
1001437	\N	Historia Universal: Roma I	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1855 paginas	Segunda	Lima	2005	\N	t	\N
1001438	\N	Historia Universal: Roma II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1854 paginas	Segunda	Lima	2005	\N	t	\N
1001439	\N	Historia Universal: Edad Media	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1853 paginas	Segunda	Lima	2005	\N	t	\N
1001440	\N	Historia Universal: La América pre colombina I	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1852 paginas	Segunda	Lima	2005	\N	t	\N
1001441	\N	Historia Universal: La América pre colombina II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1851 paginas	Segunda	Lima	2005	\N	t	\N
1001442	\N	Historia Universal: Asia	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1850 paginas	Segunda	Lima	2005	\N	t	\N
1001443	\N	Historia Universal: Edad Moderna	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1849 paginas	Segunda	Lima	2005	\N	t	\N
1001444	\N	Historia Universal: Siglo XX	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1848 paginas	Segunda	Lima	2005	\N	t	\N
1001445	\N	Historia Universal: Mundo Contemporáneo I	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1847 paginas	Segunda	Lima	2005	\N	t	\N
1001446	\N	Historia Universal: Mundo Contemporáneo II	Insituto Gallach. La República.	\N	\N	\N	9789972582165	Q.W. Editores S.A.C	HISTORIA	Español	LIBRO	1846 paginas	Segunda	Lima	2005	\N	t	\N
1001447	\N	Historia de la República del Perú. 1922-1933.	Jorge Basadre	\N	\N	\N	\N	Universidad Ricardo Palma	HISTORIA	Español	LIBRO	1845 paginas	Octava	Lima	1940	\N	t	\N
1001448	\N	Historia de la República del Perú. 1922-1933.	Jorge Basadre	\N	\N	\N	\N	Universidad Ricardo Palma	HISTORIA	Español	LIBRO	1844 paginas	Octava	Lima	1940	\N	t	\N
1001449	\N	Historia de la República del Perú. 1922-1933.	Jorge Basadre	\N	\N	\N	\N	Universidad Ricardo Palma	HISTORIA	Español	LIBRO	1843 paginas	Octava	Lima	1940	\N	t	\N
1001450	\N	Historia de la República del Perú. 1922-1933.	Jorge Basadre	\N	\N	\N	\N	Universidad Ricardo Palma	HISTORIA	Español	LIBRO	1842 paginas	Octava	Lima	1940	\N	t	\N
1001451	\N	Historia de la República del Perú. 1922-1933.	Jorge Basadre	\N	\N	\N	\N	Universidad Ricardo Palma	HISTORIA	Español	LIBRO	1841 paginas	Octava	Lima	1940	\N	t	\N
1001452	\N	Raíces	Alex Haley	\N	\N	\N	9788482809014	Editorial la oveja negra S.A.	HISTORIA	Español	LIBRO	1840 paginas	Primera	Colombia	1984	\N	t	\N
1001453	\N	Los Doce del Patíbulo	E.M. Nathanson	\N	\N	\N	9788482809441	Editorial la oveja negra S.A.	HISTORIA	Español	LIBRO	1839 paginas	Primera	Colombia	1985	\N	t	\N
1001454	\N	Aventuras de Sherloek Holmes	Arthur Conan Doyle	\N	\N	\N	9788482809526	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1838 paginas	Primera	Colombia	1985	\N	t	\N
1001455	\N	Los Doce del Patíbulo	E.M. Nathanson	\N	\N	\N	84-8280-943-1	Editorial la oveja negra S.A.	HISTORIA	Español	LIBRO	1837 paginas	Primera	Colombia	1985	\N	t	\N
1001456	\N	Lo que el viento se llevó	Margaret Mitchel	\N	\N	\N	9788482809274	Editorial la oveja negra S.A.	LITERATURA	Español	COLECCIÓN	1836 paginas	Primera	Colombia	1984	\N	t	\N
1001457	\N	Lo que el viento se llevó	Margaret Mitchel	\N	\N	\N	9788482809267	Editorial la oveja negra S.A.	LITERATURA	Español	COLECCIÓN	1835 paginas	Primera	Colombia	1984	\N	t	\N
1001458	\N	Guerra de mundos	H.G. Wells	\N	\N	\N	788482809359	Editorial la oveja negra Ltda. y R.B.A. proyectos editoriales S.A.	LITERATURA	Español	COLECCIÓN	1834 paginas	primera	Colombia	1984	\N	t	\N
1001459	\N	Isla de Arturo	Elsa Morante	\N	\N	\N	9788482809762	Editorial Bruguera S.A.	LITERATURA	Español	LIBRO	1833 paginas	primera	Colombia	1985	\N	t	\N
1001800	\N	Aptitud académica 1	Jorge Diaz Mosto	\N	\N	\N	\N	UNIVERSO SA	Libro	Español	Libro	270	\N	Lima	-	\N	t	\N
1001460	\N	Sin novedad en el frente	Erich Maria Remarque	\N	\N	\N	9788482809212	Editorial la oveja negra S.A.	HISTORIA	Español	LIBRO	1832 paginas	primera	Colombia	1984	\N	t	\N
1001461	\N	Ben - Hur	Lewis Wallace	\N	\N	\N	9788482809175	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1831 paginas	primera	Colombia	1984	\N	t	\N
1001462	\N	Love story	Erich Segal	\N	\N	\N	9788482809021	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1830 paginas	primera	Colombia	1984	\N	t	\N
1001463	\N	Dracula	Bram Stoker	\N	\N	\N	9788482809199	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1829 paginas	primera	Colombia	1984	\N	t	\N
1001464	\N	Éxodo	Leon Uris	\N	\N	\N	9788482809038	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1828 paginas	primera	Colombia	1984	\N	t	\N
1001465	\N	Fin del mundo: año 1999	Charles berlitz	\N	\N	\N	9788482809786	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1827 paginas	primera	Colombia	1985	\N	t	\N
1001466	\N	De aquí a la eternidad.	James Jones	\N	\N	\N	9788482809084	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1826 paginas	primera	Colombia	1984	\N	t	\N
1001467	\N	De aquí a la eternidad.	James Jones	\N	\N	\N	9788482809096	Editorial la oveja negra S.A.	LITERATURA	Español	LIBRO	1825 paginas	primera	Colombia	1984	\N	t	\N
1001468	\N	Guerra de las galaxias	George Lucas	\N	\N	\N	9788482809076	Editorial la oveja negra S.A.	ENTRETENIMIENTO	Español	LIBRO	1824 paginas	primera	Colombia	1984	\N	t	\N
1001469	\N	Piratas de la Malasia	Emilio Salgari	\N	\N	\N	9788482809828	Carvajal S.A.	LITERATURA	Español	LIBRO	1823 paginas	primera	Colombia	1984	\N	t	\N
1001470	\N	El hombre que fue jueves	G. K. Chesterton	\N	\N	\N	9788482809779	Carvajal S.A.	LITERATURA	Español	LIBRO	1822 paginas	primera	Colombia	1985	\N	t	\N
1001471	\N	Jane Eyre	Charlotte Bronte	\N	\N	\N	9788482809809	Carvajal S.A.	LITERATURA	Español	LIBRO	1821 paginas	primera	Colombia	1985	\N	t	\N
1001472	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1820 paginas	\N	Arequipa	2010	\N	t	\N
1001473	\N	Veinte mil leguas de viaje submarino	Julio Verne	\N	\N	\N	9788482807010	Oveja Negra	LITERATURA	Español	LIBRO	1819 paginas	primera	Colombia	1984	\N	t	\N
1001474	\N	Documental del Perú. Tacna	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1818 paginas	primera	Lima	1971	\N	t	\N
1001475	\N	Documental del Perú. Lambayeque	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1817 paginas	primera	Lima	1969	\N	t	\N
1001476	\N	Documental del Perú. La Libertad	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1816 paginas	primera	Lima	1969	\N	t	\N
1001477	\N	Documental del Perú. Ancash	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1815 paginas	primera	Lima	1967	\N	t	\N
1001478	\N	Documental del Perú. Moquegua	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1814 paginas	primera	Lima	1970	\N	t	\N
1001479	\N	Documental del Perú. Arequipa	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1813 paginas	primera	Lima	1967	\N	t	\N
1001480	\N	Historia Universal. Los orígenes	Salvat Editores	\N	\N	\N	84-345-9162-6	Salvat Editores	HISTORIA	Español	LIBRO	1812 paginas	primera	Lima	2005	\N	t	\N
1001481	\N	Documental del Perú. Ica	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1811 paginas	primera	Lima	1968	\N	t	\N
1001482	\N	Documental del Perú. Callao	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1810 paginas	primera	Lima	1967	\N	t	\N
1001483	\N	Documental del Perú. Amazonas	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1809 paginas	primera	Lima	1966	\N	t	\N
1001484	\N	Documental del Perú. Lima	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1808 paginas	primera	Lima	1969	\N	t	\N
1001485	\N	Documental del Perú. Tumbes	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1807 paginas	primera	Lima	1971	\N	t	\N
1001486	\N	Documental del Perú. Piura	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1806 paginas	primera	Lima	1970	\N	t	\N
1001487	\N	Documental del Perú. San Martín	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1805 paginas	primera	Lima	1971	\N	t	\N
1001488	\N	Documental del Perú. Cajamarca	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1804 paginas	primera	Lima	1971	\N	t	\N
1001489	\N	Documental del Perú. Junín	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1803 paginas	primera	Lima	1969	\N	t	\N
1001490	\N	Documental del Perú. Madre de Dios	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1802 paginas	primera	Lima	1970	\N	t	\N
1001491	\N	Documental del Perú. Apurímac	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1801 paginas	primera	Lima	1967	\N	t	\N
1001492	\N	Documental del Perú. Pasco	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1800 paginas	primera	Lima	1970	\N	t	\N
1001493	\N	Documental del Perú. Huánuco	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1799 paginas	primera	Lima	1968	\N	t	\N
1001494	\N	Documental del Perú. Huancavelica	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1798 paginas	primera	Lima	1968	\N	t	\N
1001495	\N	Documental del Perú. Ayacucho	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1797 paginas	primera	Lima	1967	\N	t	\N
1001496	\N	Documental del Perú. Puno	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1796 paginas	primera	Lima	1970	\N	t	\N
1001497	\N	Documental del Perú. Anuario Peruano 1972	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1795 paginas	primera	Lima	1972	\N	t	\N
1001801	\N	Aptitud académica 2	Jorge Diaz Mosto	\N	\N	\N	\N	UNIVERSO SA	Libro	Español	Libro	243	\N	Lima	-	\N	t	\N
1001498	\N	Documental del Perú. Cuzco	Pedro Felipe Cortazar	\N	\N	\N	\N	Informacion, opinión pública, publicidad y encuestas - editores	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1794 paginas	primera	Lima	1968	\N	t	\N
1001499	\N	Conde de montecristo	Alejandro de Dumas	\N	\N	\N	9788482807102	Editorial oveja negra	LITERATURA	Español	LIBRO	1793 paginas	primera	Santiago	1984	\N	t	\N
1001500	\N	Conde de montecristo	Alejandro de Dumas	\N	\N	\N	9788482807119	Editorial oveja negra	LITERATURA	Español	LIBRO	1792 paginas	primera	Colombia	1984	\N	t	\N
1001501	\N	Prisionero de Zenda	Anthony Hope	\N	\N	\N	9788482807317	Editorial oveja negra	LITERATURA	Español	LIBRO	1791 paginas	primera	Colombia	1985	\N	t	\N
1001502	\N	Taras bulba	Nicolai Gógol	\N	\N	\N	9788482807263	Editorial oveja negra	LITERATURA	Español	LIBRO	1790 paginas	primera	Colombia	1984	\N	t	\N
1001503	\N	Yanqui en la corte del rey Arturo	Mark Twain	\N	\N	\N	9788482807232	Editorial oveja negra	LITERATURA	Español	LIBRO	1789 paginas	primera	Colombia	1984	\N	t	\N
1001504	\N	Tarzan de los monos	E. Rice Burroughs	\N	\N	\N	9788482807140	Editorial oveja negra	LITERATURA	Español	LIBRO	1788 paginas	primera	Colombia	1984	\N	t	\N
1001505	\N	David Copperfield	Charles Dickens	\N	\N	\N	9788482807294	Editorial oveja negra	LITERATURA	Español	LIBRO	1787 paginas	primera	Colombia	1985	\N	t	\N
1001506	\N	David Copperfield	Charles Dickens	\N	\N	\N	9788482807300	Editorial oveja negra	LITERATURA	Español	LIBRO	1786 paginas	primera	Colombia	1985	\N	t	\N
1001507	\N	Tres mosqueteros	Alejandro de Dumas	\N	\N	\N	9788482807034	Editorial oveja negra	LITERATURA	Español	LIBRO	1785 paginas	primera	Colombia	1984	\N	t	\N
1001508	\N	De la tierra a la luna	Julio Verne	\N	\N	\N	9788482807249	Editorial oveja negra	LITERATURA	Español	LIBRO	1784 paginas	primera	Colombia	1984	\N	t	\N
1001509	\N	Viaje al centro de la tierra	Julio Verne	\N	\N	\N	9788482807126	Editorial oveja negra	LITERATURA	Español	LIBRO	1783 paginas	primera	Colombia	1984	\N	t	\N
1001510	\N	Minas del rey Salomón	H. Rider Haggard	\N	\N	\N	9788482807072	Editorial oveja negra	LITERATURA	Español	LIBRO	1782 paginas	primera	Colombia	1984	\N	t	\N
1001511	\N	Regreso de Sherlock Holmes	A. Conan Doyle	\N	\N	\N	9788482807096	Editorial oveja negra	LITERATURA	Español	LIBRO	1781 paginas	primera	Santiago	1984	\N	t	\N
1001512	\N	Capitán de quince años	Julio Verne	\N	\N	\N	9788482807270	Editorial oveja negra	LITERATURA	Español	LIBRO	1780 paginas	primera	Colombia	\N	\N	t	\N
1001513	\N	Aventuras de buffalo Bill	W. F. Cody	\N	\N	\N	84-8280-796-X	Editorial oveja negra	LITERATURA	Español	LIBRO	1779 paginas	primera	Colombia	1986	\N	t	\N
1001514	\N	Isla del tesoro	Robert L. Stevenson	\N	\N	\N	9788482807027	Editorial oveja negra	LITERATURA	Español	LIBRO	1778 paginas	primera	Colombia	1984	\N	t	\N
1001515	\N	Miguel Strogoff	Julio Verne	\N	\N	\N	9788482807041	Editorial oveja negra	LITERATURA	Español	LIBRO	1777 paginas	primera	Santiago	1984	\N	t	\N
1001516	\N	Último de los Mohicanos	Fenimore Cooper	\N	\N	\N	9788482807157	Editorial oveja negra	LITERATURA	Español	LIBRO	1776 paginas	primera	Colombia	1984	\N	t	\N
1001517	\N	Quo vadis?	H. sienkiewickz	\N	\N	\N	84-82-80-742-0	Editorial oveja negra	LITERATURA	Español	LIBRO	1775 paginas	primera	Colombia	1985	\N	t	\N
1001518	\N	Jorobado de nuestra señora	Victor Hugo	\N	\N	\N	84-8280-700-5	Editorial oveja negra	LITERATURA	Español	LIBRO	1774 paginas	primera	Colombia	1984	\N	t	\N
1001519	\N	Un viaje por la historia	Bernardo Roca Rey Miró Quesada	\N	\N	\N	978-9972-02-182-4	Editorial El Comercio	FORMACIÓN HUM	Español	COLECCIÓN	1773 paginas	Primera Edición	Perú	2009	\N	t	\N
1001520	\N	Biblioteca de la lengua diccionario de sinónimos y antónimos A-G	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0210-7	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1772 paginas	Primera Edición	España	2002	\N	t	\N
1001521	\N	Biblioteca de la lengua diccionario de sinónimos y antónimos H-Z	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0211-5	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1771 paginas	Primera Edición	España	2002	\N	t	\N
1001522	\N	Biblioteca de la lengua diccionario de dudas y dificultades A-G	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0212-3	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1770 paginas	Primera Edición	España	2002	\N	t	\N
1001523	\N	Biblioteca de la lengua diccionario de dudas y dificultades H-Z	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0213-1	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1769 paginas	Primera Edición	España	2002	\N	t	\N
1001524	\N	Biblioteca de la lengua ortografía esencial del español	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0214-X	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1768 paginas	Primera Edición	España	2002	\N	t	\N
1001525	\N	Biblioteca de la lengua diccionario gramática esencial del español parte 1	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0215-8	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1767 paginas	Tercera Edición	España	2002	\N	t	\N
1001526	\N	Biblioteca de la lengua diccionario gramática esencial del español parte 2	Empresas e Instituciones de Espasa Calpe	\N	\N	\N	84-670-0216-6	Espasa Calpe S.A.	ENCICLOPEDIA	Español	COLECCIÓN	1766 paginas	Tercera Edición	España	2002	\N	t	\N
1001527	\N	Furia de la naturaleza	Bernardo Roca Rey Miró Quesada	\N	\N	\N	\N	Editorial El Comercio	FORMACIÓN HUM	Español	COLECCIÓN	1765 paginas	Primera Edición	Perú	\N	\N	t	\N
1001528	\N	Países del mundo	Bernardo Roca Rey Miró Quesada	\N	\N	\N	\N	Editorial El Comercio	FORMACIÓN HUM	Español	COLECCIÓN	1764 paginas	Primera Edición	Perú	2006	\N	t	\N
1001529	\N	Charles Baudelaire historia de un alma	François Porché	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1763 paginas	Primera edición	Buenos Aires	1949	\N	t	\N
1001530	\N	Q'eswachaka	Carmen Arróspide Poblete/Luis Miranda	\N	\N	\N	\N	Editorial Super Gráfica E.I.R.L.	FORMACIÓN HUM	Español	LIBRO	1762 paginas	Primera edición	Lima	2018	\N	t	\N
1001531	\N	María Teresa de Austria	Karl Tschuppik	\N	\N	\N	\N	Editorial Juventud Argentina S.A.	LITERATURA	Español	LIBRO	1761 paginas	Tercera Edición	Buenos Aires	1946	\N	t	\N
1001532	\N	Esplendor y ocaso de los Romanof	Ana Wyrubowa	\N	\N	\N	\N	Editorial Juventud Argentina S.A.	LITERATURA	Español	LIBRO	1760 paginas	Primera edición	Buenos Aires	1947	\N	t	\N
1001533	\N	Bosques secos	Walter H. Wust	\N	\N	\N	978-612-4017-47-6	Editorial Gráfica Biblos S.A.	GEOGRAFÍA Y NATURALEZA	Español	LIBRO	1759 paginas	Primera edición	Lima	2018	\N	t	\N
1001534	\N	Torquemada	Thomas Hope	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1758 paginas	Segunda edfición	Buenos Aires	1946	\N	t	\N
1001535	\N	Eduardo VII y su época	André Maurois	\N	\N	\N	\N	Editorial Juventud Argentina S.A.	LITERATURA	Español	LIBRO	1757 paginas	Cuarta Edición	Buenos Aires	1945	\N	t	\N
1001536	\N	Santo de la espada	Ricardo Rojas	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1756 paginas	Edicion corriente	Buenos Aires	1940	\N	t	\N
1001537	\N	Charles Dickens	Pope-Hennessy	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1755 paginas	Primera edición	Buenos Aires	1949	\N	t	\N
1001538	\N	Enrique VIII y sus seis mujeres	Francis Hackett	\N	\N	\N	\N	Editorial Juventud Argentina S.A.	LITERATURA	Español	LIBRO	1754 paginas	Segunda edfición	Buenos Aires	1945	\N	t	\N
1001539	\N	La reina cristiana de Suecia	Oscar Von Wertheimer	\N	\N	\N	\N	Editorial Juventud Argentina S.A.	LITERATURA	Español	LIBRO	1753 paginas	Tercera Edición	Buenos Aires	1945	\N	t	\N
1001540	\N	Heinreich Heine	Antonina Vallentine	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1752 paginas	Primera edición	Buenos Aires	1950	\N	t	\N
1001541	\N	Potemkin el favorito de Catalina de Rusia	George Soloveytchik	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1751 paginas	Tercera Edición	Buenos Aires	1950	\N	t	\N
1001542	\N	Miguel Ángel	Marcel Brion	\N	\N	\N	\N	Editorial Losada S.A.	FORMACIÓN HUM	Español	LIBRO	1750 paginas	\N	Buenos Aires	1948	\N	t	\N
1001543	Cristianismo	Asociaciones y movimientos eclesiales (Criterios de orientación)	Comisión Episcopal de Apostolado Laical	\N	\N	\N	\N	Editorial Siklos S.R.L.	Cristianismo	Español	LIBRO	126 paginas	Segunda Edición	Lima	1996	\N	t	\N
1001544	\N	Einstein hacedor de universos	H. Gordon Garbedian	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1748 paginas	Tercera edición	Buenos Aires	1949	\N	t	\N
1001545	\N	Oliver Cromwell	Maurice Ashley	\N	\N	\N	\N	Editorial Losada S.A.	LITERATURA	Español	LIBRO	1747 paginas	\N	Buenos Aires	1949	\N	t	\N
1001546	\N	El matrimonio, vocación cristiana (Homilía)	San Josemaría Escrivá de Balaguer	\N	\N	\N	978-612-46995-1-1	\N	RELIGION/TEOLOGIA	Español	LIBRO	1746 paginas	\N	Lima	2008	\N	t	\N
1001547	\N	Marconi precursor de la radiotelefonia	Douglas Coe	\N	\N	\N	\N	Editorial Juventud Argentina S:A:	LITERATURA	Español	LIBRO	1745 paginas	\N	Buenos Aires	1945	\N	t	\N
1001548	\N	Historia de San Michele	Axel Munthe	\N	\N	\N	\N	Editorial Juventud Argentina S:A:	LITERATURA	Español	LIBRO	1744 paginas	Décimotercera Edición	Buenos Aires	1950	\N	t	\N
1001549	\N	Carlos I el rey de Iglaterra	Hilaire Belloc	\N	\N	\N	\N	Editorial Juventud Argentina S:A:	LITERATURA	Español	LIBRO	1743 paginas	Tercera Edición	Buenos Aires	1945	\N	t	\N
1001550	\N	Beethoven	Emil Ludwig	\N	\N	\N	\N	Editorial Juventud Argentina S:A:	LITERATURA	Español	LIBRO	1742 paginas	Quinta edición	Buenos Aires	1950	\N	t	\N
1001551	\N	Sistema de cajas municipales de ahorro y crédito	FEPCMAC ( federacion peruana de cajas municipales de ahorro y crédito )	\N	\N	\N	\N	FEPCMAC ( federacion peruana de cajas municipales de ahorro y crédito )	ADMINISTRACIÓN	Español	REVISTA	1741 paginas	Primera	Lima	\N	\N	t	\N
1001552	\N	En la escucha del corazón	Enzo Pelvi	\N	\N	\N	9972-686-18-3	Grupo Editorial Latinoamericano	FORMACIÓN HUM	Español	LIBRO	1740 paginas	Primera	Lima	1998	\N	t	\N
1001553	Cristianismo	Laudato si¨	Francisco	\N	\N	\N	978-9972-05-267-5	Paulinas	FORMACIÓN HUM	Español	LIBRO	191 paginas	Tercera reimpresión	Lima	2017	\N	t	\N
1001554	Cristianismo	Laudato si¨	Francisco	\N	\N	\N	978-9972-05-267-6	Paulinas	FORMACIÓN HUM	Español	LIBRO	191 paginas	Tercera reimpresión	Lima	2017	\N	t	\N
1001555	\N	Peregrinaciones de una paria	Flora Tristán	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1737 paginas	\N	Arequipa	2010	\N	t	\N
1001556	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	Polaroid Corporation U.S.A	ENCICLOPEDIA	Español	LIBRO	1736 paginas	\N	Cambridge	1977	\N	t	\N
1001557	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1735 paginas	\N	\N	\N	\N	t	\N
1001558	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1734 paginas	\N	\N	\N	\N	t	\N
1001559	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1733 paginas	\N	\N	\N	\N	t	\N
1001560	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1732 paginas	\N	\N	\N	\N	t	\N
1001561	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1731 paginas	\N	\N	\N	\N	t	\N
1001562	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1730 paginas	\N	\N	\N	\N	t	\N
1001563	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1729 paginas	\N	\N	\N	\N	t	\N
1001564	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1728 paginas	\N	\N	\N	\N	t	\N
1001565	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1727 paginas	\N	\N	\N	\N	t	\N
1001566	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1726 paginas	\N	\N	\N	\N	t	\N
1001567	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1725 paginas	\N	\N	\N	\N	t	\N
1001568	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1724 paginas	\N	\N	\N	\N	t	\N
1001569	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1723 paginas	\N	\N	\N	\N	t	\N
1001570	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1722 paginas	\N	\N	\N	\N	t	\N
1001571	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1721 paginas	\N	\N	\N	\N	t	\N
1001572	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1720 paginas	\N	\N	\N	\N	t	\N
1001573	\N	Geo Mundo	Polaroid Corporation	\N	\N	\N	\N	\N	\N	\N	\N	1719 paginas	\N	\N	\N	\N	t	\N
1001574	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1718 paginas	\N	\N	\N	\N	t	\N
1001575	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1717 paginas	\N	\N	\N	\N	t	\N
1001576	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1716 paginas	\N	\N	\N	\N	t	\N
1001577	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1715 paginas	\N	\N	\N	\N	t	\N
1001578	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1714 paginas	\N	\N	\N	\N	t	\N
1001579	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1713 paginas	\N	\N	\N	\N	t	\N
1001580	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1712 paginas	\N	\N	\N	\N	t	\N
1001581	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1711 paginas	\N	\N	\N	\N	t	\N
1001582	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1710 paginas	\N	\N	\N	\N	t	\N
1001583	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1709 paginas	\N	\N	\N	\N	t	\N
1001584	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1708 paginas	\N	\N	\N	\N	t	\N
1001585	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1707 paginas	\N	\N	\N	\N	t	\N
1001586	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1706 paginas	\N	\N	\N	\N	t	\N
1001587	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1705 paginas	\N	\N	\N	\N	t	\N
1001588	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1704 paginas	\N	\N	\N	\N	t	\N
1001589	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1703 paginas	\N	\N	\N	\N	t	\N
1001590	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1702 paginas	\N	\N	\N	\N	t	\N
1001591	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1701 paginas	\N	\N	\N	\N	t	\N
1001592	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1700 paginas	\N	\N	\N	\N	t	\N
1001593	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1699 paginas	\N	\N	\N	\N	t	\N
1001594	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1698 paginas	\N	\N	\N	\N	t	\N
1001595	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1697 paginas	\N	\N	\N	\N	t	\N
1001596	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1696 paginas	\N	\N	\N	\N	t	\N
1001597	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1695 paginas	\N	\N	\N	\N	t	\N
1001598	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1694 paginas	\N	\N	\N	\N	t	\N
1001599	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1693 paginas	\N	\N	\N	\N	t	\N
1001600	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1692 paginas	\N	\N	\N	\N	t	\N
1001601	\N	National Geographic	National Geographic	\N	\N	\N	\N	\N	\N	\N	\N	1691 paginas	\N	\N	\N	\N	t	\N
1001602	\N	Tía Julia y el escribidor	Mario Vargas Llosa	\N	\N	\N	978-612-4039-68-3	Alfaguara	LITERATURA	Español	\N	1690 paginas	Primera	Lima	2010	\N	t	\N
1001802	\N	Aptitud académica 3	Jorge Diaz Mosto	\N	\N	\N	\N	UNIVERSO SA	Libro	Español	Libro	256	\N	Lima	-	\N	t	\N
1001603	\N	Pureza y sexualidad. Para mujeres que quieren ser amadas de verdad	P. Jürgen Daum	\N	\N	\N	978-9972-825-60-6	Fondo Editorial UCSP	FORMACIÓN HUM	\N	\N	1689 paginas	Primera Edición. Segunda reimpresión. 2015	Arequipa	2015	\N	t	\N
1001604	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1688 paginas	\N	Arequipa	2010	\N	t	\N
1001605	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1687 paginas	\N	Arequipa	2010	\N	t	\N
1001606	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1686 paginas	\N	Arequipa	2010	\N	t	\N
1001607	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1685 paginas	\N	Arequipa	2010	\N	t	\N
1001608	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1684 paginas	\N	Arequipa	2010	\N	t	\N
1001609	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1683 paginas	\N	Arequipa	2010	\N	t	\N
1001610	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1682 paginas	\N	Arequipa	2010	\N	t	\N
1001611	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1681 paginas	\N	Arequipa	2010	\N	t	\N
1001612	\N	Poesías completas	Mariano Melgar	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1680 paginas	\N	Arequipa	2010	\N	t	\N
1001613	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1679 paginas	\N	Arequipa	2010	\N	t	\N
1001614	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1678 paginas	\N	Arequipa	2010	\N	t	\N
1001615	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1677 paginas	\N	Arequipa	2010	\N	t	\N
1001616	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1676 paginas	\N	Arequipa	2010	\N	t	\N
1001617	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1675 paginas	\N	Arequipa	2010	\N	t	\N
1001618	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1674 paginas	\N	Arequipa	2010	\N	t	\N
1001619	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1673 paginas	\N	Arequipa	2010	\N	t	\N
1001620	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1672 paginas	\N	Arequipa	2010	\N	t	\N
1001621	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1671 paginas	\N	Arequipa	2010	\N	t	\N
1001622	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1670 paginas	\N	Arequipa	2010	\N	t	\N
1001623	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1669 paginas	\N	Arequipa	2010	\N	t	\N
1001624	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1668 paginas	\N	Arequipa	2010	\N	t	\N
1001625	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1667 paginas	\N	Arequipa	2010	\N	t	\N
1001626	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1666 paginas	\N	Arequipa	2010	\N	t	\N
1001627	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1665 paginas	\N	Arequipa	2010	\N	t	\N
1001628	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1664 paginas	\N	Arequipa	2010	\N	t	\N
1001629	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1663 paginas	\N	Arequipa	2010	\N	t	\N
1001630	\N	Arequipa y los viajeros	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1662 paginas	\N	Arequipa	2010	\N	t	\N
1001631	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1661 paginas	\N	Arequipa	2010	\N	t	\N
1001632	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1660 paginas	\N	Arequipa	2010	\N	t	\N
1001633	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1659 paginas	\N	Arequipa	2010	\N	t	\N
1001634	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1658 paginas	\N	Arequipa	2010	\N	t	\N
1001635	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1657 paginas	\N	Arequipa	2010	\N	t	\N
1001636	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1656 paginas	\N	Arequipa	2010	\N	t	\N
1001637	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1655 paginas	\N	Arequipa	2010	\N	t	\N
1001638	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1654 paginas	\N	Arequipa	2010	\N	t	\N
1001639	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1653 paginas	\N	Arequipa	2010	\N	t	\N
1001640	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1652 paginas	\N	Arequipa	2010	\N	t	\N
1001641	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1651 paginas	\N	Arequipa	2010	\N	t	\N
1001642	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1650 paginas	\N	Arequipa	2010	\N	t	\N
1001643	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1649 paginas	\N	Arequipa	2010	\N	t	\N
1001644	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1648 paginas	\N	Arequipa	2010	\N	t	\N
1001645	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1647 paginas	\N	Arequipa	2010	\N	t	\N
1001646	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1646 paginas	\N	Arequipa	2010	\N	t	\N
1001647	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1645 paginas	\N	Arequipa	2010	\N	t	\N
1001648	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1644 paginas	\N	Arequipa	2010	\N	t	\N
1001803	\N	AREQUIPA HISTÓRICA	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1489 paginas	\N	\N	\N	\N	t	\N
1001649	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1643 paginas	\N	Arequipa	2010	\N	t	\N
1001650	\N	Repertorio poético Arequipeño	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1642 paginas	\N	Arequipa	2010	\N	t	\N
1001651	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1641 paginas	\N	Arequipa	2010	\N	t	\N
1001652	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1640 paginas	\N	Arequipa	2010	\N	t	\N
1001653	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1639 paginas	\N	Arequipa	2010	\N	t	\N
1001654	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1638 paginas	\N	Arequipa	2010	\N	t	\N
1001655	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1637 paginas	\N	Arequipa	2010	\N	t	\N
1001656	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1636 paginas	\N	Arequipa	2010	\N	t	\N
1001657	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1635 paginas	\N	Arequipa	2010	\N	t	\N
1001658	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1634 paginas	\N	Arequipa	2010	\N	t	\N
1001659	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1633 paginas	\N	Arequipa	2010	\N	t	\N
1001660	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1632 paginas	\N	Arequipa	2010	\N	t	\N
1001661	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1631 paginas	\N	Arequipa	2010	\N	t	\N
1001662	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1630 paginas	\N	Arequipa	2010	\N	t	\N
1001663	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1629 paginas	\N	Arequipa	2010	\N	t	\N
1001664	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1628 paginas	\N	Arequipa	2010	\N	t	\N
1001665	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1627 paginas	\N	Arequipa	2010	\N	t	\N
1001666	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1626 paginas	\N	Arequipa	2010	\N	t	\N
1001667	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1625 paginas	\N	Arequipa	2010	\N	t	\N
1001668	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1624 paginas	\N	Arequipa	2010	\N	t	\N
1001669	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1623 paginas	\N	Arequipa	2010	\N	t	\N
1001670	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1622 paginas	\N	Arequipa	2010	\N	t	\N
1001671	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1621 paginas	\N	Arequipa	2010	\N	t	\N
1001672	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1620 paginas	\N	Arequipa	2010	\N	t	\N
1001673	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1619 paginas	\N	Arequipa	2010	\N	t	\N
1001674	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1618 paginas	\N	Arequipa	2010	\N	t	\N
1001675	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1617 paginas	\N	Arequipa	2010	\N	t	\N
1001676	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1616 paginas	\N	Arequipa	2010	\N	t	\N
1001677	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1615 paginas	\N	Arequipa	2010	\N	t	\N
1001678	\N	Cuentos Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1614 paginas	\N	Arequipa	2010	\N	t	\N
1001679	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1613 paginas	\N	Arequipa	2010	\N	t	\N
1001680	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1612 paginas	\N	Arequipa	2010	\N	t	\N
1001681	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1611 paginas	\N	Arequipa	2010	\N	t	\N
1001682	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1610 paginas	\N	Arequipa	2010	\N	t	\N
1001683	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1609 paginas	\N	Arequipa	2010	\N	t	\N
1001684	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1608 paginas	\N	Arequipa	2010	\N	t	\N
1001685	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1607 paginas	\N	Arequipa	2010	\N	t	\N
1001686	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1606 paginas	\N	Arequipa	2010	\N	t	\N
1001687	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1605 paginas	\N	Arequipa	2010	\N	t	\N
1001688	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1604 paginas	\N	Arequipa	2010	\N	t	\N
1001689	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1603 paginas	\N	Arequipa	2010	\N	t	\N
1001690	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1602 paginas	\N	Arequipa	2010	\N	t	\N
1001691	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1601 paginas	\N	Arequipa	2010	\N	t	\N
1001692	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1600 paginas	\N	Arequipa	2010	\N	t	\N
1001693	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1599 paginas	\N	Arequipa	2010	\N	t	\N
1001694	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1598 paginas	\N	Arequipa	2010	\N	t	\N
1001804	\N	Argelia hija del descierto	\N	\N	\N	\N	\N	\N	libro	\N	\N	1488 paginas	\N	\N	\N	\N	t	\N
1001695	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1597 paginas	\N	Arequipa	2010	\N	t	\N
1001696	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1596 paginas	\N	Arequipa	2010	\N	t	\N
1001697	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1595 paginas	\N	Arequipa	2010	\N	t	\N
1001698	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1594 paginas	\N	Arequipa	2010	\N	t	\N
1001699	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1593 paginas	\N	Arequipa	2010	\N	t	\N
1001700	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1592 paginas	\N	Arequipa	2010	\N	t	\N
1001701	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1591 paginas	\N	Arequipa	2010	\N	t	\N
1001702	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1590 paginas	\N	Arequipa	2010	\N	t	\N
1001703	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1589 paginas	\N	Arequipa	2010	\N	t	\N
1001704	\N	Tradiciones y leyendas Arequipeñas	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1588 paginas	\N	Arequipa	2010	\N	t	\N
1001705	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1587 paginas	\N	Arequipa	2010	\N	t	\N
1001706	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1586 paginas	\N	Arequipa	2010	\N	t	\N
1001707	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1585 paginas	\N	Arequipa	2010	\N	t	\N
1001708	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1584 paginas	\N	Arequipa	2010	\N	t	\N
1001709	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1583 paginas	\N	Arequipa	2010	\N	t	\N
1001710	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1582 paginas	\N	Arequipa	2010	\N	t	\N
1001711	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1581 paginas	\N	Arequipa	2010	\N	t	\N
1001712	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1580 paginas	\N	Arequipa	2010	\N	t	\N
1001713	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1579 paginas	\N	Arequipa	2010	\N	t	\N
1001714	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1578 paginas	\N	Arequipa	2010	\N	t	\N
1001715	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1577 paginas	\N	Arequipa	2010	\N	t	\N
1001716	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1576 paginas	\N	Arequipa	2010	\N	t	\N
1001717	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1575 paginas	\N	Arequipa	2010	\N	t	\N
1001718	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1574 paginas	\N	Arequipa	2010	\N	t	\N
1001719	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1573 paginas	\N	Arequipa	2010	\N	t	\N
1001720	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1572 paginas	\N	Arequipa	2010	\N	t	\N
1001721	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1571 paginas	\N	Arequipa	2010	\N	t	\N
1001722	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1570 paginas	\N	Arequipa	2010	\N	t	\N
1001723	\N	Meditaciones Arequipeños	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1569 paginas	\N	Arequipa	2010	\N	t	\N
1001724	\N	Fantasma de la Ópera	\N	\N	\N	\N	\N	\N	\N	\N	\N	1568 paginas	\N	\N	\N	\N	t	\N
1001725	\N	Fantasma de Canterville	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1567 paginas	\N	Arequipa	2010	\N	t	\N
1001726	\N	La Guerra y la Paz	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1566 paginas	\N	Arequipa	2010	\N	t	\N
1001727	\N	Las Aventuras de Sherlock Holmes	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1565 paginas	\N	Arequipa	2010	\N	t	\N
1001728	\N	Isla misteriosa	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1564 paginas	\N	Arequipa	2010	\N	t	\N
1001729	\N	Tom Sawyer	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1563 paginas	\N	Arequipa	2010	\N	t	\N
1001730	\N	El Príncipe y el Mendigo	Antología Básica	\N	\N	\N	\N	Biblioteca Juvenil de Arequipa	LITERATURA	Español	LIBRO	1562 paginas	\N	Arequipa	2010	\N	t	\N
1001731	\N	Oliver Twist	Gaston Leroux	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1561 paginas	\N	\N	2012	\N	t	\N
1001732	\N	Don Juan Tenorio	Oscar Wilde	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1560 paginas	\N	\N	2012	\N	t	\N
1001733	\N	María	León Tolstoi	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1559 paginas	\N	\N	2010	\N	t	\N
1001734	\N	Niños Invisibles / Niñez con dicapacidad en el Perú	Arthur Conan Doyle	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1558 paginas	\N	\N	2010	\N	t	\N
1001735	\N	Crimen y Castigo	Julio Verne	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1557 paginas	\N	\N	2011	\N	t	\N
1001736	\N	Narraciones extraordinarias	Mark Twain	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1556 paginas	\N	\N	2011	\N	t	\N
1001737	\N	Viaje al centro de la tierra, ingresos repetidos hasta 284	Mark Twain	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1555 paginas	\N	\N	2011	\N	t	\N
1001738	\N	Vuelta al mundo en 80 días	Charles Dickens	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1554 paginas	\N	\N	2011	\N	t	\N
1001739	\N	Bertoldo, Bertoldino y Cacaseno	José Zorrlla	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1553 paginas	\N	\N	2013	\N	t	\N
1001740	\N	La Guerra y la Paz	Jorge Isaacs	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1552 paginas	\N	\N	2013	\N	t	\N
1001741	\N	Fausto	Liliana Peñaherrera/Guillermo Vega Espejo	\N	\N	\N	978-9972-221-48-4	Fondo editorial del Congreso del Perú	FILOSOFIA Y PSICOLOGIA	Español	LIBRO	1551 paginas	Primera	Lima	2008	\N	t	\N
1001742	\N	Estrategias de Crecimiento	Fiódor Dostoyevski	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1550 paginas	\N	\N	2013	\N	t	\N
1001743	\N	Toma de decisiones	Edgar Allan Poe	\N	\N	\N	\N	\N	LITERATURA	\N	\N	1549 paginas	\N	\N	2008	\N	t	\N
1001744	\N	Como medir el rendimiento de la empresa	Julio Verne	\N	\N	\N	2007-03039	\N	LITERATURA	\N	\N	1548 paginas	\N	\N	\N	\N	t	\N
1001805	\N	Ari quepay VOLUMEN II	\N	\N	\N	\N	\N	\N	2 Libro	\N	\N	1487 paginas	\N	\N	\N	\N	t	\N
1001806	\N	Arroz y menestras	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1486 paginas	\N	\N	\N	\N	t	\N
1002701	\N	ESPASA CALPE 20	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	591 paginas	\N	\N	\N	\N	t	\N
1001745	\N	Liderazgo	Julio Verne	\N	\N	\N	2007-09756	\N	LITERATURA	\N	\N	1547 paginas	\N	\N	\N	El trabajo del directivo: folkrore y realidad. Lo que de verdad hacen los lideres. Directivos y lideres: ¿Son diferentes? La disciplina de fortalecer el carácter. Los sistemas de liderazgo de los consejeros delegados. El lado humano de la gestión. El trabajo de líder. ¿Qué fue del directivo que asumía el mando?	t	\N
1001746	\N	Gestión de cambio	Julio Cesar Croce	\N	\N	\N	2009-09091	\N	LITERATURA	\N	\N	1546 paginas	\N	\N	\N	Liderar el cambio. Construir la vision de su empresa. Gestionar vel cambio. La montaña rusa de la reinvención. Cambiar la mentalidad de la empresa. ¿Por qué los empleados se resisten al cambio? Modelar un sector. Los programas del cambio del éxito comienzan con resultados.	t	\N
1001747	Administración	Comunicación eficaz	Harvard business Review	\N	\N	\N	\N	Planeta Colombiana S.A.	COMUNICACIÓN	Español	LIBRO	221 paginas	------	Barcelona	2000	Escuchemos provechozamente a nuestros interlocutores. Cómo dirigir reuniones. Reuniones creativas compartiendo el poder. Nadie se fia plenamente del jefe: ¿Qué hacer entonces?. La destreza incompetente. Los mensajes ocultos que envian los directivos. Cómo informar y cambiar a los empleados de primera linea. Cómo pueden mantener un buen debate los equipos de dirección.	t	\N
1001748	\N	Dirigir personas en la empresa	Harvard business Review	\N	\N	\N	\N	Planeta Colombiana S.A.	ADMINISTRACIÓN	\N	\N	1544 paginas	\N	\N	\N	¿Qué mantiene unida a la empresa moderna? Pigmalion y la dirección de empresas. Seis mitos peligrosos sobre el suelo. La delegación de autoridad: el estilo nuevo del emprendedor. Cómo hacer que las diferencias importen: un nuevo modelo para diversidad. El centro de trabajo alternativo: Cómo cambiar la forma y el lugar donde trabaja la gente. El síndrome del condenado a fracasar. Es necesario el arte de la persuación.	t	\N
1001749	\N	Nuevas tendencias en marketing	\N	\N	\N	\N	84-234-1658-5	Planeta Colombiana S.A.	ADMINISTRACIÓN	Español	LIBRO	1543 paginas	\N	Bogotá	\N	La tarjeta de informe de la marca. Resucitar una marca moribunda. Cómo competir en una guerra de precios. Marketing contextual. La atracción de las marcas globales. ¿Se alinean toda las estrellas estratégicas en su marca coperativa? Atormente a sus clientes (a ellos les encanta). Impulse el rendimiento de la inversión de marketing con el diseño experimental. Unas palabras sobre los colaboradores.	t	\N
1001750	\N	COCINA DEL NORTE 2	El Comercio	\N	\N	\N	\N	\N	Gastronomia /Folleto	\N	\N	1542 paginas	\N	\N	\N	\N	t	\N
1001751	\N	ESPASA 1	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1541 paginas	\N	\N	\N	\N	t	\N
1001752	\N	ESPASA 10	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1540 paginas	\N	\N	\N	\N	t	\N
1001753	\N	ESPASA 11	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1539 paginas	\N	\N	\N	\N	t	\N
1001754	\N	ESPASA 12	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1538 paginas	\N	\N	\N	\N	t	\N
1001755	\N	ESPASA 13	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1537 paginas	\N	\N	\N	\N	t	\N
1001756	\N	ESPASA 14	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1536 paginas	\N	\N	\N	\N	t	\N
1001757	\N	ESPASA 15	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1535 paginas	\N	\N	\N	\N	t	\N
1001758	\N	ESPASA 16	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1534 paginas	\N	\N	\N	\N	t	\N
1001759	\N	ESPASA 17	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1533 paginas	\N	\N	\N	\N	t	\N
1001760	\N	ESPASA 18	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1532 paginas	\N	\N	\N	\N	t	\N
1001761	\N	ESPASA 19	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1531 paginas	\N	\N	\N	\N	t	\N
1001762	\N	ESPASA 2	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1530 paginas	\N	\N	\N	\N	t	\N
1001763	\N	ESPASA 20	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1529 paginas	\N	\N	\N	\N	t	\N
1001764	\N	ESPASA 21	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1528 paginas	\N	\N	\N	\N	t	\N
1001765	\N	ESPASA 22	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1527 paginas	\N	\N	\N	\N	t	\N
1001766	\N	ESPASA 23	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1526 paginas	\N	\N	\N	\N	t	\N
1001767	\N	ESPASA 24	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1525 paginas	\N	\N	\N	\N	t	\N
1001768	\N	ESPASA 3	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1524 paginas	\N	\N	\N	\N	t	\N
1001769	\N	ESPASA 4	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1523 paginas	\N	\N	\N	\N	t	\N
1001770	\N	ESPASA 5	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1522 paginas	\N	\N	\N	\N	t	\N
1001771	\N	ESPASA 6	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1521 paginas	\N	\N	\N	\N	t	\N
1001772	\N	ESPASA 7	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1520 paginas	\N	\N	\N	\N	t	\N
1001773	\N	ESPASA 8	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1519 paginas	\N	\N	\N	\N	t	\N
1001774	\N	ESPASA 9	\N	\N	\N	\N	\N	PLANETA COLOMBIANA	Enciclopedia	\N	\N	1518 paginas	\N	\N	\N	\N	t	\N
1001775	\N	QUORUM EDICION N°07 - JUNIO 2018	Una revista del estudio de muñiz	\N	\N	\N	\N	\N	REVISTA	\N	\N	1517 paginas	\N	\N	\N	\N	t	\N
1001776	\N	QUORUM EDICION N°11 - JUNIO 2019	Una revista del estudio de muñiz	\N	\N	\N	\N	\N	REVISTA	\N	\N	1516 paginas	\N	\N	\N	\N	t	\N
1001777	\N	QUORUM EDICION N°12 - SEPTIEMBRE 2019	Una revista del estudio de muñiz	\N	\N	\N	\N	\N	REVISTA	\N	\N	1515 paginas	\N	\N	\N	\N	t	\N
1001778	\N	"Cocina en treinta minutos" con Angélica Sasaki-Postres	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1514 paginas	\N	\N	\N	\N	t	\N
1001779	\N	¿Adivina quien soy?	\N	\N	\N	\N	\N	ARICA S.A.	Literatura/Obras	\N	\N	1513 paginas	\N	\N	\N	\N	t	\N
1001780	\N	180 menús ricos y nutritivos TOMO 10	Angelica Sasaki	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1512 paginas	\N	\N	\N	\N	t	\N
1001781	\N	180 menús ricos y nutritivos TOMO 12	Angelica Sasaki	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1511 paginas	\N	\N	\N	\N	t	\N
1001782	Administracion	A PESAR DE LOS TIEMPOS	Caja Arequipa Presente en la Historia	\N	\N	\N	\N	caja arequipa presente en la historia	LIBRO	Español	Libro	 143 paginas	-	-	2017	\N	t	\N
1001783	\N	Abran las puertas de la misericordia	\N	\N	\N	\N	\N	DIOCESIS DE CARABAYLLO	Cristianismo	\N	\N	1509 paginas	\N	\N	\N	\N	t	\N
1001784	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1508 paginas	\N	\N	\N	\N	t	\N
1001785	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1507 paginas	\N	\N	\N	\N	t	\N
1001786	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1506 paginas	\N	\N	\N	\N	t	\N
1001787	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1505 paginas	\N	\N	\N	\N	t	\N
1001788	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1504 paginas	\N	\N	\N	\N	t	\N
1001789	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1503 paginas	\N	\N	\N	\N	t	\N
1001790	\N	ADEPIA ED. N°40	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1502 paginas	\N	\N	\N	\N	t	\N
1001791	\N	ADEPIA ED. N°41	\N	\N	\N	\N	MAY.2018	\N	Revista	\N	\N	1501 paginas	\N	\N	\N	\N	t	\N
1001792	\N	Administracion Financiera	W. Johnson	\N	\N	\N	\N	\N	Administración	\N	\N	1500 paginas	\N	\N	\N	\N	t	\N
1001793	\N	AGENDA GOURMET Y DEL PAN 2017	Esagsac Comunicadores	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1499 paginas	\N	\N	\N	\N	t	\N
1001794	\N	AGILE BANKING N°17 SEPTIEMBRE-OCTUBRE 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1498 paginas	\N	\N	\N	\N	t	\N
1001795	\N	ALICIA EN EL PAIS DE LAS MARAVILLAS	Lewis Carroll	\N	\N	\N	MAYO, 2012	\N	Literatura/Obras	\N	\N	1497 paginas	\N	\N	\N	\N	t	\N
1001796	\N	América económica	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1496 paginas	\N	\N	\N	\N	t	\N
1001797	\N	AMÉRICO VESPUCIO-LA CAPACIDAD DE IDENTIFICAR OPORTUNIDADES	RODRIGO MORENO JERIA	\N	\N	\N	\N	\N	Libro	\N	\N	1495 paginas	\N	\N	\N	\N	t	\N
1001798	\N	Antologia Didactica	\N	\N	\N	\N	\N	Horizonte	Literatura/Obras	\N	\N	1494 paginas	\N	\N	\N	\N	t	\N
1001799	Gastronomia	Aprenda con ADA Y MARICARMEN-EL ARTE DE LA REPOSTERÍA	Ada y Maricarmen	\N	\N	\N	\N	CFP S.A.	Recetas	Español	Libro	321 paginas	Primera Edicion	Lima	1997	\N	t	\N
1002571	\N	Edipo Rey	Sofocles	\N	\N	\N	\N	CARMORI	Literatura/Obras	\N	\N	721 paginas	\N	\N	\N	\N	t	\N
1001807	\N	Arte y cultura preincaicos	Hermann Leich	\N	\N	\N	\N	AGUILAR	Historia	\N	\N	1485 paginas	\N	\N	\N	\N	t	\N
1001808	\N	ASI ES EL PERU, TOMO 4	\N	\N	\N	\N	\N	RIMAC S.A	revista	\N	\N	1484 paginas	\N	\N	\N	\N	t	\N
1001809	Formaciòn humana	Así se pinta al óleo	José M. Parramón	\N	\N	\N	\N	Instituto parramon	Artes	Español	COLECCIÒN	129	Decimosèptima Edicion	Barcelona	1980	\N	t	\N
1001810	Formaciòn humana	así se pinta al pastel	José M. Parramón	\N	\N	\N	\N	Instituto parramon	Artes	Español	COLECCIÒN	123	Octava Ediciòn	Barcelona	1980	\N	t	\N
1001811	\N	Atlántida la leyenda del continente perdido	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	1481 paginas	\N	\N	\N	\N	t	\N
1001812	\N	Atlas de Ediciones Verticales	\N	\N	\N	\N	\N	Verticales (2 libros)	Cultura	\N	\N	1480 paginas	\N	\N	\N	\N	t	\N
1001813	\N	ATLAS DEPARTAMENTAL DEL PERU CUZCO/ APURIMAC	\N	\N	\N	\N	9972-40-258-4, TOMO 1	PEISA S.A.C	ATLAS	\N	\N	1479 paginas	\N	\N	\N	\N	t	\N
1001814	\N	ATLAS DEPARTAMENTAL DEL PERU AMAZONAS- CAJAMARCA	CARLOS GARAYAR	\N	\N	\N	9972-40-268-1	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1478 paginas	\N	\N	\N	\N	t	\N
1001815	\N	ATLAS DEPARTAMENTAL DEL PERU ANCASH- HUANUCO	CARLOS GARAYAR	\N	\N	\N	9972-40-261-4	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1477 paginas	\N	\N	\N	\N	t	\N
1001816	\N	ATLAS DEPARTAMENTAL DEL PERU AREQUIPA- MOQUEGUA	CARLOS GARAYAR	\N	\N	\N	9972-40-259-2	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1476 paginas	\N	\N	\N	\N	t	\N
1001817	\N	ATLAS DEPARTAMENTAL DEL PERU AYACUCHO - ICA	CARLOS GARAYAR	\N	\N	\N	9972-40-265-7	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1475 paginas	\N	\N	\N	\N	t	\N
1001818	\N	ATLAS DEPARTAMENTAL DEL PERU JUNIN- HUANCAVELICA	CARLOS GARAYAR	\N	\N	\N	9972-40-266-5	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1474 paginas	\N	\N	\N	\N	t	\N
1001819	\N	ATLAS DEPARTAMENTAL DEL PERU LIBERTAD DE LANBAYEQUE	CARLOS GARAYAR	\N	\N	\N	9972-40-263-0	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1473 paginas	\N	\N	\N	\N	t	\N
1001820	\N	ATLAS DEPARTAMENTAL DEL PERU LIMA/CALLAO - PASCO	CARLOS GARAYAR	\N	\N	\N	9972-40-266-5	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1472 paginas	\N	\N	\N	\N	t	\N
1001821	\N	ATLAS DEPARTAMENTAL DEL PERU LORETO- SAN MARTIN	CARLOS GARAYAR	\N	\N	\N	9972-40-269-X	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1471 paginas	\N	\N	\N	\N	t	\N
1001822	\N	ATLAS DEPARTAMENTAL DEL PERU MADRE DE DIOS UCAYALI	CARLOS GARAYAR	\N	\N	\N	9972-40-264-9	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1470 paginas	\N	\N	\N	\N	t	\N
1001823	\N	ATLAS DEPARTAMENTAL DEL PERU PIURA TUMBES	CARLOS GARAYAR	\N	\N	\N	9972-40-262-2	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1469 paginas	\N	\N	\N	\N	t	\N
1001824	\N	ATLAS DEPARTAMENTAL DEL PERU PUNO-TACNA	CARLOS GARAYAR	\N	\N	\N	9972-40-260-6	PEISA S.A.C	ENCICLOPEDIA	\N	\N	1468 paginas	\N	\N	\N	\N	t	\N
1001825	\N	ATLAS NATIONAL GEOGRAPHIC europa III	\N	\N	\N	\N	9972-58-182-9	\N	\N	\N	\N	1467 paginas	\N	\N	\N	\N	t	\N
1001826	\N	ATLAS NATIONAL GEOGRAPHIC europa II	\N	\N	\N	\N	9972-58-108-2	RBA coleccionables	\N	\N	\N	1466 paginas	\N	\N	\N	\N	t	\N
1001827	\N	ATLAS NATIONAL GEOGRAPHIC europa I	.	\N	\N	\N	9972-58-179-9	RBA coleccionables	ENCICLOPEDIA	\N	\N	1465 paginas	\N	\N	\N	\N	t	\N
1001828	\N	Aves (pollo, pato, pavo)	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1464 paginas	\N	\N	\N	\N	t	\N
1001829	\N	Aves y Caza	Clare Ferguson	\N	\N	\N	\N	ELFOS	Gastronomia	\N	\N	1463 paginas	\N	\N	\N	\N	t	\N
1001830	\N	Aztecas incas y mayas	\N	\N	\N	\N	\N	COSAR	Historia	\N	\N	1462 paginas	\N	\N	\N	\N	t	\N
1001831	\N	Azul de mar adentro (3)	José Chávez Fernández Postigo	\N	\N	\N	\N	\N	Libro	\N	\N	1461 paginas	\N	\N	\N	\N	t	\N
1001832	\N	BAMKING FOR A BETTER WORLD	\N	\N	\N	\N	\N	\N	LIBRO	\N	\N	1460 paginas	\N	\N	\N	\N	t	\N
1001833	\N	Bebidas calientes y frías	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1459 paginas	\N	\N	\N	\N	t	\N
1001834	\N	Biblioteca escolar 7	\N	\N	\N	\N	\N	CINCO ECSA	\N	\N	\N	1458 paginas	\N	\N	\N	\N	t	\N
1001835	Cristianismo	BIENHECHORA DE ALMAS- SOR ANA DE LOS ANGELES MONTEAGUDO	DANTE E. ZEGARRA LOPEZ	\N	\N	\N	\N	Corporación Kaptiva S.A.C.	Cristianismo	Español	Libro	1457 paginas	Primera	Arequipa	2019	La voz de la obediencia. Un largo viaje. ¡Ave María Purísima!. Una familia para Ana de Monteagudo. Entre un terremoto y otro. Un duro noviciado. L aprofesión. Las dos primeras décadasde vida conventual. Una visita inesperada. Una dedicada Sacristana y. Maestra con el jemplo. Priora de la reforma. Una monje pobre. Ni una palabra ociosa. Una vida orante. Penitente de férrea fe. Practicante de virtudes heroicas. Una entrañable amistad. Leal amistad. Dones sin Par. Retorno al Padre. La despedida. En olor de santidad. Beata, al fin. Unoa por qué finales. Gracias, infinitas gracias. Documenta.	t	\N
1001836	\N	Biografías 1945 (18 tomos)	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	1456 paginas	\N	\N	\N	\N	t	\N
1001837	\N	BOLIVAR 10	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1455 paginas	\N	\N	\N	\N	t	\N
1001838	\N	BOLIVAR 11	LUIS LOPEZ MENDES	\N	\N	\N	\N	EDITORIAL LISBONA	REVISTA	\N	\N	1454 paginas	\N	\N	\N	\N	t	\N
1001839	\N	BOLIVAR 12	\N	\N	\N	\N	\N	EDITORIAL LISBONA	REVISTA	\N	\N	1453 paginas	\N	\N	\N	\N	t	\N
1001840	\N	BOLIVAR 14	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1452 paginas	\N	\N	\N	\N	t	\N
1001841	\N	BOLIVAR 1	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1451 paginas	\N	\N	\N	\N	t	\N
1001842	\N	BOLIVAR 13	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1450 paginas	\N	\N	\N	\N	t	\N
1001843	\N	BOLIVAR 15	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1449 paginas	\N	\N	\N	\N	t	\N
1001844	\N	BOLIVAR 2	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1448 paginas	\N	\N	\N	\N	t	\N
1001845	\N	BOLIVAR 5	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1447 paginas	\N	\N	\N	\N	t	\N
1001846	\N	BOLIVAR 6	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1446 paginas	\N	\N	\N	\N	t	\N
1001847	\N	BOLIVAR 7	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1445 paginas	\N	\N	\N	\N	t	\N
1001848	\N	BOLIVAR 9	JOSE RIVAS RIVAS	\N	\N	\N	\N	EDITORIAL LISBONA	\N	\N	\N	1444 paginas	\N	\N	\N	\N	t	\N
1001849	\N	Brushstroke Primer	DAISY BOOKS	\N	\N	\N	ISBN -0943470-21-8	\N	Artes	\N	\N	1443 paginas	\N	\N	\N	\N	t	\N
1001850	\N	BUFFET Tecnicas Basicas de Cocina	\N	\N	\N	\N	\N	Q.W. Editores S.A.C.	Gastronomia /Revistas	\N	\N	1442 paginas	\N	\N	\N	\N	t	\N
1001851	\N	Buffet-Mesa de quesos Panes y Vinos	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1441 paginas	\N	\N	\N	\N	t	\N
1001852	\N	Caja Municipal de Arequipa (25 años convirtiendo sueños en éxitos)	Muñoz Najar	\N	\N	\N	2012-00916	IMPRESA	Administracion	Español	Libro	 248 paginas 	\N	\N	\N	\N	t	\N
1001853	\N	Caja Municipal de Arequipa	\N	\N	\N	\N	\N	\N	Administracion	\N	\N	1439 paginas	\N	\N	\N	\N	t	\N
1001854	\N	Calendario civico escolar	DRA. HERMILLA F. TORRES OBLITAS	\N	\N	\N	\N	\N	historia	\N	\N	1438 paginas	\N	\N	\N	\N	t	\N
1001855	Gastronomia	CALOR Y SABOR	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-135-1	El Comercio	Gastronomia	\N	\N	1437 paginas	\N	\N	\N	\N	t	\N
1001856	Gastronomia	CALOR Y SABOR "Menús para combatir el Frío"	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Gastronomia	Español	Recetario	86 paginas	Primera Edicion	Lima	2006	\N	t	\N
1001857	\N	Cámara AQP N° 13 -junio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1435 paginas	\N	\N	\N	\N	t	\N
1001858	\N	Cámara AQP N° 20 -diciembre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1434 paginas	\N	\N	\N	\N	t	\N
1001859	\N	Camara AQP N°18-Agosto 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1433 paginas	\N	\N	\N	\N	t	\N
1001860	\N	Camara AQP N°19-octubre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1432 paginas	\N	\N	\N	\N	t	\N
1001861	\N	Camara AQP/Numero 14 septiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1431 paginas	\N	\N	\N	\N	t	\N
1001862	\N	Camara AQP/Numero 15 diciembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1430 paginas	\N	\N	\N	\N	t	\N
1001863	\N	Camara AQP/Numero 16 marzo 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1429 paginas	\N	\N	\N	\N	t	\N
1001864	\N	CÁMARA DE COMERCIO E INDUSTRIA DE AREQUIPA N°24 SEPTIEMBRE 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1428 paginas	\N	\N	\N	\N	t	\N
1001865	\N	CÁMARA DE COMERCIO E INDUSTRIA DE AREQUIPA N°25 DICIEMBRE 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1427 paginas	\N	\N	\N	\N	t	\N
1002691	\N	ESPASA CALPE 11	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	601 paginas	\N	\N	\N	\N	t	\N
1001866	\N	CÁMARA DE COMERCIO E INDUSTRIA DE AREQUIPA N°25 DICIEMBRE 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1426 paginas	\N	\N	\N	\N	t	\N
1001867	\N	Camara de Comercio N°23-Agosto 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1425 paginas	\N	\N	\N	\N	t	\N
1001868	\N	CÁMARAAQP / N°21-MARZO 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1424 paginas	\N	\N	\N	\N	t	\N
1001869	\N	I dolci si fanno cosi	Desensano del garda	\N	\N	\N	\N	\N	Gastronomía	\N	\N	1423 paginas	\N	\N	\N	\N	t	\N
1001870	\N	Canning Freezing & Drying	Sunset	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1422 paginas	\N	\N	\N	\N	t	\N
1001871	\N	CARETAS N°2246 23 DE AGOSTO DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1421 paginas	\N	\N	\N	\N	t	\N
1001872	\N	CARETAS N°2247 29 DE AGOSTO DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1420 paginas	\N	\N	\N	\N	t	\N
1001873	\N	CARETAS N°2610 3 DE OCTUBRE DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1419 paginas	\N	\N	\N	\N	t	\N
1001874	\N	CARETAS N°2611 10 DE OCTUBRE DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1418 paginas	\N	\N	\N	\N	t	\N
1001875	\N	CARETAS N°2612 17 DE OCTUBRE DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1417 paginas	\N	\N	\N	\N	t	\N
1001876	\N	CARETAS N°2614- 31 DE OCTUBRE DEL 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1416 paginas	\N	\N	\N	\N	t	\N
1001877	\N	CARETAS N°2615- 07 DE NOVIEMBRE DEL 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1415 paginas	\N	\N	\N	\N	t	\N
1001878	\N	CARETAS N°2616- 14 DE NOVIEMBRE DEL 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1414 paginas	\N	\N	\N	\N	t	\N
1001879	\N	CARETAS N°2617- 21 DE NOVIEMBRE DEL 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1413 paginas	\N	\N	\N	\N	t	\N
1001880	\N	Caretas Caso Bustios: Extraño Giro\r\nEdicion N° 2457	\N	\N	\N	\N	\N	\N	\N	\N	\N	1412 paginas	\N	\N	\N	\N	t	\N
1001881	\N	Caretas El contrato con Maiman \r\nFecha: 9 de febrero de 2017 N° 2474	\N	\N	\N	\N	\N	\N	\N	\N	\N	1411 paginas	\N	\N	\N	\N	t	\N
1001882	\N	Caretas Imágenes 2016, fecha 30 de diciembre de 2016, N° 2469	\N	\N	\N	\N	\N	\N	\N	\N	\N	1410 paginas	\N	\N	\N	\N	t	\N
1001883	\N	Caretas Las Bamba y los Tombos\r\nEdicion N° 2459	\N	\N	\N	\N	\N	\N	\N	\N	\N	1409 paginas	\N	\N	\N	\N	t	\N
1001884	\N	Caretas N° 2468, 22 diciembre 2016, APRA: El Gran Paneton	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408 paginas	\N	\N	\N	\N	t	\N
1001885	\N	Caretas N° 2435, 5 de mayo 2016, San Martin: Caso Fujimori	\N	\N	\N	\N	\N	\N	\N	\N	\N	1407 paginas	\N	\N	\N	\N	t	\N
1001886	\N	Caretas N° 2439, 2 de junio de 2016 Escenarios de Gobernabilidad	\N	\N	\N	\N	\N	\N	\N	\N	\N	1406 paginas	\N	\N	\N	\N	t	\N
1001887	\N	Caretas N° 2442, 23 de junio de 2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	1405 paginas	\N	\N	\N	\N	t	\N
1001888	\N	Caretas N° 2451, 25 de agosto de 2016, Basombrío: Policías y Escuadrones	\N	\N	\N	\N	\N	\N	\N	\N	\N	1404 paginas	\N	\N	\N	\N	t	\N
1001889	\N	Caretas N° 2458, 13 octubre 2016, El Negocio de la salud pública	\N	\N	\N	\N	\N	\N	\N	\N	\N	1403 paginas	\N	\N	\N	\N	t	\N
1001890	\N	Caretas N° 2460, 27 octubre 2016, Edicion Extraordinaria	\N	\N	\N	\N	\N	\N	\N	\N	\N	1402 paginas	\N	\N	\N	\N	t	\N
1001891	\N	Caretas N° 2461, 3 noviembre 2016, PPK se la juega por Venezuela	\N	\N	\N	\N	\N	\N	\N	\N	\N	1401 paginas	\N	\N	\N	\N	t	\N
1001892	\N	Caretas N° 2462, 10 noviembre 2016, Castañeda en llamas	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400 paginas	\N	\N	\N	\N	t	\N
1001893	\N	Caretas N° 2464, 24 de noviembre 2016, APEC: El nuevo mapa	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399 paginas	\N	\N	\N	\N	t	\N
1001894	\N	Caretas N° 2465, 1 de diciembre 2016, El Ministro que perdio la cabeza	\N	\N	\N	\N	\N	\N	\N	\N	\N	1398 paginas	\N	\N	\N	\N	t	\N
1001895	\N	Caretas N° 2466, 7 diciembre 2016, Huaycan y la mecha de la redes sociales	\N	\N	\N	\N	\N	\N	\N	\N	\N	1397 paginas	\N	\N	\N	\N	t	\N
1001896	\N	Caretas N° 2467, 15 diciembre 2016, Los "Fujitrols": la Barra Brava de Keiko	\N	\N	\N	\N	\N	\N	\N	\N	\N	1396 paginas	\N	\N	\N	\N	t	\N
1001897	\N	Caretas N° 2470, 12 enero 2017, Como se construyo el acuerdo	\N	\N	\N	\N	\N	\N	\N	\N	\N	1395 paginas	\N	\N	\N	\N	t	\N
1001898	\N	Caretas N° 2471, 19 de enero 2017, La sentencia de Morales Bermudez	\N	\N	\N	\N	\N	\N	\N	\N	\N	1394 paginas	\N	\N	\N	\N	t	\N
1001899	\N	Caretas N° 2482 6 de abril El Niño lluvia de millones	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1393 paginas	\N	\N	\N	\N	t	\N
1001900	\N	Caretas N° 2483, del 12 abril\r\nLava Jato: La confesión de Shavit	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1392 paginas	\N	\N	\N	\N	t	\N
1001901	\N	Caretas N° 2484, del 20 abril\r\n¿Grillete para Alberto Fujimori?	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1391 paginas	\N	\N	\N	\N	t	\N
1001902	\N	Caretas N° 2486\r\nChinchero: Aeropuerto canibal	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1390 paginas	\N	\N	\N	\N	t	\N
1001903	\N	Caretas N° 2487\r\nMadre Mia: Chantaje documentado	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1389 paginas	\N	\N	\N	\N	t	\N
1001904	\N	Caretas N° 2488, del 18 de mayo\r\nOdebrecht: El eslabon Favre	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1388 paginas	\N	\N	\N	\N	t	\N
1001905	\N	Caretas N° 2489 25 de mayo Contraloria Alerta Loca	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1387 paginas	\N	\N	\N	\N	t	\N
1001906	\N	Caretas N° 2490\r\nAudios, Auditorias y alarmas	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1386 paginas	\N	\N	\N	\N	t	\N
1001907	\N	Caretas N° 2491\r\nCongreso sin frenos	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1385 paginas	\N	\N	\N	\N	t	\N
1001908	\N	Caretas N° 2492, 15 de junio de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1384 paginas	\N	\N	\N	\N	t	\N
1001909	\N	Caretas N° 2493 del 22 de junio de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1383 paginas	\N	\N	\N	\N	t	\N
1001910	\N	Caretas N° 2494, 28 de junio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1382 paginas	\N	\N	\N	\N	t	\N
1001911	\N	Caretas N° 2495\r\nDiálogo imperativo: Agenda minima	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1381 paginas	\N	\N	\N	\N	t	\N
1001912	\N	Caretas N° 2496, del 13 de julio de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1380 paginas	\N	\N	\N	\N	t	\N
1001913	\N	Caretas N° 2497 del 20 de julio de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1379 paginas	\N	\N	\N	\N	t	\N
1001914	\N	Caretas N° 2498\r\nSUTEP Denuncia a Sendero	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1378 paginas	\N	\N	\N	\N	t	\N
1001915	\N	Caretas N° 2499, del 3 de agosto de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1377 paginas	\N	\N	\N	\N	t	\N
1001916	\N	Caretas N° 2500, del 10 de agosto de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1376 paginas	\N	\N	\N	\N	t	\N
1001917	\N	Caretas N° 2501, del 17 de agosto de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1375 paginas	\N	\N	\N	\N	t	\N
1001918	\N	Caretas N° 2502, del 24 de agosto de 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1374 paginas	\N	\N	\N	\N	t	\N
1001919	\N	Caretas N° 2505 del 14 setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1373 paginas	\N	\N	\N	\N	t	\N
1001920	\N	Caretas N° 2506 del 21 setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1372 paginas	\N	\N	\N	\N	t	\N
1001921	\N	Caretas N° 2507 del 28 setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1371 paginas	\N	\N	\N	\N	t	\N
1001922	\N	Caretas N° 2508 del 5 octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1370 paginas	\N	\N	\N	\N	t	\N
1001923	\N	Caretas N° 2510 del 19 octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1369 paginas	\N	\N	\N	\N	t	\N
1001924	\N	Caretas N° 2511 del 26 octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1368 paginas	\N	\N	\N	\N	t	\N
1001925	\N	Caretas N° 2512 del 2 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1367 paginas	\N	\N	\N	\N	t	\N
1001926	\N	Caretas N° 2512 del 2 noviembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1366 paginas	\N	\N	\N	\N	t	\N
1001927	\N	Caretas N° 2513 del 9 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1365 paginas	\N	\N	\N	\N	t	\N
1001928	\N	Caretas N° 2515 del 23 noviemvre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1364 paginas	\N	\N	\N	\N	t	\N
1001929	\N	Caretas N° 2516 del 30 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1363 paginas	\N	\N	\N	\N	t	\N
1001930	\N	Caretas N° 2517 del 7 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1362 paginas	\N	\N	\N	\N	t	\N
1001931	\N	Caretas N° 2518 del 14 diciembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1361 paginas	\N	\N	\N	\N	t	\N
1001932	\N	Caretas N° 2519 del 20 diciembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1360 paginas	\N	\N	\N	\N	t	\N
1001933	\N	Caretas N° 2520 del 28 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1359 paginas	\N	\N	\N	\N	t	\N
1001934	\N	Caretas N° 2521 del 11 de enero 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1358 paginas	\N	\N	\N	\N	t	\N
1001935	\N	Caretas N° 2522 del 18 de enero 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1357 paginas	\N	\N	\N	\N	t	\N
1001936	\N	Caretas N° 2523 del 25 de enero 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1356 paginas	\N	\N	\N	\N	t	\N
1001937	\N	Caretas N° 2524 del 1 de febrero del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1355 paginas	\N	\N	\N	\N	t	\N
1001938	\N	Caretas N° 2525 del 8 de febrero del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1354 paginas	\N	\N	\N	\N	t	\N
1001939	\N	Caretas N° 2527 del 22 de febrero del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1353 paginas	\N	\N	\N	\N	t	\N
1001940	\N	Caretas N° 2528 del 2 de marzo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1352 paginas	\N	\N	\N	\N	t	\N
1001941	\N	Caretas N° 2530 15 de marzo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1351 paginas	\N	\N	\N	\N	t	\N
1001942	\N	Caretas N° 2531 21 de marzo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1350 paginas	\N	\N	\N	\N	t	\N
1001943	\N	Caretas N° 2534 12 de abril del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1349 paginas	\N	\N	\N	\N	t	\N
1001944	\N	Caretas N° 2535 del 19 de abril del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1348 paginas	\N	\N	\N	\N	t	\N
1001945	\N	Caretas N° 2536 del 26 de abril del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1347 paginas	\N	\N	\N	\N	t	\N
1001946	\N	Caretas N° 2537 del 3 de mayo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1346 paginas	\N	\N	\N	\N	t	\N
1001947	\N	Caretas N° 2538 del 10 de mayo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1345 paginas	\N	\N	\N	\N	t	\N
1001948	\N	Caretas N° 2539 17 de marzo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1344 paginas	\N	\N	\N	\N	t	\N
1001949	\N	Caretas N° 2539 17 de mayo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1343 paginas	\N	\N	\N	\N	t	\N
1001950	\N	Caretas N° 2539 21 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1342 paginas	\N	\N	\N	\N	t	\N
1001951	\N	Caretas N° 2539 24 de mayo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1341 paginas	\N	\N	\N	\N	t	\N
1001952	\N	Caretas N° 2539 28 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1340 paginas	\N	\N	\N	\N	t	\N
1001953	\N	Caretas N° 2541 del 31 de mayo del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1339 paginas	\N	\N	\N	\N	t	\N
1001954	\N	Caretas N° 2542 del 07 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1338 paginas	\N	\N	\N	\N	t	\N
1001955	\N	Caretas N° 2542 del 07 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1337 paginas	\N	\N	\N	\N	t	\N
1001956	\N	Caretas N° 2543 del 14 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1336 paginas	\N	\N	\N	\N	t	\N
1001957	\N	Caretas N° 2544 del 21 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1335 paginas	\N	\N	\N	\N	t	\N
1001958	\N	Caretas N° 2545 del 28 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1334 paginas	\N	\N	\N	\N	t	\N
1001959	\N	Caretas N° 2546 del 05 de julio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1333 paginas	\N	\N	\N	\N	t	\N
1001960	\N	Caretas N° 2547 del 12 de julio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1332 paginas	\N	\N	\N	\N	t	\N
1001961	\N	Caretas N° 2549 del 26 de julio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1331 paginas	\N	\N	\N	\N	t	\N
1001962	\N	Caretas N° 2550 del 02 de agosto del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1330 paginas	\N	\N	\N	\N	t	\N
1001963	\N	Caretas N° 2551 del 09 de agosto del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1329 paginas	\N	\N	\N	\N	t	\N
1001964	\N	Caretas N° 2552 del 16 de agosto del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1328 paginas	\N	\N	\N	\N	t	\N
1001965	\N	Caretas N° 2553 del 23 de agosto del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1327 paginas	\N	\N	\N	\N	t	\N
1001966	\N	Caretas N° 2554, 29 de agosto del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1326 paginas	\N	\N	\N	\N	t	\N
1001967	\N	Caretas N° 2555 jueves 06 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1325 paginas	\N	\N	\N	\N	t	\N
1001968	\N	Caretas N° 2556 del 13 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1324 paginas	\N	\N	\N	\N	t	\N
1001969	\N	Caretas N° 2556 del 13 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1323 paginas	\N	\N	\N	\N	t	\N
1001970	\N	Caretas N° 2559 del 04 de octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1322 paginas	\N	\N	\N	\N	t	\N
1001971	\N	Caretas N° 2560 del 11 de octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1321 paginas	\N	\N	\N	\N	t	\N
1001972	\N	Caretas N° 2561 del 18 de octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1320 paginas	\N	\N	\N	\N	t	\N
1001973	\N	Caretas N° 2562 del 25 de octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1319 paginas	\N	\N	\N	\N	t	\N
1001974	\N	Caretas N° 2563 del 31 de octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1318 paginas	\N	\N	\N	\N	t	\N
1001975	\N	Caretas N° 2564 del 08 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1317 paginas	\N	\N	\N	\N	t	\N
1001976	\N	Caretas N° 2565 del 15 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1316 paginas	\N	\N	\N	\N	t	\N
1001977	\N	Caretas N° 2566 del 22 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1315 paginas	\N	\N	\N	\N	t	\N
1001978	\N	Caretas N° 2567 del 29 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1314 paginas	\N	\N	\N	\N	t	\N
1001979	\N	Caretas N° 2568 del 06 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1313 paginas	\N	\N	\N	\N	t	\N
1001980	\N	Caretas N° 2569 del 13 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1312 paginas	\N	\N	\N	\N	t	\N
1001981	\N	Caretas N° 2570 del 20 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1311 paginas	\N	\N	\N	\N	t	\N
1001982	\N	Caretas N° 2571 del 28 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1310 paginas	\N	\N	\N	\N	t	\N
1001983	\N	Caretas N° 2572 del 10 de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1309 paginas	\N	\N	\N	\N	t	\N
1001984	\N	Caretas N° 2573 del 17 de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1308 paginas	\N	\N	\N	\N	t	\N
1001985	\N	Caretas N° 2573 del 17 de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1307 paginas	\N	\N	\N	\N	t	\N
1001986	\N	Caretas N° 2574 del 24 de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1306 paginas	\N	\N	\N	\N	t	\N
1001987	\N	Caretas N° 2576 jueves 07 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1305 paginas	\N	\N	\N	\N	t	\N
1001988	\N	Caretas N° 2577 jueves 14 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1304 paginas	\N	\N	\N	\N	t	\N
1001989	\N	Caretas N° 2585, jueves 11 de abril del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1303 paginas	\N	\N	\N	\N	t	\N
1001990	\N	Caretas N° 2586, viernes 17 de abril del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1302 paginas	\N	\N	\N	\N	t	\N
1001991	\N	Caretas N° 2588, viernes 03 de mayo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1301 paginas	\N	\N	\N	\N	t	\N
1001992	\N	Caretas N° 2589, jueve 09 de mayo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1300 paginas	\N	\N	\N	\N	t	\N
1001993	\N	Caretas N° 2590, jueves 16 de mayo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1299 paginas	\N	\N	\N	\N	t	\N
1001994	\N	Caretas N° 2591, jueves 23 de mayo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1298 paginas	\N	\N	\N	\N	t	\N
1001995	\N	Caretas N° 2592, jueves 30 de mayo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1297 paginas	\N	\N	\N	\N	t	\N
1001996	\N	Caretas N° 2593, jueves 06 de junio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1296 paginas	\N	\N	\N	\N	t	\N
1001997	\N	Caretas N° 2594, 13 de junio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1295 paginas	\N	\N	\N	\N	t	\N
1001998	\N	Caretas N° 2595, 20 de junio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1294 paginas	\N	\N	\N	\N	t	\N
1001999	\N	Caretas N° 2596, 27 de junio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1293 paginas	\N	\N	\N	\N	t	\N
1002000	\N	Caretas N° 2597, 04 de julio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1292 paginas	\N	\N	\N	\N	t	\N
1002001	\N	Caretas N° 2598, 11 de julio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1291 paginas	\N	\N	\N	\N	t	\N
1002002	\N	Caretas N° 2599, 18 de julio del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1290 paginas	\N	\N	\N	\N	t	\N
1002003	\N	Caretas N° 2601, 01 de agosto del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1289 paginas	\N	\N	\N	\N	t	\N
1002004	\N	Caretas N° 2604, 22 de agosto del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1288 paginas	\N	\N	\N	\N	t	\N
1002005	\N	Caretas N° 2605, 29 de agosto del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1287 paginas	\N	\N	\N	\N	t	\N
1002006	\N	Caretas N° 2606, 05 de septiembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1286 paginas	\N	\N	\N	\N	t	\N
1002007	\N	Caretas N° 2606, 15 de agosto del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1285 paginas	\N	\N	\N	\N	t	\N
1002008	\N	Caretas N° 2607, 12 de septiembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1284 paginas	\N	\N	\N	\N	t	\N
1002009	\N	Caretas N° 2608, 19 de septiembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1283 paginas	\N	\N	\N	\N	t	\N
1002010	\N	Caretas N° 2609, 26 de septiembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1282 paginas	\N	\N	\N	\N	t	\N
1002011	\N	Caretas N° 2620, 12 de diciembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1281 paginas	\N	\N	\N	\N	t	\N
1002012	\N	Caretas N° 2621, 19 de diciembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1280 paginas	\N	\N	\N	\N	t	\N
1002013	\N	Caretas N° 2622, 27 de diciembre del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1279 paginas	\N	\N	\N	\N	t	\N
1002014	\N	Caretas N° 2623, 09 de enero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1278 paginas	\N	\N	\N	\N	t	\N
1002015	\N	Caretas N° 2624, 16 de enero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1277 paginas	\N	\N	\N	\N	t	\N
1002016	\N	Caretas N° 2625, 23 de enero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1276 paginas	\N	\N	\N	\N	t	\N
1002017	\N	Caretas N° 2626, 30 de enero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1275 paginas	\N	\N	\N	\N	t	\N
1002018	\N	Caretas N° 2627, 06 de febrero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1274 paginas	\N	\N	\N	\N	t	\N
1002019	\N	Caretas N° 2628, 13 de febrero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1273 paginas	\N	\N	\N	\N	t	\N
1002020	\N	Caretas N° 2629, 20 de febrero del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1272 paginas	\N	\N	\N	\N	t	\N
1002021	\N	Caretas N° 2641, 4 de setiembre del 2020	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1271 paginas	\N	\N	\N	\N	t	\N
1002022	\N	Caretas N° 2656, 18 de noviembre de 2021	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1270 paginas	\N	\N	\N	\N	t	\N
1002023	\N	Caretas N° 2659, 24 de febrero del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1269 paginas	\N	\N	\N	\N	t	\N
1002024	\N	Caretas N° 2661, 28 de abril del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1268 paginas	\N	\N	\N	\N	t	\N
1002025	\N	Caretas N° 2662, 26 de mayo del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1267 paginas	\N	\N	\N	\N	t	\N
1002026	\N	Caretas N° 2663, 23 de junio del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1266 paginas	\N	\N	\N	\N	t	\N
1002027	\N	Caretas N° 2664, 21 de julio del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1265 paginas	\N	\N	\N	\N	t	\N
1002028	\N	Caretas N° 2665, 25 de agosto del 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1264 paginas	\N	\N	\N	\N	t	\N
1002029	\N	Caretas N° 2667, 29 de septiembre del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1263 paginas	\N	\N	\N	\N	t	\N
1002030	\N	Caretas N° 2668, 13 de Octubre del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1262 paginas	\N	\N	\N	\N	t	\N
1002031	\N	Caretas N° 2669, 27 de Octubre del 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1261 paginas	\N	\N	\N	\N	t	\N
1002032	\N	Caretas N° 2672, 29 de Diciembre de 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1260 paginas	\N	\N	\N	\N	t	\N
1002033	\N	Caretas N° 2673, 15 de diciembre de 2022	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1259 paginas	\N	\N	\N	\N	t	\N
1002034	\N	Caretas N° 2673, 19 de enero de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1258 paginas	\N	\N	\N	\N	t	\N
1002035	\N	Caretas N° 2674, 02 de febrero de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1257 paginas	\N	\N	\N	\N	t	\N
1002036	\N	Caretas N° 2675, 16 de febrero del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1256 paginas	\N	\N	\N	\N	t	\N
1002037	\N	Caretas N° 2676, 09 de marzo de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1255 paginas	\N	\N	\N	\N	t	\N
1002038	\N	Caretas N° 2677, 23 de marzo del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1254 paginas	\N	\N	\N	\N	t	\N
1002039	\N	Caretas N° 2680, 18 de mayo del 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1253 paginas	\N	\N	\N	\N	t	\N
1002040	\N	Caretas N° 2682, 22 de Junio de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1252 paginas	\N	\N	\N	\N	t	\N
1002041	\N	Caretas N° 2683, 6 de Julio de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1251 paginas	\N	\N	\N	\N	t	\N
1002042	\N	Caretas N° 2684, 27 de Julio de 2023	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1250 paginas	\N	\N	\N	\N	t	\N
1002043	\N	Caretas N° 2687, 21 de setiembre del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1249 paginas	\N	\N	\N	\N	t	\N
1002044	\N	Caretas N° 2688, 12 de octubre del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1248 paginas	\N	\N	\N	\N	t	\N
1002045	\N	Caretas N° 2689, 26 de octubre del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1247 paginas	\N	\N	\N	\N	t	\N
1002046	\N	Caretas N° 2690, 15 de noviembre del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1246 paginas	\N	\N	\N	\N	t	\N
1002047	\N	Caretas N° 2693, 28 de diciembre de 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1245 paginas	\N	\N	\N	\N	t	\N
1002048	\N	Caretas N° 2694, 18 de enero de 2024	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1244 paginas	\N	\N	\N	\N	t	\N
1002049	\N	Caretas N° 2695, 01 de febrero de 2024	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1243 paginas	\N	\N	\N	\N	t	\N
1002050	\N	Caretas N°2514 del 16 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1242 paginas	\N	\N	\N	\N	t	\N
1002051	\N	Caretas N°2575 jueves 31de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1241 paginas	\N	\N	\N	\N	t	\N
1002052	\N	CARETAS N°2613 24 DE OCTUBRE DEL 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	1240 paginas	\N	\N	\N	\N	t	\N
1002053	\N	Caretas N°2651, 1 de julio del 2021	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1239 paginas	\N	\N	\N	\N	t	\N
1002054	\N	Caretas N°2691, 30 de noviembre del 2023	\N	\N	\N	\N	\N	CARETAS	REVISTA	\N	\N	1238 paginas	\N	\N	\N	\N	t	\N
1002055	\N	Caretas Seccion Publicitaria especial	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1237 paginas	\N	\N	\N	\N	t	\N
1002056	\N	Caretas Suplemento Publicitario especial, Carreras con valor agregado	\N	\N	\N	\N	\N	\N	\N	\N	\N	1236 paginas	\N	\N	\N	\N	t	\N
1002057	\N	Caretas Trump: Vientos de Crisis	\N	\N	\N	\N	\N	\N	\N	\N	\N	1235 paginas	\N	\N	\N	\N	t	\N
1002058	\N	Carnes	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1234 paginas	\N	\N	\N	\N	t	\N
1002059	\N	Carrousel	Cecilia Morana	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1233 paginas	\N	\N	\N	\N	t	\N
1002060	\N	CARTA BLANCA	ANONIMO	\N	\N	\N	\N	Carta Blanca Ediciones S.A.	Gastronomia /Revistas	ESPAÑOL	-	63 paginas	-	Lima	\N	\N	t	\N
1002061	\N	Catesismo Menor	\N	\N	\N	\N	\N	ARZOBISPADO DE LIMA	Cristianismo	\N	\N	1231 paginas	\N	\N	\N	\N	t	\N
1002062	\N	CENA NAVIDEÑA	Victor Herrera Latorre	\N	\N	\N	\N	\N	Gastronomia /Folleto	\N	\N	1230 paginas	\N	\N	\N	\N	t	\N
1002063	\N	CENA NAVIDEÑA	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1229 paginas	\N	\N	\N	\N	t	\N
1002064	\N	CENTENARIO (2 LIBROS)	CARLOTA CASALINO SEN	\N	\N	\N	\N	\N	Libro	\N	\N	1228 paginas	\N	\N	\N	\N	t	\N
1002065	\N	Cesar Calvo	CARETAS	\N	\N	\N	\N	\N	Libro	\N	\N	1227 paginas	\N	\N	\N	\N	t	\N
1002066	\N	CHICHA PERUANA, una bebida, una cultura.	Rafo León	\N	\N	\N	\N	UNIVERSIDAD DE SAN MARTÍN DE PORRES	Libro	ESPAÑOL	\N	237 páginas	\N	Lima	2008	\N	t	\N
1002067	\N	Ciencia ilustrada T9	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	1225 paginas	\N	\N	\N	\N	t	\N
1002068	\N	Classic Home Cooking	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1224 paginas	\N	\N	\N	\N	t	\N
1002069	\N	Clay and Glazes forr the Potter	Daniel Rhodes	\N	\N	\N	ISBN 0-8019-5633-1	\N	Artes	\N	\N	1223 paginas	\N	\N	\N	\N	t	\N
1002070	\N	Clay Mayic Textbook	Anne Amiot	\N	\N	\N	\N	\N	Artes	\N	\N	1222 paginas	\N	\N	\N	\N	t	\N
1002071	\N	Cloisonné	Felicia Liban - Louise Mitchell	\N	\N	\N	\N	\N	Artes	\N	\N	1221 paginas	\N	\N	\N	\N	t	\N
1002072	\N	Coca	\N	\N	\N	\N	\N	ILLAPA	Revistas	\N	\N	1220 paginas	\N	\N	\N	\N	t	\N
1002073	\N	COCINA BÁSICA	COMERCIO	\N	\N	\N	\N	EL COMERCIO	Revista	\N	\N	1219 paginas	\N	\N	\N	\N	t	\N
1002074	\N	Cocina Basica y Alta cocina	\N	\N	\N	\N	\N	Libros Peruanos S.A.	Gastronomia	\N	\N	1218 paginas	\N	\N	\N	\N	t	\N
1002075	\N	Cocina de Gastón Acurio 3	Gastón Acurio	\N	\N	\N	\N	EL COMERCIO	Gastronomia	\N	\N	1217 paginas	\N	\N	\N	\N	t	\N
1002076	\N	Cocina de Gastón Acurio 9	Gastón Acurio	\N	\N	\N	\N	EL COMERCIO	Gastronomia	\N	\N	1216 paginas	\N	\N	\N	\N	t	\N
1002077	\N	COCINA DE VERANO "Platos fríos sándwiches, parrillas, postres y bebidas"	Director Bernardo Roca Rey Miró Quesada	\N	\N	\N	\N	\N	Libro	\N	\N	1215 paginas	\N	\N	\N	\N	t	\N
1002078	\N	Cocina Facil en microondas	Susan Ross	\N	\N	\N	\N	Editorial Libra S.A.	Gastronomia	\N	\N	1214 paginas	\N	\N	\N	\N	t	\N
1002079	\N	Cocina Italiana	\N	\N	\N	\N	\N	EDIMAT	Gastronomia	\N	\N	1213 paginas	\N	\N	\N	\N	t	\N
1002080	\N	Cocina Magica	\N	\N	\N	\N	\N	El Comercio	Gastronomia	\N	\N	1212 paginas	\N	\N	\N	\N	t	\N
1002081	\N	Cocina mágica	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1211 paginas	\N	\N	\N	\N	t	\N
1002082	\N	COCINA MÁGICA, con lo que tengas, en el tiempo que tengas.	El Comercio	\N	\N	\N	\N	\N	Libro	\N	\N	1210 paginas	\N	\N	\N	\N	t	\N
1002083	\N	Cocina paso a paso	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1209 paginas	\N	\N	\N	\N	t	\N
1002084	\N	Cocina Peruana de la A a la Z	Angélica Sasaki	\N	\N	\N	\N	Q.W. Editores S.A.C.	Gastronomia /Revistas	ESPAÑOL	Revista	45 páginas	-	Lima	2009	\N	t	\N
1002085	\N	Cocina saludable con Sandra Plevisani-Un batido para cada ocasión	Sandra Plevisani	\N	\N	\N	\N	\N	Libro	\N	\N	1207 paginas	\N	\N	\N	\N	t	\N
1002086	\N	Cocinamos para mamá	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1206 paginas	\N	\N	\N	\N	t	\N
1002087	\N	Cocinando: Comida rápida	ER	\N	\N	\N	\N	Empresa Editora Ribal	Gastronomia	\N	\N	1205 paginas	\N	\N	\N	\N	t	\N
1002088	\N	Cocinando: Parrilladas	ER	\N	\N	\N	\N	Empresa Editora Ribal	Gastronomia	\N	\N	1204 paginas	\N	\N	\N	\N	t	\N
1002089	\N	Cucinare con il wok Verdure	\N	\N	\N	\N	\N	\N	Gastronomía	\N	\N	1203 paginas	\N	\N	\N	\N	t	\N
1002090	\N	COLECCIÓN DE COCINA-2000-2001	Santa Isabel	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1202 paginas	\N	\N	\N	\N	t	\N
1002091	\N	COLECCIÓN DE COCINA-2000-2001	Santa Isabel	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1201 paginas	\N	\N	\N	\N	t	\N
1002092	\N	Colección sabor en su punto 1	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1200 paginas	\N	\N	\N	\N	t	\N
1002093	\N	Colección sabor en su punto 10	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1199 paginas	\N	\N	\N	\N	t	\N
1002094	\N	Colección sabor en su punto 11	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1198 paginas	\N	\N	\N	\N	t	\N
1002095	\N	Colección sabor en su punto 12	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1197 paginas	\N	\N	\N	\N	t	\N
1002096	\N	Colección sabor en su punto 13	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1196 paginas	\N	\N	\N	\N	t	\N
1002097	\N	Colección sabor en su punto 2	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1195 paginas	\N	\N	\N	\N	t	\N
1002098	\N	Colección sabor en su punto 3	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1194 paginas	\N	\N	\N	\N	t	\N
1002099	\N	Colección sabor en su punto 4	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1193 paginas	\N	\N	\N	\N	t	\N
1002100	\N	Colección sabor en su punto 5	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1192 paginas	\N	\N	\N	\N	t	\N
1002101	\N	Colección sabor en su punto 6	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1191 paginas	\N	\N	\N	\N	t	\N
1002102	\N	Colección sabor en su punto 7	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1190 paginas	\N	\N	\N	\N	t	\N
1002103	\N	Colección sabor en su punto 8	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1189 paginas	\N	\N	\N	\N	t	\N
1002104	\N	Colección sabor en su punto 9	Metro	\N	\N	\N	\N	UNIMUNDO	Gastronomía	\N	\N	1188 paginas	\N	\N	\N	\N	t	\N
1002105	\N	COMIDA CAERA	El Comercio	\N	\N	\N	\N	\N	Gastronomia /Folleto	\N	\N	1187 paginas	\N	\N	\N	\N	t	\N
1002106	\N	Comida casera	Teresa Campo - El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1186 paginas	\N	\N	\N	\N	t	\N
1002107	\N	COMIDA CASERA	\N	\N	\N	\N	\N	Entradas Segundos Postres, Recetas de Teresa Ocampo.	\N	\N	\N	1185 paginas	\N	\N	\N	\N	t	\N
1002108	\N	Comida Casera "Mil maneras de armar un Menú"	\N	\N	\N	\N	\N	\N	Libro	\N	\N	1184 paginas	\N	\N	\N	\N	t	\N
1002109	\N	Comida casera: Mil maneras de armar un menú	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1183 paginas	\N	\N	\N	\N	t	\N
1002110	\N	Comidas y dulces limeños	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	1182 paginas	\N	\N	\N	\N	t	\N
1002111	\N	CONDORITO COLECCIÓN 1	Televisa/Chile	\N	\N	\N	5	\N	Entretenimiento/Revista	\N	\N	1181 paginas	\N	\N	\N	\N	t	\N
1002112	\N	CONDORITO COLECCIÓN 10	Televisa/Chile	\N	\N	\N	680	\N	Entretenimiento/Revista	\N	\N	1180 paginas	\N	\N	\N	\N	t	\N
1002113	\N	CONDORITO COLECCIÓN 11	Televisa/Chile	\N	\N	\N	681	\N	Entretenimiento/Revista	\N	\N	1179 paginas	\N	\N	\N	\N	t	\N
1002114	\N	CONDORITO COLECCIÓN 12	Televisa/Chile	\N	\N	\N	682	\N	Entretenimiento/Revista	\N	\N	1178 paginas	\N	\N	\N	\N	t	\N
1002115	\N	CONDORITO COLECCIÓN 13	Televisa/Chile	\N	\N	\N	683	\N	Entretenimiento/Revista	\N	\N	1177 paginas	\N	\N	\N	\N	t	\N
1002116	\N	CONDORITO COLECCIÓN 14	Televisa/Chile	\N	\N	\N	685	\N	Entretenimiento/Revista	\N	\N	1176 paginas	\N	\N	\N	\N	t	\N
1002117	\N	CONDORITO COLECCIÓN 15	Televisa/Chile	\N	\N	\N	686	\N	Entretenimiento/Revista	\N	\N	1175 paginas	\N	\N	\N	\N	t	\N
1002118	\N	CONDORITO COLECCIÓN 16	Televisa/Chile	\N	\N	\N	687	\N	Entretenimiento/Revista	\N	\N	1174 paginas	\N	\N	\N	\N	t	\N
1002119	\N	CONDORITO COLECCIÓN 17	Televisa/Chile	\N	\N	\N	693	\N	Entretenimiento/Revista	\N	\N	1173 paginas	\N	\N	\N	\N	t	\N
1002120	\N	CONDORITO COLECCIÓN 18	Televisa/Chile	\N	\N	\N	698	\N	Entretenimiento/Revista	\N	\N	1172 paginas	\N	\N	\N	\N	t	\N
1002121	\N	CONDORITO COLECCIÓN 19	Televisa/Chile	\N	\N	\N	703	\N	Entretenimiento/Revista	\N	\N	1171 paginas	\N	\N	\N	\N	t	\N
1002122	\N	CONDORITO COLECCIÓN 2	Televisa/Chile	\N	\N	\N	637	\N	Entretenimiento/Revista	\N	\N	1170 paginas	\N	\N	\N	\N	t	\N
1002123	\N	CONDORITO COLECCIÓN 20	Televisa/Chile	\N	\N	\N	704	\N	Entretenimiento/Revista	\N	\N	1169 paginas	\N	\N	\N	\N	t	\N
1002124	\N	CONDORITO COLECCIÓN 21	Televisa/Chile	\N	\N	\N	709	\N	Entretenimiento/Revista	\N	\N	1168 paginas	\N	\N	\N	\N	t	\N
1002125	\N	CONDORITO COLECCIÓN 22	Televisa/Chile	\N	\N	\N	710	\N	Entretenimiento/Revista	\N	\N	1167 paginas	\N	\N	\N	\N	t	\N
1002126	\N	CONDORITO COLECCIÓN 2-2012	Televisa/Chile	\N	\N	\N	1202	\N	Entretenimiento/Revista	\N	\N	1166 paginas	\N	\N	\N	\N	t	\N
1002127	\N	CONDORITO COLECCIÓN 23	Televisa/Chile	\N	\N	\N	714	\N	Entretenimiento/Revista	\N	\N	1165 paginas	\N	\N	\N	\N	t	\N
1002128	\N	CONDORITO COLECCIÓN 24	Televisa/Chile	\N	\N	\N	715	\N	Entretenimiento/Revista	\N	\N	1164 paginas	\N	\N	\N	\N	t	\N
1002129	\N	CONDORITO COLECCIÓN 25	Televisa/Chile	\N	\N	\N	716	\N	Entretenimiento/Revista	\N	\N	1163 paginas	\N	\N	\N	\N	t	\N
1002130	\N	CONDORITO COLECCIÓN 26	Televisa/Chile	\N	\N	\N	717	\N	Entretenimiento/Revista	\N	\N	1162 paginas	\N	\N	\N	\N	t	\N
1002131	\N	CONDORITO COLECCIÓN 27	Televisa/Chile	\N	\N	\N	718	\N	Entretenimiento/Revista	\N	\N	1161 paginas	\N	\N	\N	\N	t	\N
1002132	\N	CONDORITO COLECCIÓN 28	Televisa/Chile	\N	\N	\N	724	\N	Entretenimiento/Revista	\N	\N	1160 paginas	\N	\N	\N	\N	t	\N
1002133	\N	CONDORITO COLECCIÓN 29	Televisa/Chile	\N	\N	\N	725	\N	Entretenimiento/Revista	\N	\N	1159 paginas	\N	\N	\N	\N	t	\N
1002134	\N	CONDORITO COLECCIÓN 3	Televisa/Chile	\N	\N	\N	673	\N	Entretenimiento/Revista	\N	\N	1158 paginas	\N	\N	\N	\N	t	\N
1002135	\N	CONDORITO COLECCIÓN 30	Televisa/Chile	\N	\N	\N	726	\N	Entretenimiento/Revista	\N	\N	1157 paginas	\N	\N	\N	\N	t	\N
1002136	\N	CONDORITO COLECCIÓN 31	Televisa/Chile	\N	\N	\N	727	\N	Entretenimiento/Revista	\N	\N	1156 paginas	\N	\N	\N	\N	t	\N
1002137	\N	CONDORITO COLECCIÓN 32	Televisa/Chile	\N	\N	\N	728	\N	Entretenimiento/Revista	\N	\N	1155 paginas	\N	\N	\N	\N	t	\N
1002138	\N	CONDORITO COLECCIÓN 3-2012	Televisa/Chile	\N	\N	\N	1203	\N	Entretenimiento/Revista	\N	\N	1154 paginas	\N	\N	\N	\N	t	\N
1002139	\N	CONDORITO COLECCIÓN 3-2014	Televisa/Chile	\N	\N	\N	1403	\N	Entretenimiento/Revista	\N	\N	1153 paginas	\N	\N	\N	\N	t	\N
1002140	\N	CONDORITO COLECCIÓN 33	Televisa/Chile	\N	\N	\N	730	\N	Entretenimiento/Revista	\N	\N	1152 paginas	\N	\N	\N	\N	t	\N
1002141	\N	CONDORITO COLECCIÓN 34	Televisa/Chile	\N	\N	\N	733	\N	Entretenimiento/Revista	\N	\N	1151 paginas	\N	\N	\N	\N	t	\N
1002142	\N	CONDORITO COLECCIÓN 35	Televisa/Chile	\N	\N	\N	734	\N	Entretenimiento/Revista	\N	\N	1150 paginas	\N	\N	\N	\N	t	\N
1002143	\N	CONDORITO COLECCIÓN 36	Televisa/Chile	\N	\N	\N	735	\N	Entretenimiento/Revista	\N	\N	1149 paginas	\N	\N	\N	\N	t	\N
1002144	\N	CONDORITO COLECCIÓN 37	Televisa/Chile	\N	\N	\N	736	\N	Entretenimiento/Revista	\N	\N	1148 paginas	\N	\N	\N	\N	t	\N
1002145	\N	CONDORITO COLECCIÓN 38	Televisa/Chile	\N	\N	\N	744	\N	Entretenimiento/Revista	\N	\N	1147 paginas	\N	\N	\N	\N	t	\N
1002146	\N	CONDORITO COLECCIÓN 39	Televisa/Chile	\N	\N	\N	745	\N	Entretenimiento/Revista	\N	\N	1146 paginas	\N	\N	\N	\N	t	\N
1002147	\N	CONDORITO COLECCIÓN 4	Televisa/Chile	\N	\N	\N	674	\N	Entretenimiento/Revista	\N	\N	1145 paginas	\N	\N	\N	\N	t	\N
1002148	\N	CONDORITO COLECCIÓN 40	Televisa/Chile	\N	\N	\N	746	\N	Entretenimiento/Revista	\N	\N	1144 paginas	\N	\N	\N	\N	t	\N
1002149	\N	CONDORITO COLECCIÓN 41	Televisa/Chile	\N	\N	\N	767	\N	Entretenimiento/Revista	\N	\N	1143 paginas	\N	\N	\N	\N	t	\N
1002150	\N	CONDORITO COLECCIÓN 4-2012	Televisa/Chile	\N	\N	\N	1204	\N	Entretenimiento/Revista	\N	\N	1142 paginas	\N	\N	\N	\N	t	\N
1002151	\N	CONDORITO COLECCIÓN 4-2013	Televisa/Chile	\N	\N	\N	1304	\N	Entretenimiento/Revista	\N	\N	1141 paginas	\N	\N	\N	\N	t	\N
1002152	\N	CONDORITO COLECCIÓN 5	Televisa/Chile	\N	\N	\N	675	\N	Entretenimiento/Revista	\N	\N	1140 paginas	\N	\N	\N	\N	t	\N
1002153	\N	CONDORITO COLECCIÓN 6	Televisa/Chile	\N	\N	\N	676	\N	Entretenimiento/Revista	\N	\N	1139 paginas	\N	\N	\N	\N	t	\N
1002154	\N	CONDORITO COLECCIÓN 6-2012	Televisa/Chile	\N	\N	\N	1206	\N	Entretenimiento/Revista	\N	\N	1138 paginas	\N	\N	\N	\N	t	\N
1002155	\N	CONDORITO COLECCIÓN 7	Televisa/Chile	\N	\N	\N	677	\N	Entretenimiento/Revista	\N	\N	1137 paginas	\N	\N	\N	\N	t	\N
1002156	\N	CONDORITO COLECCIÓN 8	Televisa/Chile	\N	\N	\N	678	\N	Entretenimiento/Revista	\N	\N	1136 paginas	\N	\N	\N	\N	t	\N
1002157	\N	CONDORITO COLECCIÓN 9	Televisa/Chile	\N	\N	\N	679	\N	Entretenimiento/Revista	\N	\N	1135 paginas	\N	\N	\N	\N	t	\N
1002158	\N	CONDORITO CONE	Televisa/Chile	\N	\N	\N	807	\N	Entretenimiento/Revista	\N	\N	1134 paginas	\N	\N	\N	\N	t	\N
1002159	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	235	\N	Entretenimiento/Revista	\N	\N	1133 paginas	\N	\N	\N	\N	t	\N
1002160	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	244	\N	Entretenimiento/Revista	\N	\N	1132 paginas	\N	\N	\N	\N	t	\N
1002161	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	237	\N	Entretenimiento/Revista	\N	\N	1131 paginas	\N	\N	\N	\N	t	\N
1002162	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	245	\N	Entretenimiento/Revista	\N	\N	1130 paginas	\N	\N	\N	\N	t	\N
1002163	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	229	\N	Entretenimiento/Revista	\N	\N	1129 paginas	\N	\N	\N	\N	t	\N
1002164	\N	CONDORITO ORO	Televisa/Chile	\N	\N	\N	246	\N	Entretenimiento/Revista	\N	\N	1128 paginas	\N	\N	\N	\N	t	\N
1002165	\N	Conservare Fruta e Verdura	Silvana Franconeri	\N	\N	\N	\N	GIUNTI	Gastronomia	\N	\N	1127 paginas	\N	\N	\N	\N	t	\N
1002166	\N	Conserve di verdura	Valentina Beggio	\N	\N	\N	\N	\N	\N	\N	\N	1126 paginas	\N	\N	\N	\N	t	\N
1002167	\N	Construccione Industria	Revista de la Camara Peruana de la construccion	\N	\N	\N	\N	\N	Revista	\N	\N	1125 paginas	\N	\N	\N	\N	t	\N
1002168	\N	CONSTRUYENDO ALTERNATIVA, INNOVACION EN LA MINERIA PERUANA	\N	\N	\N	\N	\N	PARQUE INDUSTRIAL 20 AÑOS	REVISTA	\N	\N	1124 paginas	\N	\N	\N	\N	t	\N
1002169	\N	Corte de cabello, CETPRO MUNICIPAL AREQUIPA	\N	\N	\N	\N	\N	\N	\N	\N	\N	1123 paginas	\N	\N	\N	\N	t	\N
1002170	\N	Creative Casting	Sharr Choate	\N	\N	\N	\N	\N	Artes	\N	\N	1122 paginas	\N	\N	\N	\N	t	\N
1002171	\N	Crepes dolci e salate	\N	\N	\N	\N	\N	DEL DUCA EDITORI S.R.L	Gastronomía	\N	\N	1121 paginas	\N	\N	\N	\N	t	\N
1002172	\N	Cucina no problem	Giovanna Camozzi	\N	\N	\N	\N	\N	Gastronomía	\N	\N	1120 paginas	\N	\N	\N	\N	t	\N
1002173	\N	CURSO DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-121-1	\N	Gastronomia	\N	\N	1119 paginas	\N	\N	\N	\N	t	\N
1002174	\N	CURSO DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-121-1	\N	Gastronomia	\N	\N	1118 paginas	\N	\N	\N	\N	t	\N
1002175	\N	CURSO DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-121-1	\N	Gastronomia	\N	\N	1117 paginas	\N	\N	\N	\N	t	\N
1002176	\N	CURSO DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-121-1	\N	Gastronomia	\N	\N	1116 paginas	\N	\N	\N	\N	t	\N
1002177	\N	CURSO DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-121-1	\N	Gastronomia	\N	\N	1115 paginas	\N	\N	\N	\N	t	\N
1002178	\N	Curso de: Panaderia y pasteleria Profesional	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	1114 paginas	\N	\N	\N	\N	t	\N
1002179	\N	Curso Integral de Computacion	\N	\N	\N	\N	\N	El Comercio	Computacion	\N	\N	1113 paginas	\N	\N	\N	\N	t	\N
1002180	\N	CURSO: PERMANENTACION TOMO I	\N	\N	\N	\N	\N	\N	\N	\N	\N	1112 paginas	\N	\N	\N	\N	t	\N
1002181	\N	Cursos de aplicaciones Windows	\N	\N	\N	\N	\N	F&G (2 libros)	Computacion	\N	\N	1111 paginas	\N	\N	\N	\N	t	\N
1002182	\N	De Gestion N° 77	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1110 paginas	\N	\N	\N	\N	t	\N
1002183	\N	De Gestión N° 81, agosto 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1109 paginas	\N	\N	\N	\N	t	\N
1002184	\N	De Gestión N° 83, octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1108 paginas	\N	\N	\N	\N	t	\N
1002185	\N	Descubrimiento conquista y virreynato del Peru	Arnulfo Ramos Bustos	\N	\N	\N	\N	LABRUSA	HISTORIA	\N	\N	1107 paginas	\N	\N	\N	\N	t	\N
1002186	\N	Designs	Joan Priolo	\N	\N	\N	\N	\N	Artes	\N	\N	1106 paginas	\N	\N	\N	\N	t	\N
1002187	\N	Diagnostico de la Diosecis de Carabayllo 2000 - 2003	Equipo Diocesano Carabayllo	\N	\N	\N	\N	\N	Cristianismo	\N	\N	1105 paginas	\N	\N	\N	\N	t	\N
1002188	\N	Diario El Pueblo jueves 31 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1104 paginas	\N	\N	\N	\N	t	\N
1002189	\N	Diario El Pueblo lunes 21 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1103 paginas	\N	\N	\N	\N	t	\N
1002190	\N	Diario El Pueblo lunes 28 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1102 paginas	\N	\N	\N	\N	t	\N
1002191	\N	Diario El Pueblo martes 22 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1101 paginas	\N	\N	\N	\N	t	\N
1002192	\N	Diario El Pueblo martes 29 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1100 paginas	\N	\N	\N	\N	t	\N
1002193	\N	Diario El Pueblo miercoles 16 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1099 paginas	\N	\N	\N	\N	t	\N
1002194	\N	Diario El Pueblo miercoles 23 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1098 paginas	\N	\N	\N	\N	t	\N
1002195	\N	Diario El Pueblo miercoles 30 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1097 paginas	\N	\N	\N	\N	t	\N
1002196	\N	Diario El Pueblo viernes 01 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1096 paginas	\N	\N	\N	\N	t	\N
1002197	\N	Diario El Pueblo viernes 25 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1095 paginas	\N	\N	\N	\N	t	\N
1002198	\N	Diario GESTION viernes 29 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1094 paginas	\N	\N	\N	\N	t	\N
1002199	\N	Diario GESTION jueves 1 de febrero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1093 paginas	\N	\N	\N	\N	t	\N
1002200	\N	Diario GESTION jueves 11 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1092 paginas	\N	\N	\N	\N	t	\N
1002201	\N	Diario GESTION jueves 02 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1091 paginas	\N	\N	\N	\N	t	\N
1002202	\N	Diario GESTION jueves 03 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1090 paginas	\N	\N	\N	\N	t	\N
1002203	\N	Diario GESTION jueves 04 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1089 paginas	\N	\N	\N	\N	t	\N
1002204	\N	Diario GESTION jueves 05 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1088 paginas	\N	\N	\N	\N	t	\N
1002205	\N	Diario GESTION jueves 05 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1087 paginas	\N	\N	\N	\N	t	\N
1002206	\N	Diario GESTION jueves 06 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1086 paginas	\N	\N	\N	\N	t	\N
1002207	\N	Diario GESTION jueves 06 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1085 paginas	\N	\N	\N	\N	t	\N
1002208	\N	Diario GESTION jueves 06 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1084 paginas	\N	\N	\N	\N	t	\N
1002209	\N	Diario GESTION jueves 07 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1083 paginas	\N	\N	\N	\N	t	\N
1002210	\N	Diario GESTION jueves 07 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1082 paginas	\N	\N	\N	\N	t	\N
1002211	\N	Diario GESTION jueves 07 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1081 paginas	\N	\N	\N	\N	t	\N
1002212	\N	Diario GESTION jueves 08 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1080 paginas	\N	\N	\N	\N	t	\N
1002213	\N	Diario GESTION jueves 09 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1079 paginas	\N	\N	\N	\N	t	\N
1002214	\N	Diario GESTION jueves 1 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1078 paginas	\N	\N	\N	\N	t	\N
1002215	\N	Diario GESTION jueves 1 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1077 paginas	\N	\N	\N	\N	t	\N
1002216	\N	Diario GESTION jueves 10 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1076 paginas	\N	\N	\N	\N	t	\N
1002217	\N	Diario GESTION jueves 10 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1075 paginas	\N	\N	\N	\N	t	\N
1002218	\N	Diario GESTION jueves 11 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1074 paginas	\N	\N	\N	\N	t	\N
1002219	\N	Diario GESTION jueves 11 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1073 paginas	\N	\N	\N	\N	t	\N
1002220	\N	Diario GESTION jueves 12 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1072 paginas	\N	\N	\N	\N	t	\N
1002221	\N	Diario GESTION jueves 12 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1071 paginas	\N	\N	\N	\N	t	\N
1002222	\N	Diario GESTION jueves 13 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1070 paginas	\N	\N	\N	\N	t	\N
1002223	\N	Diario GESTION jueves 13 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1069 paginas	\N	\N	\N	\N	t	\N
1002224	\N	Diario GESTION jueves 13 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1068 paginas	\N	\N	\N	\N	t	\N
1002225	\N	Diario GESTION jueves 14 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1067 paginas	\N	\N	\N	\N	t	\N
1002226	\N	Diario GESTION jueves 14 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1066 paginas	\N	\N	\N	\N	t	\N
1002227	\N	Diario GESTION jueves 15 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1065 paginas	\N	\N	\N	\N	t	\N
1002228	\N	Diario GESTION jueves 15 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1064 paginas	\N	\N	\N	\N	t	\N
1002229	\N	Diario GESTION jueves 16 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1063 paginas	\N	\N	\N	\N	t	\N
1002230	\N	Diario GESTION jueves 17 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1062 paginas	\N	\N	\N	\N	t	\N
1002231	\N	Diario GESTION jueves 17 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1061 paginas	\N	\N	\N	\N	t	\N
1002232	\N	Diario GESTION jueves 17 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1060 paginas	\N	\N	\N	\N	t	\N
1002233	\N	Diario GESTION jueves 18 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1059 paginas	\N	\N	\N	\N	t	\N
1002234	\N	Diario GESTION jueves 19 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1058 paginas	\N	\N	\N	\N	t	\N
1002235	\N	Diario GESTION jueves 19 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1057 paginas	\N	\N	\N	\N	t	\N
1002236	\N	Diario GESTION jueves 20 de abril del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1056 paginas	\N	\N	\N	\N	t	\N
1002237	\N	Diario GESTION jueves 20 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1055 paginas	\N	\N	\N	\N	t	\N
1002238	\N	Diario GESTION jueves 20 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1054 paginas	\N	\N	\N	\N	t	\N
1002239	\N	Diario GESTION jueves 20 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1053 paginas	\N	\N	\N	\N	t	\N
1002240	\N	Diario GESTION jueves 21 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1052 paginas	\N	\N	\N	\N	t	\N
1002241	\N	Diario GESTION jueves 21 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1051 paginas	\N	\N	\N	\N	t	\N
1002242	\N	Diario GESTION jueves 21 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1050 paginas	\N	\N	\N	\N	t	\N
1002243	\N	Diario GESTION jueves 21 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1049 paginas	\N	\N	\N	\N	t	\N
1002244	\N	Diario GESTION jueves 22 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1048 paginas	\N	\N	\N	\N	t	\N
1002245	\N	Diario GESTION jueves 22 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1047 paginas	\N	\N	\N	\N	t	\N
1002246	\N	Diario GESTION jueves 23 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1046 paginas	\N	\N	\N	\N	t	\N
1002247	\N	Diario GESTION jueves 23 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1045 paginas	\N	\N	\N	\N	t	\N
1002248	\N	Diario GESTION jueves 24 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1044 paginas	\N	\N	\N	\N	t	\N
1002249	\N	Diario GESTION jueves 24 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1043 paginas	\N	\N	\N	\N	t	\N
1002250	\N	Diario GESTION jueves 25 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1042 paginas	\N	\N	\N	\N	t	\N
1002251	\N	Diario GESTION jueves 25 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1041 paginas	\N	\N	\N	\N	t	\N
1002252	\N	Diario GESTION jueves 26 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1040 paginas	\N	\N	\N	\N	t	\N
1002253	\N	Diario GESTION jueves 26 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1039 paginas	\N	\N	\N	\N	t	\N
1002254	\N	Diario GESTION jueves 27 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1038 paginas	\N	\N	\N	\N	t	\N
1002255	\N	Diario GESTION jueves 27 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1037 paginas	\N	\N	\N	\N	t	\N
1002256	\N	Diario GESTION jueves 27 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1036 paginas	\N	\N	\N	\N	t	\N
1002257	\N	Diario GESTION jueves 28 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1035 paginas	\N	\N	\N	\N	t	\N
1002258	\N	Diario GESTION jueves 28 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1034 paginas	\N	\N	\N	\N	t	\N
1002259	\N	Diario GESTION jueves 28 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1033 paginas	\N	\N	\N	\N	t	\N
1002260	\N	Diario GESTION jueves 28 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1032 paginas	\N	\N	\N	\N	t	\N
1002261	\N	Diario GESTION jueves 29 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1031 paginas	\N	\N	\N	\N	t	\N
1002262	\N	Diario GESTION jueves 3 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1030 paginas	\N	\N	\N	\N	t	\N
1002263	\N	Diario GESTION jueves 30 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1029 paginas	\N	\N	\N	\N	t	\N
1002264	\N	Diario GESTION jueves 31 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1028 paginas	\N	\N	\N	\N	t	\N
1002265	\N	Diario GESTION jueves 5 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1027 paginas	\N	\N	\N	\N	t	\N
1002266	\N	Diario GESTION jueves 6 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1026 paginas	\N	\N	\N	\N	t	\N
1002267	\N	Diario GESTION jueves 7 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1025 paginas	\N	\N	\N	\N	t	\N
1002268	\N	Diario GESTION jueves 9 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1024 paginas	\N	\N	\N	\N	t	\N
1002269	\N	Diario GESTION lunes 01 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1023 paginas	\N	\N	\N	\N	t	\N
1002270	\N	Diario GESTION lunes 02 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1022 paginas	\N	\N	\N	\N	t	\N
1002271	\N	Diario GESTION lunes 02 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1021 paginas	\N	\N	\N	\N	t	\N
1002272	\N	Diario GESTION lunes 03 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1020 paginas	\N	\N	\N	\N	t	\N
1002273	\N	Diario GESTION lunes 03 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1019 paginas	\N	\N	\N	\N	t	\N
1002274	\N	Diario GESTION lunes 03 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1018 paginas	\N	\N	\N	\N	t	\N
1002275	\N	Diario GESTION lunes 04 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1017 paginas	\N	\N	\N	\N	t	\N
1002276	\N	Diario GESTION lunes 04 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1016 paginas	\N	\N	\N	\N	t	\N
1002277	\N	Diario GESTION lunes 04 de marzo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	1015 paginas	\N	\N	\N	\N	t	\N
1002278	\N	Diario GESTION lunes 05 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1014 paginas	\N	\N	\N	\N	t	\N
1002279	\N	Diario GESTION lunes 06 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1013 paginas	\N	\N	\N	\N	t	\N
1002280	\N	Diario GESTION lunes 07 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1012 paginas	\N	\N	\N	\N	t	\N
1002281	\N	Diario GESTION lunes 08 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1011 paginas	\N	\N	\N	\N	t	\N
1002282	\N	Diario GESTION lunes 09 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1010 paginas	\N	\N	\N	\N	t	\N
1002283	\N	Diario GESTION lunes 10 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1009 paginas	\N	\N	\N	\N	t	\N
1002284	\N	Diario GESTION lunes 10 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1008 paginas	\N	\N	\N	\N	t	\N
1002285	\N	Diario GESTION lunes 10 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1007 paginas	\N	\N	\N	\N	t	\N
1002286	\N	Diario GESTION lunes 10 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1006 paginas	\N	\N	\N	\N	t	\N
1002287	\N	Diario GESTION lunes 11 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1005 paginas	\N	\N	\N	\N	t	\N
1002288	\N	Diario GESTION lunes 11 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1004 paginas	\N	\N	\N	\N	t	\N
1002289	\N	Diario GESTION lunes 11 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1003 paginas	\N	\N	\N	\N	t	\N
1002290	\N	Diario GESTION lunes 11 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1002 paginas	\N	\N	\N	\N	t	\N
1002291	\N	Diario GESTION lunes 12 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1001 paginas	\N	\N	\N	\N	t	\N
1002292	\N	Diario GESTION lunes 12 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	1000 paginas	\N	\N	\N	\N	t	\N
1002293	\N	Diario GESTION lunes 13 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	999 paginas	\N	\N	\N	\N	t	\N
1002294	\N	Diario GESTION lunes 13 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	998 paginas	\N	\N	\N	\N	t	\N
1002295	\N	Diario GESTION lunes 14 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	997 paginas	\N	\N	\N	\N	t	\N
1002296	\N	Diario GESTION lunes 14 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	996 paginas	\N	\N	\N	\N	t	\N
1002297	\N	Diario GESTION lunes 16 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	995 paginas	\N	\N	\N	\N	t	\N
1002298	\N	Diario GESTION lunes 16 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	994 paginas	\N	\N	\N	\N	t	\N
1002299	\N	Diario GESTION lunes 17 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	993 paginas	\N	\N	\N	\N	t	\N
1002300	\N	Diario GESTION lunes 17 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	992 paginas	\N	\N	\N	\N	t	\N
1002301	\N	Diario GESTION lunes 17 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	991 paginas	\N	\N	\N	\N	t	\N
1002302	\N	Diario GESTION lunes 18 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura /diario	\N	\N	990 paginas	\N	\N	\N	\N	t	\N
1002303	\N	Diario GESTION lunes 18 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	989 paginas	\N	\N	\N	\N	t	\N
1002304	\N	Diario GESTION lunes 18 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	988 paginas	\N	\N	\N	\N	t	\N
1002305	\N	Diario GESTION lunes 18 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	987 paginas	\N	\N	\N	\N	t	\N
1002306	\N	Diario GESTION lunes 18 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	986 paginas	\N	\N	\N	\N	t	\N
1002307	\N	Diario GESTION lunes 19 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	985 paginas	\N	\N	\N	\N	t	\N
1002308	\N	Diario GESTION lunes 19 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	984 paginas	\N	\N	\N	\N	t	\N
1002309	\N	Diario GESTION lunes 19 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	983 paginas	\N	\N	\N	\N	t	\N
1002310	\N	Diario GESTION lunes 2 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	982 paginas	\N	\N	\N	\N	t	\N
1002311	\N	Diario GESTION lunes 20 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	981 paginas	\N	\N	\N	\N	t	\N
1002312	\N	Diario GESTION lunes 20 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	980 paginas	\N	\N	\N	\N	t	\N
1002313	\N	Diario GESTION lunes 21 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	979 paginas	\N	\N	\N	\N	t	\N
1002314	\N	Diario GESTION lunes 21 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	978 paginas	\N	\N	\N	\N	t	\N
1002315	\N	Diario GESTION lunes 21 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	977 paginas	\N	\N	\N	\N	t	\N
1002316	\N	Diario GESTION lunes 22 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	976 paginas	\N	\N	\N	\N	t	\N
1002317	\N	Diario GESTION lunes 22 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	975 paginas	\N	\N	\N	\N	t	\N
1002318	\N	Diario GESTION lunes 23 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	974 paginas	\N	\N	\N	\N	t	\N
1002319	\N	Diario GESTION lunes 24 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	973 paginas	\N	\N	\N	\N	t	\N
1002320	\N	Diario GESTION lunes 24 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	972 paginas	\N	\N	\N	\N	t	\N
1002321	\N	Diario GESTION lunes 25 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	971 paginas	\N	\N	\N	\N	t	\N
1002322	\N	Diario GESTION lunes 25 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	970 paginas	\N	\N	\N	\N	t	\N
1002323	\N	Diario GESTION lunes 26 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	969 paginas	\N	\N	\N	\N	t	\N
1002324	\N	Diario GESTION lunes 26 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	968 paginas	\N	\N	\N	\N	t	\N
1002325	\N	Diario GESTION lunes 27 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	967 paginas	\N	\N	\N	\N	t	\N
1002326	\N	Diario GESTION lunes 28 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	966 paginas	\N	\N	\N	\N	t	\N
1002327	\N	Diario GESTION lunes 28 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	965 paginas	\N	\N	\N	\N	t	\N
1002328	\N	Diario GESTION lunes 29 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	964 paginas	\N	\N	\N	\N	t	\N
1002329	\N	Diario GESTION lunes 29 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	963 paginas	\N	\N	\N	\N	t	\N
1002330	\N	Diario GESTION lunes 29 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	962 paginas	\N	\N	\N	\N	t	\N
1002331	\N	Diario GESTION lunes 3 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	961 paginas	\N	\N	\N	\N	t	\N
1002332	\N	Diario GESTION lunes 31 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	960 paginas	\N	\N	\N	\N	t	\N
1002333	\N	Diario GESTION lunes 31 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	959 paginas	\N	\N	\N	\N	t	\N
1002334	\N	Diario GESTION lunes 4 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	958 paginas	\N	\N	\N	\N	t	\N
1002335	\N	Diario GESTION lunes 4 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	957 paginas	\N	\N	\N	\N	t	\N
1002336	\N	Diario GESTION lunes 5 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	956 paginas	\N	\N	\N	\N	t	\N
1002337	\N	Diario GESTION lunes 5 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	955 paginas	\N	\N	\N	\N	t	\N
1002338	\N	Diario GESTION lunes 7 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	954 paginas	\N	\N	\N	\N	t	\N
1002339	\N	Diario GESTION lunes 8 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	953 paginas	\N	\N	\N	\N	t	\N
1002340	\N	Diario GESTION lunes 9 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	952 paginas	\N	\N	\N	\N	t	\N
1002341	\N	Diario GESTION martes 02 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	951 paginas	\N	\N	\N	\N	t	\N
1002342	\N	Diario GESTION martes 02 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	950 paginas	\N	\N	\N	\N	t	\N
1002343	\N	Diario GESTION martes 02 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	949 paginas	\N	\N	\N	\N	t	\N
1002344	\N	Diario GESTION martes 03 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	948 paginas	\N	\N	\N	\N	t	\N
1002345	\N	Diario GESTION martes 03 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	947 paginas	\N	\N	\N	\N	t	\N
1002346	\N	Diario GESTION martes 04 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	946 paginas	\N	\N	\N	\N	t	\N
1002347	\N	Diario GESTION martes 04 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	945 paginas	\N	\N	\N	\N	t	\N
1002348	\N	Diario GESTION martes 04 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	944 paginas	\N	\N	\N	\N	t	\N
1002349	\N	Diario GESTION martes 05 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	943 paginas	\N	\N	\N	\N	t	\N
1002350	\N	Diario GESTION martes 05 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	942 paginas	\N	\N	\N	\N	t	\N
1002351	\N	Diario GESTION martes 05 de marzo del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	941 paginas	\N	\N	\N	\N	t	\N
1002352	\N	Diario GESTION martes 06 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	940 paginas	\N	\N	\N	\N	t	\N
1002353	\N	Diario GESTION martes 07 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	939 paginas	\N	\N	\N	\N	t	\N
1002354	\N	Diario GESTION martes 08 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	938 paginas	\N	\N	\N	\N	t	\N
1002355	\N	Diario GESTION martes 09 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	937 paginas	\N	\N	\N	\N	t	\N
1002356	\N	Diario GESTION martes 1 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	936 paginas	\N	\N	\N	\N	t	\N
1002357	\N	Diario GESTION martes 10 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	935 paginas	\N	\N	\N	\N	t	\N
1002358	\N	Diario GESTION martes 10 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	934 paginas	\N	\N	\N	\N	t	\N
1002359	\N	Diario GESTION martes 10 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	933 paginas	\N	\N	\N	\N	t	\N
1002360	\N	Diario GESTION martes 11 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	932 paginas	\N	\N	\N	\N	t	\N
1002361	\N	Diario GESTION martes 11 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	931 paginas	\N	\N	\N	\N	t	\N
1002362	\N	Diario GESTION martes 12 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	930 paginas	\N	\N	\N	\N	t	\N
1002363	\N	Diario GESTION martes 12 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	929 paginas	\N	\N	\N	\N	t	\N
1002364	\N	Diario GESTION martes 12 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	928 paginas	\N	\N	\N	\N	t	\N
1002365	\N	Diario GESTION martes 12 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	927 paginas	\N	\N	\N	\N	t	\N
1002366	\N	Diario GESTION martes 13 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	926 paginas	\N	\N	\N	\N	t	\N
1002367	\N	Diario GESTION martes 14 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	925 paginas	\N	\N	\N	\N	t	\N
1002368	\N	Diario GESTION martes 15 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	924 paginas	\N	\N	\N	\N	t	\N
1002369	\N	Diario GESTION martes 15 de mayodel 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	923 paginas	\N	\N	\N	\N	t	\N
1002370	\N	Diario GESTION martes 16 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	922 paginas	\N	\N	\N	\N	t	\N
1002371	\N	Diario GESTION martes 17 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	921 paginas	\N	\N	\N	\N	t	\N
1002372	\N	Diario GESTION martes 17 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	920 paginas	\N	\N	\N	\N	t	\N
1002373	\N	Diario GESTION martes 18 de abril del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	919 paginas	\N	\N	\N	\N	t	\N
1002374	\N	Diario GESTION martes 18 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	918 paginas	\N	\N	\N	\N	t	\N
1002375	\N	Diario GESTION martes 18 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	917 paginas	\N	\N	\N	\N	t	\N
1002376	\N	Diario GESTION martes 18 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	916 paginas	\N	\N	\N	\N	t	\N
1002377	\N	Diario GESTION martes 19 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	915 paginas	\N	\N	\N	\N	t	\N
1002378	\N	Diario GESTION martes 19 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	914 paginas	\N	\N	\N	\N	t	\N
1002379	\N	Diario GESTION martes 19 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	913 paginas	\N	\N	\N	\N	t	\N
1002380	\N	Diario GESTION martes 19 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	912 paginas	\N	\N	\N	\N	t	\N
1002381	\N	Diario GESTION martes 19 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura /diario	\N	\N	911 paginas	\N	\N	\N	\N	t	\N
1002382	\N	Diario GESTION martes 20 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	910 paginas	\N	\N	\N	\N	t	\N
1002383	\N	Diario GESTION martes 20 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	909 paginas	\N	\N	\N	\N	t	\N
1002384	\N	Diario GESTION martes 20 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	908 paginas	\N	\N	\N	\N	t	\N
1002385	\N	Diario GESTION martes 21 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	907 paginas	\N	\N	\N	\N	t	\N
1002386	\N	Diario GESTION martes 21 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	906 paginas	\N	\N	\N	\N	t	\N
1002387	\N	Diario GESTION martes 22 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	905 paginas	\N	\N	\N	\N	t	\N
1002388	\N	Diario GESTION martes 22 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	904 paginas	\N	\N	\N	\N	t	\N
1002389	\N	Diario GESTION martes 23 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	903 paginas	\N	\N	\N	\N	t	\N
1002390	\N	Diario GESTION martes 23 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	902 paginas	\N	\N	\N	\N	t	\N
1002391	\N	Diario GESTION martes 24 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	901 paginas	\N	\N	\N	\N	t	\N
1002392	\N	Diario GESTION martes 25 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	900 paginas	\N	\N	\N	\N	t	\N
1002393	\N	Diario GESTION martes 25 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	899 paginas	\N	\N	\N	\N	t	\N
1002394	\N	Diario GESTION martes 26 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	898 paginas	\N	\N	\N	\N	t	\N
1002395	\N	Diario GESTION martes 26 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	897 paginas	\N	\N	\N	\N	t	\N
1002396	\N	Diario GESTION martes 27 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	896 paginas	\N	\N	\N	\N	t	\N
1002397	\N	Diario GESTION martes 27 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	895 paginas	\N	\N	\N	\N	t	\N
1002398	\N	Diario GESTION martes 28 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	894 paginas	\N	\N	\N	\N	t	\N
1002399	\N	Diario GESTION martes 28 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	893 paginas	\N	\N	\N	\N	t	\N
1002400	\N	Diario GESTION martes 29 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	892 paginas	\N	\N	\N	\N	t	\N
1002401	\N	Diario GESTION martes 29 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	891 paginas	\N	\N	\N	\N	t	\N
1002402	\N	Diario GESTION martes 29 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	890 paginas	\N	\N	\N	\N	t	\N
1002403	\N	Diario GESTION martes 3 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	889 paginas	\N	\N	\N	\N	t	\N
1002404	\N	Diario GESTION martes 30 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	888 paginas	\N	\N	\N	\N	t	\N
1002405	\N	Diario GESTION martes 30 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	887 paginas	\N	\N	\N	\N	t	\N
1002406	\N	Diario GESTION martes 30 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	886 paginas	\N	\N	\N	\N	t	\N
1002407	\N	Diario GESTION martes 30 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	885 paginas	\N	\N	\N	\N	t	\N
1002408	\N	Diario GESTION martes 4 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	884 paginas	\N	\N	\N	\N	t	\N
1002409	\N	Diario GESTION martes 5 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	883 paginas	\N	\N	\N	\N	t	\N
1002410	\N	Diario GESTION martes 5 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	882 paginas	\N	\N	\N	\N	t	\N
1002411	\N	Diario GESTION martes 6 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	881 paginas	\N	\N	\N	\N	t	\N
1002412	\N	Diario GESTION martes 7 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	880 paginas	\N	\N	\N	\N	t	\N
1002413	\N	Diario GESTION martes 8 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	879 paginas	\N	\N	\N	\N	t	\N
1002414	\N	Diario GESTION martess 26 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	878 paginas	\N	\N	\N	\N	t	\N
1002415	\N	Diario GESTION miercoles 02 de enero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	877 paginas	\N	\N	\N	\N	t	\N
1002416	\N	Diario GESTION miercoles 02 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	876 paginas	\N	\N	\N	\N	t	\N
1002417	\N	Diario GESTION miercoles 03 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	875 paginas	\N	\N	\N	\N	t	\N
1002418	\N	Diario GESTION miercoles 03 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	874 paginas	\N	\N	\N	\N	t	\N
1002419	\N	Diario GESTION miercoles 03 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	873 paginas	\N	\N	\N	\N	t	\N
1002420	\N	Diario GESTION miercoles 04 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	872 paginas	\N	\N	\N	\N	t	\N
1002421	\N	Diario GESTION miercoles 04 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	871 paginas	\N	\N	\N	\N	t	\N
1002422	\N	Diario GESTION miercoles 05 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	870 paginas	\N	\N	\N	\N	t	\N
1002423	\N	Diario GESTION miércoles 05 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	869 paginas	\N	\N	\N	\N	t	\N
1002424	\N	Diario GESTION miercoles 05 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	868 paginas	\N	\N	\N	\N	t	\N
1002425	\N	Diario GESTION miercoles 06 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	867 paginas	\N	\N	\N	\N	t	\N
1002426	\N	Diario GESTION miercoles 06 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	866 paginas	\N	\N	\N	\N	t	\N
1002427	\N	Diario GESTION miercoles 06 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	865 paginas	\N	\N	\N	\N	t	\N
1002428	\N	Diario GESTION miercoles 07 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	864 paginas	\N	\N	\N	\N	t	\N
1002429	\N	Diario GESTION miercoles 08 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	863 paginas	\N	\N	\N	\N	t	\N
1002430	\N	Diario GESTION miercoles 09 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	862 paginas	\N	\N	\N	\N	t	\N
1002431	\N	Diario GESTION miércoles 10 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	861 paginas	\N	\N	\N	\N	t	\N
1002432	\N	Diario GESTION miercoles 10 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	860 paginas	\N	\N	\N	\N	t	\N
1002433	\N	Diario GESTION miercoles 11 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	859 paginas	\N	\N	\N	\N	t	\N
1002434	\N	Diario GESTION miercoles 11 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	858 paginas	\N	\N	\N	\N	t	\N
1002435	\N	Diario GESTION miercoles 12 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	857 paginas	\N	\N	\N	\N	t	\N
1002436	\N	Diario GESTION miercoles 12 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	856 paginas	\N	\N	\N	\N	t	\N
1002437	\N	Diario GESTION miercoles 12 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	855 paginas	\N	\N	\N	\N	t	\N
1002438	\N	Diario GESTION miercoles 13 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura /diario	\N	\N	854 paginas	\N	\N	\N	\N	t	\N
1002439	\N	Diario GESTION miercoles 13 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	853 paginas	\N	\N	\N	\N	t	\N
1002440	\N	Diario GESTION miercoles 13 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	852 paginas	\N	\N	\N	\N	t	\N
1002441	\N	Diario GESTION miercoles 14 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	851 paginas	\N	\N	\N	\N	t	\N
1002442	\N	Diario GESTION miercoles 14 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	850 paginas	\N	\N	\N	\N	t	\N
1002443	\N	Diario GESTION miercoles 14 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	849 paginas	\N	\N	\N	\N	t	\N
1002444	\N	Diario GESTION miercoles 15 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	848 paginas	\N	\N	\N	\N	t	\N
1002445	\N	Diario GESTION miercoles 16 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	847 paginas	\N	\N	\N	\N	t	\N
1002446	\N	Diario GESTION miercoles 16 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	846 paginas	\N	\N	\N	\N	t	\N
1002447	\N	Diario GESTION miercoles 16 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	845 paginas	\N	\N	\N	\N	t	\N
1002448	\N	Diario GESTION miercoles 17 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	844 paginas	\N	\N	\N	\N	t	\N
1002449	\N	Diario GESTION miercoles 18 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	843 paginas	\N	\N	\N	\N	t	\N
1002450	\N	Diario GESTION miercoles 18 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	842 paginas	\N	\N	\N	\N	t	\N
1002451	\N	Diario GESTION miercoles 19 de abril del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	841 paginas	\N	\N	\N	\N	t	\N
1002452	\N	Diario GESTION miercoles 19 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	840 paginas	\N	\N	\N	\N	t	\N
1002453	\N	Diario GESTION miercoles 19 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	839 paginas	\N	\N	\N	\N	t	\N
1002454	\N	Diario GESTION miercoles 19 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	838 paginas	\N	\N	\N	\N	t	\N
1002455	\N	Diario GESTION miercoles 2 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	837 paginas	\N	\N	\N	\N	t	\N
1002456	\N	Diario GESTION miercoles 20 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	836 paginas	\N	\N	\N	\N	t	\N
1002457	\N	Diario GESTION miercoles 20 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	835 paginas	\N	\N	\N	\N	t	\N
1002458	\N	Diario GESTION miercoles 20 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	834 paginas	\N	\N	\N	\N	t	\N
1002459	\N	Diario GESTION miercoles 20 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	833 paginas	\N	\N	\N	\N	t	\N
1002460	\N	Diario GESTION miercoles 21 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	832 paginas	\N	\N	\N	\N	t	\N
1002461	\N	Diario GESTION miercoles 21 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	831 paginas	\N	\N	\N	\N	t	\N
1002462	\N	Diario GESTION miercoles 22 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	830 paginas	\N	\N	\N	\N	t	\N
1002463	\N	Diario GESTION miercoles 22 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	829 paginas	\N	\N	\N	\N	t	\N
1002464	\N	Diario GESTION miercoles 23 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	828 paginas	\N	\N	\N	\N	t	\N
1002465	\N	Diario GESTION miercoles 23 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	827 paginas	\N	\N	\N	\N	t	\N
1002466	\N	Diario GESTION miercoles 23 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	826 paginas	\N	\N	\N	\N	t	\N
1002467	\N	Diario GESTION miercoles 24 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	825 paginas	\N	\N	\N	\N	t	\N
1002468	\N	Diario GESTION miercoles 24 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	824 paginas	\N	\N	\N	\N	t	\N
1002469	\N	Diario GESTION miercoles 24 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	823 paginas	\N	\N	\N	\N	t	\N
1002470	\N	Diario GESTION miercoles 25 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	822 paginas	\N	\N	\N	\N	t	\N
1002471	\N	Diario GESTION miercoles 26 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	821 paginas	\N	\N	\N	\N	t	\N
1002472	\N	Diario GESTION miercoles 26 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	820 paginas	\N	\N	\N	\N	t	\N
1002473	\N	Diario GESTION miercoles 26 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	819 paginas	\N	\N	\N	\N	t	\N
1002474	\N	Diario GESTION miercoles 27 de febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	818 paginas	\N	\N	\N	\N	t	\N
1002475	\N	Diario GESTION miercoles 27 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	817 paginas	\N	\N	\N	\N	t	\N
1002476	\N	Diario GESTION miercoles 27 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	816 paginas	\N	\N	\N	\N	t	\N
1002477	\N	Diario GESTION miercoles 28 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	815 paginas	\N	\N	\N	\N	t	\N
1002478	\N	Diario GESTION miercoles 28 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	814 paginas	\N	\N	\N	\N	t	\N
1002479	\N	Diario GESTION miercoles 28 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	813 paginas	\N	\N	\N	\N	t	\N
1002480	\N	Diario GESTION miercoles 29 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	812 paginas	\N	\N	\N	\N	t	\N
1002481	\N	Diario GESTION miércoles 29 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	811 paginas	\N	\N	\N	\N	t	\N
1002482	\N	Diario GESTION miercoles 30 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	810 paginas	\N	\N	\N	\N	t	\N
1002483	\N	Diario GESTION miercoles 30 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	809 paginas	\N	\N	\N	\N	t	\N
1002484	\N	Diario GESTION miercoles 31 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	808 paginas	\N	\N	\N	\N	t	\N
1002485	\N	Diario GESTION miercoles 31 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	807 paginas	\N	\N	\N	\N	t	\N
1002486	\N	Diario GESTION miercoles 4 de octubre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	806 paginas	\N	\N	\N	\N	t	\N
1002487	\N	Diario GESTION miercoles 5 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	805 paginas	\N	\N	\N	\N	t	\N
1002488	\N	Diario GESTION miercoles 6 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	804 paginas	\N	\N	\N	\N	t	\N
1002489	\N	Diario GESTION miercoles 6 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	803 paginas	\N	\N	\N	\N	t	\N
1002490	\N	Diario GESTION miercoles 8 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	802 paginas	\N	\N	\N	\N	t	\N
1002491	\N	Diario GESTION miercoles 9 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	801 paginas	\N	\N	\N	\N	t	\N
1002492	\N	DIARIO GESTIÓN N°93 AGOSTO 2018	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	800 paginas	\N	\N	\N	\N	t	\N
1002493	\N	Diario GESTION viernes 01 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	799 paginas	\N	\N	\N	\N	t	\N
1002494	\N	Diario GESTION viernes 02 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	798 paginas	\N	\N	\N	\N	t	\N
1002495	\N	Diario GESTION viernes 03 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	797 paginas	\N	\N	\N	\N	t	\N
1002496	\N	Diario GESTION viernes 06 de abril del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	796 paginas	\N	\N	\N	\N	t	\N
1002497	\N	Diario GESTION viernes 06 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	795 paginas	\N	\N	\N	\N	t	\N
1002498	\N	Diario GESTION viernes 07 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	794 paginas	\N	\N	\N	\N	t	\N
1002499	\N	Diario GESTION viernes 07 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	793 paginas	\N	\N	\N	\N	t	\N
1002500	\N	Diario GESTION viernes 08 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	792 paginas	\N	\N	\N	\N	t	\N
1002501	\N	Diario GESTION viernes 08 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	791 paginas	\N	\N	\N	\N	t	\N
1002502	\N	Diario GESTION viernes 08 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	790 paginas	\N	\N	\N	\N	t	\N
1002503	\N	Diario GESTION viernes 09 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	789 paginas	\N	\N	\N	\N	t	\N
1002504	\N	Diario GESTION viernes 10 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	788 paginas	\N	\N	\N	\N	t	\N
1002505	\N	Diario GESTION viernes 11 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	787 paginas	\N	\N	\N	\N	t	\N
1002506	\N	Diario GESTION viernes 11 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	786 paginas	\N	\N	\N	\N	t	\N
1002507	\N	Diario GESTION viernes 12 de enero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	785 paginas	\N	\N	\N	\N	t	\N
1002508	\N	Diario GESTION viernes 12 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	784 paginas	\N	\N	\N	\N	t	\N
1002509	\N	Diario GESTION viernes 13 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	783 paginas	\N	\N	\N	\N	t	\N
1002510	\N	Diario GESTION viernes 14 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	782 paginas	\N	\N	\N	\N	t	\N
1002511	\N	Diario GESTION viernes 14 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	781 paginas	\N	\N	\N	\N	t	\N
1002512	\N	Diario GESTION viernes 14 de junio del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	780 paginas	\N	\N	\N	\N	t	\N
1002513	\N	Diario GESTION viernes 15 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	779 paginas	\N	\N	\N	\N	t	\N
1002514	\N	Diario GESTION viernes 15 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	778 paginas	\N	\N	\N	\N	t	\N
1002515	\N	Diario GESTION viernes 15 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura /diario	\N	\N	777 paginas	\N	\N	\N	\N	t	\N
1002516	\N	Diario GESTION viernes 16 de febrero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	776 paginas	\N	\N	\N	\N	t	\N
1002517	\N	Diario GESTION viernes 16 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	775 paginas	\N	\N	\N	\N	t	\N
1002518	\N	Diario GESTION viernes 16 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	774 paginas	\N	\N	\N	\N	t	\N
1002519	\N	Diario GESTION viernes 17 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	773 paginas	\N	\N	\N	\N	t	\N
1002520	\N	Diario GESTION viernes 17 de noviembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	772 paginas	\N	\N	\N	\N	t	\N
1002521	\N	Diario GESTION viernes 18 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	771 paginas	\N	\N	\N	\N	t	\N
1002522	\N	Diario GESTION viernes 18 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	770 paginas	\N	\N	\N	\N	t	\N
1002523	\N	Diario GESTION viernes 18 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	769 paginas	\N	\N	\N	\N	t	\N
1002524	\N	Diario GESTION viernes 2 de febrero del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	768 paginas	\N	\N	\N	\N	t	\N
1002525	\N	Diario GESTION viernes 20 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	767 paginas	\N	\N	\N	\N	t	\N
1002526	\N	Diario GESTION viernes 21 de abril del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	766 paginas	\N	\N	\N	\N	t	\N
1002527	\N	Diario GESTION viernes 21 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	765 paginas	\N	\N	\N	\N	t	\N
1002528	\N	Diario GESTION viernes 21 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	764 paginas	\N	\N	\N	\N	t	\N
1002529	\N	Diario GESTION viernes 21 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	763 paginas	\N	\N	\N	\N	t	\N
1002530	\N	Diario GESTION viernes 22 de diciembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	762 paginas	\N	\N	\N	\N	t	\N
1002531	\N	Diario GESTION viernes 22 de febrero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	761 paginas	\N	\N	\N	\N	t	\N
1002532	\N	Diario GESTION viernes 22 de junio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	760 paginas	\N	\N	\N	\N	t	\N
1002533	\N	Diario GESTION viernes 22 de marzo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	759 paginas	\N	\N	\N	\N	t	\N
1002534	\N	Diario GESTION viernes 22 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	758 paginas	\N	\N	\N	\N	t	\N
1002535	\N	Diario GESTION viernes 23 de marzo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	757 paginas	\N	\N	\N	\N	t	\N
1002536	\N	Diario GESTION viernes 23 de noviembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	756 paginas	\N	\N	\N	\N	t	\N
1002537	\N	Diario GESTION viernes 24 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	755 paginas	\N	\N	\N	\N	t	\N
1002538	\N	Diario GESTION viernes 24 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	754 paginas	\N	\N	\N	\N	t	\N
1002539	\N	Diario GESTION viernes 25 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	753 paginas	\N	\N	\N	\N	t	\N
1002540	\N	Diario GESTION viernes 25 de enero del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	752 paginas	\N	\N	\N	\N	t	\N
1002541	\N	Diario GESTION viernes 25 de mayo del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	751 paginas	\N	\N	\N	\N	t	\N
1002542	\N	Diario GESTION viernes 26 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	750 paginas	\N	\N	\N	\N	t	\N
1002543	\N	Diario GESTION viernes 26 de mayo del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	749 paginas	\N	\N	\N	\N	t	\N
1002544	\N	Diario GESTION viernes 27 de julio del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	748 paginas	\N	\N	\N	\N	t	\N
1002545	\N	Diario GESTION viernes 28 de abril del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	747 paginas	\N	\N	\N	\N	t	\N
1002546	\N	Diario GESTION viernes 28 de diciembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	746 paginas	\N	\N	\N	\N	t	\N
1002547	\N	Diario GESTION viernes 28 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	745 paginas	\N	\N	\N	\N	t	\N
1002548	\N	Diario GESTION viernes 30 de junio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	744 paginas	\N	\N	\N	\N	t	\N
1002549	\N	Diario GESTION viernes 31 de agosto del 2018	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	743 paginas	\N	\N	\N	\N	t	\N
1002550	\N	Diario GESTION viernes 31 de mayo del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	742 paginas	\N	\N	\N	\N	t	\N
1002551	\N	Diario GESTION viernes 4 de agosto del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	741 paginas	\N	\N	\N	\N	t	\N
1002552	\N	Diario GESTION viernes 6 de octubre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	740 paginas	\N	\N	\N	\N	t	\N
1002553	\N	Diario GESTION viernes 7 de julio del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	739 paginas	\N	\N	\N	\N	t	\N
1002554	\N	Diario GESTION viernes 8 de setiembre del 2017	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	738 paginas	\N	\N	\N	\N	t	\N
1002555	\N	Diario GESTION vviernes 12 de abril del 2019	\N	\N	\N	\N	\N	\N	Cultura/diario	\N	\N	737 paginas	\N	\N	\N	\N	t	\N
1002556	\N	Diccionario de la Lengua Española	\N	\N	\N	\N	\N	RAE (10 TOMOS)	Lengua	\N	\N	736 paginas	\N	\N	\N	\N	t	\N
1002557	\N	Diccionario de peruanismo tomo II 49	Juan de Aroma	\N	\N	\N	\N	EDICIONES PEISA	Diccionario	\N	\N	735 paginas	\N	\N	\N	\N	t	\N
1002558	\N	Diccionario de sinonimos y antonimos	\N	\N	\N	\N	\N	EDUCAR	Lengua	\N	\N	734 paginas	\N	\N	\N	\N	t	\N
1002559	\N	Diccionario Larousse Bilingüe ilustrado	\N	\N	\N	\N	\N	LAROUSSE (14 TOMOS)	Lengua	\N	\N	733 paginas	\N	\N	\N	\N	t	\N
1002560	\N	Diccionario ortografico de consulta rapida	\N	\N	\N	\N	\N	AMERICA	Lengua	\N	\N	732 paginas	\N	\N	\N	\N	t	\N
1002561	\N	La Belleza actual, FRANCIS	\N	\N	\N	\N	\N	\N	\N	\N	\N	731 paginas	\N	\N	\N	\N	t	\N
1002562	\N	Dictionary of cuisine	Alezandre Dumas	\N	\N	\N	ISBN 0-671-72608-0 pbk	\N	Gastronomia	\N	\N	730 paginas	\N	\N	\N	\N	t	\N
1002563	Formaciòn humana	Dietas A	Enrique escardo	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	82	Primera	Lima	2000	\N	t	\N
1002564	Formaciòn humana	Dietas C	\N	\N	\N	\N	\N	LA BRUSA	\N	Español	LIBRO	81	Primera	Lima	2000	\N	t	\N
1002565	\N	Dignidad de la Mujer desde la Iglesia	Conferencia Episcopal Peruana Comisión Episcopal de Apostaolado Laical	\N	\N	\N	\N	\N	folleto	\N	\N	727 paginas	\N	\N	\N	\N	t	\N
1002566	\N	Diventare cuoco	Calzolari, Morisi, Nanetti, Belleti	\N	\N	\N	\N	CALDERINI	\N	\N	\N	726 paginas	\N	\N	\N	\N	t	\N
1002567	\N	Documental del Perú AMAZONAS Tomo IV	DISELPESA	\N	\N	\N	\N	\N	Historia	\N	\N	725 paginas	\N	\N	\N	\N	t	\N
1002568	\N	Dollhouse Dolls	Joann McCracken	\N	\N	\N	\N	\N	Artes	\N	\N	724 paginas	\N	\N	\N	\N	t	\N
1002569	\N	DULCES	ANONIMO (FORRO MARON)	\N	\N	\N	\N	\N	Gastronomia	\N	\N	723 paginas	\N	\N	\N	\N	t	\N
1002570	\N	ECONOMIA Y SALUD	Guillem López i Casasnovas\r\n Vicente Ortún Rubio	\N	\N	\N	Ediciones Encuentro Madrid 1998	\N	Cultura	\N	\N	722 paginas	\N	\N	\N	\N	t	\N
1002572	\N	Efemérides Cívicas	Carlos Maldonado Ramirez	\N	\N	\N	\N	\N	HISTORIA	\N	\N	720 paginas	\N	\N	\N	\N	t	\N
1002573	\N	EL AMANTE DE LADY CHATTERLEY	D.H. Lawrence	\N	\N	\N	2009-09091	\N	Literatura/Obras	\N	\N	719 paginas	\N	\N	\N	\N	t	\N
1002574	\N	EL AMAZONAS Y EN EL MUNDO ACUATICO DE PACAYA- SAMIRIA	WALTERH.WUST	\N	\N	\N	9972-40-278-9	PEISA S.A.C	ENCICLOPEDIA	\N	\N	718 paginas	\N	\N	\N	\N	t	\N
1002575	\N	El arte de la cocina internacional: Platos Típicos del Perú	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	717 paginas	\N	\N	\N	\N	t	\N
1002576	Formacion Humana	El Arte De: \r\n Dibujar con lapiz, pluma y pincel\r\n Hacer letras de molde con plumas y pincel (2 ejemplares)\r\n Pintar establos y granjas	David Stone, Larry Otino, Uldis Klavins	\N	\N	\N	\N	Lester Rosin Assoc. Inc.	Artes	Español	Libro	30, 30, 28,    27	Primera	New York	1973	\N	t	\N
1002577	\N	El arte del Azucar y algo mas…	Libertad de Aparicio	\N	\N	\N	\N	Proinsa Industria Grafica S.R.L.	Gastronomia /Revistas	\N	\N	715 paginas	\N	\N	\N	\N	t	\N
1002578	\N	EL BUHO N°65/LA ´PELEA POR EL AGUA	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	714 paginas	\N	\N	\N	\N	t	\N
1002579	\N	EL BÚHO N°66/Arequipa Mayo- Abril 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	713 paginas	\N	\N	\N	\N	t	\N
1002580	\N	EL BUHO N°67/AREQUIPA JUNIO 2019	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	712 paginas	\N	\N	\N	\N	t	\N
1002581	\N	El BÚHO N°71/Arequipa Noviembre-Diciembre 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	711 paginas	\N	\N	\N	\N	t	\N
1002582	\N	El Buho, Arequipa octubre 2019	\N	\N	\N	\N	\N	EL BUHO	REVISTA	\N	\N	710 paginas	\N	\N	\N	\N	t	\N
1002583	\N	EL CAMINO HACIA EL PROGRESO	GUILLERMO QUINTANA	\N	\N	\N	\N	\N	LIBRO	\N	\N	709 paginas	\N	\N	\N	\N	t	\N
1002584	\N	EL CAPITAL	Carlos Marx	\N	\N	\N	2007-09756	\N	Literatura/Obras	\N	\N	708 paginas	\N	\N	\N	\N	t	\N
1002585	\N	El complejo de Stonehenge	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	707 paginas	\N	\N	\N	\N	t	\N
1002586	\N	EL CONTRTATO SOCIAL	Jean-jacques Rousseau	\N	\N	\N	\N	\N	Literatura/Obras	\N	\N	706 paginas	\N	\N	\N	\N	t	\N
1002587	\N	EL DAMERO DE PIZARRO (2 LIBROS)	REINHARD AUGUSTIN BURNEO	\N	\N	\N	\N	\N	Libro	\N	\N	705 paginas	\N	\N	\N	\N	t	\N
1002588	Formaciòn humana	El doctor en su casa 14	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	1343	Primera Ediciòn	Lima	1989	\N	t	\N
1002589	Formaciòn humana	El doctor en su casa 15	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	1439	Primera Ediciòn	Lima	1989	\N	t	\N
1002590	Formaciòn humana	El doctor en su casa 16	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	1535	Primera Ediciòn	Lima	1989	\N	t	\N
1002591	Formaciòn humana	El doctor en su casa 17	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	1629	Primera Ediciòn	Lima	1989	\N	t	\N
1002592	Formaciòn humana	El doctor en su casa 8	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	1727	Primera Ediciòn	Lima	1989	\N	t	\N
1002593	Formaciòn humana	El doctor en su casa 3	Enrique Escardò	\N	\N	\N	\N	LA BRUSA	Salud	Español	LIBRO	287	Primera Ediciòn	Lima	1989	\N	t	\N
1002594	\N	El Evangelio de San Judas	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	698 paginas	\N	\N	\N	\N	t	\N
1002595	\N	EL EXTRAÑO CASO \r\n DEL DR. JEKYLL Y MR. HYDE	Robert Louis Stevenson	\N	\N	\N	2007-05421	\N	Literatura/Obras	\N	\N	697 paginas	\N	\N	\N	\N	t	\N
1002596	\N	EL FANTASMA DE CANTERVILLE	Oscar Wilde	\N	\N	\N	2010-04549	\N	Literatura/Obras	\N	\N	696 paginas	\N	\N	\N	\N	t	\N
1002597	\N	EL FANTASMA DE CANTERVILLE\r\nY OTROS CUENTOS	Óscar Wilde	\N	\N	\N	40269	\N	Literatura/Obras	\N	\N	695 paginas	\N	\N	\N	\N	t	\N
1002598	\N	EL FANTASMA DE LA OPERA	Gaston Leroux	\N	\N	\N	2010-11467	\N	Literatura/Obras	\N	\N	694 paginas	\N	\N	\N	\N	t	\N
1002599	\N	EL FANTASMA DE LA ÓPERA	Gastón Leroux	\N	\N	\N	SETIEMBRE,2010	\N	Literatura/Obras	\N	\N	693 paginas	\N	\N	\N	\N	t	\N
1002600	\N	El Gourmet.com Navidad America Latina brinda en la mesa de fin de año	Lucas Jinkis	\N	\N	\N	\N	\N	Gastronomia	\N	\N	692 paginas	\N	\N	\N	\N	t	\N
1002601	\N	El Hombre peruano en su historia	\N	\N	\N	\N	\N	AUSONIA (4 TOMOS)	Historia	\N	\N	691 paginas	\N	\N	\N	\N	t	\N
1002602	\N	El menu de cada dia	Karlos Arguiñano	\N	\N	\N	\N	\N	Gastronomia	\N	\N	690 paginas	\N	\N	\N	\N	t	\N
1002603	\N	El menu de cada dia	Karlos Arguiñano	\N	\N	\N	\N	\N	Gastronomia	\N	\N	689 paginas	\N	\N	\N	\N	t	\N
1002604	\N	EL MICROFINANCIERO	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	688 paginas	\N	\N	\N	\N	t	\N
1002605	\N	El Microfinanciero año X, número 53, octubre 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	687 paginas	\N	\N	\N	\N	t	\N
1002606	\N	El Microfinanciero/Número 39/Mayo 2017	Revista de la Federacion Peruana \r\n de Cajas Municipales de Ahorro y \r\n Crédito del Perú	\N	\N	\N	\N	\N	Revista	\N	\N	686 paginas	\N	\N	\N	\N	t	\N
1002607	\N	El Microfinanciero/Número 50/Abril 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	685 paginas	\N	\N	\N	\N	t	\N
1002608	\N	El Microfinanciero/Número 50/Abril 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	684 paginas	\N	\N	\N	\N	t	\N
1002609	\N	El Microfinanciero/Número 50/Abril 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	683 paginas	\N	\N	\N	\N	t	\N
1002610	\N	EL MICROONDAS un aliado en tu cocina- Carnes en el microondas	\N	\N	\N	\N	\N	\N	Revista	\N	\N	682 paginas	\N	\N	\N	\N	t	\N
1002611	\N	EL MICROONDAS un aliado en tu cocina-Desayunos en el microondas	\N	\N	\N	\N	\N	\N	Revista	\N	\N	681 paginas	\N	\N	\N	\N	t	\N
1002612	\N	El mundo de los dinosaurios	\N	\N	\N	\N	\N	National Geographic (14 tomos)	Revista	\N	\N	680 paginas	\N	\N	\N	\N	t	\N
1002613	\N	El mundo del Pan Peruano - 30 Recetas de panes regionales	Juan Andres Ugaz Cruz	\N	\N	\N	\N	MISTURA APEGA	Revista	\N	\N	679 paginas	\N	\N	\N	\N	t	\N
1002614	\N	El ocaso de los Mayas	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	678 paginas	\N	\N	\N	\N	t	\N
1002615	\N	EL ORIGEN DE LA VIDA	Alexander Oparin	\N	\N	\N	41395	\N	Literatura/Obras	\N	\N	677 paginas	\N	\N	\N	\N	t	\N
1002616	\N	El paraiso Amazónico del Perú: MANU	Kim Macquarrie	\N	\N	\N	ISBN 84-8919-12-0	JORDI BLASSI	Cultura/Historia y Geografia	\N	\N	676 paginas	\N	\N	\N	\N	t	\N
1002617	\N	El Perú y sus departamentos	Edgardo Salgado Valcarcel	\N	\N	\N	\N	UNIVERSITARIA	Historia	\N	\N	675 paginas	\N	\N	\N	\N	t	\N
1002618	\N	El PRINCIPE Y EL MENDIGO	Mark twain	\N	\N	\N	40817	\N	Literatura/Obras	\N	\N	674 paginas	\N	\N	\N	\N	t	\N
1002619	Cristianismo	EL PROYECTO EDUCATIVO DE FRANCISCO	ÓSCAR A. PÉREZ SAGAYO	\N	\N	\N	\N	Confederaciòn interamericana de educación católica -CIEC	Educación	Español	Libro	273 paginas	Primera	Bogotá	2018	\N	t	\N
1002620	\N	El quaderno delle nostre Grappe	S. Lucia Di Piave	\N	\N	\N	\N	KELLERMAN	\N	\N	\N	672 paginas	\N	\N	\N	\N	t	\N
1002621	\N	El Rotario Peruano Edicion N°589	\N	\N	\N	\N	\N	\N	Revista	\N	\N	671 paginas	\N	\N	\N	\N	t	\N
1002622	\N	El rotario Peruano Edicion N°590	\N	\N	\N	\N	\N	\N	Revista	\N	\N	670 paginas	\N	\N	\N	\N	t	\N
1002623	\N	El Siglo XX	\N	\N	\N	\N	\N	EL COMERCIO (10 libros)	Historia	\N	\N	669 paginas	\N	\N	\N	\N	t	\N
1002624	\N	EL TITICACA Y LA MAGIA DE LOS ANDES DEL SUR	WALTERH.WUST	\N	\N	\N	9972-40-277-0	PEISA S.A.C	ENCICLOPEDIA	\N	\N	668 paginas	\N	\N	\N	\N	t	\N
1002625	\N	El Triangulo de las Bermudas	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	667 paginas	\N	\N	\N	\N	t	\N
1002626	\N	ELLOS Y ELLAS, 15 de febrero 2024	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	666 paginas	\N	\N	\N	\N	t	\N
1002627	\N	ELLOS Y ELLAS, 29 de febrero 2024	\N	\N	\N	\N	\N	ELLOS Y ELLAS	REVISTA	\N	\N	665 paginas	\N	\N	\N	\N	t	\N
1002628	\N	Transformación del Perú está en la educación	Embajador Diplomacia & negocios	\N	\N	\N	\N	\N	REVISTA	\N	\N	664 paginas	\N	\N	\N	\N	t	\N
1002629	\N	EN DEFENSA DEL LIBRE MERCADO	Padre Robert A. Sirico.	\N	\N	\N	\N	ACTON INSTITUTE	Libro	\N	\N	663 paginas	\N	\N	\N	\N	t	\N
1002630	\N	En la ardiente oscuridad	Antonio Buero Vallejo	\N	\N	\N	\N	TAWANTINSUYU	Literatura/Obras	\N	\N	662 paginas	\N	\N	\N	\N	t	\N
1002631	\N	En la playa	\N	\N	\N	\N	\N	A.T.E.	Literatura/Obras	\N	\N	661 paginas	\N	\N	\N	\N	t	\N
1002632	\N	Enciclopedia de ciencia, ciencias naturales	\N	\N	\N	\N	\N	PLANETA	Ciencias	\N	\N	660 paginas	\N	\N	\N	\N	t	\N
1002633	\N	Enciclopedia de ciencia, ciencias naturales II	\N	\N	\N	\N	\N	PLANETA	Ciencias	\N	\N	659 paginas	\N	\N	\N	\N	t	\N
1002634	\N	Enciclopedia de ciencia, Física	\N	\N	\N	\N	\N	PLANETA	Ciencias	\N	\N	658 paginas	\N	\N	\N	\N	t	\N
1002635	\N	Enciclopedia de ciencia, Matématicas I	\N	\N	\N	\N	\N	PLANETA	Ciencias	\N	\N	657 paginas	\N	\N	\N	\N	t	\N
1002636	\N	Enciclopedia de ciencia, Matématicas II	\N	\N	\N	\N	\N	PLANETA	Ciencias	\N	\N	656 paginas	\N	\N	\N	\N	t	\N
1002637	\N	Enciclopedia de ciencias 1	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	655 paginas	\N	\N	\N	\N	t	\N
1002638	\N	Enciclopedia de ciencias 2	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	654 paginas	\N	\N	\N	\N	t	\N
1002639	\N	Enciclopedia de ciencias 3	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	653 paginas	\N	\N	\N	\N	t	\N
1002640	\N	Enciclopedia de ciencias 4	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	652 paginas	\N	\N	\N	\N	t	\N
1002641	\N	Enciclopedia de ciencias 5	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	651 paginas	\N	\N	\N	\N	t	\N
1002642	\N	Enciclopedia de ciencias 6	\N	\N	\N	\N	\N	DIORKI	Enciclopedia	\N	\N	650 paginas	\N	\N	\N	\N	t	\N
1002643	\N	Enciclopedia de la vida 1973 (7 tomos)	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	649 paginas	\N	\N	\N	\N	t	\N
1002644	\N	Enciclopedia de Management	\N	\N	\N	\N	\N	GRIJALBO (3 TOMOS)	Enciclopedia	\N	\N	648 paginas	\N	\N	\N	\N	t	\N
1002645	\N	Enciclopedia del mar	\N	\N	\N	\N	\N	Folio (33 tomos)	Geografia	\N	\N	647 paginas	\N	\N	\N	\N	t	\N
1002646	\N	Enciclopedia del vino	Mauricio Wiesenthal y Francesc Navarro	\N	\N	\N	\N	CANTABRIA SAC (7 TOMOS)	Enciclopedia	\N	\N	646 paginas	\N	\N	\N	El servicio del vino. El banquete en Grecia. El servicio del vino en Roma. La Edad Media. El Renacimiento y la Edad Moderna. El ritual del vino. El rito del servicio en la mesa. La elección de las copas. Copas para vinos tintos. Copas para vinos espumosos. El catavinos. Copas regionales. La limpieza y el almacenamiento de la cristalería. El paso a paso del servicio del vino. El servicio de los vinos tranquilos. El servicio de los vinos espumosos. La temperatura ideal de servicio. Temperaturas recomendadas. La cubitera. ¿Decantar o no decantar?. La técnica de la decantación. El rito del oporto. El sacacorchos. Un desfile de modelos. La lucha con el tapón. El brindis. El vino en el restaurante. Los complementos del vino.	t	\N
1002647	\N	Enciclopedia el Comercio del estudiante	\N	\N	\N	\N	\N	EL COMERCIO	Enciclopedia	\N	\N	645 paginas	\N	\N	\N	\N	t	\N
1002648	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-150-2	PEISA S.A.C	ENCICLOPEDIA	\N	\N	644 paginas	\N	\N	\N	\N	t	\N
1002649	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-151-0	PEISA S.A.C	ENCICLOPEDIA	\N	\N	643 paginas	\N	\N	\N	\N	t	\N
1002650	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-152-5	PEISA S.A.C	ENCICLOPEDIA	\N	\N	642 paginas	\N	\N	\N	\N	t	\N
1002651	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-153-3	PEISA S.A.C	ENCICLOPEDIA	\N	\N	641 paginas	\N	\N	\N	\N	t	\N
1002652	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-154-1	PEISA S.A.C	ENCICLOPEDIA	\N	\N	640 paginas	\N	\N	\N	\N	t	\N
1002653	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-156-1	PEISA S.A.C	ENCICLOPEDIA	\N	\N	639 paginas	\N	\N	\N	\N	t	\N
1002654	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-157-X	PEISA S.A.C	ENCICLOPEDIA	\N	\N	638 paginas	\N	\N	\N	\N	t	\N
1002655	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-158-8	PEISA S.A.C	ENCICLOPEDIA	\N	\N	637 paginas	\N	\N	\N	\N	t	\N
1002656	\N	ENCICLOPEDIA ILUSTRADA DEL PERU	ALBERTO TAURO DEL PINO	\N	\N	\N	9972-40-159-6	PEISA S.A.C	ENCICLOPEDIA	\N	\N	636 paginas	\N	\N	\N	\N	t	\N
1002657	\N	Enciclopedia Ilustrada del Perú 11	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	635 paginas	\N	\N	\N	\N	t	\N
1002658	\N	Enciclopedia Ilustrada del Perú 12	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	634 paginas	\N	\N	\N	\N	t	\N
1002659	\N	Enciclopedia Ilustrada del Perú 13	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	633 paginas	\N	\N	\N	\N	t	\N
1002660	\N	Enciclopedia Ilustrada del Perú 14	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	632 paginas	\N	\N	\N	\N	t	\N
1002661	\N	Enciclopedia Ilustrada del Perú 15	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	631 paginas	\N	\N	\N	\N	t	\N
1002662	\N	Enciclopedia Ilustrada del Perú 16	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	630 paginas	\N	\N	\N	\N	t	\N
1002663	\N	Enciclopedia Ilustrada del Perú 17	Alberto Tauro del Pino	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	629 paginas	\N	\N	\N	\N	t	\N
1002664	administracion	Enciclopedia Tematica del Perú	El Comercio	\N	\N	\N	\N	El Comercio(16 tomos)	Enciclopedia	español	texto	190 paginas	primera edicion	\N	\N	\N	t	\N
1002665	\N	Enciclopedia Temática del Perú	El Comercio	\N	\N	\N	\N	\N	Historia	\N	\N	627 paginas	\N	\N	\N	\N	t	\N
1002666	\N	Enciclopedia Temática del Perú	El Comercio	\N	\N	\N	\N	\N	Historia	\N	\N	626 paginas	\N	\N	\N	\N	t	\N
1002667	\N	Enciclopedia tematica del Perú 1	Maria Rostworoski	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	625 paginas	\N	\N	\N	\N	t	\N
1002668	\N	Enciclopedia tematica del Perú 10	Maria Mendoza; Hector L.	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	624 paginas	\N	\N	\N	\N	t	\N
1002669	\N	Enciclopedia tematica del Perú 11	Jose, Benjamin, Victor...	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	623 paginas	\N	\N	\N	\N	t	\N
1002670	\N	Enciclopedia tematica del Perú 12	Uriel Garcia Caceres	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	622 paginas	\N	\N	\N	\N	t	\N
1002671	\N	Enciclopedia tematica del Perú 13	Ricardo Gonzales Vigil	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	621 paginas	\N	\N	\N	\N	t	\N
1002672	\N	Enciclopedia tematica del Perú 14	Carlos Ivan Degregori	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	620 paginas	\N	\N	\N	\N	t	\N
1002673	\N	Enciclopedia tematica del Perú 15	Luis, Natalia, Jorge	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	619 paginas	\N	\N	\N	\N	t	\N
1002674	\N	Enciclopedia tematica del Perú 16	Bernardo, Raul, Henry	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	618 paginas	\N	\N	\N	\N	t	\N
1002675	\N	Enciclopedia tematica del Perú 2	Krzyztof Makowski	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	617 paginas	\N	\N	\N	\N	t	\N
1002676	\N	Enciclopedia tematica del Perú 3	Jose Antonio del Busto	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	616 paginas	\N	\N	\N	\N	t	\N
1002677	\N	Enciclopedia tematica del Perú 4	Percy Cayo Codoba	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	615 paginas	\N	\N	\N	\N	t	\N
1002678	\N	Enciclopedia tematica del Perú 5	Antonio Black Egg	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	614 paginas	\N	\N	\N	\N	t	\N
1002679	\N	Enciclopedia tematica del Perú 6	Carlos Peñaherrera	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	613 paginas	\N	\N	\N	\N	t	\N
1002680	\N	Enciclopedia tematica del Perú 7	Augusto Alvarez Rodrich	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	612 paginas	\N	\N	\N	\N	t	\N
1002681	\N	Enciclopedia tematica del Perú 8	Nelson Manrique	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	611 paginas	\N	\N	\N	\N	t	\N
1002682	\N	Enciclopedia tematica del Perú 9	Marcial Antonio Rubio Correa	\N	\N	\N	\N	EL COMERCIO SA	Enciclopedia	\N	\N	610 paginas	\N	\N	\N	\N	t	\N
1002683	\N	Enciclopedia Visor	\N	\N	\N	\N	\N	VISOR (25 TOMOS)	Enciclopedia	\N	\N	609 paginas	\N	\N	\N	\N	t	\N
1002684	\N	English on CD - ROM	\N	\N	\N	\N	\N	F&G	Lengua	\N	\N	608 paginas	\N	\N	\N	\N	t	\N
1002685	\N	Escuela de Informatica	\N	\N	\N	\N	\N	F&G	Computacion	\N	\N	607 paginas	\N	\N	\N	\N	t	\N
1002686	\N	Escuela internacional del sur TOMO 1\r\n Arte del azucar	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	606 paginas	\N	\N	\N	\N	t	\N
1002687	\N	Escuela internacional del sur TOMO 2\r\n Arte del azucar	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	605 paginas	\N	\N	\N	\N	t	\N
1002688	\N	Escuela internacional del sur TOMO 3\r\n Arte del azucar	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	604 paginas	\N	\N	\N	\N	t	\N
1002689	\N	ESPASA CALPE 1	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	603 paginas	\N	\N	\N	\N	t	\N
1002690	\N	ESPASA CALPE 10	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	602 paginas	\N	\N	\N	\N	t	\N
1002702	\N	ESPASA CALPE 21	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	590 paginas	\N	\N	\N	\N	t	\N
1002703	\N	ESPASA CALPE 22	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	589 paginas	\N	\N	\N	\N	t	\N
1002704	\N	ESPASA CALPE 23	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	588 paginas	\N	\N	\N	\N	t	\N
1002705	\N	ESPASA CALPE 24	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	587 paginas	\N	\N	\N	\N	t	\N
1002706	\N	ESPASA CALPE 25	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	586 paginas	\N	\N	\N	\N	t	\N
1002707	\N	ESPASA CALPE 26	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	585 paginas	\N	\N	\N	\N	t	\N
1002708	\N	ESPASA CALPE 27	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	584 paginas	\N	\N	\N	\N	t	\N
1002709	\N	ESPASA CALPE 28	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	583 paginas	\N	\N	\N	\N	t	\N
1002710	\N	ESPASA CALPE 29	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	582 paginas	\N	\N	\N	\N	t	\N
1002711	\N	ESPASA CALPE 3	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	581 paginas	\N	\N	\N	\N	t	\N
1002712	\N	ESPASA CALPE 30	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	580 paginas	\N	\N	\N	\N	t	\N
1002713	\N	ESPASA CALPE 31	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	579 paginas	\N	\N	\N	\N	t	\N
1002714	\N	ESPASA CALPE 32	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	578 paginas	\N	\N	\N	\N	t	\N
1002715	\N	ESPASA CALPE 33	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	577 paginas	\N	\N	\N	\N	t	\N
1002716	\N	ESPASA CALPE 34	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	576 paginas	\N	\N	\N	\N	t	\N
1002717	\N	ESPASA CALPE 35	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	575 paginas	\N	\N	\N	\N	t	\N
1002718	\N	ESPASA CALPE 36	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	574 paginas	\N	\N	\N	\N	t	\N
1002719	\N	ESPASA CALPE 37	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	573 paginas	\N	\N	\N	\N	t	\N
1002720	\N	ESPASA CALPE 38	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	572 paginas	\N	\N	\N	\N	t	\N
1002721	\N	ESPASA CALPE 39	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	571 paginas	\N	\N	\N	\N	t	\N
1002722	\N	ESPASA CALPE 4	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	570 paginas	\N	\N	\N	\N	t	\N
1002723	\N	ESPASA CALPE 40	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	569 paginas	\N	\N	\N	\N	t	\N
1002724	\N	ESPASA CALPE 41	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	568 paginas	\N	\N	\N	\N	t	\N
1002725	\N	ESPASA CALPE 42	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	567 paginas	\N	\N	\N	\N	t	\N
1002726	\N	ESPASA CALPE 43	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	566 paginas	\N	\N	\N	\N	t	\N
1002727	\N	ESPASA CALPE 44	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	565 paginas	\N	\N	\N	\N	t	\N
1002728	\N	ESPASA CALPE 45	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	564 paginas	\N	\N	\N	\N	t	\N
1002729	\N	ESPASA CALPE 46	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	563 paginas	\N	\N	\N	\N	t	\N
1002730	\N	ESPASA CALPE 47	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	562 paginas	\N	\N	\N	\N	t	\N
1002731	\N	ESPASA CALPE 48	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	561 paginas	\N	\N	\N	\N	t	\N
1002732	\N	ESPASA CALPE 49	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	560 paginas	\N	\N	\N	\N	t	\N
1002733	\N	ESPASA CALPE 5	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	559 paginas	\N	\N	\N	\N	t	\N
1002734	\N	ESPASA CALPE 50	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	558 paginas	\N	\N	\N	\N	t	\N
1002735	\N	ESPASA CALPE 51	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	557 paginas	\N	\N	\N	\N	t	\N
1002736	\N	ESPASA CALPE 52	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	556 paginas	\N	\N	\N	\N	t	\N
1002737	\N	ESPASA CALPE 6	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	555 paginas	\N	\N	\N	\N	t	\N
1002738	\N	ESPASA CALPE 7	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	554 paginas	\N	\N	\N	\N	t	\N
1002739	\N	ESPASA CALPE 8	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	553 paginas	\N	\N	\N	\N	t	\N
1002740	\N	ESPASA CALPE 9	\N	\N	\N	\N	\N	LABRUSA 670	Historia	\N	\N	552 paginas	\N	\N	\N	\N	t	\N
1002741	\N	Espasa calpe tomo 1	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	551 paginas	\N	\N	\N	\N	t	\N
1002742	\N	Espasa calpe tomo 10	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	550 paginas	\N	\N	\N	\N	t	\N
1002743	\N	Espasa calpe tomo 11	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	549 paginas	\N	\N	\N	\N	t	\N
1002744	\N	Espasa calpe tomo 12	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	548 paginas	\N	\N	\N	\N	t	\N
1002745	\N	Espasa calpe tomo 13	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	547 paginas	\N	\N	\N	\N	t	\N
1002746	\N	Espasa calpe tomo 14	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	546 paginas	\N	\N	\N	\N	t	\N
1002747	\N	Espasa calpe tomo 15	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	545 paginas	\N	\N	\N	\N	t	\N
1002748	\N	Espasa calpe tomo 16	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	544 paginas	\N	\N	\N	\N	t	\N
1002749	\N	Espasa calpe tomo 17	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	543 paginas	\N	\N	\N	\N	t	\N
1002750	\N	Espasa calpe tomo 18	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	542 paginas	\N	\N	\N	\N	t	\N
1002751	\N	Espasa calpe tomo 19	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	541 paginas	\N	\N	\N	\N	t	\N
1002752	\N	Espasa calpe tomo 2	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	540 paginas	\N	\N	\N	\N	t	\N
1002753	\N	Espasa calpe tomo 20	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	539 paginas	\N	\N	\N	\N	t	\N
1002754	\N	Espasa calpe tomo 3	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	538 paginas	\N	\N	\N	\N	t	\N
1002755	\N	Espasa calpe tomo 4	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	537 paginas	\N	\N	\N	\N	t	\N
1002756	\N	Espasa calpe tomo 5	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	536 paginas	\N	\N	\N	\N	t	\N
1002757	\N	Espasa calpe tomo 6	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	535 paginas	\N	\N	\N	\N	t	\N
1002758	\N	Espasa calpe tomo 7	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	534 paginas	\N	\N	\N	\N	t	\N
1002759	\N	Espasa calpe tomo 8	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	533 paginas	\N	\N	\N	\N	t	\N
1002760	\N	Espasa calpe tomo 9	\N	\N	\N	\N	\N	ESPASA CALPE S.A.	Diccionario	\N	\N	532 paginas	\N	\N	\N	\N	t	\N
1002761	\N	ESPECIAL DE DECORACION DE TORTAS	El libro de oro de mama	\N	\N	\N	\N	\N	Gastronomia /Folleto	\N	\N	531 paginas	\N	\N	\N	\N	t	\N
1002762	\N	Especial de Panificación	Importadora y Editora Nuevo Perú	\N	\N	\N	\N	\N	Gastronomia	\N	\N	530 paginas	\N	\N	\N	\N	t	\N
1002763	Gastronomia	ESPECIAL RECETAS DE COCINA- COCINA DE INVIERNO: CÁLIDA Y SABROSA	Julio Bou	\N	\N	\N	\N	HYMSA	Revista	Español	Revista	241 paginas	Primera Edicion	Madrid	1994	\N	t	\N
1002764	Gastronomia	ESPECIAL RECETAS DE COCINA- COCINA DE PRIMAVERA-VERANO	Julio Bou	\N	\N	\N	\N	HYMSA	Revista	Español	Revista	241 paginas	Primera Edicion	Madrid	1994	\N	t	\N
1002765	Gastronomia	ESPECIAL RECETAS DE COCINA-LA MEJOR COCINA PARA EL VERANO	Julio Bou	\N	\N	\N	\N	HYMSA	Revista	Español	Revista	241 paginas	Primera Edicion	Madrid	1994	\N	t	\N
1002766	\N	ESTUDIO COURRET (2 LIBROS)	HERMAN SCHWARZ	\N	\N	\N	\N	\N	Libro	\N	\N	526 paginas	\N	\N	\N	\N	t	\N
1002767	\N	European Jewellery	Ernle Bradford	\N	\N	\N	\N	\N	Artes	\N	\N	525 paginas	\N	\N	\N	\N	t	\N
1002768	\N	EXERCISES	\N	\N	\N	\N	\N	\N	LIBRO	\N	\N	524 paginas	\N	\N	\N	\N	t	\N
1002769	\N	EY Building a better working world\r\n Las asociaciones Publico- Privadas y el desafio global en infraestructura	\N	\N	\N	\N	\N	\N	\N	\N	\N	523 paginas	\N	\N	\N	\N	t	\N
1002770	\N	FABULOUS-SOUPS	Johna Blinn	\N	\N	\N	\N	Malvina G. Vogel	Gastronomia	\N	\N	522 paginas	\N	\N	\N	\N	t	\N
1002771	\N	Fanal 5to grado	Lino, luz y Luis	\N	\N	\N	\N	MONTERRICO SA	Enciclopedia	Español	Libro	521 paginas	Segunda idicion	Lima-Peru	1985	\N	t	\N
1002772	\N	FASCICULOS	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	\N	Gastronomia	\N	\N	520 paginas	\N	\N	\N	\N	t	\N
1002773	\N	FESTIVE CHRISTMAS COOKIES	ANONIMO	\N	\N	\N	1-4127-2301-9	LW Press	Gastronomia	\N	\N	519 paginas	\N	\N	\N	\N	t	\N
1002774	\N	Fiber Arts	Diane Philippoff Maurer	\N	\N	\N	\N	\N	Artes	\N	\N	518 paginas	\N	\N	\N	\N	t	\N
1002775	\N	Figure Drawing	Nathan Goldstein	\N	\N	\N	ISBN 0-13-314518-2	\N	Artes	\N	\N	517 paginas	\N	\N	\N	\N	t	\N
1002776	\N	FILOSOFÍA-UNA GUÍA GRÁFICA DE LA \r\n HISTORIA DEL PENSAMIENTO	Dave Robinson- Judy Groves	\N	\N	\N	\N	\N	Literatura/Obras	\N		516 paginas	\N	\N	\N	\N	t	\N
1002777	\N	FINANCIAL INCLUSIÓN & RURAL DEVELOPMENT	\N	\N	\N	\N	\N	\N	Revista	\N	\N	515 paginas	\N	\N	\N	\N	t	\N
1002919	\N	La aventura del Mar 3	\N	\N	\N	\N	\N	EDICIONES FOLIO SA	\N	\N	\N	373 paginas	\N	\N	\N	\N	t	\N
1002778	\N	F-ODM Fondo para el logro de los ODM\r\n Plan Regional de Empleo Juvenil 2011 - 2014	\N	\N	\N	\N	\N	\N	\N	\N	\N	514 paginas	\N	\N	\N	\N	t	\N
1002779	\N	French country cooking	Elizabeth David	\N	\N	\N	\N	\N	Gastronomia	\N	\N	513 paginas	\N	\N	\N	\N	t	\N
1002780	\N	FRUTAS EN LICOR , Fasciculo	Santa Isabel	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	512 paginas	\N	\N	\N	\N	t	\N
1002781	\N	Gan@mas/Número 53/Setiembre - Octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	511 paginas	\N	\N	\N	\N	t	\N
1002782	\N	Gana Más, Año 6 N°68 Diciembre-Enero 2020	Oscar Gonzales Estrada	\N	\N	\N	\N	EY building a better working world	Revista	Español	Revista	 50 paginas	-	Lima	2020	\N	t	\N
1002783	\N	GEOGRAFIA UNIVERSAL ILUSTRADA	\N	\N	\N	\N	\N	ABRIL. NOGUER. RIZZOLI	GEOGRAFIA	\N	\N	509 paginas	\N	\N	\N	\N	t	\N
1002784	\N	German Coocking	Edda Meyer - Berkhout	\N	\N	\N	ISBN 0-89586-279-4	\N	Gastronomia	\N	\N	508 paginas	\N	\N	\N	\N	t	\N
1002785	\N	Gestion N° 71, octubre 2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	507 paginas	\N	\N	\N	\N	t	\N
1002786	\N	Gestion N° 72, noviembre 2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	506 paginas	\N	\N	\N	\N	t	\N
1002787	\N	Gestion N° 73, diciembre 2016, Generacion CEO	\N	\N	\N	\N	\N	\N	\N	\N	\N	505 paginas	\N	\N	\N	\N	t	\N
1002788	\N	Gestion N° 78, mayo 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	504 paginas	\N	\N	\N	\N	t	\N
1002789	\N	Gestion N° 79, junio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	503 paginas	\N	\N	\N	\N	t	\N
1002790	\N	Gestion N° 80, julio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	502 paginas	\N	\N	\N	\N	t	\N
1002791	\N	GESTION N° 84 Noviembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	501 paginas	\N	\N	\N	\N	t	\N
1002792	\N	GESTION N° 85 Diciembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	500 paginas	\N	\N	\N	\N	t	\N
1002793	\N	GESTION N° 88 Marzo 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	499 paginas	\N	\N	\N	\N	t	\N
1002794	\N	GESTION N° 90 de mayo 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	498 paginas	\N	\N	\N	\N	t	\N
1002795	\N	GESTION N° 91 de junio del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	497 paginas	\N	\N	\N	\N	t	\N
1002796	\N	GESTION N° 94 de septiembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	496 paginas	\N	\N	\N	\N	t	\N
1002797	\N	Good Cooking	Bridget Jobes	\N	\N	\N	ISBN 0-600-32507-5	HAMLYN	Gastronomia	\N	\N	495 paginas	\N	\N	\N	\N	t	\N
1002798	\N	GOURMET LATINO Nº 14	\N	\N	\N	\N	\N	\N	Revista	\N	\N	494 paginas	\N	\N	\N	\N	t	\N
1002799	\N	GOURMET LATINO "CHEF EN LA CIUDAD LA VOCACIÓN SEGÚN MARILÚ MADUEÑO"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	493 paginas	\N	\N	\N	\N	t	\N
1002800	\N	GOURMET LATINO "CHEF EN LA CIUDAD MARISA GUIULFO"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	492 paginas	\N	\N	\N	\N	t	\N
1002801	\N	GOURMET LATINO "CHEF EN LA CIUDAD"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	491 paginas	\N	\N	\N	\N	t	\N
1002802	\N	GOURMET LATINO "CHEF EN LA CIUDAD"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	490 paginas	\N	\N	\N	\N	t	\N
1002803	\N	GOURMET LATINO "CUANTA PASTA!"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	489 paginas	\N	\N	\N	\N	t	\N
1002804	\N	GOURMET LATINO "DE BOCA EN BOCA FRUTAS: SEDUCTORAS Y EXÓTICAS"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	488 paginas	\N	\N	\N	\N	t	\N
1002805	\N	GOURMET LATINO "LA HERRAMIENTA ACERO INOLVIDABLE Y SILICONA MÁGICA"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	487 paginas	\N	\N	\N	\N	t	\N
1002806	\N	GOURMET LATINO "LA VIDA ES DULCE CHOCOLATE: OSCURO OBJETO DEL DESEO"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	486 paginas	\N	\N	\N	\N	t	\N
1002807	\N	GOURMET LATINO "PAN DE VIDA"	\N	\N	\N	\N	\N	\N	Revista	\N	\N	485 paginas	\N	\N	\N	\N	t	\N
1002808	\N	Gourmet Latino N° 13	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	484 paginas	\N	\N	\N	\N	t	\N
1002809	\N	Gourmet Paris	Emmanuel Rubín	\N	\N	\N	ISBN 2-08013-657-7	\N	Gastronomia	\N	\N	483 paginas	\N	\N	\N	\N	t	\N
1002810	\N	Gran Colección de Informatica XP (12 tomos)	Planeta de Agostini	\N	\N	\N	\N	\N	Computacion	\N	\N	482 paginas	\N	\N	\N	\N	t	\N
1002811	\N	Gran Recetario del Bar	Luis Zarate Quiñones	\N	\N	\N	\N	Luis Zarate Quiñones	Gastronomia	\N	\N	481 paginas	\N	\N	\N	\N	t	\N
1002812	\N	GRAU	\N	\N	\N	\N	ISBN 978-612-46349-0-1	\N	Cultura/Historia	\N	\N	480 paginas	\N	\N	\N	\N	t	\N
1002813	\N	Guía del Prado	Silex	\N	\N	\N	\N	\N	Artes	\N	\N	479 paginas	\N	\N	\N	\N	t	\N
1002814	\N	Guía practica de fitoterapia	Antonio Campi G.	\N	\N	\N	\N	MIRBET	Libro	\N	\N	478 paginas	\N	\N	\N	\N	t	\N
1002815	\N	GUINNESS WORDS RECORD 2011	Planeta	\N	\N	\N	\N	\N	Entretenimiento/Revista	\N	\N	477 paginas	\N	\N	\N	\N	t	\N
1002816	Gastronomia	GUSTOS Y SABORES "SATIPEÑOS PARA EL MUNDO"	Liz Casallo Lopez	\N	\N	\N	\N	-	Recetas	Español	Revistas	476 paginas	Primera edicion	Junin	2010	\N	t	\N
1002817	\N	HABLEMOS DE NUESTRA AMERICA	SAMUEL EDUARDO QUENZA	\N	\N	\N	\N	MINISTERIO DE EDUCACION	REVISTA	\N	\N	475 paginas	\N	\N	\N	\N	t	\N
1002818	\N	Hagalo ud. Mismo	\N	\N	\N	\N	\N	SALVAT	Entretenimiento/Libro	\N	\N	474 paginas	\N	\N	\N	\N	t	\N
1002819	\N	Harvard Business Review	\N	\N	\N	\N	\N	DEUSTO S.A. (10 Libros)	Administración	\N	\N	473 paginas	\N	\N	\N	\N	t	\N
1002820	\N	Harvard Health Publications	\N	\N	\N	\N	\N	IMPACT MEDIA (12 tomos)	Administración	\N	\N	472 paginas	\N	\N	\N	\N	t	\N
1002821	\N	HELADOS	ANONIMO	\N	\N	\N	\N	\N	Gastronomia	\N	\N	471 paginas	\N	\N	\N	\N	t	\N
1002822	\N	Historia de la humanidad LAROUSE 1	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	470 paginas	\N	\N	\N	\N	t	\N
1002823	\N	Historia de la humanidad LAROUSE 10	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	469 paginas	\N	\N	\N	\N	t	\N
1002824	\N	Historia de la humanidad LAROUSE 11	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	468 paginas	\N	\N	\N	\N	t	\N
1002825	\N	Historia de la humanidad LAROUSE 12	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	467 paginas	\N	\N	\N	\N	t	\N
1002826	\N	Historia de la humanidad LAROUSE 13	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	466 paginas	\N	\N	\N	\N	t	\N
1002827	\N	Historia de la humanidad LAROUSE 14	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	465 paginas	\N	\N	\N	\N	t	\N
1002828	\N	Historia de la humanidad LAROUSE 15	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	464 paginas	\N	\N	\N	\N	t	\N
1002829	\N	Historia de la humanidad LAROUSE 16	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	463 paginas	\N	\N	\N	\N	t	\N
1002830	\N	Historia de la humanidad LAROUSE 17	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	462 paginas	\N	\N	\N	\N	t	\N
1002831	\N	Historia de la humanidad LAROUSE 18	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	461 paginas	\N	\N	\N	\N	t	\N
1002832	\N	Historia de la humanidad LAROUSE 2	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	460 paginas	\N	\N	\N	\N	t	\N
1002833	\N	Historia de la humanidad LAROUSE 3	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	459 paginas	\N	\N	\N	\N	t	\N
1002834	\N	Historia de la humanidad LAROUSE 4	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	458 paginas	\N	\N	\N	\N	t	\N
1002835	\N	Historia de la humanidad LAROUSE 5	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	457 paginas	\N	\N	\N	\N	t	\N
1002836	\N	Historia de la humanidad LAROUSE 6	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	456 paginas	\N	\N	\N	\N	t	\N
1002837	\N	Historia de la humanidad LAROUSE 7	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	455 paginas	\N	\N	\N	\N	t	\N
1002838	\N	Historia de la humanidad LAROUSE 8	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	454 paginas	\N	\N	\N	\N	t	\N
1002839	\N	Historia de la humanidad LAROUSE 9	\N	\N	\N	\N	\N	MORGAN IMPRESORES SA	Enciclopedia	\N	\N	453 paginas	\N	\N	\N	\N	t	\N
1002840	\N	HISTORIA DE LA PRESIDENCIA DEL \r\n CONSEJO DE MINISTROS TOMO I	Enrique Silvestre Garcia Vega\r\n Jose Francisco Galvez Montero	\N	\N	\N	Biblioteca Nacional del Peru \r\n N° 2016-07290	\N	Cultura	\N	\N	452 paginas	\N	\N	\N	\N	t	\N
1002841	\N	HISTORIA DE LA PRESIDENCIA DEL \r\n CONSEJO DE MINISTROS TOMO II	Enrique Silvestre Garcia Vega\r\n Jose Francisco Galvez Montero	\N	\N	\N	Biblioteca Nacional del Peru \r\n N° 2016-07290	\N	Cultura	\N	\N	451 paginas	\N	\N	\N	\N	t	\N
1002842	\N	historia del peru	\N	\N	\N	\N	\N	comercio	\N	\N	\N	450 paginas	\N	\N	\N	\N	t	\N
1002843	\N	Historia del Perú	Cesar S. Vaquez Chavez	\N	\N	\N	\N	\N	Historia	\N	\N	449 paginas	\N	\N	\N	\N	t	\N
1002844	\N	Historia del Perú (12 tomos)	Juan Mejía Baca	\N	\N	\N	\N	\N	Historia	\N	\N	448 paginas	\N	\N	\N	\N	t	\N
1002845	\N	Historia del Perú I	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	447 paginas	\N	\N	\N	\N	t	\N
1002846	\N	Historia del Perú II	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	446 paginas	\N	\N	\N	\N	t	\N
1002847	\N	Historia del Perú III	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	445 paginas	\N	\N	\N	\N	t	\N
1002848	\N	Historia del Perú IV	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	444 paginas	\N	\N	\N	\N	t	\N
1002849	\N	Historia del Perú IX	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	443 paginas	\N	\N	\N	\N	t	\N
1002850	\N	Historia del Perú V	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	442 paginas	\N	\N	\N	\N	t	\N
1002851	\N	Historia del Perú VI	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	441 paginas	\N	\N	\N	\N	t	\N
1002852	\N	Historia del Perú VII	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	440 paginas	\N	\N	\N	\N	t	\N
1002853	\N	Historia del Perú VIII	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	439 paginas	\N	\N	\N	\N	t	\N
1002854	\N	Historia del Perú X	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	438 paginas	\N	\N	\N	\N	t	\N
1002855	\N	Historia del Perú XI	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	437 paginas	\N	\N	\N	\N	t	\N
1002856	\N	Historia del Perú XII	\N	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	436 paginas	\N	\N	\N	\N	t	\N
1002857	\N	Historia General de América 1	Luis Alberto Sanchez	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	435 paginas	\N	\N	\N	\N	t	\N
1002858	\N	Historia General de América 2	Luis Alberto Sanchez	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	434 paginas	\N	\N	\N	\N	t	\N
1002859	\N	Historia General de América 3	Luis Alberto Sanchez	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	433 paginas	\N	\N	\N	\N	t	\N
1002860	\N	Historia General de América 4	Luis Alberto Sanchez	\N	\N	\N	\N	JUAN MEJIA BACA	Historia	\N	\N	432 paginas	\N	\N	\N	\N	t	\N
1002861	\N	Historia Universal	\N	\N	\N	\N	\N	ATLAS (3 TOMOS)	Historia	\N	\N	431 paginas	\N	\N	\N	\N	t	\N
1002862	\N	Historia Universal (16 tomos)	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	430 paginas	\N	\N	\N	\N	t	\N
1002863	\N	Historia Universal 1	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	429 paginas	\N	\N	\N	\N	t	\N
1002864	\N	Historia Universal 10	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	428 paginas	\N	\N	\N	\N	t	\N
1002865	\N	Historia Universal 11	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	427 paginas	\N	\N	\N	\N	t	\N
1002866	\N	Historia Universal 12	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	426 paginas	\N	\N	\N	\N	t	\N
1002867	\N	Historia Universal 13	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	425 paginas	\N	\N	\N	\N	t	\N
1002868	\N	Historia Universal 14	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	424 paginas	\N	\N	\N	\N	t	\N
1002869	\N	Historia Universal 15	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	423 paginas	\N	\N	\N	\N	t	\N
1002870	\N	Historia Universal 16	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	422 paginas	\N	\N	\N	\N	t	\N
1002871	\N	Historia Universal 17	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	421 paginas	\N	\N	\N	\N	t	\N
1002872	\N	Historia Universal 18	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	420 paginas	\N	\N	\N	\N	t	\N
1002873	\N	Historia Universal 19	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	419 paginas	\N	\N	\N	\N	t	\N
1002874	\N	Historia Universal 2	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	418 paginas	\N	\N	\N	\N	t	\N
1002875	\N	Historia Universal 20	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	417 paginas	\N	\N	\N	\N	t	\N
1002876	\N	Historia Universal 21	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	416 paginas	\N	\N	\N	\N	t	\N
1002877	\N	Historia Universal 22	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	415 paginas	\N	\N	\N	\N	t	\N
1002878	\N	Historia Universal 23	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	414 paginas	\N	\N	\N	\N	t	\N
1002879	\N	Historia Universal 24	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	413 paginas	\N	\N	\N	\N	t	\N
1002880	\N	Historia Universal 25	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	412 paginas	\N	\N	\N	\N	t	\N
1002881	\N	Historia Universal 26	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	411 paginas	\N	\N	\N	\N	t	\N
1002882	\N	Historia Universal 27	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	410 paginas	\N	\N	\N	\N	t	\N
1002883	\N	Historia Universal 28	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	409 paginas	\N	\N	\N	\N	t	\N
1002884	\N	Historia Universal 29	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	408 paginas	\N	\N	\N	\N	t	\N
1002885	\N	Historia Universal 3	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	407 paginas	\N	\N	\N	\N	t	\N
1002886	\N	Historia Universal 30	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	406 paginas	\N	\N	\N	\N	t	\N
1002887	\N	Historia Universal 31	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	405 paginas	\N	\N	\N	\N	t	\N
1002888	\N	Historia Universal 32	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	404 paginas	\N	\N	\N	\N	t	\N
1002889	\N	Historia Universal 33	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	403 paginas	\N	\N	\N	\N	t	\N
1002890	\N	Historia Universal 34	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	402 paginas	\N	\N	\N	\N	t	\N
1002891	\N	Historia Universal 35	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	401 paginas	\N	\N	\N	\N	t	\N
1002892	\N	Historia Universal 36	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	400 paginas	\N	\N	\N	\N	t	\N
1002893	\N	Historia Universal 37	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	399 paginas	\N	\N	\N	\N	t	\N
1002894	\N	Historia Universal 38	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	398 paginas	\N	\N	\N	\N	t	\N
1002895	\N	Historia Universal 39	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	397 paginas	\N	\N	\N	\N	t	\N
1002896	\N	Historia Universal 4	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	396 paginas	\N	\N	\N	\N	t	\N
1002897	\N	Historia Universal 5	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	395 paginas	\N	\N	\N	\N	t	\N
1002898	\N	Historia Universal 6	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	394 paginas	\N	\N	\N	\N	t	\N
1002899	\N	Historia Universal 7	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	393 paginas	\N	\N	\N	\N	t	\N
1002900	\N	Historia Universal 8	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	392 paginas	\N	\N	\N	\N	t	\N
1002901	\N	Historia Universal 9	C. Grimberg	\N	\N	\N	\N	SANTIAGO LIMITADA	Historia	\N	\N	391 paginas	\N	\N	\N	\N	t	\N
1002902	\N	Historia Universal: 1 Los orígenes	\N	\N	\N	\N	\N	\N	Historia	\N	\N	390 paginas	\N	\N	\N	\N	t	\N
1002903	\N	Historia Universal: Los orígenes	SALVAT	\N	\N	\N	\N	\N	Historia	\N	\N	389 paginas	\N	\N	\N	\N	t	\N
1002904	\N	Horas de Lucha	Manuel Gonzales Prada	\N	\N	\N	\N	INCA SA	Literatura	\N	\N	388 paginas	\N	\N	\N	\N	t	\N
1002905	\N	I Miei Menú	\N	\N	\N	\N	\N	MILANO	Gastronomia	\N	\N	387 paginas	\N	\N	\N	\N	t	\N
1002906	\N	IGNACIO MERINO (2 LIBROS)	RICARDO KUSUNOKI RODRIGUEZ	\N	\N	\N	\N	\N	Libro	\N	\N	386 paginas	\N	\N	\N	\N	t	\N
1002907	\N	IL QUADERNO DELLE NOSTRE GRAPPE	LOCO DI SARMEDE	\N	\N	\N	\N	KELLERMANN	REVISTA	\N	\N	385 paginas	\N	\N	\N	\N	t	\N
1002908	\N	iMiei Menú	\N	\N	\N	\N	\N	MILANO	\N	\N	\N	384 paginas	\N	\N	\N	\N	t	\N
1002909	\N	Informe de Sostenibilidad 2016	MMG/LAS BAMBAS	\N	\N	\N	\N	\N	Revista	\N	\N	383 paginas	\N	\N	\N	\N	t	\N
1002910	\N	Iridian Art	Octopus Books	\N	\N	\N	\N	\N	Artes	\N	\N	382 paginas	\N	\N	\N	\N	t	\N
1002911	\N	Je sais Cuisiner	Ginette Mathiot	\N	\N	\N	\N	\N	Gastronomia	\N	\N	381 paginas	\N	\N	\N	\N	t	\N
1002912	\N	JUICIO PRECIPITADO	MARK LANE	\N	\N	\N	\N	TAURUS	\N	\N	\N	380 paginas	\N	\N	\N	\N	t	\N
1002913	\N	Junior Achievement Perú, ¡Deja que su éxito sea una inspiracion!	\N	\N	\N	\N	\N	\N	\N	\N	\N	379 paginas	\N	\N	\N	\N	t	\N
1002914	\N	Junior Achievement Perú, Pequeños visionarios, grandes emprendedores	\N	\N	\N	\N	\N	\N	\N	\N	\N	378 paginas	\N	\N	\N	\N	t	\N
1002915	\N	KIDS FAVORITE CHRISTMAS COOKIES	ANONIMO	\N	\N	\N	1-4127-2303-5	\N	Gastronomia	\N	\N	377 paginas	\N	\N	\N	\N	t	\N
1002916	\N	KUNA-FW 2018-19	\N	\N	\N	\N	\N	\N	Revista	\N	\N	376 paginas	\N	\N	\N	\N	t	\N
1002917	\N	LA ASTRONOMIA MODERNA	Alfonso Perez De Laborda	\N	\N	\N	Tomo II: 84-7490-100-6	\N	\N	\N	\N	375 paginas	\N	\N	\N	\N	t	\N
1002918	\N	La Autoridad de los padres	Edistio Cámere	\N	\N	\N	\N	\N	Libro	\N	\N	374 paginas	\N	\N	\N	\N	t	\N
1002920	\N	La buena noticia de la familia	\N	\N	\N	\N	\N	\N	folleto	\N	\N	372 paginas	\N	\N	\N	\N	t	\N
1002921	\N	La ciudad Inca de Machu Picchu	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	371 paginas	\N	\N	\N	\N	t	\N
1002922	\N	La cocina Criolla	Gadstón Acurio	\N	\N	\N	\N	EL COMERCIO	Gastronomia	\N	\N	370 paginas	\N	\N	\N	\N	t	\N
1002923	\N	La cocina criolla 1	Gastón Acurio Jaramillo	\N	\N	\N	\N	ORBIS VENTURE SAC	\N	\N	\N	369 paginas	\N	\N	\N	\N	t	\N
1002924	\N	La cocina de Gastón Acurio 1	Gastón Acurio Jaramillo	\N	\N	\N	\N	ORBIS VENTURE SAC	Gastronomía	\N	\N	368 paginas	\N	\N	\N	\N	t	\N
1002925	\N	La cocina de Gastón Acurio 10	Gastón Acurio Jaramillo	\N	\N	\N	\N	ORBIS VENTURE SAC	Gastronomía	\N	\N	367 paginas	\N	\N	\N	\N	t	\N
1002926	\N	LA COCINA DE LA ABUELA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-115-7	\N	Gastronomia	\N	\N	366 paginas	\N	\N	\N	\N	t	\N
1002927	\N	La cocina de Utilísima- Cocina Mexicana	\N	\N	\N	\N	\N	\N	Revista	\N	\N	365 paginas	\N	\N	\N	\N	t	\N
1002928	\N	La cocina de Utilísima-Recetas Dulces y saladas para pascuas	\N	\N	\N	\N	\N	\N	Revista	\N	\N	364 paginas	\N	\N	\N	\N	t	\N
1002929	\N	La cocina por microondas para la vida de hoy	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	363 paginas	\N	\N	\N	\N	t	\N
1002930	\N	La crónica del Perú 1	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	362 paginas	\N	\N	\N	\N	t	\N
1002931	\N	La crónica del Perú 10	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	361 paginas	\N	\N	\N	\N	t	\N
1002932	\N	La crónica del Perú 11	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	360 paginas	\N	\N	\N	\N	t	\N
1002933	\N	La crónica del Perú 12	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	359 paginas	\N	\N	\N	\N	t	\N
1002934	\N	La crónica del Perú 13	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	358 paginas	\N	\N	\N	\N	t	\N
1002935	\N	La crónica del Perú 14	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	357 paginas	\N	\N	\N	\N	t	\N
1002936	\N	La crónica del Perú 15	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	356 paginas	\N	\N	\N	\N	t	\N
1002937	\N	La crónica del Perú 16	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	355 paginas	\N	\N	\N	\N	t	\N
1002938	\N	La crónica del Perú 17	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	354 paginas	\N	\N	\N	\N	t	\N
1002939	\N	La crónica del Perú 18	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	353 paginas	\N	\N	\N	\N	t	\N
1002940	\N	La crónica del Perú 19	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	352 paginas	\N	\N	\N	\N	t	\N
1002941	\N	La crónica del Perú 2	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	351 paginas	\N	\N	\N	\N	t	\N
1002942	\N	La crónica del Perú 20	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	350 paginas	\N	\N	\N	\N	t	\N
1002943	\N	La crónica del Perú 21	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	349 paginas	\N	\N	\N	\N	t	\N
1002944	\N	La crónica del Perú 22	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	348 paginas	\N	\N	\N	\N	t	\N
1002945	\N	La crónica del Perú 23	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	347 paginas	\N	\N	\N	\N	t	\N
1002946	\N	La crónica del Perú 24	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	346 paginas	\N	\N	\N	\N	t	\N
1002947	\N	La crónica del Perú 25	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	345 paginas	\N	\N	\N	\N	t	\N
1002948	\N	La crónica del Perú 26	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	344 paginas	\N	\N	\N	\N	t	\N
1002949	\N	La crónica del Perú 27	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	343 paginas	\N	\N	\N	\N	t	\N
1002950	\N	La crónica del Perú 28	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	342 paginas	\N	\N	\N	\N	t	\N
1002951	\N	La crónica del Perú 29	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	341 paginas	\N	\N	\N	\N	t	\N
1002952	\N	La crónica del Perú 3	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	340 paginas	\N	\N	\N	\N	t	\N
1002953	\N	La crónica del Perú 30	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	339 paginas	\N	\N	\N	\N	t	\N
1002954	\N	La crónica del Perú 31	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	338 paginas	\N	\N	\N	\N	t	\N
1002955	\N	La crónica del Perú 32	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	337 paginas	\N	\N	\N	\N	t	\N
1002956	\N	La crónica del Perú 33	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	336 paginas	\N	\N	\N	\N	t	\N
1002957	\N	La crónica del Perú 34	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	335 paginas	\N	\N	\N	\N	t	\N
1002958	\N	La crónica del Perú 35	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	334 paginas	\N	\N	\N	\N	t	\N
1002959	\N	La crónica del Perú 36	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	333 paginas	\N	\N	\N	\N	t	\N
1002960	\N	La crónica del Perú 37	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	332 paginas	\N	\N	\N	\N	t	\N
1002961	\N	La crónica del Perú 38	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	331 paginas	\N	\N	\N	\N	t	\N
1002962	\N	La crónica del Perú 39	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	330 paginas	\N	\N	\N	\N	t	\N
1002963	\N	La crónica del Perú 4	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	329 paginas	\N	\N	\N	\N	t	\N
1002964	\N	La crónica del Perú 40	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	328 paginas	\N	\N	\N	\N	t	\N
1002965	\N	La crónica del Perú 42	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	327 paginas	\N	\N	\N	\N	t	\N
1002966	\N	La crónica del Perú 43	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	326 paginas	\N	\N	\N	\N	t	\N
1002967	\N	La crónica del Perú 45	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	325 paginas	\N	\N	\N	\N	t	\N
1002968	\N	La crónica del Perú 5	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	324 paginas	\N	\N	\N	\N	t	\N
1002969	\N	La crónica del Perú 6	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	323 paginas	\N	\N	\N	\N	t	\N
1002970	\N	La crónica del Perú 7	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	322 paginas	\N	\N	\N	\N	t	\N
1002971	\N	La crónica del Perú 8	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	321 paginas	\N	\N	\N	\N	t	\N
1002972	\N	La crónica del Perú 9	Pedro Cieza de Leon	\N	\N	\N	\N	INCA SA	HIstoria	\N	\N	320 paginas	\N	\N	\N	\N	t	\N
1002973	\N	La divina comida " Papas, maiz, granos, menestras"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 paginas	-	Lima	2003	Platos emblemáticos. Carapulca. Olluquito con charqui. Causa. Cortes y consejos. Tamalito. Papa rellena. Recetas. Entradas. Caldillo de papas. Camotes glaseados. Capchi de queso y papas. Cassoulet de pescado. Causa colonial con escabeche de camarones. Causa de atún. Choclos en salsa de palta. Chupe de habas. Crema de choclo. Crema de lentejas. Enrrollado de papa y paté. Ensalada de lentejas. Ensalada de pallares. Ensalada de papa a la rusa. Ensalada de quinua. Papas a la crema. Papas a la huancaína. Papas con maní. Papas con ocopa arequipeña. Papas rellenas con carne. Pastel cremoso de choclo. Pastel de papa. Puré de camote y naranja. Puré de pallares. Quinua aromática. Revuelto de choclo. Solterito de habas. Sopa de quinua. Tamalitos verdes. Yuquitas fritas con huacatay. Olluquitas rellenas. Segundos. Carapulca con medallón de lechón. Frejoles a la Casilda. Frejoles batidos escabechados. Garbanzos con pimientos. Ñoquis a la napolitana. Olluquito con carne. Shambar a la norteña. Tacu tacu de frejoles negros. Trigo guisado.	t	\N
1002995	\N	La salute dalla Farmacia del Signore	Maria Treben	\N	\N	\N	\N	AUSTRIA	Revistas	\N	\N	297 paginas	\N	\N	\N	\N	t	\N
1002996	\N	La tumba de Tutankamón	\N	\N	\N	\N	\N	\N	\N	\N	\N	296 paginas	\N	\N	\N	\N	t	\N
1002997	\N	La vida secreta de Jesús	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	295 paginas	\N	\N	\N	\N	t	\N
1002998	\N	LA VOCACIÓN EMPRESARIAL	Padre Robert A. Sirico.	\N	\N	\N	\N	ACTON INSTITUTE	Libro	\N	\N	294 paginas	\N	\N	\N	\N	t	\N
1002999	\N	L'Amore Misericordioso	\N	\N	\N	\N	\N	COLLEVALENZA	Cristianismo	\N	\N	293 paginas	\N	\N	\N	\N	t	\N
1003000	\N	Landscape painting ¡n oil	Wendon Blake	\N	\N	\N	\N	\N	Artes	\N	\N	292 paginas	\N	\N	\N	\N	t	\N
1002974	\N	La divina comida "Ajies, Ajiacos, Huevos"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 paginas	-	Lima	2003	Platos emblemáticos. Caigua rellena. Ajiaco de papas. Picantes. Cortes y consejos. Salsa de ají verde. Huevos escalfados. Recetas. Ají de atún. Ají de pulpo al tomate. Ají verde relleno. Ajiaco de habas tiernas. Ajiaco de ollucos. Ajiacos de papa amarilla y camarones. Ajiaco de papa y camote. Ajiaco de papas. Ajíes rellenos con carne. Camarones al ají. Camaroncitos en mantequilla de rocoto. Conchitas en mantequilla de rocoto. Crema de ají. Enrrollado de espinacas. Flan de cebollas. Flan de coles. Flan de espinacas. Huevos rellenos. Jalea de rocoto y pimientos. Langostinos al ají. Omelette criolla de poros. Pato con ají. Pescado en salsa de rocoto y pimientos. Picante de caigua. Picante de camarones. Picante de cangrejos. Picante de cuy. Picante de huevos. Revuelto de vainitas con choclo y papas. Rocoto relleno con camarones. Salsa criolla. Salsa de huacatay. Salsa de rocoto. Salsa fina de ají y hierbas. Soufflé de conchitas. Torrejitas de fideos. Tortilla de cebolla. Tortilla de mariscos. Tortilla de papas. Tortilla de verduras.	t	\N
1002975	\N	La divina comida "Arroces, pastas"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 paginas	-	Lima	2003	Platos emblemáticos. Arroz con pato. Menestrón. Tacu tacu. Cortes y consejos. Pasta fresca. Risotto. Recetas. Arroces. Arroz a la coca cola. Arroz a la jardinera. Arroz árabe. Arroz atamalado. Arroz blanco. Arroz chaufa. Arroz chaufa festivo. Arroz con aceitunas. Arroz con acelgas. Arroz con alcachofas. Arroz con calamares. Arroz con camarones. Arroz con mariscos. Arroz con pato. Arroz con pollo. Arros frío con mayonesa y atún. Arroz pilaf. Arroz tapado. Arroz verde con choclo. Ensalada de arroz. Juane de gallina. Risotto de camarones. Risotto de verduras. Risotto verde de cabrito. Tacu tacu de pallares. Pastas. Canelones con champiñones. Canelones de espinaca. Ensalada de pasta. Espaguetis en salsa bolognesa. Fideos con salsa roja. Lasaña de alcachofas y espárragos. Lasaña de mariscos. Menestrón de verduras. Pastel de fideos. Ravioles en salsa de carne. Tallarines con salsa de camarones. Tallarines con salsa verde. Tallarines criollos. Tallarines saltados. Tortelones en coulis de pimentón amarillo.	t	\N
1002976	\N	La divina comida "Carnes, Aves"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 paginas	-	Lima	2003	Platos emblemáticos. Lomo saltado. Cau cau. Cuy chactado. Cortes y consejos. Cortes de lomo saltado. Caldo concentrado de carne (fondo). Recetas. Entradas. Aguadito de pollo. Anticucho de corazón.  Anticucho de lomo. Butifarra. Carpaccio de res al aroma de albaca. Chicharrón de cerdo. Chicharrón de pollo. Empanadas de carne. Empanadas de pollo. Espesado. Jamón del país. Jamón glaseado con frutas. Seco de chabelo. Segundos. Adobo norteño y criollo. Ají de gallina. Ají de pato a la moda de Chepén. Asado al vino. Cau cau. Cuy chactado. Cebiche de pato. Cecina de lomo. Cerdo al limón. Estofado de conejo. Estofado de pollo. Lechón al horno. Lomo saltado especial. Lomo strogonoff. Malaya dorada. Patasca. Patitas con maní. Pavo asado. Pepián de pavo. Pierna de cerdo asado con salsa de saúco. Piernas de cordero asada. Pollo al sillao. Pollo en salsa de pimientos. Sábanas o bistec apanado. Seco de cabrito con loche. Seco de cordero. Seco de res.	t	\N
1002977	\N	La divina comida "frutas"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 páginas	-	Lima	2003	Platos emblemáticos. Chirimoya. Mazamorra morada. Cortes y consejos. Mermelada de fresas. Masa dulce para pyes. Recetas. Dulces. Bizcocho de coco. Buñuelos de manzana. Champuz limeño. Cheesecake de aguaymanto. Compota de frutas secas. Compota de melocotones. Compota de membrillos. Crema de mangos. Dulce de guayabas. Ensaladade frutras al estilo antiguo. Flan de coco. Flan de peras.  Flan de platanos. Gelatina de chirimoya. Helado de lúcuma. Higos con almíbar. Jugo de papayita arequipeña. Manjarblanco de chirimoya. Manzanas rellenas. Mazamorra morada. Merengado de chirimoya. Mermelada de fresa. Mousse de mango. Mousse de toronja. Mousse de tumbo. Pionono de lúcuma. Plátanos al pisco. Pye de fresas. Pye de limón. Pye de mamey. Pye de manzana. Soufflé  helado de limón. Torta de piña. Torta de viñedo. Torta helada de maracuyá. Salados. Carré de cerdo en salsa de peras. Cebiche de mango. Pollo a la naranja. Pollo con maracuyá. Trucha al saúco.	t	\N
1002978	\N	La divina comida "Postres"	Raul Vargas	\N	\N	\N	\N	Quebecor Worl Perú S.A.	Gastronomia	ESPAÑOL	Recetario	93 páginas	-	Lima	2003	Platos emblemáticos. Ranfañotes. Chicha morada. Cortes y consejos. Merengue. Mazamorra morada. Recetas. Alfajores con miel. Alfajores de maicena. Arroz de leche. Arroz zambito. Bavarois de chirimoya. Bienmesabe de camote. Bizcotelas. Bolitas de coco. Brownies. Budín de pan. Cake de plátano. Camotillo. Cheescake de saúco. Chicha morada. Churros. Cocadas. Crema volteada. Encanelado. Frejol colado. Galletas de mantequilla. Huevo chimbo. Huevos a la nieve. Humitas dulces. Maná. Manjarblanco de lúcuma. Mazamorra de cochino. Mazapán. Merenguitos. Milhojas. Orejitas de chancho. Picarones. Pionono de manjarblanco. Pye de lúcuma. Ranfañote. Rosquillas. Suspiro de limeña. Tejas de coco. Tortas de chocolate con fudge. Turrón de chocolate. Turrón de doña Pepa.	t	\N
1002979	\N	LA FORMACION DEL UNIVERSO	Alfonso Perez De Laborda	\N	\N	\N	Tomo III: 84-7490-101-4	\N	\N	\N	\N	313 paginas	\N	\N	\N	\N	t	\N
1002980	\N	La gran cocina AVES Y CAZA (7)	\N	\N	\N	\N	\N	EL COMERCIO	Libro	\N	\N	312 paginas	\N	\N	\N	\N	t	\N
1002981	\N	La gran cocina BANQUETES Y COCTELES (10)	\N	\N	\N	\N	\N	EL COMERCIO	Libro	\N	\N	311 paginas	\N	\N	\N	\N	t	\N
1002982	\N	La gran cocina CARNES (6)	\N	\N	\N	\N	\N	EL COMERCIO	Libro	\N	\N	310 paginas	\N	\N	\N	\N	t	\N
1002983	\N	La gran cocina CEREALES Y TUBÉRCULOS (8)	Bernando Roca Rey Miron quesada	\N	\N	\N	\N	EL COMERCIO	Gastronimoa	ESs	Recetario	181 paginas	Primera Edicion	Lima	2002	\N	t	\N
1002984	\N	La gran cocina HUEVOS QUESOS Y LÁCTEOS (4)	Francisco Graña	\N	\N	\N	\N	EL COMERCIO	Gastronomia	Español	Recetario	181 paginas	Primera Edicion	Lima	2002	\N	t	\N
1002985	Gastronomia	La gran cocina PESCADOS Y MARISCOS (5)	Antonio Cisnero	\N	\N	\N	\N	EL COMERCIO	Gastronomia	Español	Revista	177 paginas	Primrera Educion	Lima	2002	\N	t	\N
1002986	Gastronomia	La gran cocina POSTRES Y TORTAS (9)	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	EL COMERCIO	Recetas	Español	Revista	181 paginas	Primera Edicion	Lima	2002	\N	t	\N
1002987	\N	LA GRAN COCINA-PESCADOS Y MARISCOS Tomo 5	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-617-83-1	\N	Gastronomia	\N	\N	305 paginas	\N	\N	\N	\N	t	\N
1002988	\N	La Historia de la Filosofía II	\N	\N	\N	\N	\N	\N	libro	\N	\N	304 paginas	\N	\N	\N	\N	t	\N
1002989	Cristianismo	La inmaculada Concepción	-	\N	\N	\N	\N	Arzobispado de Lima Gran Misiòn	Cristianismo	Español	Libro	303 paginas	Primera	Lima	2004	Dinámica y Programa. Bula "Ineffabilis Deus". Catequesis Marianas. Novena a la Santísima Virgen María. Vigilia en Honor a la Inmaculada Concepción. Esquemas del Santo Padre.	t	\N
1002990	\N	La Medicina de la salud TOMO 4	\N	\N	\N	\N	\N	DÉESCLÉE DE BROUWER	Enciclopedia	\N	\N	302 paginas	\N	\N	\N	\N	t	\N
1002991	Formaciòn Humana	La pintura de la porcelana	Ruth Little	\N	\N	\N	\N	Federico A.P Mariotti	Artes	Español	LIBRO	264	Primera	Los Angeles	1977	\N	t	\N
1002992	\N	LA POLITICA	Aristoteles	\N	\N	\N	\N	\N	Literatura/Obras	\N	\N	300 paginas	\N	\N	\N	\N	t	\N
1002993	\N	LA REPUBLICA	Platon	\N	\N	\N	\N	\N	Literatura/Obras	\N	\N	299 paginas	\N	\N	\N	\N	t	\N
1002994	\N	La Sábana Santa y otros misterios cristianos	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	298 paginas	\N	\N	\N	\N	t	\N
1003001	\N	Larousse de la Gastronomía Peruana	Gaston Acurio	\N	\N	\N	\N	Q.W. Editores S.A.C.	Diccionario	ESPAÑOL	-	400 paginas	-	Lima	\N	\N	t	\N
1003002	\N	Las 100 Mejores Recetas TELVA	Nena Fernandez de la Riva	\N	\N	\N	\N	Covadona O'shea	\N	\N	\N	290 paginas	\N	\N	\N	\N	t	\N
1003003	\N	Las ciudades perdidas del Amazonas	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	289 paginas	\N	\N	\N	\N	t	\N
1003004	\N	Las logias masónicas	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	288 paginas	\N	\N	\N	\N	t	\N
1003005	\N	Las piramides de Egipto	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	287 paginas	\N	\N	\N	\N	t	\N
1003006	\N	Las Recetas de Molitalia	Rosa Siacova	\N	\N	\N	\N	\N	Libro	\N	\N	286 paginas	\N	\N	\N	\N	t	\N
1003007	\N	Le Cordon Blue	Cecilia Espinoza	\N	\N	\N	\N	\N	\N	\N	\N	285 paginas	\N	\N	\N	\N	t	\N
1003008	\N	Le orchidee Spontanee dí Osoppo	Luciano Regatin	\N	\N	\N	\N	\N	Revistas	\N	\N	284 paginas	\N	\N	\N	\N	t	\N
1003009	\N	Legislacion laboral EIGER	Escuela Internacional de Gerencia	\N	\N	\N	\N	\N	\N	\N	\N	283 paginas	\N	\N	\N	\N	t	\N
1003010	\N	LET'S MAKE CANDY	Wilton interprices	\N	\N	\N	IL-60517	\N	Gastronomia /Folleto	\N	\N	282 paginas	\N	\N	\N	\N	t	\N
1003011	\N	Linda Mariquita	\N	\N	\N	\N	\N	A.T.E.	Literatura/Obras	\N	\N	281 paginas	\N	\N	\N	\N	t	\N
1003012	\N	Llega el otoño	\N	\N	\N	\N	\N	A.T.E.	Literatura/Obras	\N	\N	280 paginas	\N	\N	\N	\N	t	\N
1003013	\N	Lo Mejor de la Cocina con Pollo.	\N	\N	\N	\N	\N	\N	Libro	\N	\N	279 paginas	\N	\N	\N	\N	t	\N
1003014	\N	Lo mejor de la Resposteria	Ojo	\N	\N	\N	\N	Epensa	Gastronomía	\N	\N	278 paginas	\N	\N	\N	\N	t	\N
1003015	\N	Lo Mejor de los Pescados y Mariscos	\N	\N	\N	\N	\N	\N	\N	\N	\N	277 paginas	\N	\N	\N	\N	t	\N
1003016	\N	Loncheras nutritivas	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	276 paginas	\N	\N	\N	\N	t	\N
1003017	\N	LOS ANTIGUOS ASTRONOMICOS	Alfonso Perez De Laborda	\N	\N	\N	Tomo I: 84-7490-099-9	\N	\N	\N	\N	275 paginas	\N	\N	\N	\N	t	\N
1003018	\N	los asombrosos casos en parapsicologia	\N	\N	\N	\N	\N	\N	libro	\N	\N	274 paginas	\N	\N	\N	\N	t	\N
1003019	\N	LOS BARRIOS ALTOS (2 LIBROS)	GONZALO TORRES DEL PINO	\N	\N	\N	\N	\N	Libro	\N	\N	273 paginas	\N	\N	\N	\N	t	\N
1003020	\N	LOS CEVICHES DE TUMBES A TACNA	El Comercio	\N	\N	\N	\N	El comercio	Gastronomia /Folleto	\N	\N	272 paginas	\N	\N	\N	\N	t	\N
1003021	\N	LOS DULCES "Las más tradicionales y sabrosas recetas"	Miguel J. Goñi	\N	\N	\N	\N	Nueva Lente	Libro	\N	\N	271 paginas	\N	\N	\N	\N	t	\N
1003022	\N	Los jóvenes en la Iglesia	\N	\N	\N	\N	\N	\N	folleto	\N	\N	270 paginas	\N	\N	\N	\N	t	\N
1003023	\N	Los manuscritos del Mar Muerto	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	269 paginas	\N	\N	\N	\N	t	\N
1003024	\N	Los moáis de la isla de Pascua	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	268 paginas	\N	\N	\N	\N	t	\N
1003025	\N	Los postres, dulce tradición	Gastón Acurio Jaramillo	\N	\N	\N	\N	EL COMERCIO	Gastronomía	\N	\N	267 paginas	\N	\N	\N	\N	t	\N
1003026	\N	LOS SANTOS ANGELES	SIN AUTOR	\N	\N	\N	\N	HERALDOS DEL EVANGELIO	CRISTIANISMO	\N	\N	266 paginas	\N	\N	\N	\N	t	\N
1003027	\N	Los secretos de la reposteria y la cocina FASCICULO 1	Sabina de Flores	\N	\N	\N	\N	Sabina de Flores	Gastronomia /Revistas	\N	\N	265 paginas	\N	\N	\N	\N	t	\N
1003028	\N	Los secretos de la reposteria y la cocina FASCICULO 4	Sabina de Flores	\N	\N	\N	\N	Sabina de Flores	Gastronomia /Revistas	\N	\N	264 paginas	\N	\N	\N	\N	t	\N
1003029	\N	Los ultimos dinosaurios	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	263 paginas	\N	\N	\N	\N	t	\N
1003030	\N	MACHUPICCHU Y EL ESPLENDOR DE LAS SELVAS DE MONTAÑA	WALTERH.WUST	\N	\N	\N	9972-40-274-6	PEISA S.A.C	ENCICLOPEDIA	\N	\N	262 paginas	\N	\N	\N	\N	t	\N
1003031	\N	MAGALLANES Y ELCANO-LA EMPRESA DE LA PRIMERA CIRCUNNAVEGACIÓN DEL MUNDO	RODRIGO MORENO JERIA	\N	\N	\N	\N	\N	Libro	\N	\N	261 paginas	\N	\N	\N	\N	t	\N
1003032	\N	MANUAL DE HISTORIA GENERAL DEL PERU	EUDOXIO H. ORTEGA	\N	\N	\N	\N	LOS ANDES	libro	\N	\N	260 paginas	\N	\N	\N	\N	t	\N
1003033	\N	Manual de Informatica Basica	\N	\N	\N	\N	\N	EL COMERCIO (3 libros)	Computacion	\N	\N	259 paginas	\N	\N	\N	\N	t	\N
1003034	\N	Manual de Informatica Practica	\N	\N	\N	\N	\N	EL COMERCIO	Computacion	\N	\N	258 paginas	\N	\N	\N	\N	t	\N
1003035	\N	MANUEL GONZALES PRADA	\N	\N	\N	\N	\N	\N	libro	\N	\N	257 paginas	\N	\N	\N	\N	t	\N
1003036	\N	maravillas del mundo	\N	\N	\N	\N	\N	ojo	\N	\N	\N	256 paginas	\N	\N	\N	\N	t	\N
1003037	\N	Maravillas del Peru	\N	\N	\N	\N	\N	El Comercio	Geografia	\N	\N	255 paginas	\N	\N	\N	\N	t	\N
1003038	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	254 paginas	\N	\N	\N	\N	t	\N
1003039	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	253 paginas	\N	\N	\N	\N	t	\N
1003040	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	252 paginas	\N	\N	\N	\N	t	\N
1003041	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	251 paginas	\N	\N	\N	\N	t	\N
1003042	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	250 paginas	\N	\N	\N	\N	t	\N
1003043	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	249 paginas	\N	\N	\N	\N	t	\N
1003044	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	248 paginas	\N	\N	\N	\N	t	\N
1003045	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	EDICIONES PAULINAS	Revista	\N	\N	247 paginas	\N	\N	\N	\N	t	\N
1003046	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	246 paginas	\N	\N	\N	\N	t	\N
1003047	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	245 paginas	\N	\N	\N	\N	t	\N
1003048	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	244 paginas	\N	\N	\N	\N	t	\N
1003049	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	243 paginas	\N	\N	\N	\N	t	\N
1003050	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	242 paginas	\N	\N	\N	\N	t	\N
1003051	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	241 paginas	\N	\N	\N	\N	t	\N
1003052	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	240 paginas	\N	\N	\N	\N	t	\N
1003053	\N	Marcado por el espíritu	\N	\N	\N	\N	\N	\N	Revistas	\N	\N	239 paginas	\N	\N	\N	\N	t	\N
1003054	\N	MARÍA	Jorge Isaacs	\N	\N	\N	41365	\N	Literatura/Obras	\N	\N	238 paginas	\N	\N	\N	\N	t	\N
1003055	\N	Melgar	Mauricio Novoa Cain	\N	\N	\N	ISBN 978-612-00-2297-9	\N	Literatura	\N	\N	237 paginas	\N	\N	\N	\N	t	\N
1003056	\N	MEMORIA 2019	Banco Central de Reserva del Peru	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	236 paginas	\N	\N	\N	\N	t	\N
1003057	\N	MEMORIA 2020	Banco Central de Reserva del Peru	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	235 paginas	\N	\N	\N	\N	t	\N
1003058	\N	MEMORIA 2020	Banco Central de Reserva del Peru	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	234 paginas	\N	\N	\N	\N	t	\N
1003059	\N	MEMORIA 2020	Banco Central de Reserva del Peru	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	233 paginas	\N	\N	\N	\N	t	\N
1003060	Administraciòn	MEMORIA 2021	Banco Central de Reserva del Peru	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	232 paginas	\N	\N	\N	\N	t	\N
1003061	Administraciòn	Memoria anual 2015 de Caja Arequipa	Caja Arequipa	\N	\N	\N	\N	Layconsa	Administracion	Español	Reporte de empresa	109 paginas	\N	\N	\N	CapÍtulo I: Nuestra caja 9. CapÍtulo II: Entorno económico 21. Capítulo III: resumen de la gestión del año 2015 27. Capitulo IV: Responsabilidad social y reconocimientos 24. Capítulo V: Estados finacieros auditados 53.	t	\N
1003062	Administraciòn	Memoria anual 2017 de Universidad Nacional de San Agustin	Universidad Nacional de San Agustin	\N	\N	\N	\N	-	Libro	Español	reporte universitario	203	-	Arequipa	2017	Gestión Académica. Gestión de la investigación. Gestión de la internacionallización. Gestión de la responsabilidad social. Gestión administrativa y finaciera. Facultades.	t	\N
1003063	\N	MEMORIA ANUAL DE SEAL 2017	\N	\N	\N	\N	\N	\N	BROCHURE	\N	\N	229 paginas	\N	\N	\N	\N	t	\N
1003064	\N	MEMORIA ANUAL FOCMAC 2017	\N	\N	\N	\N	\N	\N	CD	\N	\N	228 paginas	\N	\N	\N	\N	t	\N
1003065	\N	Meracdos & Regiones N°26/Arequipa, septiembre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	227 paginas	\N	\N	\N	\N	t	\N
1003066	\N	Mercado & Regiones N° 20, agosto 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	226 paginas	\N	\N	\N	\N	t	\N
1003067	\N	Mercado&Regiones n°29/arequipa, abril 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	225 paginas	\N	\N	\N	\N	t	\N
1003068	\N	MERCADOS & REGIONES N°24/AREQUIPA, ABRIL DEL 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	224 paginas	\N	\N	\N	\N	t	\N
1003069	\N	MERCADOS & REGIONES N°25/AREQUIPA, JULIO DE 2018	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	223 paginas	\N	\N	\N	\N	t	\N
1003070	\N	Mercados & Regiones n°27/Arequipa, octubre del 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	222 paginas	\N	\N	\N	\N	t	\N
1003071	\N	Mercados & Regiones, Arequipa-febrero del 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	221 paginas	\N	\N	\N	\N	t	\N
1003072	\N	Mercados & Regiones/ Numero 21, setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	220 paginas	\N	\N	\N	\N	t	\N
1003073	\N	Mercados & Regiones/ Numero 22, noviembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	219 paginas	\N	\N	\N	\N	t	\N
1003074	\N	Mercados & Regiones/ Numero 23, marzo 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	218 paginas	\N	\N	\N	\N	t	\N
1003075	\N	Mercados y Carretillas del Perú- La gran cocina popular.	Edelnor	\N	\N	\N	\N	\N	Gastronomia	\N	\N	217 paginas	\N	\N	\N	\N	t	\N
1003076	\N	Mercados&Regiones N°30/Arequipa, septiembre de 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	216 paginas	\N	\N	\N	\N	t	\N
1003077	\N	Metaforas y pergaminos de la excelencia	Miguel Angel Cornejo	\N	\N	\N	\N	\N	Revistas	\N	\N	215 paginas	\N	\N	\N	\N	t	\N
1003078	\N	Metodo Rosfevil Tomo 5, CETPRO Isabel la Catolica	\N	\N	\N	\N	\N	\N	\N	\N	\N	214 paginas	\N	\N	\N	\N	t	\N
1003079	\N	Mexican Cookery	Barbara Hansen	\N	\N	\N	\N	\N	Gastronomia	\N	\N	213 paginas	\N	\N	\N	\N	t	\N
1003080	\N	Mi primeria enciclopedia LAROUSSE 1	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	212 paginas	\N	\N	\N	\N	t	\N
1003081	\N	Mi primeria enciclopedia LAROUSSE 10	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	211 paginas	\N	\N	\N	\N	t	\N
1003082	\N	Mi primeria enciclopedia LAROUSSE 11	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	210 paginas	\N	\N	\N	\N	t	\N
1003083	\N	Mi primeria enciclopedia LAROUSSE 12	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	209 paginas	\N	\N	\N	\N	t	\N
1003084	\N	Mi primeria enciclopedia LAROUSSE 13	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	208 paginas	\N	\N	\N	\N	t	\N
1003085	\N	Mi primeria enciclopedia LAROUSSE 14	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	207 paginas	\N	\N	\N	\N	t	\N
1003086	\N	Mi primeria enciclopedia LAROUSSE 15	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	206 paginas	\N	\N	\N	\N	t	\N
1003087	\N	Mi primeria enciclopedia LAROUSSE 16	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	205 paginas	\N	\N	\N	\N	t	\N
1003088	\N	Mi primeria enciclopedia LAROUSSE 17	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	204 paginas	\N	\N	\N	\N	t	\N
1003089	\N	Mi primeria enciclopedia LAROUSSE 18	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	203 paginas	\N	\N	\N	\N	t	\N
1003090	\N	Mi primeria enciclopedia LAROUSSE 19	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	202 paginas	\N	\N	\N	\N	t	\N
1003091	\N	Mi primeria enciclopedia LAROUSSE 2	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	201 paginas	\N	\N	\N	\N	t	\N
1003092	\N	Mi primeria enciclopedia LAROUSSE 20	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	200 paginas	\N	\N	\N	\N	t	\N
1003093	\N	Mi primeria enciclopedia LAROUSSE 21	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	199 paginas	\N	\N	\N	\N	t	\N
1003094	\N	Mi primeria enciclopedia LAROUSSE 22	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	198 paginas	\N	\N	\N	\N	t	\N
1003095	\N	Mi primeria enciclopedia LAROUSSE 3	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	197 paginas	\N	\N	\N	\N	t	\N
1003096	\N	Mi primeria enciclopedia LAROUSSE 4	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	196 paginas	\N	\N	\N	\N	t	\N
1003097	\N	Mi primeria enciclopedia LAROUSSE 5	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	195 paginas	\N	\N	\N	\N	t	\N
1003098	\N	Mi primeria enciclopedia LAROUSSE 6	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	194 paginas	\N	\N	\N	\N	t	\N
1003099	\N	Mi primeria enciclopedia LAROUSSE 7	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	193 paginas	\N	\N	\N	\N	t	\N
1003100	\N	Mi primeria enciclopedia LAROUSSE 8	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	192 paginas	\N	\N	\N	\N	t	\N
1003101	\N	Mi primeria enciclopedia LAROUSSE 9	Simon Lamblin, Marianee Gaunt	\N	\N	\N	\N	LORD COUCHRANE SA	Enciclopedia	\N	\N	191 paginas	\N	\N	\N	\N	t	\N
1003102	\N	Mía Cocina-Postres Frutales	\N	\N	\N	\N	\N	\N	Revista	\N	\N	190 paginas	\N	\N	\N	\N	t	\N
1003103	\N	Microwave 8i Convection	SANYO	\N	\N	\N	\N	\N	Gastronomia	\N	\N	189 paginas	\N	\N	\N	\N	t	\N
1003104	\N	Microwave Cookbook	Campbell's	\N	\N	\N	\N	\N	Gastronomia	\N	\N	188 paginas	\N	\N	\N	\N	t	\N
1003105	\N	Microwave Cookbook	Good Cooks Library	\N	\N	\N	\N	\N	Gastronomia	\N	\N	187 paginas	\N	\N	\N	\N	t	\N
1003106	\N	MINERIA N° 426 AGOSTO 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	186 paginas	\N	\N	\N	\N	t	\N
1003107	\N	Mineria N° 470, Noviembre 2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	185 paginas	\N	\N	\N	\N	t	\N
1003108	\N	Mineria N° 471, Diciembre 2016	\N	\N	\N	\N	\N	\N	\N	\N	\N	184 paginas	\N	\N	\N	\N	t	\N
1003109	\N	Minería N° 473 febrero de 2017\r\n Inversion en exploraciones	\N	\N	\N	\N	\N	\N	Revista	\N	\N	183 paginas	\N	\N	\N	\N	t	\N
1003110	\N	Minería N° 474 Marzo 2017 Importacion de bienes	\N	\N	\N	\N	\N	\N	Revista	\N	\N	182 paginas	\N	\N	\N	\N	t	\N
1003111	\N	Mineria N° 476 mayo 2017	\N	\N	\N	\N	ISSN 0026-4679	\N	Revista	\N	\N	181 paginas	\N	\N	\N	\N	t	\N
1003112	\N	Mineria N° 477 junio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	180 paginas	\N	\N	\N	\N	t	\N
1003113	\N	Mineria N° 478, julio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	179 paginas	\N	\N	\N	\N	t	\N
1003114	\N	Mineria N° 479, agosto 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	178 paginas	\N	\N	\N	\N	t	\N
1003115	\N	Mineria N° 480, septiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	177 paginas	\N	\N	\N	\N	t	\N
1003116	\N	MINERIA N° 481 octubre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	176 paginas	\N	\N	\N	\N	t	\N
1003117	\N	MINERIA N° 482 Noviembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	175 paginas	\N	\N	\N	\N	t	\N
1003118	\N	MINERIA N° 483 Diciembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	174 paginas	\N	\N	\N	\N	t	\N
1003119	\N	MINERIA N° 484 Enero 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	173 paginas	\N	\N	\N	\N	t	\N
1003120	\N	MINERIA N° 485 Febrero 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	172 paginas	\N	\N	\N	\N	t	\N
1003121	\N	MINERIA N° 486 Marzo 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	171 paginas	\N	\N	\N	\N	t	\N
1003122	\N	MINERIA N° 487 ABRIL 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	170 paginas	\N	\N	\N	\N	t	\N
1003123	\N	MINERIA N° 488 MAYO 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	169 paginas	\N	\N	\N	\N	t	\N
1003124	\N	MINERIA N° 491 AGOSTO 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	168 paginas	\N	\N	\N	\N	t	\N
1003125	\N	MINERIA N° 492 septiembre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	167 paginas	\N	\N	\N	\N	t	\N
1003126	\N	MINERIA N° 493 octubrebre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	166 paginas	\N	\N	\N	\N	t	\N
1003127	\N	MINERIA N° 494 noviembre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	165 paginas	\N	\N	\N	\N	t	\N
1003128	\N	Minería N° 495 diciembre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	164 paginas	\N	\N	\N	\N	t	\N
1003129	\N	MINERIA N° 499 ABRIL 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	163 paginas	\N	\N	\N	\N	t	\N
1003130	\N	MINERIA N° 500 MAYO 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	162 paginas	\N	\N	\N	\N	t	\N
1003131	\N	MINERIA N° 501 JUNIO 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	161 paginas	\N	\N	\N	\N	t	\N
1003132	\N	MINERIA N° 502 JULIO 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	160 paginas	\N	\N	\N	\N	t	\N
1003133	\N	MINERÍA N°490 - JULIO 2018	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	159 paginas	\N	\N	\N	\N	t	\N
1003134	\N	Minería N°503-Agosto 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	158 paginas	\N	\N	\N	\N	t	\N
1003135	\N	Minería N°504 año LXVII - Septiembre 2019	\N	\N	\N	\N	\N	\N	libro	\N	\N	157 paginas	\N	\N	\N	\N	t	\N
1003136	\N	Minería N°506 - Noviembre 2019	\N	\N	\N	\N	\N	\N	Revista	\N	\N	156 paginas	\N	\N	\N	\N	t	\N
1003137	\N	Minería N°508 año LXVII - Enero 2020	\N	\N	\N	\N	\N	\N	Revista	\N	\N	155 paginas	\N	\N	\N	\N	t	\N
1003138	\N	Mitos del Antiguo Testamento	\N	\N	\N	\N	\N	\N	\N	\N	\N	154 paginas	\N	\N	\N	\N	t	\N
1003139	Administración	MODELO DE EXCELENCIA EN LA GESTIÓN 2018	Comité de gestión de la calidad	\N	\N	\N	\N	-	LIBRO	Español	Libro	156	-	Lima	2018	\N	t	\N
1003140	\N	More from your Microwave	Judith Ferguson	\N	\N	\N	\N	\N	Gastronomia	\N	\N	152 paginas	\N	\N	\N	\N	t	\N
1003141	\N	Mosaic	J. Mellentin Haswell	\N	\N	\N	\N	\N	Artes	\N	\N	151 paginas	\N	\N	\N	\N	t	\N
1003142	\N	Mujeres celebres del Perú y del mundo	\N	\N	\N	\N	\N	SANTA BARBARA SA	Historia	\N	\N	150 paginas	\N	\N	\N	\N	t	\N
1003143	\N	Museos del Mundo	\N	\N	\N	\N	\N	DEAGOSTINI (4 tomos)	Arte	\N	\N	149 paginas	\N	\N	\N	\N	t	\N
1003144	\N	Napoleon	Alein Dubois	\N	\N	\N	\N	\N	Literatura	\N	\N	148 paginas	\N	\N	\N	\N	t	\N
1003145	\N	Natura Tododulce	\N	\N	\N	\N	\N	\N	Revista	\N	\N	147 paginas	\N	\N	\N	\N	t	\N
1003146	\N	New Rogets Thesaurus	P.S.I. & Associates, Inc.	\N	\N	\N	\N	\N	Historia	\N	\N	146 paginas	\N	\N	\N	\N	t	\N
1003147	\N	NICOLLÁS DE RIVERA (2 LIBROS)	EFRAIN TRELLES ARÉSTEGUI	\N	\N	\N	\N	\N	Libro	\N	\N	145 paginas	\N	\N	\N	\N	t	\N
1003148	\N	Novelas Best Sellers 1985 (20 tomos)	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	144 paginas	\N	\N	\N	\N	t	\N
1003149	\N	Novelas Grandes aventuras 1985 (23 tomos)	\N	\N	\N	\N	\N	\N	LIBROS	\N	\N	143 paginas	\N	\N	\N	\N	t	\N
1003150	\N	Nuestra Sazón	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	142 paginas	\N	\N	\N	\N	t	\N
1003151	\N	Nuestra Sazón "Las Mejores Recetas de la Cocina Regional"	\N	\N	\N	\N	\N	\N	Libro	\N	\N	141 paginas	\N	\N	\N	\N	t	\N
1003152	\N	Nuetras Mejores recetas	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	140 paginas	\N	\N	\N	\N	t	\N
1003153	\N	NUEVA COCINA ANDINA	Angela Medoza Castro	\N	\N	\N	\N	\N	Gastronomia	\N	\N	139 paginas	\N	\N	\N	\N	t	\N
1003154	\N	Nueva constitucion politica del Peru	sin autor	\N	\N	\N	\N	\N	HISTORIA	\N	\N	138 paginas	\N	\N	\N	\N	t	\N
1003155	\N	Nutrición para todos	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	137 paginas	\N	\N	\N	\N	t	\N
1003156	\N	NUTRICIÓN PARA TODOS.	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	136 paginas	\N	\N	\N	\N	t	\N
1003157	\N	OLLAS Y SAZÓN DE CAJAMARCA	Raul Vargas y Sergio Carrasco	\N	\N	\N	\N	\N	Libro	\N	\N	135 paginas	\N	\N	\N	\N	t	\N
1003158	\N	Ordenación Episcopal	Monseñor Pedro Bustamante López/Obispo Prelado de Sicuani	\N	\N	\N	\N	\N	Libro	\N	\N	134 paginas	\N	\N	\N	\N	t	\N
1003159	\N	Orientaciones Pastorales y Cronograma Arquidiocesano	\N	\N	\N	\N	\N	\N	folleto	\N	\N	133 paginas	\N	\N	\N	\N	t	\N
1003160	\N	Ortografia de la palabra	Mario Vega	\N	\N	\N	\N	\N	Lengua	\N	\N	132 paginas	\N	\N	\N	\N	t	\N
1003161	Gastronmia	Oster Manual de Ventas	Oster	\N	\N	\N	\N	\N	Gastronomia	Español	Manual	76 paginas	-	Peru	-	\N	t	\N
1003162	\N	Paciencia en el sufrimiento	Maximiliano Calvo	\N	\N	\N	\N	\N	Libro	\N	\N	130 paginas	\N	\N	\N	\N	t	\N
1003163	\N	Países de mundo	El Comercio	\N	\N	\N	\N	\N	Historia	\N	\N	129 paginas	\N	\N	\N	\N	t	\N
1003164	\N	PANADERIA Y PASTELERIA PERUANA 177	ANONIMO	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	128 paginas	\N	\N	\N	\N	t	\N
1003165	\N	PANADERIA Y PASTELERIA PERUANA 178	ANONIMO	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	127 paginas	\N	\N	\N	\N	t	\N
1003166	\N	PAPAS NATIVAS DEL PERÚ-Catálogo de variedades y usos Gastronómicos.	Varios	\N	\N	\N	\N	Ministerio de Agricultura	Gastronomia	\N	\N	126 paginas	\N	\N	\N	\N	t	\N
1003167	\N	PARA NUESTRA ESCUELA	JOSE M. VALVERDE BUTRON	\N	\N	\N	\N	LIBRERIA STUDIUM S.A.C.	libro	\N	\N	125 paginas	\N	\N	\N	\N	t	\N
1003168	\N	PARACAS Y LOS AREAS PROTEGIDAS DE LA COSTA	WALTERH.WUST	\N	\N	\N	9972-40-275-4	PEISA S.A.C	ENCICLOPEDIA	\N	\N	124 paginas	\N	\N	\N	\N	t	\N
1003169	\N	PARQUE DE LA EXPOSICIÓN (2 LIBROS)	JUAN JOSÉ PACHECO	\N	\N	\N	\N	\N	Libro	\N	\N	123 paginas	\N	\N	\N	\N	t	\N
1003170	\N	Parque Induatrial-Asociación de Empresas del Parque Industrial de Arequipa ABR.2019 ED. N°44	\N	\N	\N	\N	\N	\N	revista	\N	\N	122 paginas	\N	\N	\N	\N	t	\N
1003171	\N	Parque Induatrial-Asociación de Empresas del Parque Industrial de Arequipa ABR.2019 ED. N°45	\N	\N	\N	\N	\N	\N	revista	\N	\N	121 paginas	\N	\N	\N	\N	t	\N
1003172	\N	Parque Induatrial-Asociación de Empresas del Parque Industrial de Arequipa ABR.2019 ED. N°46	\N	\N	\N	\N	\N	\N	revista	\N	\N	120 paginas	\N	\N	\N	\N	t	\N
1003173	\N	Parque Inductrial, DIC.2019 ED. N°47	\N	\N	\N	\N	\N	\N	Revista	\N	\N	119 paginas	\N	\N	\N	\N	t	\N
1003174	\N	Parque Industrial (Asociación de Empresas del Parque Industrial de Arequipa)	\N	\N	\N	\N	\N	\N	Revista	\N	\N	118 paginas	\N	\N	\N	\N	t	\N
1003175	\N	Parque Industrial (Asociación de Empresas del Parque Industrial de Arequipa)	\N	\N	\N	\N	\N	\N	Revista	\N	\N	117 paginas	\N	\N	\N	\N	t	\N
1003176	\N	Parque Industrial (Asociación de Empresas del Parque Industrial de Arequipa)	\N	\N	\N	\N	\N	\N	Revista	\N	\N	116 paginas	\N	\N	\N	\N	t	\N
1003177	\N	Parque Industrial (Asociación de Empresas del Parque Industrial de Arequipa)	2 unidades	\N	\N	\N	\N	482 Aniversario Arequipa	Revista	\N	\N	115 paginas	\N	\N	\N	\N	t	\N
1003178	\N	Parque Industrial / ABR.2019 ED. N°44	\N	\N	\N	\N	\N	\N	Revista	\N	\N	114 paginas	\N	\N	\N	\N	t	\N
1003179	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	113 paginas	\N	\N	\N	\N	t	\N
1003180	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	112 paginas	\N	\N	\N	\N	t	\N
1003181	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	111 paginas	\N	\N	\N	\N	t	\N
1003182	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	110 paginas	\N	\N	\N	\N	t	\N
1003183	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	109 paginas	\N	\N	\N	\N	t	\N
1003184	\N	Parque industrial AGO.2018 ED.N°41	\N	\N	\N	\N	\N	\N	Revista	\N	\N	108 paginas	\N	\N	\N	\N	t	\N
1003185	\N	Parque Industrial Asociación de Empreas del Parque Industrial de Arequipa \r\n Edicion N° 32	\N	\N	\N	\N	\N	\N	\N	\N	\N	107 paginas	\N	\N	\N	\N	t	\N
1003186	\N	Parque Industrial Asociación de Empreas del Parque Industrial de Arequipa \r\n Edicion N° 34	\N	\N	\N	\N	\N	\N	\N	\N	\N	106 paginas	\N	\N	\N	\N	t	\N
1003187	\N	Parque Industrial Asociacion de Empresas del Parque industrial de arequipa\r\n Edición N° 34	\N	\N	\N	\N	\N	\N	\N	\N	\N	105 paginas	\N	\N	\N	\N	t	\N
1003188	\N	Parque Industrial Asociacion de Empresas del Parque industrial de arequipa\r\n Edición N° 35 (4 juegos)	\N	\N	\N	\N	\N	\N	\N	\N	\N	104 paginas	\N	\N	\N	\N	t	\N
1003189	\N	Parque Industrial Asociacion de empresas del parque insdustrial de arequipa\r\n Edicion N° 36	\N	\N	\N	\N	\N	\N	Revista (3 juegos)	\N	\N	103 paginas	\N	\N	\N	\N	t	\N
1003190	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	102 paginas	\N	\N	\N	\N	t	\N
1003191	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	101 paginas	\N	\N	\N	\N	t	\N
1003192	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	100 paginas	\N	\N	\N	\N	t	\N
1003193	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	99 paginas	\N	\N	\N	\N	t	\N
1003194	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	98 paginas	\N	\N	\N	\N	t	\N
1003195	\N	Parque industrial DIC.2018 ED.N°43	\N	\N	\N	\N	\N	\N	Revista	\N	\N	97 paginas	\N	\N	\N	\N	t	\N
1003196	\N	Parque Industrial Dic.2019 ED.N°47	\N	\N	\N	\N	\N	\N	Revista	\N	\N	96 paginas	\N	\N	\N	\N	t	\N
1003197	\N	Parque Industrial Dic.2019 ED.N°47	\N	\N	\N	\N	\N	\N	Revista	\N	\N	95 paginas	\N	\N	\N	\N	t	\N
1003198	\N	Parque Industrial Dic.2019 ED.N°47	\N	\N	\N	\N	\N	\N	Revista	\N	\N	94 paginas	\N	\N	\N	\N	t	\N
1003199	\N	Parque Industrial Edicion N° 36 (1 EJEMPLAR)\r\n Asociacion de Empresas del Parque Industrial de Arequipa	\N	\N	\N	\N	\N	\N	Revista	\N	\N	93 paginas	\N	\N	\N	\N	t	\N
1003200	\N	Parque Industrial Edicion N° 37 (1 EJEMPLAR)\r\n Asociacion de Empresas del Parque Industrial de Arequipa	\N	\N	\N	\N	\N	\N	Revista	\N	\N	92 paginas	\N	\N	\N	\N	t	\N
1003201	\N	Parque Industrial Edicion N° 37 (4 EJEMPLARES)\r\n Asociacion de Empresas del Parque Industrial de Arequipa	\N	\N	\N	\N	\N	\N	Revista	\N	\N	91 paginas	\N	\N	\N	\N	t	\N
1003202	\N	Parque Industrial Jul.2019 ED. N°45	\N	\N	\N	\N	\N	\N	Revista	\N	\N	90 paginas	\N	\N	\N	\N	t	\N
1003203	\N	Parque Industrial Jul.2019 ED. N°45	\N	\N	\N	\N	\N	\N	Revista	\N	\N	89 paginas	\N	\N	\N	\N	t	\N
1003204	\N	Parque Industrial Jul.2019 ED. N°45	\N	\N	\N	\N	\N	\N	Revista	\N	\N	88 paginas	\N	\N	\N	\N	t	\N
1003205	\N	Parque Industrial N° 38 setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	87 paginas	\N	\N	\N	\N	t	\N
1003206	\N	Parque Industrial N° 38 setiembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	86 paginas	\N	\N	\N	\N	t	\N
1003207	\N	Parque Industrial N° 39 noviembre 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	85 paginas	\N	\N	\N	\N	t	\N
1003208	\N	Parque Industrial N° 39 noviembre 2017 (3 ejemplares)	\N	\N	\N	\N	\N	\N	Revista	\N	\N	84 paginas	\N	\N	\N	\N	t	\N
1003209	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	83 paginas	\N	\N	\N	\N	t	\N
1003210	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	82 paginas	\N	\N	\N	\N	t	\N
1003211	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	81 paginas	\N	\N	\N	\N	t	\N
1003212	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	80 paginas	\N	\N	\N	\N	t	\N
1003213	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	79 paginas	\N	\N	\N	\N	t	\N
1003214	\N	Parque industrial OCT.2018 ED.N°42	\N	\N	\N	\N	\N	\N	Revista	\N	\N	78 paginas	\N	\N	\N	\N	t	\N
1003215	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	77 paginas	\N	\N	\N	\N	t	\N
1003216	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	76 paginas	\N	\N	\N	\N	t	\N
1003217	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	75 paginas	\N	\N	\N	\N	t	\N
1003218	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	74 paginas	\N	\N	\N	\N	t	\N
1003219	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	73 paginas	\N	\N	\N	\N	t	\N
1003220	\N	Parque Industrial septiembre 2019 ED. N°46	\N	\N	\N	\N	\N	\N	Revista	\N	\N	72 paginas	\N	\N	\N	\N	t	\N
1003221	\N	Parque Industrial.	\N	\N	\N	\N	\N	\N	Revista	\N	\N	71 paginas	\N	\N	\N	\N	t	\N
1003222	Gastronomia	Parrilla para todos	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Recetas	Español	Revista	132 paginas	Primera Edicion	Lima	2006	\N	t	\N
1003223	\N	Pasion por las personas\r\n La vuelta a Lima, Cusco e Iquitos en 24 horas	Fundacion BBVA Banco Continental	\N	\N	\N	ISBN 978-603-45114-0-8	Empresa Editora El Comercio S.A.	Cultura	\N	\N	69 paginas	\N	\N	\N	\N	t	\N
1003224	\N	PASO A PASO -PASTAS	Pamela Westland	\N	\N	\N	\N	\N	Libro	\N	\N	68 paginas	\N	\N	\N	\N	t	\N
1003225	\N	PASO A PASO-COCINA CHINA CANTONESA	Deh-ta hsiung	\N	\N	\N	\N	Parragon Book Service Ltd.	Gastronomía	\N	\N	67 paginas	\N	\N	\N	\N	t	\N
1003226	\N	Pastas	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	66 paginas	\N	\N	\N	\N	t	\N
1003227	\N	Pastelería -Postres PASO A PASO	Martha Burley	\N	\N	\N	\N	Penguin Random House	Libro	\N	\N	65 paginas	\N	\N	\N	\N	t	\N
1003228	\N	PASTELERIA Y PANADERIA PERUANA	carmen lopez gomez(EL COMERCIO)	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	64 paginas	\N	\N	\N	\N	t	\N
1003229	\N	PATRIMONIO DEL PERÚ	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-02-137-8	\N	Formacion Humana	\N	\N	63 paginas	\N	\N	\N	\N	t	\N
1003230	\N	Patrimonio del Perú	El Comercio	\N	\N	\N	\N	\N	Historia	\N	\N	62 paginas	\N	\N	\N	\N	t	\N
1003231	\N	Pedagogia del oprimido	Paulo Freide	\N	\N	\N	\N	TIERRAS NUEVAS DE MONTEVIDEO	Literatura	\N	\N	61 paginas	\N	\N	\N	\N	t	\N
1003232	\N	PEPCMAC-El Microfinanciamiento	\N	\N	\N	\N	\N	\N	Revista	\N	\N	60 paginas	\N	\N	\N	\N	t	\N
1003233	\N	PEPCMAC-El Microfinanciamiento	\N	\N	\N	\N	\N	\N	Revista	\N	\N	59 paginas	\N	\N	\N	\N	t	\N
1003234	\N	PEPCMAC-El Microfinanciamiento julio 2017	\N	\N	\N	\N	\N	\N	Revista	\N	\N	58 paginas	\N	\N	\N	\N	t	\N
1003235	\N	Perla Meyers Seasonal Kitchen	Fireside	\N	\N	\N	ISBN 0-671-67659-8 pbk	\N	Gastronomia	\N	\N	57 paginas	\N	\N	\N	\N	t	\N
1003236	\N	Personajes del Perú y del Mundo	\N	\N	\N	\N	\N	EL COMERCIO (16 libros)	Historia	\N	\N	56 paginas	\N	\N	\N	\N	t	\N
1003237	\N	Perú Eterno Tomo I	Washintong Delgado Tresierra	\N	\N	\N	\N	EDICIONES AMERICANAS	Historia	\N	\N	55 paginas	\N	\N	\N	\N	t	\N
1003238	\N	Perú Eterno Tomo II	Washintong Delgado Tresierra	\N	\N	\N	\N	EDICIONES AMERICANAS	Historia	\N	\N	54 paginas	\N	\N	\N	\N	t	\N
1003239	\N	PERU GENIAL (Arte)	Francisco Miro Quesada Rada	\N	\N	\N	\N	\N	Cultura/Album	\N	\N	53 paginas	\N	\N	\N	\N	t	\N
1003240	\N	PERU GENIAL (Naturaleza)	Francisco Miro Quesada Rada	\N	\N	\N	\N	\N	Cultura/Album	\N	\N	52 paginas	\N	\N	\N	\N	t	\N
1003241	\N	PERU GENIAL (Origenes e historia)	Francisco Miro Quesada Rada	\N	\N	\N	\N	\N	Cultura/Album	\N	\N	51 paginas	\N	\N	\N	\N	t	\N
1003242	\N	Peru Sabe La cocina, arma social - CD	Gaston Acurio & Ferran Adria	\N	\N	\N	\N	\N	Gastronomia	\N	\N	50 paginas	\N	\N	\N	\N	t	\N
1003243	\N	Perú Submarino	Yuri Hooker Mantilla	\N	\N	\N	ISBN 978-612-45824-8-6	Apus Graph Ediciones S.A.C	Cultura/Geografia	\N	\N	49 paginas	\N	\N	\N	\N	t	\N
1003244	\N	PHOTO BAHIA	Almir Bindilatti/Luciano Andrade	\N	\N	\N	\N	Rua Jardin Botanico	Cultura	Español	LIBRO	159	Primera Edicion	Brasil	2007	\N	t	\N
1003245	\N	Pies/Colección Nueva Cocina Familiar-Pasteles	Isabel Toyos	\N	\N	\N	\N	Editores S.A.C.	Recetas	Español	Recetas	63 paginas	Primera Edición	Lima	2011	\N	t	\N
1003246	\N	PISCO PERÚ	Lecturas y Lectores-El Comercio	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	46 paginas	\N	\N	\N	\N	t	\N
1003247	\N	PISCO The Spirit of Peru	Anel Pancorvo	\N	\N	\N	\N	Anel Pancorvo	Gastronomia	\N	\N	45 paginas	\N	\N	\N	\N	t	\N
1003248	Gastronomia	Postres con Ada y Maricarmen-Dulces Económicos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003249	Gastronomia	Postres con Ada y Maricarmen-Dulzura al Instante	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003250	Gastronomia	Postres con Ada y Maricarmen-Dulzura al Instante	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003251	Gastronomia	Postres con Ada y Maricarmen-El Placer del Chocolate	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003252	Gastronomia	Postres con Ada y Maricarmen-Exquisitos Bavarois y Mousses	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003253	Gastronomia	Postres con Ada y Maricarmen-Lonchera Feliz	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003254	Gastronomia	Postres con Ada y Maricarmen-Queques y Suaves Bizcochuelos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003255	Gastronomia	Postres con Ada y Maricarmen-Queques y Suaves Bizcochuelos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003256	Gastronomia	Postres con Ada y Maricarmen-Queques y Suaves Bizcochuelos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008		t	\N
1003257	Gastronomia	Postres con Ada y Maricarmen-Siempre Clásicos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008		t	\N
1003258	Gastronomia	Postres con Ada y Maricarmen-Siempre Clásicos	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003259	Gastronomia	Postres con Ada y Maricarmen-Tartas y Pasteles Infaltables	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003260	Gastronomia	Postres con Ada y Maricarmen-Tartas y Pasteles Infaltables	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003261	Gastronomia	Postres con Ada y Maricarmen-Tradiciones Peruanas	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003262	Gastronomia	Postres con Ada y Maricarmen-Tradiciones Peruanas	Ada y Maricarmen	\N	\N	\N	\N	Septiembre S.A.C.	Recetas	Español	Recetas	63 páginas	Primera Edicion	Lima	2008	\N	t	\N
1003263	\N	Postres peruanos de la A a la Z	\N	\N	\N	\N	\N	\N	Recetas	\N	Recetas	29 paginas	\N	\N	\N	\N	t	\N
1003264	\N	Postres y Tortas	\N	\N	\N	\N	\N	\N	Revista	\N	Recetas	28 paginas	\N	\N	\N	\N	t	\N
1003265	\N	Programa de Desarrollo Personal y Profesional	\N	\N	\N	\N	\N	DEUSTO (10 libros)	Cultura	\N	\N	27 paginas	\N	\N	\N	\N	t	\N
1003266	\N	Programa de Formacion de Jovenes Emprendedores en Cajamarca y Celedin	\N	\N	\N	\N	\N	\N	\N	\N	\N	26 paginas	\N	\N	\N	\N	t	\N
1003267	\N	Programa General de Festejos 2022	Municipalidad Provincial de Arequipa	\N	\N	\N	\N	\N	Revista	\N	\N	25 paginas	\N	\N	\N	\N	t	\N
1003268	\N	PROGRAMA PROMOTORES DE SALUD, PLANTAS MEDICINALES, CHACHAPOYAS 1990	\N	\N	\N	\N	\N	\N	FOLLETO	\N	\N	24 paginas	\N	\N	\N	\N	t	\N
1003269	\N	Qu´est-ce qui mijote? 15° numero	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	23 paginas	\N	\N	\N	\N	t	\N
1003270	\N	QUORUM-HACIA UN CRECIMIENTO ECONOMICO SOSTENIDO	\N	\N	\N	\N	MARZO I 2018	ESTUDIO MUÑIZ	Revista	\N	\N	22 paginas	\N	\N	\N	\N	t	\N
1003271	\N	Recetario Multiondas	LG	\N	\N	\N	\N	-	Gastronomia	ESPAÑOL	Recetario	33 paginas	-	-	-	\N	t	\N
1003272	\N	Recetas	Sin titulo	\N	\N	\N	\N	\N	Gastronomia	\N	\N	20 paginas	\N	\N	\N	\N	t	\N
1003273	\N	Recetas de cocina de Mistura-60 Edición Especial	MenuPeru	\N	\N	\N	\N	El Comercio	Revista	\N	\N	19 paginas	\N	\N	\N	\N	t	\N
1003274	\N	Recetas de verano	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	18 paginas	\N	\N	\N	\N	t	\N
1003275	\N	Recetas Inolvidables	Paola Marsano	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	17 paginas	\N	\N	\N	\N	t	\N
1003276	\N	Recetas navideñas	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	16 paginas	\N	\N	\N	\N	t	\N
1003277	\N	Recetas Nestle Docello	\N	\N	\N	\N	\N	\N	Gastronomia /Revistas	\N	\N	15 paginas	\N	\N	\N	\N	t	\N
1003278	\N	Rectas marinas	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	14 paginas	\N	\N	\N	\N	t	\N
1003279	\N	Reglamento nacional de tránsito	F. Reyes Murillo	\N	\N	\N	\N	LA TORTUGA	\N	\N	\N	13 paginas	\N	\N	\N	\N	t	\N
1003280	\N	RELIGION & Liberty N°27/2017	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	12 paginas	\N	\N	\N	\N	t	\N
1003281	\N	Religion & Liberty N°28/2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	11 paginas	\N	\N	\N	\N	t	\N
1003282	\N	RELIGION & Liberty N°28/2018	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	10 paginas	\N	\N	\N	\N	t	\N
1003283	Administracion	REPORTE ANUAL CAJA AREQUIPA 2017	Caja Arequipa	\N	\N	\N	\N	AYR PANAMERICANA	LIBRO	Español	reporte de empresa	147 paginas	\N	\N	\N	\N	t	\N
1003284	Administracion	REPORTE ANUAL CAJA AREQUIPA 2018	Caja Arequipa	\N	\N	\N	\N	Panamericana Industria Grafica	LIBRO	Español	reporte de empresa	148 paginas	\N	\N	\N	Capitulo 1: NUESTRA CAJA 12. Capítulo 2: ENTORNO ECONÓMICO 22. Capítulo 3: GESTIÓN DEL AÑO 2018 32. Capítulo 4: EXPERIENSA DEL CLIENTE Y CULTURA DE SERVICIO 60. Capítulo 5: RESPONSABILIDAD SOCIAL Y ACTIVIDADES CON LA COMUNIDAD 70. Capítulo 6: ESTADOS FINACIEROS 78.	t	\N
1003285	\N	REPORTE DE ESTABILIDAD FINANCIERA (3 LIBROS)	Banco Central de Reserva del Perú	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	7 paginas	\N	\N	\N	\N	t	\N
1003286	\N	REPORTE DE ESTABILIDAD FINANCIERA (3 LIBROS)	Banco Central de Reserva del Perú	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	6 paginas	\N	\N	\N	\N	t	\N
1003287	\N	REPORTE DE ESTABILIDAD FINANCIERA (3 LIBROS)	Banco Central de Reserva del Perú	\N	\N	\N	\N	BANCO CENTRAL DE RESERVA DEL PERU	LIBRO	\N	\N	5 paginas	\N	\N	\N	\N	t	\N
1003288	\N	Reporte de Sostenibilidad 2015	\N	\N	\N	\N	\N	\N	Revista	\N	\N	4 paginas	\N	\N	\N	\N	t	\N
1003289	\N	Repostería Casera - tartas 1er compilado	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	3 paginas	\N	\N	\N	\N	t	\N
1003290	\N	Repostería Casera - tartas 2do compilado	El Comercio	\N	\N	\N	\N	\N	Libro	\N	\N	2 paginas	\N	\N	\N	\N	t	\N
1003291	\N	Repostería Casera: Ada y Maricarmen	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	1 paginas	\N	\N	\N	\N	t	\N
1003292	\N	Repostería navideña	Metro	\N	\N	\N	\N	2008 UNI MUNDO	Gastronomía	\N	\N	0 paginas	\N	\N	\N	\N	t	\N
1003293	Formaciòn humana	Restauración de porcelana y cerámica antigua	Jeff Oliver	\N	\N	\N	ISBN 84-329-8212-1	\N	Artes	Español	LIBRO	1 paginas	Primera ediciòn	Perù	1990	\N	t	\N
1003294	\N	Resumen Formulario de aplicaciones de: A,A,G,T,F,Q	Jorge Diaz Mosto	\N	\N	\N	\N	UNIVERSO SA	Matematica	Español	LIBRO	296	Primera ediciòn	-	-	\N	t	\N
1003295	\N	Ricettario di cucina	Auser di Palmanova	\N	\N	\N	\N	AUSER	Gastronomia	\N	\N	3 paginas	\N	\N	\N	\N	t	\N
1003296	\N	ROSA DE LIMA (1 LIBROS)	RAFAEL SANCHEZ-CONCHA BARRIOS	\N	\N	\N	\N	\N	Libro	\N	\N	4 paginas	\N	\N	\N	\N	t	\N
1003297	\N	Roswell y el fenómeno OVNI	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	5 paginas	\N	\N	\N	\N	t	\N
1003298	\N	SABERES COMPARTIDOS	SYLVIA KOROTKY	\N	\N	\N	\N	\N	Libro	\N	\N	6 paginas	\N	\N	\N	\N	t	\N
1003299	\N	SABORES DE MI PERÚ	\N	\N	\N	\N	\N	\N	Revista	\N	\N	7 paginas	\N	\N	\N	\N	t	\N
1003300	\N	San Miguel- MARIA DESATA NUDOS	\N	\N	\N	\N	\N	\N	Revista	\N	\N	8 paginas	\N	\N	\N	\N	t	\N
1003301	\N	SAN MIGUEL- POR EL TRIUNFO DE LA INMACULADA CONCEPTION	\N	\N	\N	\N	\N	SAN MIGUEL	REVISTA	\N	\N	9 paginas	\N	\N	\N	\N	t	\N
1003302	\N	Santuarios Naturales del Perú	Walter H. Wust	\N	\N	\N	\N	PEISA (8 TOMOS)	Geografia	\N	\N	10 paginas	\N	\N	\N	\N	t	\N
1003303	\N	Scandinacian Modern Design	Abrams	\N	\N	\N	\N	\N	Artes	\N	\N	11 paginas	\N	\N	\N	\N	t	\N
1003304	\N	SECRETOS DE COCINA	Bernardo Rocarrey Miro Quesada	\N	\N	\N	9972-617-52-1	\N	Gastronomia	\N	\N	12 paginas	\N	\N	\N	\N	t	\N
1003305	\N	Secretos de Cocina: Con los trucos y técnicas del buen comer	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Gastronomia	\N	\N	13 paginas	\N	\N	\N	\N	t	\N
1003306	\N	Secretos de cocina: Fuegos, Fogones y Parrillas	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Gastronomia	ESPAÑOL	RECETA	104 paginas	Primera edición	\N	\N	\N	t	\N
1003307	\N	Secretos de cocina: Guía del buen comer	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Gastronomia	\N	\N	15 paginas	\N	\N	\N	\N	t	\N
1003308	\N	Secretos de Cocina: Repostería, pastelería y panificación	Bernardo Rocarrey Miro Quesada	\N	\N	\N	\N	El Comercio	Gastronomia	\N	\N	16 paginas	\N	\N	\N	\N	t	\N
1003309	\N	SECRETOS DE LA COCINA- Peruvian Cuisine	Emilio Peschiera	\N	\N	\N	\N	ORIGO	Revista	\N	\N	17 paginas	\N	\N	\N	\N	t	\N
1003310	\N	Seminario Internacional de Microfinanzas Rurales	\N	\N	\N	\N	\N	\N	Revista	\N	\N	18 paginas	\N	\N	\N	\N	t	\N
1003311	\N	SERVICIO DE MEDICINAS PRO-VIDA, CURSO DE MEDICINA TRADICIONAL, LIMA 1992	\N	\N	\N	\N	\N	\N	FOLLETO	\N	\N	19 paginas	\N	\N	\N	\N	t	\N
1003312	\N	Simón el pequeño castor	\N	\N	\N	\N	\N	ORTELLS	Literatura/Obras	\N	\N	20 paginas	\N	\N	\N	\N	t	\N
1003313	\N	Sin Nombre	\N	\N	\N	\N	\N	\N	Historia	\N	\N	21 paginas	\N	\N	\N	\N	t	\N
1003314	\N	Sipan	Walter Alva	\N	\N	\N	\N	\N	Historia	\N	\N	22 paginas	\N	\N	\N	\N	t	\N
1003315	\N	Somos	Flores Para Renata	\N	\N	\N	\N	\N	Revista	\N	\N	23 paginas	\N	\N	\N	\N	t	\N
1003316	\N	Sopas	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	24 paginas	\N	\N	\N	\N	t	\N
1003317	\N	Soups & Creams	\N	\N	\N	\N	\N	\N	Gastronomia	\N	\N	25 paginas	\N	\N	\N	\N	t	\N
1003318	\N	Stained glass crafting	Paul W. Wood	\N	\N	\N	\N	\N	Artes	\N	\N	26 paginas	\N	\N	\N	\N	t	\N
1003319	\N	Stained glass painting	Anita & Seeymour Isenberg - Richard Millard	\N	\N	\N	\N	\N	Artes	\N	\N	27 paginas	\N	\N	\N	\N	t	\N
1003320	\N	Sucre	Alfonso Rumazo Gonzales	\N	\N	\N	\N	CADAFE	Historia	\N	\N	28 paginas	\N	\N	\N	\N	t	\N
1003321	\N	Tesoros de la Cocina-Los Grandes Postres	Vanidades	\N	\N	\N	\N	Century Publishing Pty	Libro	\N	\N	29 paginas	\N	\N	\N	\N	t	\N
1003322	\N	The Art of Cooking	Jacques Pepins	\N	\N	\N	ISBN 0-394-54658-X	\N	Gastronomia	\N	\N	30 paginas	\N	\N	\N	\N	t	\N
1003323	\N	The Art of Lustre Painting	Nils Cederborg	\N	\N	\N	\N	\N	Artes	\N	\N	31 paginas	\N	\N	\N	\N	t	\N
1003324	\N	The authentic Pasta Book	Fred Plotkin	\N	\N	\N	\N	\N	Gastronomia	\N	\N	32 paginas	\N	\N	\N	\N	t	\N
1003325	\N	The Best of Bon Appetit	KNAPP	\N	\N	\N	ISBN 0-89535-164-1	\N	Gastronomia	\N	\N	33 paginas	\N	\N	\N	\N	t	\N
1003326	\N	The big book of watercolor	José M. Parramón	\N	\N	\N	\N	\N	Artes	\N	\N	34 paginas	\N	\N	\N	\N	t	\N
1003327	\N	The complete guide to Sculpture, Modeling and Ceramics	Barry Midgley	\N	\N	\N	\N	\N	Artes	\N	\N	35 paginas	\N	\N	\N	\N	t	\N
1003328	\N	The Cooking of China	Emily Hahn	\N	\N	\N	\N	\N	Gastronomia	\N	\N	36 paginas	\N	\N	\N	\N	t	\N
1003329	\N	The Craft ofWood Carving	Alan- Gilí Bridgewater	\N	\N	\N	\N	\N	Artes	\N	\N	37 paginas	\N	\N	\N	\N	t	\N
1003330	\N	The Economist Colección: Finanzas y Negocios (8 libros)	\N	\N	\N	\N	\N	\N	Administración	\N	\N	38 paginas	\N	\N	\N	\N	t	\N
1003331	\N	The Economist Colección: Nueva Economia (12 libros)	\N	\N	\N	\N	\N	\N	Administración	\N	\N	39 paginas	\N	\N	\N	\N	t	\N
1003332	\N	The energy-efficient potter (2 ejemplares)	Regis C. Brodie	\N	\N	\N	\N	\N	Artes	\N	\N	40 paginas	\N	\N	\N	\N	t	\N
1003333	\N	The Mother Kitchen (2 ejemplares)	Renee Galioto	\N	\N	\N	\N	\N	Gastronomia	\N	\N	41 paginas	\N	\N	\N	\N	t	\N
1003334	\N	The new book of leatherwork	Joseph Delano	\N	\N	\N	\N	\N	Artes	\N	\N	42 paginas	\N	\N	\N	\N	t	\N
1003335	\N	The People of the Revolution Colonial Spirit of 76	David C. Whitney	\N	\N	\N	\N	\N	Historia	\N	\N	43 paginas	\N	\N	\N	\N	t	\N
1003336	\N	The Potters Manual	Kenneth Clark	\N	\N	\N	ISBN 0-89009-674-0	\N	Artes	\N	\N	44 paginas	\N	\N	\N	\N	t	\N
1003337	\N	The Timetables	Bernard Grun	\N	\N	\N	\N	\N	Historia	\N	\N	45 paginas	\N	\N	\N	\N	t	\N
1003338	\N	The world of ancient times	Cari Roebuck	\N	\N	\N	\N	\N	Historia	\N	\N	46 paginas	\N	\N	\N	\N	t	\N
1003339	\N	Thrifty Meáis for Two: Making Food Dollars Count	Human Nutrition Information Service	\N	\N	\N	\N	\N	\N	\N	\N	47 paginas	\N	\N	\N	\N	t	\N
1003340	\N	TIPS DE COCINA DULCES Y SALADAS (RECETAS)	El Comercio	\N	\N	\N	\N	\N	Gastronomia	\N	\N	48 paginas	\N	\N	\N	\N	t	\N
1003341	\N	TODO CHOCOLATERIA , TRUFAS tomo 3	Ana Maria Lazo del Solar	\N	\N	\N	978-9972-58-924-9	Editorial Septiembre	Gastronomia /Revistas	\N	\N	49 paginas	\N	\N	\N	\N	t	\N
1003342	\N	TODO CHOCOLATERIA, BOMBONES 2 tomo 5	Ana Maria Lazo del Solar	\N	\N	\N	978-9972-58-296-3	Editorial Septiembre	Gastronomia /Revistas	\N	\N	50 paginas	\N	\N	\N	\N	t	\N
1003343	\N	TODO SOBRE LA PAPA-Historia, secretos y Recetas.	Maria Teresa Muñoz	\N	\N	\N	\N	EDELNOR S.A.A.	Libro	ESPAÑOL	-	99 páginas	Primera edición	Lima	2008	\N	t	\N
1003344	Gastronomia	TODO TORTAS, MEZA DULCE tomo 10	Marines Justiniano Damonte - La Republica	\N	\N	\N	978-9972-58-678-1	Setiembre SAC	Revista	Español	Revista	64 paginas	Primera Edicion	Lima	2007	\N	t	\N
1003345	Gastronomia	TODO TORTAS, TORTAS \r\n PARA NAVIDAD tomo 19	Marines Justiniano Damonte - La Republica	\N	\N	\N	978-9972-58-722-1	Setiembre SAC	Revista	Español	Revista	64 paginas	Primera Edicion	Lima	2007	\N	t	\N
1003346	Gastronomia	TODO TORTAS, TORTAS DE GELATINA tomo 12	Marines Justiniano Damonte - La Republica	\N	\N	\N	978-9972-58-694-1	Setiembre SAC	Revista	Español	Revista	64 paginas	Primera Edicion	Lima	2007	\N	t	\N
1003347	Gastronomia	Todo Tortas-Mesa Dulce	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003348	Gastronomia	Todo Tortas-Tortas Clásicas	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003349	Gastronomia	Todo Tortas-Tortas con Frutas	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003350	Gastronomia	Todo Tortas-Tortas de Cumpleaños	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003351	Gastronomia	Todo Tortas-Tortas Heladas	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003352	Gastronomia	Todo Tortas-Tortas Heladas 2	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003353	Gastronomia	Todo Tortas-Tortas Infantiles	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003354	Gastronomia	Todo Tortas-Tortas para Celebraciones	Marines Justiniano Damonte - La Republica	\N	\N	\N	\N	Setiembre SAC	Revista	Español	Revista	64	Primera Edicion	Lima	2007	\N	t	\N
1003355	\N	Tole-Style Decorative Painting	Tole-Style Designs	\N	\N	\N	\N	\N	Artes	\N	\N	63 paginas	\N	\N	\N	\N	t	\N
1003356	\N	Tortas y Postres	\N	\N	\N	\N	\N	Cinco Cultural S.A.	Revista	\N	\N	64 paginas	\N	\N	\N	\N	t	\N
1003357	\N	Touring agosto 2018//N°83	\N	\N	\N	\N	\N	\N	Revista	\N	\N	65 paginas	\N	\N	\N	\N	t	\N
1003358	\N	TOURINNG Automóvil Club del Perú N°84//Diciembre 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	66 paginas	\N	\N	\N	\N	t	\N
1003359	\N	Tragos y Cócteles	Importadora y Editora Nuevo Perú	\N	\N	\N	\N	\N	Gastronomia	\N	\N	67 paginas	\N	\N	\N	\N	t	\N
1003360	Gastronomia	Tragos y Piqueos	El Comercio	\N	\N	\N	\N	El Comercio	Recetas	Español	Recetario	58 paginas	Primera Edicion	Lima	2007	\N	t	\N
1003361	\N	Tragos y Piqueos - Afrodisiacos y Exóticos	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	69 paginas	\N	\N	\N	\N	t	\N
1003362	\N	Tragos y Piqueos - Aperitivos y Bajativos	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	70 paginas	\N	\N	\N	\N	t	\N
1003363	\N	Tragos y Piqueos - Batidos y Afrutados	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	71 paginas	\N	\N	\N	\N	t	\N
1003364	\N	Tragos y Piqueos - Clásicos	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	72 paginas	\N	\N	\N	\N	t	\N
1003365	\N	Tragos y Piqueos - Con Pisco	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	73 paginas	\N	\N	\N	\N	t	\N
1003366	\N	Tragos y Piqueos - Fusión	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	74 paginas	\N	\N	\N	\N	t	\N
1003367	\N	Tragos y Piqueos - Sours y Ponches	Grupo La Republica	\N	\N	\N	\N	Q.W. Editores S.A.C.	Revista	\N	\N	75 paginas	\N	\N	\N	\N	t	\N
1003368	\N	Treasures from the Royal Collection	The Quuen Gallery, Buckingham Palace	\N	\N	\N	ISBN 0-951-3373-00	Q.W. Editores S.A.C.	Artes	\N	\N	76 paginas	\N	\N	\N	\N	t	\N
1003369	\N	TRÍO	Pedro Miguel Schiaffino- Rafael Piqueras- Daniel Delgado	\N	\N	\N	\N	nto	Libro	\N	\N	77 paginas	\N	\N	\N	\N	t	\N
1003370	\N	UNIR PARA SERVIR	Revista Institucional de la Cámara de Comercio e Industria de Arequipa	\N	\N	\N	\N	CAMARA DE COMERCIO E INDUSTRIA DE AREQUIPA	Revista	\N	\N	78 paginas	\N	\N	\N	\N	t	\N
1003371	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Cremas y Mousses (tomo 4)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Corazón de crema. Crema chantilly de chocolate de leche o bitter. Crema de lúcuma a mi estilo. Crema de zabaglione. Crema pastelera. Créme brulée. Créme caramel. Delicia de mango. Ganache de chocolate. Islas flotantes. Leche cocida a la vainilla y aroma de limón. Panna cotta de vainilla con frutas rojas. Pots de créme de vainilla. Soufflé de frambuesas. Soufflé de vainilla. Tocino del cielo. Zabaglione clásico.	t	\N
1003434	Administración 	PODER: 2012 EN IMÉGENES	Moises Navarro Palacios	\N	\N	\N	\N	ENTERPRISE	Revista	Español	Revista	136 paginas	-	Peru	2012	\N	t	\N
1003435	\N	Calidad Total - Ley 29783	SGS del Peru S.A.C.	\N	\N	\N	\N	\N	REVISTA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003436	Administracion	EMPRENDEDORES QUE FORMAN EMPRENDEDORES	Universidad San Ignacio De Loyola	\N	\N	\N	\N	Editora Argentina S.R.L.	Revista	Español	Revista	189 paginas	-	Lima	2018	\N	t	\N
1003372	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Galletas y Dulces pequeños (tomo 6)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Barritas de limón. Canelles. Cigarros de chocolate (Pirouettes). Galletas aplastadas con mermelada de frambuesas. Galletas de anís. Galletas de dos colores. Galletas de pistola Cookie Press.Galeetas pizzelle. Galletas short bread. Lengûitas de gato. Macarrones. Madeleines o magdalenas de limón. Papelitos de almendras. Phyllitos de almendras y azúcar. Rombitos de coco y nueces de Macadamia. Sablés vienesas. Tejas de almendras y azúcar rubia. Tejas de coco.	t	\N
1003373	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Helados (tomo 9)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Granita de melón. Helado de canela. Helado de chocolate. Helado de coco. Helado de dulce de leche. Helado de fresas. Helado de vainilla. Queso helado. Savarín helado de limón. Semifreddo de café. Semifreddo de fresas. Semifreddos de lúcuma. Sorbete de chicha morada. Sorbete de frambuesa. Sorbete de mango. Sorbete de manzanas verdes. Sorbete de peras. Soufflé helado Grand Marnier.	t	\N
1003374	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Levduras (tomo 7)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Babah al ron individuales. Bombolini. Brioche Nanterre. Brioches individuales (receta madre). Challah. Danish Pastry de melocotón. Doughnuts. Kughelhopf. Molinillos de Danish Pastry. Pancitos de pasas. Rollos de canela. Rosca de nueces y frutas. Savarín. Tarta Tropezienne. Trensa de Danish Prastry. Waffles belgas.	t	\N
1003375	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Masa Choux (tomo 3)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Bolitas de parmesano. Cisnes de choux. Coronitas de choux rellenas de crema pastelera de café. Cúpulas de profiteroles rellenas de crema pastelera. Eclairs rellenos con crema chantilly de chocolate. Enrejado de choux con frutos del bosque. Gnocchis a la parisién. Gourgeres. Masa choux (masa madre). París-Brest. Profiteroles azucarados. Profiteroles de chocolate. Profiteroles rellenos de helado de vainilla. Relámpagos con caramelo y crema chantilly. Saint Honoré. Tarta de choux.	t	\N
1003376	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Masa Hojaldre (tomo 1)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Arlettes. Cornetas de hojaldre. Crema de champiñones. Empanadas de alcachofa. Empanadas dulces de manzana. Enrejado de hojaldre y melocotón. Masa hojaldre. Mil hojas de frambuesas con crema pastelera. Orejas de elefante. Palitos de hojaldre con queso parmesano y ajonjolí. Palitos de hojaldre dulces con canela y almendras. Palmiers de parmesano y páprika. Palmiers u orejitas de chancho. Pastelitos de hojaldre rellenos de frutas frescas. Tarta de frutas con masa hojaldre. Tarta pascualina de berenjenas. Tarta tatin de peras. Torta pithiviers.	t	\N
1003377	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Navidad (tomo 10)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Casita de Navidad. Corona navideña con frutas de maná. Galletas cinco tipos. Galletas con cintas de organza. Galletas de arbolitos. Muñecos de gingerbread. Pan de especias. Queque de Navidad con frutas escarchadas. Queque de Navidad con decoración de frutas secas. Rugelach. Tartaletas de estrellas con relleno navideño. Terrina de frutos del bosque. Terrina navideña de tres chocolates. Topiario con fresas de maná.	t	\N
1003378	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Postres Peruanos (tomo 8)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginas	Primera Edicion	Lima	2008	Alfajores clásicos. Alfajor de miel. Arroz con leche. Cocaditas. Encanelado. Frejol colado. Guargûeros. Huevo chimbo. Mazamorra morada. Picarones. Pionono de manjar blanco. Ranfañote. Suspiro de limeña. Suspiro de lúcuma. Turrón de doña pepa. Volador.	t	\N
1003379	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Tartas y Pies	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79 paginad	Primera Edicion	Lima	2008	Cafloutis de cerezas o uvas. Crostata de fresas. Masa de tartas y pies. Pie de manzana a la normanda con crema de almendras. Pie de manzana clásico. Pie de pecanas clásico. Pie gallette de melocotones. Tarta de cítricos. Tarta de frambuesas. Tarta de fresas. Tarta de limón a la francesa. Tarta de mango. Tarta de manzanas a la fracensa. Tarta de piña cocada. Tarta de zapallo loche. Tarta de zarzamoras o de saóco con estrellitas. Tarta mosaico frutos del bosque e higos. Tartaletas individuales con chocolate y fresas.	t	\N
1003380	Gastronomia	Uno 2 tres Aprendiendo con Sandra Plevisani-Tortas y Queques (tomo 5)	Sandra Plevisani	\N	\N	\N	\N	Cantabria S.A.C.	Receta	Español	Revista	79paginas	Primera Edicion	Lima	2008	\N	t	\N
1003381	\N	UNSA Willasunki, Setiembre 2016 Boletin Informativo N° 02	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N
1003382	\N	VANIDADES LA MEJOR COCINA	Sara Barcelo Castany	\N	\N	\N	\N	CONTINENTAL	Revista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003383	Formacion humana	Veritas año 20 N° 111 abril 2018	\N	\N	\N	\N	\N	USMP	Revista	Español	Revista	34	Primera Edicion	Lima	2018	\N	t	\N
1003384	Formacion humana	Veritas N° 109, julio 2017	\N	\N	\N	\N	\N	USMP	Revista	Español	Revista	34	Primera Edicion	Lima	2017	\N	t	\N
1003385	Formacion humana	Veritas N° 110, octubre 2017	\N	\N	\N	\N	\N	USMP	Revista	Español	Revista	34	Primera Edicion	Lima	2017	\N	t	\N
1003386	Formacion humana	Veritas N°113 Mayo 2019	\N	\N	\N	\N	\N	USMP	Revista	Español	Revista	33	Primera Edicion	Lima	2019	\N	t	\N
1003387	Formacion humana	Véritas Volumen N° 15 N° 1	Universida Catolica de Santa Maria	\N	\N	\N	ISSN 1684-7822	USMP	Revista	Español	Revista	\N	\N	\N	\N	\N	t	\N
1003388	\N	Visita al Papa Francis al Perú - 2018	Conferencia Episcopal peruana	\N	\N	\N	\N	\N	Revista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003389	\N	Visita del Papa Francisco al Perú 2018	\N	\N	\N	\N	\N	\N	Revista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003390	\N	Vlad Draculea el autentico Drácula	\N	\N	\N	\N	\N	NATIONAL GEOGRAPHIC	Revista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003391	\N	Vuela pajarillo	\N	\N	\N	\N	\N	A.T.E.	Literatura/Obras	\N	\N	\N	\N	\N	\N	\N	t	\N
1003392	\N	Vuelven las golondrinas	\N	\N	\N	\N	\N	A.T.E.	Literatura/Obras	\N	\N	\N	\N	\N	\N	\N	t	\N
1003393	\N	WARI 7	\N	\N	\N	\N	\N	SEPTIEMBRE SAC	Resvista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003394	\N	Welcome to MIAMI and the BEACHES	\N	\N	\N	\N	\N	\N	Revista	\N	\N	\N	\N	\N	\N	\N	t	\N
1003395	\N	Yaku Agua de los Andes	\N	\N	\N	\N	\N	\N	Literatura	\N	\N	\N	\N	\N	\N	\N	t	\N
1003396	\N	Yan Can Cook	Martin Yan	\N	\N	\N	ISBN 0-385-23412-0	\N	Gastronomia	\N	\N	\N	\N	\N	\N	\N	t	\N
1003397	\N	YUNTA - INSPIRANDO	\N	\N	\N	\N	\N	\N	REVISTA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003437	Administracion	COPPER: Intertational Copper association	Copper Conneects Life	\N	\N	\N	\N	Copper	Libro	Español	Libro	38 paginas	-	USA	-	\N	t	\N
1003398	Cristianismo	Yves Semen La sexualidad según Juan Pablo II	Descleé de Brouwer Bilbao	\N	\N	\N	\N	Desclée de Brouwer S.A.	Sexualidad	Español	Libro	180 páginas	Primera	Madrid	2005	Juan Pablo II: Un enfoque inédito de la sexualidad. La teología tradicional del matrimonio. La "red Wujek". La Tienda del orfebre y Amor y responsabilidad. La encíclica Humanae Vitae. La teología del cuerpo. El plan de dios sobre la sexualidad humana. La soledad original. La unidad del principio. La desnudez de la inocencia. El canto de amor, testigo del principio. La significación esponsal del cuerpo. El pecado, el deseo y la concupiscencia. El pecado de los orígenes. La verguenza sexual. El dominio. La división. El amor más fuerte que la muerte. El matrimonio, la redención y la resurrección. El matrionio sacramento. La redención del cuerpo. L a resurrección y el final del matrimonio. La virginidad "por el Reino". El signo de las bodas del Cordero. La sexualidad y la santidad. La norma de acto conyugal. La luz de la teología del cuerpo. El acto sexual, lenguaje de comunión. La castidad, camino de libertad y de santidad. Profetas del cuerpo. Conclución. Agradecimientos.	t	\N
1003399	\N	Sabores e Cores das Minas Gerais	\N	\N	\N	\N	\N	Senac	Gastronomia	\N	\N	\N	\N	\N	\N	\N	t	\N
1003400	ADMINISTRACION	ÉTICA EN LOS NEGOCIOS (Conceptos y casos)	Manuel G. Velasquez	\N	\N	\N	970-26-0787-6	Pearson	Administración	Español	libro	437	sexta edicion	mexico	2006	\N	t	\N
1003401	\N	DIRECCIÓN ESTRATÉGICA: La estrategia de negocio	Biblioteca IESE	\N	\N	\N	84-413-0600-1	Canon editorial	Administración	Español	\N	\N	\N	\N	\N	\N	t	\N
1003402	administracion	La accion social de la empresa	Teresa Serra	\N	\N	\N	\N	Prentice Hall	Administración	español	libro	285 paginas	primera edicion	españa	2003	\N	t	\N
1003403	\N	LA REGENERACIÓN DE LA EMPRESA: Las raices culturales de la estrategia EJ2	Biblioteca IESE	\N	\N	\N	84-413-0600-1	Canon editorial	Administración	Español	\N	\N	\N	\N	\N	\N	t	\N
1003404	\N	LA REGENERACIÓN DE LA EMPRESA: Las raices culturales de la estrategia	Biblioteca IESE	\N	\N	\N	84-413-0600-1	\N	Administración	\N	\N	\N	\N	\N	\N	\N	t	\N
1003405	\N	LA GERENCIA EN LA SOCIEDAD FUTURA	Peter F. Drucker	\N	\N	\N	958-04-7046-4	\N	Administración	Español	\N	\N	\N	\N	\N	\N	t	\N
1003406	\N	VIDA DE CONSUMO	ZYGMUNT BAUMAN	\N	\N	\N	978-968-16-8499-0	Fondo de cultura econòmica	Administración	Español	\N	\N	\N	\N	\N	\N	t	\N
1003407	Administraciòn	Preparacion y Evaluacion de Proyectos	Nassir Sapag Chain y Reinaldo Sapag Chan	\N	\N	\N	\N	-	Administración	Español	Libro	404 paginas	3ra edicion	Colombia	1995	\N	t	\N
1003408	Administraciòn	Memoria Anual 2006	Grupo ACP	\N	\N	\N	\N	-	Administración	Español	reporte de empresa	87	-	Lima	2006	\N	t	\N
1003409	\N	Memoria anual 2016	Sociedad Nacional de mineria petrolera	\N	\N	\N	\N	\N	Administración	\N	\N	\N	\N	\N	\N	\N	t	\N
1003410	\N	Inkabor	The Grupo Colorobia	\N	\N	\N	\N	\N	REVISTA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003411	\N	Division Sur del Peru	Strata Copper	\N	\N	\N	\N	\N	REVISTA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003412	Administraciòn	CRISTÓBAL COLÓN, EL EMPRENDEDOR	Rodrigo Moreno Jeria	\N	\N	\N	978-612-45325-0-8	EY Building a better working world	Administración	Español	Libro	151	PRIMERA	Lima	2016	Proemio. Introducción. El mundo de tiempos de Colón. Redescubriendo el personaje: los primeros años del emprendedor. Un proyecto innovador y los sectores de un gran emprendimiento. El capital humano: ¿Presidiarios para un proyecto de alta inversión? El primer viaje. Cuando llega la hora de la ejecucioón del proyecto. Los otros viajes: probar lo imposible, el olvido de la gestión y la muerte. Derrivando los últimos mitos. Reflexiones para las empresas y los negocios. Bibliografía.	t	\N
1003413	\N	Guía de negocios e inversión en el Perú (2016-2017))	Proinversión	\N	\N	\N	\N	Editorial Ey Perú	ADMINISTRACIÓN	\N	\N	\N	\N	\N	\N	\N	t	\N
1003414	Administraciòn	Alle radici del capitalismo	Oreste Bazzichi	\N	\N	\N	\N	Effata Editrichi	ADMINISTRACIÓN	Portugues	LIbro	175 paginas	Primera	\N	\N	\N	t	\N
1003415	Administraciòn	Contabilidad y negocios (2007)	Óscar Díaz Becerra	\N	\N	\N	1992-1896	universidad catolica del peru	CONTABILIDAD	Español	REVISTA	 54 paginas	Primera	Torino	2003	\N	t	\N
1003416	Administraciòn	Revista de Investigación	Universidad Católica San Pablo	\N	\N	\N	\N	Universidad Católica San Pablo	ADMINISTRACIÓN	Español	libro	167	primera	Lima	2011	\N	t	\N
1003417	Administraciòn	Memoria Anual 2012	Caja Municipal Arequipa	\N	\N	\N	\N	Layconsa	Administración	Español	Reporte de empresa	117 paginas	\N	\N	\N	\N	t	\N
1003418	Administraciòn	Memoria Anual 2012 EJ2	Caja Municipal Arequipa	\N	\N	\N	\N	Layconsa	Administración	Español	Reporte de empresa	117 paginas	\N	\N	\N	\N	t	\N
1003419	Administraciòn	Memoria Anual 2012	Sociedad Nacional de Mineria Petroleo y Energia	\N	\N	\N	\N	\N	Administración	Español	Reporte empresarial	239	-	Lima	2012	\N	t	\N
1003420	\N	REPORTE ANUAL CAJA AREQUIPA 2017 EJ2	\N	\N	\N	\N	\N	\N	LIBRO	\N	\N	\N	\N	\N	\N	\N	t	\N
1003421	Administración 	Memoria Anual 2009	Mi Banco	\N	\N	\N	\N	-	Reporte de Administración	Español	Reporte de empresa	217	-	Lima	2009	Declaración de responsabilidad. Carta del presidente del directorio a los accionistas. Perfil de organización. Gobierno corporativo. Responsabilidad social corporativa. Premios y distinciones. Experiencia y trayectoria. Estados financieros. Iniciativa de reporte global. Relación de agencias.	t	\N
1003422	Administración 	Memoria Anual 2010	Mi Banco	\N	\N	\N	\N	-	Reporte de Administración	Español	Reporte de empresa	239	-	Lima	2010	Declaració de responsabilidad. Carta del presidente del direcctorio a los accionistas. Perfil de organización. Gobierno corporativo. Responsabilidad social corporativa.Premios y distinciones. Experiencia y trayectoria. Estados financieros. Iniciativa de	t	\N
1003423	ADMINISTRACIÓN	Compartamos Banco 20 años de sueños para Mexico	Compartamos Banco	\N	\N	\N	\N	MVS EDITORIAL	Administración	Español	Reporte de empresa	143	Primera	Mexico	2010	Razones para festejar a Mexico. El principio de un sueño. Semillero de oportunidades. Sueños para mexico. Vocacion social. Ante el futuro.	t	\N
1003424	Administracion	Corporaciòn educativa 1968-2018	Usil	\N	\N	\N	\N	Fondo editorial	Administración	Español	Libro	221 paginas	-	Peru	2018	\N	t	\N
1003425	\N	a	Edelnor	\N	\N	\N	\N	EDELNOR	Administración	\N	\N	\N	\N	\N	\N	\N	t	\N
1003426	Administración 	INTEGRACIÓN Y BUENA VECINDAD	Kevin Rodríguez, Diego Riquelme	\N	\N	\N	978-9972-671-67-8	EQUIS EQUIS S.A.	Administración	Español	LIBRO	55 PAGINAS	PRIMERA	PERU	2020	\N	t	\N
1003427	Administración 	Negocios & Futbol	Semana Economica	\N	\N	\N	\N	-	Administración	Español	REVISTA	180	-	Lima	2016	\N	t	\N
1003428	Administración 	Luces y sombras del pensamiento económico moderno	Hugo Ferullo	\N	\N	\N	950-554-494-4	Universidad Nacional de Tucuman	REVISTA	Español	Libro	187 paginas	-	argentina	2006	\N	t	\N
1003429	Administración 	ALIANZA DEL PACÍFICO : Situación, perspectivas y propuestas para su consolidación	Fabian Novak	\N	\N	\N	978-9972-671-55-5	EQUIS EQUIS S.A.	Administración	Español	Libro	159 paginas	\N	\N	\N	\N	t	\N
1003430	\N	Estudios de Grado	Universidad Catolica San Antonio	\N	\N	\N	\N	\N	Administración	\N	\N	\N	\N	\N	\N	\N	t	\N
1003431	Administración 	CÓDIGO PENAL: LEY DE TERRORISMO-NARCOTRÁFICO	Humberto Carranza	\N	\N	\N	\N	RODHAS	Administración	Español	Libro	542	-	Lima	1994	\N	t	\N
1003432	\N	¿Como exportar a Brasil por interoceanica?	Luis Ernesto Caceres Angulo	\N	\N	\N	\N	\N	Administración	\N	\N	\N	\N	\N	\N	\N	t	\N
1003433	Administración 	EL MISTERIO DEL CAPITAL	Hernando de Soto	\N	\N	\N	0-465-01614-6	El Comercio	Administración	Español	Libro	287	Primera	Lima	2000	Los cinco misterios del capital. El misterio de la información ausente. Una revolución sorpresa 41. Los obstáculos  de la legalidad 42. El sector subcapitalizado 49. ¿Cuántos capital muerto? 51. ¿Cuántos vale este capital merto? 53. Hextárias de diamantes 65. El misterio del capital. Claves del pasado (de Smith a Marx) 70. La energía potencial de los activos 74. El proceso de conversión oculto de occidente 76. Efecto  de la propidad n.º 1: fijando el potencial económico de los activos 79. Efecto de la  propiedad n.º 2: integrado de la información  dispersa  a un solo sistema 81. Efecto de la propiedad n.º 3: volviendo resonsables a las personas 84. Efectos de la propidad n.º 4: volviendo fungibles a las activos 86. Efecto de la propiedad n .º 5: personas en red 88. Efecto de la propiedad n.º 6: protegiendo transacciones 91. Capital y dinero 92. La campana de vidrio de Braudel 96. El ministerio de la conciencia política 99 º. Punto ciego I: LA VIDA FUERA DE LA CAMPANA DE VIDRIO HOY 105. Ciudades que crecen 106. La marcha a las ciudades 109. Los pobres  asu casa 111. Creciente  extralegalidad 113. Los  extralegales han llegado para quedarse 115. Es una vieja historia 120. PUNTO CIEGO II: LA VIDA FUERA DE LA CAMPANA DE VIDRIO ANTAÑO 121. El desplazamiento a las ciudades 121. El surgimiento de la extralegalidad 123. El desmoronamiento del antiguo orden 126. Finalmente: 300 años depues 129. Las lecciones no aprendidas de la historia de los estados unidos 133. El parelelo con la historia de los estados unidos 136. Dejando atras la anticuada ley británica 138. Una temprana tradicion estadounidense: invadir tierras 141. El nuevo contrato social: "los derechos de tomahawk" 144.  Matando al alguacil 145. El salto legal:"Derecho preferente de compra" 147. Mas obstaculos legales: mas extra legales 148. El paramo legal o un choque de sistemas legales 155. Los esfuerzos  del estado  por retirar la canpaña de vidrio 157. Los esfuerzos federales por retirar la canpaña de vidrio 161. Los exsfuersos extralegales por retirar la campaña de vidrio 163. Las asociaciones de denuncios 164. Las organizaciones de mineros 167. Los relevante para los países de tercer mundo y los que salen del comunismo 175. El ministro del frasco legal : por qué la ley de la propiedad no funciona fuera de occidente 179. Parte I: El desafío jurídico 186. El desplazamiento desde un sistema de propiedad precapitalista hasta una capitalista 190. El frasco de la ley preceptiva 191. Arriagando la legislacion en el contrato social 198. La solidez de los contratos sociales precapitalistas 201. Escuchando ladrar a los perros 204. Decodificando la ley extralegal 208. Parte II: El desafio politico 212. Asumido la perspectiva de los pobres 214. Cooptando a las elites 217. Tratando con los custodios de la campana de vidrio 221. Los abogados 221. Los técnicos 225. A manera de conclusión 231. El club privado de la globalización 231. Considerando al fantasma de mark 236. L apropiedad es un amigable instrumento para que la mente capte el capital 242. Los enemigos de las representaciones 246. ¿Es cultura el éxito en el capitalismo? 248. La única carta disponible 250.	t	\N
1003438	Administración	Memoria Anual 2006	Gloria	\N	\N	\N	\N	-	Administración	Español	Reporte de empresa	163	-	Lima	2006	Visión. Misión. Valores. Matriz de la gobernabilidad. Menzaje del presidente. Nuestra organización. Grupo ACP. Mi banco. Secura corredores de seguro SA.  Aprenda. Vivencia. Futura. Estados financieros. Dictamen de los auditorios independientes. Balansa general consolidado. Estados consolidado de ingresos y egresos. Estado consolidado de cambios en el patrimonio neto institucional. Estado consolidado de flujos de efectivo. Notas a los estados financieros consolidados. Treyectoria profesional del consejo directivo y la gerencia. Datos generales.	t	\N
1003439	Administración	Memoria Anual 2006	Grupo ACP	\N	\N	\N	\N	\N	Administración	Español	Reporte de empresa	\N	\N	\N	\N	\N	t	\N
1003440	\N	Guia Trucos y Secretos del Barman	Lalo Martins	\N	\N	\N	\N	Septiembre	REVISTA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003441	\N	Secretos del Chef EJ3	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	320 páginas	\N	\N	\N	\N	t	\N
1003442	\N	Secretos del Chef EJ4	El Comercio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	320 páginas	\N	\N	\N	\N	t	\N
1003443	\N	Del tacu tacu a la pachamanca	Gaston Acurio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003444	\N	Folder de recetario	Cheff Cecilia Espinosa	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003445	\N	De las sopas, sudados, chupes y otros menesteres de cuchara	Gaston Acurio	\N	\N	\N	\N	el comercio SA.	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003446	\N	Arequipa, Miembro de la red ciudades creativas en gastronomia por unesco	Sergio Salas Yarro	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003447	\N	Manos Navideñas	Angelica Sasaki	\N	\N	\N	\N	Q.W Editores	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003448	\N	EVALUACION SENSORIAL Y CATA	REENA POSTIGO REYES	\N	\N	\N	\N	FUNDICION EMILIO MORO	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003449	\N	LIBRO RECETA FASCICULOS	EL COMERCIO	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003450	\N	LOS SECRETOS DEL HORNO	PAUL KEMP	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003451	\N	LA CASA DEL PANADERO;CURSO DE PANADERIA PROFESIONAL	PALMA TROPICAL	\N	\N	\N	\N	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
1003453	\N	\N	Michel Stafford, Michael w.	\N	\N	\N	\N	\N	FORMACIÒN HUMANA	ESPAÑOL	lIBRO	257 Pàginas	Perù Nº2010-11386	Lima	2010	\N	t	\N
1003452	\N	Anis Najar: 165 años de alquimia arequipeña	\N	\N	\N	\N	978-612-48165-0-5	\N	GASTRONOMÍA	\N	\N	\N	\N	\N	\N	\N	t	\N
\.


--
-- Data for Name: libros_favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros_favoritos (id_favorito, codigo, registro, created_at) FROM stdin;
1	54321	1003452	2025-11-02 16:27:36.513384
2	54321	1003453	2025-11-02 16:27:37.510763
\.


--
-- Name: Prestamos_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Prestamos_id_prestamo_seq"', 1, true);


--
-- Name: Sancions_id_sancion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sancions_id_sancion_seq"', 77, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 9, true);


--
-- Name: libros_favoritos_id_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_favoritos_id_favorito_seq', 2, true);


--
-- Name: libros_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_registro_seq', 1003453, true);


--
-- Name: Prestamos Prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamos"
    ADD CONSTRAINT "Prestamos_pkey" PRIMARY KEY (id_prestamo);


--
-- Name: Sancions Sancions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sancions"
    ADD CONSTRAINT "Sancions_pkey" PRIMARY KEY (id_sancion);


--
-- Name: Users Users_apellidos_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_apellidos_key" UNIQUE (apellidos);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_nombre_key" UNIQUE (nombre);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Usuario_cedhis Usuario_cedhis_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario_cedhis"
    ADD CONSTRAINT "Usuario_cedhis_email_key" UNIQUE (email);


--
-- Name: Usuario_cedhis Usuario_cedhis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario_cedhis"
    ADD CONSTRAINT "Usuario_cedhis_pkey" PRIMARY KEY (codigo);


--
-- Name: libros_favoritos libros_favoritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_favoritos
    ADD CONSTRAINT libros_favoritos_pkey PRIMARY KEY (id_favorito);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (registro);


--
-- Name: libros_favoritos unique_favorito; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_favoritos
    ADD CONSTRAINT unique_favorito UNIQUE (codigo, registro);


--
-- Name: Prestamos Prestamos_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamos"
    ADD CONSTRAINT "Prestamos_codigo_fkey" FOREIGN KEY (codigo) REFERENCES public."Usuario_cedhis"(codigo) ON UPDATE CASCADE;


--
-- Name: Prestamos Prestamos_registro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamos"
    ADD CONSTRAINT "Prestamos_registro_fkey" FOREIGN KEY (registro) REFERENCES public.libros(registro) ON UPDATE CASCADE;


--
-- Name: libros_favoritos fk_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_favoritos
    ADD CONSTRAINT fk_libro FOREIGN KEY (registro) REFERENCES public.libros(registro) ON DELETE CASCADE;


--
-- Name: libros_favoritos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_favoritos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (codigo) REFERENCES public."Usuario_cedhis"(codigo) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

