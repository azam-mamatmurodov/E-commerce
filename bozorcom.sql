--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

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
-- Name: app_content; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.app_content (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    body text NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.app_content OWNER TO bozorcom;

--
-- Name: app_content_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.app_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_content_id_seq OWNER TO bozorcom;

--
-- Name: app_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.app_content_id_seq OWNED BY public.app_content.id;


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
-- Name: app_content id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_content ALTER COLUMN id SET DEFAULT nextval('public.app_content_id_seq'::regclass);


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
4	Meizu	21
5	Huawei	22
6	LG	20
\.


--
-- Name: app_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_brand_id_seq', 6, true);


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
-- Data for Name: app_content; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.app_content (id, title, body, slug) FROM stdin;
\.


--
-- Name: app_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_content_id_seq', 1, false);


--
-- Data for Name: app_slider; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.app_slider (id, image) FROM stdin;
4	sliders/2528c9d8f11c8d86d9bc84cbfc53ee38.jpg
3	sliders/0673c41ce20e250a94a4584a149e0e16.jpg
2	sliders/7b16aaf18d76c863b527ea19d77ae32b.jpg
1	sliders/4_2.jpg
\.


--
-- Name: app_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_slider_id_seq', 4, true);


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
57	Can add content	15	add_content
58	Can change content	15	change_content
59	Can delete content	15	delete_content
60	Can view content	15	view_content
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$SWix4a9g86Dx$xF0oCkdgIlCkgBa3sArolCHnu6ZIRWeMecvmnrtyy24=	2018-12-17 12:02:27.038955+00	t	admin			azam.mamatmurodov@gmail.com	t	t	2018-12-02 13:02:49.398795+00
2	pbkdf2_sha256$120000$dn8yEjFumgbb$+BmUaLQb2ueo5PZ3zW7O1E7/RSaYMZHLI1lptExTM3Y=	2018-12-17 14:54:43.155071+00	f	moderator	Bozorcom	Moderator	info@bozor.com	t	t	2018-12-02 13:15:17+00
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
102	2018-12-07 04:20:48.658143+00	60	Xiaomi Mi 6 6/64GB Black	2	[{"changed": {"fields": ["image"]}}]	10	2
103	2018-12-07 04:25:13.23924+00	60	Xiaomi Mi 6 6/64GB Black	2	[{"changed": {"fields": ["image"]}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}]	10	2
104	2018-12-11 09:29:32.855652+00	63	iPhone X 64GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic,  4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
105	2018-12-11 09:34:18.362686+00	64	iPhone X 256GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
106	2018-12-11 09:36:36.985067+00	65	Samsung Galaxy J250M (J2 Pro) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "153 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72.3 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
107	2018-12-11 09:38:12.684013+00	66	iPhone X 256GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
108	2018-12-11 09:40:07.547789+00	67	Samsung Galaxy J250M (J2 Pro) gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "153 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72.3 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
109	2018-12-11 09:42:45.803126+00	68	iPhone SE 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A9 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 M9, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438 IPS, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "113 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "123.8x58.6x7.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
110	2018-12-11 09:46:41.364784+00	69	iPhone 6 32GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 M8, 1.4 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1810 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.1 x 67 x 6.9 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
111	2018-12-11 09:53:03.113435+00	70	iPhone 7 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
112	2018-12-11 09:55:45.21151+00	71	Samsung Galaxy J320 (J3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8.0 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5.0 M\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "138\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "142.7 x 70.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
113	2018-12-11 09:58:02.781486+00	72	iPhone 7 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
114	2018-12-11 10:01:42.823033+00	73	iPhone 7 32GB RoseGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "RoseGold"}}]	10	2
115	2018-12-11 10:05:39.394143+00	74	iPhone 7 128GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
116	2018-12-11 10:09:09.980588+00	75	iPhone 7 128GB RoseGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "RoseGold"}}]	10	2
117	2018-12-11 10:12:51.971673+00	76	iPhone 7 128GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
118	2018-12-11 10:17:03.738802+00	77	iPhone 7 128GB\tRed	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
119	2018-12-11 10:21:55.087523+00	78	iPhone 7 plus 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2900 mAh"}}, {"added": {"name": "specification", "object": "188 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,2\\u044577,9\\u04457,3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
120	2018-12-11 10:25:38.595289+00	79	iPhone 7 plus 32GB\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2900 mAh"}}, {"added": {"name": "specification", "object": "188 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
121	2018-12-11 10:30:38.906962+00	80	iPhone 8  64GB\tGrey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
122	2018-12-11 10:33:48.89376+00	81	iPhone 8  64GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
123	2018-12-11 10:34:24.638598+00	82	Samsung Galaxy J701 (J7) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0433"}}, {"added": {"name": "specification", "object": "152.4 x 78.6 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
124	2018-12-11 10:36:35.041852+00	83	iPhone 8  64GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
125	2018-12-11 10:37:20.169479+00	84	Samsung Galaxy J701 (J7) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0433"}}, {"added": {"name": "specification", "object": "152.4 x 78.6 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
126	2018-12-11 10:39:14.759409+00	85	iPhone 8  64GB Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
127	2018-12-11 10:40:38.181294+00	86	Samsung Galaxy J330 (J3) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400 mAh"}}, {"added": {"name": "specification", "object": "142 \\u0433"}}, {"added": {"name": "specification", "object": "143.2 x 70.3 x 8.2"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
128	2018-12-11 10:43:25.584571+00	87	Samsung Galaxy J330 (J3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "142 \\u0433"}}, {"added": {"name": "specification", "object": "143.2 x 70.3 x 8.2"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
129	2018-12-11 10:44:09.649305+00	88	iPhone 8  256GB\tGrey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tGrey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
130	2018-12-11 10:46:51.360704+00	89	Samsung Galaxy  J530 (J5 ) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J530 (J5 ) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J530 (J5 ) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J530 (J5 ) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J530 (J5 ) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J530 (J5 ) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "146.2 x 71.3 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
131	2018-12-11 10:47:42.954317+00	90	iPhone 8  256GB\tRed	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 8  256GB\\tRed"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
132	2018-12-11 10:49:37.693311+00	91	Samsung Galaxy J530 (J5 ) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J530 (J5 ) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J530 (J5 ) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J530 (J5 ) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J530 (J5 ) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J530 (J5 ) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "146.2 x 71.3 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
133	2018-12-11 10:51:25.767327+00	92	iPhone 8  plus 64GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2691 mAh"}}, {"added": {"name": "specification", "object": "202 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.4 \\u0445 78.1 \\u0445 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
134	2018-12-11 10:52:14.586189+00	89	Samsung Galaxy  J530 (J5 ) Black	2	[{"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}]	10	2
135	2018-12-11 10:52:34.978702+00	91	Samsung Galaxy J530 (J5 ) Gold	2	[{"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}]	10	2
136	2018-12-11 10:54:18.864739+00	93	iPhone 8  plus 64GB\tSilver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 64GB\\tSilver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2691 mAh"}}, {"added": {"name": "specification", "object": "202 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.4 \\u0445 78.1 \\u0445 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
137	2018-12-11 10:54:37.066815+00	94	Samsung Galaxy  J730 (J7) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J730 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J730 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J730 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J730 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J730 (J7) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3600 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "152.5 x 74.8 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
138	2018-12-11 11:36:03.684637+00	95	Samsung Galaxy J730 (J7) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J730 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J730 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J730 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J730 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J730 (J7) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3600 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "152.5 x 74.8 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
139	2018-12-11 11:36:44.944139+00	96	iPhone 8  plus 256GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2691 mAh"}}, {"added": {"name": "specification", "object": "202 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.4 \\u0445 78.1 \\u0445 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
140	2018-12-11 11:39:26.94157+00	97	iPhone 8  plus 256GB Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  plus 256GB Red"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic + \\u041c11, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2691 mAh"}}, {"added": {"name": "specification", "object": "202 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.4 \\u0445 78.1 \\u0445 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
141	2018-12-11 11:42:20.565719+00	98	Samsung Galaxy N950 Note 8 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "195 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "162.5 x 74.8 x 8.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
142	2018-12-11 11:45:54.361476+00	99	Samsung Galaxy N950 Note 8 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "195 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "162.5 x 74.8 x 8.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
143	2018-12-11 11:48:29.860671+00	100	iPad mini 4 128GB  WiFi+4G Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
144	2018-12-11 11:48:50.625382+00	101	iPad mini 4 128GB  WiFi+4G Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
145	2018-12-11 11:52:22.044226+00	102	iPad mini 4 128GB  WiFi+4G Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
146	2018-12-11 11:52:53.8769+00	103	Samsung Galaxy Tab S3 SM-T825 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.15 \\u0413\\u0413\\u0446, 1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "6000 mAh"}}, {"added": {"name": "specification", "object": "434 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "237.3 x 169.0 x 6.0"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
147	2018-12-11 11:56:29.42087+00	104	Samsung Galaxy Tab S3 SM-T825 Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.15 \\u0413\\u0413\\u0446, 1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "6000 mAh"}}, {"added": {"name": "specification", "object": "434 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "237.3 x 169.0 x 6.0"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
148	2018-12-11 12:03:30.911945+00	105	Samsung Galaxy Tab S2 8.0 [SM-T719] Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446, 1.4\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2.1 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "8.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "267 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "198.6 x 134.8 x 5.6"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
149	2018-12-11 12:08:40.9186+00	106	Samsung Galaxy Tab S2 8.0 [SM-T719] Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446, 1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2.1 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "8.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "267 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "198.6 x 134.8 x 5.6"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
150	2018-12-11 12:13:59.250443+00	107	iPad new wi-fi 2017 32GB\tSilver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
151	2018-12-11 12:14:01.627969+00	108	iPad new wi-fi 2017 32GB\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
152	2018-12-11 12:17:55.14123+00	109	Samsung Galaxy Tab E (SM-T561) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "9.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "495 \\u0433"}}, {"added": {"name": "specification", "object": "241.9 x 149.5 x 8.5"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
153	2018-12-11 12:19:50.370652+00	110	iPad new wi-fi 2017 128GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
154	2018-12-11 12:21:25.363604+00	111	Samsung Galaxy Tab E (SM-T561) Brown	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "9.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "495 \\u0433"}}, {"added": {"name": "specification", "object": "241.9 x 149.5 x 8.5"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Brown"}}]	10	2
155	2018-12-11 12:22:38.265276+00	112	iPad new wi-fi 2017 128GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
156	2018-12-11 12:24:44.212495+00	113	Samsung Galaxy Tab A 8.0 LTE SM-T385 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "364 \\u0433"}}, {"added": {"name": "specification", "object": "212.1 x 124.1 x 8.9"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
157	2018-12-11 12:25:39.743427+00	114	iPad new wi-fi 2017 128GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
158	2018-12-11 12:27:59.906337+00	115	Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "364 \\u0433"}}, {"added": {"name": "specification", "object": "212.1 x 124.1 x 8.9"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
159	2018-12-11 12:31:37.23574+00	116	Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "289 \\u0433"}}, {"added": {"name": "specification", "object": "186.9 x 108.8 x 8.7"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
160	2018-12-11 12:36:21.367925+00	117	Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "289 \\u0433"}}, {"added": {"name": "specification", "object": "186.9 x 108.8 x 8.7"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
161	2018-12-11 12:36:24.913284+00	118	iPad new 4G 2017 32GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new 4G 2017 32GB Grey"}}, {"added": {"name": "product image", "object": "iPad new 4G 2017 32GB Grey"}}, {"added": {"name": "product image", "object": "iPad new 4G 2017 32GB Grey"}}, {"added": {"name": "product image", "object": "iPad new 4G 2017 32GB Grey"}}, {"added": {"name": "product image", "object": "iPad new 4G 2017 32GB Grey"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "32,9 \\u0412\\u0442\\u00b7\\u0447"}}, {"added": {"name": "specification", "object": "478 \\u0433"}}, {"added": {"name": "specification", "object": "240 x 169.5 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "UMTS/HSPA/HSPA+/DC-HSDPA GSM/EDGE"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
162	2018-12-11 12:36:49.288602+00	117	Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver	2	[{"changed": {"name": "specification", "object": "Silver", "fields": ["info"]}}]	10	2
163	2018-12-11 12:41:21.40602+00	4	Meizu	1	[{"added": {}}]	7	2
164	2018-12-11 12:41:49.398833+00	119	Samsung Galaxy Tab A 7 8GB 4G SM-T285 White	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 7 8GB 4G SM-T285 White"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "289 \\u0433"}}, {"added": {"name": "specification", "object": "186.9 x 108.8 x 8.7"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
165	2018-12-17 12:03:04.19575+00	1	Slider object (1)	1	[{"added": {}}]	9	1
166	2018-12-17 12:03:26.705803+00	2	Slider object (2)	1	[{"added": {}}]	9	1
167	2018-12-17 12:03:35.535055+00	3	Slider object (3)	1	[{"added": {}}]	9	1
168	2018-12-17 14:57:47.769344+00	1	Slider object (1)	2	[{"changed": {"fields": ["image"]}}]	9	2
169	2018-12-17 15:00:20.540151+00	4	Slider object (4)	1	[{"added": {}}]	9	2
170	2018-12-17 15:04:08.066367+00	1	Slider object (1)	2	[{"changed": {"fields": ["image"]}}]	9	2
171	2018-12-17 15:06:23.148958+00	3	Slider object (3)	2	[{"changed": {"fields": ["image"]}}]	9	2
172	2018-12-17 15:06:47.738843+00	2	Slider object (2)	2	[{"changed": {"fields": ["image"]}}]	9	2
173	2018-12-18 05:19:51.799631+00	1	Slider object (1)	2	[{"changed": {"fields": ["image"]}}]	9	2
174	2018-12-18 05:24:53.978586+00	4	Slider object (4)	2	[{"changed": {"fields": ["image"]}}]	9	2
175	2018-12-18 05:25:13.671499+00	3	Slider object (3)	2	[{"changed": {"fields": ["image"]}}]	9	2
176	2018-12-18 05:25:27.517+00	2	Slider object (2)	2	[{"changed": {"fields": ["image"]}}]	9	2
177	2018-12-18 07:20:04.606781+00	1	Slider object (1)	2	[{"changed": {"fields": ["image"]}}]	9	2
178	2018-12-19 07:22:03.513964+00	5	Huawei	1	[{"added": {}}]	7	2
179	2018-12-19 07:22:26.548673+00	6	LG	1	[{"added": {}}]	7	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 179, true);


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
15	app	content
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


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
18	app	0002_content	2018-12-15 14:43:04.538636+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


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
cccyyy9uhcbpmdcc0csx6kwjuv79k2an	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2018-12-31 12:02:27.044502+00
132bu6c86azo2sjbz9tau0pokvkau92e	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-31 14:54:43.157264+00
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
61	Samsung Galaxy J200 (J2) Black	1	1_5eUSTcN.jpg	samsung-galaxy-j200-j2-black		1	f	f	f	2	18
62	Samsung Galaxy J200 (J2) Gold	1	1_jFuLaxA.jpg	samsung-galaxy-j200-j2-gold		1	f	f	f	2	18
60	Xiaomi Mi 6 6/64GB Black	1	xiaomi_mi6_664_blk_images_2027581644_Nwo27WH.jpg	xiaomi-mi-6-664gb-black		1	f	f	f	3	17
63	iPhone X 64GB Grey	1	0_WfWAUM7.jpg	iphone-x-64gb-grey		1	f	f	f	1	19
64	iPhone X 256GB Silver	1	0_OO1TAOm.jpg	iphone-x-256gb-silver		1	f	f	f	1	19
65	Samsung Galaxy J250M (J2 Pro) Black	1	1_MUBf7dI.jpg	samsung-galaxy-j250m-j2-pro-black		1	f	f	f	2	18
66	iPhone X 256GB Grey	1	0_macW3cN.jpg	iphone-x-256gb-grey		1	f	f	f	1	19
67	Samsung Galaxy J250M (J2 Pro) gold	1	1_1I1s16r.jpg	samsung-galaxy-j250m-j2-pro-gold		1	f	f	f	2	18
68	iPhone SE 32GB Gold	1	1_y4DRmHa.jpg	iphone-se-32gb-gold		1	f	f	f	1	19
69	iPhone 6 32GB Grey	1	1_vmNlSZa.jpg	iphone-6-32gb-grey		1	f	f	f	1	19
70	iPhone 7 32GB Black	1	0_AxUmjhR.jpg	iphone-7-32gb-black		1	f	f	f	1	19
71	Samsung Galaxy J320 (J3) Gold	1	1_rpA24Yu.jpg	samsung-galaxy-j320-j3-gold		1	f	f	f	2	18
72	iPhone 7 32GB Gold	1	apple_iphone_7_gold_1_3.jpg	iphone-7-32gb-gold		1	f	f	f	1	19
73	iPhone 7 32GB RoseGold	1	apple_iphone_7_rose_1_3.jpg	iphone-7-32gb-rosegold		1	f	f	f	1	19
74	iPhone 7 128GB Gold	1	apple_iphone_7_gold_1_3_BnS7qbS.jpg	iphone-7-128gb-gold		1	f	f	f	1	19
75	iPhone 7 128GB RoseGold	1	apple_iphone_7_rose_1_3_pzmt1oD.jpg	iphone-7-128gb-rosegold		1	f	f	f	1	19
76	iPhone 7 128GB Silver	1	apple_iphone_7_silver_0_1.jpg	iphone-7-128gb-silver		1	f	f	f	1	19
77	iPhone 7 128GB\tRed	1	1_563_11.jpg	iphone-7-128gb-red		1	f	f	f	1	19
78	iPhone 7 plus 32GB Black	1	apple_iphone_7_plus_black_1_2.jpg	iphone-7-plus-32gb-black		1	f	f	f	1	19
79	iPhone 7 plus 32GB\tGold	1	apple_iphone_7_plus_gold_1_2.jpg	iphone-7-plus-32gb-gold		1	f	f	f	1	19
80	iPhone 8  64GB\tGrey	1	iphone8-plus-spgray-select-2017_1.jpg	iphone-8-64gb-grey		1	f	f	f	1	19
81	iPhone 8  64GB Gold	1	3_306_19_1.jpg	iphone-8-64gb-gold		1	f	f	f	1	19
82	Samsung Galaxy J701 (J7) Black	1	1_BSPNb50.jpg	samsung-galaxy-j701-j7-black		1	f	f	f	2	18
83	iPhone 8  64GB Silver	1	apple_iphone_8_silver_3_1_1_1.jpeg	iphone-8-64gb-silver		1	f	f	f	1	19
84	Samsung Galaxy J701 (J7) Gold	1	1_uIY0FIv.jpg	samsung-galaxy-j701-j7-gold		1	f	f	f	2	18
85	iPhone 8  64GB Red	1	1_j89THmU.jpg	iphone-8-64gb-red		1	f	f	f	1	19
86	Samsung Galaxy J330 (J3) Black	1	1_4FlBwMH.jpg	samsung-galaxy-j330-j3-black		1	f	f	f	2	18
87	Samsung Galaxy J330 (J3) Gold	1	1_qjeQY5g.jpg	samsung-galaxy-j330-j3-gold		1	f	f	f	2	18
88	iPhone 8  256GB\tGrey	1	iphone8-plus-spgray-select-2017_1_M2bS61x.jpg	iphone-8-256gb-grey		1	f	f	f	1	19
90	iPhone 8  256GB\tRed	1	1_2gD59Ch.jpg	iphone-8-256gb-red		1	f	f	f	1	19
92	iPhone 8  plus 64GB Grey	1	0_2XbCY6y.jpg	iphone-8-plus-64gb-grey		1	f	f	f	1	19
89	Samsung Galaxy  J530 (J5 ) Black	1	1_Gm5Vlzh.jpg	samsung-galaxy-j530-j5-black		1	f	f	f	2	18
91	Samsung Galaxy J530 (J5 ) Gold	1	1_BVskbCj.jpg	samsung-galaxy-j530-j5-gold		1	f	f	f	2	18
93	iPhone 8  plus 64GB\tSilver	1	0_SOvMvfP.jpeg	iphone-8-plus-64gb-silver		1	f	f	f	1	19
94	Samsung Galaxy  J730 (J7) Black	1	1_4kMVbym.jpg	samsung-galaxy-j730-j7-black		1	f	f	f	2	18
95	Samsung Galaxy J730 (J7) Gold	1	1_wi70z6p.jpg	samsung-galaxy-j730-j7-gold		1	f	f	f	2	18
96	iPhone 8  plus 256GB Grey	1	30030155b.jpg	iphone-8-plus-256gb-grey		1	f	f	f	1	19
97	iPhone 8  plus 256GB Red	1	2_UN5yHQs.jpg	iphone-8-plus-256gb-red		1	f	f	f	1	19
98	Samsung Galaxy N950 Note 8 Black	1	1_jnDIL6C.jpg	samsung-galaxy-n950-note-8-black		1	f	f	f	2	18
99	Samsung Galaxy N950 Note 8 Gold	1	3_guASVES.jpg	samsung-galaxy-n950-note-8-gold		1	f	f	f	2	18
100	iPad mini 4 128GB  WiFi+4G Silver	1	c78c549a4e77e4377a63851b5f96efec.jpg	ipad-mini-4-128gb-wifi4g-silver		1	f	f	f	1	1
101	iPad mini 4 128GB  WiFi+4G Grey	1	10e0766b0549a9ca686b94aa3b3802da.jpg	ipad-mini-4-128gb-wifi4g-grey		1	f	f	f	1	19
102	iPad mini 4 128GB  WiFi+4G Gold	1	00675971b0c380026b5568fe23f6c0d7.jpg	ipad-mini-4-128gb-wifi4g-gold		1	f	f	f	1	19
103	Samsung Galaxy Tab S3 SM-T825 Black	1	1_4zsarSZ.jpg	samsung-galaxy-tab-s3-sm-t825-black		1	f	f	f	2	18
104	Samsung Galaxy Tab S3 SM-T825 Silver	1	1_0bToUAy.jpg	samsung-galaxy-tab-s3-sm-t825-silver		1	f	f	f	2	18
105	Samsung Galaxy Tab S2 8.0 [SM-T719] Black	1	1_xGoaQfU.jpg	samsung-galaxy-tab-s2-80-sm-t719-black		1	f	f	f	2	18
106	Samsung Galaxy Tab S2 8.0 [SM-T719] Gold	1	1_dtQLmY2.jpg	samsung-galaxy-tab-s2-80-sm-t719-gold		1	f	f	f	2	18
107	iPad new wi-fi 2017 32GB\tSilver	1	03790bdd4af5cf77c82426e2a41dab67.jpg	ipad-new-wi-fi-2017-32gb-silver		1	f	f	f	1	19
108	iPad new wi-fi 2017 32GB\tGold	1	f2919e49336397654546d142a6deab1e.jpg	ipad-new-wi-fi-2017-32gb-gold		1	f	f	f	1	19
109	Samsung Galaxy Tab E (SM-T561) Black	1	1_zhic6nw.jpg	samsung-galaxy-tab-e-sm-t561-black		1	f	f	f	2	18
110	iPad new wi-fi 2017 128GB Silver	1	9c090312d462edcbeb924c3841a6f15b.jpg	ipad-new-wi-fi-2017-128gb-silver		1	f	f	f	1	19
111	Samsung Galaxy Tab E (SM-T561) Brown	1	1_P6BG3K0.jpg	samsung-galaxy-tab-e-sm-t561-brown		1	f	f	f	2	18
112	iPad new wi-fi 2017 128GB Gold	1	e53083945de2aecb757febb0565384ff.jpg	ipad-new-wi-fi-2017-128gb-gold		1	f	f	f	1	19
113	Samsung Galaxy Tab A 8.0 LTE SM-T385 Black	1	1_6MVuqqN.jpg	samsung-galaxy-tab-80-lte-sm-t385-black		1	f	f	f	2	18
114	iPad new wi-fi 2017 128GB Grey	1	9a09478449eaec2c07c38a1887987ef7.jpg	ipad-new-wi-fi-2017-128gb-grey		1	f	f	f	1	19
115	Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold	1	1_ORXxnRx.jpg	samsung-galaxy-tab-80-lte-sm-t385-gold		1	f	f	f	2	18
116	Samsung Galaxy Tab A 7 8GB 4G SM-T285 Black	1	1_DXE9geW.jpg	samsung-galaxy-tab-7-8gb-4g-sm-t285-black		1	f	f	f	2	18
118	iPad new 4G 2017 32GB Grey	1	screenshot_1_193_153_1.jpg	ipad-new-4g-2017-32gb-grey		1	f	f	f	1	19
117	Samsung Galaxy Tab A 7 8GB 4G SM-T285 Silver	1	1_MP6LosC.jpg	samsung-galaxy-tab-7-8gb-4g-sm-t285-silver		1	f	f	f	2	18
119	Samsung Galaxy Tab A 7 8GB 4G SM-T285 White	1	1_kcMQW5X.jpg	samsung-galaxy-tab-7-8gb-4g-sm-t285-white		1	f	f	f	2	18
\.


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_product_id_seq', 119, true);


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
371	xiaomi_mi6_664_blk_images_2027581572.jpg	60
372	xiaomi_mi6_664_blk_images_2027581728_DRvFbCt.jpg	60
373	1_fbHXuZy.jpg	63
374	2_ZWUdfad.jpg	63
375	3_yEnwAfw.jpg	63
376	4_4TqVix0.jpg	63
377	5_FeLcecy.jpg	63
378	6_kXaRCDI.jpg	63
379	0_2TExvgW.jpg	63
380	1_2UW8SgH.jpg	64
381	2_SGYx5ud.jpg	64
382	3_TSk7xOQ.jpg	64
383	4_GmlOGmG.jpg	64
384	5_BCbU01z.jpg	64
385	2_QA1SWXv.jpg	65
386	3_iYawtrq.jpg	65
387	4_slgeg8Q.jpg	65
388	7_dJS1Eth.jpg	65
389	8_0aeqDCx.jpg	65
390	1_i0WX2Zz.jpg	66
391	2_qZTxKXy.jpg	66
392	9_JkIyEYZ.jpg	66
393	3_e8xUdIU.jpg	66
394	4_zSjU02F.jpg	66
395	5_MiyllaI.jpg	66
396	2_WptQ9qU.jpg	67
397	3_cTAsLxc.jpg	67
398	4_zl0RlWJ.jpg	67
399	5_cfgedfD.jpg	67
400	6_CHbUDVN.jpg	67
401	7_Lm0UXqa.jpg	67
402	8_aVeeow4.jpg	67
403	9_UK4dYQF.jpg	67
404	2_6p4I1QW.jpg	68
405	3_UAUmoqh.jpg	68
406	5_zv0fkL1.jpg	68
407	6_2bvPdO1.jpg	68
408	4_PQobCSA.jpg	68
409	1_nagVrw9.jpg	68
410	0_VoDp8vd.jpg	69
411	2_O2psMe2.jpg	69
412	3_rz68df4.jpg	69
413	0_2H3oU4V.jpg	69
414	1_yHPOo7U.jpg	70
415	2_fRqsXMa.jpg	70
416	3_BIjyLwx.jpg	70
417	4_Xgk25vi.jpg	70
418	0_UduYbrH.jpg	70
419	2_ZWLA6k1.jpg	71
420	3_LndxFkz.jpg	71
421	4_ooAnZuV.jpg	71
422	5_nvNFkCZ.jpg	71
423	apple_iphone_7_gold_2_3.jpg	72
424	apple_iphone_7_gold_4_3.jpg	72
425	apple_iphone_7_gold_3_3.jpg	72
426	apple_iphone_7_gold_1_3_MgGVdg2.jpg	72
427	apple_iphone_7_gold_6_3.jpg	72
428	apple_iphone_7_rose_1_3_9j7MaYJ.jpg	73
429	apple_iphone_7_rose_2_3.jpg	73
430	apple_iphone_7_rose_3_3.jpg	73
431	apple_iphone_7_rose_5_3.jpg	73
432	iphone7-plus-rosegold-select-2016_AV1.png	73
433	apple_iphone_7_gold_2_3_lcxBj0Y.jpg	74
434	apple_iphone_7_gold_1_3_T0kDfKr.jpg	74
435	apple_iphone_7_gold_3_3_d66YLtt.jpg	74
436	apple_iphone_7_gold_4_3_V0XHc1z.jpg	74
437	apple_iphone_7_gold_6_3_omee0Tn.jpg	74
438	apple_iphone_7_rose_1_3_Jjxvcqe.jpg	75
439	apple_iphone_7_rose_2_3_B8pDgUk.jpg	75
440	apple_iphone_7_rose_3_3_CIlpNyR.jpg	75
441	apple_iphone_7_rose_5_3_2PNDYX9.jpg	75
442	apple_iphone_7_silver_0_1_CX1lHhO.jpg	76
443	apple_iphone_7_silver_1_1.jpg	76
444	apple_iphone_7_silver_2_1.jpg	76
445	apple_iphone_7_silver_3_1.jpg	76
446	apple_iphone_7_silver_4_1.jpg	76
447	1_563_11_3nkzU3q.jpg	77
448	2_412_52.jpg	77
449	4_187_37.jpg	77
450	3_306_13.jpg	77
451	apple_iphone_7_plus_black_1_2_CBbY7BT.jpg	78
452	apple_iphone_7_plus_black_2_2.jpg	78
453	apple_iphone_7_plus_black_3_2.jpg	78
454	apple_iphone_7_plus_black_4_2.jpg	78
455	apple_iphone_7_plus_black_5_2.jpg	78
456	apple_iphone_7_plus_black_7_2.jpg	78
457	apple_iphone_7_plus_gold_1_2_Qqkq7b5.jpg	79
458	apple_iphone_7_plus_gold_2_2.jpg	79
459	apple_iphone_7_plus_gold_3_2.jpg	79
460	apple_iphone_7_plus_gold_4_2.jpg	79
461	apple_iphone_7_plus_gold_6_2.jpg	79
462	_-1_6_10_1.jpg	80
463	100618_p_8_1.jpg	80
464	100618_p_21.png	80
465	iphone8-plus-spgray-select-2017_1_W7c20J3.jpg	80
466	u_10168678_1.jpg	80
467	_-2_2_6_1.jpg	80
468	1_563_16_1.jpg	81
469	2_412_58_1.jpg	81
470	3_306_19_1_oa1EJ9v.jpg	81
471	4_187_41_1.jpg	81
472	2_IlJJEBs.jpg	82
473	3_Cn7wRck.jpg	82
474	4_YDFuY2M.jpg	82
475	5_53zSwSa.jpg	82
476	6_NGMW1d1.jpg	82
477	apple_iphone_8_silver_1_1_1.jpeg	83
478	apple_iphone_8_silver_2_1_1_1.jpeg	83
479	apple_iphone_8_silver_3_1_1_1_6YQ21nA.jpeg	83
480	apple_iphone_8_silver_4_1_1_1.jpeg	83
481	2_YoG7IQv.jpg	84
482	3_IvmlFVi.jpg	84
483	4_3NqM5Is.jpg	84
484	5_aepK6zN.jpg	84
485	6_Emxu1lg.jpg	84
486	1_Fg4oHhe.jpg	85
487	2_KU7ZvBI.jpg	85
488	3_1BduW17.jpg	85
489	4_PV9tBkL.jpg	85
490	2_4CUdEVm.jpg	86
491	3_8gnKC5F.jpg	86
492	4_OaHWrSd.jpg	86
493	5_uDPy6hu.jpg	86
494	6_44fNpaq.jpg	86
495	2_lwQWN7z.jpg	87
496	3_nA9UQNa.jpg	87
497	4_PhykvNo.jpg	87
498	5_010AvIz.jpg	87
499	6_LL8w9Oo.jpg	87
500	100618_p_8_1_mc3Mfex.jpg	88
501	iphone8-plus-spgray-select-2017_1_enePv9v.jpg	88
502	_-1_6_10_1_u4ZabGN.jpg	88
503	l_10168678_001_1.jpg	88
504	_-2_2_6_1_cf3eO72.jpg	88
505	2_KahvOkt.jpg	89
506	3_gXlnrI7.jpg	89
507	4_RjmvLGx.jpg	89
508	5_pyDWmiM.jpg	89
509	6_hfd7wzN.jpg	89
510	2_kzz3JQW.jpg	90
511	3_ZCQFZ8M.jpg	90
512	4_VSbyYer.jpg	90
513	1_MuoETP5.jpg	90
514	2_3tubPLK.jpg	91
515	3_14J9Yiq.jpg	91
516	4_W9OyX2r.jpg	91
517	5_UiQRPco.jpg	91
518	6_8y87Fb1.jpg	91
519	0_NrK2CCW.jpg	92
520	1_11iKPC3.jpg	92
521	2_I801udy.jpg	92
522	3_1q5IXlR.jpg	92
523	4_0oo623L.jpg	92
524	0_swWyz8m.jpeg	93
525	1_0soR8dG.jpg	93
526	2_NQFqIAZ.jpg	93
527	3_hdC7xBr.jpg	93
528	4_VnWABEx.jpg	93
529	2_poIOPun.jpg	94
530	3_ZiFJHyd.jpg	94
531	4_LsD7UdR.jpg	94
532	5_8nU9TfZ.jpg	94
533	6_RjMjpR7.jpg	94
534	2_oGggw27.jpg	95
535	3_wr31pdR.jpg	95
536	4_WvgWeVv.jpg	95
537	5_ZkAajWv.jpg	95
538	6_385d7C7.jpg	95
539	30030155b_LhdYCMg.jpg	96
540	30030155b1.jpg	96
541	30030155b2.jpg	96
542	30030155b3.jpg	96
543	2_40RnqEU.jpg	97
544	4_ojhfZIe.jpg	97
545	3_WJsv5jR.jpg	97
546	1_IoApyC4.jpg	97
547	2_Doev3Yg.jpg	98
548	3_ISTxxxD.jpg	98
549	4_LrRwR0K.jpg	98
550	5_Buxd3fq.jpg	99
551	8_RX5P9DR.jpg	99
552	7_Z62NcbT.jpg	99
553	4_LUgisR7.jpg	99
554	c78c549a4e77e4377a63851b5f96efec_iVJx68q.jpg	100
555	Без_названия_1.jpg	100
556	Без_названия_2.jpg	100
557	7053eec3f09d312f61321a879f5e10b4.jpg	100
558	Без_названия_3.jpg	100
559	591f0ca55c323c9b6d39591a3157a1a4.jpg	100
560	10e0766b0549a9ca686b94aa3b3802da_G3DneNW.jpg	101
561	165b3a6425b1f8300818c2c6f9e39bc2.jpg	101
562	bc839a2d35e6c88cf4ce1181d5afdb4f.jpg	101
563	eecc417c082df33e6fbf25cd373c4648.jpg	101
564	f7beab3f438a93a0ad1cd1be783c478d.jpg	101
565	Без_названия_1_MgxesHt.jpg	101
566	Без_названия_2_rFors3M.jpg	101
567	Без_названия_3_vsi2unv.jpg	101
568	189ef6e3e3a2aca31c8d8b0df577ae4c.jpg	102
569	421d41a24a0f7a29b641139b492f1e4b.jpg	102
570	Без_названия_1_rBZgYe4.jpg	102
571	2191212ce3f34d7d952dcbe5f5b93d0d.jpg	102
572	Без_названия_2_7qPCLXj.jpg	102
573	2_S5P1AXF.jpg	103
574	3_dDuVSKJ.jpg	103
575	4_UvvUDuY.jpg	103
576	5_Ef0TIfr.jpg	103
577	6_XDp6lsx.jpg	103
578	2_97SCZAA.jpg	104
579	3_P4P3aPG.jpg	104
580	4_4aSacgN.jpg	104
581	5_5WJWZN8.jpg	104
582	6_FHMdrGS.jpg	104
583	2_mnL5JOc.jpg	105
584	3_8wKDMZy.jpg	105
585	4_VyvnVhU.jpg	105
586	5_bsJB99y.jpg	105
587	6_8akrpbc.jpg	105
588	9_oF1c690.jpg	105
589	2_WA3dggM.jpg	106
590	5_Sfj6K9z.jpg	106
591	6_bl4wlLd.jpg	106
592	3_W652CpE.jpg	106
593	4_LsusCRA.jpg	106
594	03790bdd4af5cf77c82426e2a41dab67_eVwGEfp.jpg	107
595	screenshot_7_38_148.jpg	107
596	screenshot_6_47_36_1.jpg	107
597	2_415_10.jpg	107
598	1_567_4.jpg	107
599	f2919e49336397654546d142a6deab1e_v0nr8N3.jpg	108
600	screenshot_4_83_179_1.jpg	108
601	2_415_13.jpg	108
602	1_567_5.jpg	108
603	fcf2e661adc11351ff4650b1b0e69775.jpg	108
604	2_xJ9abtH.jpg	109
605	3_Gn6mEZw.jpg	109
606	4_CtoHi1l.jpg	109
607	5_JC3INpk.jpg	109
608	6_eG1vyea.jpg	109
609	8_kzS3Bzp.jpg	109
610	9c090312d462edcbeb924c3841a6f15b_tv9MqHV.jpg	110
611	8285464fde0a45c976dde6be7a57ba43.jpg	110
612	906f758b688af10d0b68e6786906e641.jpg	110
613	2_Ix4REWg.jpg	111
614	3_1kI7FJl.jpg	111
615	4_SkDHiFx.jpg	111
616	5_frTxX6T.jpg	111
617	6_WV0REFO.jpg	111
618	7_5kemX8e.jpg	111
619	e53083945de2aecb757febb0565384ff_Zkdp2Jo.jpg	112
620	31c51e4233ae8d88f98b5d6e59f43408.jpg	112
621	8ba5652b1327efa76c4777abe87de9a3.jpg	112
622	2_72zmNxp.jpg	113
623	3_aVsdWVT.jpg	113
624	4_0DILg99.jpg	113
625	5_LGxqDUk.jpg	113
626	6_DPbQlSt.jpg	113
627	7_zqhd1Ai.jpg	113
628	9a09478449eaec2c07c38a1887987ef7_2nuUs9Z.jpg	114
629	dbf52ab98af14a7ce47d3ae4bd5c8ae7.jpg	114
630	8ba5652b1327efa76c4777abe87de9a3_kz089I8.jpg	114
631	2_uGkwc0h.jpg	115
632	3_T2zNz21.jpg	115
633	4_OgGkTxU.jpg	115
634	5_q6PY9PX.jpg	115
635	6_8lm6nNE.jpg	115
636	7_SxWE2cn.jpg	115
637	2_qGiwrDJ.jpg	116
638	3_eu0rYS9.jpg	116
639	4_AlQA7OP.jpg	116
640	5_ayHaCOr.jpg	116
641	6_PzHuTUu.jpg	116
642	2_DnBUL8u.png	117
643	3_PuPIWmi.png	117
644	4_YL5JM5l.png	117
645	5_M0VZKxr.png	117
646	6.png	117
647	screenshot_1_193_153_1_sdNbo4A.jpg	118
648	_-1_10_3.jpg	118
649	screenshot_3_118_190_1_1_1.jpg	118
650	screenshot_2_137_202_1_1.jpg	118
651	_-2_3_10.jpg	118
652	2_XINHJVV.jpg	119
653	3_Thg0vVr.jpg	119
654	4_wksueYk.jpg	119
655	5_9jalmGa.jpg	119
\.


--
-- Name: store_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_productimage_id_seq', 655, true);


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
909	iOS 11	63	1
910	Apple A11 Bionic,  4+2 ядро	63	2
911	64 Гб	63	3
912	3 Гб	63	4
913	12 Мп + 12 Мп	63	5
914	7 Мп	63	6
915	OLED (Super Retina HD)	63	7
916	5.8 дюйм	63	8
917	2716 mAh	63	9
918	174 г	63	10
919	143.6 х 70.9 х 7.7 мм	63	12
920	1	63	13
921	2G, 3G, 4G LTE, GSM	63	14
922	Grey	63	15
923	iOS 11	64	1
924	Apple A11 Bionic, 4+2 ядро	64	2
925	256 ГБ	64	3
926	3 Гб	64	4
927	12 Мп + 12 Мп	64	5
928	7 Мп	64	6
929	OLED (Super Retina HD)	64	7
930	5.8 дюйм	64	8
931	2716 mAh	64	9
932	174 г	64	10
933	143.6 х 70.9 х 7.7 мм	64	12
934	1	64	13
935	2G, 3G, 4G LTE, GSM	64	14
936	Silver	64	15
937	Android	65	1
938	1,4 ГГц	65	2
939	16 ГБ	65	3
940	1,5 ГБ	65	4
941	8 Мп	65	5
942	5 Мп	65	6
943	Super AMOLED	65	7
944	5 дюйм	65	8
945	2600 mAh	65	9
946	153 г	65	10
947	143.8 x 72.3 x 8.4	65	12
948	2	65	13
949	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	65	14
950	Black	65	15
951	iOS 11	66	1
952	Apple A11 Bionic, 4+2 ядро	66	2
953	256 ГБ	66	3
954	3 Гб	66	4
955	12 Мп + 12 Мп	66	5
956	7 Мп	66	6
957	OLED (Super Retina HD)	66	7
958	5.8 дюйм	66	8
959	2716 mAh	66	9
960	174 г	66	10
961	143.6 х 70.9 х 7.7 мм	66	12
962	1	66	13
963	2G, 3G, 4G LTE, GSM	66	14
964	Grey	66	15
965	Android	67	1
966	1.4 ГГц	67	2
967	16 ГБ	67	3
968	1,5 ГБ	67	4
969	8 Мп	67	5
970	5 Мп	67	6
971	Super AMOLED	67	7
972	5 дюйм	67	8
973	2600 mAh	67	9
974	153 г	67	10
975	143.8 x 72.3 x 8.4	67	12
976	2	67	13
977	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	67	14
978	Gold	67	15
979	iOS 11	68	1
980	Apple A9 + сопроцессор M9, 2 ядро	68	2
981	32 Гб	68	3
982	2 Гб	68	4
983	12 МП	68	5
984	1.2 МП	68	6
985	рангли IPS, сенсор	68	7
986	5 дюйм	68	8
987	2716 mAh	68	9
988	113 г	68	10
989	Бармоқ изи сканери	68	11
990	123.8x58.6x7.6 мм	68	12
991	1	68	13
992	2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)	68	14
993	Gold	68	15
994	iOS 11	69	1
995	Apple A8 + сопроцессор M8, 1.4 ГГц, 2 ядро	69	2
996	32 Гб	69	3
997	1 Гб	69	4
998	8 МП	69	5
999	1.2 МП	69	6
1000	IPS	69	7
1001	4.7 дюйм	69	8
1002	1810 мАh	69	9
1003	129 г	69	10
1004	Бармоқ изи сканери	69	11
1005	138.1 x 67 x 6.9 мм	69	12
1006	1	69	13
1007	2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)	69	14
1008	Grey	69	15
1009	iOS 10	70	1
1010	Apple A10, 2.3 ГГц, 4 ядро	70	2
1011	32 Гб	70	3
1012	2 Гб	70	4
1013	12 Мп	70	5
1014	7 Мп	70	6
1015	Retina	70	7
1016	4.7 дюйм	70	8
1017	1960 mAh	70	9
1018	138 г	70	10
1019	Бармоқ изи сканери	70	11
1020	138,3x67,1x7,1 мм	70	12
1021	1	70	13
1022	GSM, 3G, 4G (LTE)	70	14
1023	Black	70	15
1024	Android	71	1
1025	1.5 ГГц	71	2
1026	8 Гб	71	3
1027	1.5 ГБ	71	4
1028	8.0 МП	71	5
1029	5.0 MП	71	6
1030	Super AMOLED	71	7
1031	5.0 дюйм	71	8
1032	2600 mAh	71	9
1033	138 г	71	10
1034	142.7 x 70.1 x 8.9	71	12
1035	2	71	13
1036	2G, 3G, 4G LTE, GSM	71	14
1037	Gold	71	15
1038	iOS 10	72	1
1039	Apple A10, 2.3 ГГц, 4 ядро	72	2
1040	32 Гб	72	3
1041	2 Гб	72	4
1042	12 Мп	72	5
1043	7 Мп	72	6
1044	Retina	72	7
1045	4.7 дюйм	72	8
1046	1960 mAh	72	9
1047	138 г	72	10
1048	Бармоқ изи сканери	72	11
1049	138,3x67,1x7,1 мм	72	12
1050	1	72	13
1051	GSM, 3G, 4G (LTE)	72	14
1052	Gold	72	15
1053	iOS 10	73	1
1054	Apple A10, 2.3 ГГц, 4 ядро	73	2
1055	32 Гб	73	3
1056	2 Гб	73	4
1057	12 Мп	73	5
1058	7 Мп	73	6
1059	Retina	73	7
1060	4.7 дюйм	73	8
1061	1960 mAh	73	9
1062	138 г	73	10
1063	Бармоқ изи сканери	73	11
1064	138,3x67,1x7,1 мм	73	12
1065	1	73	13
1066	GSM, 3G, 4G (LTE)	73	14
1067	RoseGold	73	15
1068	iOS 10	74	1
1069	Apple A10, 2.3 ГГц, 4 ядро	74	2
1070	128 Гб	74	3
1071	2 Гб	74	4
1072	12 Мп	74	5
1073	7 Мп	74	6
1074	Retina	74	7
1075	4.7 дюйм	74	8
1076	1960 mAh	74	9
1077	138 г	74	10
1078	Бармоқ изи сканери	74	11
1079	138,3x67,1x7,1 мм	74	12
1080	1	74	13
1081	GSM, 3G, 4G (LTE)	74	14
1082	Gold	74	15
1083	iOS 10	75	1
1084	Apple A10, 2.3 ГГц, 4 ядро	75	2
1085	128 Гб	75	3
1086	2 Гб	75	4
1087	12 Мп	75	5
1088	7 Мп	75	6
1089	Retina	75	7
1090	4.7 дюйм	75	8
1091	1960 mAh	75	9
1092	138 г	75	10
1093	Бармоқ изи сканери	75	11
1094	138,3x67,1x7,1 мм	75	12
1095	1	75	13
1096	GSM, 3G, 4G (LTE)	75	14
1097	RoseGold	75	15
1098	iOS 10	76	1
1099	Apple A10, 2.3 ГГц, 4 ядро	76	2
1100	128 Гб	76	3
1101	2 Гб	76	4
1102	12 Мп	76	5
1103	7 Мп	76	6
1104	Retina	76	7
1105	4.7 дюйм	76	8
1106	1960 mAh	76	9
1107	138 г	76	10
1108	Бармоқ изи сканери	76	11
1109	138,3x67,1x7,1 мм	76	12
1110	1	76	13
1111	GSM, 3G, 4G (LTE)	76	14
1112	Silver	76	15
1113	iOS 10	77	1
1114	Apple A10, 2.3 ГГц, 4 ядро	77	2
1115	128 Гб	77	3
1116	2 Гб	77	4
1117	12 Мп	77	5
1118	7 Мп	77	6
1119	Retina	77	7
1120	4.7 дюйм	77	8
1121	1960 mAh	77	9
1122	138 г	77	10
1123	Бармоқ изи сканери	77	11
1124	138,3x67,1x7,1 мм	77	12
1125	1	77	13
1126	GSM, 3G, 4G (LTE)	77	14
1127	Red	77	15
1128	iOS 10	78	1
1129	Apple A10, 2.3 ГГц, 4 ядро	78	2
1130	32 Гб	78	3
1131	3 Гб	78	4
1132	12 Мп	78	5
1133	7 Мп	78	6
1134	Retina	78	7
1135	5.5 дюйм	78	8
1136	2900 mAh	78	9
1137	188 г	78	10
1138	Бармоқ изи сканери	78	11
1139	158,2х77,9х7,3 мм	78	12
1140	1	78	13
1141	GSM, 3G, 4G (LTE)	78	14
1142	Black	78	15
1143	iOS 10	79	1
1144	Apple A10, 2.3 ГГц, 4 ядро	79	2
1145	32 Гб	79	3
1146	3 Гб	79	4
1147	12 Мп	79	5
1148	7 Мп	79	6
1149	Retina	79	7
1150	5.5дюйм	79	8
1151	2900 mAh	79	9
1152	188 г	79	10
1153	Бармоқ изи сканери	79	11
1154	155.4×75.8×7.3 мм	79	12
1155	1	79	13
1156	GSM, 3G, 4G (LTE)	79	14
1157	Gold	79	15
1158	iOS 11	80	1
1159	Apple A11 Bionic, 2.3 ГГц, 6 ядро	80	2
1160	64 Гб	80	3
1161	2 Гб	80	4
1162	12 Мп	80	5
1163	7 Мп	80	6
1164	Retina HD	80	7
1165	4.7 дюйм	80	8
1166	1821 mAh	80	9
1167	148 г	80	10
1168	Бармоқ изи сканери	80	11
1169	138.4 х 67.3 х 7.3 мм	80	12
1170	1	80	13
1171	GSM, 3G, 4G (LTE)	80	14
1172	Grey	80	15
1173	iOS 11	81	1
1174	Apple A11 Bionic, 2.3 ГГц, 6 ядро	81	2
1175	64 Гб	81	3
1176	2 Гб	81	4
1177	12 Мп	81	5
1178	7 Мп	81	6
1179	Retina HD	81	7
1180	4.7 дюйм	81	8
1181	1821 mAh	81	9
1182	148 г	81	10
1183	Бармоқ изи сканери	81	11
1184	138.4 х 67.3 х 7.3 мм	81	12
1185	1	81	13
1186	GSM, 3G, 4G (LTE)	81	14
1187	Gold	81	15
1188	Android	82	1
1189	1,6 ГГц	82	2
1190	16 ГБ	82	3
1191	2 ГБ	82	4
1192	13 Мп	82	5
1193	5.0 Мп	82	6
1194	Super AMOLED	82	7
1195	5.5 дюйм	82	8
1196	3000 mAh	82	9
1197	170 г	82	10
1198	152.4 x 78.6 x 7.6	82	12
1199	2	82	13
1200	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	82	14
1201	Black	82	15
1202	iOS 11	83	1
1203	Apple A11 Bionic, 2.3 ГГц, 6 ядро	83	2
1204	64 Гб	83	3
1205	2 Гб	83	4
1206	12 Мп	83	5
1207	7 Мп	83	6
1208	Retina HD	83	7
1209	4.7 дюйм	83	8
1210	1821 mAh	83	9
1211	148 г	83	10
1212	Бармоқ изи сканери	83	11
1213	138.4 х 67.3 х 7.3 мм	83	12
1214	1	83	13
1215	GSM, 3G, 4G (LTE)	83	14
1216	Silver	83	15
1217	Android	84	1
1218	1,6 ГГц	84	2
1219	16 ГБ	84	3
1220	2 ГБ	84	4
1221	13 Мп	84	5
1222	5 Мп	84	6
1223	Super AMOLED	84	7
1224	5.5 дюйм	84	8
1225	3000 mAh	84	9
1226	170 г	84	10
1227	152.4 x 78.6 x 7.6	84	12
1228	2	84	13
1229	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	84	14
1230	Gold	84	15
1231	iOS 11	85	1
1232	Apple A11 Bionic, 2.3 ГГц, 6 ядро	85	2
1233	64 Гб	85	3
1234	2 Гб	85	4
1235	12 Мп	85	5
1236	7 Мп	85	6
1237	Retina HD	85	7
1238	4.7 дюйм	85	8
1239	1821 mAh	85	9
1240	148 г	85	10
1241	Бармоқ изи сканери	85	11
1242	138.4 х 67.3 х 7.3 мм	85	12
1243	1	85	13
1244	GSM, 3G, 4G (LTE)	85	14
1245	Red	85	15
1246	Android	86	1
1247	1,4 ГГц	86	2
1248	16 ГБ	86	3
1249	2 ГБ	86	4
1250	13 Мп	86	5
1251	5.0 Мп	86	6
1252	Super AMOLED	86	7
1253	5.0 дюйм	86	8
1254	2400 mAh	86	9
1255	142 г	86	10
1256	143.2 x 70.3 x 8.2	86	12
1257	2	86	13
1258	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	86	14
1259	Black	86	15
1260	Android	87	1
1261	1.4 ГГц	87	2
1262	16 ГБ	87	3
1263	2 ГБ	87	4
1264	13 Мп	87	5
1265	5 Мп	87	6
1266	Super AMOLED	87	7
1267	5 дюйм	87	8
1268	2400mAh	87	9
1269	142 г	87	10
1270	143.2 x 70.3 x 8.2	87	12
1271	2	87	13
1272	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	87	14
1273	Gold	87	15
1274	iOS 11	88	1
1275	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	88	2
1276	256 ГБ	88	3
1277	2 Гб	88	4
1278	12 Мп	88	5
1279	7 Мп	88	6
1280	Retina HD	88	7
1281	4.7 дюйм	88	8
1282	1821 mAh	88	9
1283	148 г	88	10
1284	Бармоқ изи сканери	88	11
1285	138.4 х 67.3 х 7.3 мм	88	12
1286	1	88	13
1287	GSM, 3G, 4G (LTE)	88	14
1288	Grey	88	15
1289	Android	89	1
1290	1.6ГГц	89	2
1291	16 ГБ	89	3
1292	2 ГБ	89	4
1293	13 Мп	89	5
1294	13 Мп	89	6
1295	Super AMOLED	89	7
1296	5.2 дюйм	89	8
1297	3000 mAh	89	9
1298	160 г	89	10
1299	146.2 x 71.3 x 8.0	89	12
1300	2	89	13
1301	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	89	14
1302	Black	89	15
1303	iOS 11	90	1
1304	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	90	2
1305	256 ГБ	90	3
1306	2 Гб	90	4
1307	12 Мп	90	5
1308	7	90	6
1309	Retina HD	90	7
1310	4.7 дюйм	90	8
1311	1821 mAh	90	9
1312	148 г	90	10
1313	Бармоқ изи сканери	90	11
1314	138.4 х 67.3 х 7.3 мм	90	12
1315	1	90	13
1316	GSM, 3G, 4G (LTE)	90	14
1317	Red	90	15
1318	Android	91	1
1319	1.6 ГГц	91	2
1320	16 ГБ	91	3
1321	2 ГБ	91	4
1322	13 Мп	91	5
1323	13 Мп	91	6
1324	Super AMOLED	91	7
1325	5.2 дюйм	91	8
1326	3000 mAh	91	9
1327	160 г	91	10
1328	146.2 x 71.3 x 8.0	91	12
1329	2	91	13
1330	2G GSM, 3G WCDMA, 4G LTE FDD, 4G	91	14
1331	Gold	91	15
1332	iOS 11	92	1
1333	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	92	2
1334	64 Гб	92	3
1335	3 Гб	92	4
1336	12 Мп	92	5
1337	7 Мп	92	6
1338	Retina HD	92	7
1339	5.5дюйм	92	8
1340	2691 mAh	92	9
1341	202 г	92	10
1342	Бармоқ изи сканери	92	11
1343	158.4 х 78.1 х 7.5 мм	92	12
1344	1	92	13
1345	GSM, 3G, 4G (LTE)	92	14
1346	Grey	92	15
1347	Бармоқ изи сканери	89	11
1348	Бармоқ изи сканери	91	11
1349	iOS 11	93	1
1350	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	93	2
1351	64 Гб	93	3
1352	3 Гб	93	4
1353	12 Мп	93	5
1354	7 Мп	93	6
1355	Retina HD	93	7
1356	5.5дюйм	93	8
1357	2691 mAh	93	9
1358	202 г	93	10
1359	Бармоқ изи сканери	93	11
1360	158.4 х 78.1 х 7.5 мм	93	12
1361	1	93	13
1362	GSM, 3G, 4G (LTE)	93	14
1363	Silver	93	15
1364	Android	94	1
1365	1.6ГГц	94	2
1366	16 ГБ	94	3
1367	3 ГБ	94	4
1368	13 Мп	94	5
1369	13 Мп	94	6
1370	Super AMOLED	94	7
1371	5.5 дюйм	94	8
1372	3600 mAh	94	9
1373	181 г	94	10
1374	Бармоқ изи сканери	94	11
1375	152.5 x 74.8 x 8.0	94	12
1376	2	94	13
1377	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	94	14
1378	Black	94	15
1379	Android	95	1
1380	1.6ГГц	95	2
1381	16 ГБ	95	3
1382	3 ГБ	95	4
1383	13 Мп	95	5
1384	13 Мп	95	6
1385	Super AMOLED	95	7
1386	5.5 дюйм	95	8
1387	3600 mAh	95	9
1388	181 г	95	10
1389	Бармоқ изи сканери	95	11
1390	152.5 x 74.8 x 8.0	95	12
1391	2	95	13
1392	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	95	14
1393	Gold	95	15
1394	iOS 11	96	1
1395	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	96	2
1396	256 ГБ	96	3
1397	3 Гб	96	4
1398	12 Мп	96	5
1399	7 Мп	96	6
1400	Retina HD	96	7
1401	5.5дюйм	96	8
1402	2691 mAh	96	9
1403	202 г	96	10
1404	Бармоқ изи сканери	96	11
1405	158.4 х 78.1 х 7.5 мм	96	12
1406	1	96	13
1407	GSM, 3G, 4G (LTE)	96	14
1408	Grey	96	15
1409	iOS 11	97	1
1410	Apple A11 Bionic + М11, 2.3 ГГц, 6 ядро	97	2
1411	256 ГБ	97	3
1412	3 Гб	97	4
1413	12 Мп	97	5
1414	7 Мп	97	6
1415	Retina HD	97	7
1416	5.5дюйм	97	8
1417	2691 mAh	97	9
1418	202 г	97	10
1419	Бармоқ изи сканери	97	11
1420	158.4 х 78.1 х 7.5 мм	97	12
1421	1	97	13
1422	GSM, 3G, 4G (LTE)	97	14
1423	Red	97	15
1424	Android	98	1
1425	2,5 ГГц	98	2
1426	64 ГБ	98	3
1427	6 Гб	98	4
1428	12 Мп	98	5
1429	8 Мп	98	6
1430	Super AMOLED	98	7
1431	6.2 дюйм	98	8
1432	3300 mAh	98	9
1433	195 г	98	10
1434	Бармоқ изи сканери	98	11
1435	162.5 x 74.8 x 8.6 мм	98	12
1436	2	98	13
1437	2G, 3G, 4G LTE, GSM	98	14
1438	Black	98	15
1439	Android	99	1
1440	2,5 ГГц	99	2
1441	64 ГБ	99	3
1442	6 ГБ	99	4
1443	12 Мп	99	5
1444	8 Мп	99	6
1445	Super AMOLED	99	7
1446	6.2 дюйм	99	8
1447	3300mAh	99	9
1448	195 г	99	10
1449	Бармоқ изи сканери	99	11
1450	162.5 x 74.8 x 8.6 мм	99	12
1451	2	99	13
1452	2G, 3G, 4G LTE, GSM	99	14
1453	Gold	99	15
1454	iOS 11	100	1
1455	Apple A8, 1,5 ГГц, 2 ядро	100	2
1456	128 Гб	100	3
1457	1 Гб	100	4
1458	8 МП	100	5
1459	1.2 Мп	100	6
1460	Retina HD	100	7
1461	7.9 дюйм	100	8
1462	19.1 mAh	100	9
1463	304 г	100	10
1464	203,2 х 134,8 х 6,1 мм	100	12
1465	1	100	13
1466	2G 3G 4G(LTE)	100	14
1467	Silver	100	15
1468	iOS 11	101	1
1469	Apple A8, 1,5 ГГц, 2 ядро	101	2
1470	128 Гб	101	3
1471	1 Гб	101	4
1472	8 МП	101	5
1473	1.2 Мп	101	6
1474	Retina HD	101	7
1475	7.9 дюйм	101	8
1476	19.1 mAh	101	9
1477	304 г	101	10
1478	203,2 х 134,8 х 6,1 мм	101	12
1479	1	101	13
1480	2G, 3G, 4G (LTE)	101	14
1481	Grey	101	15
1482	iOS 11	102	1
1483	Apple A8, 1,5 ГГц, 2 ядро	102	2
1484	128 Гб	102	3
1485	1 Гб	102	4
1486	8 МП	102	5
1487	1.2 Мп	102	6
1488	Retina HD	102	7
1489	7.9 дюйм	102	8
1490	19.1 mAh	102	9
1491	304 г	102	10
1492	203,2 х 134,8 х 6,1 мм	102	12
1493	1	102	13
1494	2G 3G 4G(LTE)	102	14
1495	Gold	102	15
1496	Android	103	1
1497	2.15 ГГц, 1,6 ГГц	103	2
1498	32 ГБ	103	3
1499	4 ГБ	103	4
1500	13 Мп	103	5
1501	5 Мп	103	6
1502	Super AMOLED	103	7
1503	9.7 дюйм	103	8
1504	6000 mAh	103	9
1505	434 г	103	10
1506	Бармоқ изи сканери	103	11
1507	237.3 x 169.0 x 6.0	103	12
1508	1	103	13
1509	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	103	14
1510	Black	103	15
1511	Android	104	1
1512	2.15 ГГц, 1,6 ГГц	104	2
1513	32 ГБ	104	3
1514	4 ГБ	104	4
1515	13 Мп	104	5
1516	5 Мп	104	6
1517	Super AMOLED	104	7
1518	9.7 дюйм	104	8
1519	6000 mAh	104	9
1520	434 г	104	10
1521	Бармоқ изи сканери	104	11
1522	237.3 x 169.0 x 6.0	104	12
1523	1	104	13
1524	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	104	14
1525	Silver	104	15
1526	Android	105	1
1527	1.8 ГГц, 1.4ГГц	105	2
1528	32 ГБ	105	3
1529	3 ГБ	105	4
1530	8 Мп	105	5
1531	2.1 Мп	105	6
1532	Super AMOLED	105	7
1533	8.0 дюйм	105	8
1534	4000 mAh	105	9
1535	267 г	105	10
1536	Бармоқ изи сканери	105	11
1537	198.6 x 134.8 x 5.6	105	12
1538	1	105	13
1539	2G GSM, 3G WCDMA, 4G LTE FDD	105	14
1540	Black	105	15
1541	Android	106	1
1542	1.8 ГГц, 1.4 ГГц	106	2
1543	32 ГБ	106	3
1544	3 ГБ	106	4
1545	8 Мп	106	5
1546	2.1 Мп	106	6
1547	Super AMOLED	106	7
1548	8.0 дюйм	106	8
1549	4000 mAh	106	9
1550	267 г	106	10
1551	Бармоқ изи сканери	106	11
1552	198.6 x 134.8 x 5.6	106	12
1553	1	106	13
1554	2G GSM, 3G WCDMA, 4G LTE FDD	106	14
1555	Gold	106	15
1556	iOS 10	107	1
1557	Apple A9, 1,8 ГГц, 2 ядро	107	2
1558	32 Гб	107	3
1559	2 Гб	107	4
1560	8 МП	107	5
1561	1.2 Мп	107	6
1562	IPS	107	7
1563	9.7 дюйм	107	8
1564	8610 мАh	107	9
1565	469 г	107	10
1566	Бармоқ изи сканери	107	11
1567	170 x 240 x 7.5 мм	107	12
1568	1	107	13
1569	Wi-Fi (802.11a/b/g/n/ac) / двухканальный 2.4GHz и 5GHz, MIMO / Bluetooth 4.2 / GPS	107	14
1570	Silver	107	15
1571	iOS 10	108	1
1572	Apple A9, 1,8 ГГц, 2 ядро	108	2
1573	32 Гб	108	3
1574	2 Гб	108	4
1575	8 МП	108	5
1576	1.2 Мп	108	6
1577	IPS	108	7
1578	9.7 дюйм	108	8
1579	8610 мАh	108	9
1580	469 г	108	10
1581	Бармоқ изи сканери	108	11
1582	170 x 240 x 7.5 мм	108	12
1583	1	108	13
1584	Wi-Fi (802.11a/b/g/n/ac) / двухканальный 2.4GHz и 5GHz, MIMO / Bluetooth 4.2 / GPS	108	14
1585	Gold	108	15
1586	Android	109	1
1587	1.3 ГГц	109	2
1588	8 Гб	109	3
1589	1,5 ГБ	109	4
1590	5 Мп	109	5
1591	2 Мп	109	6
1592	TFT	109	7
1593	9.6 дюйм	109	8
1594	5000 mAh	109	9
1595	495 г	109	10
1596	241.9 x 149.5 x 8.5	109	12
1597	1	109	13
1598	2G GSM, 3G WCDMA	109	14
1599	Black	109	15
1600	iOS 10	110	1
1601	Apple A9, 1,8 ГГц, 2 ядро	110	2
1602	128 Гб	110	3
1603	2 Гб	110	4
1604	8 МП	110	5
1605	1.2 Мп	110	6
1606	IPS	110	7
1607	9.7 дюйм	110	8
1608	8610 мАh	110	9
1609	469 г	110	10
1610	Бармоқ изи сканери	110	11
1611	170 x 240 x 7.5 мм	110	12
1612	1	110	13
1613	Wi-Fi (802.11a/b/g/n/ac) / двухканальный 2.4GHz и 5GHz, MIMO / Bluetooth 4.2 / GPS	110	14
1614	Silver	110	15
1615	Android	111	1
1616	1.3 ГГц	111	2
1617	8 ГБ	111	3
1618	1,5 ГБ	111	4
1619	5 Мп	111	5
1620	2 Мп	111	6
1621	TFT	111	7
1622	9.6 дюйм	111	8
1623	5000 mAh	111	9
1624	495 г	111	10
1625	241.9 x 149.5 x 8.5	111	12
1626	1	111	13
1627	2G GSM, 3G WCDMA	111	14
1628	Brown	111	15
1629	iOS 10	112	1
1630	Apple A9, 1,8 ГГц, 2 ядро	112	2
1631	128 Гб	112	3
1632	2 Гб	112	4
1633	8 МП	112	5
1634	1.2 Мп	112	6
1635	IPS	112	7
1636	9.7 дюйм	112	8
1637	8610 мАh	112	9
1638	469 г	112	10
1639	Бармоқ изи сканери	112	11
1640	8610 мАh	112	12
1641	1	112	13
1642	Wi-Fi (802.11a/b/g/n/ac) / двухканальный 2.4GHz и 5GHz, MIMO / Bluetooth 4.2 / GPS	112	14
1643	Gold	112	15
1644	Android	113	1
1645	1,4 ГГц	113	2
1646	16 ГБ	113	3
1647	2 ГБ	113	4
1648	8 Мп	113	5
1649	5 Мп	113	6
1650	TFT	113	7
1651	8 дюйм	113	8
1652	5000 mAh	113	9
1653	364 г	113	10
1654	212.1 x 124.1 x 8.9	113	12
1655	1	113	13
1656	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	113	14
1657	Black	113	15
1658	iOS 10	114	1
1659	Apple A9, 1,8 ГГц, 2 ядро	114	2
1660	128 Гб	114	3
1661	2 Гб	114	4
1662	8 МП	114	5
1663	1.2 Мп	114	6
1664	IPS	114	7
1665	9.7 дюйм	114	8
1666	8610 мАh	114	9
1667	469 г	114	10
1668	Бармоқ изи сканери	114	11
1669	170 x 240 x 7.5 мм	114	12
1670	1	114	13
1671	Wi-Fi (802.11a/b/g/n/ac) / двухканальный 2.4GHz и 5GHz, MIMO / Bluetooth 4.2 / GPS	114	14
1672	Grey	114	15
1673	Android	115	1
1674	1.4 ГГц	115	2
1675	16 ГБ	115	3
1676	2 ГБ	115	4
1677	8 Мп	115	5
1678	5 Мп	115	6
1679	TFT	115	7
1680	8 дюйм	115	8
1681	5000 mAh	115	9
1682	364 г	115	10
1683	212.1 x 124.1 x 8.9	115	12
1684	1	115	13
1685	2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD	115	14
1686	Gold	115	15
1687	Android	116	1
1688	1,5 ГГц	116	2
1689	8 ГБ	116	3
1690	1,5 ГБ	116	4
1691	5 Мп	116	5
1692	2 Мп	116	6
1693	TFT	116	7
1694	7 дюйм	116	8
1695	4000 mAh	116	9
1696	289 г	116	10
1697	186.9 x 108.8 x 8.7	116	12
1698	1	116	13
1699	2G, 3G, 4G LTE, GSM	116	14
1700	Black	116	15
1701	Android	117	1
1702	1,5 ГГц	117	2
1703	8 ГБ	117	3
1704	1,5 ГБ	117	4
1705	5 Мп	117	5
1706	2 Мп	117	6
1707	TFT	117	7
1708	7 дюйм	117	8
1709	4000 mAh	117	9
1710	289 г	117	10
1711	186.9 x 108.8 x 8.7	117	12
1712	1	117	13
1713	2G, 3G, 4G LTE, GSM	117	14
1715	iOS 10	118	1
1716	Apple A9, 1,8 ГГц, 2 ядро	118	2
1717	32 Гб	118	3
1718	2 Гб	118	4
1719	8 МП	118	5
1720	1.2 Мп	118	6
1721	IPS	118	7
1722	9.7 дюйм	118	8
1723	32,9 Вт·ч	118	9
1724	478 г	118	10
1725	240 x 169.5 x 7.5 мм	118	12
1726	1	118	13
1727	UMTS/HSPA/HSPA+/DC-HSDPA GSM/EDGE	118	14
1728	Grey	118	15
1714	Silver	117	15
1729	Android	119	1
1730	1,5 ГГц	119	2
1731	8 ГБ	119	4
1732	1,5 ГБ	119	5
1733	5 Мп	119	6
1734	2 Мп	119	7
1735	TFT	119	8
1736	7 дюйм	119	9
1737	4000 mAh	119	9
1738	289 г	119	10
1739	186.9 x 108.8 x 8.7	119	12
1740	1	119	13
1741	2G, 3G, 4G LTE, GSM	119	14
1742	White	119	15
\.


--
-- Name: store_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_specification_id_seq', 1742, true);


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
-- Name: app_content app_content_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.app_content
    ADD CONSTRAINT app_content_pkey PRIMARY KEY (id);


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
-- Name: app_content_slug_b341e896; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_content_slug_b341e896 ON public.app_content USING btree (slug);


--
-- Name: app_content_slug_b341e896_like; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX app_content_slug_b341e896_like ON public.app_content USING btree (slug varchar_pattern_ops);


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

