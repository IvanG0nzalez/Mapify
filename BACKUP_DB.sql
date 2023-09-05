--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.3

-- Started on 2023-09-05 09:02:02

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
-- TOC entry 229 (class 1259 OID 17362)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO avnadmin;

--
-- TOC entry 228 (class 1259 OID 17361)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO avnadmin;

--
-- TOC entry 4530 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 231 (class 1259 OID 17371)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO avnadmin;

--
-- TOC entry 230 (class 1259 OID 17370)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO avnadmin;

--
-- TOC entry 4531 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 227 (class 1259 OID 17355)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO avnadmin;

--
-- TOC entry 226 (class 1259 OID 17354)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO avnadmin;

--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 233 (class 1259 OID 17378)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO avnadmin;

--
-- TOC entry 235 (class 1259 OID 17387)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO avnadmin;

--
-- TOC entry 234 (class 1259 OID 17386)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO avnadmin;

--
-- TOC entry 4533 (class 0 OID 0)
-- Dependencies: 234
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 232 (class 1259 OID 17377)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO avnadmin;

--
-- TOC entry 4534 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 237 (class 1259 OID 17394)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO avnadmin;

--
-- TOC entry 236 (class 1259 OID 17393)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO avnadmin;

--
-- TOC entry 4535 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 217 (class 1259 OID 17285)
-- Name: bloques; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.bloques (
    id integer NOT NULL,
    numero integer,
    zona character varying(10) NOT NULL,
    codigo character varying(15),
    descripcion character varying(100),
    latitud double precision NOT NULL,
    altitud double precision NOT NULL,
    is_auxiliar boolean NOT NULL,
    numero_auxiliar integer,
    facultad_id integer NOT NULL,
    CONSTRAINT bloques_numero_auxiliar_check CHECK ((numero_auxiliar >= 0)),
    CONSTRAINT bloques_numero_check CHECK ((numero >= 0))
);


ALTER TABLE public.bloques OWNER TO avnadmin;

--
-- TOC entry 216 (class 1259 OID 17284)
-- Name: bloques_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.bloques_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bloques_id_seq OWNER TO avnadmin;

--
-- TOC entry 4536 (class 0 OID 0)
-- Dependencies: 216
-- Name: bloques_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.bloques_id_seq OWNED BY public.bloques.id;


--
-- TOC entry 239 (class 1259 OID 17453)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO avnadmin;

--
-- TOC entry 238 (class 1259 OID 17452)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO avnadmin;

--
-- TOC entry 4537 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 225 (class 1259 OID 17346)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO avnadmin;

--
-- TOC entry 224 (class 1259 OID 17345)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO avnadmin;

--
-- TOC entry 4538 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 215 (class 1259 OID 17276)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO avnadmin;

--
-- TOC entry 214 (class 1259 OID 17275)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO avnadmin;

--
-- TOC entry 4539 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 240 (class 1259 OID 17483)
-- Name: django_session; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO avnadmin;

--
-- TOC entry 219 (class 1259 OID 17298)
-- Name: facultades; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.facultades (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    imagen character varying(100)
);


ALTER TABLE public.facultades OWNER TO avnadmin;

--
-- TOC entry 218 (class 1259 OID 17297)
-- Name: facultades_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.facultades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facultades_id_seq OWNER TO avnadmin;

--
-- TOC entry 4540 (class 0 OID 0)
-- Dependencies: 218
-- Name: facultades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.facultades_id_seq OWNED BY public.facultades.id;


--
-- TOC entry 221 (class 1259 OID 17307)
-- Name: nodos; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.nodos (
    id integer NOT NULL,
    codigo character varying(15),
    latitud double precision,
    altitud double precision,
    bloque_id integer NOT NULL
);


ALTER TABLE public.nodos OWNER TO avnadmin;

--
-- TOC entry 220 (class 1259 OID 17306)
-- Name: nodos_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.nodos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodos_id_seq OWNER TO avnadmin;

--
-- TOC entry 4541 (class 0 OID 0)
-- Dependencies: 220
-- Name: nodos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.nodos_id_seq OWNED BY public.nodos.id;


--
-- TOC entry 223 (class 1259 OID 17316)
-- Name: rutas; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public.rutas (
    id integer NOT NULL,
    distancia double precision,
    tiempo double precision,
    nodo_destino_id integer NOT NULL,
    nodo_inicio_id integer NOT NULL
);


ALTER TABLE public.rutas OWNER TO avnadmin;

--
-- TOC entry 222 (class 1259 OID 17315)
-- Name: rutas_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public.rutas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rutas_id_seq OWNER TO avnadmin;

--
-- TOC entry 4542 (class 0 OID 0)
-- Dependencies: 222
-- Name: rutas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public.rutas_id_seq OWNED BY public.rutas.id;


--
-- TOC entry 4269 (class 2604 OID 17365)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 4270 (class 2604 OID 17374)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 4268 (class 2604 OID 17358)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 4271 (class 2604 OID 17381)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 4272 (class 2604 OID 17390)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 4273 (class 2604 OID 17397)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 4263 (class 2604 OID 17288)
-- Name: bloques id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.bloques ALTER COLUMN id SET DEFAULT nextval('public.bloques_id_seq'::regclass);


--
-- TOC entry 4274 (class 2604 OID 17456)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 4267 (class 2604 OID 17349)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 4262 (class 2604 OID 17279)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 4264 (class 2604 OID 17301)
-- Name: facultades id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.facultades ALTER COLUMN id SET DEFAULT nextval('public.facultades_id_seq'::regclass);


--
-- TOC entry 4265 (class 2604 OID 17310)
-- Name: nodos id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.nodos ALTER COLUMN id SET DEFAULT nextval('public.nodos_id_seq'::regclass);


--
-- TOC entry 4266 (class 2604 OID 17319)
-- Name: rutas id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.rutas ALTER COLUMN id SET DEFAULT nextval('public.rutas_id_seq'::regclass);


--
-- TOC entry 4513 (class 0 OID 17362)
-- Dependencies: 229
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: avnadmin
--



--
-- TOC entry 4515 (class 0 OID 17371)
-- Dependencies: 231
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: avnadmin
--



--
-- TOC entry 4511 (class 0 OID 17355)
-- Dependencies: 227
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add Bloque', 7, 'add_bloque');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change Bloque', 7, 'change_bloque');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete Bloque', 7, 'delete_bloque');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view Bloque', 7, 'view_bloque');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Facultad', 8, 'add_facultad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Facultad', 8, 'change_facultad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Facultad', 8, 'delete_facultad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Facultad', 8, 'view_facultad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add Nodo', 9, 'add_nodo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change Nodo', 9, 'change_nodo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete Nodo', 9, 'delete_nodo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view Nodo', 9, 'view_nodo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add Ruta', 10, 'add_ruta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change Ruta', 10, 'change_ruta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete Ruta', 10, 'delete_ruta');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view Ruta', 10, 'view_ruta');


--
-- TOC entry 4517 (class 0 OID 17378)
-- Dependencies: 233
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$216000$z2Ryp8CQ4qt9$m+dzPE+syzNEqvccESY9Irq+0/TlmbL0gRezClNbyuY=', '2023-09-04 18:38:28.952391+00', true, 'Administrador', 'Iván', 'González', 'ivan.gonzalez@unl.edu.ec', true, true, '2023-08-01 03:22:47.635636+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, 'pbkdf2_sha256$216000$PNHOzIIEfHSz$tZBPAj0dPfVh8xxHneLbIXXXaOjAyLOREbbM7UKjFMU=', '2023-09-05 13:41:39.284258+00', false, 'DavidCamp0', 'David', 'Campoverde', 'david.a.campoverde@unl.edu.ec', true, true, '2023-08-13 16:29:41.127895+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (8, 'pbkdf2_sha256$216000$LEicsYzc4Cf7$U8ttvC/Y0W/keAVBU+rcIgTxXA5Li2fG0CC5+B4JoS4=', NULL, false, 'Steven', 'Steven', 'Intriago', 'david.intriago@unl.edu.ec', true, true, '2023-08-14 06:51:11.92305+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (7, 'pbkdf2_sha256$216000$RXdzuO2cBK3V$x2LMF4z/OLCc115cUIETZttnwZ3sVj5+TnyWbj1cUYM=', '2023-09-01 01:42:11.723016+00', false, 'Jhandry', 'Jhandry', 'Chimbo', 'jhandry.chimbo@unl.edu.ec', true, true, '2023-08-14 06:50:06.956025+00');


--
-- TOC entry 4519 (class 0 OID 17387)
-- Dependencies: 235
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: avnadmin
--



--
-- TOC entry 4521 (class 0 OID 17394)
-- Dependencies: 237
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: avnadmin
--



--
-- TOC entry 4501 (class 0 OID 17285)
-- Dependencies: 217
-- Data for Name: bloques; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (2, 3, 'A', 'A3', 'BLOQUE DE AULAS', -4.03018, -79.19937, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (31, NULL, 'A', 'N15', NULL, -4.03456, -79.203747, true, 15, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (3, 4, 'A', 'A4', 'BLOQUE DE AULAS', -4.0304, -79.19942, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (4, 7, 'A', 'A7', 'BLOQUE DE AULAS', -4.03074, -79.19956, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (5, 8, 'A', 'A8', 'BLOQUE DE AULAS', -4.03098, -79.19963, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (7, 13, 'A', 'A13', 'ADMINISTRACIÓN F.E.R.N.N.R.', -4.03196, -79.19996, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (8, 15, 'A', 'A15', 'LABORATORIO DE MICROPROPAGACIÓN VEGETAL F.A.R.N.R.', -4.03226, -79.20005, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (9, 16, 'A', 'A16', 'MODALIDAD DE ESTUDIOS A DISTANCIA (MED).', -4.03245, -79.20011, false, NULL, 8);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (11, 19, 'A', 'A19', 'AULAS DE ARTES PLÁSTICAS', -4.033073, -79.199981, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (12, 20, 'A', 'A20', 'CARRERA DE MÚSICA Y ARTES PLÁSTICAS.', -4.033316, -79.199922, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (13, 21, 'A', 'A21', 'S/N', -4.0337353, -79.1997873, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (6, 10, 'A', 'A10', 'CARRERA DE GEOLOGÍA ELECTRÓNICA', -4.03138, -79.19976, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (18, NULL, 'A', 'N2', NULL, -4.033454, -79.202454, true, 2, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (19, NULL, 'A', 'N3', NULL, -4.033854, -79.203399, true, 3, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (21, NULL, 'A', 'N5', NULL, -4.0336, -79.20343, true, 5, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (22, NULL, 'A', 'N6', NULL, -4.03378, -79.20361, true, 6, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (23, NULL, 'A', 'N7', NULL, -4.034134, -79.203399, true, 7, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (24, NULL, 'A', 'N8', NULL, -4.034303, -79.203402, true, 8, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (25, NULL, 'A', 'N9', NULL, -4.03434, -79.20383, true, 9, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (26, NULL, 'A', 'N10', NULL, -4.03447, -79.20413, true, 10, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (27, NULL, 'A', 'N11', NULL, -4.03452, -79.20411, true, 11, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (28, NULL, 'A', 'N12', NULL, -4.03454, -79.20417, true, 12, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (29, NULL, 'A', 'N13', NULL, -4.03397, -79.20378, true, 13, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (30, NULL, 'A', 'N14', NULL, -4.034208, -79.203921, true, 14, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (32, NULL, 'A', 'N16', NULL, -4.03463, -79.20393, true, 16, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (33, NULL, 'A', 'N17', NULL, -4.03473, -79.20398, true, 17, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (34, NULL, 'A', 'N18', NULL, -4.034798, -79.204094, true, 18, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (35, NULL, 'A', 'N19', NULL, -4.034886, -79.204046, true, 19, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (36, NULL, 'A', 'N20', NULL, -4.034628, -79.204299, true, 20, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (37, NULL, 'A', 'N21', NULL, -4.03484, -79.20419, true, 21, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (38, NULL, 'A', 'N22', NULL, -4.03497, -79.204489, true, 22, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (39, NULL, 'A', 'N23', NULL, -4.03516, -79.204393, true, 23, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (40, NULL, 'A', 'N24', NULL, -4.035027, -79.204136, true, 24, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (41, NULL, 'A', 'N25', NULL, -4.035241, -79.204077, true, 25, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (42, NULL, 'A', 'N26', NULL, -4.03532, -79.20431, true, 26, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (43, NULL, 'A', 'N27', NULL, -4.03545, -79.20464, true, 27, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (44, NULL, 'A', 'N28', NULL, -4.03558, -79.20443, true, 28, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (47, NULL, 'A', 'N31', NULL, -4.03654, -79.20551, true, 31, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (48, NULL, 'A', 'N32', NULL, -4.036421, -79.205339, true, 32, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (50, NULL, 'A', 'N34', NULL, -4.03453, -79.20337, true, 34, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (51, NULL, 'A', 'N35', NULL, -4.03429, -79.20213, true, 35, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (52, NULL, 'A', 'N36', NULL, -4.03388, -79.20185, true, 36, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (57, NULL, 'A', 'N39', NULL, -4.0328, -79.19997, true, 39, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (59, NULL, 'A', 'N41', NULL, -4.0369, -79.2062, true, 41, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (60, NULL, 'A', 'N42', NULL, -4.03671, -79.20535, true, 42, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (61, NULL, 'A', 'N43', NULL, -4.0372, -79.2048, true, 43, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (64, NULL, 'A', 'N46', NULL, -4.0366, -79.203, true, 46, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (68, NULL, 'A', 'N50', NULL, -4.03244, -79.20013, true, 50, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (69, NULL, 'A', 'N51', NULL, -4.03224, -79.2001, true, 51, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (70, NULL, 'A', 'N52', NULL, -4.03194, -79.20003, true, 52, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (71, NULL, 'A', 'N53', NULL, -4.03134, -79.19984, true, 53, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (72, NULL, 'A', 'N54', NULL, -4.03094, -79.19971, true, 54, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (73, NULL, 'A', 'N55', NULL, -4.0307, -79.19962, true, 55, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (74, NULL, 'A', 'N56', NULL, -4.03306, -79.19992, true, 56, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (75, NULL, 'A', 'N57', NULL, -4.03314, -79.19991, true, 57, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (76, NULL, 'A', 'N58', NULL, -4.0333, -79.19989, true, 58, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (77, NULL, 'A', 'N59', NULL, -4.03344, -79.19986, true, 59, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (78, NULL, 'A', 'N60', NULL, -4.03339, -79.19957, true, 60, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (79, NULL, 'A', 'N61', NULL, -4.03338, -79.19942, true, 61, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (80, NULL, 'A', 'N62', NULL, -4.03342, -79.20126, true, 62, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (81, NULL, 'A', 'N63', NULL, -4.03353, -79.20146, true, 63, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (82, NULL, 'A', 'N64', NULL, -4.03365, -79.20375, true, 64, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (83, NULL, 'A', 'N65', NULL, -4.03432, -79.20426, true, 65, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (84, 22, 'A', 'A22', 'ADMINISTRACIÓN QUINTA LA ARGELIA F.A.R.N.R.', -4.03294, -79.19984, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (85, 23, 'A', 'A23', 'INVERNADERO F.A.R.N.R.', -4.03294, -79.19968, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (86, 24, 'A', 'A24', 'TALLER DE ELECTROMECÁNICA.', -4.03313, -79.19979, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (87, 25, 'A', 'A25', 'TALLER MECÁNICA AUTOMOTRIZ.', -4.03312, -79.19943, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (88, 26, 'A', 'A26', 'AULAS DE ARTES PLÁSTICAS.', -4.03334, -79.19957, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (89, 27, 'A', 'A27', 'BODEGA F.A.R.N.R.', -4.0335547, -79.1997803, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (90, 28, 'A', 'A28', 'BODEGA F.A.R.N.R', -4.033445, -79.1995469, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (91, 29, 'A', 'A29', 'BANCO DE GERMOPLASMA.', -4.033644, -79.1994115, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (92, NULL, 'A', 'N66', NULL, -4.03697, -79.20598, true, 66, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (93, 30, 'A', 'A30', 'MAQUINARIA AGRÍCOLA Y ASERRIO.', -4.0343145, -79.1996465, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (94, NULL, 'A', 'N67', NULL, -4.03669, -79.20647, true, 67, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (95, NULL, 'A', 'N68', NULL, -4.03663, -79.20663, true, 68, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (96, 34, 'A', 'A34', 'MANTENIMIENTO DE EQUIPOS', -4.0332, -79.2022, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (54, NULL, 'A', 'N38', NULL, -4.03282, -79.20148, true, 38, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (20, NULL, 'A', 'N4', 'PUERTA 2', -4.03341, -79.20344, true, 4, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (53, NULL, 'A', 'N37', NULL, -4.0339, -79.201, true, 37, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (17, NULL, 'A', 'N1', 'PUERTA 1', -4.03288, -79.20249, true, 1, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (49, NULL, 'A', 'N33', 'PUERTA 3', -4.03532, -79.20487, true, 33, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (45, NULL, 'A', 'N29', 'PUERTA 4', -4.03595, -79.2053, true, 29, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (46, NULL, 'A', 'N30', 'PUERTA 5', -4.03642, -79.20559, true, 30, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (67, NULL, 'A', 'N49', 'PUERTA 6', -4.0327, -79.20017, true, 49, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (58, NULL, 'A', 'N40', NULL, -4.03272, -79.20062, true, 40, 7);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (65, NULL, 'A', 'N47', NULL, -4.03653, -79.20415, true, 47, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (66, NULL, 'A', 'N48', NULL, -4.03598, -79.20234, true, 48, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (63, NULL, 'A', 'N45', NULL, -4.03696, -79.20395, true, 45, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (62, NULL, 'A', 'N44', NULL, -4.03744, -79.20394, true, 44, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (97, NULL, 'A', 'N69', NULL, -4.03689, -79.20519, true, 69, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (98, 35, 'A', 'A35', 'SERVICIOS GENERALES.', -4.03349, -79.2022, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (99, NULL, 'A', 'N70', NULL, -4.03711, -79.20491, true, 70, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (100, NULL, 'A', 'N71', NULL, -4.03724, -79.20468, true, 71, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (101, 36, 'A', 'A36', 'GIMNASIO.', -4.03345, -79.20147, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (103, NULL, 'A', 'N72', NULL, -4.0373, -79.20458, true, 72, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (104, 38, 'A', 'A38', 'COLISEO.', -4.034231, -79.202039, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (105, NULL, 'A', 'N73', NULL, -4.03734, -79.20445, true, 73, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (107, NULL, 'A', 'N74', NULL, -4.03741, -79.20421, true, 74, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (108, 40, 'A', 'A40', 'ADMINISTRACIÓN CENTRAL BLOQUE 1', -4.03366, -79.2029, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (109, NULL, 'A', 'N75', NULL, -4.03759, -79.20384, true, 75, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (110, 41, 'A', 'A41', 'ADMINISTRACIÓN CENTRAL BLOQUE 2', -4.03356, -79.2029, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (111, NULL, 'A', 'N76', NULL, -4.03681, -79.20483, true, 76, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (112, NULL, 'A', 'N77', NULL, -4.03607, -79.20509, true, 77, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (113, NULL, 'A', 'N78', NULL, -4.03646, -79.20541, true, 78, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (114, NULL, 'A', 'N79', NULL, -4.03662, -79.20509, true, 79, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (115, NULL, 'A', 'N80', NULL, -4.03627, -79.20547, true, 80, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (116, NULL, 'A', 'N81', NULL, -4.03624, -79.2048, true, 81, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (117, 42, 'A', 'A42', 'CARRERA QUÍMICO BIOLOGÍCA, PSICOLOGÍA INFANTIL Y PSICOREHABILITACIÓN', -4.03438, -79.20402, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (118, NULL, 'A', 'N82', NULL, -4.03631, -79.20465, true, 82, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (119, 45, 'A', 'A45', 'LABORATORIOS F.E.A.C.', -4.03456, -79.20404, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (123, NULL, 'A', 'N85', NULL, -4.03605, -79.20345, true, 85, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (124, 47, 'A', 'A47', 'BIBLIOTECA CENTRAL', -4.03436, -79.20357, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (125, NULL, 'A', 'N86', NULL, -4.03577, -79.2036, true, 86, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (126, NULL, 'A', 'N87', NULL, -4.03558, -79.20369, true, 87, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (127, NULL, 'A', 'N88', NULL, -4.03523, -79.20207, true, 88, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (128, 48, 'A', 'A48', 'CENTRO DE DESARROLLO INFANTIL Y CARRERA DE IDIOMAS INGLES.', -4.03466, -79.20351, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (129, 49, 'A', 'A49', 'CENTRO DE DESARROLLO INFANTIL.', -4.03455, -79.20343, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (130, 51, 'A', 'A51', 'LABORATORIO FÍSICA-MECÁNICA DE MADERA', -4.03537, -79.20382, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (131, NULL, 'A', 'N89', 'Redondel de la Nacional', -4.03565, -79.20211, true, 89, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (133, NULL, 'A', 'N90', NULL, -4.03401, -79.20204, true, 90, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (134, NULL, 'A', 'N91', NULL, -4.03385, -79.20159, true, 91, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (135, NULL, 'A', 'N92', NULL, -4.03361, -79.2029, true, 92, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (136, 53, 'A', 'A53', 'CARRERA DE FÍSICO-MATEMÁTICO', -4.034886, -79.204282, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (138, 54, 'A', 'A54', 'CARRERA DE EDUCACIÓN BÁSICA.', -4.035106, -79.204201, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (139, NULL, 'A', 'N94', NULL, -4.03352, -79.19986, true, 94, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (140, NULL, 'A', 'N95', NULL, -4.03344, -79.19965, true, 95, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (141, NULL, 'A', 'N96', NULL, -4.03365, -79.19977, true, 96, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (142, NULL, 'A', 'N97', NULL, -4.03387, -79.19972, true, 97, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (143, 55, 'A', 'A55', 'PSICOPEDADOGOGÍA', -4.035251, -79.204131, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (144, NULL, 'A', 'N98', NULL, -4.0343, -79.19968, true, 98, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (145, 57, 'A', 'A57', 'ADMINISTRACIÓN F.E.A.C.', -4.03509, -79.204645, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (146, 58, 'A', 'A58', 'NIVEL DE POST GRADO F.E.A.C.', -4.035382, -79.204536, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (148, 61, 'A', 'A61', 'NIVEL DE POST GRADO F.A.R.N.R.', -4.035223, -79.203381, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (149, 62, 'A', 'A62', 'INVERNADERO F.A.R.N.R.', -4.03547, -79.20358, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (150, 63, 'A', 'A63', 'LABORATORIO DE FISIOLOGÍA VEGETAL.', -4.035557, -79.2033, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (151, 64, 'A', 'A64', 'HERBARIO ''''REINALDO ESPINOSA''''', -4.03563, -79.20326, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (152, 65, 'A', 'A65', 'LABORATORIO DE BROMATOLOGÍA, QUÍMICA Y DASOMETRÍA.', -4.03542, -79.20325, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (153, 66, 'A', 'A66', 'CARRERA DE AGRONOMÍA.', -4.03546, -79.2031, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (154, 67, 'A', 'A67', 'ÁREA ADMINISTRATIVA F.A.R.N..R.', -4.03516, -79.202843, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (155, 68, 'A', 'A68', 'AULA MAGNA F.A.R.N.R.', -4.03521, -79.20272, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (156, 69, 'A', 'A69', 'SALA DE DOCENTES', -4.03536, -79.20283, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (157, 70, 'A', 'A70', 'BIBLIOTECA F.A.R.N.R.', -4.03536, -79.20273, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (158, 71, 'A', 'A71', 'EX CERACYT', -4.0354379, -79.20278, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (159, 73, 'A', 'A73', 'CARRERA DE VETERINARIA', -4.03584, -79.20335, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (160, 74, 'A', 'A74', 'LABORATORIO-DIAGNOSTICO VETERINARIO.', -4.03591, -79.20309, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (161, 75, 'A', 'A75', 'ANFITEATRO DE VETERINARIA', -4.03608, -79.20332, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (167, 81, 'A', 'A81', 'AULAS DE VETERINARIA', -4.03633, -79.20292, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (168, 83, 'A', 'A83', 'ADMINISTRACIÓN Y POST GRADO F.A.R.N.R.', -4.03591, -79.2027, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (169, 84, 'A', 'A84', 'CARRERA INGENIERÍA FORESTAL', -4.03577, -79.20395, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (170, 85, 'A', 'A85', 'CARRERA DE AGRICOLA.', -4.03593, -79.20382, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (171, 86, 'A', 'A86', 'CARRERA DE MEDIO AMBIENTE.', -4.03615, -79.2036, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (172, 87, 'A', 'A87', 'ADMINISTRACIÓN F.J.S.A.', -4.03558, -79.20488, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (173, 88, 'A', 'A88', 'CARRERA DE TRABAJO SOCIAL.', -4.0359, -79.20489, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (174, 89, 'A', 'A89', 'CARRERA DE DERECHO.', -4.03571, -79.20458, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (175, 90, 'A', 'A90', 'INNOVATION COOWORKING', -4.03602, -79.20473, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (176, 91, 'A', 'A91', 'BLOQUE DE AULAS CARRERA DE DERECHO.', -4.03606, -79.2043, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (177, 92, 'A', 'A92', 'AULA MAGNA Y CARRERA DE DERECHO', -4.03614, -79.20446, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (106, 39, 'A', 'A39', 'ESTADIO.', -4.03493, -79.20062, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (102, 37, 'A', 'A37', 'GIMNASIA.', -4.03378, -79.20156, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (166, 80, 'A', 'A80', 'HOSPITAL VETERINARIO', -4.03589, -79.20301, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (163, 77, 'A', 'A77', 'GUARDA ALMACEN.', -4.03602, -79.20316, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (162, 76, 'A', 'A76', 'LABORATORIO DE APICULTURA', -4.03616, -79.20316, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (164, 78, 'A', 'A78', 'LABORATORIO AMBIENTAL.', -4.03628, -79.2031, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (120, NULL, 'A', 'N83', NULL, -4.03667, -79.2034, true, 83, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (137, NULL, 'A', 'N93', NULL, -4.0327, -79.20179, true, 93, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (147, 60, 'A', 'A60', 'LABORATORIO IDRISE', -4.03524, -79.20314, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (132, 52, 'A', 'A52', 'LABORATORIO CARRERA DE INFORMÁTICA EDUCATIVA', -4.034773, -79.204374, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (121, 46, 'A', 'A46', 'LABORATORIO CARRERA DE INGLÉS', -4.03461, -79.2038, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (178, 94, 'A', 'A94', 'LABORATORIOS CARRERA DE DERECHO', -4.0363, -79.20423, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (122, NULL, 'A', 'N84', NULL, -4.03663, -79.20311, true, 84, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (179, 95, 'A', 'A95', 'CARRERA DE ADMINISTRACIÓN PÚBLICA', -4.03623, -79.20534, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (180, 96, 'A', 'A96', 'SECCIÓN ADMINISTRATIVA Y ACADÉMICA DE DERECHO.', -4.03615, -79.20511, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (181, 98, 'A', 'A98', 'CARRERA DE BANCA Y FINANZAS', -4.03641, -79.20514, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (182, 99, 'A', 'A99', 'CARRERA DE COMUNICACIÓN SOCIAL', -4.03669, -79.20521, false, NULL, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (183, 100, 'A', 'A100', 'CARRERA DE ECONOMÍA', -4.03658, -79.20492, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (184, 103, 'A', 'A103', 'CARRERA DE ADMINISTRACIÓN DE EMPRESAS.', -4.036982, -79.204637, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (185, 104, 'A', 'A104', 'OBELISCO- PLAZA DE CULTURA.', -4.037061, -79.2044567, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (186, 105, 'A', 'A105', 'CARRERA DE CONTABILIDAD Y AUDITORÍA.', -4.037131, -79.204293, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (187, 106, 'A', 'A106', 'BODEGA', -4.03666, -79.2067, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (188, 107, 'A', 'A107', 'BODEGA', -4.03675, -79.2067, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (189, 108, 'A', 'A108', 'EX CATER', -4.0368, -79.2065, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (190, 109, 'A', 'A109', 'DIRECCIÓN DE CENTRO DE INVESTIGACIÓN.', -4.03678, -79.2057, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (191, 110, 'A', 'A110', 'BODEGA.', -4.03658, -79.2056, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (192, 111, 'A', 'A111', 'CENTRO DE BIOTECNOLOGÍA', -4.03724, -79.20496, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (193, 112, 'A', 'A112', 'CARRERA DE ADMINISTRACIÓN TURISTICA.', -4.0373771, -79.2047296, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (194, 113, 'A', 'A113', 'NIVEL DE POST GRADO F.J.S.A.', -4.0374814, -79.2045137, false, NULL, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (195, 114, 'A', 'A114', 'LABORATORIO ANÁLISIS QUÍMICO 2', -4.03744, -79.2049, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (196, 115, 'A', 'A115', 'LABORATORIO ANÁLISIS QUÍMICO 1', -4.03768, -79.2047, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (197, 116, 'A', 'A116', 'RADIO UNIVERSITARIA YCUBÍCULOS DE DOCENTES AGRÍCOL', -4.03767, -79.2038, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (198, 117, 'A', 'A117', 'AULAS CARRERA DE FORESTAL', -4.037554, -79.203665, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (199, 118, 'A', 'A118', 'MANTENIMIENTO VEHICULAR', -4.03768, -79.2036, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (201, NULL, 'A', 'N99', NULL, -4.03293, -79.19995, true, 99, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (202, NULL, 'A', 'N100', NULL, -4.03301, -79.19978, true, 100, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (203, NULL, 'A', 'N101', NULL, -4.033, -79.19968, true, 101, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (204, NULL, 'A', 'N102', NULL, -4.03299, -79.19945, true, 102, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (206, NULL, 'A', 'N103', NULL, -4.03282, -79.20221, true, 103, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (207, NULL, 'A', 'N104', NULL, -4.03269, -79.20222, true, 104, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (209, NULL, 'A', 'N106', NULL, -4.03319, -79.20225, true, 106, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (210, NULL, 'A', 'N107', NULL, -4.03348, -79.20223, true, 107, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (211, NULL, 'A', 'N108', NULL, -4.03382, -79.20172, true, 108, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (212, NULL, 'A', 'N109', NULL, -4.03306, -79.20285, true, 109, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (213, NULL, 'A', 'N110', NULL, -4.03665, -79.20572, true, 110, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (214, NULL, 'A', 'N111', NULL, -4.03708, -79.20389, true, 111, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (218, NULL, 'A', 'N115', NULL, -4.03591, -79.20456, true, 115, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (219, NULL, 'A', 'N116', NULL, -4.03583, -79.20434, true, 116, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (220, NULL, 'A', 'N117', NULL, -4.03601, -79.20419, true, 117, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (221, NULL, 'A', 'N118', NULL, -4.03448, -79.2035, true, 118, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (222, NULL, 'A', 'N119', NULL, -4.03456, -79.20368, true, 119, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (223, NULL, 'A', 'N120', NULL, -4.03522, -79.20364, true, 120, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (224, NULL, 'A', 'N121', NULL, -4.03492, -79.20346, true, 121, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (225, NULL, 'A', 'N122', NULL, -4.03483, -79.20331, true, 122, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (226, NULL, 'A', 'N123', NULL, -4.0328, -79.20017, true, 123, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (227, NULL, 'A', 'N124', NULL, -4.03482, -79.2021, true, 124, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (165, 79, 'A', 'A79', 'LABORATORIO DE PATALOGÍA VETERINARIA.', -4.03623, -79.20303, false, NULL, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (248, NULL, 'A', 'N143', NULL, -4.03593, -79.20343, true, 143, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (249, NULL, 'A', 'N144', NULL, -4.03566, -79.20339, true, 144, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (250, NULL, 'A', 'N145', NULL, -4.03615, -79.2034, true, 145, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (251, NULL, 'A', 'N146', NULL, -4.0355, -79.20295, true, 146, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (252, NULL, 'A', 'N147', NULL, -4.03638, -79.20328, true, 147, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (253, NULL, 'A', 'N148', NULL, -4.03553, -79.20222, true, 148, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (254, NULL, 'A', 'N149', NULL, -4.03685, -79.20443, true, 149, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (205, 0, 'A', 'A0', 'REDONDEL DE LA ARGELIA', -4.032785, -79.202424, false, NULL, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (230, NULL, 'A', 'N125', NULL, -4.03482, -79.20231, true, 125, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (231, NULL, 'A', 'N126', NULL, -4.03515, -79.20227, true, 126, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (232, NULL, 'A', 'N127', NULL, -4.03531, -79.20274, true, 127, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (233, NULL, 'A', 'N128', NULL, -4.03538, -79.2029, true, 128, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (234, NULL, 'A', 'N129', NULL, -4.03519, -79.20298, true, 129, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (235, NULL, 'A', 'N130', NULL, -4.03536, -79.2031, true, 130, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (236, NULL, 'A', 'N131', NULL, -4.03528, -79.20334, true, 131, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (237, NULL, 'A', 'N132', NULL, -4.03586, -79.20295, true, 132, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (238, NULL, 'A', 'N133', NULL, -4.03598, -79.2029, true, 133, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (239, NULL, 'A', 'N134', NULL, -4.03567, -79.20289, true, 134, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (240, NULL, 'A', 'N135', NULL, -4.03561, -79.20242, true, 135, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (241, NULL, 'A', 'N136', NULL, -4.03614, -79.20268, true, 136, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (242, NULL, 'A', 'N137', NULL, -4.03597, -79.20307, true, 137, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (243, NULL, 'A', 'N138', NULL, -4.03609, -79.20303, true, 138, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (244, NULL, 'A', 'N139', NULL, -4.03607, -79.20321, true, 139, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (245, NULL, 'A', 'N140', NULL, -4.03611, -79.20329, true, 140, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (246, NULL, 'A', 'N141', NULL, -4.03582, -79.20332, true, 141, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (247, NULL, 'A', 'N142', NULL, -4.03588, -79.2033, true, 142, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (255, NULL, 'A', 'N150', NULL, -4.03669, -79.20429, true, 150, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (260, NULL, 'A', 'N154', NULL, -4.03536, -79.2048, true, 154, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (257, NULL, 'A', 'N151', NULL, -4.0368, -79.20499, true, 151, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (258, NULL, 'A', 'N152', NULL, -4.03557, -79.20425, true, 152, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (259, NULL, 'A', 'N153', NULL, -4.03554, -79.20383, true, 153, 4);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (216, NULL, 'A', 'N113', NULL, -4.03652, -79.20282, true, 113, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (1, 2, 'A', 'A2', 'LABORATORIOS CARRERA DE INGENIERÍA EN SISTEMAS', -4.03006, -79.19958, false, NULL, 2);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (208, NULL, 'A', 'N105', 'PUERTA 1', -4.03291, -79.20229, true, 105, 1);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (217, NULL, 'A', 'N114', NULL, -4.03634, -79.20264, true, 114, 3);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (215, NULL, 'A', 'N112', NULL, -4.0373, -79.20385, true, 112, 5);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (10, 17, 'A', 'A17', 'LABORATORIO INFOCENTRO', -4.03259, -79.2006, false, NULL, 7);
INSERT INTO public.bloques (id, numero, zona, codigo, descripcion, latitud, altitud, is_auxiliar, numero_auxiliar, facultad_id) VALUES (271, NULL, 'A', 'N155', NULL, -4.03331, -79.20144, true, 155, 4);


--
-- TOC entry 4523 (class 0 OID 17453)
-- Dependencies: 239
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2023-08-05 20:53:16.526698+00', '27', '[A117 - A118]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2023-08-05 20:55:32.078197+00', '26', '[A118 - A117]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2023-08-05 21:03:43.407944+00', '28', '[A118 - A117]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2023-08-06 01:02:15.923172+00', '1', '[A2 - A3]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2023-08-06 01:03:03.9165+00', '21', '[N59 - N58]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2023-08-06 01:03:33.416602+00', '20', '[N58 - N57]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2023-08-06 01:07:59.873512+00', '32', '[A108 - A103]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2023-08-06 01:08:14.26604+00', '2', '[A3 - A4]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2023-08-06 01:08:27.93563+00', '18', '[N56 - N39]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2023-08-06 01:08:41.747109+00', '4', '[N49 - N50]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2023-08-06 01:08:56.195591+00', '33', '[A108 - A104]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2023-08-06 01:09:09.853585+00', '16', '[A7 - A4]', 3, '', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2023-08-06 01:09:36.646657+00', '35', '[A103 - A100]', 3, '', 10, 1);


--
-- TOC entry 4509 (class 0 OID 17346)
-- Dependencies: 225
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'Mapeo', 'bloque');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'Mapeo', 'facultad');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'Mapeo', 'nodo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'Mapeo', 'ruta');


--
-- TOC entry 4499 (class 0 OID 17276)
-- Dependencies: 215
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'Mapeo', '0001_initial', '2023-08-01 02:57:28.181612+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0001_initial', '2023-08-01 02:57:29.678842+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2023-08-01 02:57:30.946043+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0001_initial', '2023-08-01 02:57:34.0946+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0002_logentry_remove_auto_add', '2023-08-01 02:57:35.106769+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-01 02:57:35.605735+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2023-08-01 02:57:36.353333+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2023-08-01 02:57:36.973709+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0003_alter_user_email_max_length', '2023-08-01 02:57:37.593834+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0004_alter_user_username_opts', '2023-08-01 02:57:38.09012+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0005_alter_user_last_login_null', '2023-08-01 02:57:38.708981+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0006_require_contenttypes_0002', '2023-08-01 02:57:39.200343+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2023-08-01 02:57:39.697205+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0008_alter_user_username_max_length', '2023-08-01 02:57:40.344896+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2023-08-01 02:57:40.972029+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0010_alter_group_name_max_length', '2023-08-01 02:57:41.594498+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0011_update_proxy_permissions', '2023-08-01 02:57:42.103743+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'auth', '0012_alter_user_first_name_max_length', '2023-08-01 02:57:42.723574+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2023-08-01 02:57:43.344703+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'Mapeo', '0002_auto_20230804_1156', '2023-08-04 16:57:42.7663+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'Mapeo', '0003_auto_20230819_1521', '2023-08-19 20:22:07.058954+00');


--
-- TOC entry 4524 (class 0 OID 17483)
-- Dependencies: 240
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('mni7itc5shku5nzn0enycynxpte6xs2r', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qVyl9:9BjPpF6AMJwJUipFVYUZEHko9bQ_zQJGEwI1zVOMuz8', '2023-08-29 18:27:15.7553+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('0r3kw48b5is833dr3f5lawj2t91kse27', '.eJztjEsOwiAURbdiGJOmhZaiQ-euwDbkAa8fPxCBjox7t01qogtw1tzZvefcJ1EwpUFNEYMaLTmQgtDvToO5olsGewHX-8x4l8KoswXJ1jVmJ2_xdlzZn4MB4jDbe2HqrtKFqFmdc6HnWOTYgez2ZVUJKY1mUndcMstKURjgnCGUUuRG5iiX0zvGCD3G-e58bohSl-jdp20IzSmraEOON_-YcBewH2MKYP3O-BDQJLijSzPY0s3e7M3-q92S1xvTRYZ8:1qRym2:mPh6MbMAD_uitFVCqTP1ZMEHHHgCl-sD_6-nRFqSJLY', '2023-08-18 17:39:38.543091+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('tzxpo4ynccn2flse6qt4r27ablbsa6ta', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qW5se:v8bHMFE482tZetn_lOgCM2RoeDrphRWMO4qohijsNiU', '2023-08-30 02:03:28.96292+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('7o708q8nprwihhyf2045pe3vsi52n1s9', '.eJxVjMsOwiAQRf-FtSEMA1hcuu83kOkMlaqBpI-V8d-1SRe6veec-1KJtrWkbclzmkRdVFCn320gfuS6A7lTvTXNra7zNOhd0QdddN8kP6-H-3dQaCnf2oYhUPYeOggMgOiFDWaKNjr2zgGIQzQyIrFA9JbNGM4SHQTsPIt6fwDCKDcF:1qVNkX:9CojDDkJ-sBMJhCkPABSlj9HeOuy0opmiV9gW0r7S74', '2023-08-28 02:56:09.25976+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('bukh2k3b47sehaf6vevx0tb1gck9lsyn', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qcFc0:MPlVRIKz-Us4lhUAx6nlCD0pb625v4aXsRachdMwV8M', '2023-09-16 01:39:44.377758+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('peoi6bja9sbcmcal4iqovklfr1jgc1z2', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qcrzo:9Mje3-s3h2qaIkv7yXrtsIcz2SAIJTri4B8lNLoEw_4', '2023-09-17 18:38:52.895287+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('sby4ti31oytsp0w01vsgqroekbokzk9g', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qdESz:vWN0M9lDSqdLAKTHwPy13GNvowHnmi-i6h1GkSq3DB0', '2023-09-18 18:38:29.082915+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('unue715qo4okhji41ynshcdslkrqmc5s', '.eJxVjMsOwiAQRf-FtSEMA1hcuu83kOkMlaqBpI-V8d-1SRe6veec-1KJtrWkbclzmkRdVFCn320gfuS6A7lTvTXNra7zNOhd0QdddN8kP6-H-3dQaCnf2oYhUPYeOggMgOiFDWaKNjr2zgGIQzQyIrFA9JbNGM4SHQTsPIt6fwDCKDcF:1qW8O8:ZiGfoFCCCCXSwB4tlImSP4RdTSJQZAxqqenpO8s0D6U', '2023-08-30 04:44:08.544754+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ruvb8x5xr97e8zrix7re8kohagb8mp65', '.eJxVjMsOwiAQRf-FtSEMA1hcuu83kOkMlaqBpI-V8d-1SRe6veec-1KJtrWkbclzmkRdVFCn320gfuS6A7lTvTXNra7zNOhd0QdddN8kP6-H-3dQaCnf2oYhUPYeOggMgOiFDWaKNjr2zgGIQzQyIrFA9JbNGM4SHQTsPIt6fwDCKDcF:1qW90r:qbATCqE-ou7mF8kYLbBNqIJizrHAjoLhmrjDusT5B5k', '2023-08-30 05:24:09.613189+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ofl1hh1jpbh44yk09n7139wnkkbma452', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qRghT:bubpqHw8jvtndwpbb-CcUsV1WSu_HG0kjyW1iybyUEc', '2023-08-17 22:21:43.594896+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('e9x5rwuqgigjxztf6827sshh2ms30l6z', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qXSTU:KU33TQLNEMecSGPXNmOpoCrI5NdgB81APeuqzmyEw_k', '2023-09-02 20:23:08.528104+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('fap7kluwrrbkkgbtr0xb0z5vh7gflmk8', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qYtVQ:jaycsA2JMfbnCndVUcHliQQXfNLUnKQlXgCBki2Xjbs', '2023-09-06 19:27:04.606722+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('3tojacgpj13zp8x9rozwd7c7mkwxjnpi', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qVRbY:RcMuQnQDMOr487ybME6SxLILRmMyRane3TyBZoRIsW8', '2023-08-28 07:03:08.10258+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('uge6gndrqt7l3y18kdun32cyh0lch9vw', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qZjU3:71DsIsLK_ACWA-K5pDkpXwku7krl7CuNnv_H26diAsM', '2023-09-09 02:57:07.043585+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('79dwdiolabric8lkxmljl4bf35xib0ly', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qVYRQ:nk54JwixP3n3hDnF7wvtBbvZ0bCzyK9AnPmB5VSYe8I', '2023-08-28 14:21:08.962051+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('sfj8j0rzvr0e4zivjmfmlvz5gfnonnaw', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qSPPx:TxddXL8yErmHwbsU_JTNkl74eDAl_GMmb6ok_XvNFLg', '2023-08-19 22:06:37.186251+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('gwa9pdxrzl7ps5b4o8jflqofnv08iaig', '.eJztjEsOwiAURbfSMCZNCy1Fh527AmvIA14_fiACHRn3bpvURJdgYu7s3nPugyiY06jmiEFNluxJSehnp8Fc0K2DPYMbfG68S2HS-Yrk2xrzg7d4bTf262CEOC72Tpimr3UpGtYUXOglFjn2IPtdVddCSqOZ1D2XzLJKlAY4ZwiVFIWRBcr19IYxwoBxuTseO6LUOXr3bjtCC8pq2pH26u8zZgGHKaYA1mfGh4AmwQ1dWsAT_ds_Zp_I8wVgj-yQ:1qRya0:2B8a82lI_InDB29CDoPy5iZpe-zHxx3VXiO0W-2Tkc8', '2023-08-18 17:27:12.333392+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('3cjocrcbt5zfk9kd8ou0uk2lzogibkv6', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qTXkK:j1bjAfT5OXgH7LX4vLCjlJWWda2E7m_-ceSrGHuDelA', '2023-08-23 01:12:20.805269+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('usorwwxepbmhv4onsxnrzdg18dy9kwz5', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qUuUC:jYSttV1fZAu5wULBIyzzf2TfA12wpxMJGxDTjhuXuHg', '2023-08-26 19:41:20.241435+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('763wm457stndglixubyeum2u59n7gnrb', '.eJzt0D1rwzAQBuC_IjQLY1kfjTt26FbIHgdzls5ftS04yVlK_3udkEJL59IOXt977-G4N17Dmvp6jUj14Pkjt1x8zRpwr7hcB36EpQuZC0uiocmulew-jdlL8Dg93bvfgB5iv20XtrGAxsiDtE5KpYx3uUIoi1I7o7WUXiuV-1aB87I0hctb--BLLa06GHdDZ4wROowbdzpVvK7HGJbPtOIiFzoXFT8GYi1cAgnmAtEwAptCZEgUCCPbDmVtoHmdgIaQVfwsdmzHduwnVpgNewa3Tgk8I-yGmAg83FR0CWZcEv4m8H9_80ePPvP3D02697o:1qVh7R:-65oFwFwh0PPjl12Ye_0YdLZYjFDAORIR22v2A3FCWA', '2023-08-28 23:37:05.983954+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('2795qvrupnfj746wm6w136578asdzr99', '.eJxVjMsOwiAQRf-FtSHDo2Vw6d5vIMNApWogKe3K-O_apAvd3nPOfYlA21rC1vMS5iTOwonT7xaJH7nuIN2p3prkVtdljnJX5EG7vLaUn5fD_Tso1Mu3JoUMWmnlBhpRe5tAjc5ajDYCZsqGLDDyBJCdQU6TGSIoil57dg7E-wO_Vzcw:1qbtAp:BkOAON8MgjK-4rmt7V-ktbz6KDZK08v7ENXojPhsFkM', '2023-09-15 01:42:11.848424+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('u0v4i544glr4ug8mwcom8zjm7lqdd33m', '.eJxVjDsOwjAQRO_iGln-e0NJnzNYa3uNA8iR4qRC3J1ESgGabt6bebOA21rD1mkJU2ZXJtnlt4uYntQOkB_Y7jNPc1uXKfJD4SftfJwzvW6n-3dQsdd9Pbjki43SeeWFdnFPJk0FoQzGWgeQooJYNKisjJMJtVaEBpxIIAjY5wvZFjeH:1qbvVd:jvWr93PfFIeDYj3aowMbAOpimdGrGzuPFrHl81Nsv-g', '2023-09-15 04:11:49.185889+00');


--
-- TOC entry 4503 (class 0 OID 17298)
-- Dependencies: 219
-- Data for Name: facultades; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (3, 'FARNR', 'Facultad Agropecuaria y de Recursos Naturales Renovables', 'facultades/FARNR600X400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (6, 'FSH', 'Facultad de la Salud Humana', 'facultades/FSH600x400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (4, 'FEAC', 'Facultad de la Educación, el Arte y la Comunicación', 'facultades/FEAC600x400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (2, 'FEIRNNR', 'Facultad de la Energía, las Industrias y los Recursos Naturales no Renovables', 'facultades/FEIRNNR600x400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (1, 'AC', 'Administración Central', 'facultades/ac600x400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (5, 'FJSA', 'Facultad Jurídica, Social y Administrativa', 'facultades/FJSA600x400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (8, 'UED', 'Unidad de Educación a Distancia', 'facultades/UED600X400.jpg');
INSERT INTO public.facultades (id, nombre, descripcion, imagen) VALUES (7, 'UBU', 'Unidad de Bienestar Universitario', 'facultades/UBU600X400.jpg');


--
-- TOC entry 4505 (class 0 OID 17307)
-- Dependencies: 221
-- Data for Name: nodos; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (2, 'A3', -4.03018, -79.19937, 2);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (31, 'N15', -4.03456, -79.203747, 31);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (3, 'A4', -4.0304, -79.19942, 3);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (4, 'A7', -4.03074, -79.19956, 4);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (5, 'A8', -4.03098, -79.19963, 5);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (7, 'A13', -4.03196, -79.19996, 7);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (8, 'A15', -4.03226, -79.20005, 8);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (9, 'A16', -4.03245, -79.20011, 9);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (11, 'A19', -4.033073, -79.199981, 11);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (12, 'A20', -4.033316, -79.199922, 12);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (13, 'A21', -4.0337353, -79.1997873, 13);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (6, 'A10', -4.03138, -79.19976, 6);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (18, 'N2', -4.033454, -79.202454, 18);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (19, 'N3', -4.033854, -79.203399, 19);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (21, 'N5', -4.0336, -79.20343, 21);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (22, 'N6', -4.03378, -79.20361, 22);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (23, 'N7', -4.034134, -79.203399, 23);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (24, 'N8', -4.034303, -79.203402, 24);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (25, 'N9', -4.03434, -79.20383, 25);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (26, 'N10', -4.03447, -79.20413, 26);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (27, 'N11', -4.03452, -79.20411, 27);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (28, 'N12', -4.03454, -79.20417, 28);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (29, 'N13', -4.03397, -79.20378, 29);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (30, 'N14', -4.034208, -79.203921, 30);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (32, 'N16', -4.03463, -79.20393, 32);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (33, 'N17', -4.03473, -79.20398, 33);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (34, 'N18', -4.034798, -79.204094, 34);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (35, 'N19', -4.034886, -79.204046, 35);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (36, 'N20', -4.034628, -79.204299, 36);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (37, 'N21', -4.03484, -79.20419, 37);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (38, 'N22', -4.03497, -79.204489, 38);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (39, 'N23', -4.03516, -79.204393, 39);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (40, 'N24', -4.035027, -79.204136, 40);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (41, 'N25', -4.035241, -79.204077, 41);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (42, 'N26', -4.03532, -79.20431, 42);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (43, 'N27', -4.03545, -79.20464, 43);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (44, 'N28', -4.03558, -79.20443, 44);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (47, 'N31', -4.03654, -79.20551, 47);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (48, 'N32', -4.036421, -79.205339, 48);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (50, 'N34', -4.03453, -79.20337, 50);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (51, 'N35', -4.03429, -79.20213, 51);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (52, 'N36', -4.03388, -79.20185, 52);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (57, 'N39', -4.0328, -79.19997, 57);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (59, 'N41', -4.0369, -79.2062, 59);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (60, 'N42', -4.03671, -79.20535, 60);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (61, 'N43', -4.0372, -79.2048, 61);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (64, 'N46', -4.0366, -79.203, 64);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (68, 'N50', -4.03244, -79.20013, 68);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (69, 'N51', -4.03224, -79.2001, 69);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (70, 'N52', -4.03194, -79.20003, 70);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (71, 'N53', -4.03134, -79.19984, 71);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (72, 'N54', -4.03094, -79.19971, 72);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (73, 'N55', -4.0307, -79.19962, 73);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (74, 'N56', -4.03306, -79.19992, 74);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (75, 'N57', -4.03314, -79.19991, 75);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (76, 'N58', -4.0333, -79.19989, 76);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (77, 'N59', -4.03344, -79.19986, 77);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (78, 'N60', -4.03339, -79.19957, 78);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (79, 'N61', -4.03338, -79.19942, 79);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (80, 'N62', -4.03342, -79.20126, 80);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (81, 'N63', -4.03353, -79.20146, 81);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (82, 'N64', -4.03365, -79.20375, 82);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (83, 'N65', -4.03432, -79.20426, 83);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (84, 'A22', -4.03294, -79.19984, 84);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (85, 'A23', -4.03294, -79.19968, 85);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (86, 'A24', -4.03313, -79.19979, 86);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (87, 'A25', -4.03312, -79.19943, 87);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (88, 'A26', -4.03334, -79.19957, 88);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (89, 'A27', -4.0335547, -79.1997803, 89);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (90, 'A28', -4.033445, -79.1995469, 90);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (91, 'A29', -4.033644, -79.1994115, 91);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (92, 'N66', -4.03697, -79.20598, 92);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (93, 'A30', -4.0343145, -79.1996465, 93);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (94, 'N67', -4.03669, -79.20647, 94);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (95, 'N68', -4.03663, -79.20663, 95);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (96, 'A34', -4.0332, -79.2022, 96);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (97, 'N69', -4.03689, -79.20519, 97);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (98, 'A35', -4.03349, -79.2022, 98);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (99, 'N70', -4.03711, -79.20491, 99);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (100, 'N71', -4.03724, -79.20468, 100);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (101, 'A36', -4.03345, -79.20147, 101);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (103, 'N72', -4.0373, -79.20458, 103);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (104, 'A38', -4.034231, -79.202039, 104);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (105, 'N73', -4.03734, -79.20445, 105);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (107, 'N74', -4.03741, -79.20421, 107);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (108, 'A40', -4.03366, -79.2029, 108);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (109, 'N75', -4.03759, -79.20384, 109);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (110, 'A41', -4.03356, -79.2029, 110);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (111, 'N76', -4.03681, -79.20483, 111);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (112, 'N77', -4.03607, -79.20509, 112);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (113, 'N78', -4.03646, -79.20541, 113);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (114, 'N79', -4.03662, -79.20509, 114);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (115, 'N80', -4.03627, -79.20547, 115);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (116, 'N81', -4.03624, -79.2048, 116);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (117, 'A42', -4.03438, -79.20402, 117);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (118, 'N82', -4.03631, -79.20465, 118);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (119, 'A45', -4.03456, -79.20404, 119);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (123, 'N85', -4.03605, -79.20345, 123);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (124, 'A47', -4.03436, -79.20357, 124);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (125, 'N86', -4.03577, -79.2036, 125);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (126, 'N87', -4.03558, -79.20369, 126);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (127, 'N88', -4.03523, -79.20207, 127);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (128, 'A48', -4.03466, -79.20351, 128);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (129, 'A49', -4.03455, -79.20343, 129);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (130, 'A51', -4.03537, -79.20382, 130);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (131, 'N89', -4.03565, -79.20211, 131);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (133, 'N90', -4.03401, -79.20204, 133);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (134, 'N91', -4.03385, -79.20159, 134);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (135, 'N92', -4.03361, -79.2029, 135);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (136, 'A53', -4.034886, -79.204282, 136);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (138, 'A54', -4.035106, -79.204201, 138);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (139, 'N94', -4.03352, -79.19986, 139);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (140, 'N95', -4.03344, -79.19965, 140);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (54, 'N38', -4.03282, -79.20148, 54);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (20, 'N4', -4.03341, -79.20344, 20);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (53, 'N37', -4.0339, -79.201, 53);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (106, 'A39', -4.03493, -79.20062, 106);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (102, 'A37', -4.03378, -79.20156, 102);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (17, 'N1', -4.03288, -79.20249, 17);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (137, 'N93', -4.0327, -79.20179, 137);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (132, 'A52', -4.034773, -79.204374, 132);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (10, 'A17', -4.03259, -79.2006, 10);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (49, 'N33', -4.03532, -79.20487, 49);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (45, 'N29', -4.03595, -79.2053, 45);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (46, 'N30', -4.03642, -79.20559, 46);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (67, 'N49', -4.0327, -79.20017, 67);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (58, 'N40', -4.03272, -79.20062, 58);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (65, 'N47', -4.03653, -79.20415, 65);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (120, 'N83', -4.03667, -79.2034, 120);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (122, 'N84', -4.03663, -79.20311, 122);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (66, 'N48', -4.03598, -79.20234, 66);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (63, 'N45', -4.03696, -79.20395, 63);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (62, 'N44', -4.03744, -79.20394, 62);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (141, 'N96', -4.03365, -79.19977, 141);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (142, 'N97', -4.03387, -79.19972, 142);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (143, 'A55', -4.035251, -79.204131, 143);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (144, 'N98', -4.0343, -79.19968, 144);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (145, 'A57', -4.03509, -79.204645, 145);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (146, 'A58', -4.035382, -79.204536, 146);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (148, 'A61', -4.035223, -79.203381, 148);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (149, 'A62', -4.03547, -79.20358, 149);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (150, 'A63', -4.035557, -79.2033, 150);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (151, 'A64', -4.03563, -79.20326, 151);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (152, 'A65', -4.03542, -79.20325, 152);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (153, 'A66', -4.03546, -79.2031, 153);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (154, 'A67', -4.03516, -79.202843, 154);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (155, 'A68', -4.03521, -79.20272, 155);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (156, 'A69', -4.03536, -79.20283, 156);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (157, 'A70', -4.03536, -79.20273, 157);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (158, 'A71', -4.0354379, -79.20278, 158);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (159, 'A73', -4.03584, -79.20335, 159);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (160, 'A74', -4.03591, -79.20309, 160);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (161, 'A75', -4.03608, -79.20332, 161);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (167, 'A81', -4.03633, -79.20292, 167);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (168, 'A83', -4.03591, -79.2027, 168);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (169, 'A84', -4.03577, -79.20395, 169);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (170, 'A85', -4.03593, -79.20382, 170);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (171, 'A86', -4.03615, -79.2036, 171);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (172, 'A87', -4.03558, -79.20488, 172);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (173, 'A88', -4.0359, -79.20489, 173);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (174, 'A89', -4.03571, -79.20458, 174);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (175, 'A90', -4.03602, -79.20473, 175);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (176, 'A91', -4.03606, -79.2043, 176);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (177, 'A92', -4.03614, -79.20446, 177);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (179, 'A95', -4.03623, -79.20534, 179);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (180, 'A96', -4.03615, -79.20511, 180);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (181, 'A98', -4.03641, -79.20514, 181);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (182, 'A99', -4.03669, -79.20521, 182);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (183, 'A100', -4.03658, -79.20492, 183);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (184, 'A103', -4.036982, -79.204637, 184);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (185, 'A104', -4.037061, -79.2044567, 185);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (186, 'A105', -4.037131, -79.204293, 186);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (187, 'A106', -4.03666, -79.2067, 187);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (188, 'A107', -4.03675, -79.2067, 188);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (189, 'A108', -4.0368, -79.2065, 189);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (190, 'A109', -4.03678, -79.2057, 190);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (191, 'A110', -4.03658, -79.2056, 191);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (192, 'A111', -4.03724, -79.20496, 192);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (193, 'A112', -4.0373771, -79.2047296, 193);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (194, 'A113', -4.0374814, -79.2045137, 194);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (195, 'A114', -4.03744, -79.2049, 195);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (196, 'A115', -4.03768, -79.2047, 196);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (197, 'A116', -4.03767, -79.2038, 197);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (198, 'A117', -4.037554, -79.203665, 198);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (199, 'A118', -4.03768, -79.2036, 199);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (201, 'N99', -4.03293, -79.19995, 201);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (202, 'N100', -4.03301, -79.19978, 202);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (203, 'N101', -4.033, -79.19968, 203);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (204, 'N102', -4.03299, -79.19945, 204);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (206, 'N103', -4.03282, -79.20221, 206);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (207, 'N104', -4.03269, -79.20222, 207);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (209, 'N106', -4.03319, -79.20225, 209);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (210, 'N107', -4.03348, -79.20223, 210);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (211, 'N108', -4.03382, -79.20172, 211);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (212, 'N109', -4.03306, -79.20285, 212);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (213, 'N110', -4.03665, -79.20572, 213);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (214, 'N111', -4.03708, -79.20389, 214);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (218, 'N115', -4.03591, -79.20456, 218);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (219, 'N116', -4.03583, -79.20434, 219);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (220, 'N117', -4.03601, -79.20419, 220);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (221, 'N118', -4.03448, -79.2035, 221);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (222, 'N119', -4.03456, -79.20368, 222);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (223, 'N120', -4.03522, -79.20364, 223);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (224, 'N121', -4.03492, -79.20346, 224);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (225, 'N122', -4.03483, -79.20331, 225);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (226, 'N123', -4.0328, -79.20017, 226);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (227, 'N124', -4.03482, -79.2021, 227);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (166, 'A80', -4.03589, -79.20301, 166);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (163, 'A77', -4.03602, -79.20316, 163);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (162, 'A76', -4.03616, -79.20316, 162);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (165, 'A79', -4.03623, -79.20303, 165);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (164, 'A78', -4.03628, -79.2031, 164);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (247, 'N142', -4.03588, -79.2033, 247);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (205, 'A0', -4.032785, -79.202424, 205);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (230, 'N125', -4.03482, -79.20231, 230);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (231, 'N126', -4.03515, -79.20227, 231);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (232, 'N127', -4.03531, -79.20274, 232);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (233, 'N128', -4.03538, -79.2029, 233);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (234, 'N129', -4.03519, -79.20298, 234);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (235, 'N130', -4.03536, -79.2031, 235);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (236, 'N131', -4.03528, -79.20334, 236);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (237, 'N132', -4.03586, -79.20295, 237);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (238, 'N133', -4.03598, -79.2029, 238);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (239, 'N134', -4.03567, -79.20289, 239);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (240, 'N135', -4.03561, -79.20242, 240);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (241, 'N136', -4.03614, -79.20268, 241);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (242, 'N137', -4.03597, -79.20307, 242);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (243, 'N138', -4.03609, -79.20303, 243);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (244, 'N139', -4.03607, -79.20321, 244);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (245, 'N140', -4.03611, -79.20329, 245);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (246, 'N141', -4.03582, -79.20332, 246);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (248, 'N143', -4.03593, -79.20343, 248);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (249, 'N144', -4.03566, -79.20339, 249);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (250, 'N145', -4.03615, -79.2034, 250);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (251, 'N146', -4.0355, -79.20295, 251);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (252, 'N147', -4.03638, -79.20328, 252);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (253, 'N148', -4.03553, -79.20222, 253);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (254, 'N149', -4.03685, -79.20443, 254);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (255, 'N150', -4.03669, -79.20429, 255);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (257, 'N151', -4.0368, -79.20499, 257);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (258, 'N152', -4.03557, -79.20425, 258);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (259, 'N153', -4.03554, -79.20383, 259);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (260, 'N154', -4.03536, -79.2048, 260);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (147, 'A60', -4.03524, -79.20314, 147);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (216, 'N113', -4.03652, -79.20282, 216);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (1, 'A2', -4.03006, -79.19958, 1);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (121, 'A46', -4.03461, -79.2038, 121);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (178, 'A94', -4.0363, -79.20423, 178);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (208, 'N105', -4.03291, -79.20229, 208);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (217, 'N114', -4.03634, -79.20264, 217);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (215, 'N112', -4.0373, -79.20385, 215);
INSERT INTO public.nodos (id, codigo, latitud, altitud, bloque_id) VALUES (263, 'N155', -4.03331, -79.20144, 271);


--
-- TOC entry 4507 (class 0 OID 17316)
-- Dependencies: 223
-- Data for Name: rutas; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (177, 80.97, 72.87, 54, 206);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (178, 80.97, 72.87, 206, 54);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (179, 145.32, 130.79, 226, 54);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (180, 145.32, 130.79, 54, 226);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (181, 71.04, 63.94, 80, 54);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (182, 71.04, 63.94, 54, 80);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (183, 23.53, 21.18, 101, 80);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (184, 23.53, 21.18, 80, 101);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (185, 60.65, 54.59, 53, 80);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (186, 60.65, 54.59, 80, 53);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (191, 122.04, 109.84, 106, 53);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (192, 122.04, 109.84, 53, 106);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (193, 8.96, 8.06, 81, 101);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (194, 8.96, 8.06, 101, 81);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (197, 29.93, 26.94, 102, 81);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (198, 29.93, 26.94, 81, 102);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (199, 8.47, 7.62, 134, 102);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (200, 8.47, 7.62, 102, 134);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (139, 14.62, 13.16, 10, 58);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (144, 11.12, 10.01, 67, 226);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (147, 24.97, 22.47, 205, 207);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (152, 26.84, 24.16, 1, 2);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (146, 47.71, 42.94, 137, 207);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (172, 12.85, 11.57, 205, 17);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (140, 14.62, 13.16, 58, 10);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (175, 24.05, 21.65, 206, 205);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (148, 24.97, 22.47, 207, 205);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (173, 20.35, 18.32, 208, 205);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (171, 12.85, 11.57, 17, 205);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (176, 24.05, 21.65, 205, 206);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (174, 20.35, 18.32, 205, 208);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (137, 49.96, 44.96, 58, 67);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (151, 26.84, 24.16, 2, 1);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (141, 129.8, 116.82, 137, 58);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (142, 129.8, 116.82, 58, 137);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (143, 11.12, 10.01, 226, 67);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (75, 24.81, 22.33, 57, 67);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (76, 24.81, 22.33, 67, 57);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (73, 29.25, 26.33, 67, 68);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (74, 29.25, 26.33, 68, 67);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (138, 49.96, 44.96, 67, 58);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (103, 23.29, 20.96, 140, 77);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (104, 23.29, 20.96, 77, 140);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (125, 39.77, 35.79, 91, 141);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (126, 39.77, 35.79, 141, 91);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (71, 2.48, 2.23, 9, 68);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (72, 2.48, 2.23, 68, 9);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (93, 13.36, 12.02, 86, 75);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (94, 13.36, 12.02, 75, 86);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (111, 16.68, 15.01, 79, 78);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (79, 12.25, 11.03, 84, 201);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (80, 12.25, 11.03, 201, 84);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (112, 16.68, 15.01, 78, 79);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (89, 11.15, 10.04, 203, 202);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (90, 11.15, 10.04, 202, 203);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (116, 25.54, 22.99, 204, 203);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (115, 25.54, 22.99, 203, 204);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (83, 6.92, 6.23, 11, 74);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (84, 6.92, 6.23, 74, 11);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (134, 4.05, 3.65, 144, 93);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (133, 4.05, 3.65, 93, 144);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (97, 3.97, 3.57, 12, 76);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (98, 3.97, 3.57, 76, 12);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (67, 5.98, 5.38, 8, 69);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (68, 5.98, 5.38, 69, 8);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (119, 9.65, 8.69, 89, 139);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (120, 9.65, 8.69, 139, 89);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (87, 16.49, 14.84, 202, 74);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (110, 5.56, 5, 78, 88);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (88, 16.49, 14.84, 74, 202);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (109, 5.56, 5, 88, 78);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (105, 10.47, 9.42, 78, 140);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (106, 10.47, 9.42, 140, 78);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (107, 6.63, 5.97, 90, 78);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (108, 6.63, 5.97, 78, 90);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (91, 6.67, 6, 85, 203);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (92, 6.67, 6, 203, 85);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (157, 8, 7.2, 4, 73);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (158, 8, 7.2, 73, 4);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (170, 8.08, 7.27, 70, 7);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (169, 8.08, 7.27, 7, 70);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (101, 8.9, 8.01, 139, 77);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (102, 8.9, 8.01, 77, 139);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (85, 8.96, 8.06, 75, 74);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (86, 8.96, 8.06, 74, 75);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (123, 9.68, 8.71, 13, 141);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (124, 9.68, 8.71, 141, 13);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (162, 9.93, 8.94, 72, 5);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (165, 9.93, 8.94, 6, 71);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (166, 9.93, 8.94, 71, 6);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (161, 9.93, 8.94, 5, 72);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (117, 14.62, 13.16, 87, 204);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (82, 14.83, 13.35, 201, 74);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (121, 17.57, 15.81, 141, 139);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (122, 17.57, 15.81, 139, 141);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (81, 14.83, 13.35, 74, 201);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (78, 14.62, 13.16, 57, 201);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (77, 14.62, 13.16, 201, 57);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (118, 14.62, 13.16, 204, 87);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (100, 15.92, 14.33, 76, 77);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (99, 15.92, 14.33, 77, 76);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (96, 17.93, 16.14, 75, 76);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (95, 17.93, 16.14, 76, 75);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (70, 22.49, 20.24, 69, 68);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (69, 22.49, 20.24, 68, 69);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (129, 25.08, 22.57, 142, 141);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (130, 25.08, 22.57, 141, 142);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (153, 25.08, 22.57, 3, 2);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (154, 25.08, 22.57, 2, 3);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (159, 28.49, 25.64, 72, 73);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (160, 28.49, 25.64, 73, 72);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (113, 28.93, 26.04, 87, 79);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (114, 28.93, 26.04, 79, 87);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (127, 29.37, 26.43, 91, 79);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (128, 29.37, 26.43, 79, 91);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (65, 34.25, 30.83, 69, 70);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (66, 34.25, 30.83, 70, 69);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (156, 40.06, 36.05, 3, 73);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (155, 40.06, 36.05, 73, 3);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (163, 46.76, 42.08, 71, 72);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (164, 46.76, 42.08, 72, 71);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (131, 48.02, 43.22, 144, 142);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (132, 48.02, 43.22, 142, 144);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (168, 69.97, 62.97, 71, 70);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (167, 69.97, 62.97, 70, 71);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (201, 14.8, 13.32, 211, 134);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (202, 14.8, 13.32, 134, 211);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (203, 15.89, 14.3, 52, 211);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (204, 15.89, 14.3, 211, 52);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (205, 25.56, 23, 133, 52);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (206, 25.56, 23, 52, 133);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (207, 24.57, 22.11, 104, 133);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (208, 24.57, 22.11, 133, 104);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (209, 12.04, 10.84, 51, 104);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (210, 12.04, 10.84, 104, 51);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (211, 90.75, 81.68, 210, 51);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (212, 90.75, 81.68, 51, 210);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (213, 3.51, 3.16, 98, 210);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (214, 3.51, 3.16, 210, 98);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (215, 25.01, 22.51, 18, 210);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (216, 25.01, 22.51, 210, 18);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (217, 32.32, 29.09, 209, 210);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (218, 32.32, 29.09, 210, 209);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (219, 5.66, 5.09, 96, 209);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (220, 5.66, 5.09, 209, 96);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (229, 65.68, 59.11, 53, 134);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (230, 65.68, 59.11, 134, 53);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (317, 9.15, 8.24, 160, 166);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (318, 9.15, 8.24, 166, 160);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (319, 7.03, 6.33, 242, 160);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (320, 7.03, 6.33, 160, 242);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (321, 11.43, 10.29, 163, 242);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (322, 11.43, 10.29, 242, 163);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (145, 47.71, 42.94, 207, 137);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (233, 52.42, 47.18, 135, 18);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (234, 52.42, 47.18, 18, 135);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (235, 152.73, 137.46, 230, 18);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (236, 152.73, 137.46, 18, 230);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (237, 36.96, 33.26, 231, 230);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (238, 36.96, 33.26, 230, 231);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (239, 23.29, 20.96, 227, 230);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (240, 23.29, 20.96, 230, 227);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (241, 110.92, 99.83, 225, 230);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (242, 110.92, 99.83, 230, 225);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (243, 59.03, 53.13, 51, 227);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (244, 59.03, 53.13, 227, 51);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (245, 45.71, 41.14, 127, 227);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (246, 45.71, 41.14, 227, 127);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (247, 46.91, 42.22, 131, 127);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (248, 46.91, 42.22, 127, 131);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (251, 18.08, 16.27, 253, 131);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (252, 18.08, 16.27, 131, 253);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (253, 34.67, 31.2, 240, 131);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (254, 34.67, 31.2, 131, 240);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (255, 23.9, 21.51, 240, 253);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (256, 23.9, 21.51, 253, 240);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (257, 42.62, 38.36, 231, 253);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (258, 42.62, 38.36, 253, 231);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (259, 55.08, 49.57, 232, 231);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (260, 55.08, 49.57, 231, 232);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (261, 5.67, 5.1, 157, 232);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (262, 5.67, 5.1, 232, 157);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (263, 11.43, 10.29, 156, 232);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (264, 11.43, 10.29, 232, 156);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (265, 10.29, 9.26, 158, 156);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (266, 10.29, 9.26, 156, 158);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (267, 22.29, 20.06, 154, 156);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (268, 22.29, 20.06, 156, 154);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (269, 20.67, 18.6, 155, 156);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (270, 20.67, 18.6, 156, 155);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (271, 14.73, 13.26, 154, 155);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (272, 14.73, 13.26, 155, 154);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (273, 8.08, 7.27, 233, 156);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (274, 8.08, 7.27, 156, 233);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (275, 14.45, 13.01, 251, 233);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (276, 14.45, 13.01, 233, 251);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (277, 23.9, 21.51, 153, 233);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (278, 23.9, 21.51, 233, 153);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (279, 22.91, 20.62, 234, 233);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (280, 22.91, 20.62, 233, 234);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (287, 17.93, 16.14, 152, 235);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (288, 17.93, 16.14, 235, 152);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (289, 7.8, 7.02, 148, 236);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (290, 7.8, 7.02, 236, 148);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (291, 31.12, 28.01, 150, 236);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (292, 31.12, 28.01, 236, 150);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (293, 9.25, 8.33, 151, 150);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (294, 9.25, 8.33, 150, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (295, 14.8, 13.32, 249, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (296, 14.8, 13.32, 151, 249);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (297, 36.4, 32.76, 160, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (298, 36.4, 32.76, 151, 160);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (299, 41.28, 37.15, 239, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (300, 41.28, 37.15, 151, 239);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (301, 22.15, 19.94, 237, 239);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (302, 22.15, 19.94, 239, 237);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (303, 20.04, 18.04, 251, 239);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (304, 20.04, 18.04, 239, 251);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (305, 52.56, 47.3, 240, 239);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (306, 52.56, 47.3, 239, 240);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (307, 34, 30.6, 168, 239);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (308, 34, 30.6, 239, 168);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (309, 7.44, 6.7, 166, 237);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (310, 7.44, 6.7, 237, 166);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (311, 14.45, 13.01, 238, 237);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (312, 14.45, 13.01, 237, 238);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (313, 23.51, 21.16, 168, 238);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (314, 23.51, 21.16, 238, 168);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (315, 30.2, 27.18, 241, 238);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (316, 30.2, 27.18, 238, 241);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (323, 14.06, 12.65, 243, 242);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (324, 14.06, 12.65, 242, 243);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (325, 16.39, 14.75, 162, 243);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (326, 16.39, 14.75, 243, 162);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (327, 22.51, 20.26, 164, 243);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (328, 22.51, 20.26, 243, 164);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (329, 15.57, 14.01, 165, 243);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (330, 15.57, 14.01, 243, 165);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (331, 29.34, 26.41, 167, 243);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (332, 29.34, 26.41, 243, 167);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (333, 33.99, 30.59, 241, 167);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (334, 33.99, 30.59, 167, 241);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (335, 9.55, 8.6, 165, 164);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (282, 18.6, 16.74, 234, 147);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (283, 22.63, 20.37, 236, 147);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (284, 22.63, 20.37, 147, 236);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (225, 22.43, 20.19, 17, 208);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (286, 14.06, 12.65, 147, 235);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (226, 22.43, 20.19, 208, 17);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (222, 31.45, 28.31, 209, 208);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (232, 44.67, 40.2, 17, 212);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (221, 31.45, 28.31, 208, 209);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (249, 44.69, 40.22, 66, 131);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (250, 44.69, 40.22, 131, 66);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (231, 44.67, 40.2, 212, 17);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (227, 63.95, 57.56, 18, 17);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (228, 63.95, 57.56, 17, 18);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (224, 13.38, 12.04, 208, 206);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (336, 9.55, 8.6, 164, 165);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (337, 14.91, 13.42, 162, 164);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (338, 14.91, 13.42, 164, 162);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (339, 22.85, 20.57, 252, 164);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (340, 22.85, 20.57, 164, 252);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (341, 11.44, 10.3, 244, 162);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (342, 11.44, 10.3, 162, 244);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (343, 9.93, 8.94, 245, 244);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (344, 9.93, 8.94, 244, 245);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (345, 23.37, 21.03, 247, 244);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (346, 23.37, 21.03, 244, 247);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (347, 4.71, 4.24, 161, 245);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (348, 4.71, 4.24, 245, 161);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (349, 12.99, 11.69, 250, 245);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (350, 12.99, 11.69, 245, 250);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (351, 15.45, 13.91, 248, 247);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (352, 15.45, 13.91, 247, 248);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (353, 7.03, 6.33, 246, 247);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (354, 7.03, 6.33, 247, 246);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (355, 13.53, 12.18, 123, 248);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (356, 13.53, 12.18, 248, 123);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (357, 4, 3.6, 159, 246);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (358, 4, 3.6, 246, 159);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (359, 19.41, 17.47, 249, 246);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (360, 19.41, 17.47, 246, 249);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (361, 26.31, 23.68, 125, 249);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (362, 26.31, 23.68, 249, 125);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (363, 34.44, 31, 126, 249);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (364, 34.44, 31, 249, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (365, 17.28, 15.55, 149, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (366, 17.28, 15.55, 126, 149);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (367, 40.41, 36.37, 223, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (368, 40.41, 36.37, 126, 223);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (369, 23.37, 21.03, 125, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (370, 23.37, 21.03, 126, 125);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (371, 35.3, 31.77, 123, 125);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (372, 35.3, 31.77, 125, 123);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (373, 20.01, 18.01, 171, 123);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (374, 20.01, 18.01, 123, 171);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (375, 12.43, 11.19, 250, 123);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (376, 12.43, 11.19, 123, 250);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (377, 28.83, 25.95, 252, 250);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (378, 28.83, 25.95, 250, 252);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (389, 19.42, 17.48, 224, 225);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (390, 19.42, 17.48, 225, 224);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (391, 38.88, 34.99, 223, 224);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (392, 38.88, 34.99, 224, 223);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (393, 22.18, 19.96, 57, 226);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (394, 22.18, 19.96, 226, 57);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (397, 8.45, 7.61, 95, 187);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (398, 8.45, 7.61, 187, 95);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (399, 15.44, 13.9, 188, 95);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (400, 15.44, 13.9, 95, 188);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (401, 18.96, 17.06, 94, 95);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (402, 18.96, 17.06, 95, 94);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (403, 12.68, 11.41, 189, 94);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (404, 12.68, 11.41, 94, 189);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (405, 37.98, 34.18, 59, 94);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (406, 37.98, 34.18, 94, 59);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (407, 25.61, 23.05, 92, 59);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (408, 25.61, 23.05, 59, 92);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (415, 10.93, 9.84, 191, 47);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (416, 10.93, 9.84, 47, 191);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (417, 14.22, 12.8, 113, 47);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (418, 14.22, 12.8, 47, 113);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (419, 25.93, 23.34, 60, 47);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (420, 25.93, 23.34, 47, 60);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (421, 15.42, 13.88, 213, 191);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (422, 15.42, 13.88, 191, 213);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (425, 14.62, 13.16, 190, 213);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (426, 14.62, 13.16, 213, 190);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (427, 26.75, 24.08, 97, 60);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (428, 26.75, 24.08, 60, 97);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (429, 39.53, 35.58, 99, 97);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (430, 39.53, 35.58, 97, 99);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (431, 15.48, 13.93, 192, 99);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (432, 15.48, 13.93, 99, 192);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (433, 15.78, 14.2, 61, 99);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (434, 15.78, 14.2, 99, 61);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (435, 28.9, 26.01, 195, 61);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (436, 28.9, 26.01, 61, 195);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (437, 30.24, 27.22, 184, 61);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (438, 30.24, 27.22, 61, 184);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (439, 14.03, 12.63, 100, 61);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (440, 14.03, 12.63, 61, 100);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (441, 16.21, 14.59, 193, 100);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (442, 16.21, 14.59, 100, 193);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (443, 31.77, 28.59, 185, 100);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (444, 31.77, 28.59, 100, 185);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (445, 12.94, 11.65, 103, 100);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (446, 12.94, 11.65, 100, 103);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (447, 44.3, 39.87, 196, 103);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (448, 44.3, 39.87, 103, 196);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (449, 36.97, 33.27, 186, 103);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (450, 36.97, 33.27, 103, 186);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (451, 15.09, 13.58, 105, 103);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (452, 15.09, 13.58, 103, 105);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (453, 17.24, 15.52, 194, 105);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (454, 17.24, 15.52, 105, 194);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (455, 27.74, 24.97, 107, 105);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (456, 27.74, 24.97, 105, 107);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (461, 9.94, 8.95, 197, 109);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (462, 9.94, 8.95, 109, 197);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (463, 28.44, 25.6, 199, 109);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (464, 28.44, 25.6, 109, 199);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (465, 19.82, 17.84, 198, 109);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (466, 19.82, 17.84, 109, 198);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (410, 74.91, 67.42, 92, 46);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (411, 16.02, 14.42, 47, 46);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (412, 16.02, 14.42, 46, 47);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (414, 61.37, 55.23, 46, 45);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (409, 74.91, 67.42, 46, 92);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (474, 52.71, 47.44, 63, 65);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (469, 24.86, 22.37, 214, 215);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (381, 12.65, 11.39, 64, 122);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (382, 12.65, 11.39, 122, 64);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (379, 33.59, 30.23, 122, 252);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (380, 33.59, 30.23, 252, 122);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (383, 21.86, 19.67, 216, 64);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (384, 21.86, 19.67, 64, 216);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (388, 52.05, 46.85, 217, 66);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (386, 28.27, 25.44, 216, 217);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (471, 14.91, 13.42, 63, 214);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (387, 52.05, 46.85, 66, 217);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (472, 14.91, 13.42, 214, 63);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (473, 52.71, 47.44, 65, 63);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (470, 24.86, 22.37, 215, 214);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (457, 30.13, 27.12, 62, 107);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (458, 30.13, 27.12, 107, 62);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (459, 20.03, 18.03, 109, 62);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (460, 20.03, 18.03, 62, 109);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (467, 18.49, 16.64, 215, 62);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (477, 18.37, 16.53, 116, 118);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (478, 18.37, 16.53, 118, 116);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (479, 37.31, 33.58, 112, 116);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (480, 37.31, 33.58, 116, 112);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (483, 22.15, 19.94, 115, 113);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (484, 22.15, 19.94, 113, 115);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (485, 8.99, 8.09, 48, 113);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (486, 8.99, 8.09, 113, 48);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (487, 33.86, 30.47, 182, 113);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (488, 33.86, 30.47, 113, 182);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (489, 15.09, 13.58, 179, 115);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (490, 15.09, 13.58, 115, 179);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (491, 27.02, 24.32, 180, 179);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (492, 27.02, 24.32, 179, 180);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (493, 9.17, 8.25, 112, 180);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (494, 9.17, 8.25, 180, 112);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (495, 29.1, 26.19, 181, 180);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (496, 29.1, 26.19, 180, 181);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (497, 22.11, 19.9, 48, 181);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (498, 22.11, 19.9, 181, 48);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (499, 15.42, 13.88, 114, 182);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (500, 15.42, 13.88, 182, 114);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (503, 19.37, 17.43, 183, 114);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (504, 19.37, 17.43, 114, 183);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (505, 27.45, 24.71, 111, 183);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (506, 27.45, 24.71, 183, 111);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (507, 28.71, 25.84, 184, 111);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (508, 28.71, 25.84, 111, 184);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (509, 21.84, 19.66, 185, 184);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (510, 21.84, 19.66, 184, 185);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (511, 19.76, 17.78, 186, 185);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (512, 19.76, 17.78, 185, 186);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (513, 23.65, 21.29, 254, 185);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (514, 23.65, 21.29, 185, 254);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (515, 23.61, 21.25, 255, 254);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (516, 23.61, 21.25, 254, 255);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (527, 93.54, 84.19, 82, 83);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (528, 93.54, 84.19, 83, 82);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (533, 29.15, 26.24, 173, 112);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (534, 29.15, 26.24, 112, 173);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (535, 22.2, 19.98, 175, 173);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (536, 22.2, 19.98, 173, 175);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (537, 40.36, 36.32, 174, 173);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (538, 40.36, 36.32, 173, 174);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (539, 29.67, 26.7, 43, 174);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (540, 29.67, 26.7, 174, 43);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (541, 30.29, 27.26, 172, 43);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (542, 30.29, 27.26, 43, 172);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (545, 27.41, 24.67, 44, 43);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (546, 27.41, 24.67, 43, 44);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (547, 13.79, 12.41, 146, 43);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (548, 13.79, 12.41, 43, 146);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (551, 22.04, 19.84, 174, 44);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (552, 22.04, 19.84, 44, 174);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (553, 29.54, 26.59, 219, 44);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (554, 29.54, 26.59, 44, 219);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (557, 25.97, 23.37, 218, 219);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (558, 25.97, 23.37, 219, 218);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (559, 22.48, 20.23, 175, 218);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (560, 22.48, 20.23, 218, 175);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (561, 27.88, 25.09, 177, 218);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (562, 27.88, 25.09, 218, 177);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (563, 43.77, 39.39, 169, 219);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (564, 43.77, 39.39, 219, 169);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (565, 25.96, 23.36, 176, 219);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (566, 25.96, 23.36, 219, 176);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (567, 13.41, 12.07, 220, 176);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (568, 13.41, 12.07, 176, 220);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (571, 41.99, 37.79, 170, 220);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (572, 41.99, 37.79, 220, 170);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (573, 30.2, 27.18, 125, 170);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (574, 30.2, 27.18, 170, 125);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (575, 35.75, 32.18, 169, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (576, 35.75, 32.18, 126, 169);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (577, 27.44, 24.7, 130, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (578, 27.44, 24.7, 126, 130);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (579, 34.02, 30.62, 50, 225);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (580, 34.02, 30.62, 225, 50);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (581, 25.49, 22.94, 24, 50);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (582, 25.49, 22.94, 50, 24);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (583, 18.79, 16.91, 23, 24);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (584, 18.79, 16.91, 24, 23);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (585, 31.13, 28.02, 19, 23);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (586, 31.13, 28.02, 23, 19);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (587, 28.45, 25.61, 21, 19);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (588, 28.45, 25.61, 19, 21);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (591, 61.64, 55.48, 135, 19);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (592, 61.64, 55.48, 19, 135);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (593, 5.56, 5, 110, 135);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (594, 5.56, 5, 135, 110);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (595, 5.56, 5, 108, 135);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (596, 5.56, 5, 135, 108);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (597, 26, 23.4, 42, 146);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (598, 26, 23.4, 146, 42);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (599, 20.03, 18.03, 39, 42);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (600, 20.03, 18.03, 42, 39);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (601, 21.29, 19.16, 143, 42);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (602, 21.29, 19.16, 42, 143);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (603, 17.9, 16.11, 138, 143);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (604, 17.9, 16.11, 143, 138);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (605, 6.09, 5.48, 41, 143);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (606, 6.09, 5.48, 143, 41);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (607, 31.91, 28.72, 130, 41);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (608, 31.91, 28.72, 41, 130);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (609, 24.68, 22.21, 40, 41);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (610, 24.68, 22.21, 41, 40);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (611, 11.36, 10.22, 138, 40);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (612, 11.36, 10.22, 40, 138);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (570, 27.79, 25.01, 176, 178);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (589, 21.16, 19.04, 20, 21);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (569, 27.79, 25.01, 178, 176);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (590, 21.16, 19.04, 21, 20);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (529, 43.53, 39.18, 20, 82);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (530, 43.53, 39.18, 82, 20);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (531, 76.14, 68.53, 212, 20);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (532, 76.14, 68.53, 20, 212);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (549, 28.93, 26.04, 49, 172);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (550, 28.93, 26.04, 172, 49);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (518, 23.61, 21.25, 255, 65);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (523, 84.75, 76.28, 49, 45);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (525, 130.16, 117.14, 83, 49);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (526, 130.16, 117.14, 49, 83);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (481, 26.84, 24.16, 45, 112);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (482, 26.84, 24.16, 112, 45);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (524, 84.75, 76.28, 45, 49);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (517, 23.61, 21.25, 65, 255);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (476, 60.62, 54.56, 65, 118);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (475, 60.62, 54.56, 118, 65);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (520, 84.63, 76.17, 65, 120);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (521, 32.47, 29.22, 122, 120);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (522, 32.47, 29.22, 120, 122);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (519, 84.63, 76.17, 120, 65);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (613, 21.64, 19.48, 37, 40);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (614, 21.64, 19.48, 40, 37);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (615, 22.13, 19.92, 39, 138);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (616, 22.13, 19.92, 138, 39);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (617, 23.66, 21.29, 38, 39);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (618, 23.66, 21.29, 39, 38);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (619, 21.85, 19.67, 145, 38);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (620, 21.85, 19.67, 38, 145);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (621, 11.41, 10.27, 136, 37);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (622, 11.41, 10.27, 37, 136);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (623, 24.79, 22.31, 38, 136);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (624, 24.79, 22.31, 136, 38);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (625, 11.63, 10.47, 34, 37);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (626, 11.63, 10.47, 37, 34);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (627, 26.49, 23.84, 36, 37);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (628, 26.49, 23.84, 37, 36);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (631, 17.33, 15.6, 28, 36);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (632, 17.33, 15.6, 36, 28);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (633, 11.14, 10.03, 35, 34);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (634, 11.14, 10.03, 34, 35);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (635, 14.73, 13.26, 33, 34);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (636, 14.73, 13.26, 34, 33);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (637, 64.55, 58.1, 128, 35);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (638, 64.55, 58.1, 35, 128);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (639, 15.11, 13.6, 129, 128);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (640, 15.11, 13.6, 128, 129);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (641, 7.02, 6.32, 50, 129);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (642, 7.02, 6.32, 129, 50);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (643, 12.43, 11.19, 32, 33);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (644, 12.43, 11.19, 33, 32);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (647, 14.47, 13.02, 119, 32);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (648, 14.47, 13.02, 32, 119);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (649, 8.95, 8.06, 27, 119);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (650, 8.95, 8.06, 119, 27);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (651, 7.02, 6.32, 28, 27);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (652, 7.02, 6.32, 27, 28);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (655, 7.43, 6.69, 222, 31);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (656, 7.43, 6.69, 31, 222);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (657, 26.14, 23.53, 25, 31);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (658, 26.14, 23.53, 31, 25);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (659, 21.86, 19.67, 221, 222);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (660, 21.86, 19.67, 222, 221);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (661, 15.44, 13.9, 124, 221);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (662, 15.44, 13.9, 221, 124);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (663, 19.68, 17.71, 24, 124);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (664, 19.68, 17.71, 124, 24);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (665, 5.99, 5.39, 26, 27);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (666, 5.99, 5.39, 27, 26);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (667, 15.78, 14.2, 117, 26);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (668, 15.78, 14.2, 26, 117);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (669, 21.54, 19.39, 25, 117);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (670, 21.54, 19.39, 117, 25);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (671, 22.05, 19.85, 30, 117);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (672, 22.05, 19.85, 117, 30);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (673, 53.01, 47.71, 23, 25);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (674, 53.01, 47.71, 25, 23);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (675, 30.74, 27.67, 29, 30);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (676, 30.74, 27.67, 30, 29);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (677, 28.32, 25.49, 22, 29);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (678, 28.32, 25.49, 29, 22);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (679, 28.27, 25.44, 21, 22);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (680, 28.27, 25.44, 22, 21);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (687, 30.35, 27.32, 47, 115);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (688, 30.35, 27.32, 115, 47);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (691, 39.32, 35.39, 177, 116);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (692, 39.32, 35.39, 116, 177);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (693, 28.31, 25.48, 118, 177);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (694, 28.31, 25.48, 177, 118);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (695, 33.45, 30.11, 175, 118);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (696, 33.45, 30.11, 118, 175);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (697, 15.69, 14.12, 182, 60);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (698, 15.69, 14.12, 60, 182);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (699, 26.03, 23.43, 220, 219);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (700, 26.03, 23.43, 219, 220);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (701, 25.92, 23.33, 125, 248);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (702, 25.92, 23.33, 248, 125);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (703, 24.34, 21.91, 97, 257);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (704, 24.34, 21.91, 257, 97);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (705, 17.78, 16, 111, 257);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (706, 17.78, 16, 257, 111);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (707, 22.88, 20.59, 114, 257);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (708, 22.88, 20.59, 257, 114);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (709, 28.58, 25.72, 42, 258);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (710, 28.58, 25.72, 258, 42);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (711, 20, 18, 44, 258);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (712, 20, 18, 258, 44);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (715, 46.71, 42.04, 259, 258);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (716, 46.71, 42.04, 258, 259);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (717, 18.59, 16.73, 40, 35);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (718, 18.59, 16.73, 35, 40);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (719, 18.94, 17.05, 130, 259);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (720, 18.94, 17.05, 259, 130);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (721, 16.15, 14.54, 126, 259);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (722, 16.15, 14.54, 259, 126);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (723, 16.77, 15.09, 37, 35);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (724, 16.77, 15.09, 35, 37);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (725, 25.89, 23.3, 34, 40);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (726, 25.89, 23.3, 40, 34);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (729, 29.9, 26.91, 28, 34);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (730, 29.9, 26.91, 34, 28);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (735, 20.37, 18.33, 43, 260);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (736, 20.37, 18.33, 260, 43);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (737, 50.32, 45.29, 39, 260);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (738, 50.32, 45.29, 260, 39);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (739, 28.28, 25.45, 237, 168);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (740, 28.28, 25.45, 168, 237);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (741, 40.06, 36.05, 166, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (742, 40.06, 36.05, 151, 166);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (743, 42.85, 38.57, 237, 151);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (744, 42.85, 38.57, 151, 237);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (745, 25.67, 23.1, 241, 168);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (746, 25.67, 23.1, 168, 241);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (749, 28.58, 25.72, 223, 149);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (750, 28.58, 25.72, 149, 223);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (654, 8.09, 7.28, 121, 31);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (645, 14.59, 13.13, 121, 32);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (646, 14.59, 13.13, 32, 121);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (629, 18.14, 16.33, 132, 36);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (653, 8.09, 7.28, 31, 121);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (630, 18.14, 16.33, 36, 132);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (285, 14.06, 12.65, 235, 147);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (281, 18.6, 16.74, 147, 234);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (223, 13.38, 12.04, 206, 208);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (731, 8.95, 8.06, 260, 49);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (732, 8.95, 8.06, 49, 260);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (683, 31.45, 28.31, 45, 179);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (684, 31.45, 28.31, 179, 45);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (690, 40.27, 36.24, 115, 45);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (689, 40.27, 36.24, 45, 115);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (685, 21.34, 19.21, 46, 115);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (413, 61.37, 55.23, 45, 46);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (733, 48.27, 43.44, 217, 168);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (734, 48.27, 43.44, 168, 217);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (686, 21.34, 19.21, 115, 46);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (385, 28.27, 25.44, 217, 216);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (468, 18.49, 16.64, 62, 215);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (753, 54.67, 49.2, 54, 263);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (754, 54.67, 49.2, 263, 54);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (755, 15.92, 14.33, 101, 263);
INSERT INTO public.rutas (id, distancia, tiempo, nodo_destino_id, nodo_inicio_id) VALUES (756, 15.92, 14.33, 263, 101);


--
-- TOC entry 4543 (class 0 OID 0)
-- Dependencies: 228
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4544 (class 0 OID 0)
-- Dependencies: 230
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4545 (class 0 OID 0)
-- Dependencies: 226
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 4546 (class 0 OID 0)
-- Dependencies: 234
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 4547 (class 0 OID 0)
-- Dependencies: 232
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 11, true);


--
-- TOC entry 4548 (class 0 OID 0)
-- Dependencies: 236
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 4549 (class 0 OID 0)
-- Dependencies: 216
-- Name: bloques_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.bloques_id_seq', 271, true);


--
-- TOC entry 4550 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 15, true);


--
-- TOC entry 4551 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 4552 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- TOC entry 4553 (class 0 OID 0)
-- Dependencies: 218
-- Name: facultades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.facultades_id_seq', 29, true);


--
-- TOC entry 4554 (class 0 OID 0)
-- Dependencies: 220
-- Name: nodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.nodos_id_seq', 263, true);


--
-- TOC entry 4555 (class 0 OID 0)
-- Dependencies: 222
-- Name: rutas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public.rutas_id_seq', 756, true);


--
-- TOC entry 4309 (class 2606 OID 17481)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4314 (class 2606 OID 17410)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4317 (class 2606 OID 17376)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4311 (class 2606 OID 17367)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4304 (class 2606 OID 17401)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4306 (class 2606 OID 17360)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4325 (class 2606 OID 17392)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4328 (class 2606 OID 17425)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4319 (class 2606 OID 17383)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4331 (class 2606 OID 17399)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4334 (class 2606 OID 17439)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4322 (class 2606 OID 17476)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4282 (class 2606 OID 18149)
-- Name: bloques bloques_codigo_b8efda4a_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.bloques
    ADD CONSTRAINT bloques_codigo_b8efda4a_uniq UNIQUE (codigo);


--
-- TOC entry 4285 (class 2606 OID 17296)
-- Name: bloques bloques_numero_auxiliar_key; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.bloques
    ADD CONSTRAINT bloques_numero_auxiliar_key UNIQUE (numero_auxiliar);


--
-- TOC entry 4287 (class 2606 OID 17292)
-- Name: bloques bloques_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.bloques
    ADD CONSTRAINT bloques_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 17461)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4299 (class 2606 OID 17353)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4301 (class 2606 OID 17351)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4279 (class 2606 OID 17283)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4341 (class 2606 OID 17489)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4289 (class 2606 OID 17305)
-- Name: facultades facultades_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.facultades
    ADD CONSTRAINT facultades_pkey PRIMARY KEY (id);


--
-- TOC entry 4291 (class 2606 OID 17314)
-- Name: nodos nodos_bloque_id_key; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_bloque_id_key UNIQUE (bloque_id);


--
-- TOC entry 4293 (class 2606 OID 17312)
-- Name: nodos nodos_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_pkey PRIMARY KEY (id);


--
-- TOC entry 4297 (class 2606 OID 17321)
-- Name: rutas rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id);


--
-- TOC entry 4307 (class 1259 OID 17482)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4312 (class 1259 OID 17421)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4315 (class 1259 OID 17422)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4302 (class 1259 OID 17407)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4323 (class 1259 OID 17437)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4326 (class 1259 OID 17436)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4329 (class 1259 OID 17451)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4332 (class 1259 OID 17450)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4320 (class 1259 OID 17477)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4280 (class 1259 OID 18150)
-- Name: bloques_codigo_b8efda4a_like; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX bloques_codigo_b8efda4a_like ON public.bloques USING btree (codigo varchar_pattern_ops);


--
-- TOC entry 4283 (class 1259 OID 17344)
-- Name: bloques_facultad_id_3efcb90b; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX bloques_facultad_id_3efcb90b ON public.bloques USING btree (facultad_id);


--
-- TOC entry 4335 (class 1259 OID 17472)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4338 (class 1259 OID 17473)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4339 (class 1259 OID 17491)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4342 (class 1259 OID 17490)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4294 (class 1259 OID 17342)
-- Name: rutas_nodo_destino_id_538f0af6; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX rutas_nodo_destino_id_538f0af6 ON public.rutas USING btree (nodo_destino_id);


--
-- TOC entry 4295 (class 1259 OID 17343)
-- Name: rutas_nodo_inicio_id_4b868f88; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX rutas_nodo_inicio_id_4b868f88 ON public.rutas USING btree (nodo_inicio_id);


--
-- TOC entry 4348 (class 2606 OID 17416)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4349 (class 2606 OID 17411)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4347 (class 2606 OID 17402)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4350 (class 2606 OID 17431)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4351 (class 2606 OID 17426)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4352 (class 2606 OID 17445)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4353 (class 2606 OID 17440)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4343 (class 2606 OID 17322)
-- Name: bloques bloques_facultad_id_3efcb90b_fk_facultades_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.bloques
    ADD CONSTRAINT bloques_facultad_id_3efcb90b_fk_facultades_id FOREIGN KEY (facultad_id) REFERENCES public.facultades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4354 (class 2606 OID 17462)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4355 (class 2606 OID 17467)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4344 (class 2606 OID 17327)
-- Name: nodos nodos_bloque_id_0af6d15a_fk_bloques_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.nodos
    ADD CONSTRAINT nodos_bloque_id_0af6d15a_fk_bloques_id FOREIGN KEY (bloque_id) REFERENCES public.bloques(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4345 (class 2606 OID 17332)
-- Name: rutas rutas_nodo_destino_id_538f0af6_fk_nodos_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_nodo_destino_id_538f0af6_fk_nodos_id FOREIGN KEY (nodo_destino_id) REFERENCES public.nodos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4346 (class 2606 OID 17337)
-- Name: rutas rutas_nodo_inicio_id_4b868f88_fk_nodos_id; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_nodo_inicio_id_4b868f88_fk_nodos_id FOREIGN KEY (nodo_inicio_id) REFERENCES public.nodos(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-09-05 09:02:23

--
-- PostgreSQL database dump complete
--

