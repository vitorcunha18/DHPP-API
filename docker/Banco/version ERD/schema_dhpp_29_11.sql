--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cartorio; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.cartorio (
    cartorio_id integer NOT NULL,
    nome character varying(30),
    fk_delegado integer NOT NULL
);


ALTER TABLE public.cartorio OWNER TO caos;

--
-- Name: cartorio_cartorio_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.cartorio_cartorio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cartorio_cartorio_id_seq OWNER TO caos;

--
-- Name: cartorio_cartorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.cartorio_cartorio_id_seq OWNED BY public.cartorio.cartorio_id;


--
-- Name: contato; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.contato (
    contato_id integer NOT NULL,
    celular character varying(11),
    telefone character varying(11),
    email character varying(30),
    fk_pessoa integer NOT NULL
);


ALTER TABLE public.contato OWNER TO caos;

--
-- Name: contato_contato_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.contato_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contato_contato_id_seq OWNER TO caos;

--
-- Name: contato_contato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.contato_contato_id_seq OWNED BY public.contato.contato_id;


--
-- Name: delegado; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.delegado (
    delegado_id integer NOT NULL,
    oab character varying(10),
    fk_pessoa integer NOT NULL
);


ALTER TABLE public.delegado OWNER TO caos;

--
-- Name: delegado_delegado_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.delegado_delegado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.delegado_delegado_id_seq OWNER TO caos;

--
-- Name: delegado_delegado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.delegado_delegado_id_seq OWNED BY public.delegado.delegado_id;


--
-- Name: endereco; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.endereco (
    endereco_id integer NOT NULL,
    logradouro character varying(100),
    n_residencia character varying,
    bairro character varying(100),
    cidade character varying(100),
    cep character varying(8),
    uf character varying(2),
    fk_pessoa integer,
    regional character varying(50)
);


ALTER TABLE public.endereco OWNER TO caos;

--
-- Name: endereco_endereco_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.endereco_endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.endereco_endereco_id_seq OWNER TO caos;

--
-- Name: endereco_endereco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.endereco_endereco_id_seq OWNED BY public.endereco.endereco_id;


--
-- Name: envolvidos_inquerito; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.envolvidos_inquerito (
    env_inq_id integer NOT NULL,
    fk_vitima integer,
    fk_suspeito integer,
    fk_inquerito integer NOT NULL
);


ALTER TABLE public.envolvidos_inquerito OWNER TO caos;

--
-- Name: envolvidos_inquerito_env_inq_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.envolvidos_inquerito_env_inq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.envolvidos_inquerito_env_inq_id_seq OWNER TO caos;

--
-- Name: envolvidos_inquerito_env_inq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.envolvidos_inquerito_env_inq_id_seq OWNED BY public.envolvidos_inquerito.env_inq_id;


--
-- Name: equipe_investigador; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.equipe_investigador (
    equipe_id integer NOT NULL,
    nome character varying(20)
);


ALTER TABLE public.equipe_investigador OWNER TO caos;

--
-- Name: equipe_investigador_equipe_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.equipe_investigador_equipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipe_investigador_equipe_id_seq OWNER TO caos;

--
-- Name: equipe_investigador_equipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.equipe_investigador_equipe_id_seq OWNED BY public.equipe_investigador.equipe_id;


--
-- Name: escrivao; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.escrivao (
    escrivao_id integer NOT NULL,
    fk_pessoa integer NOT NULL,
    fk_cartorio integer NOT NULL
);


ALTER TABLE public.escrivao OWNER TO caos;

--
-- Name: escrivao_escrivao_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.escrivao_escrivao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.escrivao_escrivao_id_seq OWNER TO caos;

--
-- Name: escrivao_escrivao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.escrivao_escrivao_id_seq OWNED BY public.escrivao.escrivao_id;


--
-- Name: inquerito; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.inquerito (
    inquerito_id integer NOT NULL,
    n_sinesp character varying NOT NULL,
    n_ip character varying,
    tipo_ip character varying,
    data_instauracao timestamp with time zone,
    data_ocorrencia timestamp with time zone,
    fk_escrivao integer NOT NULL,
    fk_cartorio integer NOT NULL,
    fk_endereco integer NOT NULL,
    tipo_portaria character varying,
    tipificacao character varying[],
    fk_equipe integer,
    periodo_ocorrencia character varying,
    tipo_instauracao character varying
);


ALTER TABLE public.inquerito OWNER TO caos;

--
-- Name: inquerito_inquerito_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.inquerito_inquerito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inquerito_inquerito_id_seq OWNER TO caos;

--
-- Name: inquerito_inquerito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.inquerito_inquerito_id_seq OWNED BY public.inquerito.inquerito_id;


--
-- Name: investigador; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.investigador (
    investigador_id integer NOT NULL,
    fk_equipe integer,
    fk_pessoa integer
);


ALTER TABLE public.investigador OWNER TO caos;

--
-- Name: investigador_investigador_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.investigador_investigador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.investigador_investigador_id_seq OWNER TO caos;

--
-- Name: investigador_investigador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.investigador_investigador_id_seq OWNED BY public.investigador.investigador_id;


--
-- Name: pessoa; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.pessoa (
    pessoa_id integer NOT NULL,
    nome character varying(100) NOT NULL,
    nome_social character varying(100) NOT NULL,
    nascimento timestamp without time zone NOT NULL,
    cpf character varying(11) NOT NULL,
    sexo character varying(1) NOT NULL,
    etnia text,
    lgbt boolean NOT NULL,
    pcd boolean NOT NULL
);


ALTER TABLE public.pessoa OWNER TO caos;

--
-- Name: pessoa_pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.pessoa_pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pessoa_pessoa_id_seq OWNER TO caos;

--
-- Name: pessoa_pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.pessoa_pessoa_id_seq OWNED BY public.pessoa.pessoa_id;


--
-- Name: processo; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.processo (
    processo_id integer NOT NULL,
    n_processo character varying,
    representacao_judicial character varying,
    cumprimento_mandado character varying,
    fk_inquerito integer NOT NULL
);


ALTER TABLE public.processo OWNER TO caos;

--
-- Name: processo_processo_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.processo_processo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processo_processo_id_seq OWNER TO caos;

--
-- Name: processo_processo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.processo_processo_id_seq OWNED BY public.processo.processo_id;


--
-- Name: suspeito; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.suspeito (
    suspeito_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL
);


ALTER TABLE public.suspeito OWNER TO caos;

--
-- Name: suspeito_suspeito_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.suspeito_suspeito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suspeito_suspeito_id_seq OWNER TO caos;

--
-- Name: suspeito_suspeito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.suspeito_suspeito_id_seq OWNED BY public.suspeito.suspeito_id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    usuario character varying(20) NOT NULL,
    senha character varying,
    fk_pessoa integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO caos;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_usuario_id_seq OWNER TO caos;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario.usuario_id;


--
-- Name: vitima; Type: TABLE; Schema: public; Owner: caos
--

CREATE TABLE public.vitima (
    vitima_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL,
    ligacao_suspeito boolean
);


ALTER TABLE public.vitima OWNER TO caos;

--
-- Name: vitima_vitima_id_seq; Type: SEQUENCE; Schema: public; Owner: caos
--

CREATE SEQUENCE public.vitima_vitima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vitima_vitima_id_seq OWNER TO caos;

--
-- Name: vitima_vitima_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: caos
--

ALTER SEQUENCE public.vitima_vitima_id_seq OWNED BY public.vitima.vitima_id;


--
-- Name: cartorio cartorio_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.cartorio ALTER COLUMN cartorio_id SET DEFAULT nextval('public.cartorio_cartorio_id_seq'::regclass);


--
-- Name: contato contato_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.contato ALTER COLUMN contato_id SET DEFAULT nextval('public.contato_contato_id_seq'::regclass);


--
-- Name: delegado delegado_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.delegado ALTER COLUMN delegado_id SET DEFAULT nextval('public.delegado_delegado_id_seq'::regclass);


--
-- Name: endereco endereco_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.endereco ALTER COLUMN endereco_id SET DEFAULT nextval('public.endereco_endereco_id_seq'::regclass);


--
-- Name: envolvidos_inquerito env_inq_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.envolvidos_inquerito ALTER COLUMN env_inq_id SET DEFAULT nextval('public.envolvidos_inquerito_env_inq_id_seq'::regclass);


--
-- Name: equipe_investigador equipe_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.equipe_investigador ALTER COLUMN equipe_id SET DEFAULT nextval('public.equipe_investigador_equipe_id_seq'::regclass);


--
-- Name: escrivao escrivao_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.escrivao ALTER COLUMN escrivao_id SET DEFAULT nextval('public.escrivao_escrivao_id_seq'::regclass);


--
-- Name: inquerito inquerito_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito ALTER COLUMN inquerito_id SET DEFAULT nextval('public.inquerito_inquerito_id_seq'::regclass);


--
-- Name: investigador investigador_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.investigador ALTER COLUMN investigador_id SET DEFAULT nextval('public.investigador_investigador_id_seq'::regclass);


--
-- Name: pessoa pessoa_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN pessoa_id SET DEFAULT nextval('public.pessoa_pessoa_id_seq'::regclass);


--
-- Name: processo processo_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.processo ALTER COLUMN processo_id SET DEFAULT nextval('public.processo_processo_id_seq'::regclass);


--
-- Name: suspeito suspeito_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.suspeito ALTER COLUMN suspeito_id SET DEFAULT nextval('public.suspeito_suspeito_id_seq'::regclass);


--
-- Name: usuario usuario_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);


--
-- Name: vitima vitima_id; Type: DEFAULT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.vitima ALTER COLUMN vitima_id SET DEFAULT nextval('public.vitima_vitima_id_seq'::regclass);


--
-- Data for Name: cartorio; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.cartorio (cartorio_id, nome, fk_delegado) FROM stdin;
1	CARTORIO 01	1
2	CARTORIO 02	1
3	CARTORIO 03	1
4	CARTORIO 04	1
5	CARTORIO CENTRAL	1
\.


--
-- Data for Name: contato; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.contato (contato_id, celular, telefone, email, fk_pessoa) FROM stdin;
1	00000000000	0000000000	BEUF.UBWIBFWDF@EMAIL.COM	1
2	00000000000	0000000000	BEUF.UBWIBFWDF@EMAIL.COM	2
\.


--
-- Data for Name: delegado; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.delegado (delegado_id, oab, fk_pessoa) FROM stdin;
1	0000000000	1
\.


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.endereco (endereco_id, logradouro, n_residencia, bairro, cidade, cep, uf, fk_pessoa, regional) FROM stdin;
1	RUA JOSE	00	MARIA ALVES	RIO BRANCO	01001000	AC	1	\N
2	RUA JOSE	00	MARIA ALVES	RIO BRANCO	01001000	AC	2	\N
13	RUA PALMARES	123123	CONQUISTA	RIO BRANCO	69918774	AC	\N	REGIONAL 3
14	RUA PALMARES	345	CONQUISTA	RIO BRANCO	69918774	AC	\N	ZONA URBANA
10	RUA GOVERNADOR EDMUNDO PINTO	123	JARDIM BRASIL	RIO BRANCO	69919500	AC	\N	ZONA URBANA
16	RUA GOVERNADOR EDMUNDO PINTO	123	JARDIM BRASIL	RIO BRANCO	69919500	AC	\N	ZONA RURAL
17	RUA COPACABANA	343	VILAGE WILDE MACIEL	RIO BRANCO	69918500	AC	\N	ZONA URBANA
18	RUA COPACABANA	645	VILAGE WILDE MACIEL	RIO BRANCO	69918500	AC	\N	REGIONAL 4
19	RUA GOVERNADOR EDMUNDO PINTO	123	JARDIM BRASIL	RIO BRANCO	69919500	AC	\N	ZONA URBANA
\.


--
-- Data for Name: envolvidos_inquerito; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.envolvidos_inquerito (env_inq_id, fk_vitima, fk_suspeito, fk_inquerito) FROM stdin;
\.


--
-- Data for Name: equipe_investigador; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.equipe_investigador (equipe_id, nome) FROM stdin;
1	ALPHA
2	BRAVO
3	CHARLIE
4	DELTA
\.


--
-- Data for Name: escrivao; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.escrivao (escrivao_id, fk_pessoa, fk_cartorio) FROM stdin;
1	2	5
\.


--
-- Data for Name: inquerito; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.inquerito (inquerito_id, n_sinesp, n_ip, tipo_ip, data_instauracao, data_ocorrencia, fk_escrivao, fk_cartorio, fk_endereco, tipo_portaria, tipificacao, fk_equipe, periodo_ocorrencia, tipo_instauracao) FROM stdin;
4	089	089	\N	2024-11-28 00:00:00+00	2024-11-28 22:28:00+00	1	5	13	\N	{"HOMICIDIO SIMPLES","HOMICIDIO QUALIFICADO"}	1	MANHA	PORTARIA DHPP
5	123123	123123	\N	2024-11-29 00:00:00+00	2024-11-28 03:10:00+00	1	5	14	\N	{"HOMICIDIO TENTADO",FEMINICIDIO}	1	MANHA	PORTARIA DHPP
7	635	635	\N	2024-11-28 00:00:00+00	2024-11-29 03:35:00+00	1	5	16	\N	{"HOMICIDIO SIMPLES",FEMINICIDIO}	1	TARDE	PORTARIA DHPP
8	641	641	\N	2024-11-29 00:00:00+00	2024-11-22 06:41:00+00	1	5	17	\N	{"HOMICIDIO TENTADO",FEMINICIDIO}	4	MANHA	PORTARIA CORREGEPOL
3	012	012	\N	2024-10-31 00:00:00+00	2024-11-26 06:00:00+00	1	5	10	\N	{false,false,"HOMICIDIO TENTADO",FEMINICIDIO}	2	MANHA	PORTARIA DHPP
9	645	645	\N	2024-11-27 00:00:00+00	2024-11-29 00:45:00+00	1	5	18	\N	{false,false,"HOMICIDIO TENTADO",FEMINICIDIO}	3	MANHA	PORTARIA REQUISICAO EXTERNA
10	652	652	\N	2024-11-27 00:00:00+00	2024-11-22 00:52:00+00	1	5	19	\N	{false,false,"HOMICIDIO TENTADO",FEMINICIDIO}	2	MANHA	PORTARIA DHPP
\.


--
-- Data for Name: investigador; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.investigador (investigador_id, fk_equipe, fk_pessoa) FROM stdin;
\.


--
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.pessoa (pessoa_id, nome, nome_social, nascimento, cpf, sexo, etnia, lgbt, pcd) FROM stdin;
1	ALCINO FERREIRA DE SOUSA JUNIOR		1978-07-07 00:00:00	59233087204	M	BRANCO	f	f
2	VITOR DANIEL DO NASCIMENTO CUNHA		2000-01-15 00:00:00	02134439297	M	PRETO	f	f
\.


--
-- Data for Name: processo; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.processo (processo_id, n_processo, representacao_judicial, cumprimento_mandado, fk_inquerito) FROM stdin;
\.


--
-- Data for Name: suspeito; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.suspeito (suspeito_id, faccao, vulgo, fk_pessoa) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.usuario (usuario_id, usuario, senha, fk_pessoa) FROM stdin;
1	Alcino.junior	$2b$12$ccJZ3iw25KwBQuS72SdZZ.G5j8uOvr5STZVD4tN.MFQ8Z1TDRmTui	1
2	caos	$2b$12$jj1kWUbkU/eeOK9QNB1duuj8KnrXAr/t9WeGMpy08AnjshOinaN2C	2
\.


--
-- Data for Name: vitima; Type: TABLE DATA; Schema: public; Owner: caos
--

COPY public.vitima (vitima_id, faccao, vulgo, fk_pessoa, ligacao_suspeito) FROM stdin;
\.


--
-- Name: cartorio_cartorio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.cartorio_cartorio_id_seq', 5, true);


--
-- Name: contato_contato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.contato_contato_id_seq', 2, true);


--
-- Name: delegado_delegado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.delegado_delegado_id_seq', 1, true);


--
-- Name: endereco_endereco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.endereco_endereco_id_seq', 19, true);


--
-- Name: envolvidos_inquerito_env_inq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.envolvidos_inquerito_env_inq_id_seq', 1, false);


--
-- Name: equipe_investigador_equipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.equipe_investigador_equipe_id_seq', 4, true);


--
-- Name: escrivao_escrivao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.escrivao_escrivao_id_seq', 1, true);


--
-- Name: inquerito_inquerito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.inquerito_inquerito_id_seq', 10, true);


--
-- Name: investigador_investigador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.investigador_investigador_id_seq', 1, false);


--
-- Name: pessoa_pessoa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.pessoa_pessoa_id_seq', 2, true);


--
-- Name: processo_processo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.processo_processo_id_seq', 1, false);


--
-- Name: suspeito_suspeito_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.suspeito_suspeito_id_seq', 1, false);


--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 2, true);


--
-- Name: vitima_vitima_id_seq; Type: SEQUENCE SET; Schema: public; Owner: caos
--

SELECT pg_catalog.setval('public.vitima_vitima_id_seq', 1, false);


--
-- Name: cartorio cartorio_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT cartorio_pkey PRIMARY KEY (cartorio_id);


--
-- Name: contato contato_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (contato_id);


--
-- Name: pessoa cpf; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT cpf UNIQUE (cpf);


--
-- Name: delegado delegado_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT delegado_pkey PRIMARY KEY (delegado_id);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id);


--
-- Name: envolvidos_inquerito envolvidos_inquerito_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT envolvidos_inquerito_pkey PRIMARY KEY (env_inq_id);


--
-- Name: equipe_investigador equipe_investigador_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.equipe_investigador
    ADD CONSTRAINT equipe_investigador_pkey PRIMARY KEY (equipe_id);


--
-- Name: escrivao escrivao_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT escrivao_pkey PRIMARY KEY (escrivao_id);


--
-- Name: inquerito inquerito_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT inquerito_pkey PRIMARY KEY (inquerito_id);


--
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (pessoa_id);


--
-- Name: processo processo_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (processo_id);


--
-- Name: suspeito suspeito_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT suspeito_pkey PRIMARY KEY (suspeito_id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);


--
-- Name: vitima vitima_pkey; Type: CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_pkey PRIMARY KEY (vitima_id);


--
-- Name: escrivao fk_cartorio; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) NOT VALID;


--
-- Name: inquerito fk_cartorio; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) ON DELETE CASCADE NOT VALID;


--
-- Name: cartorio fk_delegado; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT fk_delegado FOREIGN KEY (fk_delegado) REFERENCES public.delegado(delegado_id) NOT VALID;


--
-- Name: inquerito fk_endereco; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_endereco FOREIGN KEY (fk_endereco) REFERENCES public.endereco(endereco_id) ON DELETE CASCADE NOT VALID;


--
-- Name: inquerito fk_equipe; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_equipe FOREIGN KEY (fk_equipe) REFERENCES public.equipe_investigador(equipe_id) ON DELETE CASCADE NOT VALID;


--
-- Name: investigador fk_equipe; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.investigador
    ADD CONSTRAINT fk_equipe FOREIGN KEY (fk_equipe) REFERENCES public.equipe_investigador(equipe_id);


--
-- Name: inquerito fk_escrivao; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_escrivao FOREIGN KEY (fk_escrivao) REFERENCES public.escrivao(escrivao_id) ON DELETE CASCADE NOT VALID;


--
-- Name: envolvidos_inquerito fk_inquerito; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;


--
-- Name: processo fk_inquerito; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;


--
-- Name: contato fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.contato
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id) NOT VALID;


--
-- Name: delegado fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: endereco fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: escrivao fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: suspeito fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: usuario fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: vitima fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);


--
-- Name: investigador fk_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.investigador
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id) ON DELETE CASCADE NOT VALID;


--
-- Name: envolvidos_inquerito fk_suspeito; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_suspeito FOREIGN KEY (fk_suspeito) REFERENCES public.suspeito(suspeito_id) NOT VALID;


--
-- Name: envolvidos_inquerito fk_vitima; Type: FK CONSTRAINT; Schema: public; Owner: caos
--

ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_vitima FOREIGN KEY (fk_vitima) REFERENCES public.vitima(vitima_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

