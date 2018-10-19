--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidade (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    estado integer NOT NULL
);


ALTER TABLE public.cidade OWNER TO postgres;

--
-- Name: desejos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desejos (
    pessoa_fisica integer NOT NULL,
    produto integer NOT NULL
);


ALTER TABLE public.desejos OWNER TO postgres;

--
-- Name: endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endereco (
    id integer NOT NULL,
    bairro character varying(30) NOT NULL,
    cep character varying(9) NOT NULL,
    complemento character varying(20),
    endereco character varying(50) NOT NULL,
    nickname character varying(20) NOT NULL,
    numero character varying(10) NOT NULL,
    referencia character varying(20),
    cidade integer NOT NULL,
    pessoa_id integer NOT NULL
);


ALTER TABLE public.endereco OWNER TO postgres;

--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    uf character varying(2) NOT NULL,
    pais integer NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    id integer NOT NULL,
    iso character varying(3) NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- Name: parcela; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parcela (
    numero integer NOT NULL,
    data_pagamento date,
    valor numeric(10,2) NOT NULL,
    valor_pago numeric(10,2),
    vencimento date NOT NULL,
    venda integer NOT NULL
);


ALTER TABLE public.parcela OWNER TO postgres;

--
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character varying(14) NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- Name: pessoa_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa_fisica (
    cpf character varying(14) NOT NULL,
    nascimento date NOT NULL,
    rg character varying(10) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.pessoa_fisica OWNER TO postgres;

--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    descricao text,
    nome character varying(50) NOT NULL,
    preco numeric(10,2) NOT NULL,
    quantidade_estoque numeric(10,2) NOT NULL,
    categoria integer NOT NULL,
    marca integer NOT NULL,
    CONSTRAINT produto_preco_check CHECK ((preco >= (0)::numeric)),
    CONSTRAINT produto_quantidade_estoque_check CHECK ((quantidade_estoque >= (0)::numeric))
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- Name: seq_categoria_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_categoria_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_categoria_id OWNER TO postgres;

--
-- Name: seq_cidade_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_cidade_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_cidade_id OWNER TO postgres;

--
-- Name: seq_endereco_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_endereco_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_endereco_id OWNER TO postgres;

--
-- Name: seq_estado_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_estado_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_estado_id OWNER TO postgres;

--
-- Name: seq_marca_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_marca_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_marca_id OWNER TO postgres;

--
-- Name: seq_pais_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pais_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pais_id OWNER TO postgres;

--
-- Name: seq_pessoa_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pessoa_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_pessoa_id OWNER TO postgres;

--
-- Name: seq_produto_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_produto_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_produto_id OWNER TO postgres;

--
-- Name: seq_venda_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_venda_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_venda_id OWNER TO postgres;

--
-- Name: seq_venda_itens_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_venda_itens_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_venda_itens_id OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    ativo boolean NOT NULL,
    nome_usuario character varying(20) NOT NULL,
    senha character varying(20) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id integer NOT NULL,
    data timestamp without time zone NOT NULL,
    quantidade_parcelas integer NOT NULL,
    valor_total numeric(10,2) NOT NULL,
    pessoa integer NOT NULL,
    usuario integer NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- Name: venda_itens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda_itens (
    id integer NOT NULL,
    quantidade numeric(10,2) NOT NULL,
    valor_total numeric(10,2) NOT NULL,
    valor_unitario numeric(10,2) NOT NULL,
    produto integer NOT NULL,
    venda integer NOT NULL
);


ALTER TABLE public.venda_itens OWNER TO postgres;

--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nome) FROM stdin;
1	Eletrônicos
2	Informática
3	Eletrodoméstiscos
\.


--
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cidade (id, nome, estado) FROM stdin;
1	Passo Fundo	1
2	Porto Alegre	1
\.


--
-- Data for Name: desejos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desejos (pessoa_fisica, produto) FROM stdin;
1	1
\.


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.endereco (id, bairro, cep, complemento, endereco, nickname, numero, referencia, cidade, pessoa_id) FROM stdin;
1	Centro	99873-098	AP 208	Av Brasil	Casa	301	Proximo ao shopping	1	1
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id, nome, uf, pais) FROM stdin;
1	Rio Grande do Sul	RS	1
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id, nome) FROM stdin;
1	Dell
2	Asus
3	LG
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pais (id, iso, nome) FROM stdin;
1	BRA	Brasil
4	URU	Uruguai
\.


--
-- Data for Name: parcela; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parcela (numero, data_pagamento, valor, valor_pago, vencimento, venda) FROM stdin;
1	\N	50.00	\N	2019-06-23	3
2	\N	50.00	\N	2019-06-23	3
3	\N	50.00	\N	2019-06-23	3
4	\N	50.00	\N	2019-06-23	3
1	\N	50.00	\N	2018-09-23	4
2	\N	50.00	\N	2018-10-23	4
3	\N	50.00	\N	2018-11-23	4
4	\N	50.00	\N	2018-12-23	4
\.


--
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoa (id, email, nome, telefone) FROM stdin;
1	jorge.bavaresco@passofundo.ifsul.edu.br	Jorge Bavaresco	(54)8737-9847
2	jorge.bavaresco@passofundo.ifsul.edu.br	Jorge Bavaresco	(54)99987-8669
\.


--
-- Data for Name: pessoa_fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoa_fisica (cpf, nascimento, rg, id) FROM stdin;
256.958.550-55	2018-08-09	7856739487	1
888.079.868-50	1979-10-25	7541258984	2
\.


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (id, descricao, nome, preco, quantidade_estoque, categoria, marca) FROM stdin;
1	Teclado Ergonômico	Teclado Dell	100.00	30.00	1	1
\.


--
-- Name: seq_categoria_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_categoria_id', 3, true);


--
-- Name: seq_cidade_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_cidade_id', 2, true);


--
-- Name: seq_endereco_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_endereco_id', 1, true);


--
-- Name: seq_estado_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_estado_id', 3, true);


--
-- Name: seq_marca_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_marca_id', 3, true);


--
-- Name: seq_pais_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pais_id', 5, true);


--
-- Name: seq_pessoa_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pessoa_id', 2, true);


--
-- Name: seq_produto_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_produto_id', 1, true);


--
-- Name: seq_venda_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_venda_id', 4, true);


--
-- Name: seq_venda_itens_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_venda_itens_id', 3, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (ativo, nome_usuario, senha, id) FROM stdin;
t	jorgebavaresco	123456	2
\.


--
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venda (id, data, quantidade_parcelas, valor_total, pessoa, usuario) FROM stdin;
1	2018-08-23 19:33:40.821	4	0.00	1	2
2	2018-08-23 20:01:47.543	4	200.00	1	2
3	2019-06-23 20:50:14.146	4	200.00	1	2
4	2018-08-23 20:55:46.929	4	200.00	1	2
\.


--
-- Data for Name: venda_itens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venda_itens (id, quantidade, valor_total, valor_unitario, produto, venda) FROM stdin;
1	2.00	200.00	100.00	1	2
2	2.00	200.00	100.00	1	3
3	2.00	200.00	100.00	1	4
\.


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: parcela parcela_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcela
    ADD CONSTRAINT parcela_pkey PRIMARY KEY (numero, venda);


--
-- Name: pessoa_fisica pessoa_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT pessoa_fisica_pkey PRIMARY KEY (id);


--
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- Name: desejos uk_47svi7a8ummn4yxjy7ojiqjcf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desejos
    ADD CONSTRAINT uk_47svi7a8ummn4yxjy7ojiqjcf UNIQUE (pessoa_fisica, produto);


--
-- Name: marca uk_ix7qqllivg82mpp45cgolja3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT uk_ix7qqllivg82mpp45cgolja3 UNIQUE (nome);


--
-- Name: usuario uk_oieu9u1g4ltrbbqf8rrvb0ldc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_oieu9u1g4ltrbbqf8rrvb0ldc UNIQUE (nome_usuario);


--
-- Name: categoria uk_prx5elpv558ah8pk8x18u56yc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT uk_prx5elpv558ah8pk8x18u56yc UNIQUE (nome);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: venda_itens venda_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_itens
    ADD CONSTRAINT venda_itens_pkey PRIMARY KEY (id);


--
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id);


--
-- Name: pessoa_fisica fk_1xbamx9axtft6c9hfxmaumr0k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa_fisica
    ADD CONSTRAINT fk_1xbamx9axtft6c9hfxmaumr0k FOREIGN KEY (id) REFERENCES public.pessoa(id);


--
-- Name: desejos fk_4xsoh838si2kdrhv4vdvjnces; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desejos
    ADD CONSTRAINT fk_4xsoh838si2kdrhv4vdvjnces FOREIGN KEY (produto) REFERENCES public.produto(id);


--
-- Name: endereco fk_cidade_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_cidade_endereco FOREIGN KEY (cidade) REFERENCES public.cidade(id);


--
-- Name: cidade fk_cidade_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (estado) REFERENCES public.estado(id);


--
-- Name: desejos fk_i1is6h7qfnqfdojpnjw8wby0n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desejos
    ADD CONSTRAINT fk_i1is6h7qfnqfdojpnjw8wby0n FOREIGN KEY (pessoa_fisica) REFERENCES public.pessoa_fisica(id);


--
-- Name: usuario fk_ky4fsf2p8cggggirm1b0cajes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_ky4fsf2p8cggggirm1b0cajes FOREIGN KEY (id) REFERENCES public.pessoa_fisica(id);


--
-- Name: parcela fk_p4emp2ebpk1wbp45qa15waa3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parcela
    ADD CONSTRAINT fk_p4emp2ebpk1wbp45qa15waa3f FOREIGN KEY (venda) REFERENCES public.venda(id);


--
-- Name: estado fk_pais_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT fk_pais_estado FOREIGN KEY (pais) REFERENCES public.pais(id);


--
-- Name: endereco fk_pessoa_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT fk_pessoa_endereco FOREIGN KEY (pessoa_id) REFERENCES public.pessoa(id);


--
-- Name: produto fk_produto_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_categoria FOREIGN KEY (categoria) REFERENCES public.categoria(id);


--
-- Name: produto fk_produto_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_marca FOREIGN KEY (marca) REFERENCES public.marca(id);


--
-- Name: venda_itens fk_venda_item_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_itens
    ADD CONSTRAINT fk_venda_item_produto FOREIGN KEY (produto) REFERENCES public.produto(id);


--
-- Name: venda_itens fk_venda_item_venda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_itens
    ADD CONSTRAINT fk_venda_item_venda FOREIGN KEY (venda) REFERENCES public.venda(id);


--
-- Name: venda fk_venda_pessoa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_venda_pessoa FOREIGN KEY (pessoa) REFERENCES public.pessoa_fisica(id);


--
-- Name: venda fk_venda_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_venda_usuario FOREIGN KEY (usuario) REFERENCES public.usuario(id);


--
-- PostgreSQL database dump complete
--

