PGDMP  (            	    	    |            dhpp    16.2 (Debian 16.2-1.pgdg120+2)    16.2 k    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    74084    dhpp    DATABASE     o   CREATE DATABASE dhpp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE dhpp;
                caos    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    74086    cartorio    TABLE     �   CREATE TABLE public.cartorio (
    cartorio_id integer NOT NULL,
    nome character varying(15),
    fk_delegado integer NOT NULL
);
    DROP TABLE public.cartorio;
       public         heap    caos    false    4            �            1259    74085    cartorio_cartorio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cartorio_cartorio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cartorio_cartorio_id_seq;
       public          caos    false    216    4            �           0    0    cartorio_cartorio_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cartorio_cartorio_id_seq OWNED BY public.cartorio.cartorio_id;
          public          caos    false    215            �            1259    74093    contato    TABLE     �   CREATE TABLE public.contato (
    contato_id integer NOT NULL,
    celular character varying(11),
    telefone character varying(11),
    email character varying(30),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.contato;
       public         heap    caos    false    4            �            1259    74092    contato_contato_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contato_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.contato_contato_id_seq;
       public          caos    false    218    4            �           0    0    contato_contato_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.contato_contato_id_seq OWNED BY public.contato.contato_id;
          public          caos    false    217            �            1259    74100    delegado    TABLE     �   CREATE TABLE public.delegado (
    delegado_id integer NOT NULL,
    oab character varying(10),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.delegado;
       public         heap    caos    false    4            �            1259    74099    delegado_delegado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.delegado_delegado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.delegado_delegado_id_seq;
       public          caos    false    4    220            �           0    0    delegado_delegado_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.delegado_delegado_id_seq OWNED BY public.delegado.delegado_id;
          public          caos    false    219            �            1259    74107    endereco    TABLE     &  CREATE TABLE public.endereco (
    endereco_id integer NOT NULL,
    logradouro character varying(100),
    n_residencia character varying,
    bairro character varying(100),
    cidade character varying(100),
    cep character varying(8),
    uf character varying(2),
    fk_pessoa integer
);
    DROP TABLE public.endereco;
       public         heap    caos    false    4            �            1259    74106    endereco_endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.endereco_endereco_id_seq;
       public          caos    false    222    4            �           0    0    endereco_endereco_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.endereco_endereco_id_seq OWNED BY public.endereco.endereco_id;
          public          caos    false    221            �            1259    74116    envolvidos_inquerito    TABLE     �   CREATE TABLE public.envolvidos_inquerito (
    env_inq_id integer NOT NULL,
    fk_vitima integer,
    fk_suspeito integer,
    fk_inquerito integer NOT NULL
);
 (   DROP TABLE public.envolvidos_inquerito;
       public         heap    caos    false    4            �            1259    74115 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.envolvidos_inquerito_env_inq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.envolvidos_inquerito_env_inq_id_seq;
       public          caos    false    4    224            �           0    0 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.envolvidos_inquerito_env_inq_id_seq OWNED BY public.envolvidos_inquerito.env_inq_id;
          public          caos    false    223            �            1259    74123    escrivao    TABLE     �   CREATE TABLE public.escrivao (
    escrivao_id integer NOT NULL,
    fk_pessoa integer NOT NULL,
    fk_cartorio integer NOT NULL
);
    DROP TABLE public.escrivao;
       public         heap    caos    false    4            �            1259    74122    escrivao_escrivao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.escrivao_escrivao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.escrivao_escrivao_id_seq;
       public          caos    false    4    226            �           0    0    escrivao_escrivao_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.escrivao_escrivao_id_seq OWNED BY public.escrivao.escrivao_id;
          public          caos    false    225            �            1259    74130 	   inquerito    TABLE     �  CREATE TABLE public.inquerito (
    inquerito_id integer NOT NULL,
    n_sinesp character varying NOT NULL,
    n_ip character varying,
    tipo_ip character varying,
    data_instauracao timestamp with time zone,
    data_ocorrencia timestamp with time zone,
    fk_escrivao integer NOT NULL,
    fk_cartorio integer NOT NULL,
    fk_endereco integer NOT NULL,
    tipificacao character varying,
    tipo_portaria character varying
);
    DROP TABLE public.inquerito;
       public         heap    caos    false    4            �            1259    74129    inquerito_inquerito_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inquerito_inquerito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inquerito_inquerito_id_seq;
       public          caos    false    4    228            �           0    0    inquerito_inquerito_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inquerito_inquerito_id_seq OWNED BY public.inquerito.inquerito_id;
          public          caos    false    227            �            1259    74139    pessoa    TABLE     d  CREATE TABLE public.pessoa (
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
    DROP TABLE public.pessoa;
       public         heap    caos    false    4            �            1259    74138    pessoa_pessoa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pessoa_pessoa_id_seq;
       public          caos    false    4    230            �           0    0    pessoa_pessoa_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pessoa_pessoa_id_seq OWNED BY public.pessoa.pessoa_id;
          public          caos    false    229            �            1259    74150    processo    TABLE     �   CREATE TABLE public.processo (
    processo_id integer NOT NULL,
    n_processo character varying,
    representacao_judicial character varying,
    cumprimento_mandado character varying,
    fk_inquerito integer NOT NULL
);
    DROP TABLE public.processo;
       public         heap    caos    false    4            �            1259    74149    processo_processo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.processo_processo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.processo_processo_id_seq;
       public          caos    false    4    232            �           0    0    processo_processo_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.processo_processo_id_seq OWNED BY public.processo.processo_id;
          public          caos    false    231            �            1259    74159    suspeito    TABLE     �   CREATE TABLE public.suspeito (
    suspeito_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.suspeito;
       public         heap    caos    false    4            �            1259    74158    suspeito_suspeito_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suspeito_suspeito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.suspeito_suspeito_id_seq;
       public          caos    false    234    4            �           0    0    suspeito_suspeito_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.suspeito_suspeito_id_seq OWNED BY public.suspeito.suspeito_id;
          public          caos    false    233            �            1259    74166    usuario    TABLE     �   CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    usuario character varying(20) NOT NULL,
    senha character varying,
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    caos    false    4            �            1259    74165    usuario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_usuario_id_seq;
       public          caos    false    4    236            �           0    0    usuario_usuario_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario.usuario_id;
          public          caos    false    235            �            1259    74175    vitima    TABLE     �   CREATE TABLE public.vitima (
    vitima_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL,
    ligacao_suspeito boolean
);
    DROP TABLE public.vitima;
       public         heap    caos    false    4            �            1259    74174    vitima_vitima_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vitima_vitima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.vitima_vitima_id_seq;
       public          caos    false    4    238            �           0    0    vitima_vitima_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.vitima_vitima_id_seq OWNED BY public.vitima.vitima_id;
          public          caos    false    237            �           2604    74089    cartorio cartorio_id    DEFAULT     |   ALTER TABLE ONLY public.cartorio ALTER COLUMN cartorio_id SET DEFAULT nextval('public.cartorio_cartorio_id_seq'::regclass);
 C   ALTER TABLE public.cartorio ALTER COLUMN cartorio_id DROP DEFAULT;
       public          caos    false    216    215    216            �           2604    74096    contato contato_id    DEFAULT     x   ALTER TABLE ONLY public.contato ALTER COLUMN contato_id SET DEFAULT nextval('public.contato_contato_id_seq'::regclass);
 A   ALTER TABLE public.contato ALTER COLUMN contato_id DROP DEFAULT;
       public          caos    false    217    218    218            �           2604    74103    delegado delegado_id    DEFAULT     |   ALTER TABLE ONLY public.delegado ALTER COLUMN delegado_id SET DEFAULT nextval('public.delegado_delegado_id_seq'::regclass);
 C   ALTER TABLE public.delegado ALTER COLUMN delegado_id DROP DEFAULT;
       public          caos    false    219    220    220            �           2604    74110    endereco endereco_id    DEFAULT     |   ALTER TABLE ONLY public.endereco ALTER COLUMN endereco_id SET DEFAULT nextval('public.endereco_endereco_id_seq'::regclass);
 C   ALTER TABLE public.endereco ALTER COLUMN endereco_id DROP DEFAULT;
       public          caos    false    222    221    222            �           2604    74119    envolvidos_inquerito env_inq_id    DEFAULT     �   ALTER TABLE ONLY public.envolvidos_inquerito ALTER COLUMN env_inq_id SET DEFAULT nextval('public.envolvidos_inquerito_env_inq_id_seq'::regclass);
 N   ALTER TABLE public.envolvidos_inquerito ALTER COLUMN env_inq_id DROP DEFAULT;
       public          caos    false    224    223    224            �           2604    74126    escrivao escrivao_id    DEFAULT     |   ALTER TABLE ONLY public.escrivao ALTER COLUMN escrivao_id SET DEFAULT nextval('public.escrivao_escrivao_id_seq'::regclass);
 C   ALTER TABLE public.escrivao ALTER COLUMN escrivao_id DROP DEFAULT;
       public          caos    false    226    225    226            �           2604    74133    inquerito inquerito_id    DEFAULT     �   ALTER TABLE ONLY public.inquerito ALTER COLUMN inquerito_id SET DEFAULT nextval('public.inquerito_inquerito_id_seq'::regclass);
 E   ALTER TABLE public.inquerito ALTER COLUMN inquerito_id DROP DEFAULT;
       public          caos    false    227    228    228            �           2604    74142    pessoa pessoa_id    DEFAULT     t   ALTER TABLE ONLY public.pessoa ALTER COLUMN pessoa_id SET DEFAULT nextval('public.pessoa_pessoa_id_seq'::regclass);
 ?   ALTER TABLE public.pessoa ALTER COLUMN pessoa_id DROP DEFAULT;
       public          caos    false    229    230    230            �           2604    74153    processo processo_id    DEFAULT     |   ALTER TABLE ONLY public.processo ALTER COLUMN processo_id SET DEFAULT nextval('public.processo_processo_id_seq'::regclass);
 C   ALTER TABLE public.processo ALTER COLUMN processo_id DROP DEFAULT;
       public          caos    false    232    231    232            �           2604    74162    suspeito suspeito_id    DEFAULT     |   ALTER TABLE ONLY public.suspeito ALTER COLUMN suspeito_id SET DEFAULT nextval('public.suspeito_suspeito_id_seq'::regclass);
 C   ALTER TABLE public.suspeito ALTER COLUMN suspeito_id DROP DEFAULT;
       public          caos    false    234    233    234            �           2604    74169    usuario usuario_id    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN usuario_id DROP DEFAULT;
       public          caos    false    236    235    236            �           2604    74178    vitima vitima_id    DEFAULT     t   ALTER TABLE ONLY public.vitima ALTER COLUMN vitima_id SET DEFAULT nextval('public.vitima_vitima_id_seq'::regclass);
 ?   ALTER TABLE public.vitima ALTER COLUMN vitima_id DROP DEFAULT;
       public          caos    false    237    238    238            �          0    74086    cartorio 
   TABLE DATA           B   COPY public.cartorio (cartorio_id, nome, fk_delegado) FROM stdin;
    public          caos    false    216          �          0    74093    contato 
   TABLE DATA           R   COPY public.contato (contato_id, celular, telefone, email, fk_pessoa) FROM stdin;
    public          caos    false    218   A       �          0    74100    delegado 
   TABLE DATA           ?   COPY public.delegado (delegado_id, oab, fk_pessoa) FROM stdin;
    public          caos    false    220   �       �          0    74107    endereco 
   TABLE DATA           m   COPY public.endereco (endereco_id, logradouro, n_residencia, bairro, cidade, cep, uf, fk_pessoa) FROM stdin;
    public          caos    false    222   �       �          0    74116    envolvidos_inquerito 
   TABLE DATA           `   COPY public.envolvidos_inquerito (env_inq_id, fk_vitima, fk_suspeito, fk_inquerito) FROM stdin;
    public          caos    false    224   c�       �          0    74123    escrivao 
   TABLE DATA           G   COPY public.escrivao (escrivao_id, fk_pessoa, fk_cartorio) FROM stdin;
    public          caos    false    226   ��       �          0    74130 	   inquerito 
   TABLE DATA           �   COPY public.inquerito (inquerito_id, n_sinesp, n_ip, tipo_ip, data_instauracao, data_ocorrencia, fk_escrivao, fk_cartorio, fk_endereco, tipificacao, tipo_portaria) FROM stdin;
    public          caos    false    228   ��       �          0    74139    pessoa 
   TABLE DATA           g   COPY public.pessoa (pessoa_id, nome, nome_social, nascimento, cpf, sexo, etnia, lgbt, pcd) FROM stdin;
    public          caos    false    230   v�       �          0    74150    processo 
   TABLE DATA           v   COPY public.processo (processo_id, n_processo, representacao_judicial, cumprimento_mandado, fk_inquerito) FROM stdin;
    public          caos    false    232   *�       �          0    74159    suspeito 
   TABLE DATA           I   COPY public.suspeito (suspeito_id, faccao, vulgo, fk_pessoa) FROM stdin;
    public          caos    false    234   G�       �          0    74166    usuario 
   TABLE DATA           H   COPY public.usuario (usuario_id, usuario, senha, fk_pessoa) FROM stdin;
    public          caos    false    236   m�       �          0    74175    vitima 
   TABLE DATA           W   COPY public.vitima (vitima_id, faccao, vulgo, fk_pessoa, ligacao_suspeito) FROM stdin;
    public          caos    false    238   �       �           0    0    cartorio_cartorio_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.cartorio_cartorio_id_seq', 1, true);
          public          caos    false    215            �           0    0    contato_contato_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.contato_contato_id_seq', 3, true);
          public          caos    false    217            �           0    0    delegado_delegado_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.delegado_delegado_id_seq', 1, true);
          public          caos    false    219            �           0    0    endereco_endereco_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.endereco_endereco_id_seq', 13, true);
          public          caos    false    221            �           0    0 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.envolvidos_inquerito_env_inq_id_seq', 1, true);
          public          caos    false    223            �           0    0    escrivao_escrivao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.escrivao_escrivao_id_seq', 1, true);
          public          caos    false    225            �           0    0    inquerito_inquerito_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inquerito_inquerito_id_seq', 9, true);
          public          caos    false    227            �           0    0    pessoa_pessoa_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pessoa_pessoa_id_seq', 5, true);
          public          caos    false    229            �           0    0    processo_processo_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.processo_processo_id_seq', 1, false);
          public          caos    false    231            �           0    0    suspeito_suspeito_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.suspeito_suspeito_id_seq', 1, true);
          public          caos    false    233            �           0    0    usuario_usuario_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 2, true);
          public          caos    false    235            �           0    0    vitima_vitima_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.vitima_vitima_id_seq', 1, true);
          public          caos    false    237            �           2606    74091    cartorio cartorio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT cartorio_pkey PRIMARY KEY (cartorio_id);
 @   ALTER TABLE ONLY public.cartorio DROP CONSTRAINT cartorio_pkey;
       public            caos    false    216            �           2606    74098    contato contato_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (contato_id);
 >   ALTER TABLE ONLY public.contato DROP CONSTRAINT contato_pkey;
       public            caos    false    218            �           2606    74148 
   pessoa cpf 
   CONSTRAINT     D   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT cpf UNIQUE (cpf);
 4   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT cpf;
       public            caos    false    230            �           2606    74105    delegado delegado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT delegado_pkey PRIMARY KEY (delegado_id);
 @   ALTER TABLE ONLY public.delegado DROP CONSTRAINT delegado_pkey;
       public            caos    false    220            �           2606    74114    endereco endereco_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            caos    false    222            �           2606    74121 .   envolvidos_inquerito envolvidos_inquerito_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT envolvidos_inquerito_pkey PRIMARY KEY (env_inq_id);
 X   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT envolvidos_inquerito_pkey;
       public            caos    false    224            �           2606    74128    escrivao escrivao_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT escrivao_pkey PRIMARY KEY (escrivao_id);
 @   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT escrivao_pkey;
       public            caos    false    226            �           2606    74137    inquerito inquerito_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT inquerito_pkey PRIMARY KEY (inquerito_id);
 B   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT inquerito_pkey;
       public            caos    false    228            �           2606    74146    pessoa pessoa_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (pessoa_id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public            caos    false    230            �           2606    74157    processo processo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (processo_id);
 @   ALTER TABLE ONLY public.processo DROP CONSTRAINT processo_pkey;
       public            caos    false    232            �           2606    74164    suspeito suspeito_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT suspeito_pkey PRIMARY KEY (suspeito_id);
 @   ALTER TABLE ONLY public.suspeito DROP CONSTRAINT suspeito_pkey;
       public            caos    false    234            �           2606    74173    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            caos    false    236            �           2606    74180    vitima vitima_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_pkey PRIMARY KEY (vitima_id);
 <   ALTER TABLE ONLY public.vitima DROP CONSTRAINT vitima_pkey;
       public            caos    false    238            �           2606    74216    escrivao fk_cartorio    FK CONSTRAINT     �   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) NOT VALID;
 >   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT fk_cartorio;
       public          caos    false    216    226    3271            �           2606    74226    inquerito fk_cartorio    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_cartorio;
       public          caos    false    3271    216    228            �           2606    74181    cartorio fk_delegado    FK CONSTRAINT     �   ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT fk_delegado FOREIGN KEY (fk_delegado) REFERENCES public.delegado(delegado_id) NOT VALID;
 >   ALTER TABLE ONLY public.cartorio DROP CONSTRAINT fk_delegado;
       public          caos    false    216    3275    220            �           2606    74231    inquerito fk_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_endereco FOREIGN KEY (fk_endereco) REFERENCES public.endereco(endereco_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_endereco;
       public          caos    false    3277    228    222            �           2606    74236    inquerito fk_escrivao    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_escrivao FOREIGN KEY (fk_escrivao) REFERENCES public.escrivao(escrivao_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_escrivao;
       public          caos    false    3281    228    226            �           2606    74201 !   envolvidos_inquerito fk_inquerito    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;
 K   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_inquerito;
       public          caos    false    228    224    3283            �           2606    74241    processo fk_inquerito    FK CONSTRAINT     �   ALTER TABLE ONLY public.processo
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;
 ?   ALTER TABLE ONLY public.processo DROP CONSTRAINT fk_inquerito;
       public          caos    false    228    232    3283            �           2606    74186    contato fk_pessoa    FK CONSTRAINT     �   ALTER TABLE ONLY public.contato
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id) NOT VALID;
 ;   ALTER TABLE ONLY public.contato DROP CONSTRAINT fk_pessoa;
       public          caos    false    230    218    3287            �           2606    74191    delegado fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.delegado DROP CONSTRAINT fk_pessoa;
       public          caos    false    220    3287    230            �           2606    74196    endereco fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.endereco DROP CONSTRAINT fk_pessoa;
       public          caos    false    3287    230    222            �           2606    74221    escrivao fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT fk_pessoa;
       public          caos    false    3287    230    226            �           2606    74246    suspeito fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.suspeito DROP CONSTRAINT fk_pessoa;
       public          caos    false    3287    230    234            �           2606    74251    usuario fk_pessoa    FK CONSTRAINT     z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 ;   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_pessoa;
       public          caos    false    230    3287    236            �           2606    74256    vitima fk_pessoa    FK CONSTRAINT     y   ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 :   ALTER TABLE ONLY public.vitima DROP CONSTRAINT fk_pessoa;
       public          caos    false    238    230    3287            �           2606    74206     envolvidos_inquerito fk_suspeito    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_suspeito FOREIGN KEY (fk_suspeito) REFERENCES public.suspeito(suspeito_id) NOT VALID;
 J   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_suspeito;
       public          caos    false    224    3291    234            �           2606    74211    envolvidos_inquerito fk_vitima    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_vitima FOREIGN KEY (fk_vitima) REFERENCES public.vitima(vitima_id) NOT VALID;
 H   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_vitima;
       public          caos    false    224    238    3295            �      x�3�tv
����4����� &R�      �   E   x�3�4@ $6��k��^�S���[������������/�!��z���99�,,�����Ҝ�ӄ+F��� ��      �      x�3�4�NC�=... "~      �   �   x���1�0��>EN�⤐vtK��J	���0p�^��eA��xx��qdu�ԃ�p��Y�0�	��F��&�Gw@hJ��f#�Ab���X2����^^�MOMC�uu�s@���F�!�Ix�>��E�UUHTj�Hfo8�����ݗ��r�?v�Z�      �      x�3�4Bs�=... ��      �      x�3�4�4����� �Y      �   �   x�u��� �gx���S@�7DjH0@��_��}�����������		��^��*Z'LP�Vf�d�e+*BB�a�#�B1MA��Rh,���eE�e��6�w��m������UIw�+<*)[9��ᙂ���r�.9�5
s����A:�pZ|-�L��F����ؓ���+��(���>����S�      �   �   x�}�A�0����� f:���+m�505d�p�HdaL��m�/O��|�,�#�\`l�ԴSh��L���(��"*�����>�� x�!��ɐ%��O}�!K?��g��()m��d���8l�ٮ'{W��-V��{��<Z`�?�~Qd�VH���z�/�@      �      x������ � �      �      x�3�pv��4����� q	      �   �   x�5���   �3|�g
���af:K4S纀Vj*I�f_ߩ�ѕ͠P���A���avrS�ȵ��s��}]'a���Q��ݳB7u�~e��/GoP
��/�˸�Q�t�|(����h�K�:1�n�\Q��)2��MKm �� �?�-i      �      x�3�pv��4������� ��     