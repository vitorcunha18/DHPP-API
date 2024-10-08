PGDMP                      |            dhpp    16.3    16.3 i    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    33634    dhpp    DATABASE     {   CREATE DATABASE dhpp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE dhpp;
                postgres    false            �            1259    33636    cartorio    TABLE     �   CREATE TABLE public.cartorio (
    cartorio_id integer NOT NULL,
    nome character varying(15),
    fk_delegado integer NOT NULL
);
    DROP TABLE public.cartorio;
       public         heap    postgres    false            �            1259    33635    cartorio_cartorio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cartorio_cartorio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cartorio_cartorio_id_seq;
       public          postgres    false    216            (           0    0    cartorio_cartorio_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cartorio_cartorio_id_seq OWNED BY public.cartorio.cartorio_id;
          public          postgres    false    215            �            1259    33643    contato    TABLE     �   CREATE TABLE public.contato (
    contato_id integer NOT NULL,
    celular character varying(11),
    telefone character varying(11),
    email character varying(30),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.contato;
       public         heap    postgres    false            �            1259    33642    contato_contato_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contato_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.contato_contato_id_seq;
       public          postgres    false    218            )           0    0    contato_contato_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.contato_contato_id_seq OWNED BY public.contato.contato_id;
          public          postgres    false    217            �            1259    33650    delegado    TABLE     �   CREATE TABLE public.delegado (
    delegado_id integer NOT NULL,
    oab character varying(10),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.delegado;
       public         heap    postgres    false            �            1259    33649    delegado_delegado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.delegado_delegado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.delegado_delegado_id_seq;
       public          postgres    false    220            *           0    0    delegado_delegado_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.delegado_delegado_id_seq OWNED BY public.delegado.delegado_id;
          public          postgres    false    219            �            1259    33657    endereco    TABLE     &  CREATE TABLE public.endereco (
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
       public         heap    postgres    false            �            1259    33656    endereco_endereco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_endereco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.endereco_endereco_id_seq;
       public          postgres    false    222            +           0    0    endereco_endereco_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.endereco_endereco_id_seq OWNED BY public.endereco.endereco_id;
          public          postgres    false    221            �            1259    33666    envolvidos_inquerito    TABLE     �   CREATE TABLE public.envolvidos_inquerito (
    env_inq_id integer NOT NULL,
    fk_vitima integer,
    fk_suspeito integer,
    fk_inquerito integer NOT NULL
);
 (   DROP TABLE public.envolvidos_inquerito;
       public         heap    postgres    false            �            1259    33665 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.envolvidos_inquerito_env_inq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.envolvidos_inquerito_env_inq_id_seq;
       public          postgres    false    224            ,           0    0 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.envolvidos_inquerito_env_inq_id_seq OWNED BY public.envolvidos_inquerito.env_inq_id;
          public          postgres    false    223            �            1259    33673    escrivao    TABLE     �   CREATE TABLE public.escrivao (
    escrivao_id integer NOT NULL,
    fk_pessoa integer NOT NULL,
    fk_cartorio integer NOT NULL
);
    DROP TABLE public.escrivao;
       public         heap    postgres    false            �            1259    33672    escrivao_escrivao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.escrivao_escrivao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.escrivao_escrivao_id_seq;
       public          postgres    false    226            -           0    0    escrivao_escrivao_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.escrivao_escrivao_id_seq OWNED BY public.escrivao.escrivao_id;
          public          postgres    false    225            �            1259    33680 	   inquerito    TABLE     �  CREATE TABLE public.inquerito (
    inquerito_id integer NOT NULL,
    n_sinesp character varying NOT NULL,
    n_ip character varying,
    tipo_ip character varying,
    data_instaraucao timestamp with time zone,
    data_ocorrencia timestamp with time zone,
    fk_escrivao integer NOT NULL,
    fk_cartorio integer NOT NULL,
    fk_endereco integer NOT NULL,
    tipificacao character varying
);
    DROP TABLE public.inquerito;
       public         heap    postgres    false            �            1259    33679    inquerito_inquerito_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inquerito_inquerito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.inquerito_inquerito_id_seq;
       public          postgres    false    228            .           0    0    inquerito_inquerito_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.inquerito_inquerito_id_seq OWNED BY public.inquerito.inquerito_id;
          public          postgres    false    227            �            1259    33689    pessoa    TABLE     d  CREATE TABLE public.pessoa (
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
       public         heap    postgres    false            �            1259    33688    pessoa_pessoa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pessoa_pessoa_id_seq;
       public          postgres    false    230            /           0    0    pessoa_pessoa_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pessoa_pessoa_id_seq OWNED BY public.pessoa.pessoa_id;
          public          postgres    false    229            �            1259    33700    processo    TABLE     �   CREATE TABLE public.processo (
    processo_id integer NOT NULL,
    n_processo character varying,
    representacao_judicial character varying,
    cumprimento_mandado character varying,
    fk_inquerito integer NOT NULL
);
    DROP TABLE public.processo;
       public         heap    postgres    false            �            1259    33699    processo_processo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.processo_processo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.processo_processo_id_seq;
       public          postgres    false    232            0           0    0    processo_processo_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.processo_processo_id_seq OWNED BY public.processo.processo_id;
          public          postgres    false    231            �            1259    33709    suspeito    TABLE     �   CREATE TABLE public.suspeito (
    suspeito_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.suspeito;
       public         heap    postgres    false            �            1259    33708    suspeito_suspeito_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suspeito_suspeito_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.suspeito_suspeito_id_seq;
       public          postgres    false    234            1           0    0    suspeito_suspeito_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.suspeito_suspeito_id_seq OWNED BY public.suspeito.suspeito_id;
          public          postgres    false    233            �            1259    33716    usuario    TABLE     �   CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    usuario character varying(20) NOT NULL,
    senha character varying,
    fk_pessoa integer NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    33715    usuario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_usuario_id_seq;
       public          postgres    false    236            2           0    0    usuario_usuario_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario.usuario_id;
          public          postgres    false    235            �            1259    33725    vitima    TABLE     �   CREATE TABLE public.vitima (
    vitima_id integer NOT NULL,
    faccao character varying(15),
    vulgo character varying(10),
    fk_pessoa integer NOT NULL,
    ligacao_suspeito boolean
);
    DROP TABLE public.vitima;
       public         heap    postgres    false            �            1259    33724    vitima_vitima_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vitima_vitima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.vitima_vitima_id_seq;
       public          postgres    false    238            3           0    0    vitima_vitima_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.vitima_vitima_id_seq OWNED BY public.vitima.vitima_id;
          public          postgres    false    237            E           2604    33639    cartorio cartorio_id    DEFAULT     |   ALTER TABLE ONLY public.cartorio ALTER COLUMN cartorio_id SET DEFAULT nextval('public.cartorio_cartorio_id_seq'::regclass);
 C   ALTER TABLE public.cartorio ALTER COLUMN cartorio_id DROP DEFAULT;
       public          postgres    false    216    215    216            F           2604    33646    contato contato_id    DEFAULT     x   ALTER TABLE ONLY public.contato ALTER COLUMN contato_id SET DEFAULT nextval('public.contato_contato_id_seq'::regclass);
 A   ALTER TABLE public.contato ALTER COLUMN contato_id DROP DEFAULT;
       public          postgres    false    217    218    218            G           2604    33653    delegado delegado_id    DEFAULT     |   ALTER TABLE ONLY public.delegado ALTER COLUMN delegado_id SET DEFAULT nextval('public.delegado_delegado_id_seq'::regclass);
 C   ALTER TABLE public.delegado ALTER COLUMN delegado_id DROP DEFAULT;
       public          postgres    false    219    220    220            H           2604    33660    endereco endereco_id    DEFAULT     |   ALTER TABLE ONLY public.endereco ALTER COLUMN endereco_id SET DEFAULT nextval('public.endereco_endereco_id_seq'::regclass);
 C   ALTER TABLE public.endereco ALTER COLUMN endereco_id DROP DEFAULT;
       public          postgres    false    222    221    222            I           2604    33669    envolvidos_inquerito env_inq_id    DEFAULT     �   ALTER TABLE ONLY public.envolvidos_inquerito ALTER COLUMN env_inq_id SET DEFAULT nextval('public.envolvidos_inquerito_env_inq_id_seq'::regclass);
 N   ALTER TABLE public.envolvidos_inquerito ALTER COLUMN env_inq_id DROP DEFAULT;
       public          postgres    false    224    223    224            J           2604    33676    escrivao escrivao_id    DEFAULT     |   ALTER TABLE ONLY public.escrivao ALTER COLUMN escrivao_id SET DEFAULT nextval('public.escrivao_escrivao_id_seq'::regclass);
 C   ALTER TABLE public.escrivao ALTER COLUMN escrivao_id DROP DEFAULT;
       public          postgres    false    226    225    226            K           2604    33683    inquerito inquerito_id    DEFAULT     �   ALTER TABLE ONLY public.inquerito ALTER COLUMN inquerito_id SET DEFAULT nextval('public.inquerito_inquerito_id_seq'::regclass);
 E   ALTER TABLE public.inquerito ALTER COLUMN inquerito_id DROP DEFAULT;
       public          postgres    false    227    228    228            L           2604    33692    pessoa pessoa_id    DEFAULT     t   ALTER TABLE ONLY public.pessoa ALTER COLUMN pessoa_id SET DEFAULT nextval('public.pessoa_pessoa_id_seq'::regclass);
 ?   ALTER TABLE public.pessoa ALTER COLUMN pessoa_id DROP DEFAULT;
       public          postgres    false    229    230    230            M           2604    33703    processo processo_id    DEFAULT     |   ALTER TABLE ONLY public.processo ALTER COLUMN processo_id SET DEFAULT nextval('public.processo_processo_id_seq'::regclass);
 C   ALTER TABLE public.processo ALTER COLUMN processo_id DROP DEFAULT;
       public          postgres    false    232    231    232            N           2604    33712    suspeito suspeito_id    DEFAULT     |   ALTER TABLE ONLY public.suspeito ALTER COLUMN suspeito_id SET DEFAULT nextval('public.suspeito_suspeito_id_seq'::regclass);
 C   ALTER TABLE public.suspeito ALTER COLUMN suspeito_id DROP DEFAULT;
       public          postgres    false    234    233    234            O           2604    33719    usuario usuario_id    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN usuario_id DROP DEFAULT;
       public          postgres    false    236    235    236            P           2604    33728    vitima vitima_id    DEFAULT     t   ALTER TABLE ONLY public.vitima ALTER COLUMN vitima_id SET DEFAULT nextval('public.vitima_vitima_id_seq'::regclass);
 ?   ALTER TABLE public.vitima ALTER COLUMN vitima_id DROP DEFAULT;
       public          postgres    false    237    238    238                      0    33636    cartorio 
   TABLE DATA           B   COPY public.cartorio (cartorio_id, nome, fk_delegado) FROM stdin;
    public          postgres    false    216   o~                 0    33643    contato 
   TABLE DATA           R   COPY public.contato (contato_id, celular, telefone, email, fk_pessoa) FROM stdin;
    public          postgres    false    218   �~                 0    33650    delegado 
   TABLE DATA           ?   COPY public.delegado (delegado_id, oab, fk_pessoa) FROM stdin;
    public          postgres    false    220   �~                 0    33657    endereco 
   TABLE DATA           m   COPY public.endereco (endereco_id, logradouro, n_residencia, bairro, cidade, cep, uf, fk_pessoa) FROM stdin;
    public          postgres    false    222                    0    33666    envolvidos_inquerito 
   TABLE DATA           `   COPY public.envolvidos_inquerito (env_inq_id, fk_vitima, fk_suspeito, fk_inquerito) FROM stdin;
    public          postgres    false    224   �                 0    33673    escrivao 
   TABLE DATA           G   COPY public.escrivao (escrivao_id, fk_pessoa, fk_cartorio) FROM stdin;
    public          postgres    false    226   �                 0    33680 	   inquerito 
   TABLE DATA           �   COPY public.inquerito (inquerito_id, n_sinesp, n_ip, tipo_ip, data_instaraucao, data_ocorrencia, fk_escrivao, fk_cartorio, fk_endereco, tipificacao) FROM stdin;
    public          postgres    false    228   �                 0    33689    pessoa 
   TABLE DATA           g   COPY public.pessoa (pessoa_id, nome, nome_social, nascimento, cpf, sexo, etnia, lgbt, pcd) FROM stdin;
    public          postgres    false    230   ��                 0    33700    processo 
   TABLE DATA           v   COPY public.processo (processo_id, n_processo, representacao_judicial, cumprimento_mandado, fk_inquerito) FROM stdin;
    public          postgres    false    232   v�                 0    33709    suspeito 
   TABLE DATA           I   COPY public.suspeito (suspeito_id, faccao, vulgo, fk_pessoa) FROM stdin;
    public          postgres    false    234   ��                 0    33716    usuario 
   TABLE DATA           H   COPY public.usuario (usuario_id, usuario, senha, fk_pessoa) FROM stdin;
    public          postgres    false    236   ��       !          0    33725    vitima 
   TABLE DATA           W   COPY public.vitima (vitima_id, faccao, vulgo, fk_pessoa, ligacao_suspeito) FROM stdin;
    public          postgres    false    238   W�       4           0    0    cartorio_cartorio_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.cartorio_cartorio_id_seq', 1, true);
          public          postgres    false    215            5           0    0    contato_contato_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.contato_contato_id_seq', 2, true);
          public          postgres    false    217            6           0    0    delegado_delegado_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.delegado_delegado_id_seq', 1, true);
          public          postgres    false    219            7           0    0    endereco_endereco_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.endereco_endereco_id_seq', 7, true);
          public          postgres    false    221            8           0    0 #   envolvidos_inquerito_env_inq_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.envolvidos_inquerito_env_inq_id_seq', 1, true);
          public          postgres    false    223            9           0    0    escrivao_escrivao_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.escrivao_escrivao_id_seq', 1, true);
          public          postgres    false    225            :           0    0    inquerito_inquerito_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.inquerito_inquerito_id_seq', 5, true);
          public          postgres    false    227            ;           0    0    pessoa_pessoa_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pessoa_pessoa_id_seq', 5, true);
          public          postgres    false    229            <           0    0    processo_processo_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.processo_processo_id_seq', 1, false);
          public          postgres    false    231            =           0    0    suspeito_suspeito_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.suspeito_suspeito_id_seq', 1, false);
          public          postgres    false    233            >           0    0    usuario_usuario_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 2, true);
          public          postgres    false    235            ?           0    0    vitima_vitima_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.vitima_vitima_id_seq', 1, true);
          public          postgres    false    237            R           2606    33641    cartorio cartorio_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT cartorio_pkey PRIMARY KEY (cartorio_id);
 @   ALTER TABLE ONLY public.cartorio DROP CONSTRAINT cartorio_pkey;
       public            postgres    false    216            T           2606    33648    contato contato_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (contato_id);
 >   ALTER TABLE ONLY public.contato DROP CONSTRAINT contato_pkey;
       public            postgres    false    218            `           2606    33698 
   pessoa cpf 
   CONSTRAINT     D   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT cpf UNIQUE (cpf);
 4   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT cpf;
       public            postgres    false    230            V           2606    33655    delegado delegado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT delegado_pkey PRIMARY KEY (delegado_id);
 @   ALTER TABLE ONLY public.delegado DROP CONSTRAINT delegado_pkey;
       public            postgres    false    220            X           2606    33664    endereco endereco_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (endereco_id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            postgres    false    222            Z           2606    33671 .   envolvidos_inquerito envolvidos_inquerito_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT envolvidos_inquerito_pkey PRIMARY KEY (env_inq_id);
 X   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT envolvidos_inquerito_pkey;
       public            postgres    false    224            \           2606    33678    escrivao escrivao_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT escrivao_pkey PRIMARY KEY (escrivao_id);
 @   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT escrivao_pkey;
       public            postgres    false    226            ^           2606    33687    inquerito inquerito_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT inquerito_pkey PRIMARY KEY (inquerito_id);
 B   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT inquerito_pkey;
       public            postgres    false    228            b           2606    33696    pessoa pessoa_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (pessoa_id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public            postgres    false    230            d           2606    33707    processo processo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (processo_id);
 @   ALTER TABLE ONLY public.processo DROP CONSTRAINT processo_pkey;
       public            postgres    false    232            f           2606    33714    suspeito suspeito_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT suspeito_pkey PRIMARY KEY (suspeito_id);
 @   ALTER TABLE ONLY public.suspeito DROP CONSTRAINT suspeito_pkey;
       public            postgres    false    234            h           2606    33723    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    236            j           2606    33730    vitima vitima_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT vitima_pkey PRIMARY KEY (vitima_id);
 <   ALTER TABLE ONLY public.vitima DROP CONSTRAINT vitima_pkey;
       public            postgres    false    238            r           2606    33766    escrivao fk_cartorio    FK CONSTRAINT     �   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) NOT VALID;
 >   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT fk_cartorio;
       public          postgres    false    216    226    4690            t           2606    33776    inquerito fk_cartorio    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_cartorio FOREIGN KEY (fk_cartorio) REFERENCES public.cartorio(cartorio_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_cartorio;
       public          postgres    false    4690    216    228            k           2606    33731    cartorio fk_delegado    FK CONSTRAINT     �   ALTER TABLE ONLY public.cartorio
    ADD CONSTRAINT fk_delegado FOREIGN KEY (fk_delegado) REFERENCES public.delegado(delegado_id) NOT VALID;
 >   ALTER TABLE ONLY public.cartorio DROP CONSTRAINT fk_delegado;
       public          postgres    false    216    4694    220            u           2606    33781    inquerito fk_endereco    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_endereco FOREIGN KEY (fk_endereco) REFERENCES public.endereco(endereco_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_endereco;
       public          postgres    false    4696    228    222            v           2606    33786    inquerito fk_escrivao    FK CONSTRAINT     �   ALTER TABLE ONLY public.inquerito
    ADD CONSTRAINT fk_escrivao FOREIGN KEY (fk_escrivao) REFERENCES public.escrivao(escrivao_id) ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.inquerito DROP CONSTRAINT fk_escrivao;
       public          postgres    false    4700    228    226            o           2606    33751 !   envolvidos_inquerito fk_inquerito    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;
 K   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_inquerito;
       public          postgres    false    228    224    4702            w           2606    33791    processo fk_inquerito    FK CONSTRAINT     �   ALTER TABLE ONLY public.processo
    ADD CONSTRAINT fk_inquerito FOREIGN KEY (fk_inquerito) REFERENCES public.inquerito(inquerito_id) NOT VALID;
 ?   ALTER TABLE ONLY public.processo DROP CONSTRAINT fk_inquerito;
       public          postgres    false    228    232    4702            l           2606    33736    contato fk_pessoa    FK CONSTRAINT     �   ALTER TABLE ONLY public.contato
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id) NOT VALID;
 ;   ALTER TABLE ONLY public.contato DROP CONSTRAINT fk_pessoa;
       public          postgres    false    230    218    4706            m           2606    33741    delegado fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.delegado
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.delegado DROP CONSTRAINT fk_pessoa;
       public          postgres    false    220    4706    230            n           2606    33746    endereco fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.endereco DROP CONSTRAINT fk_pessoa;
       public          postgres    false    4706    230    222            s           2606    33771    escrivao fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.escrivao
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.escrivao DROP CONSTRAINT fk_pessoa;
       public          postgres    false    4706    230    226            x           2606    33796    suspeito fk_pessoa    FK CONSTRAINT     {   ALTER TABLE ONLY public.suspeito
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 <   ALTER TABLE ONLY public.suspeito DROP CONSTRAINT fk_pessoa;
       public          postgres    false    4706    230    234            y           2606    33801    usuario fk_pessoa    FK CONSTRAINT     z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 ;   ALTER TABLE ONLY public.usuario DROP CONSTRAINT fk_pessoa;
       public          postgres    false    230    4706    236            z           2606    33806    vitima fk_pessoa    FK CONSTRAINT     y   ALTER TABLE ONLY public.vitima
    ADD CONSTRAINT fk_pessoa FOREIGN KEY (fk_pessoa) REFERENCES public.pessoa(pessoa_id);
 :   ALTER TABLE ONLY public.vitima DROP CONSTRAINT fk_pessoa;
       public          postgres    false    238    230    4706            p           2606    33756     envolvidos_inquerito fk_suspeito    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_suspeito FOREIGN KEY (fk_suspeito) REFERENCES public.suspeito(suspeito_id) NOT VALID;
 J   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_suspeito;
       public          postgres    false    224    4710    234            q           2606    33761    envolvidos_inquerito fk_vitima    FK CONSTRAINT     �   ALTER TABLE ONLY public.envolvidos_inquerito
    ADD CONSTRAINT fk_vitima FOREIGN KEY (fk_vitima) REFERENCES public.vitima(vitima_id) NOT VALID;
 H   ALTER TABLE ONLY public.envolvidos_inquerito DROP CONSTRAINT fk_vitima;
       public          postgres    false    224    238    4714                  x�3�tv
���W0�4����� .��         A   x�3�4�d��������W�������������/�!��2-Ρ~�a�!��H��b���� i�            x�3�4�NC�=... "~         �   x�mNK� ]?N�	���DJ�Vt�t������S�Hf�gf�� �^��Ptd �L`�A���b��%Q�\���s�2m��*������-��������^�m�n�� ��ʾ*5�J�9���˧s�>�<9}w��E���M��YB�            x�3�4���4����� �            x�3�4�4����� �Z         �   x��ϱ� ����B����0��h|?Wg�>��i�!���H�pvs�#�a�o;�>X�,A���#GR�
[!�P{��K�C%��N�����h����A����I0ay .O��?Ŏ�W�}��ڱ�.Zk���d]�O�c���3����)��F=�T砂|�)�o af3         �   x�]�A�0�����@�L[4�+�h��ٸ����x1	&�&��m�<�Z"�<��C5���$J-�����5@D"�R���d��0���|���&x��:�`z�;r�vg�##
$A߲$��*eyX�kr�����9E�]������o�Z�5���3��c/�u6�            x������ � �            x������ � �         �   x�5�;�0  й=siXfI��ĥ@��Z��;���O�O3���/`�� Ԡ�»��UK+Q++Dy҈r_Y�Ֆ�s�w[�Qe�= ��g�_j{=a?��=��.T�o��g��l[��op	t�"����oB�:�-�      !      x�3�pv��4������� ��     