--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO username;

--
-- Name: place; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.place (
    id uuid NOT NULL,
    place_id character varying NOT NULL,
    latitude numeric(30,20) NOT NULL,
    longitude numeric(30,20) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    rating numeric(3,2)
);


ALTER TABLE public.place OWNER TO username;

--
-- Name: place_image; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.place_image (
    place_id uuid NOT NULL,
    image_url character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.place_image OWNER TO username;

--
-- Name: place_reaction; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.place_reaction (
    id uuid NOT NULL,
    place_id uuid NOT NULL,
    user_id uuid NOT NULL,
    reaction character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT reaction_check CHECK (((reaction)::text = ANY ((ARRAY['like'::character varying, 'dislike'::character varying])::text[])))
);


ALTER TABLE public.place_reaction OWNER TO username;

--
-- Name: place_type; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.place_type (
    place_id uuid NOT NULL,
    type character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.place_type OWNER TO username;

--
-- Name: user; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public."user" (
    id uuid NOT NULL,
    email character varying,
    password character varying,
    name character varying
);


ALTER TABLE public."user" OWNER TO username;

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.alembic_version (version_num) FROM stdin;
3d078fc06fdd
\.


--
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.place (id, place_id, latitude, longitude, created_at, name, rating) FROM stdin;
3c7cb256-4276-4685-b245-5eb38c1c4642	ChIJ7XbRkmoOhEgR2p7TM0PB5iI	57.15313829999999000000	-2.08464260000000000000	2024-11-23 02:51:41	Aberdeen Science Centre	4.50
\.


--
-- Data for Name: place_image; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.place_image (place_id, image_url, created_at) FROM stdin;
3c7cb256-4276-4685-b245-5eb38c1c4642	https://lh3.googleusercontent.com/places/ANXAkqEQd9BZvtc_VHAIIVeRb34DytM06VxdqFIndy44sj1E8YaCiiJHEgb2CqSfsCsFEzsi7LOGtXv8c3vxFMXmNuZBGIfsYqLnijY=s1600-w100	2024-11-23 02:59:54
\.


--
-- Data for Name: place_reaction; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.place_reaction (id, place_id, user_id, reaction, created_at) FROM stdin;
\.


--
-- Data for Name: place_type; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.place_type (place_id, type, created_at) FROM stdin;
3c7cb256-4276-4685-b245-5eb38c1c4642	tourist_attraction	2024-11-23 03:00:34
3c7cb256-4276-4685-b245-5eb38c1c4642	museum	2024-11-23 03:00:50
3c7cb256-4276-4685-b245-5eb38c1c4642	point_of_interest	2024-11-23 03:00:52
3c7cb256-4276-4685-b245-5eb38c1c4642	establishment	2024-11-23 03:00:51
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public."user" (id, email, password, name) FROM stdin;
d2200509-9ba5-4573-938f-330f690a0c08	aaaasdsdemail@example.com	$argon2id$v=19$m=65536,t=3,p=4$Wvpr/HxC4CWUJp+Kv+fjRw$563jKYa8L1pZnD4IPoR/IbjyTAivlZwCJiLzeKWv7hs	name
0faba899-a07c-420b-a35e-cdc3b6de8a54	dhhdbshs@dud.d	$argon2id$v=19$m=65536,t=3,p=4$G4hZ5onq99P7JDgdqz4zGw$4lCRw03EQR9Sx3cl4npTiyA0qYvXZ2FgIfWM7SrxXCk	udhdhdshudhs
f8ecf05c-7f87-411f-aacd-306747a90777	dhudhsudh@hdd.d	$argon2id$v=19$m=65536,t=3,p=4$9Za0k0lFsbpe1ezqa6s1Yw$wHe3aPyD7MQG9EKiUyZEqbwzAO/zL6Z/nAQVja+EFfw	hdhhdhd
d906e557-bffc-4393-9107-fc681ef86a6b	hdhehr@djd.d	$argon2id$v=19$m=65536,t=3,p=4$bYRwfs51H3sxZA404b+U3w$IfgPwDhmzLsBQ+xhYS81hbq4J/v+4GY1BVQZXsynTQ0	dududhud
4fdc90aa-398b-4ba9-9738-1bb68be8937f	shsyheh@ehe.es	$argon2id$v=19$m=65536,t=3,p=4$6LjZtL/8W3NKGxaklWGb7g$K1hgG3ox3i3KD49fIpKGrhB1c0G9bT3eMxH4Wom52y0	hdvdhdg
abb4dc6f-a7a6-41b2-b64e-f118a9f39fd7	dheyehhr@eie.e	$argon2id$v=19$m=65536,t=3,p=4$NobttHzURDNae/Fzv40qRg$LdSDkIx/07lJhsxsCvaOLV6N9c9GbEIHanJTyZ54YoM	hegeyhe
804116f3-be03-4e2c-b700-d7c265160f8b	dheuhehr@rud.dd	$argon2id$v=19$m=65536,t=3,p=4$5P1CUrqf27x4BP/3Y7l/FA$dGvo/NV8u5EImLbcyXTyhIwivTM3WkL02OGZ2VmUsMc	hdgdhd
\.


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: place_image place_image_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_image
    ADD CONSTRAINT place_image_pkey PRIMARY KEY (place_id, image_url);


--
-- Name: place place_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (id);


--
-- Name: place_reaction place_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_reaction
    ADD CONSTRAINT place_reaction_pkey PRIMARY KEY (id);


--
-- Name: place_type place_type_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_type
    ADD CONSTRAINT place_type_pkey PRIMARY KEY (place_id, type);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: place_image place_image_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_image
    ADD CONSTRAINT place_image_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) ON DELETE CASCADE;


--
-- Name: place_reaction place_reaction_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_reaction
    ADD CONSTRAINT place_reaction_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) ON DELETE CASCADE;


--
-- Name: place_reaction place_reaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_reaction
    ADD CONSTRAINT place_reaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: place_type place_type_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.place_type
    ADD CONSTRAINT place_type_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

