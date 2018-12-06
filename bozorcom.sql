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
-- Name: app_brand; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.app_brand (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    category_id integer
);


ALTER TABLE public.app_brand OWNER TO bozorcom;

--
-- Name: app_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.app_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_brand_id_seq OWNER TO bozorcom;

--
-- Name: app_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.app_brand_id_seq OWNED BY public.app_brand.id;


--
-- Name: app_category; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.app_category (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    slug character varying(255),
    tree boolean NOT NULL,
    icon character varying(100),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    CONSTRAINT app_category_level_check CHECK ((level >= 0)),
    CONSTRAINT app_category_lft_check CHECK ((lft >= 0)),
    CONSTRAINT app_category_rght_check CHECK ((rght >= 0)),
    CONSTRAINT app_category_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.app_category OWNER TO bozorcom;

--
-- Name: app_category_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.app_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_category_id_seq OWNER TO bozorcom;

--
-- Name: app_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.app_category_id_seq OWNED BY public.app_category.id;


--
-- Name: app_slider; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.app_slider (
    id integer NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.app_slider OWNER TO bozorcom;

--
-- Name: app_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.app_slider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_slider_id_seq OWNER TO bozorcom;

--
-- Name: app_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.app_slider_id_seq OWNED BY public.app_slider.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO bozorcom;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO bozorcom;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO bozorcom;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO bozorcom;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO bozorcom;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO bozorcom;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO bozorcom;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO bozorcom;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO bozorcom;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bozorcom
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


ALTER TABLE public.django_admin_log OWNER TO bozorcom;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO bozorcom;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO bozorcom;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO bozorcom;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO bozorcom;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO bozorcom;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO bozorcom;

--
-- Name: store_product; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_product (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    price double precision NOT NULL,
    image character varying(100) NOT NULL,
    slug character varying(254) NOT NULL,
    description text,
    quantity integer NOT NULL,
    featured boolean NOT NULL,
    new boolean NOT NULL,
    top_rated boolean NOT NULL,
    brand_id integer,
    category_id integer NOT NULL
);


ALTER TABLE public.store_product OWNER TO bozorcom;

--
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_product_id_seq OWNER TO bozorcom;

--
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_product_id_seq OWNED BY public.store_product.id;


--
-- Name: store_productimage; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_productimage (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.store_productimage OWNER TO bozorcom;

--
-- Name: store_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_productimage_id_seq OWNER TO bozorcom;

--
-- Name: store_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_productimage_id_seq OWNED BY public.store_productimage.id;


--
-- Name: store_review; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_review (
    id integer NOT NULL,
    comment text NOT NULL,
    rate integer NOT NULL,
    data_of_created timestamp with time zone NOT NULL,
    author_id integer,
    product_id integer NOT NULL,
    CONSTRAINT store_review_rate_check CHECK ((rate >= 0))
);


ALTER TABLE public.store_review OWNER TO bozorcom;

--
-- Name: store_review_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_review_id_seq OWNER TO bozorcom;

--
-- Name: store_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_review_id_seq OWNED BY public.store_review.id;


--
-- Name: store_specification; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_specification (
    id integer NOT NULL,
    info character varying(250),
    product_id integer NOT NULL,
    specification_type_id integer
);


ALTER TABLE public.store_specification OWNER TO bozorcom;

--
-- Name: store_specification_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_specification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_specification_id_seq OWNER TO bozorcom;

--
-- Name: store_specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_specification_id_seq OWNED BY public.store_specification.id;


--
-- Name: store_specificationtype; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_specificationtype (
    id integer NOT NULL,
    name character varying(254) NOT NULL
);


ALTER TABLE public.store_specificationtype OWNER TO bozorcom;

--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_specificationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_specificationtype_id_seq OWNER TO bozorcom;

--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_specificationtype_id_seq OWNED BY public.store_specificationtype.id;


--
-- Name: app_brand id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_brand ALTER COLUMN id SET DEFAULT nextval('public.app_brand_id_seq'::regclass);


--
-- Name: app_category id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_category ALTER COLUMN id SET DEFAULT nextval('public.app_category_id_seq'::regclass);


--
-- Name: app_slider id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_slider ALTER COLUMN id SET DEFAULT nextval('public.app_slider_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: store_product id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_product ALTER COLUMN id SET DEFAULT nextval('public.store_product_id_seq'::regclass);


--
-- Name: store_productimage id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_productimage ALTER COLUMN id SET DEFAULT nextval('public.store_productimage_id_seq'::regclass);


--
-- Name: store_review id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_review ALTER COLUMN id SET DEFAULT nextval('public.store_review_id_seq'::regclass);


--
-- Name: store_specification id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specification ALTER COLUMN id SET DEFAULT nextval('public.store_specification_id_seq'::regclass);


--
-- Name: store_specificationtype id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specificationtype ALTER COLUMN id SET DEFAULT nextval('public.store_specificationtype_id_seq'::regclass);


--
-- Data for Name: app_brand; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.app_brand (id, title, category_id) FROM stdin;
1	Apple	1
2	Samsung	1
3	Xiaomi	1
\.


--
-- Name: app_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_brand_id_seq', 3, true);


--
-- Data for Name: app_category; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.app_category (id, title, slug, tree, icon, lft, rght, tree_id, level, parent_id) FROM stdin;
1	Мобил телефонлар	mobil-telefonlar	f	iPhone-512.png	1	14	4	0	\N
2	Маиший техника	maishij-tehnika	f	Microwave_1-512.png	1	30	3	0	\N
3	Микротўлқинли печлар	mikrotlinli-pechlar	f		16	17	3	1	2
4	Чангютгичлар	changyutgichlar	f		26	27	3	1	2
5	Кир ювиш машиналари	kir-yuvish-mashinalari	f		12	13	3	1	2
6	Музлатгичлар	muzlatgichlar	f		20	21	3	1	2
7	Телевизорлар	televizorlar	f		24	25	3	1	2
8	Газ плиталар	gaz-plitalar	f		4	5	3	1	2
9	Мини духовкалар	mini-duhovkalar	f		18	19	3	1	2
10	Духовые шкафы и варочные поверхности	duhovye-shkafy-i-varochnye-poverhnosti	f		8	9	3	1	2
11	Вытяжкалар	vytyazhkalar	f		2	3	3	1	2
12	Идиш ювиш машиналари ва морозилниклар	idish-yuvish-mashinalari-va-morozilniklar	f		10	11	3	1	2
13	Электр чойнаклар	elektr-chojnaklar	f		28	29	3	1	2
14	Мясорубкалар	myasorubkalar	f		22	23	3	1	2
15	Дазмоллар	dazmollar	f		6	7	3	1	2
16	Кичик маиший техника буюмлари	kichik-maishij-tehnika-buyumlari	f		14	15	3	1	2
17	Xiaomi	xiaomi	f		12	13	4	1	1
18	Samsung	samsung	f		10	11	4	1	1
19	Apple	apple	f		2	3	4	1	1
20	LG	lg	f		6	7	4	1	1
21	Meizu	meizu	f		8	9	4	1	1
22	Huawei	huawei	f		4	5	4	1	1
\.


--
-- Name: app_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_category_id_seq', 22, true);


--
-- Data for Name: app_slider; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.app_slider (id, image) FROM stdin;
\.


--
-- Name: app_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_slider_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add brand	7	add_brand
26	Can change brand	7	change_brand
27	Can delete brand	7	delete_brand
28	Can view brand	7	view_brand
29	Can add Category	8	add_category
30	Can change Category	8	change_category
31	Can delete Category	8	delete_category
32	Can view Category	8	view_category
33	Can add slider	9	add_slider
34	Can change slider	9	change_slider
35	Can delete slider	9	delete_slider
36	Can view slider	9	view_slider
37	Can add product	10	add_product
38	Can change product	10	change_product
39	Can delete product	10	delete_product
40	Can view product	10	view_product
41	Can add product image	11	add_productimage
42	Can change product image	11	change_productimage
43	Can delete product image	11	delete_productimage
44	Can view product image	11	view_productimage
45	Can add review	12	add_review
46	Can change review	12	change_review
47	Can delete review	12	delete_review
48	Can view review	12	view_review
49	Can add specification	13	add_specification
50	Can change specification	13	change_specification
51	Can delete specification	13	delete_specification
52	Can view specification	13	view_specification
53	Can add specification type	14	add_specificationtype
54	Can change specification type	14	change_specificationtype
55	Can delete specification type	14	delete_specificationtype
56	Can view specification type	14	view_specificationtype
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$SWix4a9g86Dx$xF0oCkdgIlCkgBa3sArolCHnu6ZIRWeMecvmnrtyy24=	2018-12-02 14:08:33.438275+00	t	admin			azam.mamatmurodov@gmail.com	t	t	2018-12-02 13:02:49.398795+00
2	pbkdf2_sha256$120000$dn8yEjFumgbb$+BmUaLQb2ueo5PZ3zW7O1E7/RSaYMZHLI1lptExTM3Y=	2018-12-06 12:06:18.446757+00	f	moderator	Bozorcom	Moderator	info@bozor.com	t	t	2018-12-02 13:15:17+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	25
2	2	26
3	2	27
4	2	28
5	2	32
6	2	33
7	2	34
8	2	35
9	2	36
10	2	37
11	2	38
12	2	39
13	2	40
14	2	41
15	2	42
16	2	43
17	2	44
18	2	49
19	2	50
20	2	51
21	2	52
22	2	53
23	2	54
24	2	55
25	2	56
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 25, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-02 13:09:42.206874+00	1	Операцион тизим	1	[{"added": {}}]	14	1
2	2018-12-02 13:14:25.778256+00	1	Xiaomi RedMi 5a 16 GB	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}]	10	1
3	2018-12-02 13:15:17.482013+00	2	moderator	1	[{"added": {}}]	4	1
4	2018-12-02 13:16:54.460968+00	2	moderator	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "user_permissions"]}}]	4	1
5	2018-12-03 04:46:48.205646+00	1	Apple	1	[{"added": {}}]	7	2
6	2018-12-03 04:47:28.218782+00	2	Samsung	1	[{"added": {}}]	7	2
7	2018-12-03 04:52:22.671775+00	3	Xiaomi	1	[{"added": {}}]	7	2
8	2018-12-03 04:55:18.554214+00	2	Процессор	1	[{"added": {}}]	14	2
9	2018-12-03 04:55:37.78002+00	3	Ички хотира ҳажми	1	[{"added": {}}]	14	2
10	2018-12-03 04:55:47.57152+00	4	Тезкор хотира ҳажми	1	[{"added": {}}]	14	2
11	2018-12-03 04:55:56.791942+00	5	Асосий камера	1	[{"added": {}}]	14	2
12	2018-12-03 04:56:05.487138+00	6	Олд камера	1	[{"added": {}}]	14	2
13	2018-12-03 04:56:19.89775+00	7	Дисплей тури	1	[{"added": {}}]	14	2
14	2018-12-03 04:56:55.700885+00	8	Дисплей диагонали	1	[{"added": {}}]	14	2
15	2018-12-03 04:58:07.719403+00	9	Аккумулятор сиғими	1	[{"added": {}}]	14	2
16	2018-12-03 04:58:25.210741+00	10	Вазни	1	[{"added": {}}]	14	2
17	2018-12-03 04:58:51.544799+00	11	Қўшимча функциялари	1	[{"added": {}}]	14	2
18	2018-12-03 04:59:22.422193+00	12	Ўлчамлари(Б x К x Ч, мм)	1	[{"added": {}}]	14	2
19	2018-12-03 04:59:37.688776+00	13	SIM-карта сони	1	[{"added": {}}]	14	2
20	2018-12-03 04:59:51.885151+00	14	Алоқа стандартлари	1	[{"added": {}}]	14	2
21	2018-12-03 05:00:00.316322+00	15	Ранги	1	[{"added": {}}]	14	2
22	2018-12-03 05:19:30.988507+00	2	Xiaomi Mi 5 (16GB) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Mi 5 (16GB) Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 5 (16GB) Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 5 (16GB) Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 5 (16GB) Gold"}}, {"added": {"name": "specification", "object": "Android 7.1"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f, 1080p"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "Gold"}}, {"added": {"name": "specification", "object": "151,8\\u044572,8\\u04457,7 \\u043c\\u043c"}}]	10	2
23	2018-12-03 14:27:19.571788+00	2	Redmi 5 2/16GB gold	2	[{"changed": {"fields": ["title"]}}]	10	2
24	2018-12-03 14:28:35.150503+00	2	Redmi 5 2/16 GB gold (EU)	2	[{"changed": {"fields": ["title"]}}]	10	2
25	2018-12-04 07:10:03.502789+00	3	Samsung Galaxy A600 black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "162 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.9 x 70.8 x 7.7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "\\u049a\\u043e\\u0440\\u0430"}}]	10	2
26	2018-12-04 07:14:23.842211+00	4	Samsung Galaxy A605 black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "24 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.2 x 75.7 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "\\u049a\\u043e\\u0440\\u0430"}}]	10	2
27	2018-12-04 07:25:51.917712+00	5	Samsung Galaxy A600 gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "162 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.9 x 70.8 x 7.7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
28	2018-12-04 07:35:43.675899+00	6	Samsung Galaxy A605 gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "24 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.2 x 75.7 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
29	2018-12-04 08:52:20.413698+00	7	Samsung Galaxy A530 (A8) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.2GHz + 1.6GHz"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "200 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.2 x 70.6 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
30	2018-12-04 08:57:55.784868+00	8	Samsung Galaxy A530 (A8) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6G\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "200 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.2 x 70.6 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
31	2018-12-04 08:57:56.020759+00	7	Samsung Galaxy A530 (A8) Gold	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6G\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
32	2018-12-04 08:58:04.923117+00	7	Samsung Galaxy A530 (A8) Gold	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
33	2018-12-04 08:58:22.238285+00	8	Samsung Galaxy A530 (A8) Grey	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
34	2018-12-04 09:13:56.081268+00	9	Samsung Galaxy A 730 (A8 plus) black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "black"}}]	10	2
35	2018-12-04 09:24:10.167853+00	10	Samsung Galaxy A 730 (A8 plus) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
36	2018-12-04 09:29:44.356973+00	9	Samsung Galaxy A 730 (A8 plus) Black	2	[{"changed": {"fields": ["title"]}}]	10	2
37	2018-12-04 09:32:24.834608+00	11	Samsung Galaxy A 730 (A8 plus) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
38	2018-12-04 09:41:12.219076+00	12	Samsung Galaxy A320 (A3) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2350mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "135.4 x 66.2 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
39	2018-12-04 09:46:12.858316+00	13	Samsung Galaxy A320 (A3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2350mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "135.4 x 66.2 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
40	2018-12-04 10:18:49.099405+00	14	Xiaomi Redmi 5 2/16Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "specification", "object": "Android 7.1"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f, 1080p"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8\\u044572,8\\u04457,7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
41	2018-12-04 10:19:15.739134+00	15	Samsung Galaxy A520 (A5)Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,9 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16\\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "159 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.1 x 71.4 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
42	2018-12-04 10:22:18.767871+00	14	Xiaomi Redmi 5 2/16 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
43	2018-12-04 10:23:07.772388+00	16	Samsung Galaxy A520 (A5)Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,9 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16\\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "159 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.1 x 71.4 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
44	2018-12-04 10:23:55.096923+00	15	Samsung Galaxy A520 (A5) Black	2	[{"changed": {"fields": ["title"]}}]	10	2
45	2018-12-04 10:24:06.621562+00	1	Xiaomi RedMi 5a 16 GB	3		10	2
46	2018-12-04 10:24:40.998946+00	16	Samsung Galaxy A520 (A5) Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
47	2018-12-04 10:25:28.808969+00	2	Redmi 5 2/16 GB Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
48	2018-12-04 10:35:26.758939+00	17	Xiaomi Redmi 5 3/32 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440\\u043b\\u0438"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8 \\u0445 72,8 \\u0445 7,7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
49	2018-12-04 10:38:02.677289+00	18	Samsung Galaxy A710 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "172 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.5 x 74.1 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
50	2018-12-04 10:40:18.493589+00	19	Xiaomi Redmi 5 3/32 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440\\u043b\\u0438"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8 \\u0445 72,8 \\u0445 7,7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
51	2018-12-04 10:43:54.143426+00	20	Samsung Galaxy A710 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "172 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.5 x 74.1 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
52	2018-12-04 10:52:07.370277+00	21	Xiaomi Redmi 5 + 4/64 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "specification", "object": "Android 7.0 Nougat"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "179,5 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,8 \\u0445 75,45 \\u0445 8,05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
53	2018-12-04 11:07:09.453498+00	22	Samsung Galaxy G532 (J2 Prime) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "144.8 x 72.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
54	2018-12-04 11:11:40.581766+00	23	Samsung Galaxy G532 (J2 Prime) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "144.8 x 72.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
55	2018-12-04 11:14:06.065165+00	24	Xiaomi Redmi 5 + 4/64 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "specification", "object": "Android 7.0 Nougat"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "179,5 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,8 \\u0445 75,45 \\u0445 8,05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
56	2018-12-04 11:20:02.212203+00	25	Xiaomi RedMi A1/64	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "specification", "object": "Android 7.1.1"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 MP, f/2.0"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
57	2018-12-04 11:20:27.255653+00	25	Xiaomi RedMi A1/64 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
58	2018-12-04 11:25:38.310244+00	26	Xiaomi RedMi A1/64 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.1"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 MP, f/2.0"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
59	2018-12-04 11:26:39.150155+00	27	Samsung Galaxy G570 (J5 prime) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "142.8 x 69.5 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
60	2018-12-04 11:32:39.631259+00	28	Samsung Galaxy G570 (J5 prime) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "142.8 x 69.5 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
61	2018-12-04 12:35:35.014339+00	21	Xiaomi Redmi 5 Plus 4/64 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
62	2018-12-04 12:35:49.344739+00	24	Xiaomi Redmi 5 Plus 4/64 Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
63	2018-12-05 07:55:33.092393+00	2	Xiaomi Redmi 5 2/16 GB Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
64	2018-12-05 08:06:22.298462+00	29	Xiaomi RedMi 5a 16 GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 425, 1.4 \\u0413\\u0413\\u0446, 4 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "137 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "140 x 70 x 8 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
65	2018-12-05 08:08:05.626909+00	30	Samsung Galaxy G950 (S8) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
66	2018-12-05 08:08:09.296434+00	29	Xiaomi RedMi 5A 16 GB Black	2	[{"changed": {"fields": ["title"]}}]	10	2
67	2018-12-05 08:12:23.454558+00	31	Samsung Galaxy G950 (S8) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
68	2018-12-05 08:16:40.597749+00	32	Samsung Galaxy G950 (S8) Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
69	2018-12-05 08:25:57.090311+00	33	Xiaomi RedMi 5A 32 GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5A 32 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5A 32 GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 425, 1.4 \\u0413\\u0413\\u0446, 4 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "137 \\u0433"}}, {"added": {"name": "specification", "object": "140 x 70 x 8 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
70	2018-12-05 08:36:42.518416+00	34	Samsung Galaxy G960 (S9) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
71	2018-12-05 08:38:56.9416+00	35	Xiaomi RedMi 5 16GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "Qualcomm Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
72	2018-12-05 08:41:46.046816+00	36	Samsung Galaxy G960 (S9) Purple	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Pruple"}}]	10	2
73	2018-12-05 08:48:22.430377+00	37	Samsung Galaxy G960 (S9) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
74	2018-12-05 08:49:55.859027+00	38	Xiaomi RedMi 5 16GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "Qualcomm Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
75	2018-12-05 08:58:21.941881+00	39	Samsung Galaxy G965 (S9+) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,7 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
76	2018-12-05 09:00:15.510068+00	40	Xiaomi RedMi 5 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
77	2018-12-05 09:07:29.24492+00	41	Xiaomi RedMi 5 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
78	2018-12-05 09:12:12.811677+00	42	Samsung Galaxy G965 (S9+) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,7 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
79	2018-12-05 09:13:28.980207+00	43	Xiaomi RedMi 5 plus 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900 3G 4G LTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
80	2018-12-05 09:23:02.077237+00	44	Xiaomi RedMi 5 plus 32GB Black	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900 3G 4G LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
81	2018-12-06 12:09:27.867728+00	45	Xiaomi RedMi 5 plus 64GB Gold	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
82	2018-12-06 12:14:34.766829+00	46	Xiaomi RedMi 5 plus 64GB Black	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
83	2018-12-06 12:14:59.963756+00	45	Xiaomi RedMi 5 plus 64GB Gold	2	[{"changed": {"name": "specification", "object": "4000 mAh", "fields": ["info"]}}]	10	2
84	2018-12-06 12:19:59.546133+00	47	Xiaomi RedMi S2 32GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
85	2018-12-06 12:20:32.146403+00	48	Samsung Galaxy  G965/256 (S9+) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
86	2018-12-06 12:23:27.67012+00	49	Xiaomi RedMi S2 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
87	2018-12-06 12:23:36.052443+00	50	Samsung Galaxy  G965/256 (S9+) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
88	2018-12-06 12:27:12.915447+00	51	Xiaomi RedMi S2 64GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
89	2018-12-06 12:27:30.773644+00	52	Samsung Galaxy  G965/256 (S9+) Purple	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Purple"}}]	10	2
90	2018-12-06 12:28:37.33322+00	36	Samsung Galaxy G960 (S9) Purple	2	[{"changed": {"name": "specification", "object": "Purple", "fields": ["info"]}}]	10	2
91	2018-12-06 12:33:44.890489+00	53	Xiaomi RedMi S2 64GB Gold	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
92	2018-12-06 12:35:58.194225+00	54	Samsung Galaxy  J105 (J1 mini) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.2\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "0.75 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "4 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1500 mAh"}}, {"added": {"name": "specification", "object": "123 \\u0433"}}, {"added": {"name": "specification", "object": "121.6 x 63.1 x 10.8"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
93	2018-12-06 12:40:05.93669+00	55	Xiaomi RedMi Note 5 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2 (Nougat)"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
94	2018-12-06 12:41:10.441533+00	53	Xiaomi RedMi S2 64GB Gold	2	[{"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}]	10	2
95	2018-12-06 12:42:31.202602+00	56	Samsung Galaxy J110 (J1 Ace) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "4\\u00a0\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "512\\u00a0\\u041c\\u0411"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1800 mAh"}}, {"added": {"name": "specification", "object": "128\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "67x137x10"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
96	2018-12-06 12:46:04.030891+00	57	Xiaomi RedMi Note 5 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2 (Nougat)"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
97	2018-12-06 12:47:15.308208+00	58	Samsung Galaxy J110 (J1 Ace) White	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "4\\u00a0\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "512\\u00a0\\u041c\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1800 mAh"}}, {"added": {"name": "specification", "object": "128\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "67x137x10"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS)"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
98	2018-12-06 12:52:55.627763+00	59	Xiaomi RedMi Note 5 64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
99	2018-12-06 12:57:52.08248+00	60	Xiaomi Mi 6 6/64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1"}}, {"added": {"name": "specification", "object": "\\"Snapdragon 835,   2.45 \\u0413\\u0413\\u0446 + 1.9 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430\\""}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.15 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3350 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "168 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "145.2 x 70.5 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G(WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
100	2018-12-06 13:00:54.886135+00	61	Samsung Galaxy J200 (J2) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2000 mAh"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "136.5 x 69.0 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
101	2018-12-06 13:05:38.68413+00	62	Samsung Galaxy J200 (J2) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2000 mAh"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "136.5 x 69.0 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 101, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app	brand
8	app	category
9	app	slider
10	store	product
11	store	productimage
12	store	review
13	store	specification
14	store	specificationtype
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-02 13:01:40.682859+00
2	auth	0001_initial	2018-12-02 13:01:41.411426+00
3	admin	0001_initial	2018-12-02 13:01:41.603899+00
4	admin	0002_logentry_remove_auto_add	2018-12-02 13:01:41.651534+00
5	admin	0003_logentry_add_action_flag_choices	2018-12-02 13:01:41.702149+00
6	app	0001_initial	2018-12-02 13:01:42.302546+00
7	contenttypes	0002_remove_content_type_name	2018-12-02 13:01:42.411762+00
8	auth	0002_alter_permission_name_max_length	2018-12-02 13:01:42.445294+00
9	auth	0003_alter_user_email_max_length	2018-12-02 13:01:42.500514+00
10	auth	0004_alter_user_username_opts	2018-12-02 13:01:42.543798+00
11	auth	0005_alter_user_last_login_null	2018-12-02 13:01:42.600303+00
12	auth	0006_require_contenttypes_0002	2018-12-02 13:01:42.61157+00
13	auth	0007_alter_validators_add_error_messages	2018-12-02 13:01:42.660606+00
14	auth	0008_alter_user_username_max_length	2018-12-02 13:01:42.766367+00
15	auth	0009_alter_user_last_name_max_length	2018-12-02 13:01:42.82164+00
16	sessions	0001_initial	2018-12-02 13:01:42.988691+00
17	store	0001_initial	2018-12-02 13:01:43.789123+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tr6b6e3n6nsdto4wlxympk1xsxua3f3n	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2018-12-16 13:02:56.747718+00
nrn64rdi7hr3cavpzz1byyygm2p38ele	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-16 13:17:16.407505+00
ouncz8qbkvkntwrbseybg7dnnkperbpg	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2018-12-16 14:08:33.445337+00
nhlhzen5jexxsk0m9zbxi0ensgczwpd4	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-16 14:09:04.402832+00
p9s3jcrg7xp2gyk6l9pb75920kif7ibv	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-16 17:16:28.111512+00
j1mubnn48thd4o5qm1onb8cqbkupgf9b	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-17 03:48:39.266736+00
9thyiblenzu8gmgbzplr4parr3tlgr09	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-17 14:25:24.655576+00
n7dmlbcpueoy6ztws7176eltylq5geqv	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-20 05:02:42.572019+00
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_product (id, title, price, image, slug, description, quantity, featured, new, top_rated, brand_id, category_id) FROM stdin;
41	Xiaomi RedMi 5 32GB Gold	1	0_OQgTrBg.jpg	xiaomi-redmi-5-32gb-gold		1	f	f	f	3	17
42	Samsung Galaxy G965 (S9+) Grey	1	1.JPG	samsung-galaxy-g965-s9-grey		1	f	f	f	2	18
3	Samsung Galaxy A600 black	1	1_M2nxtHc.jpg	samsung-galaxy-a600-black		1	f	f	f	2	18
4	Samsung Galaxy A605 black	1	1_SzwWvRc.jpg	samsung-galaxy-a605-black		1	f	f	f	2	18
5	Samsung Galaxy A600 gold	1	1_emUuR6t.jpg	samsung-galaxy-a600-gold		1	f	f	f	2	18
6	Samsung Galaxy A605 gold	1	1_9N9wFsF.jpg	samsung-galaxy-a605-gold		1	f	f	f	2	18
43	Xiaomi RedMi 5 plus 32GB Gold	1	0_1TO4rUy.jpg	xiaomi-redmi-5-plus-32gb-gold		1	f	f	f	3	17
7	Samsung Galaxy A530 (A8) Gold	1	1.png	samsung-galaxy-a530-a8-gold		1	f	f	f	2	18
8	Samsung Galaxy A530 (A8) Grey	1	1_q6L5Mnw.jpg	samsung-galaxy-a530-a8-grey		1	f	f	f	2	18
10	Samsung Galaxy A 730 (A8 plus) Gold	1	ru-galaxy-a8-a730-sm-a730fzddser-frontgold-87027407.jpg	samsung-galaxy-730-a8-plus-gold		1	f	f	f	2	18
9	Samsung Galaxy A 730 (A8 plus) Black	1	1_9WDwak5.jpg	samsung-galaxy-730-a8-plus-black		1	f	f	f	2	18
11	Samsung Galaxy A 730 (A8 plus) Grey	1	0.jpg	samsung-galaxy-730-a8-plus-grey		1	f	f	f	2	18
12	Samsung Galaxy A320 (A3) Black	1	1_TB5soJQ.jpg	samsung-galaxy-a320-a3-black		1	f	f	f	2	18
13	Samsung Galaxy A320 (A3) Gold	1	1_Tp2kOaA.jpg	samsung-galaxy-a320-a3-gold		1	f	f	f	2	18
14	Xiaomi Redmi 5 2/16 Black	1	5_BHK4nEE.jpg	xiaomi-redmi-5-216black		1	f	f	f	3	17
15	Samsung Galaxy A520 (A5) Black	1	1_3tJ4jA6.jpg	samsung-galaxy-a520-a5black		1	f	f	f	2	18
16	Samsung Galaxy A520 (A5) Gold	1	1_idkkTPK.jpg	samsung-galaxy-a520-a5gold		1	f	f	f	2	18
44	Xiaomi RedMi 5 plus 32GB Black	1	0_yFYg836.jpg	xiaomi-redmi-5-plus-32gb-black		1	f	f	f	3	17
17	Xiaomi Redmi 5 3/32 Black	1	7_WlGsF85.jpg	xiaomi-redmi-5-332-black		1	f	f	f	3	17
18	Samsung Galaxy A710 Black	1	0_sU9Gd2K.jpg	samsung-galaxy-a710-black		1	f	f	f	2	18
19	Xiaomi Redmi 5 3/32 Gold	1	5_wX06r4q.jpg	xiaomi-redmi-5-332-gold		1	f	f	f	3	17
20	Samsung Galaxy A710 Gold	1	0_MCyEG0L.jpg	samsung-galaxy-a710-gold		1	f	f	f	2	18
22	Samsung Galaxy G532 (J2 Prime) Black	1	1_vlU2dc7.jpg	samsung-galaxy-g532-j2-prime-black		1	f	f	f	2	18
23	Samsung Galaxy G532 (J2 Prime) Gold	1	1_6txTnW8.jpg	samsung-galaxy-g532-j2-prime-gold		1	f	f	f	2	18
25	Xiaomi RedMi A1/64 Black	1	0_kRXdEbm.jpg	xiaomi-redmi-a164		1	f	f	f	3	17
26	Xiaomi RedMi A1/64 Gold	1	0.png	xiaomi-redmi-a164-gold		1	f	f	f	3	17
27	Samsung Galaxy G570 (J5 prime) Black	1	1_yyMsBLz.jpg	samsung-galaxy-g570-j5-prime-black		1	f	f	f	2	18
28	Samsung Galaxy G570 (J5 prime) Gold	1	1_GDpqXZv.jpg	samsung-galaxy-g570-j5-prime-gold		1	f	f	f	2	18
21	Xiaomi Redmi 5 Plus 4/64 Black	1	2_QoDpfc5.jpg	xiaomi-redmi-5-464-black		1	f	f	f	3	17
24	Xiaomi Redmi 5 Plus 4/64 Gold	1	2_8t9F824.png	xiaomi-redmi-5-464-gold		1	f	f	f	3	17
2	Xiaomi Redmi 5 2/16 GB Gold	996000	00.jpg	xiaomi-mi-5-16gb-gold		1	f	t	f	3	17
30	Samsung Galaxy G950 (S8) Black	1	1_6MYunr9.jpg	samsung-galaxy-g950-s8-black		1	f	f	f	2	18
29	Xiaomi RedMi 5A 16 GB Black	1	0_2Jc1JjG.jpg	xiaomi-redmi-5a-16-gb-black		1	f	f	f	3	17
31	Samsung Galaxy G950 (S8) Gold	1	1_fi9Cr4Y.jpg	samsung-galaxy-g950-s8-gold		1	f	f	f	2	18
32	Samsung Galaxy G950 (S8) Red	1	1_3BXgrSb.jpg	samsung-galaxy-g950-s8-red		1	f	f	f	2	18
33	Xiaomi RedMi 5A 32 GB Black	1	00_klNv3w3.jpeg	xiaomi-redmi-5a-32-gb-black		1	f	f	f	3	17
34	Samsung Galaxy G960 (S9) Black	1	1_DTBCznu.jpg	samsung-galaxy-g960-s9-black		1	f	f	f	2	18
35	Xiaomi RedMi 5 16GB Black	1	0_XMTmvIY.jpg	xiaomi-redmi-5-16gb-black		1	f	f	f	3	17
37	Samsung Galaxy G960 (S9) Grey	1	1_BZneRxy.jpg	samsung-galaxy-g960-s9-grey		1	f	f	f	2	18
38	Xiaomi RedMi 5 16GB Gold	1	0_DN7eDnd.jpg	xiaomi-redmi-5-16gb-gold		1	f	f	f	3	17
39	Samsung Galaxy G965 (S9+) Black	1	1_87QJRGt.jpg	samsung-galaxy-g965-s9-black		1	f	f	f	2	18
40	Xiaomi RedMi 5 32GB Black	1	0_5Dx3e4a.jpg	xiaomi-redmi-5-32gb-black		1	f	f	f	3	17
46	Xiaomi RedMi 5 plus 64GB Black	1	0.jpeg	xiaomi-redmi-5-plus-64gb-black		1	f	f	f	3	17
45	Xiaomi RedMi 5 plus 64GB Gold	1	0000.png	xiaomi-redmi-5-plus-64gb-gold		1	f	f	f	3	17
47	Xiaomi RedMi S2 32GB Grey	1	0_xQ8y5W3.jpg	xiaomi-redmi-s2-32gb-grey		1	f	f	f	3	17
48	Samsung Galaxy  G965/256 (S9+) Black	1	1_e9OGgNn.jpg	samsung-galaxy-g965256-s9-black		1	f	f	f	2	18
49	Xiaomi RedMi S2 32GB Gold	1	0_GWePBbD.jpg	xiaomi-redmi-s2-32gb-gold		1	f	f	f	3	17
50	Samsung Galaxy  G965/256 (S9+) Grey	1	1_2OsaV21.jpg	samsung-galaxy-g965256-s9-grey		1	f	f	f	2	18
51	Xiaomi RedMi S2 64GB Grey	1	0_Tra6fcM.jpg	xiaomi-redmi-s2-64gb-grey		1	f	f	f	3	17
52	Samsung Galaxy  G965/256 (S9+) Purple	1	1_4IWxQXR.jpg	samsung-galaxy-g965256-s9-purple		1	f	f	f	2	18
36	Samsung Galaxy G960 (S9) Purple	1	1_rA0HwOy.jpg	samsung-galaxy-g960-s9-purple		1	f	f	f	2	18
54	Samsung Galaxy  J105 (J1 mini) Black	1	1_QqTDawy.jpg	samsung-galaxy-j105-j1-mini-black		1	f	f	f	2	18
55	Xiaomi RedMi Note 5 32GB Black	1	1_OnZZbKj.jpg	xiaomi-redmi-note-5-32gb-black		1	f	f	f	3	17
53	Xiaomi RedMi S2 64GB Gold	1	_-_-_-001_1.jpg	xiaomi-redmi-s2-64gb-gold		1	f	f	f	3	17
56	Samsung Galaxy J110 (J1 Ace) Black	1	1_81uBtKp.jpg	samsung-galaxy-j110-j1-ace-black		1	f	f	f	2	18
57	Xiaomi RedMi Note 5 32GB Gold	1	0_zkFJrix.jpg	xiaomi-redmi-note-5-32gb-gold		1	f	f	f	3	17
58	Samsung Galaxy J110 (J1 Ace) White	1	1_PJx5r6B.jpg	samsung-galaxy-j110-j1-ace-white		1	f	f	f	2	18
59	Xiaomi RedMi Note 5 64GB Black	1	0_ey0HmPx.jpg	xiaomi-redmi-note-5-64gb-black		1	f	f	f	3	17
60	Xiaomi Mi 6 6/64GB Black	1	2_sHbUp5X.png	xiaomi-mi-6-664gb-black		1	f	f	f	3	17
61	Samsung Galaxy J200 (J2) Black	1	1_5eUSTcN.jpg	samsung-galaxy-j200-j2-black		1	f	f	f	2	18
62	Samsung Galaxy J200 (J2) Gold	1	1_jFuLaxA.jpg	samsung-galaxy-j200-j2-gold		1	f	f	f	2	18
\.


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_product_id_seq', 62, true);


--
-- Data for Name: store_productimage; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_productimage (id, image, product_id) FROM stdin;
11	1.jpg	2
12	2.jpg	2
13	3.jpg	2
14	4.jpg	2
15	2_Y2K01xu.jpg	3
16	3_4g4koQj.jpg	3
17	4_eY3Kwxe.jpg	3
18	5.jpg	3
19	6.jpg	3
20	7.jpg	3
21	8.jpg	3
22	9.jpg	3
23	10.jpg	3
24	11.jpg	3
25	12.jpg	3
26	13.jpg	3
27	14.jpg	3
28	15.jpg	3
29	2_A373yhb.jpg	4
30	3_28Evid2.jpg	4
31	4_uyx0GCQ.jpg	4
32	5_QcPITvR.jpg	4
33	6_AFDh6AS.jpg	4
34	7_Bb0O86d.jpg	4
35	8_w4D5dHv.jpg	4
36	9_25ohyxR.jpg	4
37	10_AthENvD.jpg	4
38	11_KAlXg4t.jpg	4
39	1_hIKhc8w.jpg	5
40	2_FlpnLMB.jpg	5
41	3_F7I1ONL.jpg	5
42	4_CcrQ5ka.jpg	5
43	5_9ZlJDci.jpg	5
44	20.jpg	5
45	21.jpg	5
46	1_cXPSuzA.jpg	6
47	2_kjsy8v0.jpg	6
48	12_g2DuYUF.jpg	6
49	13_uqQgkXW.jpg	6
50	14_P4YFYDZ.jpg	6
51	15_AVoyxII.jpg	6
52	16.jpg	6
53	17.jpg	6
54	18.jpg	6
55	19.jpg	6
56	2161251.jpg	6
57	1_ALWnbZN.png	7
58	2.png	7
59	3.png	7
60	4.png	7
61	5.png	7
62	1_1b7JLIB.jpg	8
63	2_UnzrTXn.jpg	8
64	3_nk1G7ea.jpg	8
65	4_9zg9MOi.jpg	8
66	5_EFKOOml.jpg	8
67	6_IBxSGcg.jpg	8
68	7_gCn1ubz.jpg	8
69	8_QseKvHt.jpg	8
70	1_WqLSHBn.jpg	9
71	2_yDXw1MQ.jpg	9
72	3_QOOWJhp.jpg	9
73	4_SpReRKB.jpg	9
74	5_7ufNJ0T.jpg	9
75	6_wiAEMPq.jpg	9
76	ru-galaxy-a8-a730-sm-a730fzddser-frontgold-87027407_yYYZoB7.jpg	10
77	2_lVv4Rsu.jpg	10
78	3_qJpnTto.jpg	10
79	4_VjawenU.jpg	10
80	5_UbbxQZO.jpg	10
81	6_5FvkzdG.jpg	10
82	0_hFXGU9s.jpg	11
83	1_D0ZQInV.jpg	11
84	2_O1fBDwz.jpg	11
85	3_Sz7JCto.jpg	11
86	4_9LnA2zG.jpg	11
87	5_cYPmr8o.jpg	11
88	6_c377F1z.jpg	11
89	1_Pei6IUb.jpg	12
90	2_f7nl6Km.jpg	12
91	3_qcNHpne.jpg	12
92	4_Ryt1XdN.jpg	12
93	5_7sxKU2w.jpg	12
94	1_iOaqe5O.jpg	13
95	2_06ilufA.jpg	13
96	3_1yWxL5A.jpg	13
97	4_bknXM1e.jpg	13
98	5_kqPObWy.jpg	13
99	6_mH9LWnu.jpg	13
100	1_nBmKUqX.jpg	14
101	2_bSiSWVd.jpg	14
102	3_f0mbQvL.jpg	14
103	4_bUV61Mc.jpg	14
104	5_WrM4MIT.jpg	14
105	2_GvkWG14.jpg	15
106	3_LAmbXGy.jpg	15
107	4_WrfvYMi.jpg	15
108	5_KBxtvQm.jpg	15
109	6_oY785WI.jpg	15
110	2_r4MrPgS.jpg	16
111	3_R0gJQQA.jpg	16
112	4_LkepCZQ.jpg	16
113	5_DbnurVM.jpg	16
114	6_iQ6THwR.jpg	16
115	6_mC0572A.jpg	17
116	7_yOCetF9.jpg	17
117	11_O7H8sDo.jpg	17
118	21_uiB5Ggh.jpg	17
119	22.jpg	17
120	31.jpg	17
121	41.jpg	17
122	00_HXaKlRC.jpg	18
123	000.jpg	18
124	0000.jpg	18
125	5_Son8UNk.jpg	18
126	6_kIwi9gt.jpg	18
127	7_EAyveeh.jpg	18
128	8_OYPXOJ5.jpg	18
129	1_S5G3bTX.jpg	19
130	2_tLnUhoU.jpg	19
131	4_KQB9KX5.jpg	19
132	5_VwpfRhi.jpg	19
133	00_fozEth8.jpg	20
134	000_o2kRNUy.jpg	20
135	0000_ga01Psc.jpg	20
136	22_97LquCy.jpg	20
137	23.jpg	20
138	24.jpg	20
139	25.jpg	20
140	26.jpg	20
141	00.jpeg	21
142	1_AzPLFKY.jpg	21
143	1_ZXnWcCj.png	21
144	2_HQQT3BD.jpg	21
145	4_hpnQnQi.jpg	21
146	5.jpeg	21
147	6.jpeg	21
148	6_pFfDZ9b.jpg	21
149	8_kY7bQkz.jpg	21
150	3_JYNcMpk.jpg	21
151	2_zomvGCD.jpg	22
152	3_IVPezW9.jpg	22
153	4_ZbkX47j.jpg	22
154	5_90elwrV.jpg	22
155	6_oNIJj3d.jpg	22
156	8_Ho9R6Lz.jpg	22
157	9_UWzwhPq.jpg	22
158	10_DqHAMRU.jpg	22
159	11_6pYwx4d.jpg	22
160	2_AcGq5iA.jpg	23
161	3_MyycTYQ.jpg	23
162	4_5JcVfrn.jpg	23
163	5_j6YZfJe.jpg	23
164	6_THVSQ9x.jpg	23
165	7_Mvs9XQP.jpg	23
166	8_IINB4xw.jpg	23
167	9_ikZnxGJ.jpg	23
168	10_iUAfNeF.jpg	23
169	11_AAFhnUM.jpg	23
170	1_hQgVp6N.jpg	24
171	2_5ExxxCl.jpg	24
172	2_j9N5FJB.png	24
173	3_FDJhhwu.jpg	24
174	01.jpg	25
175	1_wnobrIT.jpg	25
176	02.jpg	25
177	2_iOo3bqs.jpg	25
178	3_e56RuOi.jpg	25
179	4_plameJR.jpg	25
180	5_7ea1C4e.jpg	25
181	00.png	26
182	0_6dkGVXd.png	26
183	1_MEHwLqb.jpg	26
184	02_01MhOaY.jpg	26
185	2_E7hry8c.jpg	26
186	3_Fy6oDRI.jpg	26
187	4_T2z13Ps.jpg	26
188	5_3HHXsGa.jpg	26
189	2_V2tZKJX.jpg	27
190	3_aalqyxp.jpg	27
191	4_Xj8ccFJ.jpg	27
192	5_1e8PG0S.jpg	27
193	6_bd6xnws.jpg	27
194	7_8pIt4yc.jpg	27
195	8_nxM6WFY.jpg	27
196	2_evCmK3h.jpg	28
197	3_9GA2OWC.jpg	28
198	5_rDGKVIP.jpg	28
199	6_LJVzo0f.jpg	28
200	8_dhsRmnq.jpg	28
201	9_IGOCYai.jpg	28
202	0_oqHCfKZ.jpg	29
203	3_nLWzn7x.jpg	29
204	4_xBWGuvu.jpg	29
205	2_k6mAaLm.jpg	29
206	2_CW9GJ7c.jpg	30
207	3_KeWmXt9.jpg	30
208	4_KcrVc27.jpg	30
209	5_e5GE7iO.jpg	30
210	6_q8DaprE.jpg	30
211	7_K2O3rVS.jpg	30
212	2_zmfpw6J.jpg	31
213	3_yWg08sP.jpg	31
214	4_EJVpuds.jpg	31
215	5_RZMyztJ.jpg	31
216	6_Cy4BomK.jpg	31
217	2_7mKbuGG.jpg	32
218	3_WqZwxq7.jpg	32
219	4_0ROJfvm.jpg	32
220	5_vB7rMBe.jpg	32
221	6_4g4PS3p.jpg	32
222	5_0BUjr4t.jpg	33
223	00_CEYD1sL.jpeg	33
224	2_E1ZLGhV.jpg	34
225	3_dPEutd4.jpg	34
226	4_8VCNzuz.jpg	34
227	5_QSvWta6.jpg	34
228	6_yDqsyC2.jpg	34
229	0_0hav3z5.jpg	35
230	1_btXY8cN.jpg	35
231	2_rwVNUU9.jpg	35
232	3_VrtQgd9.jpg	35
233	4_ALDbRxV.jpg	35
234	5_NZm9B7t.jpg	35
235	2_l5qEVlQ.jpg	36
236	3_BHMrSH0.jpg	36
237	5_FY6r1TB.jpg	36
238	6_m5wlRtj.jpg	36
239	2_UkdXGBz.jpg	37
240	3_pBWPlVx.jpg	37
241	4_a1RweR7.jpg	37
242	5_LvSpO6E.jpg	37
243	0_hzQpgC9.jpg	38
244	1_rMnMp7s.jpg	38
245	2_jQmUxVK.jpg	38
246	3_Gb2yCKv.jpg	38
247	4_6gl7FGL.jpg	38
248	5_rWpKL4W.jpg	38
249	2_pOqrI57.jpg	39
250	3_eGCnTFG.jpg	39
251	4_ARDdb20.jpg	39
252	5_heXGkYc.jpg	39
253	1_JlmE41f.jpg	40
254	2_BHFAa6r.jpg	40
255	3_5Ucv5PA.jpg	40
256	4_WCEHxCd.jpg	40
257	5_CsmpFpE.jpg	40
258	0_WPZuC1V.jpg	40
259	1_1yFPW9a.jpg	41
260	2_TKxmXer.jpg	41
261	3_lv4Clfg.jpg	41
262	4_M7P8zm8.jpg	41
263	0_zdnlxuT.jpg	41
264	2.JPG	42
265	3.JPG	42
266	4.JPG	42
267	5.JPG	42
268	1_kufqNEZ.jpg	43
269	2_6g9It5u.jpg	43
270	3_Icpiqiz.jpg	43
271	4_iRlUZgd.jpg	43
272	0_SE0g3Wh.jpg	43
273	1_9z5V925.jpg	47
274	2_fHiSDEI.jpg	47
275	3_cO37lBP.jpg	47
276	0_DdUpdqg.jpg	47
277	2_NX7SHa2.jpg	48
278	3_DPxPRLm.jpg	48
279	4_52dvOj6.jpg	48
280	5_OUM8m0t.jpg	48
281	6_JnlcsQx.jpg	48
282	0_9VBcp6Q.jpg	49
283	1_anRRooi.jpg	49
284	2_JOlfjpf.jpg	49
285	3_sfnuOqo.jpg	49
286	4_TXpJ4m2.jpg	49
287	2_kfd2VX3.jpg	50
288	3_57Sgyhr.jpg	50
289	4_QytuxvN.jpg	50
290	5_Bycn8eM.jpg	50
291	6_Oys3APl.jpg	50
292	1_sb8PTUZ.jpg	51
293	2_Z9EUlH5.jpg	51
294	4_IbUx7cC.jpg	51
295	5_rtNKnVV.jpg	51
296	6_07XbgbO.jpg	51
297	7_7BJV1rw.jpg	51
298	0_hRzKKT2.jpg	51
299	2_YOt9lyi.jpg	52
300	3_9dphDOu.jpg	52
301	4_sR0dkO0.jpg	52
302	5_rHZ2fbx.jpg	52
303	6_YJJhlUb.jpg	52
304	2_O47zvtO.jpg	54
305	3_ZuioFCI.jpg	54
306	4_sJOM4Iq.jpg	54
307	5_Vx4vQRc.jpg	54
308	6_F4XItfH.jpg	54
309	00_HJuKhKB.jpg	55
310	1_55Upqxm.jpg	55
311	2_e0EVJfg.jpg	55
312	5_TcVXHae.jpg	55
313	9_BEmSJws.jpg	55
314	7_NClie9i.jpg	55
315	xiaomi_redmi_note_5_pro_2_1_1.png	55
316	8_ZpOHHSn.jpg	55
317	_-_-_--002_1.jpg	53
318	_-_-_-005.jpg	53
319	_-__8_1.jpg	53
320	_-__9.jpg	53
321	_-__10.jpg	53
322	_-_-001.jpg	53
323	_-_-003.jpg	53
324	c09-_1_.jpg	53
325	xiaomi_redmi_s2_champagne_gold_3_1.jpg	53
326	xiaomi_redmi_s2_champagne_gold_4_1.jpg	53
327	2_UODHgsj.jpg	56
328	3_VB5OoD8.jpg	56
329	4_Zju4Dok.jpg	56
330	5_P7FVsJT.jpg	56
331	6_1aGdnHZ.jpg	56
332	9_zj1Oing.jpg	56
333	1_C4OGiYH.jpg	57
334	2_yc9rNOJ.jpg	57
335	3_I7EaoHy.jpg	57
336	4_ArAki35.jpg	57
337	5_6dSU4w8.jpg	57
338	6_tvoyfYw.jpg	57
339	7_K2yRZmL.jpg	57
340	2_QXs4mhv.jpg	58
341	3_PJznfWO.jpg	58
342	4_Vez9ud4.jpg	58
343	5_oxUqAeG.jpg	58
344	6_2ml7hib.jpg	58
345	7_yX6xtg5.jpg	58
346	8_D72loCG.jpg	58
347	1_iEorzW2.jpg	59
348	2_JOXg7TZ.jpg	59
349	3_9yxlAuB.jpg	59
350	4_gjyvf7N.jpg	59
351	5_yyganMS.jpg	59
352	6_42KbiBC.jpg	59
353	22_7eK65xh.jpg	59
354	2_XZqv8Xe.png	60
355	3_Pyw0C1F.png	60
356	4_BqIA1LL.png	60
357	xiaomi_mi6_664_blk_images_2027581644.jpg	60
358	xiaomi_mi6_664_blk_images_2027581728.jpg	60
359	2_TzE0vTG.jpg	61
360	3_atFOWtJ.jpg	61
361	4_vBsECME.jpg	61
362	6_J2a2rIW.jpg	61
363	4_yGs7REW.jpg	61
364	5_yK7ShP9.jpg	61
365	4_A2puS8C.jpg	62
366	2_tjGD0aw.jpg	62
367	3_Q9hOSfd.jpg	62
368	7_673wvTy.jpg	62
369	8_LCTwbxt.jpg	62
370	5_PAt9l5u.jpg	62
\.


--
-- Name: store_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_productimage_id_seq', 370, true);


--
-- Data for Name: store_review; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_review (id, comment, rate, data_of_created, author_id, product_id) FROM stdin;
\.


--
-- Name: store_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_review_id_seq', 1, false);


--
-- Data for Name: store_specification; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_specification (id, info, product_id, specification_type_id) FROM stdin;
2	Android 7.1	2	1
3	Snapdragon 450, 1.8 ГГц	2	2
4	32 Гб	2	3
5	2 Гб	2	4
6	12 Мп	2	5
7	5 Мп, 1080p	2	6
8	IPS	2	7
9	5.7 дюйм	2	8
10	3300 mAh	2	9
11	157 г	2	10
12	2	2	13
13	GSM, 3G, 4G (LTE)	2	14
14	Бармоқ изи сканери	2	11
15	Gold	2	15
16	151,8х72,8х7,7 мм	2	12
17	Android	3	1
18	1.6 ГГц	3	2
19	32 ГБ	3	3
20	3 ГБ	3	4
21	16 Мп	3	5
22	16 Мп	3	6
23	Super AMOLED	3	7
24	4.6 дюйм	3	8
25	3000 мАh	3	9
26	162 г	3	10
27	Бармоқ изи сканери	3	11
28	149.9 x 70.8 x 7.7	3	12
29	2	3	13
30	3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)	3	14
31	Қора	3	15
32	Android	4	1
33	1,8 ГГц	4	2
34	3 ГБ	4	3
35	32 ГБ	4	4
36	16 Мп + 5 Мп	4	5
37	24 Мп	4	6
38	Super AMOLED	4	7
39	6 дюйм	4	8
40	3500 mAh	4	9
41	191 г	4	10
42	Бармоқ изи сканери	4	11
43	160.2 x 75.7 x 7.9	4	12
44	2	4	13
45	3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)	4	14
46	Қора	4	15
47	Android	5	1
48	1.6 ГГц	5	2
49	32 ГБ	5	3
50	3 ГБ	5	4
51	16 Мп	5	5
52	16 Мп	5	6
53	Super AMOLED	5	7
54	4.6 дюйм	5	8
55	3000 мАh	5	9
56	162 г	5	10
57	Бармоқ изи сканери	5	11
58	149.9 x 70.8 x 7.7	5	12
59	2	5	13
60	3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)	5	14
61	Gold	5	15
62	Android	6	1
63	1,8 ГГц	6	2
64	3 ГБ	6	3
65	32 ГБ	6	4
66	16 Мп + 5 Мп	6	5
67	24 Мп	6	6
68	Super AMOLED	6	7
69	6 дюйм	6	8
70	3500 mAh	6	9
71	191 г	6	10
72	Бармоқ изи сканери	6	11
73	160.2 x 75.7 x 7.9	6	12
74	2	6	13
75	3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)	6	14
76	Gold	6	15
77	Android	7	1
79	32ГБ	7	3
80	4ГБ	7	4
81	16МП	7	5
82	8МП	7	6
83	Super AMOLED	7	7
84	5.6 дюйм	7	8
85	3000 мАh	7	9
86	200 г	7	10
87	Бармоқ изи сканери	7	11
88	149.2 x 70.6 x 8.4	7	12
89	2	7	13
90	2G, 3G, 4G LTE, GSM	7	14
91	Gold	7	15
92	Android	8	1
94	32ГБ	8	3
95	4ГБ	8	4
96	16МП	8	5
97	8МП	8	6
98	Super AMOLED	8	7
99	5.6 дюйм	8	8
100	3000 мАh	8	9
101	200 г	8	10
102	Бармоқ изи сканери	8	11
103	149.2 x 70.6 x 8.4	8	12
104	2	8	13
105	2G, 3G, 4G LTE, GSM	8	14
106	Grey	8	15
137	Android 7.1 Nougat (7.1.1)	11	1
78	2.2ГГц + 1.6ГГц	7	2
93	2.2ГГц + 1.6ГГц	8	2
107	Android 7.1 Nougat (7.1.1)	9	1
108	2.2ГГц + 1.6ГГц	9	2
109	32ГБ	9	3
110	4ГБ	9	4
111	16МП	9	5
112	8МП	9	6
113	Super AMOLED	9	7
114	6.0 дюйм	9	8
115	3500 mAh	9	9
116	191 г	9	10
117	Бармоқ изи сканери	9	11
118	159.9 x 75.7 x 8.3	9	12
119	2	9	13
120	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	9	14
121	black	9	15
122	Android 7.1 Nougat (7.1.1)	10	1
123	2.2ГГц + 1.6ГГц	10	2
124	32ГБ	10	3
125	4ГБ	10	4
126	16МП	10	5
127	8МП	10	6
128	Super AMOLED	10	7
129	6.0 дюйм	10	8
130	3500 mAh	10	9
131	191 г	10	10
132	Бармоқ изи сканери	10	11
133	159.9 x 75.7 x 8.3	10	12
134	2	10	13
135	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	10	14
136	Gold	10	15
138	2.2ГГц + 1.6ГГц	11	2
139	32ГБ	11	3
140	4ГБ	11	4
141	16МП	11	5
142	8МП	11	6
143	Super AMOLED	11	7
144	6.0 дюйм	11	8
145	3500 mAh	11	9
146	191 г	11	10
147	Бармоқ изи сканери	11	11
148	159.9 x 75.7 x 8.3	11	12
149	2	11	13
150	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	11	14
151	Grey	11	15
152	Android	12	1
153	1.6ГГц	12	2
154	16 ГБ	12	3
155	2 ГБ	12	4
156	13МП	12	5
157	8МП	12	6
158	Super AMOLED	12	7
159	4.7 дюйм	12	8
160	2350mAh	12	9
161	138 г	12	10
162	Бармоқ изи сканери	12	11
163	135.4 x 66.2 x 7.9	12	12
164	2	12	13
165	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	12	14
166	Black	12	15
167	Android	13	1
168	1.6ГГц	13	2
169	16 ГБ	13	3
170	2 ГБ	13	4
171	13МП	13	5
172	8МП	13	6
173	Super AMOLED	13	7
174	4.7 дюйм	13	8
175	2350mAh	13	9
176	138 г	13	10
177	Бармоқ изи сканери	13	11
178	135.4 x 66.2 x 7.9	13	12
179	2	13	13
180	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	13	14
181	Gold	13	15
182	Android 7.1	14	1
183	1.8 ГГц	14	2
184	16 Гб	14	3
185	2 Гб	14	4
186	12 Мп	14	5
187	5 Мп, 1080p	14	6
188	IPS	14	7
189	5.7 дюйм	14	8
190	3300 mAh	14	9
191	157 г	14	10
192	Бармоқ изи сканери	14	11
193	151,8х72,8х7,7 мм	14	12
194	2	14	13
195	GSM, 3G, 4G (LTE)	14	14
196	Black	14	15
197	Android	15	1
198	1,9 ГГц	15	2
199	32 ГБ	15	3
200	3 ГБ	15	4
201	16 Мп	15	5
202	16Мп	15	6
203	Super AMOLED	15	7
204	5.2 дюйм	15	8
205	3000 mAh	15	9
206	159 г	15	10
207	Бармоқ изи сканери	15	11
208	146.1 x 71.4 x 7.9	15	12
209	2	15	13
210	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	15	14
211	Black	15	15
212	Android	16	1
213	1,9 ГГц	16	2
214	32 ГБ	16	3
215	3 ГБ	16	4
216	16 Мп	16	5
217	16Мп	16	6
218	Super AMOLED	16	7
219	5.2 дюйм	16	8
220	3000 mAh	16	9
221	159 г	16	10
222	Бармоқ изи сканери	16	11
223	146.1 x 71.4 x 7.9	16	12
224	2	16	13
225	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	16	14
226	Gold	16	15
227	Android 7.1.2	17	1
228	Snapdragon 450, 1.8 ГГц	17	2
229	32 Гб	17	3
230	3 Гб	17	4
231	12 МП	17	5
232	5 МП	17	6
233	рангли, сенсорли	17	7
234	5.7 дюйм	17	8
235	3300 мАh	17	9
236	157 г	17	10
237	Бармоқ изи сканери	17	11
238	151,8 х 72,8 х 7,7	17	12
239	2	17	13
240	GSM 900/1800/1900, 3G, 4G LTE, LTE-A	17	14
241	Black	17	15
242	Android	18	1
243	1.6 ГГц	18	2
244	16 ГБ	18	3
245	3 ГБ	18	4
246	13 Мп	18	5
247	5 Мп	18	6
248	Super AMOLED	18	7
249	5.5 дюйм	18	8
250	3300mAh	18	9
251	172 г	18	10
252	Бармоқ изи сканери	18	11
253	151.5 x 74.1 x 7.3	18	12
254	2	18	13
255	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	18	14
256	Black	18	15
257	Android 7.1.2	19	1
258	Snapdragon 450, 1.8 ГГц	19	2
259	32 Гб	19	3
260	3 Гб	19	4
261	12 МП	19	5
262	5 МП	19	6
263	рангли, сенсорли	19	7
264	5.7 дюйм	19	8
265	3300 mAh	19	9
266	157 г	19	10
267	Бармоқ изи сканери	19	11
268	151,8 х 72,8 х 7,7	19	12
269	2	19	13
270	GSM 900/1800/1900, 3G, 4G LTE, LTE-A	19	14
271	Gold	19	15
272	Android	20	1
273	1.6 ГГц	20	2
274	16 ГБ	20	3
275	3 ГБ	20	4
276	13 Мп	20	5
277	5 Мп	20	6
278	Super AMOLED	20	7
279	5.5 дюйм	20	8
280	3300mAh	20	9
281	172 г	20	10
282	Бармоқ изи сканери	20	11
283	151.5 x 74.1 x 7.3	20	12
284	2	20	13
285	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	20	14
286	Gold	20	15
287	Android 7.0 Nougat	21	1
288	Snapdragon 625, 2 ГГц	21	2
289	64 Гб	21	3
290	4 Гб	21	4
291	12 МП	21	5
292	5 МП	21	6
293	IPS	21	7
294	5.99 дюйм	21	8
295	4000 mAh	21	9
296	179,5 г	21	10
297	Бармоқ изи сканери	21	11
298	158,8 х 75,45 х 8,05 мм	21	12
299	2	21	13
300	GSM, 3G, 4G (LTE)	21	14
301	Black	21	15
302	Android	22	1
303	1.4 ГГц	22	2
304	8 ГБ	22	3
305	1,5 ГБ	22	4
306	8 Мп	22	5
307	5 Мп	22	6
308	PLS TFT LCD	22	7
309	5 дюйм	22	8
310	2600 mAh	22	9
311	160 г	22	10
312	144.8 x 72.1 x 8.9	22	12
313	2	22	13
314	2G GSM, 3G WCDMA, 4G LTE FDD	22	14
315	Black	22	15
316	Android	23	1
317	1.4 ГГц	23	2
318	8 ГБ	23	3
319	1,5 ГБ	23	4
320	8 Мп	23	5
321	5 Мп	23	6
322	PLS TFT LCD	23	7
323	5 дюйм	23	8
324	2600 mAh	23	9
325	160 г	23	10
326	144.8 x 72.1 x 8.9	23	12
327	2	23	13
328	2G GSM, 3G WCDMA, 4G LTE FDD	23	14
329	Gold	23	15
330	Android 7.0 Nougat	24	1
331	Snapdragon 625, 2 ГГц	24	2
332	64 Гб	24	3
333	4 Гб	24	4
334	12 МП	24	5
335	5 МП	24	6
336	IPS	24	7
337	5.99 дюйм	24	8
338	4000 mAh	24	9
339	179,5 г	24	10
340	Бармоқ изи сканери	24	11
341	158,8 х 75,45 х 8,05 мм	24	12
342	2	24	13
343	Snapdragon 625, 2 ГГц	24	14
344	Gold	24	15
345	Android 7.1.1	25	1
346	2 ГГц	25	2
347	64 Гб	25	3
348	4 Гб	25	4
349	12 Мп + 12 Мп	25	5
350	5 MP, f/2.0	25	6
351	IPS	25	7
352	5.5дюйм	25	8
353	3080 mAh	25	9
354	165 г	25	10
355	Бармоқ изи сканери	25	11
356	155.4×75.8×7.3 мм	25	12
357	2	25	13
358	GSM, 3G, 4G (LTE)	25	14
359	Black	25	15
360	Android 7.1.1	26	1
361	2 ГГц	26	2
362	64 Гб	26	3
363	4 Гб	26	4
364	12 Мп + 12 Мп	26	5
365	5 MP, f/2.0	26	6
366	IPS	26	7
367	5.5дюйм	26	8
368	3080 mAh	26	9
369	165 г	26	10
370	Бармоқ изи сканери	26	11
371	155.4×75.8×7.3 мм	26	12
372	2	26	13
373	GSM, 3G, 4G (LTE)	26	14
374	Gold	26	15
375	Android	27	1
376	1.4 ГГц	27	2
377	16 ГБ	27	3
378	2 ГБ	27	4
379	13 Мп	27	5
380	5 Мп	27	6
381	PLS TFT LCD	27	7
382	5 дюйм	27	8
383	2400mAh	27	9
384	143 г	27	10
385	Бармоқ изи сканери	27	11
386	142.8 x 69.5 x 8.1	27	12
387	2	27	13
388	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	27	14
389	Black	27	15
390	Android	28	1
391	1.4 ГГц	28	2
392	16 ГБ	28	3
393	2 ГБ	28	4
394	13 Мп	28	5
395	5 Мп	28	6
396	PLS TFT LCD	28	7
397	5 дюйм	28	8
398	2400mAh	28	9
399	143 г	28	10
400	Бармоқ изи сканери	28	11
401	142.8 x 69.5 x 8.1	28	12
402	2	28	13
403	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	28	14
404	Gold	28	15
405	Android 7.1.2	29	1
406	Snapdragon 425, 1.4 ГГц, 4 та	29	2
407	16 Гб	29	3
408	2 Гб	29	4
409	13 МП	29	5
410	5 МП	29	6
411	IPS	29	7
412	5 дюйм	29	8
413	3000 мАч	29	9
414	137 г	29	10
415	Бармоқ изи сканери	29	11
416	140 x 70 x 8 мм	29	12
417	2	29	13
418	2G 3G 4G(LTE)	29	14
419	Black	29	15
420	Android	30	1
421	2,3 ГГц	30	2
422	64 ГБ	30	3
423	4 ГБ	30	4
424	12 Мп	30	5
425	8 Мп	30	6
426	Super AMOLED	30	7
427	5.8 дюйм	30	8
428	3000 mAh	30	9
429	155 г	30	10
430	Бармоқ изи сканери	30	11
431	148.9 x 68.1 x 8.0	30	12
432	2	30	13
433	GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE	30	14
434	Black	30	15
435	Android	31	1
436	2,3 ГГц	31	2
437	64 ГБ	31	3
438	4 ГБ	31	4
439	12 Мп	31	5
440	8 Мп	31	6
441	Super AMOLED	31	7
442	5.8 дюйм	31	8
443	3000 mAh	31	9
444	155 г	31	10
445	Бармоқ изи сканери	31	11
446	148.9 x 68.1 x 8.0	31	12
447	2	31	13
448	GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE	31	14
449	Gold	31	15
450	Android	32	1
451	2,3 ГГц	32	2
452	64 ГБ	32	3
453	4 ГБ	32	4
454	12 Мп	32	5
455	8 Мп	32	6
456	Super AMOLED	32	7
457	5.8 дюйм	32	8
458	3000 mAh	32	9
459	155 г	32	10
460	Бармоқ изи сканери	32	11
461	148.9 x 68.1 x 8.0	32	12
462	2	32	13
463	GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE	32	14
464	Red	32	15
465	Android 7.1.2	33	1
466	Snapdragon 425, 1.4 ГГц, 4 та	33	2
467	32 ГБ	33	3
468	3 ГБ	33	4
469	13 МП	33	5
470	5 МП	33	6
471	IPS	33	7
472	5 дюйм	33	8
473	3000 мАч	33	9
474	137 г	33	10
475	140 x 70 x 8 мм	33	12
476	2	33	13
477	2G 3G 4G(LTE)	33	14
478	Black	33	15
479	Android	34	1
480	2,8 ГГц	34	2
481	64 ГБ	34	3
482	4 ГБ	34	4
483	12 Мп	34	5
484	8 Мп	34	6
485	Super AMOLED	34	7
486	5.8 дюйм	34	8
487	3000 mAh	34	9
488	163 г	34	10
489	Бармоқ изи сканери	34	11
490	147,7x68,7x8,5	34	12
491	2	34	13
492	LTE: FDD, GPRS, GSM	34	14
493	Black	34	15
494	Android	35	1
495	Qualcomm Snapdragon 450, 1.8 ГГц	35	2
496	16 ГБ	35	3
497	2 Гб	35	4
498	12 МП	35	5
499	5 МП	35	6
500	IPS	35	7
501	5.7 дюйм	35	8
502	3300 mAh	35	9
503	157 г	35	10
504	Бармоқ изи сканери	35	11
505	151.8 x 72.8 x 7.7 мм	35	12
506	2	35	13
507	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	35	14
508	Black	35	15
509	Android	36	1
510	2,8 ГГц	36	2
511	64 ГБ	36	3
512	4 ГБ	36	4
513	12 Мп	36	5
514	8 Мп	36	6
515	Super AMOLED	36	7
516	5.8 дюйм	36	8
517	3000 mAh	36	9
518	163 г	36	10
519	Бармоқ изи сканери	36	11
520	147,7x68,7x8,5	36	12
521	2	36	13
522	LTE: FDD, GPRS, GSM	36	14
524	Android	37	1
525	2,8 ГГц	37	2
526	64 ГБ	37	3
527	4 ГБ	37	4
528	12 Мп	37	5
529	8 Мп	37	6
530	Super AMOLED	37	7
531	5.8 дюйм	37	8
532	3000 mAh	37	9
533	163 г	37	10
534	Бармоқ изи сканери	37	11
535	147,7x68,7x8,5	37	12
536	2	37	13
537	LTE: FDD, GPRS, GSM	37	14
538	Grey	37	15
539	Android	38	1
540	Qualcomm Snapdragon 450, 1.8 ГГц	38	2
541	16 ГБ	38	3
542	2 Гб	38	4
543	12 МП	38	5
544	5 МП	38	6
545	IPS	38	7
546	5.7 дюйм	38	8
547	3300 мАч	38	9
548	157 г	38	10
549	Бармоқ изи сканери	38	11
550	151.8 x 72.8 x 7.7 мм	38	12
551	2	38	13
552	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	38	14
553	Gold	38	15
554	Android	39	1
555	2,7 ГГц	39	2
556	64 ГБ	39	3
557	6 ГБ	39	4
558	12 Мп	39	5
559	8 Мп	39	6
560	Super AMOLED	39	7
561	6.2 дюйм	39	8
562	3500mAh	39	9
563	189 г	39	10
564	Бармоқ изи сканери	39	11
565	158.1 x 73.8 x 8.5	39	12
566	2	39	13
567	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	39	14
568	Black	39	15
569	Android 7.1.2	40	1
570	Snapdragon 450, 1.8 ГГц, 8 та	40	2
571	32 Гб	40	3
572	3 Гб	40	4
573	12 МП	40	5
574	5 МП	40	6
575	IPS	40	7
576	5.7 дюйм	40	8
577	3300 мАч	40	9
578	157 г	40	10
579	Бармоқ изи сканери	40	11
580	151.8 x 72.8 x 7.7 мм	40	12
581	2	40	13
582	2G 3G 4G(LTE)	40	14
583	Black	40	15
584	Android 7.1.2	41	1
585	Snapdragon 450, 1.8 ГГц, 8 та	41	2
586	32 ГБ	41	3
587	3 Гб	41	4
588	12 МП	41	5
589	5 МП	41	6
590	IPS	41	7
591	5.7 дюйм	41	8
592	3300 мАч	41	9
593	157 г	41	10
594	Бармоқ изи сканери	41	11
595	151.8 x 72.8 x 7.7 мм	41	12
596	2	41	13
597	2G 3G 4G(LTE)	41	14
598	Gold	41	15
599	Android	42	1
600	2,7 ГГц	42	2
601	64 ГБ	42	3
602	6 ГБ	42	4
603	12 Мп	42	5
604	8 Мп	42	6
605	Super AMOLED	42	7
606	6.2 дюйм	42	8
607	3500mAh	42	9
608	189 г	42	10
609	Бармоқ изи сканери	42	11
610	158.1 x 73.8 x 8.5	42	12
611	2	42	13
612	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	42	14
613	Grey	42	15
614	Android 7.1.2	43	1
615	Snapdragon 625, 2 ГГц, 8 та	43	2
616	32 ГБ	43	3
617	3 Гб	43	4
618	12 МП	43	5
619	5 МП	43	6
620	IPS	43	7
621	5.99 дюйм	43	8
622	4000 мАч	43	9
623	180 г	43	10
624	Бармоқ изи сканери	43	11
625	158.5 x 75.45 x 8.05 мм	43	12
626	2	43	13
627	GSM 900/1800/1900 3G 4G LTE	43	14
628	Gold	43	15
629	Android 7.1.2	44	1
630	Snapdragon 625, 2 ГГц, 8 та	44	2
631	32 ГБ	44	3
632	3 Гб	44	4
633	12 МП	44	5
634	5 МП	44	6
635	IPS	44	7
636	5.99 дюйм	44	8
637	4000 мАч	44	9
638	180 г	44	10
639	Бармоқ изи сканери	44	11
640	158.5 x 75.45 x 8.05 мм	44	12
641	2	44	13
642	GSM 900/1800/1900 3G 4G LTE	44	14
643	Black	44	15
644	Android 7.1.2	45	1
645	Snapdragon 625, 2 ГГц, 8 та	45	2
646	64 Гб	45	3
647	4 Гб	45	4
648	12 МП	45	5
649	5 МП	45	6
650	IPS	45	7
651	5.99 дюйм	45	8
653	180 г	45	10
654	Бармоқ изи сканери	45	11
655	158.5 x 75.45 x 8.05 мм	45	12
656	2	45	13
657	GSM 900/1800/1900, 3G, 4G LTE	45	14
658	Gold	45	15
659	Android 7.1.2	46	1
660	Snapdragon 625, 2 ГГц, 8 та	46	2
661	64 Гб	46	3
662	4 Гб	46	4
663	12 МП	46	5
664	5 МП	46	6
665	IPS	46	7
666	5.99 дюйм	46	8
667	3300 mAh	46	9
668	180 г	46	10
669	Бармоқ изи сканери	46	11
670	158.5 x 75.45 x 8.05	46	12
671	2	46	13
672	GSM 900/1800/1900, 3G, 4G LTE	46	14
673	Black	46	15
652	4000 mAh	45	9
674	Android 8.1 Oreo	47	1
675	Snapdragon 625, 2 ГГц, 8 та	47	2
676	32 Гб	47	3
677	3 Гб	47	4
678	12 МП + 5 МП	47	5
679	16 МП	47	6
680	IPS	47	7
681	5.99 дюйм	47	8
682	3080 мАh	47	9
683	170 Г	47	10
684	Бармоқ изи сканери	47	11
685	160.73 x 77.26 x 8.1 мм	47	12
686	2	47	13
687	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	47	14
688	Grey	47	15
689	Android	48	1
690	2,8 ГГц	48	2
691	64 ГБ	48	3
692	6 ГБ	48	4
693	12 Мп	48	5
694	8 Мп	48	6
695	Super AMOLED	48	7
696	6.2 дюйм	48	8
697	3500mAh	48	9
698	189 г	48	10
699	Бармоқ изи сканери	48	11
700	158.1 x 73.8 x 8.5	48	12
701	2	48	13
702	2G, 3G, 4G LTE, GSM	48	14
703	Black	48	15
704	Android 8.1 Oreo	49	1
705	Snapdragon 625, 2 ГГц, 8 та	49	2
706	32 Гб	49	3
707	3 Гб	49	4
708	12 МП + 5 МП	49	5
709	16 МП	49	6
710	IPS	49	7
711	5.99 дюйм	49	8
712	3080 mAh	49	9
713	170 Г	49	10
714	Бармоқ изи сканери	49	11
715	160.73 x 77.26 x 8.1 мм	49	12
716	2	49	13
717	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	49	14
718	Gold	49	15
719	Android	50	1
720	2,8 ГГц	50	2
721	64 ГБ	50	3
722	6 ГБ	50	4
723	12 Мп	50	5
724	8 Мп	50	6
725	Super AMOLED	50	7
726	6.2 дюйм	50	8
727	3500mAh	50	9
728	189 г	50	10
729	Бармоқ изи сканери	50	11
730	158.1 x 73.8 x 8.5	50	12
731	2	50	13
732	2G, 3G, 4G LTE, GSM	50	14
733	Grey	50	15
734	Android 8.1 Oreo	51	1
735	Snapdragon 625, 2 ГГц, 8 та	51	2
736	64 Гб	51	3
737	4 Гб	51	4
738	12 МП + 5 МП	51	5
739	16 МП	51	6
740	IPS	51	7
741	5.99 дюйм	51	8
742	3080 mAh	51	9
743	170 Г	51	10
744	Бармоқ изи сканери	51	11
745	160.73 x 77.26 x 8.1 мм	51	12
746	2	51	13
747	GSM, 3G, 4G (LTE)	51	14
748	Grey	51	15
749	Android	52	1
750	2,8 ГГц	52	2
751	64 ГБ	52	3
752	6 ГБ	52	4
753	12 Мп	52	5
754	8 Мп	52	6
755	Super AMOLED	52	7
756	6.2 дюйм	52	8
757	3500mAh	52	9
758	189 г	52	10
759	Бармоқ изи сканери	52	11
760	158.1 x 73.8 x 8.5	52	12
761	2	52	13
762	2G, 3G, 4G LTE, GSM	52	14
763	Purple	52	15
523	Purple	36	15
764	Android 8.1 Oreo	53	1
765	Snapdragon 625, 2 ГГц, 8 та	53	2
766	64 Гб	53	3
767	4 Гб	53	4
768	12 МП + 5 МП	53	5
769	16 МП	53	6
770	IPS	53	7
771	5.99 дюйм	53	8
772	3080 mAh	53	9
773	170 Г	53	10
774	Бармоқ изи сканери	53	11
775	160.73 x 77.26 x 8.1 мм	53	12
776	2	53	13
777	GSM, 3G, 4G (LTE)	53	14
778	Gold	53	15
779	Android	54	1
780	1.2ГГц	54	2
781	8 ГБ	54	3
782	0.75 ГБ	54	4
783	5.0 Мп	54	5
784	2 Мп	54	6
785	TFT	54	7
786	4 дюйм	54	8
787	1500 mAh	54	9
788	123 г	54	10
789	121.6 x 63.1 x 10.8	54	12
790	2	54	13
791	2G GSM, 3G WCDMA	54	14
792	Black	54	15
793	Android 7.1.2 (Nougat)	55	1
794	Snapdragon 636, 1.8 ГГц, 8 та	55	2
795	32 Гб	55	3
796	3 Гб	55	4
797	12 МП + 5 МП	55	5
798	13МП	55	6
799	IPS	55	7
800	5.99 дюйм	55	8
801	4000 mAh	55	9
802	181 г	55	10
803	Бармоқ изи сканери	55	11
804	158.6 x 75.4 x 8.1 мм	55	12
805	2	55	13
806	2G/3G/4G(LTE)	55	14
807	Black	55	15
808	Android	56	1
809	1.3ГГц	56	2
810	4 ГБ	56	3
811	512 МБ	56	4
812	5.0 Мп	56	5
813	2 Мп	56	6
814	Super AMOLED	56	7
815	4.3 дюйм	56	8
816	1800 mAh	56	9
817	128 г	56	10
818	67x137x10	56	12
819	1	56	13
820	2G (EDGE), 3G (WCDMA/UMTS)	56	14
821	Black	56	15
822	Android 7.1.2 (Nougat)	57	1
823	Snapdragon 636, 1.8 ГГц, 8 та	57	2
824	32 Гб	57	3
825	3 Гб	57	4
826	12 МП + 5 МП	57	5
827	13МП	57	6
828	IPS	57	7
829	5.99 дюйм	57	8
830	4000 mAh	57	9
831	181 г	57	10
832	Бармоқ изи сканери	57	11
833	158.6 x 75.4 x 8.1 мм	57	12
834	2	57	13
835	2G/3G/4G(LTE)	57	14
836	Gold	57	15
837	Android	58	1
838	1.3ГГц	58	2
839	4 ГБ	58	3
840	512 МБ	58	4
841	5 МП	58	5
842	2 Мп	58	6
843	Super AMOLED	58	7
844	4.3 дюйм	58	8
845	1800 mAh	58	9
846	128 г	58	10
847	67x137x10	58	12
848	1	58	13
849	2G (EDGE), 3G (WCDMA/UMTS)	58	14
850	White	58	15
851	Android 8.1 Oreo	59	1
852	Snapdragon 636, 1.8 ГГц, 8 та	59	2
853	64 Гб	59	3
854	6 Гб	59	4
855	12 МП + 5 МП	59	5
856	13МП	59	6
857	IPS	59	7
858	5.99 дюйм	59	8
859	4000 mAh	59	9
860	181 г	59	10
861	Бармоқ изи сканери	59	11
862	158.6 x 75.4 x 8.1 мм	59	12
863	2	59	13
864	2G/3G/4G(LTE)	59	14
865	Black	59	15
866	Android 7.1	60	1
867	"Snapdragon 835,   2.45 ГГц + 1.9 ГГц, 8 та"	60	2
868	64 Гб	60	3
869	6 Гб	60	4
870	12 Мп + 12 Мп	60	5
871	8 МП	60	6
872	IPS	60	7
873	5.15 дюйм	60	8
874	3350 мАh	60	9
875	168 г	60	10
876	Бармоқ изи сканери	60	11
877	145.2 x 70.5 x 7.5 мм	60	12
878	2	60	13
879	2G (EDGE), 3G(WCDMA/UMTS), 4G (LTE)	60	14
880	Black	60	15
881	Android	61	1
882	1.3 ГГц	61	2
883	8 Гб	61	3
884	1 Гб	61	4
885	5 Мп	61	5
886	2 Мп	61	6
887	Super AMOLED	61	7
888	4.7 дюйм	61	8
889	2000 mAh	61	9
890	129 г	61	10
891	136.5 x 69.0 x 8.4	61	12
892	2	61	13
893	GSM, 3G	61	14
894	Black	61	15
895	Android	62	1
896	1.3 ГГц	62	2
897	8 ГБ	62	3
898	1 Гб	62	4
899	5 Мп	62	5
900	2 Мп	62	6
901	Super AMOLED	62	7
902	4.7 дюйм	62	8
903	2000 mAh	62	9
904	129 г	62	10
905	136.5 x 69.0 x 8.4	62	12
906	2	62	13
907	GSM, 3G	62	14
908	Gold	62	15
\.


--
-- Name: store_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_specification_id_seq', 908, true);


--
-- Data for Name: store_specificationtype; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_specificationtype (id, name) FROM stdin;
1	Операцион тизим
2	Процессор
3	Ички хотира ҳажми
4	Тезкор хотира ҳажми
5	Асосий камера
6	Олд камера
7	Дисплей тури
8	Дисплей диагонали
9	Аккумулятор сиғими
10	Вазни
11	Қўшимча функциялари
12	Ўлчамлари(Б x К x Ч, мм)
13	SIM-карта сони
14	Алоқа стандартлари
15	Ранги
\.


--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_specificationtype_id_seq', 15, true);


--
-- Name: app_brand app_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_brand
    ADD CONSTRAINT app_brand_pkey PRIMARY KEY (id);


--
-- Name: app_category app_category_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_pkey PRIMARY KEY (id);


--
-- Name: app_slider app_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_slider
    ADD CONSTRAINT app_slider_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_productimage store_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_productimage
    ADD CONSTRAINT store_productimage_pkey PRIMARY KEY (id);


--
-- Name: store_review store_review_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_review
    ADD CONSTRAINT store_review_pkey PRIMARY KEY (id);


--
-- Name: store_specification store_specification_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specification
    ADD CONSTRAINT store_specification_pkey PRIMARY KEY (id);


--
-- Name: store_specificationtype store_specificationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specificationtype
    ADD CONSTRAINT store_specificationtype_pkey PRIMARY KEY (id);


--
-- Name: app_brand_category_id_a3caec35; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_brand_category_id_a3caec35 ON public.app_brand USING btree (category_id);


--
-- Name: app_category_level_bfbc3510; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_level_bfbc3510 ON public.app_category USING btree (level);


--
-- Name: app_category_lft_a56c1fda; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_lft_a56c1fda ON public.app_category USING btree (lft);


--
-- Name: app_category_parent_id_8ce0344c; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_parent_id_8ce0344c ON public.app_category USING btree (parent_id);


--
-- Name: app_category_rght_cf0164d7; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_rght_cf0164d7 ON public.app_category USING btree (rght);


--
-- Name: app_category_slug_b059cea8; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_slug_b059cea8 ON public.app_category USING btree (slug);


--
-- Name: app_category_slug_b059cea8_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_slug_b059cea8_like ON public.app_category USING btree (slug varchar_pattern_ops);


--
-- Name: app_category_tree_id_d2e0173f; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_category_tree_id_d2e0173f ON public.app_category USING btree (tree_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: store_product_brand_id_ec9e66ab; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_product_brand_id_ec9e66ab ON public.store_product USING btree (brand_id);


--
-- Name: store_product_category_id_574bae65; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_product_category_id_574bae65 ON public.store_product USING btree (category_id);


--
-- Name: store_product_slug_6de8ee4b; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_product_slug_6de8ee4b ON public.store_product USING btree (slug);


--
-- Name: store_product_slug_6de8ee4b_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_product_slug_6de8ee4b_like ON public.store_product USING btree (slug varchar_pattern_ops);


--
-- Name: store_productimage_product_id_e50e4046; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_productimage_product_id_e50e4046 ON public.store_productimage USING btree (product_id);


--
-- Name: store_review_author_id_2c9d22fe; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_review_author_id_2c9d22fe ON public.store_review USING btree (author_id);


--
-- Name: store_review_product_id_abc413b2; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_review_product_id_abc413b2 ON public.store_review USING btree (product_id);


--
-- Name: store_specification_product_id_b56e860b; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_specification_product_id_b56e860b ON public.store_specification USING btree (product_id);


--
-- Name: store_specification_specification_type_id_02b31dc0; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_specification_specification_type_id_02b31dc0 ON public.store_specification USING btree (specification_type_id);


--
-- Name: app_brand app_brand_category_id_a3caec35_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_brand
    ADD CONSTRAINT app_brand_category_id_a3caec35_fk_app_category_id FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_category app_category_parent_id_8ce0344c_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_category
    ADD CONSTRAINT app_category_parent_id_8ce0344c_fk_app_category_id FOREIGN KEY (parent_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product store_product_brand_id_ec9e66ab_fk_app_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_brand_id_ec9e66ab_fk_app_brand_id FOREIGN KEY (brand_id) REFERENCES public.app_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product store_product_category_id_574bae65_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_category_id_574bae65_fk_app_category_id FOREIGN KEY (category_id) REFERENCES public.app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_productimage store_productimage_product_id_e50e4046_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_productimage
    ADD CONSTRAINT store_productimage_product_id_e50e4046_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_review store_review_author_id_2c9d22fe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_review
    ADD CONSTRAINT store_review_author_id_2c9d22fe_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_review store_review_product_id_abc413b2_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_review
    ADD CONSTRAINT store_review_product_id_abc413b2_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_specification store_specification_product_id_b56e860b_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specification
    ADD CONSTRAINT store_specification_product_id_b56e860b_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_specification store_specification_specification_type_i_02b31dc0_fk_store_spe; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_specification
    ADD CONSTRAINT store_specification_specification_type_i_02b31dc0_fk_store_spe FOREIGN KEY (specification_type_id) REFERENCES public.store_specificationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

