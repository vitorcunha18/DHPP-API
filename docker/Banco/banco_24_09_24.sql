BEGIN;


CREATE TABLE IF NOT EXISTS public.cartorio
(
    cartorio_id integer NOT NULL DEFAULT nextval('cartorio_id_seq'::regclass),
    nome character varying(15) COLLATE pg_catalog."default",
    fk_delegado integer NOT NULL,
    CONSTRAINT cartorio_pkey PRIMARY KEY (cartorio_id)
);

CREATE TABLE IF NOT EXISTS public.contato
(
    contato_id integer NOT NULL DEFAULT nextval('contato_id_seq'::regclass),
    celular character varying(11) COLLATE pg_catalog."default",
    telefone character varying(11) COLLATE pg_catalog."default",
    email character varying(30) COLLATE pg_catalog."default",
    fk_pessoa integer NOT NULL,
    CONSTRAINT contato_pkey PRIMARY KEY (contato_id)
);

CREATE TABLE IF NOT EXISTS public.delegado
(
    delegado_id integer NOT NULL DEFAULT nextval('delegado_id_seq'::regclass),
    oab character varying(10) COLLATE pg_catalog."default",
    fk_pessoa serial NOT NULL,
    CONSTRAINT delegado_pkey PRIMARY KEY (delegado_id)
);

CREATE TABLE IF NOT EXISTS public.endereco
(
    endereco_id integer NOT NULL DEFAULT nextval('endereco_id_seq'::regclass),
    logradouro character varying(100) COLLATE pg_catalog."default",
    n_residencia character varying COLLATE pg_catalog."default",
    bairro character varying(100) COLLATE pg_catalog."default",
    cidade character varying(100) COLLATE pg_catalog."default",
    cep character varying(8) COLLATE pg_catalog."default",
    uf character varying(2) COLLATE pg_catalog."default",
    fk_pessoa integer,
    CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id)
);

CREATE TABLE IF NOT EXISTS public.envolvidos_inquerito
(
    "env_inq_id " integer NOT NULL DEFAULT nextval('"envolvidos_inquerito_id _seq"'::regclass),
    fk_vitima integer,
    fk_suspeito integer,
    fk_inquerito integer NOT NULL,
    CONSTRAINT envolvidos_inquerito_pkey PRIMARY KEY ("env_inq_id ")
);

CREATE TABLE IF NOT EXISTS public.escrivao
(
    escrivao_id integer NOT NULL DEFAULT nextval('escrivao_id_seq'::regclass),
    fk_pessoa serial NOT NULL,
    fk_cartorio serial NOT NULL,
    CONSTRAINT escrivao_pkey PRIMARY KEY (escrivao_id)
);

CREATE TABLE IF NOT EXISTS public.inquerito
(
    inquerito_id integer NOT NULL DEFAULT nextval('inquerito_id_seq'::regclass),
    n_sinesp character varying COLLATE pg_catalog."default" NOT NULL,
    n_ip character varying COLLATE pg_catalog."default",
    tipo_ip character varying COLLATE pg_catalog."default",
    data_instaraucao timestamp with time zone,
    data_ocorrencia timestamp with time zone,
    fk_escrivao integer NOT NULL,
    fk_cartorio integer NOT NULL,
    fk_endereco integer NOT NULL,
    tipificacao character varying COLLATE pg_catalog."default",
    CONSTRAINT inquerito_pkey PRIMARY KEY (inquerito_id)
);

CREATE TABLE IF NOT EXISTS public.pessoa
(
    pessoa_id integer NOT NULL DEFAULT nextval('pessoa_id_seq'::regclass),
    nome character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nome_social character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nascimento timestamp without time zone NOT NULL,
    cpf character varying(11) COLLATE pg_catalog."default" NOT NULL,
    sexo character varying(1) COLLATE pg_catalog."default" NOT NULL,
    etnia text COLLATE pg_catalog."default",
    lgbt boolean NOT NULL,
    pcd boolean NOT NULL,
    CONSTRAINT pessoa_pkey PRIMARY KEY (pessoa_id),
    CONSTRAINT cpf UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS public.processo
(
    processo_id integer NOT NULL DEFAULT nextval('processo_id_seq'::regclass),
    n_processo character varying COLLATE pg_catalog."default",
    representacao_judicial character varying COLLATE pg_catalog."default",
    cumprimento_mandado character varying COLLATE pg_catalog."default",
    fk_inquerito serial NOT NULL,
    CONSTRAINT processo_pkey PRIMARY KEY (processo_id)
);

CREATE TABLE IF NOT EXISTS public.suspeito
(
    suspeito_id integer NOT NULL DEFAULT nextval('suspeito_id_seq'::regclass),
    faccao character varying(15) COLLATE pg_catalog."default",
    vulgo character varying(10) COLLATE pg_catalog."default",
    fk_pessoa integer NOT NULL,
    CONSTRAINT suspeito_pkey PRIMARY KEY (suspeito_id)
);

CREATE TABLE IF NOT EXISTS public.usuario
(
    usuario_id integer NOT NULL DEFAULT nextval('usuario_id_seq'::regclass),
    usuario character varying(20) COLLATE pg_catalog."default" NOT NULL,
    senha character varying COLLATE pg_catalog."default",
    fk_pessoa serial NOT NULL,
    CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id)
);

CREATE TABLE IF NOT EXISTS public.vitima
(
    vitima_id integer NOT NULL DEFAULT nextval('vitima_id_seq'::regclass),
    faccao character varying(15) COLLATE pg_catalog."default",
    vulgo character varying(10) COLLATE pg_catalog."default",
    fk_pessoa integer NOT NULL,
    ligacao_suspeito boolean,
    CONSTRAINT vitima_pkey PRIMARY KEY (vitima_id)
);

ALTER TABLE IF EXISTS public.cartorio
    ADD CONSTRAINT fk_delegado FOREIGN KEY (fk_delegado)
    REFERENCES public.delegado (delegado_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contato
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.delegado
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.endereco
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.envolvidos_inquerito
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito)
    REFERENCES public.inquerito (inquerito_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.envolvidos_inquerito
    ADD CONSTRAINT fk_suspeito FOREIGN KEY (fk_suspeito)
    REFERENCES public.suspeito (suspeito_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.envolvidos_inquerito
    ADD CONSTRAINT fk_vitima FOREIGN KEY (fk_vitima)
    REFERENCES public.vitima (vitima_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.escrivao
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio)
    REFERENCES public.cartorio (cartorio_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.escrivao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.inquerito
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio)
    REFERENCES public.cartorio (cartorio_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.inquerito
    ADD CONSTRAINT fk_endereco FOREIGN KEY (fk_endereco)
    REFERENCES public.endereco (endereco_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.inquerito
    ADD CONSTRAINT fk_escrivao FOREIGN KEY (fk_escrivao)
    REFERENCES public.escrivao (escrivao_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
    NOT VALID;


ALTER TABLE IF EXISTS public.processo
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito)
    REFERENCES public.inquerito (inquerito_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.suspeito
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.usuario
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.vitima
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa)
    REFERENCES public.pessoa (pessoa_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;