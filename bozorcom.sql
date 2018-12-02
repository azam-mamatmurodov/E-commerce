--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app_brand; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE app_brand (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    category_id integer
);


ALTER TABLE public.app_brand OWNER TO bozorcom;

--
-- Name: app_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE app_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_brand_id_seq OWNER TO bozorcom;

--
-- Name: app_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE app_brand_id_seq OWNED BY app_brand.id;


--
-- Name: app_category; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE app_category (
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

CREATE SEQUENCE app_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_category_id_seq OWNER TO bozorcom;

--
-- Name: app_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE app_category_id_seq OWNED BY app_category.id;


--
-- Name: app_slider; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE app_slider (
    id integer NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.app_slider OWNER TO bozorcom;

--
-- Name: app_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE app_slider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_slider_id_seq OWNER TO bozorcom;

--
-- Name: app_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE app_slider_id_seq OWNED BY app_slider.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO bozorcom;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO bozorcom;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO bozorcom;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO bozorcom;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO bozorcom;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO bozorcom;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_user (
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
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO bozorcom;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO bozorcom;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO bozorcom;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE django_admin_log (
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

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO bozorcom;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO bozorcom;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO bozorcom;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO bozorcom;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO bozorcom;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO bozorcom;

--
-- Name: store_product; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE store_product (
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

CREATE SEQUENCE store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_product_id_seq OWNER TO bozorcom;

--
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE store_product_id_seq OWNED BY store_product.id;


--
-- Name: store_productimage; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE store_productimage (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.store_productimage OWNER TO bozorcom;

--
-- Name: store_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE store_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_productimage_id_seq OWNER TO bozorcom;

--
-- Name: store_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE store_productimage_id_seq OWNED BY store_productimage.id;


--
-- Name: store_review; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE store_review (
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

CREATE SEQUENCE store_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_review_id_seq OWNER TO bozorcom;

--
-- Name: store_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE store_review_id_seq OWNED BY store_review.id;


--
-- Name: store_specification; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE store_specification (
    id integer NOT NULL,
    info character varying(250),
    product_id integer NOT NULL,
    specification_type_id integer
);


ALTER TABLE public.store_specification OWNER TO bozorcom;

--
-- Name: store_specification_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE store_specification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_specification_id_seq OWNER TO bozorcom;

--
-- Name: store_specification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE store_specification_id_seq OWNED BY store_specification.id;


--
-- Name: store_specificationtype; Type: TABLE; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE TABLE store_specificationtype (
    id integer NOT NULL,
    name character varying(254) NOT NULL
);


ALTER TABLE public.store_specificationtype OWNER TO bozorcom;

--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE store_specificationtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_specificationtype_id_seq OWNER TO bozorcom;

--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE store_specificationtype_id_seq OWNED BY store_specificationtype.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY app_brand ALTER COLUMN id SET DEFAULT nextval('app_brand_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY app_category ALTER COLUMN id SET DEFAULT nextval('app_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY app_slider ALTER COLUMN id SET DEFAULT nextval('app_slider_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_product ALTER COLUMN id SET DEFAULT nextval('store_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_productimage ALTER COLUMN id SET DEFAULT nextval('store_productimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_review ALTER COLUMN id SET DEFAULT nextval('store_review_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_specification ALTER COLUMN id SET DEFAULT nextval('store_specification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_specificationtype ALTER COLUMN id SET DEFAULT nextval('store_specificationtype_id_seq'::regclass);


--
-- Data for Name: app_brand; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY app_brand (id, title, category_id) FROM stdin;
\.


--
-- Name: app_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('app_brand_id_seq', 1, false);


--
-- Data for Name: app_category; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY app_category (id, title, slug, tree, icon, lft, rght, tree_id, level, parent_id) FROM stdin;
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

SELECT pg_catalog.setval('app_category_id_seq', 22, true);


--
-- Data for Name: app_slider; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY app_slider (id, image) FROM stdin;
\.


--
-- Name: app_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('app_slider_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
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

SELECT pg_catalog.setval('auth_permission_id_seq', 56, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$SWix4a9g86Dx$xF0oCkdgIlCkgBa3sArolCHnu6ZIRWeMecvmnrtyy24=	2018-12-02 18:02:56.736325+05	t	admin			azam.mamatmurodov@gmail.com	t	t	2018-12-02 18:02:49.398795+05
2	pbkdf2_sha256$120000$dn8yEjFumgbb$+BmUaLQb2ueo5PZ3zW7O1E7/RSaYMZHLI1lptExTM3Y=	2018-12-02 18:17:16.395157+05	f	moderator	Bozorcom	Moderator	info@bozor.com	t	t	2018-12-02 18:15:17+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
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

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 25, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-02 18:09:42.206874+05	1	Операцион тизим	1	[{"added": {}}]	14	1
2	2018-12-02 18:14:25.778256+05	1	Xiaomi RedMi 5a 16 GB	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}]	10	1
3	2018-12-02 18:15:17.482013+05	2	moderator	1	[{"added": {}}]	4	1
4	2018-12-02 18:16:54.460968+05	2	moderator	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "user_permissions"]}}]	4	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY django_content_type (id, app_label, model) FROM stdin;
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

SELECT pg_catalog.setval('django_content_type_id_seq', 14, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-02 18:01:40.682859+05
2	auth	0001_initial	2018-12-02 18:01:41.411426+05
3	admin	0001_initial	2018-12-02 18:01:41.603899+05
4	admin	0002_logentry_remove_auto_add	2018-12-02 18:01:41.651534+05
5	admin	0003_logentry_add_action_flag_choices	2018-12-02 18:01:41.702149+05
6	app	0001_initial	2018-12-02 18:01:42.302546+05
7	contenttypes	0002_remove_content_type_name	2018-12-02 18:01:42.411762+05
8	auth	0002_alter_permission_name_max_length	2018-12-02 18:01:42.445294+05
9	auth	0003_alter_user_email_max_length	2018-12-02 18:01:42.500514+05
10	auth	0004_alter_user_username_opts	2018-12-02 18:01:42.543798+05
11	auth	0005_alter_user_last_login_null	2018-12-02 18:01:42.600303+05
12	auth	0006_require_contenttypes_0002	2018-12-02 18:01:42.61157+05
13	auth	0007_alter_validators_add_error_messages	2018-12-02 18:01:42.660606+05
14	auth	0008_alter_user_username_max_length	2018-12-02 18:01:42.766367+05
15	auth	0009_alter_user_last_name_max_length	2018-12-02 18:01:42.82164+05
16	sessions	0001_initial	2018-12-02 18:01:42.988691+05
17	store	0001_initial	2018-12-02 18:01:43.789123+05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
tr6b6e3n6nsdto4wlxympk1xsxua3f3n	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2018-12-16 18:02:56.747718+05
nrn64rdi7hr3cavpzz1byyygm2p38ele	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2018-12-16 18:17:16.407505+05
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY store_product (id, title, price, image, slug, description, quantity, featured, new, top_rated, brand_id, category_id) FROM stdin;
1	Xiaomi RedMi 5a 16 GB	808000	80c55142fa946a9dcbccd.jpg	xiaomi-redmi-5a-16-gb		1	f	f	f	\N	17
\.


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('store_product_id_seq', 1, true);


--
-- Data for Name: store_productimage; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY store_productimage (id, image, product_id) FROM stdin;
1	9d2fa76061e433cfcf503.jpg	1
2	af3ab3cceb23d71a30c73.jpg	1
3	662cb253bc168ffde5d0d.jpg	1
4	ab2d6bafa686f1ec2de16.jpg	1
5	2f8717909cb5bee744263.jpg	1
6	2f8717909cb5bee744263_1.jpg	1
7	ab2d6bafa686f1ec2de16_1.jpg	1
8	313fec3c5fdb462220a14.jpg	1
9	808e29068c5ca934cb21b.jpg	1
10	80c55142fa946a9dcbccd_1.jpg	1
\.


--
-- Name: store_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('store_productimage_id_seq', 10, true);


--
-- Data for Name: store_review; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY store_review (id, comment, rate, data_of_created, author_id, product_id) FROM stdin;
\.


--
-- Name: store_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('store_review_id_seq', 1, false);


--
-- Data for Name: store_specification; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY store_specification (id, info, product_id, specification_type_id) FROM stdin;
1	Android 7.1.2	1	1
\.


--
-- Name: store_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('store_specification_id_seq', 1, true);


--
-- Data for Name: store_specificationtype; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY store_specificationtype (id, name) FROM stdin;
1	Операцион тизим
\.


--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('store_specificationtype_id_seq', 1, true);


--
-- Name: app_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY app_brand
    ADD CONSTRAINT app_brand_pkey PRIMARY KEY (id);


--
-- Name: app_category_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY app_category
    ADD CONSTRAINT app_category_pkey PRIMARY KEY (id);


--
-- Name: app_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY app_slider
    ADD CONSTRAINT app_slider_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY store_productimage
    ADD CONSTRAINT store_productimage_pkey PRIMARY KEY (id);


--
-- Name: store_review_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY store_review
    ADD CONSTRAINT store_review_pkey PRIMARY KEY (id);


--
-- Name: store_specification_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY store_specification
    ADD CONSTRAINT store_specification_pkey PRIMARY KEY (id);


--
-- Name: store_specificationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom; Tablespace: 
--

ALTER TABLE ONLY store_specificationtype
    ADD CONSTRAINT store_specificationtype_pkey PRIMARY KEY (id);


--
-- Name: app_brand_category_id_a3caec35; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_brand_category_id_a3caec35 ON app_brand USING btree (category_id);


--
-- Name: app_category_level_bfbc3510; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_level_bfbc3510 ON app_category USING btree (level);


--
-- Name: app_category_lft_a56c1fda; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_lft_a56c1fda ON app_category USING btree (lft);


--
-- Name: app_category_parent_id_8ce0344c; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_parent_id_8ce0344c ON app_category USING btree (parent_id);


--
-- Name: app_category_rght_cf0164d7; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_rght_cf0164d7 ON app_category USING btree (rght);


--
-- Name: app_category_slug_b059cea8; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_slug_b059cea8 ON app_category USING btree (slug);


--
-- Name: app_category_slug_b059cea8_like; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_slug_b059cea8_like ON app_category USING btree (slug varchar_pattern_ops);


--
-- Name: app_category_tree_id_d2e0173f; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX app_category_tree_id_d2e0173f ON app_category USING btree (tree_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: store_product_brand_id_ec9e66ab; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_product_brand_id_ec9e66ab ON store_product USING btree (brand_id);


--
-- Name: store_product_category_id_574bae65; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_product_category_id_574bae65 ON store_product USING btree (category_id);


--
-- Name: store_product_slug_6de8ee4b; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_product_slug_6de8ee4b ON store_product USING btree (slug);


--
-- Name: store_product_slug_6de8ee4b_like; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_product_slug_6de8ee4b_like ON store_product USING btree (slug varchar_pattern_ops);


--
-- Name: store_productimage_product_id_e50e4046; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_productimage_product_id_e50e4046 ON store_productimage USING btree (product_id);


--
-- Name: store_review_author_id_2c9d22fe; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_review_author_id_2c9d22fe ON store_review USING btree (author_id);


--
-- Name: store_review_product_id_abc413b2; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_review_product_id_abc413b2 ON store_review USING btree (product_id);


--
-- Name: store_specification_product_id_b56e860b; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_specification_product_id_b56e860b ON store_specification USING btree (product_id);


--
-- Name: store_specification_specification_type_id_02b31dc0; Type: INDEX; Schema: public; Owner: bozorcom; Tablespace: 
--

CREATE INDEX store_specification_specification_type_id_02b31dc0 ON store_specification USING btree (specification_type_id);


--
-- Name: app_brand_category_id_a3caec35_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY app_brand
    ADD CONSTRAINT app_brand_category_id_a3caec35_fk_app_category_id FOREIGN KEY (category_id) REFERENCES app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_category_parent_id_8ce0344c_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY app_category
    ADD CONSTRAINT app_category_parent_id_8ce0344c_fk_app_category_id FOREIGN KEY (parent_id) REFERENCES app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product_brand_id_ec9e66ab_fk_app_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_product
    ADD CONSTRAINT store_product_brand_id_ec9e66ab_fk_app_brand_id FOREIGN KEY (brand_id) REFERENCES app_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product_category_id_574bae65_fk_app_category_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_product
    ADD CONSTRAINT store_product_category_id_574bae65_fk_app_category_id FOREIGN KEY (category_id) REFERENCES app_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_productimage_product_id_e50e4046_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_productimage
    ADD CONSTRAINT store_productimage_product_id_e50e4046_fk_store_product_id FOREIGN KEY (product_id) REFERENCES store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_review_author_id_2c9d22fe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_review
    ADD CONSTRAINT store_review_author_id_2c9d22fe_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_review_product_id_abc413b2_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_review
    ADD CONSTRAINT store_review_product_id_abc413b2_fk_store_product_id FOREIGN KEY (product_id) REFERENCES store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_specification_product_id_b56e860b_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_specification
    ADD CONSTRAINT store_specification_product_id_b56e860b_fk_store_product_id FOREIGN KEY (product_id) REFERENCES store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_specification_specification_type_i_02b31dc0_fk_store_spe; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY store_specification
    ADD CONSTRAINT store_specification_specification_type_i_02b31dc0_fk_store_spe FOREIGN KEY (specification_type_id) REFERENCES store_specificationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

