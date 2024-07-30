--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: acessar; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.acessar (
    id bigint NOT NULL,
    usuario_id integer,
    robo_id integer
);


ALTER TABLE public.acessar OWNER TO rpamanager;

--
-- Name: acessar_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.acessar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acessar_id_seq OWNER TO rpamanager;

--
-- Name: acessar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.acessar_id_seq OWNED BY public.acessar.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO rpamanager;

--
-- Name: diretor; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.diretor (
    id bigint NOT NULL,
    usuario_id integer
);


ALTER TABLE public.diretor OWNER TO rpamanager;

--
-- Name: diretor_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.diretor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diretor_id_seq OWNER TO rpamanager;

--
-- Name: diretor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.diretor_id_seq OWNED BY public.diretor.id;


--
-- Name: login; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.login (
    id bigint NOT NULL,
    usuario character varying(40),
    senha character varying,
    email character varying(50),
    ultimo_acesso timestamp without time zone
);


ALTER TABLE public.login OWNER TO rpamanager;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_id_seq OWNER TO rpamanager;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.municipio (
    id bigint NOT NULL,
    nome character varying(20),
    uf character varying(2)
);


ALTER TABLE public.municipio OWNER TO rpamanager;

--
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.municipio_id_seq OWNER TO rpamanager;

--
-- Name: municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.municipio_id_seq OWNED BY public.municipio.id;


--
-- Name: nivel; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.nivel (
    id bigint NOT NULL,
    nome character varying(40) NOT NULL
);


ALTER TABLE public.nivel OWNER TO rpamanager;

--
-- Name: nivel_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.nivel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nivel_id_seq OWNER TO rpamanager;

--
-- Name: nivel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.nivel_id_seq OWNED BY public.nivel.id;


--
-- Name: ordem_execucao; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.ordem_execucao (
    id bigint NOT NULL,
    n_execucao character varying(40) NOT NULL,
    created timestamp without time zone,
    usuario_id integer,
    robo_id integer,
    unidade_id integer,
    status_execucao character varying(50)
);


ALTER TABLE public.ordem_execucao OWNER TO rpamanager;

--
-- Name: ordem_execucao_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.ordem_execucao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordem_execucao_id_seq OWNER TO rpamanager;

--
-- Name: ordem_execucao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.ordem_execucao_id_seq OWNED BY public.ordem_execucao.id;


--
-- Name: robos; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.robos (
    id bigint NOT NULL,
    nome character varying(40) NOT NULL,
    descricao character varying(200) NOT NULL
);


ALTER TABLE public.robos OWNER TO rpamanager;

--
-- Name: robos_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.robos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.robos_id_seq OWNER TO rpamanager;

--
-- Name: robos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.robos_id_seq OWNED BY public.robos.id;


--
-- Name: unidade; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.unidade (
    id bigint NOT NULL,
    nome character varying(200) NOT NULL,
    contato character varying(20),
    municipio_id integer,
    diretor_id integer
);


ALTER TABLE public.unidade OWNER TO rpamanager;

--
-- Name: unidade_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.unidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unidade_id_seq OWNER TO rpamanager;

--
-- Name: unidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.unidade_id_seq OWNED BY public.unidade.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: rpamanager
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    nome character varying(100),
    matricula character varying(15),
    cpf character varying(11),
    nascimento timestamp without time zone,
    sexo character varying(256),
    status integer,
    created timestamp without time zone,
    unidade_id integer,
    nivel_id integer,
    login_id integer
);


ALTER TABLE public.usuario OWNER TO rpamanager;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: rpamanager
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO rpamanager;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rpamanager
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: acessar id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.acessar ALTER COLUMN id SET DEFAULT nextval('public.acessar_id_seq'::regclass);


--
-- Name: diretor id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.diretor ALTER COLUMN id SET DEFAULT nextval('public.diretor_id_seq'::regclass);


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: municipio id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.municipio ALTER COLUMN id SET DEFAULT nextval('public.municipio_id_seq'::regclass);


--
-- Name: nivel id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.nivel ALTER COLUMN id SET DEFAULT nextval('public.nivel_id_seq'::regclass);


--
-- Name: ordem_execucao id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.ordem_execucao ALTER COLUMN id SET DEFAULT nextval('public.ordem_execucao_id_seq'::regclass);


--
-- Name: robos id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.robos ALTER COLUMN id SET DEFAULT nextval('public.robos_id_seq'::regclass);


--
-- Name: unidade id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.unidade ALTER COLUMN id SET DEFAULT nextval('public.unidade_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: acessar; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.acessar (id, usuario_id, robo_id) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.alembic_version (version_num) FROM stdin;
10d224287b45
\.


--
-- Data for Name: diretor; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.diretor (id, usuario_id) FROM stdin;
1	5
2	6
\.


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.login (id, usuario, senha, email, ultimo_acesso) FROM stdin;
1	SOARES	$2b$12$ClVmYQXq.byPP03JYRHfK.olnYfWRoT6xh8bfZI.ttlRPTbv7oIGa	soaresjoaopedro.ti@gmail.com	2024-04-11 15:19:13.014861
2	YUSLEY	$2b$12$NMZ3tw/6ac5Q4al0tCqT6edkqXbhiOjAQ25EZYwfWsfdkwe0GnZwq	yusley.costa@sonda.com	2024-04-11 15:22:58.875541
3	BEATRIZ.PAIVA	$2b$12$Wr6YdJYROqEcz4b.Wm7ze.xqHrJ3Gg5xipEohVCqktVCuE3KMZMTG	beatriz.paiva.rb@gmail.com	2024-04-11 15:26:00.661769
4	TELES	$2b$12$lZC6LQGP50/mG.FuhyxOAualrDua3vobA.GQmPF6/vmyrdL.xcVUa	jeffersontelesdealemeida@gmail.com	2024-04-11 15:31:40.875698
8	SONDA.VITORDN	$2b$12$pEsbxgnybtRLC3yxaZJkheKuEHFqhD9vKuiEYFHxeKQ7y.MrTufOm	vitorcunha.ti@gmail.com	2024-04-12 13:30:41.995422
11	ALDENIZE	$2b$12$dtvJ45FgpEX3sTdq4T8a0u7T9z5yo2NkOR1Fl9XckwMCWWhz.qBsm	aldenize.martins@tjac.jus.br	2024-04-18 14:34:46.45497
\.


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.municipio (id, nome, uf) FROM stdin;
1	Acrelândia	AC
2	Assis Brasil	AC
3	Brasiléia	AC
4	Bujari	AC
5	Capixaba	AC
6	Cruzeiro do Sul	AC
7	Epitaciolândia	AC
8	Feijó	AC
9	Jordão	AC
10	Mâncio Lima	AC
11	Manoel Urbano	AC
12	Marechal Thaumaturgo	AC
13	Plácido de Castro	AC
14	Porto Acre	AC
15	Porto Walter	AC
16	Rio Branco	AC
17	Rodrigues Alves	AC
18	Santa Rosa do Purus	AC
19	Senador Guiomard	AC
20	Sena Madureira	AC
21	Tarauacá	AC
22	Xapuri	AC
\.


--
-- Data for Name: nivel; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.nivel (id, nome) FROM stdin;
1	ADM
2	SUPERVISOR
3	COMUM
\.


--
-- Data for Name: ordem_execucao; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.ordem_execucao (id, n_execucao, created, usuario_id, robo_id, unidade_id, status_execucao) FROM stdin;
15	0	2024-04-17 14:50:16.037707	5	1	1	ativo
16	10	2024-04-18 15:32:00.883573	1	1	1	ativo
\.


--
-- Data for Name: robos; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.robos (id, nome, descricao) FROM stdin;
1	DECURSO DE PRAZO	ROBO DE VENCIMENTO
\.


--
-- Data for Name: unidade; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.unidade (id, nome, contato, municipio_id, diretor_id) FROM stdin;
2	VARA UNICA - CIVEL	68000000000	1	\N
3	VARA UNICA - CRIMINAL	68000000000	1	\N
4	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	1	\N
5	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	1	\N
6	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	1	\N
7	DIRETORIA DO FORO	68000000000	1	\N
8	VARA DE PLANTAO	68000000000	1	\N
9	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	1	\N
10	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	2	\N
11	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	2	\N
12	VARA DE PLANTAO	68000000000	2	\N
13	DIRETORIA DO FORO	68000000000	2	\N
14	VARA UNICA - CRIMINAL	68000000000	2	\N
15	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	2	\N
16	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	2	\N
17	VARA UNICA - CIVEL	68000000000	2	\N
18	VARA CIVEL	68000000000	3	\N
19	VARA CIVEL	68000000000	3	\N
20	VARA CRIMINAL	68000000000	3	\N
21	VARA CIVEL - JUIZADO ESPECIAL	68000000000	3	\N
22	VARA CRIMINAL - JUIZADO ESPECIAL	68000000000	3	\N
23	CENTRAL DE EXECUCAO DE PENAS ALTERNATIVAS - CEPAL	68000000000	3	\N
24	DIRETORIA DO FORO	68000000000	3	\N
25	VARA CIVEL - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	3	\N
26	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS - TRANSITO	68000000000	3	\N
27	VARA DE PLANTAO	68000000000	3	\N
28	CENTRO JUDICIARIO DE SOLUCOES DE CONFLITOS E CIDADANIA	68000000000	3	\N
29	DIRETORIA DO FORO	68000000000	4	\N
30	VARA DE PLANTAO	68000000000	4	\N
31	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	4	\N
32	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	4	\N
33	VARA UNICA - CIVEL	68000000000	4	\N
34	VARA UNICA - CRIMINAL	68000000000	4	\N
35	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	4	\N
36	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	4	\N
37	VARA UNICA - CIVEL	68000000000	5	\N
38	VARA UNICA - CRIMINAL	68000000000	5	\N
39	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	5	\N
40	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	5	\N
41	(FORA DE USO) SERVENTIA EXTRAJUDICIAL DE PROTESTO	68000000000	5	\N
42	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	5	\N
43	DIRETORIA DO FORO	68000000000	5	\N
44	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	5	\N
45	VARA DE PLANTAO	68000000000	5	\N
46	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	5	\N
47	1 VARA CRIMINAL	68000000000	6	\N
48	2 VARA CRIMINAL	68000000000	6	\N
49	DIRETORIA DO FORO	68000000000	6	\N
50	1 VARA CIVEL	68000000000	6	\N
51	2 VARA CIVEL	68000000000	6	\N
52	JUIZADO ESPECIAL CIVEL	68000000000	6	\N
53	JUIZADO ESPECIAL CRIMINAL	68000000000	6	\N
54	CENTRAL DE EXECUCAO DE PENAS ALTERNATIVAS - CEPAL	68000000000	6	\N
55	JUIZADO ESPECIAL CIVEL - FAZENDA PUBLICA	68000000000	6	\N
56	VARA DA INFANCIA E DA JUVENTUDE	68000000000	6	\N
57	NUCLEO DE AUDIENCIA DE APRESENTACAO	68000000000	6	\N
58	VARA DE PROTECAO A MULHER E EXECUCOES PENAIS	68000000000	6	\N
59	VARA DE PLANTAO	68000000000	6	\N
60	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - CEJUSC	68000000000	6	\N
61	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS - TRANSITO	68000000000	6	\N
62	VARA UNICA - CRIMINAL	68000000000	7	\N
63	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	7	\N
64	VARA UNICA - CIVEL	68000000000	7	\N
65	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	7	\N
66	(FORA DE USO) SERVENTIA EXTRAJUDICIAL DE PROTESTO	68000000000	7	\N
67	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	7	\N
68	DIRETORIA DO FORO	68000000000	7	\N
69	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - CEJUSC	68000000000	7	\N
70	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	7	\N
71	VARA DE PLANTAO	68000000000	7	\N
72	DIRETORIA DO FORO	68000000000	8	\N
73	VARA DE PLANTAO	68000000000	8	\N
74	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - CEJUSC	68000000000	8	\N
75	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	8	\N
76	VARA CIVEL - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	8	\N
77	VARA CIVEL - JUIZADO ESPECIAL	68000000000	8	\N
78	VARA CRIMINAL - JUIZADO ESPECIAL	68000000000	8	\N
79	VARA CRIMINAL	68000000000	8	\N
80	VARA CIVEL	68000000000	8	\N
81	VARA DE PLANTAO	68000000000	10	\N
82	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	10	\N
83	VARA UNICA - CRIMINAL	68000000000	10	\N
84	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	10	\N
85	VARA UNICA - CIVEL	68000000000	10	\N
86	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	10	\N
87	DIRETORIA DO FORO	68000000000	10	\N
88	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	10	\N
89	DIRETORIA DO FORO	68000000000	11	\N
90	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	11	\N
91	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	11	\N
92	VARA DE PLANTAO	68000000000	11	\N
93	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	11	\N
94	VARA UNICA - CRIMINAL	68000000000	11	\N
95	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	11	\N
96	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	11	\N
97	VARA UNICA - CIVEL	68000000000	11	\N
98	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	13	\N
99	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	13	\N
100	VARA DE PLANTAO	68000000000	13	\N
101	VARA UNICA - CIVEL	68000000000	13	\N
102	DIRETORIA DO FORO	68000000000	13	\N
103	VARA UNICA - JUIZADO ESPECIAL	68000000000	13	\N
104	VARA UNICA - JUIZADO ESPECIAL	68000000000	13	\N
105	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	13	\N
106	VARA UNICA - CRIMINAL	68000000000	13	\N
107	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	14	\N
108	VARA DE PLANTAO	68000000000	14	\N
109	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	14	\N
110	VARA UNICA - CRIMINAL	68000000000	14	\N
111	DIRETORIA DO FORO	68000000000	14	\N
112	VARA UNICA - JUIZADO ESPECIAL DA FAZENDA PUBLICA	68000000000	14	\N
113	VARA UNICA - CIVEL	68000000000	14	\N
114	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	14	\N
115	1 VARA DE PROTECAO A MULHER	68000000000	16	\N
116	6 VARA CIVEL	68000000000	16	\N
117	1 VARA CIVEL	68000000000	16	\N
118	2 VARA CIVEL	68000000000	16	\N
119	3 VARA CIVEL	68000000000	16	\N
120	4 VARA CIVEL	68000000000	16	\N
121	5 VARA CIVEL	68000000000	16	\N
122	1 VARA CRIMINAL	68000000000	16	\N
123	VARA DE DELITOS DE ORGANIZACOES CRIMINOSAS	68000000000	16	\N
124	3 VARA CRIMINAL	68000000000	16	\N
125	VARA DE DELITOS DE ROUBO E EXTORSAO	68000000000	16	\N
126	1 VARA DA FAZENDA PUBLICA	68000000000	16	\N
127	2 VARA DE FAZENDA PUBLICA DE RIO BRANCO	68000000000	16	\N
128	2 VARA DO TRIBUNAL DO JURI E AUDITORIA MILITAR	68000000000	16	\N
129	1 VARA DE FAMILIA	68000000000	16	\N
130	2 VARA DE FAMILIA	68000000000	16	\N
131	3 VARA DE FAMILIA	68000000000	16	\N
132	VARA DE REGISTROS PUBLICOS, ORFAOS E SUCESSOES E DE CARTAS PRECATORIAS CIVEIS	68000000000	16	\N
133	VARA DE ORFAOS E SUCESSOES	68000000000	16	\N
134	2 VARA CRIMINAL	68000000000	16	\N
135	VARA DE EXECUCOES PENAIS	68000000000	16	\N
136	VARA DE EXECUCOES DE PENAS E MEDIDAS ALTERNATIVAS	68000000000	16	\N
137	DIRETORIA DO FORO	68000000000	16	\N
138	1 VARA DO TRIBUNAL DO JURI	68000000000	16	\N
139	VARA DE EXECUCAO FISCAL	68000000000	16	\N
140	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA	68000000000	16	\N
141	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	16	\N
142	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - OCA	68000000000	16	\N
143	VARA DE PLANTAO	68000000000	16	\N
144	2 VARA DE PROTECAO A MULHER	68000000000	16	\N
145	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - UNINORTE	68000000000	16	\N
146	JUIZADO ESPECIAL DA FAZENDA PUBLICA	68000000000	16	\N
147	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS - TRANSITO	68000000000	16	\N
148	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS  CIVEIS DE RIO BRANCO	68000000000	16	\N
149	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS - FAAO	68000000000	16	\N
150	CEJUSC - CASA DA CIDADANIA	68000000000	16	\N
151	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA DOS JUIZADOS ESPECIAIS - ITINERANTE	68000000000	16	\N
152	3 JUIZADO ESPECIAL CIVEL	68000000000	16	\N
153	1 JUIZADO ESPECIAL CIVEL	68000000000	16	\N
154	2 JUIZADO ESPECIAL CIVEL	68000000000	16	\N
155	1 JUIZADO ESPECIAL CRIMINAL	68000000000	16	\N
156	JUIZADO ESPECIAL CRIMINAL	68000000000	16	\N
157	1 VARA DA INFANCIA E DA JUVENTUDE	68000000000	16	\N
158	2 VARA DA INFANCIA E DA JUVENTUDE	68000000000	16	\N
159	DIRETORIA DO FORO	68000000000	17	\N
160	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	17	\N
161	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	17	\N
162	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	17	\N
163	VARA UNICA - CIVEL	68000000000	17	\N
164	VARA UNICA - CRIMINAL	68000000000	17	\N
165	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	17	\N
166	VARA DE PLANTAO	68000000000	17	\N
167	VARA DE PLANTAO	68000000000	19	\N
168	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	19	\N
169	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	19	\N
170	VARA CIVEL	68000000000	19	\N
171	DIRETORIA DO FORO	68000000000	19	\N
172	VARA CRIMINAL	68000000000	19	\N
173	VARA CRIMINAL - JUIZADO ESPECIAL	68000000000	19	\N
174	VARA CIVEL - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	19	\N
175	VARA CIVEL - JUIZADO ESPECIAL	68000000000	19	\N
176	DIRETORIA DO FORO	68000000000	20	\N
177	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	20	\N
178	VARA DE PLANTAO	68000000000	20	\N
179	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	20	\N
180	VARA CIVEL - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	20	\N
181	VARA CIVEL - JUIZADO ESPECIAL	68000000000	20	\N
182	VARA CIVEL	68000000000	20	\N
183	VARA CRIMINAL - JUIZADO ESPECIAL	68000000000	20	\N
184	VARA CRIMINAL	68000000000	20	\N
185	NUCLEO DE AUDIENCIA DE APRESENTACAO	68000000000	21	\N
186	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA - CEJUSC	68000000000	21	\N
187	VARA DE PLANTAO	68000000000	21	\N
188	VARA CIVEL	68000000000	21	\N
189	DIRETORIA DO FORO	68000000000	21	\N
190	VARA CRIMINAL - JUIZADO ESPECIAL	68000000000	21	\N
191	VARA CIVEL - JUIZADO ESPECIAL	68000000000	21	\N
192	VARA CIVEL - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	21	\N
193	VARA CRIMINAL	68000000000	21	\N
194	DIRETORIA DO FORO	68000000000	22	\N
195	VARA UNICA - CIVEL	68000000000	22	\N
196	VARA UNICA - CRIMINAL	68000000000	22	\N
197	VARA UNICA - JUIZADO ESPECIAL CIVEL	68000000000	22	\N
198	VARA UNICA - JUIZADO ESPECIAL CRIMINAL	68000000000	22	\N
199	VARA UNICA - JUIZADO ESPECIAL DE FAZENDA PUBLICA	68000000000	22	\N
200	NUCLEO DE AUDIENCIAS DE APRESENTACAO	68000000000	22	\N
201	CENTRO JUDICIARIO DE SOLUCAO DE CONFLITOS E CIDADANIA -CEJUSC	68000000000	22	\N
202	VARA DE PLANTAO	68000000000	22	\N
1	GESIS - RPA	68000000000	16	1
203	CENTRO DE PROCESSAMENTO ELETRONICO 	68992827979	16	2
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: rpamanager
--

COPY public.usuario (id, nome, matricula, cpf, nascimento, sexo, status, created, unidade_id, nivel_id, login_id) FROM stdin;
1	JOÃO PEDRO SOARES DE OLIVEIRA PASSOS	59263	02546423223	2000-10-22 00:00:00	HOMEM CISGENERO	1	2024-04-11 15:19:13.019605	1	1	1
3	BEATRIZ COSTA DE PAIVA	10002070	05147693270	2001-04-19 00:00:00	MULHER CISGENERO	1	2024-04-11 15:26:00.662715	1	1	3
4	JEFFERSON VASCONCELOS TELES DE ALMEIDA	10002073	09299953503	2002-05-14 00:00:00	HOMEM CISGENERO	1	2024-04-11 15:31:40.876653	1	1	4
2	YUSLEY COSTA DOS SANTOS	63528	03825596222	2000-08-14 00:00:00	HOMEM CISGENERO	1	2024-04-11 15:22:58.876554	1	1	2
5	VITOR DANIEL DO NASCIMENTO CUNHA	59563	02134439297	2000-01-14 00:00:00	Homem cisgenero	1	2024-04-12 13:30:41.997208	1	1	8
6	ALDENIZE PEREIRA DO NASCIMENTO MARTINS	7001555	59131667287	1978-05-05 00:00:00	MULHER CISGENERO	1	2024-04-18 14:34:46.466838	203	1	11
\.


--
-- Name: acessar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.acessar_id_seq', 1, false);


--
-- Name: diretor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.diretor_id_seq', 2, true);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.login_id_seq', 11, true);


--
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.municipio_id_seq', 1, false);


--
-- Name: nivel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.nivel_id_seq', 1, false);


--
-- Name: ordem_execucao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.ordem_execucao_id_seq', 16, true);


--
-- Name: robos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.robos_id_seq', 1, false);


--
-- Name: unidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.unidade_id_seq', 203, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rpamanager
--

SELECT pg_catalog.setval('public.usuario_id_seq', 6, true);


--
-- Name: acessar acessar_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.acessar
    ADD CONSTRAINT acessar_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: diretor diretor_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.diretor
    ADD CONSTRAINT diretor_pkey PRIMARY KEY (id);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: login login_usuario_key; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_usuario_key UNIQUE (usuario);


--
-- Name: municipio municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);


--
-- Name: nivel nivel_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.nivel
    ADD CONSTRAINT nivel_pkey PRIMARY KEY (id);


--
-- Name: ordem_execucao ordem_execucao_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.ordem_execucao
    ADD CONSTRAINT ordem_execucao_pkey PRIMARY KEY (id);


--
-- Name: robos robos_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.robos
    ADD CONSTRAINT robos_pkey PRIMARY KEY (id);


--
-- Name: unidade unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_cpf_key UNIQUE (cpf);


--
-- Name: usuario usuario_matricula_key; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_matricula_key UNIQUE (matricula);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: acessar acessar_robo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.acessar
    ADD CONSTRAINT acessar_robo_id_fkey FOREIGN KEY (robo_id) REFERENCES public.robos(id);


--
-- Name: acessar acessar_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.acessar
    ADD CONSTRAINT acessar_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: diretor diretor_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.diretor
    ADD CONSTRAINT diretor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: ordem_execucao ordem_execucao_robo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.ordem_execucao
    ADD CONSTRAINT ordem_execucao_robo_id_fkey FOREIGN KEY (robo_id) REFERENCES public.robos(id);


--
-- Name: ordem_execucao ordem_execucao_unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.ordem_execucao
    ADD CONSTRAINT ordem_execucao_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES public.unidade(id);


--
-- Name: ordem_execucao ordem_execucao_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.ordem_execucao
    ADD CONSTRAINT ordem_execucao_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: unidade unidade_diretor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_diretor_id_fkey FOREIGN KEY (diretor_id) REFERENCES public.diretor(id);


--
-- Name: unidade unidade_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_municipio_id_fkey FOREIGN KEY (municipio_id) REFERENCES public.municipio(id);


--
-- Name: usuario usuario_login_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_login_id_fkey FOREIGN KEY (login_id) REFERENCES public.login(id);


--
-- Name: usuario usuario_nivel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_nivel_id_fkey FOREIGN KEY (nivel_id) REFERENCES public.nivel(id);


--
-- Name: usuario usuario_unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rpamanager
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES public.unidade(id);


--
-- PostgreSQL database dump complete
--

