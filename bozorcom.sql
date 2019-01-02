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
    is_url boolean NOT NULL,
    url character varying(250),
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
-- Name: store_cartitem; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_cartitem (
    id integer NOT NULL,
    quantity integer NOT NULL,
    total_price double precision NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.store_cartitem OWNER TO bozorcom;

--
-- Name: store_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_cartitem_id_seq OWNER TO bozorcom;

--
-- Name: store_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_cartitem_id_seq OWNED BY public.store_cartitem.id;


--
-- Name: store_order; Type: TABLE; Schema: public; Owner: bozorcom
--

CREATE TABLE public.store_order (
    id integer NOT NULL,
    total_price double precision NOT NULL,
    additional_info text NOT NULL,
    order_status character varying(30) NOT NULL,
    customer_id integer,
    customer_full_name character varying(250),
    customer_phone character varying(60)
);


ALTER TABLE public.store_order OWNER TO bozorcom;

--
-- Name: store_order_id_seq; Type: SEQUENCE; Schema: public; Owner: bozorcom
--

CREATE SEQUENCE public.store_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_order_id_seq OWNER TO bozorcom;

--
-- Name: store_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bozorcom
--

ALTER SEQUENCE public.store_order_id_seq OWNED BY public.store_order.id;


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
-- Name: store_cartitem id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_cartitem ALTER COLUMN id SET DEFAULT nextval('public.store_cartitem_id_seq'::regclass);


--
-- Name: store_order id; Type: DEFAULT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_order ALTER COLUMN id SET DEFAULT nextval('public.store_order_id_seq'::regclass);


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

COPY public.app_category (id, title, slug, tree, icon, lft, rght, tree_id, level, parent_id, is_url, url) FROM stdin;
3	Микротўлқинли печлар	mikrotlinli-pechlar	f		16	17	4	1	2	f	\N
4	Чангютгичлар	changyutgichlar	f		26	27	4	1	2	f	\N
5	Кир ювиш машиналари	kir-yuvish-mashinalari	f		12	13	4	1	2	f	\N
6	Музлатгичлар	muzlatgichlar	f		20	21	4	1	2	f	\N
7	Телевизорлар	televizorlar	f		24	25	4	1	2	f	\N
8	Газ плиталар	gaz-plitalar	f		4	5	4	1	2	f	\N
9	Мини духовкалар	mini-duhovkalar	f		18	19	4	1	2	f	\N
10	Духовые шкафы и варочные поверхности	duhovye-shkafy-i-varochnye-poverhnosti	f		8	9	4	1	2	f	\N
11	Вытяжкалар	vytyazhkalar	f		2	3	4	1	2	f	\N
12	Идиш ювиш машиналари ва морозилниклар	idish-yuvish-mashinalari-va-morozilniklar	f		10	11	4	1	2	f	\N
13	Электр чойнаклар	elektr-chojnaklar	f		28	29	4	1	2	f	\N
14	Мясорубкалар	myasorubkalar	f		22	23	4	1	2	f	\N
15	Дазмоллар	dazmollar	f		6	7	4	1	2	f	\N
16	Кичик маиший техника буюмлари	kichik-maishij-tehnika-buyumlari	f		14	15	4	1	2	f	\N
2	Маиший техника	maishij-tehnika	t	microwave.png	1	30	4	0	\N	f	\N
24	Ipad	ipad	f		3	4	5	2	19	t	/category/all/?search=Ipad&min_price=1&max_price=9999999
19	Apple	apple	f		2	9	5	1	1	f	\N
20	LG	lg	f		12	13	5	1	1	f	\N
21	Meizu	meizu	f		14	15	5	1	1	f	\N
22	Huawei	huawei	f		10	11	5	1	1	f	\N
23	test	test	f		7	8	5	2	19	f	\N
25	Iphone 8	iphone-8	f		5	6	5	2	19	t	/category/all/?search=Iphone%208
17	Xiaomi	xiaomi	f		20	21	5	1	1	f	\N
18	Samsung	samsung	f		16	19	5	1	1	f	\N
1	Мобил телефонлар	mobil-telefonlar	t	smartphone.png	1	22	5	0	\N	f	\N
26	Samsung Galaxy	samsung-galaxy	f		17	18	5	2	18	t	/category/all/?search=Galaxy
\.


--
-- Name: app_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.app_category_id_seq', 26, true);


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
2	sliders/mi8-3_6XbbBdA.JPG
1	sliders/mi8-2.JPG
4	sliders/Mi_8_.jpg
3	sliders/M_max_3.JPG
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
61	Can add order	16	add_order
62	Can change order	16	change_order
63	Can delete order	16	delete_order
64	Can view order	16	view_order
65	Can add cart item	17	add_cartitem
66	Can change cart item	17	change_cartitem
67	Can delete cart item	17	delete_cartitem
68	Can view cart item	17	view_cartitem
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$dn8yEjFumgbb$+BmUaLQb2ueo5PZ3zW7O1E7/RSaYMZHLI1lptExTM3Y=	2018-12-26 09:13:00.506935+00	f	moderator	Bozorcom	Moderator	info@bozor.com	t	t	2018-12-02 13:15:17+00
1	pbkdf2_sha256$120000$SWix4a9g86Dx$xF0oCkdgIlCkgBa3sArolCHnu6ZIRWeMecvmnrtyy24=	2019-01-02 10:18:25.916908+00	t	admin			azam.mamatmurodov@gmail.com	t	t	2018-12-02 13:02:49.398795+00
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
218	2018-12-21 05:36:30.343215+00	29	Аксесуарлар	1	[{"added": {}}]	14	2
236	2018-12-21 09:01:16.702752+00	146	LG M700 (Q6) 2GB/16GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}]	10	2
263	2018-12-24 05:44:22.347714+00	160	T3/7 black	2	[{"changed": {"fields": ["title"]}}]	10	2
381	2018-12-29 06:43:12.99872+00	121	M6s 2/16 gb black	2	update through import_export	10	2
382	2018-12-29 06:43:13.000375+00	120	M5s 3/16 gb gold	2	update through import_export	10	2
27	2018-12-04 07:25:51.917712+00	5	Samsung Galaxy A600 gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A600 gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "162 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.9 x 70.8 x 7.7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
28	2018-12-04 07:35:43.675899+00	6	Samsung Galaxy A605 gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A605 gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "24 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.2 x 75.7 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS), 2G (EDGE), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
29	2018-12-04 08:52:20.413698+00	7	Samsung Galaxy A530 (A8) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.2GHz + 1.6GHz"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "200 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.2 x 70.6 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
30	2018-12-04 08:57:55.784868+00	8	Samsung Galaxy A530 (A8) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A530 (A8) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6G\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "200 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "149.2 x 70.6 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
31	2018-12-04 08:57:56.020759+00	7	Samsung Galaxy A530 (A8) Gold	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6G\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
32	2018-12-04 08:58:04.923117+00	7	Samsung Galaxy A530 (A8) Gold	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
33	2018-12-04 08:58:22.238285+00	8	Samsung Galaxy A530 (A8) Grey	2	[{"changed": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446", "fields": ["info"]}}]	10	2
34	2018-12-04 09:13:56.081268+00	9	Samsung Galaxy A 730 (A8 plus) black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) black"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "black"}}]	10	2
220	2018-12-21 05:36:42.618982+00	31	Шнурнинг автоматик қайтиши	1	[{"added": {}}]	14	2
35	2018-12-04 09:24:10.167853+00	10	Samsung Galaxy A 730 (A8 plus) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Gold"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
36	2018-12-04 09:29:44.356973+00	9	Samsung Galaxy A 730 (A8 plus) Black	2	[{"changed": {"fields": ["title"]}}]	10	2
37	2018-12-04 09:32:24.834608+00	11	Samsung Galaxy A 730 (A8 plus) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A 730 (A8 plus) Grey"}}, {"added": {"name": "specification", "object": "Android 7.1 Nougat (7.1.1)"}}, {"added": {"name": "specification", "object": "2.2\\u0413\\u0413\\u0446 + 1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500 mAh"}}, {"added": {"name": "specification", "object": "191 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "159.9 x 75.7 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
38	2018-12-04 09:41:12.219076+00	12	Samsung Galaxy A320 (A3) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2350mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "135.4 x 66.2 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
39	2018-12-04 09:46:12.858316+00	13	Samsung Galaxy A320 (A3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A320 (A3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2350mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "135.4 x 66.2 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
221	2018-12-21 05:36:49.824849+00	32	Фильтр назорати	1	[{"added": {}}]	14	2
264	2018-12-24 05:44:36.47057+00	159	Y5/2 black	2	[{"changed": {"fields": ["title"]}}]	10	2
383	2018-12-29 06:43:13.001745+00	119	Tab A 7 8 gb 4G SM-T285 White	2	update through import_export	10	2
384	2018-12-29 06:43:13.003139+00	118	iPad new 4G 2017 32 gb grey	2	update through import_export	10	2
385	2018-12-29 06:43:13.004415+00	117	Tab A 7 8 gb 4G SM-T285 silver	2	update through import_export	10	2
386	2018-12-29 06:43:13.005771+00	116	Tab A 7 8 gb 4G SM-T285 black	2	update through import_export	10	2
387	2018-12-29 06:43:13.007209+00	115	Tab A 8.0 LTE SM-T385 gold	2	update through import_export	10	2
388	2018-12-29 06:43:13.008463+00	114	iPad new wi-fi 2017 128 gb grey	2	update through import_export	10	2
389	2018-12-29 06:43:13.009753+00	113	Tab A 8.0 LTE SM-T385 black	2	update through import_export	10	2
40	2018-12-04 10:18:49.099405+00	14	Xiaomi Redmi 5 2/16Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 2/16Black"}}, {"added": {"name": "specification", "object": "Android 7.1"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f, 1080p"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8\\u044572,8\\u04457,7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
41	2018-12-04 10:19:15.739134+00	15	Samsung Galaxy A520 (A5)Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,9 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16\\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "159 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.1 x 71.4 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
42	2018-12-04 10:22:18.767871+00	14	Xiaomi Redmi 5 2/16 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
43	2018-12-04 10:23:07.772388+00	16	Samsung Galaxy A520 (A5)Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A520 (A5)Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,9 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16\\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "159 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.1 x 71.4 x 7.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
44	2018-12-04 10:23:55.096923+00	15	Samsung Galaxy A520 (A5) Black	2	[{"changed": {"fields": ["title"]}}]	10	2
45	2018-12-04 10:24:06.621562+00	1	Xiaomi RedMi 5a 16 GB	3		10	2
46	2018-12-04 10:24:40.998946+00	16	Samsung Galaxy A520 (A5) Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
47	2018-12-04 10:25:28.808969+00	2	Redmi 5 2/16 GB Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
48	2018-12-04 10:35:26.758939+00	17	Xiaomi Redmi 5 3/32 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440\\u043b\\u0438"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8 \\u0445 72,8 \\u0445 7,7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
222	2018-12-21 05:36:57.977383+00	33	Соф ҳажми	1	[{"added": {}}]	14	2
265	2018-12-24 05:45:06.050136+00	158	H930  V30 black	2	[{"changed": {"fields": ["title"]}}]	10	2
390	2018-12-29 06:43:13.011055+00	112	iPad new wi-fi 2017 128 gb gold	2	update through import_export	10	2
391	2018-12-29 06:43:13.012425+00	111	Tab E (SM-T561) Brown	2	update through import_export	10	2
392	2018-12-29 06:43:13.013741+00	110	iPad new wi-fi 2017 128 gb silver	2	update through import_export	10	2
393	2018-12-29 06:43:13.014968+00	109	Tab E (SM-T561) black	2	update through import_export	10	2
394	2018-12-29 06:43:13.01624+00	108	iPad new wi-fi 2017 32 gb \tgold	2	update through import_export	10	2
395	2018-12-29 06:43:13.017512+00	107	iPad new wi-fi 2017 32 gb \tsilver	2	update through import_export	10	2
49	2018-12-04 10:38:02.677289+00	18	Samsung Galaxy A710 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "172 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.5 x 74.1 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
50	2018-12-04 10:40:18.493589+00	19	Xiaomi Redmi 5 3/32 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 3/32 Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440\\u043b\\u0438"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151,8 \\u0445 72,8 \\u0445 7,7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
51	2018-12-04 10:43:54.143426+00	20	Samsung Galaxy A710 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy A710 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "172 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.5 x 74.1 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
52	2018-12-04 10:52:07.370277+00	21	Xiaomi Redmi 5 + 4/64 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Black"}}, {"added": {"name": "specification", "object": "Android 7.0 Nougat"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "179,5 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,8 \\u0445 75,45 \\u0445 8,05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
223	2018-12-21 05:37:07.405608+00	34	Соф оғирлиги	1	[{"added": {}}]	14	2
266	2018-12-24 05:52:39.28434+00	165	MC28H5013AW/BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "MC28H5013AW/BW"}}, {"added": {"name": "product image", "object": "MC28H5013AW/BW"}}, {"added": {"name": "product image", "object": "MC28H5013AW/BW"}}, {"added": {"name": "product image", "object": "MC28H5013AW/BW"}}, {"added": {"name": "product image", "object": "MC28H5013AW/BW"}}]	10	2
396	2018-12-29 06:43:13.018785+00	106	Tab S2 8.0 [SM-T719] gold	2	update through import_export	10	2
397	2018-12-29 06:43:13.02018+00	105	Tab S2 8.0 [SM-T719] black	2	update through import_export	10	2
398	2018-12-29 06:43:13.021474+00	104	Tab S3 SM-T825 silver	2	update through import_export	10	2
399	2018-12-29 06:43:13.022811+00	103	Tab S3 SM-T825 black	2	update through import_export	10	2
53	2018-12-04 11:07:09.453498+00	22	Samsung Galaxy G532 (J2 Prime) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "144.8 x 72.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
54	2018-12-04 11:11:40.581766+00	23	Samsung Galaxy G532 (J2 Prime) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G532 (J2 Prime) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "144.8 x 72.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
55	2018-12-04 11:14:06.065165+00	24	Xiaomi Redmi 5 + 4/64 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi Redmi 5 + 4/64 Gold"}}, {"added": {"name": "specification", "object": "Android 7.0 Nougat"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "179,5 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,8 \\u0445 75,45 \\u0445 8,05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
56	2018-12-04 11:20:02.212203+00	25	Xiaomi RedMi A1/64	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64"}}, {"added": {"name": "specification", "object": "Android 7.1.1"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 MP, f/2.0"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
57	2018-12-04 11:20:27.255653+00	25	Xiaomi RedMi A1/64 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
224	2018-12-21 05:37:13.736965+00	35	Умумий оғирлиги	1	[{"added": {}}]	14	2
267	2018-12-24 06:28:50.709944+00	16	Модел	2	[{"changed": {"fields": ["name"]}}]	14	2
400	2018-12-29 06:43:13.024262+00	102	iPad mini 4 128 gb WiFi+4G gold	2	update through import_export	10	2
401	2018-12-29 06:43:13.025675+00	101	iPad mini 4 128 gb WiFi+4G grey	2	update through import_export	10	2
402	2018-12-29 06:43:13.027019+00	100	iPad mini 4 128 gb WiFi+4G silver	2	update through import_export	10	2
403	2018-12-29 06:43:13.028277+00	99	N950 Note 8 gold	2	update through import_export	10	2
404	2018-12-29 06:43:13.029578+00	98	N950 Note 8 black	2	update through import_export	10	2
405	2018-12-29 06:43:13.030846+00	97	iPhone 8 plus 256 gb red	2	update through import_export	10	2
406	2018-12-29 06:43:13.032139+00	96	iPhone 8 plus 256 gb grey	2	update through import_export	10	2
58	2018-12-04 11:25:38.310244+00	26	Xiaomi RedMi A1/64 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi A1/64 Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.1"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 MP, f/2.0"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
59	2018-12-04 11:26:39.150155+00	27	Samsung Galaxy G570 (J5 prime) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "142.8 x 69.5 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
60	2018-12-04 11:32:39.631259+00	28	Samsung Galaxy G570 (J5 prime) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G570 (J5 prime) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "PLS TFT LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "142.8 x 69.5 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
61	2018-12-04 12:35:35.014339+00	21	Xiaomi Redmi 5 Plus 4/64 Black	2	[{"changed": {"fields": ["title"]}}]	10	2
62	2018-12-04 12:35:49.344739+00	24	Xiaomi Redmi 5 Plus 4/64 Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
63	2018-12-05 07:55:33.092393+00	2	Xiaomi Redmi 5 2/16 GB Gold	2	[{"changed": {"fields": ["title"]}}]	10	2
64	2018-12-05 08:06:22.298462+00	29	Xiaomi RedMi 5a 16 GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5a 16 GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 425, 1.4 \\u0413\\u0413\\u0446, 4 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "137 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "140 x 70 x 8 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
225	2018-12-21 05:49:41.75752+00	137	Чанг юткич Samsung VC18M21A0S1/EV	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433 \\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21A0S1/EV"}}, {"added": {"name": "specification", "object": "VC18M21A0S1/EV"}}, {"added": {"name": "specification", "object": "1800W"}}, {"added": {"name": "specification", "object": "380W"}}, {"added": {"name": "specification", "object": "Cyclone Force with Anti-tangle Turbine"}}, {"added": {"name": "specification", "object": "1.5L"}}, {"added": {"name": "specification", "object": "87dBA"}}, {"added": {"name": "specification", "object": "6m"}}, {"added": {"name": "specification", "object": "9m"}}, {"added": {"name": "specification", "object": "Body Variable (On/Off)"}}, {"added": {"name": "specification", "object": "Micro+Sponge"}}, {"added": {"name": "specification", "object": "EPA 12"}}, {"added": {"name": "specification", "object": "2-Step (NB250)"}}, {"added": {"name": "specification", "object": "-"}}, {"added": {"name": "specification", "object": "2-in-1"}}, {"added": {"name": "specification", "object": "Steel Telescopic"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "Pure Burgundy"}}, {"added": {"name": "specification", "object": "W272 x D398 x H243"}}, {"added": {"name": "specification", "object": "4.6kg"}}, {"added": {"name": "specification", "object": "8kg"}}]	10	2
268	2018-12-24 10:06:15.41966+00	36	Javlon Akmalov	1	[{"added": {}}]	14	2
407	2018-12-29 06:43:13.03353+00	95	J730 (J7) gold	2	update through import_export	10	2
408	2018-12-29 06:43:13.03493+00	94	J730 (J7) black	2	update through import_export	10	2
65	2018-12-05 08:08:05.626909+00	30	Samsung Galaxy G950 (S8) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
66	2018-12-05 08:08:09.296434+00	29	Xiaomi RedMi 5A 16 GB Black	2	[{"changed": {"fields": ["title"]}}]	10	2
67	2018-12-05 08:12:23.454558+00	31	Samsung Galaxy G950 (S8) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
68	2018-12-05 08:16:40.597749+00	32	Samsung Galaxy G950 (S8) Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G950 (S8) Red"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "155 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.9 x 68.1 x 8.0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE, LTE-A Cat. 16, VoLTE"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
69	2018-12-05 08:25:57.090311+00	33	Xiaomi RedMi 5A 32 GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5A 32 GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5A 32 GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 425, 1.4 \\u0413\\u0413\\u0446, 4 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "137 \\u0433"}}, {"added": {"name": "specification", "object": "140 x 70 x 8 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
70	2018-12-05 08:36:42.518416+00	34	Samsung Galaxy G960 (S9) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
226	2018-12-21 05:52:53.726517+00	137	Чангюткич Samsung VC18M21A0S1/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
270	2018-12-24 10:41:37.172029+00	37	Ишлаб чиқарилган давлат	1	[{"added": {}}]	14	2
71	2018-12-05 08:38:56.9416+00	35	Xiaomi RedMi 5 16GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "Qualcomm Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
72	2018-12-05 08:41:46.046816+00	36	Samsung Galaxy G960 (S9) Purple	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Purple"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Pruple"}}]	10	2
73	2018-12-05 08:48:22.430377+00	37	Samsung Galaxy G960 (S9) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G960 (S9) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147,7x68,7x8,5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "LTE: FDD, GPRS, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
74	2018-12-05 08:49:55.859027+00	38	Xiaomi RedMi 5 16GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 16GB Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "Qualcomm Snapdragon 450, 1.8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
75	2018-12-05 08:58:21.941881+00	39	Samsung Galaxy G965 (S9+) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,7 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
271	2018-12-24 10:50:13.958259+00	38	Тип	1	[{"added": {}}]	14	2
409	2018-12-29 06:43:13.036425+00	93	iPhone 8 plus 64 gb \tsilver	2	update through import_export	10	2
76	2018-12-05 09:00:15.510068+00	40	Xiaomi RedMi 5 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
77	2018-12-05 09:07:29.24492+00	41	Xiaomi RedMi 5 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 450, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "157 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.8 x 72.8 x 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
78	2018-12-05 09:12:12.811677+00	42	Samsung Galaxy G965 (S9+) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy G965 (S9+) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,7 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
79	2018-12-05 09:13:28.980207+00	43	Xiaomi RedMi 5 plus 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi 5 plus 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900 3G 4G LTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
80	2018-12-05 09:23:02.077237+00	44	Xiaomi RedMi 5 plus 32GB Black	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900 3G 4G LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
272	2018-12-24 10:52:45.337976+00	39	Камера хажми	1	[{"added": {}}]	14	2
410	2018-12-29 06:43:13.037771+00	92	iPhone 8 plus 64 gb grey	2	update through import_export	10	2
411	2018-12-29 06:43:13.039081+00	91	J530 (J5 ) gold	2	update through import_export	10	2
412	2018-12-29 06:43:13.040328+00	90	iPhone 8 256 gb \tred	2	update through import_export	10	2
81	2018-12-06 12:09:27.867728+00	45	Xiaomi RedMi 5 plus 64GB Gold	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
82	2018-12-06 12:14:34.766829+00	46	Xiaomi RedMi 5 plus 64GB Black	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 7.1.2"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "180 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.5 x 75.45 x 8.05"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM 900/1800/1900, 3G, 4G LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
83	2018-12-06 12:14:59.963756+00	45	Xiaomi RedMi 5 plus 64GB Gold	2	[{"changed": {"name": "specification", "object": "4000 mAh", "fields": ["info"]}}]	10	2
84	2018-12-06 12:19:59.546133+00	47	Xiaomi RedMi S2 32GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Grey"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
85	2018-12-06 12:20:32.146403+00	48	Samsung Galaxy  G965/256 (S9+) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
86	2018-12-06 12:23:27.67012+00	49	Xiaomi RedMi S2 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
227	2018-12-21 06:01:25.48365+00	138	Чангюткич Samsung VC18M2130SR/EV	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M2130SR/EV"}}, {"added": {"name": "specification", "object": "VC18M2130SR/EV"}}, {"added": {"name": "specification", "object": "1800W"}}, {"added": {"name": "specification", "object": "380W"}}, {"added": {"name": "specification", "object": "Cycloneforce with Anti-Tangle Turbine"}}, {"added": {"name": "specification", "object": "1.5L"}}, {"added": {"name": "specification", "object": "87dBA"}}, {"added": {"name": "specification", "object": "6m"}}, {"added": {"name": "specification", "object": "9m"}}, {"added": {"name": "specification", "object": "On/Off (NEW HANDLE)"}}, {"added": {"name": "specification", "object": "Micro+Sponge"}}, {"added": {"name": "specification", "object": "EPA 12"}}, {"added": {"name": "specification", "object": "2-Step (NB250)"}}, {"added": {"name": "specification", "object": "Parquet Brush(HB 100)"}}, {"added": {"name": "specification", "object": "2-in-1"}}, {"added": {"name": "specification", "object": "Steel Telescopic"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "Vitality Red"}}, {"added": {"name": "specification", "object": "W272 \\u0445 D398 \\u0445 H243"}}, {"added": {"name": "specification", "object": "4.6kg"}}, {"added": {"name": "specification", "object": "8kg"}}]	10	2
273	2018-12-24 10:53:13.937946+00	40	Камера ички қопламаси	1	[{"added": {}}]	14	2
87	2018-12-06 12:23:36.052443+00	50	Samsung Galaxy  G965/256 (S9+) Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Grey"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
88	2018-12-06 12:27:12.915447+00	51	Xiaomi RedMi S2 64GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Grey"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
89	2018-12-06 12:27:30.773644+00	52	Samsung Galaxy  G965/256 (S9+) Purple	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  G965/256 (S9+) Purple"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,8 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3500mAh"}}, {"added": {"name": "specification", "object": "189 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.1 x 73.8 x 8.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Purple"}}]	10	2
90	2018-12-06 12:28:37.33322+00	36	Samsung Galaxy G960 (S9) Purple	2	[{"changed": {"name": "specification", "object": "Purple", "fields": ["info"]}}]	10	2
91	2018-12-06 12:33:44.890489+00	53	Xiaomi RedMi S2 64GB Gold	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 625, 2 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0413"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "160.73 x 77.26 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
92	2018-12-06 12:35:58.194225+00	54	Samsung Galaxy  J105 (J1 mini) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy  J105 (J1 mini) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.2\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "0.75 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "4 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1500 mAh"}}, {"added": {"name": "specification", "object": "123 \\u0433"}}, {"added": {"name": "specification", "object": "121.6 x 63.1 x 10.8"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
228	2018-12-21 06:02:50.658295+00	33	Ўлчами	2	[{"changed": {"fields": ["name"]}}]	14	2
274	2018-12-24 10:54:06.51894+00	41	Қуввати	1	[{"added": {}}]	14	2
93	2018-12-06 12:40:05.93669+00	55	Xiaomi RedMi Note 5 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1.2 (Nougat)"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
94	2018-12-06 12:41:10.441533+00	53	Xiaomi RedMi S2 64GB Gold	2	[{"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi S2 64GB Gold"}}]	10	2
95	2018-12-06 12:42:31.202602+00	56	Samsung Galaxy J110 (J1 Ace) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "4\\u00a0\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "512\\u00a0\\u041c\\u0411"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1800 mAh"}}, {"added": {"name": "specification", "object": "128\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "67x137x10"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
96	2018-12-06 12:46:04.030891+00	57	Xiaomi RedMi Note 5 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 32GB Gold"}}, {"added": {"name": "specification", "object": "Android 7.1.2 (Nougat)"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
97	2018-12-06 12:47:15.308208+00	58	Samsung Galaxy J110 (J1 Ace) White	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J110 (J1 Ace) White"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "4\\u00a0\\u0413\\u0411"}}, {"added": {"name": "specification", "object": "512\\u00a0\\u041c\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1800 mAh"}}, {"added": {"name": "specification", "object": "128\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "67x137x10"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS)"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
275	2018-12-24 10:54:27.381839+00	42	Кафолат мухлати	1	[{"added": {}}]	14	2
413	2018-12-29 06:43:13.041563+00	89	J530 (J5 ) black	2	update through import_export	10	2
414	2018-12-29 06:43:13.042932+00	88	iPhone 8 256 gb \tgrey	2	update through import_export	10	2
98	2018-12-06 12:52:55.627763+00	59	Xiaomi RedMi Note 5 64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi RedMi Note 5 64GB Black"}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Snapdragon 636, 1.8 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f + 5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "13\\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.99 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "181 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158.6 x 75.4 x 8.1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G/3G/4G(LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
99	2018-12-06 12:57:52.08248+00	60	Xiaomi Mi 6 6/64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "specification", "object": "Android 7.1"}}, {"added": {"name": "specification", "object": "\\"Snapdragon 835,   2.45 \\u0413\\u0413\\u0446 + 1.9 \\u0413\\u0413\\u0446, 8 \\u0442\\u0430\\""}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.15 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3350 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "168 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "145.2 x 70.5 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G(WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
100	2018-12-06 13:00:54.886135+00	61	Samsung Galaxy J200 (J2) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2000 mAh"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "136.5 x 69.0 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
101	2018-12-06 13:05:38.68413+00	62	Samsung Galaxy J200 (J2) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J200 (J2) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2000 mAh"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "136.5 x 69.0 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, 3G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
102	2018-12-07 04:20:48.658143+00	60	Xiaomi Mi 6 6/64GB Black	2	[{"changed": {"fields": ["image"]}}]	10	2
103	2018-12-07 04:25:13.23924+00	60	Xiaomi Mi 6 6/64GB Black	2	[{"changed": {"fields": ["image"]}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}, {"added": {"name": "product image", "object": "Xiaomi Mi 6 6/64GB Black"}}]	10	2
276	2018-12-24 11:01:13.954392+00	43	Бренд	1	[{"added": {}}]	14	2
415	2018-12-29 06:43:13.044214+00	87	J330 (J3) gold	2	update through import_export	10	2
416	2018-12-29 06:43:13.045585+00	86	J330 (J3) black	2	update through import_export	10	2
417	2018-12-29 06:43:13.046888+00	85	iPhone 8 64 gb red	2	update through import_export	10	2
418	2018-12-29 06:43:13.048228+00	84	J701 (J7) gold	2	update through import_export	10	2
419	2018-12-29 06:43:13.04957+00	83	iPhone 8 64 gb silver	2	update through import_export	10	2
420	2018-12-29 06:43:13.050855+00	82	J701 (J7) black	2	update through import_export	10	2
421	2018-12-29 06:43:13.052109+00	81	iPhone 8 64 gb gold	2	update through import_export	10	2
422	2018-12-29 06:43:13.053427+00	80	iPhone 8 64 gb \tgrey	2	update through import_export	10	2
423	2018-12-29 06:43:13.054801+00	79	iPhone 7 plus 32 gb \tgold	2	update through import_export	10	2
424	2018-12-29 06:43:13.056123+00	78	iPhone 7 plus 32 gb black	2	update through import_export	10	2
104	2018-12-11 09:29:32.855652+00	63	iPhone X 64GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 64GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic,  4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
105	2018-12-11 09:34:18.362686+00	64	iPhone X 256GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
106	2018-12-11 09:36:36.985067+00	65	Samsung Galaxy J250M (J2 Pro) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "153 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72.3 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
107	2018-12-11 09:38:12.684013+00	66	iPhone X 256GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "product image", "object": "iPhone X 256GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 4+2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "256 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "OLED (Super Retina HD)"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "174 \\u0433"}}, {"added": {"name": "specification", "object": "143.6 \\u0445 70.9 \\u0445 7.7 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
108	2018-12-11 09:40:07.547789+00	67	Samsung Galaxy J250M (J2 Pro) gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "product image", "object": "Samsung\\u00a0Galaxy J250M (J2 Pro) gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "153 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72.3 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
314	2018-12-26 09:28:55.436225+00	67	Мустақил TV-тюнерлар сони	1	[{"added": {}}]	14	2
425	2018-12-29 06:43:13.05754+00	77	iPhone 7 128 gb \tred	2	update through import_export	10	2
109	2018-12-11 09:42:45.803126+00	68	iPhone SE 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone SE 32GB Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A9 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 M9, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "\\u0440\\u0430\\u043d\\u0433\\u043b\\u0438 IPS, \\u0441\\u0435\\u043d\\u0441\\u043e\\u0440"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2716 mAh"}}, {"added": {"name": "specification", "object": "113 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "123.8x58.6x7.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
110	2018-12-11 09:46:41.364784+00	69	iPhone 6 32GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "product image", "object": "iPhone 6 32GB Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 M8, 1.4 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1810 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "129 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.1 x 67 x 6.9 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G (EDGE) 3G (WCDMA/UMTS) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
111	2018-12-11 09:53:03.113435+00	70	iPhone 7 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Black"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
112	2018-12-11 09:55:45.21151+00	71	Samsung Galaxy J320 (J3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J320 (J3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8.0 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5.0 M\\u041f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2600 mAh"}}, {"added": {"name": "specification", "object": "138\\u00a0\\u0433"}}, {"added": {"name": "specification", "object": "142.7 x 70.1 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
113	2018-12-11 09:58:02.781486+00	72	iPhone 7 32GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
315	2018-12-26 09:29:01.712076+00	68	Кутиш таймери	1	[{"added": {}}]	14	2
426	2018-12-29 06:43:13.059037+00	76	iPhone 7 128 gb silver	2	update through import_export	10	2
427	2018-12-29 06:43:13.060539+00	75	iPhone 7 128 gb rose gold	2	update through import_export	10	2
114	2018-12-11 10:01:42.823033+00	73	iPhone 7 32GB RoseGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 32GB RoseGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "RoseGold"}}]	10	2
115	2018-12-11 10:05:39.394143+00	74	iPhone 7 128GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
116	2018-12-11 10:09:09.980588+00	75	iPhone 7 128GB RoseGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB RoseGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "RoseGold"}}]	10	2
117	2018-12-11 10:12:51.971673+00	76	iPhone 7 128GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB Silver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
118	2018-12-11 10:17:03.738802+00	77	iPhone 7 128GB\tRed	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "product image", "object": "iPhone 7 128GB\\tRed"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1960 mAh"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138,3x67,1x7,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
316	2018-12-26 09:29:51.494475+00	69	Деворга ўрнатиш имконияти	1	[{"added": {}}]	14	2
428	2018-12-29 06:43:13.06184+00	74	iPhone 7 128 gb gold	2	update through import_export	10	2
429	2018-12-29 06:43:13.06339+00	73	iPhone 7 32 gb rose gold	2	update through import_export	10	2
119	2018-12-11 10:21:55.087523+00	78	iPhone 7 plus 32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB Black"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2900 mAh"}}, {"added": {"name": "specification", "object": "188 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "158,2\\u044577,9\\u04457,3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
120	2018-12-11 10:25:38.595289+00	79	iPhone 7 plus 32GB\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPhone 7 plus 32GB\\tGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A10, 2.3 \\u0413\\u0413\\u0446, 4 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina"}}, {"added": {"name": "specification", "object": "5.5\\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2900 mAh"}}, {"added": {"name": "specification", "object": "188 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "155.4\\u00d775.8\\u00d77.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
121	2018-12-11 10:30:38.906962+00	80	iPhone 8  64GB\tGrey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB\\tGrey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
122	2018-12-11 10:33:48.89376+00	81	iPhone 8  64GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
123	2018-12-11 10:34:24.638598+00	82	Samsung Galaxy J701 (J7) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0433"}}, {"added": {"name": "specification", "object": "152.4 x 78.6 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
317	2018-12-26 09:29:57.444874+00	70	Таглик билан бирга ўлчамлари (ШxВxГ)	1	[{"added": {}}]	14	2
430	2018-12-29 06:43:13.064639+00	72	iPhone 7 32 gb gold	2	update through import_export	10	2
124	2018-12-11 10:36:35.041852+00	83	iPhone 8  64GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
125	2018-12-11 10:37:20.169479+00	84	Samsung Galaxy J701 (J7) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J701 (J7) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "170 \\u0433"}}, {"added": {"name": "specification", "object": "152.4 x 78.6 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
126	2018-12-11 10:39:14.759409+00	85	iPhone 8  64GB Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "product image", "object": "iPhone 8  64GB Red"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A11 Bionic, 2.3 \\u0413\\u0413\\u0446, 6 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "7 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "4.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "1821 mAh"}}, {"added": {"name": "specification", "object": "148 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "138.4 \\u0445 67.3 \\u0445 7.3 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "GSM, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
127	2018-12-11 10:40:38.181294+00	86	Samsung Galaxy J330 (J3) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5.0 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400 mAh"}}, {"added": {"name": "specification", "object": "142 \\u0433"}}, {"added": {"name": "specification", "object": "143.2 x 70.3 x 8.2"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
128	2018-12-11 10:43:25.584571+00	87	Samsung Galaxy J330 (J3) Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy J330 (J3) Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2400mAh"}}, {"added": {"name": "specification", "object": "142 \\u0433"}}, {"added": {"name": "specification", "object": "143.2 x 70.3 x 8.2"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
318	2018-12-26 09:30:14.677167+00	71	Таглик билан вазни	1	[{"added": {}}]	14	2
431	2018-12-29 06:43:13.066077+00	71	J320 (J3) gold	2	update through import_export	10	2
432	2018-12-29 06:43:13.067467+00	70	iPhone 7 32 gb black	2	update through import_export	10	2
433	2018-12-29 06:43:13.068928+00	69	iPhone 6 32 gb grey	2	update through import_export	10	2
434	2018-12-29 06:43:13.070205+00	68	iPhone SE 32 gb gold	2	update through import_export	10	2
435	2018-12-29 06:43:13.071468+00	67	J250M (J2 Pro) gold	2	update through import_export	10	2
436	2018-12-29 06:43:13.072725+00	66	iPhone X 256 gb grey	2	update through import_export	10	2
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
361	2018-12-29 06:43:12.970762+00	141	P20 lite black	2	update through import_export	10	2
141	2018-12-11 11:42:20.565719+00	98	Samsung Galaxy N950 Note 8 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 mAh"}}, {"added": {"name": "specification", "object": "195 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "162.5 x 74.8 x 8.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
142	2018-12-11 11:45:54.361476+00	99	Samsung Galaxy N950 Note 8 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy N950 Note 8 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "6 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "6.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300mAh"}}, {"added": {"name": "specification", "object": "195 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "162.5 x 74.8 x 8.6 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G LTE, GSM"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
143	2018-12-11 11:48:29.860671+00	100	iPad mini 4 128GB  WiFi+4G Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Silver"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
144	2018-12-11 11:48:50.625382+00	101	iPad mini 4 128GB  WiFi+4G Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Grey"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G (LTE)"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
145	2018-12-11 11:52:22.044226+00	102	iPad mini 4 128GB  WiFi+4G Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "product image", "object": "iPad mini 4 128GB  WiFi+4G Gold"}}, {"added": {"name": "specification", "object": "iOS 11"}}, {"added": {"name": "specification", "object": "Apple A8, 1,5 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Retina HD"}}, {"added": {"name": "specification", "object": "7.9 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "19.1 mAh"}}, {"added": {"name": "specification", "object": "304 \\u0433"}}, {"added": {"name": "specification", "object": "203,2 \\u0445 134,8 \\u0445 6,1 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G 3G 4G(LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
362	2018-12-29 06:43:12.972165+00	140	P smart gold	2	update through import_export	10	2
363	2018-12-29 06:43:12.97368+00	139	P smart black	2	update through import_export	10	2
364	2018-12-29 06:43:12.975103+00	138	VC18M2130SR/EV	2	update through import_export	10	2
146	2018-12-11 11:52:53.8769+00	103	Samsung Galaxy Tab S3 SM-T825 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.15 \\u0413\\u0413\\u0446, 1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "6000 mAh"}}, {"added": {"name": "specification", "object": "434 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "237.3 x 169.0 x 6.0"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
147	2018-12-11 11:56:29.42087+00	104	Samsung Galaxy Tab S3 SM-T825 Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S3 SM-T825 Silver"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.15 \\u0413\\u0413\\u0446, 1,6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "6000 mAh"}}, {"added": {"name": "specification", "object": "434 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "237.3 x 169.0 x 6.0"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
148	2018-12-11 12:03:30.911945+00	105	Samsung Galaxy Tab S2 8.0 [SM-T719] Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446, 1.4\\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2.1 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "8.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "267 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "198.6 x 134.8 x 5.6"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
149	2018-12-11 12:08:40.9186+00	106	Samsung Galaxy Tab S2 8.0 [SM-T719] Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab S2 8.0 [SM-T719] Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.8 \\u0413\\u0413\\u0446, 1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2.1 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "8.0 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 mAh"}}, {"added": {"name": "specification", "object": "267 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "198.6 x 134.8 x 5.6"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
242	2018-12-21 09:17:20.120721+00	151	Huawei P8lite Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P8lite Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.0"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 620"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "131 \\u0433"}}, {"added": {"name": "specification", "object": "143 x 70.60 x 7.70"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
150	2018-12-11 12:13:59.250443+00	107	iPad new wi-fi 2017 32GB\tSilver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tSilver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
151	2018-12-11 12:14:01.627969+00	108	iPad new wi-fi 2017 32GB\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 32GB\\tGold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
152	2018-12-11 12:17:55.14123+00	109	Samsung Galaxy Tab E (SM-T561) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "9.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "495 \\u0433"}}, {"added": {"name": "specification", "object": "241.9 x 149.5 x 8.5"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
153	2018-12-11 12:19:50.370652+00	110	iPad new wi-fi 2017 128GB Silver	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Silver"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Silver"}}]	10	2
251	2018-12-21 09:28:43.472978+00	157	Huawei Y5/2\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tGold"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tGold"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tGold"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tGold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 OS, v5.1 (Lollipop)"}}, {"added": {"name": "specification", "object": "Mediatek MT6735P"}}, {"added": {"name": "specification", "object": "8/16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1/2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "135 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
365	2018-12-29 06:43:12.976394+00	137	VC18M21A0S1/EV	2	update through import_export	10	2
154	2018-12-11 12:21:25.363604+00	111	Samsung Galaxy Tab E (SM-T561) Brown	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab E (SM-T561) Brown"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "9.6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "495 \\u0433"}}, {"added": {"name": "specification", "object": "241.9 x 149.5 x 8.5"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA"}}, {"added": {"name": "specification", "object": "Brown"}}]	10	2
155	2018-12-11 12:22:38.265276+00	112	iPad new wi-fi 2017 128GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Gold"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
156	2018-12-11 12:24:44.212495+00	113	Samsung Galaxy Tab A 8.0 LTE SM-T385 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "364 \\u0433"}}, {"added": {"name": "specification", "object": "212.1 x 124.1 x 8.9"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
157	2018-12-11 12:25:39.743427+00	114	iPad new wi-fi 2017 128GB Grey	1	[{"added": {}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "product image", "object": "iPad new wi-fi 2017 128GB Grey"}}, {"added": {"name": "specification", "object": "iOS 10"}}, {"added": {"name": "specification", "object": "Apple A9, 1,8 \\u0413\\u0413\\u0446, 2 \\u044f\\u0434\\u0440\\u043e"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "1.2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "9.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "8610 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "469 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "170 x 240 x 7.5 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "Wi-Fi (802.11a/b/g/n/ac) / \\u0434\\u0432\\u0443\\u0445\\u043a\\u0430\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 2.4GHz \\u0438 5GHz, MIMO / Bluetooth 4.2 / GPS"}}, {"added": {"name": "specification", "object": "Grey"}}]	10	2
158	2018-12-11 12:27:59.906337+00	115	Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "product image", "object": "Samsung Galaxy Tab A 8.0 LTE SM-T385 Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "TFT"}}, {"added": {"name": "specification", "object": "8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "5000 mAh"}}, {"added": {"name": "specification", "object": "364 \\u0433"}}, {"added": {"name": "specification", "object": "212.1 x 124.1 x 8.9"}}, {"added": {"name": "specification", "object": "1"}}, {"added": {"name": "specification", "object": "2G GSM, 3G WCDMA, 4G LTE FDD, 4G LTE TDD"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
366	2018-12-29 06:43:12.977782+00	136	X240 (K8)\t gold	2	update through import_export	10	2
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
367	2018-12-29 06:43:12.979185+00	135	X240 (K8)\t black	2	update through import_export	10	2
368	2018-12-29 06:43:12.980716+00	134	M250 (K10) black	2	update through import_export	10	2
369	2018-12-29 06:43:12.982078+00	133	M250 (K10) Titan	2	update through import_export	10	2
180	2018-12-20 09:41:51.522419+00	120	Meizu M5s 3/16GB Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M5s 3/16GB Gold"}}, {"added": {"name": "product image", "object": "Meizu M5s 3/16GB Gold"}}, {"added": {"name": "product image", "object": "Meizu M5s 3/16GB Gold"}}, {"added": {"name": "product image", "object": "Meizu M5s 3/16GB Gold"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.2\\u044572.5\\u04458.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
181	2018-12-20 09:45:23.334383+00	120	Meizu M5s 3/16GB Gold	2	[{"changed": {"fields": ["image"]}}, {"changed": {"name": "product image", "object": "Meizu M5s 3/16GB Gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "Meizu M5s 3/16GB Gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "Meizu M5s 3/16GB Gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "Meizu M5s 3/16GB Gold", "fields": ["image"]}}]	10	2
182	2018-12-20 09:52:05.144636+00	121	Meizu M6s 2/16GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6s 2/16GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 2/16GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 2/16GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 2/16GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.0 \\u0413\\u0413\\u0446 + 1.5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3080 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.2\\u044572.8\\u04458.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
183	2018-12-20 10:00:19.484384+00	122	Meizu M6 3/32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 3/32GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "1.0 \\u0413\\u0413\\u0446 + 1.5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3070 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.2 \\u044572.8 \\u04458.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
184	2018-12-20 10:05:18.673956+00	123	Meizu M6s 3/32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.0 \\u0413\\u0433\\u0446 + 1.6 \\u0413\\u0433\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "152 \\u044572.5\\u04458"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
229	2018-12-21 08:38:01.101401+00	139	Huawei P smart Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P smart Black"}}, {"added": {"name": "product image", "object": "Huawei P smart Black"}}, {"added": {"name": "product image", "object": "Huawei P smart Black"}}, {"added": {"name": "product image", "object": "Huawei P smart Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 8.0"}}, {"added": {"name": "specification", "object": "HUAWEI Kirin 659"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f + 2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT-LCD"}}, {"added": {"name": "specification", "object": "5.65 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "72.05 x 150.1 x 7.45"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G, LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
185	2018-12-20 10:18:23.946637+00	124	Meizu M6 Note 3/16GB  Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/16GB  Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.0 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "173 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "154.6 \\u0445 75.2 \\u0445 8.35"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
186	2018-12-20 10:22:35.418971+00	125	Meizu M6 Note 3/32GB  Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/32GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/32GB  Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 3/32GB  Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.0 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "173 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "154.6 \\u0445 75.2 \\u0445 8.35"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
187	2018-12-20 10:26:52.598756+00	126	Meizu M6 Note 4/64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6 Note 4/64GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.0 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "173 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "154.6 \\u0445 75.2 \\u0445 8.35"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
188	2018-12-20 10:34:03.587635+00	127	Meizu M6s 3/32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "product image", "object": "Meizu M6s 3/32GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.0 \\u0413\\u0433\\u0446 + 1.6 \\u0413\\u0433\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5.7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "160 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "152 \\u0445 72,54 \\u0445 8,0"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
230	2018-12-21 08:44:38.928878+00	140	Huawei P smart Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P smart Gold"}}, {"added": {"name": "product image", "object": "Huawei P smart Gold"}}, {"added": {"name": "product image", "object": "Huawei P smart Gold"}}, {"added": {"name": "product image", "object": "Huawei P smart Gold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 8.0"}}, {"added": {"name": "specification", "object": "HUAWEI Kirin 659"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f + 2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT-LCD"}}, {"added": {"name": "specification", "object": "5.65 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "72.05 x 150.1 x 7.45"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G, 3G, 4G, LTE"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
189	2018-12-20 10:38:32.463589+00	128	Meizu PRO 7 4/64GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Black"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147.6 x 70.7 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
190	2018-12-20 10:42:19.916277+00	129	Meizu PRO 7 4/64GB Red	1	[{"added": {}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "product image", "object": "Meizu PRO 7 4/64GB Red"}}, {"added": {"name": "specification", "object": "Android"}}, {"added": {"name": "specification", "object": "2.6 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u043f + 12 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "Super AMOLED"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "163 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147.6 x 70.7 x 7.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)"}}, {"added": {"name": "specification", "object": "Red"}}]	10	2
191	2018-12-20 10:54:09.562661+00	130	LG X230 (K4)\t Titan	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\t Titan"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1.1 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT (On-Cell touch)"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "150 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "145 x 74 x 8"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Titan"}}]	10	2
192	2018-12-20 11:01:00.72746+00	131	LG X230 (K4)\tBrown	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\tBrown"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\tBrown"}}, {"added": {"name": "product image", "object": "LG X230 (K4)\\tBrown"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1.1 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT (On-Cell touch)"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "150 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "145 x 74 x 8"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Brown"}}]	10	2
193	2018-12-20 11:14:51.486139+00	132	LG K430 (K10 LTE) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG K430 (K10 LTE) Black"}}, {"added": {"name": "product image", "object": "LG K430 (K10 LTE) Black"}}, {"added": {"name": "product image", "object": "LG K430 (K10 LTE) Black"}}, {"added": {"name": "product image", "object": "LG K430 (K10 LTE) Black"}}, {"added": {"name": "product image", "object": "LG K430 (K10 LTE) Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,14 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "In-Cell Touch IPS [2]"}}, {"added": {"name": "specification", "object": "5.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "140 \\u0433"}}, {"added": {"name": "specification", "object": "146.6 x 74.8 x 8.8"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
370	2018-12-29 06:43:12.983423+00	132	K430 (K10 LTE) black	2	update through import_export	10	2
371	2018-12-29 06:43:12.984958+00	131	X230 (K4) brown	2	update through import_export	10	2
194	2018-12-20 11:21:22.412858+00	133	LG M250 (K10) Titan	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Titan"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2800 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.7 x 75.3 x 7.99"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Titan"}}]	10	2
195	2018-12-20 11:25:49.204994+00	134	LG M250 (K10) Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M250 (K10) Black"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Black"}}, {"added": {"name": "product image", "object": "LG M250 (K10) Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.3 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2800 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "138 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "146.7 x 75.3 x 7.99"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
196	2018-12-20 11:38:37.323616+00	135	LG X240 (K8)\t Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Black"}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Black"}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS (On-Cell Touch)"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "147.8 \\u0433"}}, {"added": {"name": "specification", "object": "147.15 x 73.2 x 8.25"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
197	2018-12-20 11:48:28.305262+00	136	LG X240 (K8)\t Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Gold"}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Gold"}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Gold"}}, {"added": {"name": "product image", "object": "LG X240 (K8)\\t Gold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1.3 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1.5 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS (On-Cell Touch)"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "147.8 \\u0433"}}, {"added": {"name": "specification", "object": "147.15 x 73.2 x 8.25"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
198	2018-12-20 18:47:32.608422+00	136	LG X240 (K8)\t Gold	2	[{"changed": {"fields": ["featured", "new", "top_rated"]}}]	10	1
199	2018-12-20 18:47:44.434269+00	123	Meizu M6s 3/32GB Black	2	[{"changed": {"fields": ["new", "top_rated"]}}]	10	1
200	2018-12-20 18:48:02.70949+00	112	iPad new wi-fi 2017 128GB Gold	2	[{"changed": {"fields": ["featured", "new"]}}]	10	1
201	2018-12-20 18:48:17.715228+00	74	iPhone 7 128GB Gold	2	[{"changed": {"fields": ["featured", "new", "top_rated"]}}]	10	1
202	2018-12-20 18:48:33.061939+00	36	Samsung Galaxy G960 (S9) Purple	2	[{"changed": {"fields": ["featured", "new", "top_rated"]}}]	10	1
203	2018-12-20 18:49:08.189187+00	2	Маиший техника	2	[{"changed": {"fields": ["icon"]}}]	8	1
204	2018-12-20 18:49:18.606218+00	1	Мобил телефонлар	2	[{"changed": {"fields": ["icon"]}}]	8	1
205	2018-12-21 05:27:50.143758+00	16	Модел коди	1	[{"added": {}}]	14	2
206	2018-12-21 05:28:01.25532+00	17	Истеъмол қуввати	1	[{"added": {}}]	14	2
207	2018-12-21 05:28:27.562806+00	18	Шланг қуввати	1	[{"added": {}}]	14	2
208	2018-12-21 05:28:38.151673+00	19	Айланиш тури	1	[{"added": {}}]	14	2
209	2018-12-21 05:28:49.433531+00	20	Сиғими	1	[{"added": {}}]	14	2
210	2018-12-21 05:35:25.7592+00	21	Шовқин даражаси	1	[{"added": {}}]	14	2
211	2018-12-21 05:35:34.05442+00	22	Шнур узунлиги	1	[{"added": {}}]	14	2
212	2018-12-21 05:35:42.225666+00	23	Ҳаракат радиуси	1	[{"added": {}}]	14	2
213	2018-12-21 05:35:52.873946+00	24	Бошқарув	1	[{"added": {}}]	14	2
214	2018-12-21 05:36:00.667431+00	25	Pre-Motor фильтри	1	[{"added": {}}]	14	2
215	2018-12-21 05:36:08.134649+00	26	Чиқариш фильтри	1	[{"added": {}}]	14	2
216	2018-12-21 05:36:14.412219+00	27	Асосий чўткаси	1	[{"added": {}}]	14	2
217	2018-12-21 05:36:23.691225+00	28	Қўшимча чўткаси	1	[{"added": {}}]	14	2
219	2018-12-21 05:36:36.01519+00	30	Труба	1	[{"added": {}}]	14	2
231	2018-12-21 08:48:34.721407+00	141	Huawei P 20 lite Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P 20 lite Black"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite Black"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite Black"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite Black"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 659"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f + 2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT,  2280 x 1080"}}, {"added": {"name": "specification", "object": "5.84 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "145 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.6 x 71.2 x 7.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
232	2018-12-21 08:51:32.688917+00	142	Huawei P 20 lite\tBlue	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P 20 lite\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20 lite\\tBlue"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 659"}}, {"added": {"name": "specification", "object": "64 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f + 2 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "TFT,  2280 x 1080"}}, {"added": {"name": "specification", "object": "5.84 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "145 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "148.6 x 71.2 x 7.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Blue"}}]	10	2
233	2018-12-21 08:57:43.470143+00	143	Huawei P 20\tBlack	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlack"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 8.1 Oreo (Emotion UI 8.1)"}}, {"added": {"name": "specification", "object": "\\u0412\\u043e\\u0441\\u044c\\u043c\\u0438\\u044f\\u0434\\u0435\\u0440\\u043d\\u044b\\u0439 Kirin 970 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 i7"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "32 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "24 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD,  2244 x 1080"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3400 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "150\\u00a0x 72\\u00a0x 7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
234	2018-12-21 09:00:46.070551+00	144	LG M700 (Q6) 2GB/16GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "149 \\u0433"}}, {"added": {"name": "specification", "object": "142.5 x 69.3 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
235	2018-12-21 09:01:00.51651+00	145	Huawei P 20\tBlue	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlue"}}, {"added": {"name": "product image", "object": "Huawei P 20\\tBlue"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 8.1 Oreo (Emotion UI 8.1)"}}, {"added": {"name": "specification", "object": "\\u0412\\u043e\\u0441\\u044c\\u043c\\u0438\\u044f\\u0434\\u0435\\u0440\\u043d\\u044b\\u0439 Kirin 970 + \\u0441\\u043e\\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u043e\\u0440 i7"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "32 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "24 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD,  2244 x 1080"}}, {"added": {"name": "specification", "object": "5.8 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3400 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "165 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "150\\u00a0x 72\\u00a0x 7"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Blue"}}]	10	2
372	2018-12-29 06:43:12.986237+00	130	X230 (K4) titan	2	update through import_export	10	2
237	2018-12-21 09:04:30.804453+00	147	Huawei HONOR 6A Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei HONOR 6A Black"}}, {"added": {"name": "product image", "object": "Huawei HONOR 6A Black"}}, {"added": {"name": "product image", "object": "Huawei HONOR 6A Black"}}, {"added": {"name": "product image", "object": "Huawei HONOR 6A Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 7.0 (Nougat)"}}, {"added": {"name": "specification", "object": "Octa-core 1.5 GHz Cortex-A53"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD, 720 x 1280"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3020 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "143 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "143.7 x 71 x 8.2"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
238	2018-12-21 09:05:24.898983+00	146	LG M700 (Q6) 2GB/16GB Gold	2	[{"changed": {"fields": ["title", "image"]}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold"}}, {"changed": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "LG M700 (Q6) 2GB/16GB Gold", "fields": ["image"]}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "149 \\u0433"}}, {"added": {"name": "specification", "object": "142.5 x 69.3 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
239	2018-12-21 09:07:23.532971+00	148	Huawei GT3 White	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei GT3 White"}}, {"added": {"name": "product image", "object": "Huawei GT3 White"}}, {"added": {"name": "product image", "object": "Huawei GT3 White"}}, {"added": {"name": "product image", "object": "Huawei GT3 White"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.0"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 650"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD, 1920 x 1080"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "156 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147.1 x 73.76 x 8.3"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
240	2018-12-21 09:10:51.554112+00	149	Huawei P8lite 2017 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Black"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 7.1"}}, {"added": {"name": "specification", "object": "Hisilicon Kirin 655"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD, 1920 x 1080"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "147 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147.2 x 72.9 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
241	2018-12-21 09:13:41.068631+00	150	Huawei P8lite 2017 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite 2017 Gold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 7.1"}}, {"added": {"name": "specification", "object": "Hisilicon Kirin 655"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "12 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD, 1920 x 1080"}}, {"added": {"name": "specification", "object": "5.2 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "147 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "147.2 x 72.9 x 7.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
258	2018-12-21 12:56:21.390244+00	164	Чангютгич Samsung VC18M21A0SB/EV	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u0433\\u0438\\u0447 Samsung VC18M21A0SB/EV"}}, {"added": {"name": "specification", "object": "VC18M21A0SB/EV"}}, {"added": {"name": "specification", "object": "1800W"}}, {"added": {"name": "specification", "object": "380W"}}, {"added": {"name": "specification", "object": "Cyclone Force with Anti-tangle Turbine"}}, {"added": {"name": "specification", "object": "1.5L"}}, {"added": {"name": "specification", "object": "87dBA"}}, {"added": {"name": "specification", "object": "6m"}}, {"added": {"name": "specification", "object": "9m"}}, {"added": {"name": "specification", "object": "Body Variable (On/Off)"}}, {"added": {"name": "specification", "object": "Micro+Sponge"}}, {"added": {"name": "specification", "object": "EPA 12"}}, {"added": {"name": "specification", "object": "2-Step (NB250)"}}, {"added": {"name": "specification", "object": "-"}}, {"added": {"name": "specification", "object": "2-in-1"}}, {"added": {"name": "specification", "object": "Steel Telescopic"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "Vitality Blue"}}, {"added": {"name": "specification", "object": "W272 x D398 x H243"}}, {"added": {"name": "specification", "object": "4.6kg"}}, {"added": {"name": "specification", "object": "8kg"}}]	10	2
373	2018-12-29 06:43:12.987652+00	129	PRO 7 4/64 gb red	2	update through import_export	10	2
243	2018-12-21 09:17:51.554144+00	152	LG M320 XP2 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "164 \\u0433"}}, {"added": {"name": "specification", "object": "154.7 x 78.1 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
244	2018-12-21 09:19:55.367712+00	153	Huawei P8lite Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P8lite Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite Gold"}}, {"added": {"name": "product image", "object": "Huawei P8lite Gold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.0"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 620"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "131 \\u0433"}}, {"added": {"name": "specification", "object": "143 x 70.60 x 7.70"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
245	2018-12-21 09:20:54.963005+00	154	LG M320 XP2 Gold	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M320 XP2 Gold"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Gold"}}, {"added": {"name": "product image", "object": "LG M320 XP2 Gold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,5 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4500 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "164 \\u0433"}}, {"added": {"name": "specification", "object": "154.7 x 78.1 x 8.4"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
246	2018-12-21 09:22:07.582104+00	2	Маиший техника	2	[{"changed": {"fields": ["tree"]}}]	8	1
247	2018-12-21 09:22:12.595826+00	1	Мобил телефонлар	2	[{"changed": {"fields": ["tree"]}}]	8	1
248	2018-12-21 09:22:32.307944+00	155	Huawei P8lite White	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei P8lite White"}}, {"added": {"name": "product image", "object": "Huawei P8lite White"}}, {"added": {"name": "product image", "object": "Huawei P8lite White"}}, {"added": {"name": "product image", "object": "Huawei P8lite White"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.0"}}, {"added": {"name": "specification", "object": "HiSilicon Kirin 620"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "131 \\u0433"}}, {"added": {"name": "specification", "object": "143 x 70.60 x 7.70"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "White"}}]	10	2
249	2018-12-21 09:22:35.360829+00	23	test	1	[{"added": {}}]	8	1
250	2018-12-21 09:25:41.117056+00	156	Huawei Y3 2017\tGold	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei Y3 2017\\tGold"}}, {"added": {"name": "product image", "object": "Huawei Y3 2017\\tGold"}}, {"added": {"name": "product image", "object": "Huawei Y3 2017\\tGold"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.0 (Marshmallow)"}}, {"added": {"name": "specification", "object": "Mediatek MT6737\\u041c"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD capacitive touchscreen"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "175 \\u0433"}}, {"added": {"name": "specification", "object": "145.1 x 73.7 x 9.5"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Gold"}}]	10	2
262	2018-12-24 05:44:01.496444+00	161	M700 (Q6) 3/32GB black	2	[{"changed": {"fields": ["title"]}}]	10	2
374	2018-12-29 06:43:12.989109+00	128	PRO 7 4/64 gb black	2	update through import_export	10	2
375	2018-12-29 06:43:12.990513+00	127	M6s 3/32 gb black	2	update through import_export	10	2
376	2018-12-29 06:43:12.991869+00	126	M6 Note 4/64 gb black	2	update through import_export	10	2
377	2018-12-29 06:43:12.993218+00	125	M6 Note 3/32 gb black	2	update through import_export	10	2
378	2018-12-29 06:43:12.994671+00	124	M6 Note 3/16 gb black	2	update through import_export	10	2
379	2018-12-29 06:43:12.996063+00	123	M6s 3/32 gb black	2	update through import_export	10	2
380	2018-12-29 06:43:12.997404+00	122	M6 3/32 gb black	2	update through import_export	10	2
252	2018-12-21 09:29:07.441623+00	158	LG H930  V30+ Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "product image", "object": "LG H930  V30+ Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "2.45 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "128 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "4 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "16 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "POLED (On-Cell touch)"}}, {"added": {"name": "specification", "object": "6 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3300 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "158 \\u0433"}}, {"added": {"name": "specification", "object": "\\u0411\\u0430\\u0440\\u043c\\u043e\\u049b \\u0438\\u0437\\u0438 \\u0441\\u043a\\u0430\\u043d\\u0435\\u0440\\u0438"}}, {"added": {"name": "specification", "object": "151.7 \\u00d7 75.4 \\u00d7 7.39"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
253	2018-12-21 09:30:58.288933+00	159	Huawei Y5/2\tBlack	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei Y5/2\\tBlack"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 OS, v5.1 (Lollipop)"}}, {"added": {"name": "specification", "object": "Mediatek MT6735P"}}, {"added": {"name": "specification", "object": "8/16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1/2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "8 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS LCD"}}, {"added": {"name": "specification", "object": "5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "2200 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "135 \\u0433"}}, {"added": {"name": "specification", "object": "143.8 x 72 x 8.9"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
254	2018-12-21 09:34:41.774588+00	160	Huawei T3/7\tBlack	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei T3/7\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei T3/7\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei T3/7\\tBlack"}}, {"added": {"name": "product image", "object": "Huawei T3/7\\tBlack"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 6.x+"}}, {"added": {"name": "specification", "object": "MediaTek MT8127"}}, {"added": {"name": "specification", "object": "8 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "1 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "7 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3100 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "250 \\u0433"}}, {"added": {"name": "specification", "object": "179 x 103.68 x 8.6"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSDPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
255	2018-12-21 09:35:26.084055+00	161	LG M700 (Q6) 3/32GB Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 3/32GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 3/32GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 3/32GB Black"}}, {"added": {"name": "product image", "object": "LG M700 (Q6) 3/32GB Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434"}}, {"added": {"name": "specification", "object": "1,4 \\u0413\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "32 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "3 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "IPS (In-Cell Touch)"}}, {"added": {"name": "specification", "object": "5.5 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "3000 \\u043c\\u0410\\u0447"}}, {"added": {"name": "specification", "object": "149 \\u0433"}}, {"added": {"name": "specification", "object": "142.5 x 69.3 x 8.1"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "2G (GSM) 3G (HSPA) 4G (LTE)"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
256	2018-12-21 09:37:13.225987+00	162	Huawei T3 LTE /10 Black	1	[{"added": {}}, {"added": {"name": "product image", "object": "Huawei T3 LTE /10 Black"}}, {"added": {"name": "product image", "object": "Huawei T3 LTE /10 Black"}}, {"added": {"name": "product image", "object": "Huawei T3 LTE /10 Black"}}, {"added": {"name": "product image", "object": "Huawei T3 LTE /10 Black"}}, {"added": {"name": "specification", "object": "\\u0410\\u043d\\u0434\\u0440\\u043e\\u0438\\u0434 7.0 Nougat \\u0441 \\u043f\\u0440\\u043e\\u0448\\u0438\\u0432\\u043a\\u043e\\u0439 EMUI 5.1"}}, {"added": {"name": "specification", "object": "Qualcomm Snapdragon 425"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0411"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "2 \\u041c\\u041f"}}, {"added": {"name": "specification", "object": "IPS"}}, {"added": {"name": "specification", "object": "10 \\u0434\\u044e\\u0439\\u043c"}}, {"added": {"name": "specification", "object": "4800 \\u043c\\u0410h"}}, {"added": {"name": "specification", "object": "460 \\u0433"}}, {"added": {"name": "specification", "object": "229,8\\u0445159,8\\u04457,95"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "GSM, UMTS, LTE"}}, {"added": {"name": "specification", "object": "Black"}}]	10	2
257	2018-12-21 12:44:10.745864+00	163	Чангюткич Samsung VC18M21B0S2/EV	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "product image", "object": "\\u0427\\u0430\\u043d\\u0433\\u044e\\u0442\\u043a\\u0438\\u0447 Samsung VC18M21B0S2/EV"}}, {"added": {"name": "specification", "object": "VC18M21B0S2/EV"}}, {"added": {"name": "specification", "object": "1800W"}}, {"added": {"name": "specification", "object": "380W"}}, {"added": {"name": "specification", "object": "Cycloneforce with Anti-Tangle Turbine"}}, {"added": {"name": "specification", "object": "1.5L"}}, {"added": {"name": "specification", "object": "87dBA"}}, {"added": {"name": "specification", "object": "6m"}}, {"added": {"name": "specification", "object": "9m"}}, {"added": {"name": "specification", "object": "Body Variable (On/Off)"}}, {"added": {"name": "specification", "object": "Micro+Sponge"}}, {"added": {"name": "specification", "object": "EPA 12"}}, {"added": {"name": "specification", "object": "2-Step (NB250)"}}, {"added": {"name": "specification", "object": "Parquet Brush(HB 100)"}}, {"added": {"name": "specification", "object": "2-in-1"}}, {"added": {"name": "specification", "object": "Steel Telescopic"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "+"}}, {"added": {"name": "specification", "object": "Blue Cosmo"}}, {"added": {"name": "specification", "object": "4.6kg"}}, {"added": {"name": "specification", "object": "8.2kg"}}, {"added": {"name": "specification", "object": "W272 x D398 x H243"}}]	10	2
259	2018-12-24 05:42:41.06982+00	164	VC18M21A0SB/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
260	2018-12-24 05:43:03.293396+00	163	VC18M21B0S2/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
261	2018-12-24 05:43:35.385951+00	162	T3 LTE /10 black	2	[{"changed": {"fields": ["title"]}}]	10	2
269	2018-12-24 10:06:51.089119+00	36	Javlon Akmalov	3		14	2
277	2018-12-24 11:14:20.239389+00	166	Микротўлқинли печ SAMSUNG  ME81ARW-K/BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME81ARW-K/BW"}}, {"added": {"name": "specification", "object": "ME81ARW-K/BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041e\\u049b"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u041c\\u0435\\u0445\\u0430\\u043d\\u0438\\u043a"}}, {"added": {"name": "specification", "object": "27.5 \\u0445 48.9 \\u0445 36.4 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "11.5 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u0438\\u043e\\u043a\\u0435\\u0440\\u0430\\u043c\\u0438\\u043a \\u044d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1150 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1 \\u0439\\u0438\\u043b"}}]	10	2
278	2018-12-24 11:14:31.99454+00	43	Бренд	3		14	2
279	2018-12-24 11:23:50.39288+00	167	Микротўлқинли печ SAMSUNG  ME83ARW-K/BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  ME83ARW-K/BW"}}, {"added": {"name": "specification", "object": "ME83ARW-K/BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041e\\u049b"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "49 \\u0445 27 \\u0445 36 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "11.5 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u0438\\u043e\\u043a\\u0435\\u0440\\u0430\\u043c\\u0438\\u043a \\u044d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1150 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1 \\u0439\\u0438\\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u043e\\u043b\\u0430\\u043b\\u0430\\u0440\\u0434\\u0430\\u043d \\u04b3\\u0438\\u043c\\u043e\\u044f, \\u0442\\u043e\\u0432\\u0443\\u0448\\u043b\\u0438 \\u0441\\u0438\\u0433\\u043d\\u0430\\u043b, \\u0442\\u0430\\u0439\\u043c\\u0435\\u0440"}}]	10	2
280	2018-12-24 11:25:00.939139+00	166	Микротўлқинли печ SAMSUNG  ME81ARW-K/BW	2	[{"added": {"name": "specification", "object": "\\u0422\\u0430\\u0439\\u043c\\u0435\\u0440"}}]	10	2
281	2018-12-24 11:36:05.265553+00	157	Y5/2 gold	2	[{"changed": {"fields": ["title", "image"]}}, {"changed": {"name": "product image", "object": "Y5/2 gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "Y5/2 gold", "fields": ["image"]}}, {"changed": {"name": "product image", "object": "Y5/2 gold", "fields": ["image"]}}]	10	2
282	2018-12-24 11:48:04.534896+00	44	Грил қуввати	1	[{"added": {}}]	14	2
283	2018-12-24 14:36:32.057774+00	168	Redmi 6A gold EU	1	[{"added": {}}, {"added": {"name": "specification", "object": "Android 8.1 Oreo"}}, {"added": {"name": "specification", "object": "Helio A22"}}, {"added": {"name": "specification", "object": "16 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "2 \\u0413\\u0431"}}, {"added": {"name": "specification", "object": "13 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5 \\u041c\\u043f"}}, {"added": {"name": "specification", "object": "5.45"}}, {"added": {"name": "specification", "object": "3000 mAh"}}, {"added": {"name": "specification", "object": "black"}}]	10	2
284	2018-12-24 14:37:36.859309+00	168	Redmi 6A gold EU	2	[{"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}, {"added": {"name": "product image", "object": "Redmi 6A gold EU"}}]	10	2
285	2018-12-24 14:39:46.828602+00	167	ME83ARW-K/BW	2	[{"changed": {"fields": ["title"]}}]	10	2
286	2018-12-25 04:46:14.976599+00	163	Чангютгич Samsung VC18M21B0S2/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
287	2018-12-25 04:47:05.172303+00	164	Чангютгич Samsung VC18M21A0SB/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
288	2018-12-25 04:47:45.662891+00	138	Чангютгич Samsung VC18M2130SR/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
289	2018-12-25 04:48:07.10472+00	137	Чангютгич Samsung VC18M21A0S1/EV	2	[{"changed": {"fields": ["title"]}}]	10	2
290	2018-12-26 03:19:46.924244+00	167	Микротўлқинли печ ME83ARW-K/BW	2	[{"changed": {"fields": ["title"]}}]	10	2
291	2018-12-26 03:20:19.09724+00	167	Микротўлқинли печ SAMSUNG ME83ARW-K/BW	2	[{"changed": {"fields": ["title"]}}]	10	2
292	2018-12-26 09:20:27.606933+00	45	Экран диагонали	1	[{"added": {}}]	14	2
293	2018-12-26 09:21:24.352715+00	46	Экран формати	1	[{"added": {}}]	14	2
294	2018-12-26 09:21:31.82671+00	47	Рухсат этилган ўлчамлари	1	[{"added": {}}]	14	2
295	2018-12-26 09:21:37.60825+00	48	HD қўллаши	1	[{"added": {}}]	14	2
296	2018-12-26 09:21:43.895708+00	49	Светодиодли (LED) ёритиш	1	[{"added": {}}]	14	2
297	2018-12-26 09:21:50.078523+00	50	Стереозвук	1	[{"added": {}}]	14	2
298	2018-12-26 09:23:29.540678+00	51	Янгиланиш частотаси	1	[{"added": {}}]	14	2
299	2018-12-26 09:24:21.10768+00	52	Телевизион стандартларни қўллаш	1	[{"added": {}}]	14	2
300	2018-12-26 09:24:25.437455+00	53	DVB-T ни қўллаб-қувватлаш	1	[{"added": {}}]	14	2
301	2018-12-26 09:24:31.031781+00	54	DVB-C ни қўллаб-қувватлаш	1	[{"added": {}}]	14	2
302	2018-12-26 09:24:38.110892+00	55	Телетекст	1	[{"added": {}}]	14	2
303	2018-12-26 09:24:43.763035+00	56	Кирувчи сигналларни қўллаб-қувватлаш форматлари	1	[{"added": {}}]	14	2
304	2018-12-26 09:24:49.767692+00	57	Компьютерга улашда қўллаб-қувватланадиган ўлчамлар	1	[{"added": {}}]	14	2
305	2018-12-26 09:24:57.433538+00	58	Товуш баландлиги	1	[{"added": {}}]	14	2
306	2018-12-26 09:25:04.00384+00	59	Акустик тизим	1	[{"added": {}}]	14	2
307	2018-12-26 09:25:09.066068+00	60	Dolby Digital декодери	1	[{"added": {}}]	14	2
308	2018-12-26 09:25:17.925173+00	61	Қуршалган товуш	1	[{"added": {}}]	14	2
309	2018-12-26 09:25:30.480213+00	62	Қўллаб-қувватланадиган форматлар	1	[{"added": {}}]	14	2
310	2018-12-26 09:27:39.196265+00	63	Кириш портлари	1	[{"added": {}}]	14	2
311	2018-12-26 09:27:44.297172+00	64	Чиқиш портлари	1	[{"added": {}}]	14	2
312	2018-12-26 09:27:51.409787+00	65	Наушник учун разъем	1	[{"added": {}}]	14	2
313	2018-12-26 09:28:18.968643+00	66	CI учун жой (кенгайтиргич)	1	[{"added": {}}]	14	2
319	2018-12-26 09:33:01.567761+00	169	Микротўлқинли печ SAMSUNG  GE81ARW-K/BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE81ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE81ARW-K/BW"}}, {"added": {"name": "specification", "object": "GE81ARW-K/BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041e\\u049b"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u041c\\u0435\\u0445\\u0430\\u043d\\u0438\\u043a"}}, {"added": {"name": "specification", "object": "49 \\u0445 27 \\u0445 36 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "12.5 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u0438\\u043e\\u043a\\u0435\\u0440\\u0430\\u043c\\u0438\\u043a \\u044d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "\\u0411\\u043e\\u043b\\u0430\\u043b\\u0430\\u0440\\u0434\\u0430\\u043d \\u04b3\\u0438\\u043c\\u043e\\u044f, \\u0442\\u043e\\u0432\\u0443\\u0448\\u043b\\u0438 \\u0441\\u0438\\u0433\\u043d\\u0430\\u043b, \\u0442\\u0430\\u0439\\u043c\\u0435\\u0440, \\u0433\\u0440\\u0438\\u043b"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1 \\u0439\\u0438\\u043b"}}]	10	2
320	2018-12-26 09:38:45.459703+00	170	Микротўлқинли печ SAMSUNG  GE83ARW-K/BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE83ARW-K/BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG  GE83ARW-K/BW"}}, {"added": {"name": "specification", "object": "GE83ARW-K/BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041e\\u049b"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "27 \\u0445 49 \\u0445 36 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "12 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u042d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "\\u0411\\u043e\\u043b\\u0430\\u043b\\u0430\\u0440\\u0434\\u0430\\u043d \\u04b3\\u0438\\u043c\\u043e\\u044f, \\u0422\\u043e\\u0432\\u0443\\u0448\\u043b\\u0438 \\u0441\\u0438\\u0433\\u043d\\u0430\\u043b, \\u0422\\u0430\\u0439\\u043c\\u0435\\u0440, \\u0413\\u0440\\u0438\\u043b"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1100 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "2200 \\u0412\\u0442"}}]	10	2
321	2018-12-26 09:43:04.740619+00	171	Микротўлқинли печ SAMSUNG ME81KRW-1K BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME81KRW-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME81KRW-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME81KRW-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME81KRW-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME81KRW-1K BW"}}, {"added": {"name": "specification", "object": "ME81KRW-1K BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041e\\u049b"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u041c\\u0435\\u0445\\u0430\\u043d\\u0438\\u043a"}}, {"added": {"name": "specification", "object": "49 \\u0445 27 \\u0445 36 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "11.5 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u0438\\u043e\\u043a\\u0435\\u0440\\u0430\\u043c\\u0438\\u043a \\u044d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "\\u0422\\u0430\\u0439\\u043c\\u0435\\u0440"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1150 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1 \\u0439\\u0438\\u043b"}}]	10	2
322	2018-12-26 09:47:12.983906+00	172	Televizor SAMSUNG UE 32M 4000 Jedi	1	[{"added": {}}, {"added": {"name": "product image", "object": "Televizor SAMSUNG UE 32M 4000 Jedi"}}, {"added": {"name": "product image", "object": "Televizor SAMSUNG UE 32M 4000 Jedi"}}, {"added": {"name": "specification", "object": "32\\" (81 \\u0441\\u043c)"}}, {"added": {"name": "specification", "object": "16:09"}}, {"added": {"name": "specification", "object": "1366x768"}}, {"added": {"name": "specification", "object": "720p HD"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434, Edge LED"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "60\\u0413\\u0446"}}, {"added": {"name": "specification", "object": "PAL, SECAM, NTSC"}}, {"added": {"name": "specification", "object": "DVB-C MPEG4"}}, {"added": {"name": "specification", "object": "DVB-C MPEG4"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "480i, 480p, 576i, 576p, 720p, 1080i, 1080p"}}, {"added": {"name": "specification", "object": "640x480\\u00a0800x600\\u00a01024x768\\u00a01360x768"}}, {"added": {"name": "specification", "object": "20 \\u0412\\u0442 (2x10 \\u0412\\u0442)"}}, {"added": {"name": "specification", "object": "\\u0438\\u043a\\u043a\\u0438 \\u0434\\u0438\\u043d\\u0430\\u043c\\u0438\\u043a"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "MP3, WMA, MPEG4, MKV, JPEG"}}, {"added": {"name": "specification", "object": "SCART, HDMI x2, USB"}}, {"added": {"name": "specification", "object": "\\u041e\\u043f\\u0442\\u0438\\u043a"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "\\u041c\\u0430\\u0432\\u0436\\u0443\\u0434, CI+ \\u043d\\u0438 \\u049b\\u045e\\u043b\\u043b\\u0430\\u0431-\\u049b\\u0443\\u0432\\u0432\\u0430\\u0442\\u043b\\u0430\\u0439\\u0434\\u0438"}}, {"added": {"name": "specification", "object": "2"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "\\u043c\\u0430\\u0432\\u0436\\u0443\\u0434"}}, {"added": {"name": "specification", "object": "745x466x151 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "745x442x69 \\u043c\\u043c"}}, {"added": {"name": "specification", "object": "4.1 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "4 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "\\u049b\\u043e\\u0440\\u0430"}}]	10	2
323	2018-12-26 09:47:47.891685+00	173	Микротўлқинли печ SAMSUNG ME83KRS-1K BW	1	[{"added": {}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME83KRS-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME83KRS-1K BW"}}, {"added": {"name": "product image", "object": "\\u041c\\u0438\\u043a\\u0440\\u043e\\u0442\\u045e\\u043b\\u049b\\u0438\\u043d\\u043b\\u0438 \\u043f\\u0435\\u0447 SAMSUNG ME83KRS-1K BW"}}, {"added": {"name": "specification", "object": "ME83KRS-1K BW"}}, {"added": {"name": "specification", "object": "\\u040e\\u0437\\u0431\\u0435\\u043a\\u0438\\u0441\\u0442\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "\\u041a\\u0443\\u043c\\u0443\\u0448\\u0440\\u0430\\u043d\\u0433"}}, {"added": {"name": "specification", "object": "\\u041e\\u0434\\u0434\\u0438\\u0439 (\\u0441\\u043e\\u043b\\u043e)"}}, {"added": {"name": "specification", "object": "\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d"}}, {"added": {"name": "specification", "object": "28 \\u0445 49 \\u0445 36 \\u0441\\u043c"}}, {"added": {"name": "specification", "object": "11 \\u043a\\u0433"}}, {"added": {"name": "specification", "object": "23 \\u043b"}}, {"added": {"name": "specification", "object": "\\u0411\\u0438\\u043e\\u043a\\u0435\\u0440\\u0430\\u043c\\u0438\\u043a \\u044d\\u043c\\u0430\\u043b\\u044c"}}, {"added": {"name": "specification", "object": "\\u0411\\u043e\\u043b\\u0430\\u043b\\u0430\\u0440\\u0434\\u0430\\u043d \\u04b3\\u0438\\u043c\\u043e\\u044f, \\u0442\\u043e\\u0432\\u0443\\u0448\\u043b\\u0438 \\u0441\\u0438\\u0433\\u043d\\u0430\\u043b, \\u0442\\u0430\\u0439\\u043c\\u0435\\u0440, \\u0441\\u043e\\u0430\\u0442,  \\u0434\\u0438\\u0441\\u043f\\u043b\\u0435\\u0439"}}, {"added": {"name": "specification", "object": "800 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1150 \\u0412\\u0442"}}, {"added": {"name": "specification", "object": "1 \\u0439\\u0438\\u043b"}}]	10	2
324	2018-12-26 11:55:00.083153+00	172	Телевизор SAMSUNG UE 32M 4000 Jedi	2	[{"changed": {"fields": ["title"]}}]	10	2
325	2018-12-26 20:05:28.855915+00	24	Ipad	1	[{"added": {}}]	8	1
326	2018-12-26 20:06:03.172243+00	25	Iphone 8	1	[{"added": {}}]	8	1
327	2018-12-26 20:07:23.792565+00	26	Samsung Galaxy	1	[{"added": {}}]	8	1
328	2018-12-26 20:07:34.205516+00	26	Samsung Galaxy	2	[{"changed": {"fields": ["parent"]}}]	8	1
329	2018-12-29 06:43:12.925222+00	173	ME83KRS-1K BW	2	update through import_export	10	2
330	2018-12-29 06:43:12.927769+00	172	UE32M4000 Jedi	2	update through import_export	10	2
331	2018-12-29 06:43:12.929242+00	171	ME81KRW-1K BW	2	update through import_export	10	2
332	2018-12-29 06:43:12.930646+00	170	GE83ARW-K/BW	2	update through import_export	10	2
333	2018-12-29 06:43:12.932073+00	169	GE81ARW-K/BW	2	update through import_export	10	2
334	2018-12-29 06:43:12.933506+00	168	Redmi 6A gold (eu)	2	update through import_export	10	2
335	2018-12-29 06:43:12.935002+00	167	ME83ARW-K/BW	2	update through import_export	10	2
336	2018-12-29 06:43:12.936373+00	166	 ME81ARW-K/BW	2	update through import_export	10	2
337	2018-12-29 06:43:12.937746+00	165	MC28H5013AW/BW	2	update through import_export	10	2
338	2018-12-29 06:43:12.939139+00	164	VC18M21A0SB/EV	2	update through import_export	10	2
339	2018-12-29 06:43:12.940487+00	163	VC18M21B0S2/EV	2	update through import_export	10	2
340	2018-12-29 06:43:12.941829+00	162	T3 LTE /10 black	2	update through import_export	10	2
341	2018-12-29 06:43:12.943173+00	161	M700 (Q6) 3/32 gb black	2	update through import_export	10	2
342	2018-12-29 06:43:12.944485+00	160	T3/7 black	2	update through import_export	10	2
343	2018-12-29 06:43:12.945858+00	159	Y5/2 black	2	update through import_export	10	2
344	2018-12-29 06:43:12.947209+00	158	H930 V30 black	2	update through import_export	10	2
345	2018-12-29 06:43:12.948601+00	157	Y5/2 gold	2	update through import_export	10	2
346	2018-12-29 06:43:12.95006+00	156	Y3 2017\tgold	2	update through import_export	10	2
347	2018-12-29 06:43:12.951438+00	155	P8lite White	2	update through import_export	10	2
348	2018-12-29 06:43:12.952781+00	154	M320 XP2 gold	2	update through import_export	10	2
349	2018-12-29 06:43:12.954128+00	153	P8lite gold	2	update through import_export	10	2
350	2018-12-29 06:43:12.955478+00	152	M320 XP2 black	2	update through import_export	10	2
351	2018-12-29 06:43:12.95682+00	151	P8lite black	2	update through import_export	10	2
352	2018-12-29 06:43:12.95814+00	150	P8lite 2017 gold	2	update through import_export	10	2
353	2018-12-29 06:43:12.959852+00	149	P8lite 2017 black	2	update through import_export	10	2
354	2018-12-29 06:43:12.961176+00	148	GT3 White	2	update through import_export	10	2
355	2018-12-29 06:43:12.962626+00	147	HONOR 6A black	2	update through import_export	10	2
356	2018-12-29 06:43:12.964025+00	146	M700 (Q6) 2 gb /16 gb gold	2	update through import_export	10	2
357	2018-12-29 06:43:12.965392+00	145	P 20\tBlue	2	update through import_export	10	2
358	2018-12-29 06:43:12.966749+00	144	M700 (Q6) 2 gb /16 gb black	2	update through import_export	10	2
359	2018-12-29 06:43:12.968108+00	143	P20 \tblack	2	update through import_export	10	2
360	2018-12-29 06:43:12.96944+00	142	P20 lite blue	2	update through import_export	10	2
437	2018-12-29 06:43:13.074028+00	65	J250M (J2 Pro) black	2	update through import_export	10	2
438	2018-12-29 06:43:13.075399+00	64	iPhone X 256 gb silver	2	update through import_export	10	2
439	2018-12-29 06:43:13.076724+00	63	iPhone X 64 gb grey	2	update through import_export	10	2
440	2018-12-29 06:43:13.078003+00	62	J200 (J2) gold	2	update through import_export	10	2
441	2018-12-29 06:43:13.079258+00	61	J200 (J2) black	2	update through import_export	10	2
442	2018-12-29 06:43:13.080648+00	60	Redmi 6 6/64 gb black	2	update through import_export	10	2
443	2018-12-29 06:43:13.081931+00	59	Redmi note 5 64 gb black	2	update through import_export	10	2
444	2018-12-29 06:43:13.083197+00	58	J110 (J1 Ace) White	2	update through import_export	10	2
445	2018-12-29 06:43:13.08455+00	57	Redmi Note 5 32 gb gold	2	update through import_export	10	2
446	2018-12-29 06:43:13.085885+00	56	J110 (J1 Ace) black	2	update through import_export	10	2
447	2018-12-29 06:43:13.087179+00	55	Redmi note 5 32 gb black	2	update through import_export	10	2
448	2018-12-29 06:43:13.088494+00	54	J105 (J1 mini) black	2	update through import_export	10	2
449	2018-12-29 06:43:13.089921+00	53	Redmi S2 64 gb gold	2	update through import_export	10	2
450	2018-12-29 06:43:13.091161+00	52	G965 256 gb (S9+) Purple	2	update through import_export	10	2
451	2018-12-29 06:43:13.092456+00	51	Redmi S2 64 gb grey	2	update through import_export	10	2
452	2018-12-29 06:43:13.09382+00	50	G965 256 gb (S9+) grey	2	update through import_export	10	2
453	2018-12-29 06:43:13.095092+00	49	Redmi S2 32 gb gold	2	update through import_export	10	2
454	2018-12-29 06:43:13.096385+00	48	G965 256 gb (S9+) black	2	update through import_export	10	2
455	2018-12-29 06:43:13.097628+00	47	Redmi S2 32 gb grey	2	update through import_export	10	2
456	2018-12-29 06:43:13.098901+00	46	Redmi 5 plus 64 gb black	2	update through import_export	10	2
457	2018-12-29 06:43:13.100218+00	45	Redmi 5 plus 64 gb gold	2	update through import_export	10	2
458	2018-12-29 06:43:13.101487+00	44	Redmi 5 plus 32 gb black	2	update through import_export	10	2
459	2018-12-29 06:43:13.102847+00	43	Redmi 5 plus 32 gb gold	2	update through import_export	10	2
460	2018-12-29 06:43:13.104238+00	42	G965 (S9+) grey	2	update through import_export	10	2
461	2018-12-29 06:43:13.105682+00	41	Redmi 5 32 gb gold	2	update through import_export	10	2
462	2018-12-29 06:43:13.107035+00	40	Redmi 5 32 gb black	2	update through import_export	10	2
463	2018-12-29 06:43:13.108385+00	39	G965 (S9+) black	2	update through import_export	10	2
464	2018-12-29 06:43:13.109768+00	38	Redmi 5 16 gb gold	2	update through import_export	10	2
465	2018-12-29 06:43:13.111052+00	37	G960 (S9) grey	2	update through import_export	10	2
466	2018-12-29 06:43:13.112364+00	36	G960 (S9) purple	2	update through import_export	10	2
467	2018-12-29 06:43:13.113725+00	35	Redmi 5 16 gb black	2	update through import_export	10	2
468	2018-12-29 06:43:13.115236+00	34	G960 (S9) black	2	update through import_export	10	2
469	2018-12-29 06:43:13.116505+00	33	Redmi 5A 32 gb black	2	update through import_export	10	2
470	2018-12-29 06:43:13.117726+00	32	G950 (S8) red	2	update through import_export	10	2
471	2018-12-29 06:43:13.118952+00	31	G950 (S8) gold	2	update through import_export	10	2
472	2018-12-29 06:43:13.120189+00	30	G950 (S8) black	2	update through import_export	10	2
473	2018-12-29 06:43:13.121446+00	29	Redmi 5A 16 gb black	2	update through import_export	10	2
474	2018-12-29 06:43:13.122716+00	28	G570 (J5 prime) gold	2	update through import_export	10	2
475	2018-12-29 06:43:13.123991+00	27	G570 (J5 prime) black	2	update through import_export	10	2
476	2018-12-29 06:43:13.125253+00	26	Redmi A1/64 gold	2	update through import_export	10	2
477	2018-12-29 06:43:13.126513+00	25	Redmi A1/64 black	2	update through import_export	10	2
478	2018-12-29 06:43:13.127783+00	24	Redmi 5 Plus 4/64 gold	2	update through import_export	10	2
479	2018-12-29 06:43:13.129089+00	23	G532 (J2 Prime) gold	2	update through import_export	10	2
480	2018-12-29 06:43:13.130367+00	22	G532 (J2 Prime) black	2	update through import_export	10	2
481	2018-12-29 06:43:13.131637+00	21	Redmi 5 Plus 4/64 black	2	update through import_export	10	2
482	2018-12-29 06:43:13.132978+00	20	A710 gold	2	update through import_export	10	2
483	2018-12-29 06:43:13.134264+00	19	Redmi 5 3/32 gold	2	update through import_export	10	2
484	2018-12-29 06:43:13.135581+00	18	A710 black	2	update through import_export	10	2
485	2018-12-29 06:43:13.136923+00	17	Redmi 5 3/32 black	2	update through import_export	10	2
486	2018-12-29 06:43:13.138221+00	16	A520 (A5) gold	2	update through import_export	10	2
487	2018-12-29 06:43:13.139482+00	15	A520 (A5) black	2	update through import_export	10	2
488	2018-12-29 06:43:13.14076+00	14	Redmi 5 2/16 black	2	update through import_export	10	2
489	2018-12-29 06:43:13.142061+00	13	A320 (A3) gold	2	update through import_export	10	2
490	2018-12-29 06:43:13.143393+00	12	A320 (A3) black	2	update through import_export	10	2
491	2018-12-29 06:43:13.144725+00	11	A730 (A8 plus) grey	2	update through import_export	10	2
492	2018-12-29 06:43:13.146058+00	10	A730 (A8 plus) gold	2	update through import_export	10	2
493	2018-12-29 06:43:13.147356+00	9	A730 (A8 plus) black	2	update through import_export	10	2
494	2018-12-29 06:43:13.148833+00	8	A530 (A8) grey	2	update through import_export	10	2
495	2018-12-29 06:43:13.1502+00	7	A530 (A8) gold	2	update through import_export	10	2
496	2018-12-29 06:43:13.151641+00	6	A605 gold	2	update through import_export	10	2
497	2018-12-29 06:43:13.153012+00	5	A600 gold	2	update through import_export	10	2
498	2018-12-29 06:43:13.154297+00	4	A605 black	2	update through import_export	10	2
499	2018-12-29 06:43:13.155597+00	3	A600 black	2	update through import_export	10	2
500	2018-12-29 06:43:13.1569+00	2	Redmi 5 2/16 gb gold	2	update through import_export	10	2
501	2018-12-29 06:46:12.561566+00	173	ME83KRS-1K BW	2	update through import_export	10	2
502	2018-12-29 06:46:12.563498+00	172	UE32M4000 Jedi	2	update through import_export	10	2
503	2018-12-29 06:46:12.565133+00	171	ME81KRW-1K BW	2	update through import_export	10	2
504	2018-12-29 06:46:12.56652+00	170	GE83ARW-K/BW	2	update through import_export	10	2
505	2018-12-29 06:46:12.567913+00	169	GE81ARW-K/BW	2	update through import_export	10	2
506	2018-12-29 06:46:12.569324+00	168	Redmi 6A gold (eu)	2	update through import_export	10	2
507	2018-12-29 06:46:12.570727+00	167	ME83ARW-K/BW	2	update through import_export	10	2
508	2018-12-29 06:46:12.572003+00	166	 ME81ARW-K/BW	2	update through import_export	10	2
509	2018-12-29 06:46:12.57333+00	165	MC28H5013AW/BW	2	update through import_export	10	2
510	2018-12-29 06:46:12.574676+00	164	VC18M21A0SB/EV	2	update through import_export	10	2
511	2018-12-29 06:46:12.576006+00	163	VC18M21B0S2/EV	2	update through import_export	10	2
512	2018-12-29 06:46:12.577444+00	162	T3 LTE /10 black	2	update through import_export	10	2
513	2018-12-29 06:46:12.578755+00	161	M700 (Q6) 3/32 gb black	2	update through import_export	10	2
514	2018-12-29 06:46:12.580134+00	160	T3/7 black	2	update through import_export	10	2
515	2018-12-29 06:46:12.581642+00	159	Y5/2 black	2	update through import_export	10	2
516	2018-12-29 06:46:12.582978+00	158	H930 V30 black	2	update through import_export	10	2
517	2018-12-29 06:46:12.584287+00	157	Y5/2 gold	2	update through import_export	10	2
518	2018-12-29 06:46:12.585675+00	156	Y3 2017\tgold	2	update through import_export	10	2
519	2018-12-29 06:46:12.586996+00	155	P8lite White	2	update through import_export	10	2
520	2018-12-29 06:46:12.588348+00	154	M320 XP2 gold	2	update through import_export	10	2
521	2018-12-29 06:46:12.58979+00	153	P8lite gold	2	update through import_export	10	2
522	2018-12-29 06:46:12.591154+00	152	M320 XP2 black	2	update through import_export	10	2
523	2018-12-29 06:46:12.592613+00	151	P8lite black	2	update through import_export	10	2
524	2018-12-29 06:46:12.593928+00	150	P8lite 2017 gold	2	update through import_export	10	2
525	2018-12-29 06:46:12.5952+00	149	P8lite 2017 black	2	update through import_export	10	2
526	2018-12-29 06:46:12.596667+00	148	GT3 White	2	update through import_export	10	2
527	2018-12-29 06:46:12.598041+00	147	HONOR 6A black	2	update through import_export	10	2
528	2018-12-29 06:46:12.599312+00	146	M700 (Q6) 2 gb /16 gb gold	2	update through import_export	10	2
529	2018-12-29 06:46:12.600711+00	145	P 20\tBlue	2	update through import_export	10	2
530	2018-12-29 06:46:12.602066+00	144	M700 (Q6) 2 gb /16 gb black	2	update through import_export	10	2
531	2018-12-29 06:46:12.603359+00	143	P20 \tblack	2	update through import_export	10	2
532	2018-12-29 06:46:12.604852+00	142	P20 lite blue	2	update through import_export	10	2
533	2018-12-29 06:46:12.606144+00	141	P20 lite black	2	update through import_export	10	2
534	2018-12-29 06:46:12.607457+00	140	P smart gold	2	update through import_export	10	2
535	2018-12-29 06:46:12.60878+00	139	P smart black	2	update through import_export	10	2
536	2018-12-29 06:46:12.610094+00	138	VC18M2130SR/EV	2	update through import_export	10	2
537	2018-12-29 06:46:12.611395+00	137	VC18M21A0S1/EV	2	update through import_export	10	2
538	2018-12-29 06:46:12.6129+00	136	X240 (K8)\t gold	2	update through import_export	10	2
539	2018-12-29 06:46:12.614253+00	135	X240 (K8)\t black	2	update through import_export	10	2
540	2018-12-29 06:46:12.615591+00	134	M250 (K10) black	2	update through import_export	10	2
541	2018-12-29 06:46:12.616925+00	133	M250 (K10) Titan	2	update through import_export	10	2
542	2018-12-29 06:46:12.61828+00	132	K430 (K10 LTE) black	2	update through import_export	10	2
543	2018-12-29 06:46:12.619626+00	131	X230 (K4) brown	2	update through import_export	10	2
544	2018-12-29 06:46:12.620996+00	130	X230 (K4) titan	2	update through import_export	10	2
545	2018-12-29 06:46:12.622376+00	129	PRO 7 4/64 gb red	2	update through import_export	10	2
546	2018-12-29 06:46:12.623735+00	128	PRO 7 4/64 gb black	2	update through import_export	10	2
547	2018-12-29 06:46:12.625046+00	127	M6s 3/32 gb black	2	update through import_export	10	2
548	2018-12-29 06:46:12.626349+00	126	M6 Note 4/64 gb black	2	update through import_export	10	2
549	2018-12-29 06:46:12.627907+00	125	M6 Note 3/32 gb black	2	update through import_export	10	2
550	2018-12-29 06:46:12.629218+00	124	M6 Note 3/16 gb black	2	update through import_export	10	2
551	2018-12-29 06:46:12.630571+00	123	M6s 3/32 gb black	2	update through import_export	10	2
552	2018-12-29 06:46:12.631854+00	122	M6 3/32 gb black	2	update through import_export	10	2
553	2018-12-29 06:46:12.633178+00	121	M6s 2/16 gb black	2	update through import_export	10	2
554	2018-12-29 06:46:12.634495+00	120	M5s 3/16 gb gold	2	update through import_export	10	2
555	2018-12-29 06:46:12.635866+00	119	Tab A 7 8 gb 4G SM-T285 White	2	update through import_export	10	2
556	2018-12-29 06:46:12.637238+00	118	Ipad 4G 2017 32 gb grey	2	update through import_export	10	2
557	2018-12-29 06:46:12.638606+00	117	Tab A 7 8 gb 4G SM-T285 silver	2	update through import_export	10	2
558	2018-12-29 06:46:12.639993+00	116	Tab A 7 8 gb 4G SM-T285 black	2	update through import_export	10	2
559	2018-12-29 06:46:12.641345+00	115	Tab A 8.0 LTE SM-T385 gold	2	update through import_export	10	2
560	2018-12-29 06:46:12.642713+00	114	Ipad wi-fi 2017 128 gb grey	2	update through import_export	10	2
561	2018-12-29 06:46:12.644086+00	113	Tab A 8.0 LTE SM-T385 black	2	update through import_export	10	2
562	2018-12-29 06:46:12.645432+00	112	Ipad wi-fi 2017 128 gb gold	2	update through import_export	10	2
563	2018-12-29 06:46:12.646717+00	111	Tab E (SM-T561) Brown	2	update through import_export	10	2
564	2018-12-29 06:46:12.648023+00	110	Ipad wi-fi 2017 128 gb silver	2	update through import_export	10	2
565	2018-12-29 06:46:12.64954+00	109	Tab E (SM-T561) black	2	update through import_export	10	2
566	2018-12-29 06:46:12.650802+00	108	Ipad wi-fi 2017 32 gb \tgold	2	update through import_export	10	2
567	2018-12-29 06:46:12.652068+00	107	Ipad wi-fi 2017 32 gb \tsilver	2	update through import_export	10	2
568	2018-12-29 06:46:12.653319+00	106	Tab S2 8.0 [SM-T719] gold	2	update through import_export	10	2
569	2018-12-29 06:46:12.654586+00	105	Tab S2 8.0 [SM-T719] black	2	update through import_export	10	2
570	2018-12-29 06:46:12.655875+00	104	Tab S3 SM-T825 silver	2	update through import_export	10	2
571	2018-12-29 06:46:12.657129+00	103	Tab S3 SM-T825 black	2	update through import_export	10	2
572	2018-12-29 06:46:12.658547+00	102	Ipad mini 4 128 gb WiFi+4G gold	2	update through import_export	10	2
573	2018-12-29 06:46:12.659887+00	101	Ipad mini 4 128 gb WiFi+4G grey	2	update through import_export	10	2
574	2018-12-29 06:46:12.661231+00	100	Ipad mini 4 128 gb WiFi+4G silver	2	update through import_export	10	2
575	2018-12-29 06:46:12.662509+00	99	N950 Note 8 gold	2	update through import_export	10	2
576	2018-12-29 06:46:12.663784+00	98	N950 Note 8 black	2	update through import_export	10	2
577	2018-12-29 06:46:12.66516+00	97	Iphone 8 plus 256 gb red	2	update through import_export	10	2
578	2018-12-29 06:46:12.66652+00	96	Iphone 8 plus 256 gb grey	2	update through import_export	10	2
579	2018-12-29 06:46:12.667959+00	95	J730 (J7) gold	2	update through import_export	10	2
580	2018-12-29 06:46:12.669296+00	94	J730 (J7) black	2	update through import_export	10	2
581	2018-12-29 06:46:12.670635+00	93	Iphone 8 plus 64 gb \tsilver	2	update through import_export	10	2
582	2018-12-29 06:46:12.672217+00	92	Iphone 8 plus 64 gb grey	2	update through import_export	10	2
583	2018-12-29 06:46:12.673546+00	91	J530 (J5 ) gold	2	update through import_export	10	2
584	2018-12-29 06:46:12.674871+00	90	Iphone 8 256 gb \tred	2	update through import_export	10	2
585	2018-12-29 06:46:12.676242+00	89	J530 (J5 ) black	2	update through import_export	10	2
586	2018-12-29 06:46:12.677595+00	88	Iphone 8 256 gb \tgrey	2	update through import_export	10	2
587	2018-12-29 06:46:12.678896+00	87	J330 (J3) gold	2	update through import_export	10	2
588	2018-12-29 06:46:12.680235+00	86	J330 (J3) black	2	update through import_export	10	2
589	2018-12-29 06:46:12.681554+00	85	Iphone 8 64 gb red	2	update through import_export	10	2
590	2018-12-29 06:46:12.682854+00	84	J701 (J7) gold	2	update through import_export	10	2
591	2018-12-29 06:46:12.684151+00	83	Iphone 8 64 gb silver	2	update through import_export	10	2
592	2018-12-29 06:46:12.691956+00	82	J701 (J7) black	2	update through import_export	10	2
593	2018-12-29 06:46:12.693271+00	81	Iphone 8 64 gb gold	2	update through import_export	10	2
594	2018-12-29 06:46:12.694583+00	80	Iphone 8 64 gb \tgrey	2	update through import_export	10	2
595	2018-12-29 06:46:12.695887+00	79	Iphone 7 plus 32 gb \tgold	2	update through import_export	10	2
596	2018-12-29 06:46:12.69719+00	78	Iphone 7 plus 32 gb black	2	update through import_export	10	2
597	2018-12-29 06:46:12.698519+00	77	Iphone 7 128 gb \tred	2	update through import_export	10	2
598	2018-12-29 06:46:12.699901+00	76	Iphone 7 128 gb silver	2	update through import_export	10	2
599	2018-12-29 06:46:12.701182+00	75	Iphone 7 128 gb rose gold	2	update through import_export	10	2
600	2018-12-29 06:46:12.702484+00	74	Iphone 7 128 gb gold	2	update through import_export	10	2
601	2018-12-29 06:46:12.703852+00	73	Iphone 7 32 gb rose gold	2	update through import_export	10	2
602	2018-12-29 06:46:12.705146+00	72	Iphone 7 32 gb gold	2	update through import_export	10	2
603	2018-12-29 06:46:12.706449+00	71	J320 (J3) gold	2	update through import_export	10	2
604	2018-12-29 06:46:12.7077+00	70	Iphone 7 32 gb black	2	update through import_export	10	2
605	2018-12-29 06:46:12.709044+00	69	Iphone 6 32 gb grey	2	update through import_export	10	2
606	2018-12-29 06:46:12.710344+00	68	Iphone SE 32 gb gold	2	update through import_export	10	2
607	2018-12-29 06:46:12.711695+00	67	J250M (J2 Pro) gold	2	update through import_export	10	2
608	2018-12-29 06:46:12.712962+00	66	Iphone X 256 gb grey	2	update through import_export	10	2
609	2018-12-29 06:46:12.7143+00	65	J250M (J2 Pro) black	2	update through import_export	10	2
610	2018-12-29 06:46:12.715574+00	64	Iphone X 256 gb silver	2	update through import_export	10	2
611	2018-12-29 06:46:12.71685+00	63	Iphone X 64 gb grey	2	update through import_export	10	2
612	2018-12-29 06:46:12.71815+00	62	J200 (J2) gold	2	update through import_export	10	2
613	2018-12-29 06:46:12.719497+00	61	J200 (J2) black	2	update through import_export	10	2
614	2018-12-29 06:46:12.720807+00	60	Redmi 6 6/64 gb black	2	update through import_export	10	2
615	2018-12-29 06:46:12.722133+00	59	Redmi note 5 64 gb black	2	update through import_export	10	2
616	2018-12-29 06:46:12.72342+00	58	J110 (J1 Ace) White	2	update through import_export	10	2
617	2018-12-29 06:46:12.724718+00	57	Redmi Note 5 32 gb gold	2	update through import_export	10	2
618	2018-12-29 06:46:12.726029+00	56	J110 (J1 Ace) black	2	update through import_export	10	2
619	2018-12-29 06:46:12.727285+00	55	Redmi note 5 32 gb black	2	update through import_export	10	2
620	2018-12-29 06:46:12.728581+00	54	J105 (J1 mini) black	2	update through import_export	10	2
621	2018-12-29 06:46:12.72985+00	53	Redmi S2 64 gb gold	2	update through import_export	10	2
622	2018-12-29 06:46:12.731152+00	52	G965 256 gb (S9+) Purple	2	update through import_export	10	2
623	2018-12-29 06:46:12.732436+00	51	Redmi S2 64 gb grey	2	update through import_export	10	2
624	2018-12-29 06:46:12.733705+00	50	G965 256 gb (S9+) grey	2	update through import_export	10	2
625	2018-12-29 06:46:12.734986+00	49	Redmi S2 32 gb gold	2	update through import_export	10	2
626	2018-12-29 06:46:12.736279+00	48	G965 256 gb (S9+) black	2	update through import_export	10	2
627	2018-12-29 06:46:12.737647+00	47	Redmi S2 32 gb grey	2	update through import_export	10	2
628	2018-12-29 06:46:12.738971+00	46	Redmi 5 plus 64 gb black	2	update through import_export	10	2
629	2018-12-29 06:46:12.740259+00	45	Redmi 5 plus 64 gb gold	2	update through import_export	10	2
630	2018-12-29 06:46:12.741532+00	44	Redmi 5 plus 32 gb black	2	update through import_export	10	2
631	2018-12-29 06:46:12.742901+00	43	Redmi 5 plus 32 gb gold	2	update through import_export	10	2
632	2018-12-29 06:46:12.744178+00	42	G965 (S9+) grey	2	update through import_export	10	2
633	2018-12-29 06:46:12.745512+00	41	Redmi 5 32 gb gold	2	update through import_export	10	2
634	2018-12-29 06:46:12.746893+00	40	Redmi 5 32 gb black	2	update through import_export	10	2
635	2018-12-29 06:46:12.748248+00	39	G965 (S9+) black	2	update through import_export	10	2
636	2018-12-29 06:46:12.749606+00	38	Redmi 5 16 gb gold	2	update through import_export	10	2
637	2018-12-29 06:46:12.750891+00	37	G960 (S9) grey	2	update through import_export	10	2
638	2018-12-29 06:46:12.752186+00	36	G960 (S9) purple	2	update through import_export	10	2
639	2018-12-29 06:46:12.753529+00	35	Redmi 5 16 gb black	2	update through import_export	10	2
640	2018-12-29 06:46:12.754812+00	34	G960 (S9) black	2	update through import_export	10	2
641	2018-12-29 06:46:12.756108+00	33	Redmi 5A 32 gb black	2	update through import_export	10	2
642	2018-12-29 06:46:12.757394+00	32	G950 (S8) red	2	update through import_export	10	2
643	2018-12-29 06:46:12.758685+00	31	G950 (S8) gold	2	update through import_export	10	2
644	2018-12-29 06:46:12.760153+00	30	G950 (S8) black	2	update through import_export	10	2
645	2018-12-29 06:46:12.76142+00	29	Redmi 5A 16 gb black	2	update through import_export	10	2
646	2018-12-29 06:46:12.762743+00	28	G570 (J5 prime) gold	2	update through import_export	10	2
647	2018-12-29 06:46:12.764153+00	27	G570 (J5 prime) black	2	update through import_export	10	2
648	2018-12-29 06:46:12.765612+00	26	Redmi A1/64 gold	2	update through import_export	10	2
649	2018-12-29 06:46:12.766856+00	25	Redmi A1/64 black	2	update through import_export	10	2
650	2018-12-29 06:46:12.768132+00	24	Redmi 5 Plus 4/64 gold	2	update through import_export	10	2
651	2018-12-29 06:46:12.76943+00	23	G532 (J2 Prime) gold	2	update through import_export	10	2
652	2018-12-29 06:46:12.770717+00	22	G532 (J2 Prime) black	2	update through import_export	10	2
653	2018-12-29 06:46:12.772028+00	21	Redmi 5 Plus 4/64 black	2	update through import_export	10	2
654	2018-12-29 06:46:12.773328+00	20	A710 gold	2	update through import_export	10	2
655	2018-12-29 06:46:12.77473+00	19	Redmi 5 3/32 gold	2	update through import_export	10	2
656	2018-12-29 06:46:12.776104+00	18	A710 black	2	update through import_export	10	2
657	2018-12-29 06:46:12.777507+00	17	Redmi 5 3/32 black	2	update through import_export	10	2
658	2018-12-29 06:46:12.778784+00	16	A520 (A5) gold	2	update through import_export	10	2
659	2018-12-29 06:46:12.780134+00	15	A520 (A5) black	2	update through import_export	10	2
660	2018-12-29 06:46:12.781484+00	14	Redmi 5 2/16 black	2	update through import_export	10	2
661	2018-12-29 06:46:12.782894+00	13	A320 (A3) gold	2	update through import_export	10	2
662	2018-12-29 06:46:12.784243+00	12	A320 (A3) black	2	update through import_export	10	2
663	2018-12-29 06:46:12.785527+00	11	A730 (A8 plus) grey	2	update through import_export	10	2
664	2018-12-29 06:46:12.786814+00	10	A730 (A8 plus) gold	2	update through import_export	10	2
665	2018-12-29 06:46:12.788166+00	9	A730 (A8 plus) black	2	update through import_export	10	2
666	2018-12-29 06:46:12.789464+00	8	A530 (A8) grey	2	update through import_export	10	2
667	2018-12-29 06:46:12.790718+00	7	A530 (A8) gold	2	update through import_export	10	2
668	2018-12-29 06:46:12.791976+00	6	A605 gold	2	update through import_export	10	2
669	2018-12-29 06:46:12.793251+00	5	A600 gold	2	update through import_export	10	2
670	2018-12-29 06:46:12.794531+00	4	A605 black	2	update through import_export	10	2
671	2018-12-29 06:46:12.79584+00	3	A600 black	2	update through import_export	10	2
672	2018-12-29 06:46:12.797625+00	2	Redmi 5 2/16 gb gold	2	update through import_export	10	2
673	2018-12-29 07:43:34.664837+00	4	Slider object (4)	2	[{"changed": {"fields": ["image"]}}]	9	2
674	2018-12-29 07:45:23.717769+00	3	Slider object (3)	2	[{"changed": {"fields": ["image"]}}]	9	2
675	2018-12-29 07:45:49.461195+00	2	Slider object (2)	2	[{"changed": {"fields": ["image"]}}]	9	2
676	2018-12-29 07:46:45.90397+00	1	Slider object (1)	2	[{"changed": {"fields": ["image"]}}]	9	2
677	2018-12-29 10:50:03.399345+00	4	Slider object (4)	2	[{"changed": {"fields": ["image"]}}]	9	2
678	2018-12-29 13:02:23.983934+00	3	Slider object (3)	2	[{"changed": {"fields": ["image"]}}]	9	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 678, true);


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
16	store	order
17	store	cartitem
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


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
19	store	0002_auto_20181223_2345	2018-12-24 01:35:55.174881+00
20	app	0003_auto_20181226_1902	2018-12-26 19:57:58.917656+00
21	app	0004_auto_20181226_1905	2018-12-26 19:57:58.965322+00
22	app	0005_auto_20181226_1908	2018-12-26 19:57:58.973378+00
23	store	0003_auto_20181227_2047	2019-01-02 13:08:43.571273+00
24	store	0004_auto_20190101_1719	2019-01-02 13:08:43.619322+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


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
1nejxcoq1ilx09schqqh57hhlw68p5ok	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2019-01-03 11:32:20.370872+00
kab60qpvsh76lei501rui7xsqq99bdhb	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2019-01-03 18:45:00.575198+00
4yb3woqcwgh4hv031yfgnsizlqiqikqh	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2019-01-04 09:27:59.947645+00
7f2j9562ockg6d8x6smrv6pi3de77vn6	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2019-01-06 22:40:57.157572+00
xon2sgzys3hx9xmkf2sz5lwu5e55la3m	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2019-01-09 09:12:07.12942+00
ncyqx8wcmqpvqbo2b373by9bps76g3hy	NDI0OGQ5YWY4ODk3ZDM5ZDJlZmZiYjFkNGMzMmE1NjZiYTJhZWUxZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYTUwZThlMmQ0NDgyY2UyNTIwMWMwZGFmYjE3Mzg4ZTMxZjdjYjdiIn0=	2019-01-09 09:13:00.509148+00
puvhyerb2oqh0cs81obpbd0uvvzgddna	ZTNiZmEyYWU0MzZlZTU1ZmEwYjVlOWJlYTgzODY5MGI0YjkzYmRhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWRjZGZlODMyZmFiYTc1M2IwNzRmNmY0MTU1ZmQwNjU4NDZmOWVlIn0=	2019-01-16 10:18:25.919235+00
\.


--
-- Data for Name: store_cartitem; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_cartitem (id, quantity, total_price, order_id, product_id) FROM stdin;
1	1	996000	1	2
2	1	1	1	138
3	1	1	1	42
4	1	1	1	164
5	2	2	1	123
6	1	996000	2	2
7	1	1	2	138
8	1	1	2	42
9	1	1	2	164
10	2	2	2	123
11	1	996000	3	2
12	1	1	3	138
13	1	1	3	42
14	1	1	3	164
15	2	2	3	123
16	1	1	3	36
\.


--
-- Name: store_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_cartitem_id_seq', 16, true);


--
-- Data for Name: store_order; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_order (id, total_price, additional_info, order_status, customer_id, customer_full_name, customer_phone) FROM stdin;
1	996005	info	pending	1	\N	\N
2	996005	info	pending	1	\N	\N
3	996006	info	pending	1	\N	\N
\.


--
-- Name: store_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_order_id_seq', 3, true);


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: bozorcom
--

COPY public.store_product (id, title, price, image, slug, description, quantity, featured, new, top_rated, brand_id, category_id) FROM stdin;
59	Redmi note 5 64 gb black	1595000	0_ey0HmPx.jpg	xiaomi-Redmi-note-5-64 gb-black		100	f	f	f	3	17
116	Tab A 7 8 gb 4G SM-T285 black	1595000	1_DXE9geW.jpg	samsung-galaxy-tab-7-8 gb-4g-sm-t285-black		1	f	f	f	2	18
167	ME83ARW-K/BW	1595000	1_eyQNGmr.jpg	mikrotlinli-pech-samsung-me83arw-kbw		1	f	f	f	2	3
166	 ME81ARW-K/BW	1595000	1_7F0s25a.jpg	mikrotlinli-pech-samsung-me81arw-kbw		1	f	f	f	2	3
165	MC28H5013AW/BW	1595000	1.webp	mc28h5013awbw		1	f	f	f	2	3
164	VC18M21A0SB/EV	1595000	1_26lnI7x.jpg	changyutgich-samsung-vc18m21a0sbev		1	f	t	f	2	4
163	VC18M21B0S2/EV	1595000	ru-vc18m21d0vg-vc18m21b0s2-ev-rperspectiveblue-63683120.jpg	changyutkich-samsung-vc18m21b0s2ev		1	f	t	f	2	4
162	T3 LTE /10 black	1595000	1_HMD7dDp.jpg	huawei-t3-lte-10-black		1	f	f	f	5	22
161	M700 (Q6) 3/32 gb black	1595000	large_01-min.jpg	lg-m700-q6-332 gb-black		1	f	f	f	6	20
160	T3/7 black	1595000	1_h70FZG5.jpg	huawei-t37-black		1	f	f	f	5	22
159	Y5/2 black	1595000	1_WQGcRN5.jpg	huawei-y52-black		1	f	f	f	5	22
158	H930 V30 black	1595000	lg_lgh930ds_acisbk_images_2757781535.jpg	lg-h930-v30-black		1	f	f	f	6	20
157	Y5/2 gold	1595000	DSC_0050-770x481.jpg	huawei-y52-gold		1	f	f	f	5	22
173	ME83KRS-1K BW	1595000	1_feNj251.jpg	mikrotlinli-pech-samsung-me83krs-1k-bw		1	f	f	f	2	3
172	UE32M4000 Jedi	1595000	32M4000_111-650x489_1.jpg	televizor-samsung-ue-32m-4000-jedi		1	f	f	f	2	7
171	ME81KRW-1K BW	1595000	1_6H5IqYf.jpg	mikrotlinli-pech-samsung-me81krw-1k-bw		1	f	f	f	2	3
170	GE83ARW-K/BW	1595000	1_QOdQHSZ.jpg	mikrotlinli-pech-samsung-ge83arw-kbw		1	f	f	f	2	3
169	GE81ARW-K/BW	1595000	1_w1uxqDF.jpg	mikrotlinli-pech-samsung-ge81arw-kbw		1	f	f	f	2	3
168	Redmi 6A gold (eu)	1595000	1_wCeVCuZ.jpg	Redmi-6a-black-(eu)	Xiaomi Redmi 6А.\r\nИшлаб чиқарувчанлик ва мавжудликнинг уйғунлиги Сизнингча, флагмани хусусиятларга эга бюджетли смартфонлар йўқми? Xiaomi стереотипларни бузади. Redmi 6А инноватцион технологиялар, катта ёрқин экран, юқори сифатли процессор ва ажойиб камералар билан ёрқин таассурот қолдиради. Юпқа корпус ва нозик хошиялар туфайли сиз Xiaomi Redmi 6А ни қўлингиздан чиқаришни хоҳламайсиз.	1	f	f	f	3	17
142	P20 lite blue	1595000	1_9mo1(eu)d.png	huawei-p-20-lite-blue		1	f	f	f	5	22
141	P20 lite black	1595000	1_0m7bwHl.jpg	huawei-p-20-lite-black		1	f	f	f	5	22
140	P smart gold	1595000	1_KM0a0hG.jpg	huawei-p-smart-gold		1	f	f	f	5	22
139	P smart black	1595000	1_eT0UjBi.jpg	huawei-p-smart-black		1	f	f	f	5	22
138	VC18M2130SR/EV	1595000	1_2q7x5Dy.jpg	changyutkich-samsung-vc18m2130srev		1	f	f	f	2	4
137	VC18M21A0S1/EV	1595000	1_H5C7pJu.jpg	chang-yutkich-samsung-vc18m21a0s1ev		1	f	f	f	2	4
136	X240 (K8)\t gold	1595000	1_CPYLGMZ.jpg	lg-x240-k8-gold		1	t	t	t	6	20
135	X240 (K8)\t black	1595000	1_BkRvDcI.jpg	lg-x240-k8-black		1	f	f	f	6	20
134	M250 (K10) black	1595000	1_N8w0jrf.jpg	lg-m250-k10-black		1	f	f	f	6	20
133	M250 (K10) Titan	1595000	1_W2mJhFj.jpg	lg-m250-k10-titan		1	f	f	f	6	20
132	K430 (K10 LTE) black	1595000	1_kas7AiE.jpg	lg-k430-k10-lte-black		1	f	f	f	6	20
131	X230 (K4) brown	1595000	1_DQoigUP.jpg	lg-x230-k4-brown		1	f	f	f	6	20
130	X230 (K4) titan	1595000	1_QX8PN1B.jpg	lg-x230-k4-titan		1	f	f	f	6	20
129	PRO 7 4/64 gb red	1595000	1_poEQ0DM.jpg	meizu-pro-7-464 gb-red		1	f	f	f	4	21
128	PRO 7 4/64 gb black	1595000	1_6GgNwEs.jpg	meizu-pro-7-464 gb-black		1	f	f	f	4	21
127	M6s 3/32 gb black	1595000	1_Ks8czO3.jpg	meizu-m6s-332 gb-black		1	f	f	f	4	21
126	M6 Note 4/64 gb black	1595000	1_EDE gb3f.jpg	meizu-m6-note-464 gb-black		1	f	f	f	4	21
125	M6 Note 3/32 gb black	1595000	1_EmkVhev.jpg	meizu-m6-note-332 gb-black		1	f	f	f	4	21
124	M6 Note 3/16 gb black	1595000	1_yBf1Dby.jpg	meizu-m6-note-316 gb-black		1	f	f	f	4	21
123	M6s 3/32 gb black	1595000	1_1REyZn3.jpg	meizu-m6s-332 gb-black		1	f	t	t	4	21
122	M6 3/32 gb black	1595000	copy_meizu_m6_216_black_(eu)_5a6a0614c5abb_images_2682688919.jpg	meizu-m6-332 gb-black		1	f	f	f	4	21
121	M6s 2/16 gb black	1595000	1_cBGFQ9X.jpg	meizu-m6s-216 gb-black		1	f	f	f	4	21
120	M5s 3/16 gb gold	1595000	1_UdSmMz3.jpg	meizu-m5s-316 gb-gold		1	f	f	f	4	21
119	Tab A 7 8 gb 4G SM-T285 White	1595000	1_kcMQW5X.jpg	samsung-galaxy-tab-7-8 gb-4g-sm-t285-white		1	f	f	f	2	18
118	Ipad 4G 2017 32 gb grey	1595000	screenshot_1_193_153_1.jpg	ipad-new-4g-2017-32 gb-grey		1	f	f	f	1	19
117	Tab A 7 8 gb 4G SM-T285 silver	1595000	1_MP6LosC.jpg	samsung-galaxy-tab-7-8 gb-4g-sm-t285-silver		1	f	f	f	2	18
115	Tab A 8.0 LTE SM-T385 gold	1595000	1_ORXxnRx.jpg	samsung-galaxy-tab-80-lte-sm-t385-gold		1	f	f	f	2	18
114	Ipad wi-fi 2017 128 gb grey	1595000	9a09478449eaec2c07c38a1887987ef7.jpg	ipad-new-wi-fi-2017-128 gb-grey		1	f	f	f	1	19
113	Tab A 8.0 LTE SM-T385 black	1595000	1_6MVuqqN.jpg	samsung-galaxy-tab-80-lte-sm-t385-black		1	f	f	f	2	18
112	Ipad wi-fi 2017 128 gb gold	1595000	e53083945de2aecb757febb0565384ff.jpg	ipad-new-wi-fi-2017-128 gb-gold		1	t	t	f	1	19
111	Tab E (SM-T561) Brown	1595000	1_P6BG3K0.jpg	samsung-galaxy-tab-e-sm-t561-brown		1	f	f	f	2	18
110	Ipad wi-fi 2017 128 gb silver	1595000	9c090312d462edcbeb924c3841a6f15b.jpg	ipad-new-wi-fi-2017-128 gb-silver		1	f	f	f	1	19
109	Tab E (SM-T561) black	1595000	1_zhic6nw.jpg	samsung-galaxy-tab-e-sm-t561-black		1	f	f	f	2	18
108	Ipad wi-fi 2017 32 gb \tgold	1595000	f2919e49336397654546d142a6deab1e.jpg	ipad-new-wi-fi-2017-32 gb-gold		1	f	f	f	1	19
107	Ipad wi-fi 2017 32 gb \tsilver	1595000	03790bdd4af5cf77c82426e2a41dab67.jpg	ipad-new-wi-fi-2017-32 gb-silver		1	f	f	f	1	19
106	Tab S2 8.0 [SM-T719] gold	1595000	1_dtQLmY2.jpg	samsung-galaxy-tab-s2-80-sm-t719-gold		1	f	f	f	2	18
105	Tab S2 8.0 [SM-T719] black	1595000	1_xGoaQfU.jpg	samsung-galaxy-tab-s2-80-sm-t719-black		1	f	f	f	2	18
104	Tab S3 SM-T825 silver	1595000	1_0bToUAy.jpg	samsung-galaxy-tab-s3-sm-t825-silver		1	f	f	f	2	18
103	Tab S3 SM-T825 black	1595000	1_4zsarSZ.jpg	samsung-galaxy-tab-s3-sm-t825-black		1	f	f	f	2	18
102	Ipad mini 4 128 gb WiFi+4G gold	1595000	00675971b0c380026b5568fe23f6c0d7.jpg	ipad-mini-4-128 gb-wifi4g-gold		1	f	f	f	1	19
101	Ipad mini 4 128 gb WiFi+4G grey	1595000	10e0766b0549a9ca686b94aa3b3802da.jpg	ipad-mini-4-128 gb-wifi4g-grey		1	f	f	f	1	19
100	Ipad mini 4 128 gb WiFi+4G silver	1595000	c78c549a4e77e4377a63851b5f96efec.jpg	ipad-mini-4-128 gb-wifi4g-silver		1	f	f	f	1	1
99	N950 Note 8 gold	1595000	3_guASVES.jpg	samsung-galaxy-n950-note-8-gold		1	f	f	f	2	18
98	N950 Note 8 black	1595000	1_jnDIL6C.jpg	samsung-galaxy-n950-note-8-black		1	f	f	f	2	18
97	Iphone 8 plus 256 gb red	1595000	2_UN5yHQs.jpg	iphone-8-plus-256 gb-red		1	f	f	f	1	19
96	Iphone 8 plus 256 gb grey	1595000	30030155b.jpg	iphone-8-plus-256 gb-grey		1	f	f	f	1	19
95	J730 (J7) gold	1595000	1_wi70z6p.jpg	samsung-galaxy-j730-j7-gold		1	f	f	f	2	18
94	J730 (J7) black	1595000	1_4kMVbym.jpg	samsung-galaxy-j730-j7-black		100	f	f	f	2	18
93	Iphone 8 plus 64 gb \tsilver	1595000	0_SOvMvfP.jpeg	iphone-8-plus-64 gb-silver		100	f	f	f	1	19
92	Iphone 8 plus 64 gb grey	1595000	0_2XbCY6y.jpg	iphone-8-plus-64 gb-grey		100	f	f	f	1	19
91	J530 (J5 ) gold	1595000	1_BVskbCj.jpg	samsung-galaxy-j530-j5-gold		100	f	f	f	2	18
90	Iphone 8 256 gb \tred	1595000	1_2gD59Ch.jpg	iphone-8-256 gb-red		100	f	f	f	1	19
89	J530 (J5 ) black	1595000	1_Gm5Vlzh.jpg	samsung-galaxy-j530-j5-black		100	f	f	f	2	18
88	Iphone 8 256 gb \tgrey	1595000	iphone8-plus-spgray-select-2017_1_M2bS61x.jpg	iphone-8-256 gb-grey		100	f	f	f	1	19
87	J330 (J3) gold	1595000	1_qjeQY5g.jpg	samsung-galaxy-j330-j3-gold		100	f	f	f	2	18
86	J330 (J3) black	1595000	1_4FlBwMH.jpg	samsung-galaxy-j330-j3-black		100	f	f	f	2	18
85	Iphone 8 64 gb red	1595000	1_j89THmU.jpg	iphone-8-64 gb-red		100	f	f	f	1	19
84	J701 (J7) gold	1595000	1_uIY0FIv.jpg	samsung-galaxy-j701-j7-gold		100	f	f	f	2	18
83	Iphone 8 64 gb silver	1595000	apple_iphone_8_silver_3_1_1_1.jpeg	iphone-8-64 gb-silver		100	f	f	f	1	19
82	J701 (J7) black	1595000	1_BSPNb50.jpg	samsung-galaxy-j701-j7-black		100	f	f	f	2	18
81	Iphone 8 64 gb gold	1595000	3_306_19_1.jpg	iphone-8-64 gb-gold		100	f	f	f	1	19
80	Iphone 8 64 gb \tgrey	1595000	iphone8-plus-spgray-select-2017_1.jpg	iphone-8-64 gb-grey		100	f	f	f	1	19
79	Iphone 7 plus 32 gb \tgold	1595000	apple_iphone_7_plus_gold_1_2.jpg	iphone-7-plus-32 gb-gold		100	f	f	f	1	19
78	Iphone 7 plus 32 gb black	1595000	apple_iphone_7_plus_black_1_2.jpg	iphone-7-plus-32 gb-black		100	f	f	f	1	19
77	Iphone 7 128 gb \tred	1595000	1_563_11.jpg	iphone-7-128 gb-red		100	f	f	f	1	19
76	Iphone 7 128 gb silver	1595000	apple_iphone_7_silver_0_1.jpg	iphone-7-128 gb-silver		100	f	f	f	1	19
75	Iphone 7 128 gb rose gold	1595000	apple_iphone_7_rose_1_3_pzmt1oD.jpg	iphone-7-128 gb-rosegold		100	f	f	f	1	19
74	Iphone 7 128 gb gold	1595000	apple_iphone_7_gold_1_3_BnS7qbS.jpg	iphone-7-128 gb-gold		100	t	t	t	1	19
73	Iphone 7 32 gb rose gold	1595000	apple_iphone_7_rose_1_3.jpg	iphone-7-32 gb-rosegold		100	f	f	f	1	19
72	Iphone 7 32 gb gold	1595000	apple_iphone_7_gold_1_3.jpg	iphone-7-32 gb-gold		100	f	f	f	1	19
71	J320 (J3) gold	1595000	1_rpA24Yu.jpg	samsung-galaxy-j320-j3-gold		100	f	f	f	2	18
70	Iphone 7 32 gb black	1595000	0_AxUmjhR.jpg	iphone-7-32 gb-black		100	f	f	f	1	19
69	Iphone 6 32 gb grey	1595000	1_vmNlSZa.jpg	iphone-6-32 gb-grey		100	f	f	f	1	19
68	Iphone SE 32 gb gold	1595000	1_y4DRmHa.jpg	iphone-se-32 gb-gold		100	f	f	f	1	19
67	J250M (J2 Pro) gold	1595000	1_1I1s16r.jpg	samsung-galaxy-j250m-j2-pro-gold		100	f	f	f	2	18
66	Iphone X 256 gb grey	1595000	0_macW3cN.jpg	iphone-x-256 gb-grey		100	f	f	f	1	19
65	J250M (J2 Pro) black	1595000	1_MUBf7dI.jpg	samsung-galaxy-j250m-j2-pro-black		100	f	f	f	2	18
64	Iphone X 256 gb silver	1595000	0_OO1TAOm.jpg	iphone-x-256 gb-silver		100	f	f	f	1	19
63	Iphone X 64 gb grey	1595000	0_WfWAUM7.jpg	iphone-x-64 gb-grey		100	f	f	f	1	19
62	J200 (J2) gold	1595000	1_jFuLaxA.jpg	samsung-galaxy-j200-j2-gold		100	f	f	f	2	18
61	J200 (J2) black	1595000	1_5(eu)STcN.jpg	samsung-galaxy-j200-j2-black		100	f	f	f	2	18
60	Redmi 6 6/64 gb black	1595000	xiaomi_mi6_664_blk_images_2027581644_Nwo27WH.jpg	xiaomi-mi-6-664 gb-black		100	f	f	f	3	17
58	J110 (J1 Ace) White	1595000	1_PJx5r6B.jpg	samsung-galaxy-j110-j1-ace-white		100	f	f	f	2	18
57	Redmi Note 5 32 gb gold	1595000	0_zkFJrix.jpg	xiaomi-Redmi-note-5-32 gb-gold		100	f	f	f	3	17
56	J110 (J1 Ace) black	1595000	1_81uBtKp.jpg	samsung-galaxy-j110-j1-ace-black		100	f	f	f	2	18
55	Redmi note 5 32 gb black	1595000	1_OnZZbKj.jpg	xiaomi-Redmi-note-5-32 gb-black		100	f	f	f	3	17
54	J105 (J1 mini) black	1595000	1_QqTDawy.jpg	samsung-galaxy-j105-j1-mini-black		100	f	f	f	2	18
53	Redmi S2 64 gb gold	1595000	_-_-_-001_1.jpg	xiaomi-Redmi-s2-64 gb-gold		100	f	f	f	3	17
52	G965 256 gb (S9+) Purple	1595000	1_4IWxQXR.jpg	samsung-galaxy-g965256-s9-purple		100	f	f	f	2	18
156	Y3 2017\tgold	1595000	1_E2UTqQa.jpg	huawei-y3-2017-gold		1	f	f	f	5	22
155	P8lite White	1595000	1_doKLLfk.jpg	huawei-p8lite-white		1	f	f	f	5	22
154	M320 XP2 gold	1595000	1_9S0XTyE.jpg	lg-m320-xp2-gold		1	f	f	f	6	20
153	P8lite gold	1595000	1_olM7Jqd.jpg	huawei-p8lite-gold		1	f	f	f	5	22
152	M320 XP2 black	1595000	1_OTQdgk6.jpg	lg-m320-xp2-black		1	f	f	f	6	20
151	P8lite black	1595000	1_cb3yKTG.jpg	huawei-p8lite-black		1	f	f	f	5	22
150	P8lite 2017 gold	1595000	1_U1071VR.jpg	huawei-p8lite-2017-gold		1	f	f	f	5	22
149	P8lite 2017 black	1595000	1_lYKSM6Q.jpg	huawei-p8lite-2017-black		1	f	f	f	5	22
148	GT3 White	1595000	1.jpeg	huawei-gt3-white		1	f	f	f	5	22
147	HONOR 6A black	1595000	1_TKVYHpo.jpg	huawei-honor-6a-black		1	f	f	f	5	22
146	M700 (Q6) 2 gb /16 gb gold	1595000	1_JRpGxwU.jpg	lg-m700-q6-2 gb16 gb-black		1	f	f	f	6	20
145	P 20\tBlue	1595000	1_cZX9WeN.jpg	huawei-p-20-blue		1	f	f	f	5	22
144	M700 (Q6) 2 gb /16 gb black	1595000	1_PBLiGTX.jpg	lg-m700-q6-2 gb16 gb-black		1	f	f	f	6	20
143	P20 \tblack	1595000	1_v9HGYR8.jpg	huawei-p-20-black		1	f	f	f	5	22
51	Redmi S2 64 gb grey	1595000	0_Tra6fcM.jpg	xiaomi-Redmi-s2-64 gb-grey		100	f	f	f	3	17
50	G965 256 gb (S9+) grey	1595000	1_2OsaV21.jpg	samsung-galaxy-g965256-s9-grey		100	f	f	f	2	18
49	Redmi S2 32 gb gold	1595000	0_GWePBbD.jpg	xiaomi-Redmi-s2-32 gb-gold		100	f	f	f	3	17
48	G965 256 gb (S9+) black	1595000	1_e9OGgNn.jpg	samsung-galaxy-g965256-s9-black		100	f	f	f	2	18
47	Redmi S2 32 gb grey	1595000	0_xQ8y5W3.jpg	xiaomi-Redmi-s2-32 gb-grey		100	f	f	f	3	17
46	Redmi 5 plus 64 gb black	1595000	0.jpeg	xiaomi-Redmi-5-plus-64 gb-black		100	f	f	f	3	17
45	Redmi 5 plus 64 gb gold	1595000	0000.png	xiaomi-Redmi-5-plus-64 gb-gold		100	f	f	f	3	17
44	Redmi 5 plus 32 gb black	1595000	0_yFYg836.jpg	xiaomi-Redmi-5-plus-32 gb-black		100	f	f	f	3	17
43	Redmi 5 plus 32 gb gold	1595000	0_1TO4rUy.jpg	xiaomi-Redmi-5-plus-32 gb-gold		100	f	f	f	3	17
42	G965 (S9+) grey	1595000	1.JPG	samsung-galaxy-g965-s9-grey		100	f	f	f	2	18
41	Redmi 5 32 gb gold	1595000	0_OQgTrBg.jpg	xiaomi-Redmi-5-32 gb-gold		100	f	f	f	3	17
40	Redmi 5 32 gb black	1595000	0_5Dx3e4a.jpg	xiaomi-Redmi-5-32 gb-black		100	f	f	f	3	17
39	G965 (S9+) black	1595000	1_87QJRGt.jpg	samsung-galaxy-g965-s9-black		100	f	f	f	2	18
38	Redmi 5 16 gb gold	1595000	0_DN7eDnd.jpg	xiaomi-Redmi-5-16 gb-gold		100	f	f	f	3	17
37	G960 (S9) grey	1595000	1_BZneRxy.jpg	samsung-galaxy-g960-s9-grey		100	f	f	f	2	18
36	G960 (S9) purple	1595000	1_rA0HwOy.jpg	samsung-galaxy-g960-s9-purple		100	t	t	t	2	18
35	Redmi 5 16 gb black	1595000	0_XMTmvIY.jpg	xiaomi-Redmi-5-16 gb-black		100	f	f	f	3	17
34	G960 (S9) black	1595000	1_DTBCznu.jpg	samsung-galaxy-g960-s9-black		100	f	f	f	2	18
33	Redmi 5A 32 gb black	1595000	00_klNv3w3.jpeg	xiaomi-Redmi-5a-32- gb-black		100	f	f	f	3	17
32	G950 (S8) red	1595000	1_3BXgrSb.jpg	samsung-galaxy-g950-s8-red		100	f	f	f	2	18
31	G950 (S8) gold	1595000	1_fi9Cr4Y.jpg	samsung-galaxy-g950-s8-gold		100	f	f	f	2	18
30	G950 (S8) black	1595000	1_6MYunr9.jpg	samsung-galaxy-g950-s8-black		100	f	f	f	2	18
29	Redmi 5A 16 gb black	1595000	0_2Jc1JjG.jpg	xiaomi-Redmi-5a-16- gb-black		100	f	f	f	3	17
28	G570 (J5 prime) gold	1595000	1_GDpqXZv.jpg	samsung-galaxy-g570-j5-prime-gold		100	f	f	f	2	18
27	G570 (J5 prime) black	1595000	1_yyMsBLz.jpg	samsung-galaxy-g570-j5-prime-black		100	f	f	f	2	18
26	Redmi A1/64 gold	1595000	0.png	xiaomi-Redmi-a164-gold		100	f	f	f	3	17
25	Redmi A1/64 black	1595000	0_kRXdEbm.jpg	xiaomi-Redmi-a164		100	f	f	f	3	17
24	Redmi 5 Plus 4/64 gold	1595000	2_8t9F824.png	xiaomi-Redmi-5-464-gold		100	f	f	f	3	17
23	G532 (J2 Prime) gold	1595000	1_6txTnW8.jpg	samsung-galaxy-g532-j2-prime-gold		100	f	f	f	2	18
22	G532 (J2 Prime) black	1595000	1_vlU2dc7.jpg	samsung-galaxy-g532-j2-prime-black		100	f	f	f	2	18
21	Redmi 5 Plus 4/64 black	1595000	2_QoDpfc5.jpg	xiaomi-Redmi-5-464-black		100	f	f	f	3	17
20	A710 gold	1595000	0_MCyEG0L.jpg	samsung-galaxy-a710-gold		100	f	f	f	2	18
19	Redmi 5 3/32 gold	1595000	5_wX06r4q.jpg	xiaomi-Redmi-5-332-gold		100	f	f	f	3	17
18	A710 black	1595000	0_sU9Gd2K.jpg	samsung-galaxy-a710-black		100	f	f	f	2	18
17	Redmi 5 3/32 black	1595000	7_WlGsF85.jpg	xiaomi-Redmi-5-332-black		100	f	f	f	3	17
16	A520 (A5) gold	1595000	1_idkkTPK.jpg	samsung-galaxy-a520-a5gold		100	f	f	f	2	18
15	A520 (A5) black	1595000	1_3tJ4jA6.jpg	samsung-galaxy-a520-a5black		100	f	f	f	2	18
14	Redmi 5 2/16 black	1595000	5_BHK4nEE.jpg	xiaomi-Redmi-5-216black		100	f	f	f	3	17
13	A320 (A3) gold	1595000	1_Tp2kOaA.jpg	samsung-galaxy-a320-a3-gold		100	f	f	f	2	18
12	A320 (A3) black	1595000	1_TB5soJQ.jpg	samsung-galaxy-a320-a3-black		100	f	f	f	2	18
11	A730 (A8 plus) grey	1595000	0.jpg	samsung-galaxy-730-a8-plus-grey		100	f	f	f	2	18
10	A730 (A8 plus) gold	1595000	ru-galaxy-a8-a730-sm-a730fzddser-frontgold-87027407.jpg	samsung-galaxy-730-a8-plus-gold		100	f	f	f	2	18
9	A730 (A8 plus) black	1595000	1_9WDwak5.jpg	samsung-galaxy-730-a8-plus-black		100	f	f	f	2	18
8	A530 (A8) grey	1595000	1_q6L5Mnw.jpg	samsung-galaxy-a530-a8-grey		100	f	f	f	2	18
7	A530 (A8) gold	1595000	1.png	samsung-galaxy-a530-a8-gold		100	f	f	f	2	18
6	A605 gold	1595000	1_9N9wFsF.jpg	samsung-galaxy-a605-gold		100	f	f	f	2	18
5	A600 gold	1595000	1_emUuR6t.jpg	samsung-galaxy-a600-gold		100	f	f	f	2	18
4	A605 black	1595000	1_SzwWvRc.jpg	samsung-galaxy-a605-black		100	f	f	f	2	18
3	A600 black	1595000	1_M2nxtHc.jpg	samsung-galaxy-a600-black		100	f	f	f	2	18
2	Redmi 5 2/16 gb gold	1595000	00.jpg	xiaomi-mi-5-16 gb-gold		100	f	t	f	3	17
\.


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_product_id_seq', 173, true);


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
656	4_n1FWojP.jpg	120
657	0_QASwJ75.jpg	120
658	2_xN5Nxe2.jpg	120
659	3_1iZkz2J.jpg	120
660	2_Ee39S6z.jpg	121
661	0_hiR3bTg.jpg	121
662	3_AndxtDT.jpg	121
663	4_mxtsRnP.jpg	121
664	copy_meizu_m6_216_black_eu_5a6a0614c5abb_images_2682689143.jpg	122
665	copy_meizu_m6_216_black_eu_5a6a0614c5abb_images_2682688671.jpg	122
666	copy_meizu_m6_216_black_eu_5a6a0614c5abb_images_2682689527.jpg	122
667	copy_meizu_m6_216_black_eu_5a6a0614c5abb_images_2682689815.jpg	122
668	2_SAp95f8.jpg	123
669	0_CWNqdYu.jpg	123
670	3_4phD3K5.jpg	123
671	5_CyZxxtZ.jpg	123
672	4_2QjWzy6.jpg	123
673	3_O5hjrHW.jpg	124
674	00_u6JMkKB.jpg	124
675	0_wf3Wzgl.jpg	124
676	5_jjAShof.jpg	124
677	6_Dpya1cO.jpg	124
678	2_Hf2rwsl.jpg	124
679	7_YrFqwoT.jpg	124
680	3_9M9rYNl.jpg	125
681	2_5Z2YIHj.jpg	125
682	0_Z9ydbVJ.jpg	125
683	3_xrl3C8c.jpg	126
684	0_qsjrVGl.jpg	126
685	00_Bj1D8sA.jpg	126
686	2_qDc2LUo.jpg	126
687	5_ChKRmpA.jpg	126
688	6_WrTI1JF.jpg	126
689	7_pmYzlCj.jpg	126
690	2_5ro9suw.jpg	127
691	3_iDRKjSW.jpg	127
692	5_glLAUTh.jpg	127
693	4_SsgZtlt.jpg	127
694	0_j3puE2V.jpg	127
695	5_cLp3ebE.jpg	128
696	2_ODBWrqu.jpg	128
697	3_wL0nAl0.jpg	128
698	6_MDQAO5c.jpg	128
699	0_NApdTWd.jpg	128
700	4_4FbWfzz.jpg	128
701	5_fKXkHNg.jpg	129
702	3_n8Eyzxf.jpg	129
703	4_jXR5zCo.jpg	129
704	9_CqP3L3C.jpg	129
705	0_I0yLWu4.jpg	129
706	7_oYddzU8.jpg	129
707	2_WekggXf.jpg	130
708	nbig_1.jpg	130
709	4_YEAoMsX.jpg	130
710	nbig_2.jpg	130
711	nbig_3.jpg	130
712	3_U3EATsI.jpg	130
713	2_BYEycK1.jpg	131
714	4_RVCQF1k.jpg	131
715	3_cqxO8SM.jpg	131
716	3_jLN5PYm.jpg	132
717	4_XSc7ieN.jpg	132
718	K430ds_13112017_Z06.jpg	132
719	K430ds_13112017_Z05.jpg	132
720	2_0ZSXJhL.jpg	132
721	2_yLeTXNr.jpg	133
722	4_dfzDBhG.jpg	133
723	Без_названия_2_w81dItW.jpg	133
724	Без_названия_4.jpg	133
725	Без_названия_5.jpg	133
726	Без_названия.jpg	133
727	2_fRp5si5.jpg	134
728	3_QauXAje.jpg	134
729	4_IfyAS96.jpg	134
730	2_ntNQH0i.jpg	135
731	3_LA5aI0P.jpg	135
732	4_fOLMBw8.jpg	135
733	2_tPC8nFI.jpg	136
734	4_8BO7Ao5.jpg	136
735	5_ue8ycDw.jpg	136
736	3_1JAD3QI.jpg	136
737	1_iU8tOlH.jpg	137
738	2_kYJItpC.jpg	137
739	3_6whmPch.jpg	137
740	4_a7kSgfS.jpg	137
741	kz-ru-canister-2100m-vc18m21a0s1-ev-105565646.jpg	137
742	kz-ru-canister-2100m-vc18m21a0s1-ev-105565653.jpg	137
743	kz-ru-canister-2100m-vc18m21a0s1-ev-105565657.jpg	137
744	kz-ru-canister-2100m-vc18m21a0s1-ev-105565661.jpg	137
745	kz-ru-canister-2100m-vc18m21a0s1-ev-105565667.jpg	137
746	kz-ru-canister-2100m-vc18m21a0s1-ev-105565675.jpg	137
747	kz-ru-canister-2100m-vc18m21a0s1-ev-105565694.jpg	137
748	kz-ru-canister-2100m-vc18m21a0s1-ev-105565726.jpg	137
749	kz-ru-canister-2100m-vc18m21a0s1-ev-105565734.jpg	137
750	kz-ru-canister-2100m-vc18m21a0s1-ev-Black-105565751.jpg	137
751	1_FxAgLHU.jpg	138
752	2_u2Eokhp.jpg	138
753	3_0Hw5Dn9.jpg	138
754	4_EQE2YbD.jpg	138
755	ru-vc2100k-design1-vc18m2130sr-ev-detailvitalityred-63586380.jpg	138
756	ru-vc2100k-design1-vc18m2130sr-ev-detailvitalityred-63586381.jpg	138
757	ru-vc2100k-design1-vc18m2130sr-ev-detailvitalityred-63586385.jpg	138
758	ru-vc2100k-design1-vc18m2130sr-ev-detailvitalityred-63586387.jpg	138
759	ru-vc2100k-design1-vc18m2130sr-ev-dustbinopenvitalityred-63586384.jpg	138
760	ru-vc2100k-design1-vc18m2130sr-ev-dynamicvitalityred-63586377.jpg	138
761	ru-vc2100k-design1-vc18m2130sr-ev-dynamicvitalityred-63586378.jpg	138
762	ru-vc2100k-design1-vc18m2130sr-ev-dynamicvitalityred-63586379.jpg	138
763	ru-vc2100k-design1-vc18m2130sr-ev-dynamicvitalityred-63586382.jpg	138
764	ru-vc2100k-design1-vc18m2130sr-ev-dynamicvitalityred-63586383.jpg	138
765	1_CPutYRv.jpg	139
766	3_aYl5pOF.jpg	139
767	2_FbR820C.jpg	139
768	4_RYO8d33.jpg	139
769	1_YXXoDGN.jpg	140
770	3_v0LQLST.jpg	140
771	2_c915wpd.jpg	140
772	4_ud81pZi.jpg	140
773	1_hOMk2Z7.jpg	141
774	1_VG7buPf.png	141
775	3_Y5lp35J.jpg	141
776	2_Ezll9iZ.jpg	141
777	4_2piquQi.jpg	141
778	1_hQgQFLQ.png	142
779	3_Ated2Zr.jpg	142
780	2_sfI5Ynm.jpg	142
781	4_s7sJjtF.jpg	142
782	1_xOZeJYr.jpg	143
783	1_TZJDvvu.png	143
784	3.jpeg	143
785	2.jpeg	143
786	4.jpeg	143
787	2_J99hwED.jpg	144
788	4_QWp7W5Y.jpg	144
789	3_KskQnHg.jpg	144
790	1_0z52fjD.jpg	145
791	1_EqBXhOl.png	145
792	3_NGTdV3w.jpeg	145
793	2_bvu4RoB.jpeg	145
794	4_RTrQrem.jpeg	145
798	1_dt5JTT9.jpg	147
799	2_Im4QfCr.jpg	147
800	4_I0cpyFH.jpg	147
801	3_ljy8BgC.jpg	147
795	2_6VNbVOw.jpg	146
796	m700an-gold_16112017_d05-min.jpg	146
797	m700an-gold_16112017_d06-min.jpg	146
802	m700an-gold_16112017_d07-min.jpg	146
803	3_nyllSdj.jpg	146
804	m700an_gold_31102017_z09.jpg	146
805	1_eUbmjBQ.jpeg	148
806	3_FreF41u.jpg	148
807	2_UiAbWA8.jpg	148
808	4_aPw9psu.jpg	148
809	1_jQxGwqy.jpg	149
810	2_48ANS5a.jpg	149
811	3_DSAAeMJ.jpg	149
812	4_fhPxQkZ.jpg	149
813	1_TPYWEjC.jpg	150
814	4_wsXL5Yo.jpg	150
815	2_tcYoS2e.jpg	150
816	3_hzKG5Cd.jpg	150
817	1_Ujz8Ict.jpg	151
818	2_FD4WaFs.jpg	151
819	3_Iq5LS5E.jpg	151
820	4_dVJf9TG.jpg	151
821	2_Ui3AfaD.jpg	152
822	LGM320_06112017_Z06.jpg	152
823	4_2NB7WCW.jpg	152
824	LGM320_06112017_Z07.jpg	152
825	LGM320_06112017_Z09.jpg	152
826	LGM320_06112017_Z08.jpg	152
827	3_U1hJKdk.jpg	152
828	1_JLeuMsm.jpg	153
829	2_KpHjtis.jpg	153
830	3_AnPVdWt.jpg	153
831	4_ApwpOgY.jpg	153
832	3_OW1t1Yt.jpg	154
833	4_FgwSoQY.jpg	154
834	2_qKdJExS.jpg	154
835	1_na0eRE1.jpg	155
836	2_DMJLsZr.jpg	155
837	3_27c6amY.jpg	155
838	4_WoVASsI.jpg	155
839	1_7GLigsv.jpg	156
840	3_adtzcWj.jpg	156
841	2_xKByUuY.jpg	156
845	4_Si6nWM5.jpg	157
846	lg_lgh930ds_acisbk_images_2757781015.jpg	158
847	lg_lgh930ds_acisbk_images_2757781223.jpg	158
848	lg_lgh930ds_acisbk_images_2757781327.jpg	158
849	lg_lgh930ds_acisbk_images_2757780911.jpg	158
850	lg_lgh930ds_acisbk_images_2757780807.jpg	158
851	lg_lgh930ds_acisbk_images_2757780703.jpg	158
852	1_4yxbezc.jpg	159
853	2_b78YxE1.jpg	159
854	3_tQ3KisY.jpg	159
855	4_6MfKmC0.jpg	159
856	1_mZdHOfs.jpg	160
857	2_yWlxIgv.jpg	160
858	3_APq6pp1.jpg	160
859	4_Dj6ubCq.jpg	160
860	lg_q6_32gb_black_5.jpg	161
861	lg_q6_32gb_black_8.jpg	161
862	lg_q6_32gb_black_6.jpg	161
863	lg_q6_32gb_black_7.jpg	161
864	1_HxRaFNl.jpg	162
865	2_F8nsjoA.jpg	162
866	4_KHHXEXS.jpg	162
867	3_x2Rrrpy.jpg	162
868	ru-vc18m21d0vg-vc18m21b0s2-ev-rperspectiveblue-63683120_DwDkG4U.jpg	163
869	ru-vc18m21d0vg-vc18m21b0s2-ev-rightblue-63683121.jpg	163
870	ru-vc18m21d0vg-vc18m21b0s2-ev-frontblue-63683149.jpg	163
871	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683127.jpg	163
872	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683126.jpg	163
873	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683125.jpg	163
874	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683124.jpg	163
875	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683123.jpg	163
876	ru-vc18m21d0vg-vc18m21b0s2-ev-dynamicblue-63683122.jpg	163
877	ru-vc18m21d0vg-vc18m21b0s2-ev-dustbinopenblue-63683129.jpg	163
878	ru-vc18m21d0vg-vc18m21b0s2-ev-detaildustbinclosedblue-63683128.jpg	163
879	ru-vc18m21d0vg-vc18m21b0s2-ev-detailblue-63683133.jpg	163
880	ru-vc18m21d0vg-vc18m21b0s2-ev-detailblue-63683132.jpg	163
881	ru-vc18m21d0vg-vc18m21b0s2-ev-detailblue-63683131.jpg	163
882	2_iGssTKA.jpg	164
883	3_OHieokM.jpg	164
884	15_ZDppIpl.jpg	164
885	4_uXLFRMG.jpg	164
886	11_py8W0yE.jpg	164
887	12_2Wk4seq.jpg	164
888	13_wxd4P8G.jpg	164
889	14_5QaS4GR.jpg	164
890	5_Jwrd0ve.jpg	164
891	8_X3Tg5Zw.jpg	164
892	9_fmJt9Oh.jpg	164
893	10_VVFxt0s.jpg	164
894	7_HTkYpZv.jpg	164
895	6_7t1hZkE.jpg	164
896	2.webp	165
897	3.webp	165
898	4.webp	165
899	5.webp	165
900	6.webp	165
901	1_mzrmh0e.jpg	166
902	5_puucPTX.jpg	166
903	3_D5Zj7Do.jpg	166
904	2_spUI0DA.jpg	166
905	4_5kO7c8g.jpg	166
906	1_ydRXbn3.jpg	167
907	2_uRAyUQx.jpg	167
908	3_VE6tVQG.jpg	167
909	5_PBVrnZd.jpg	167
910	4_gug6aHU.jpg	167
842	DSC_0051-770x481.jpg	157
843	DSC_0084.jpg	157
844	DSC_0088.jpg	157
911	2_ilvSH76.jpg	168
912	3_LSeHErg.jpg	168
913	4_UuZ2zwo.jpg	168
914	4_Y4aB4nL.jpg	168
915	5_uomosRv.jpg	168
916	6_fag2Dei.jpg	168
917	7_LCp4Hsj.jpg	168
918	8_UZV3S7w.jpg	168
919	2_1XXoCEM.jpg	169
920	1_Rnkxurh.jpg	169
921	3_Xnqe9y4.jpg	169
922	1_TuafCoZ.jpg	170
923	2_MVCao4M.jpg	170
924	3_hHNnCgP.jpg	170
925	4_EWQ51qu.jpg	170
926	1_vo4AqSK.jpg	171
927	2_8nyDmth.jpg	171
928	3_KSnRVk6.jpg	171
929	4_6NcjIHU.jpg	171
930	5_nylHSZa.jpg	171
931	32M4000_222-650x489.jpg	172
932	32M4000_333-650x489.jpg	172
933	1_uSENTCq.jpg	173
934	2_zyfOeGO.jpg	173
935	3_KQNGeUl.jpg	173
\.


--
-- Name: store_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_productimage_id_seq', 935, true);


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
1743	Android	120	1
1744	1.3 ГГц	120	2
1745	16 ГБ	120	3
1746	3 ГБ	120	4
1747	13 Мп	120	5
1748	5 Мп	120	6
1749	IPS	120	7
1750	5.2 дюйм	120	8
1751	3000 мАч	120	9
1752	143 г	120	10
1753	Бармоқ изи сканери	120	11
1754	148.2х72.5х8.4	120	12
1755	2	120	13
1756	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	120	14
1757	Gold	120	15
1758	Android	121	1
1759	1.0 ГГц + 1.5 ГГц	121	2
1760	16 ГБ	121	3
1761	2 ГБ	121	4
1762	13 Мп	121	5
1763	8 Мп	121	6
1764	IPS	121	7
1765	5.2 дюйм	121	8
1766	3080 мАч	121	9
1767	143 г	121	10
1768	Бармоқ изи сканери	121	11
1769	148.2х72.8х8.3	121	12
1770	2	121	13
1771	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	121	14
1772	Black	121	15
1773	Android	122	1
1774	1.0 ГГц + 1.5 ГГц	122	2
1775	32 ГБ	122	3
1776	3 ГБ	122	4
1777	13 Мп	122	5
1778	8 Мп	122	6
1779	IPS	122	7
1780	5.2 дюйм	122	8
1781	3070 мАч	122	9
1782	143 г	122	10
1783	Бармоқ изи сканери	122	11
1784	148.2 х72.8 х8.3	122	12
1785	2	122	13
1786	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	122	14
1787	Black	122	15
1788	Android	123	1
1789	2.0 Ггц + 1.6 Ггц	123	2
1790	32 ГБ	123	3
1791	3 ГБ	123	4
1792	16 Мп	123	5
1793	8 Мп	123	6
1794	IPS	123	7
1795	5.7 дюйм	123	8
1796	3000 мАч	123	9
1797	160 г	123	10
1798	Бармоқ изи сканери	123	11
1799	152 х72.5х8	123	12
1800	2	123	13
1801	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	123	14
1802	Black	123	15
1803	Android	124	1
1804	2.0 ГГц	124	2
1805	16 ГБ	124	3
1806	3 ГБ	124	4
1807	12 Мп + 5 Мп	124	5
1808	16 Мп	124	6
1809	IPS	124	7
1810	5.5 дюйм	124	8
1811	4000 мАч	124	9
1812	173 г	124	10
1813	Бармоқ изи сканери	124	11
1814	154.6 х 75.2 х 8.35	124	12
1815	2	124	13
1816	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	124	14
1817	Black	124	15
1818	Android	125	1
1819	2.0 ГГц	125	2
1820	32 ГБ	125	3
1821	3 ГБ	125	4
1822	12 Мп + 5 Мп	125	5
1823	16 Мп	125	6
1824	IPS	125	7
1825	5.5 дюйм	125	8
1826	4000 мАч	125	9
1827	173 г	125	10
1828	Бармоқ изи сканери	125	11
1829	154.6 х 75.2 х 8.35	125	12
1830	2	125	13
1831	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	125	14
1832	Black	125	15
1833	Android	126	1
1834	2.0 ГГц	126	2
1835	64 ГБ	126	3
1836	4 ГБ	126	4
1837	12 Мп + 5 Мп	126	5
1838	16 Мп	126	6
1839	IPS	126	7
1840	5.5 дюйм	126	8
1841	4000 мАч	126	9
1842	173 г	126	10
1843	Бармоқ изи сканери	126	11
1844	154.6 х 75.2 х 8.35	126	12
1845	2	126	13
1846	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	126	14
1847	Black	126	15
1848	Android	127	1
1849	2.0 Ггц + 1.6 Ггц	127	2
1850	32 ГБ	127	3
1851	3 ГБ	127	4
1852	16 Мп	127	5
1853	8 Мп	127	6
1854	IPS	127	7
1855	5.7 дюйм	127	8
1856	3000 мАч	127	9
1857	160 г	127	10
1858	Бармоқ изи сканери	127	11
1859	152 х 72,54 х 8,0	127	12
1860	2	127	13
1861	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	127	14
1862	Black	127	15
1863	Android	128	1
1864	2.6 ГГц	128	2
1865	64 ГБ	128	3
1866	4 ГБ	128	4
1867	12 Мп + 12 Мп	128	5
1868	16 Мп	128	6
1869	Super AMOLED	128	7
1870	5.2 дюйм	128	8
1871	3000 мАч	128	9
1872	163 г	128	10
1873	Бармоқ изи сканери	128	11
1874	147.6 x 70.7 x 7.3	128	12
1875	2	128	13
1876	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	128	14
1877	Black	128	15
1878	Android	129	1
1879	2.6 ГГц	129	2
1880	64 ГБ	129	3
1881	4 ГБ	129	4
1882	12 Мп + 12 Мп	129	5
1883	16 Мп	129	6
1884	Super AMOLED	129	7
1885	5.2 дюйм	129	8
1886	3000 мАч	129	9
1887	163 г	129	10
1888	Бармоқ изи сканери	129	11
1889	147.6 x 70.7 x 7.3	129	12
1890	2	129	13
1891	2G (EDGE), 3G (WCDMA/UMTS), 4G (LTE)	129	14
1892	Red	129	15
1893	Андроид	130	1
1894	1.1 ГГц	130	2
1895	8 ГБ	130	3
1896	1 ГБ	130	4
1897	8 МП	130	5
1898	5 МП	130	6
1899	TFT (On-Cell touch)	130	7
1900	5 дюйм	130	8
1901	2500 мАч	130	9
1902	150 г	130	10
1903	Бармоқ изи сканери	130	11
1904	145 x 74 x 8	130	12
1905	2	130	13
1906	2G (GSM) 3G (HSDPA) 4G (LTE)	130	14
1907	Titan	130	15
1908	Андроид	131	1
1909	1.1 ГГц	131	2
1910	8 ГБ	131	3
1911	1 ГБ	131	4
1912	8 МП	131	5
1913	5 МП	131	6
1914	TFT (On-Cell touch)	131	7
1915	5 дюйм	131	8
1916	2500 мАч	131	9
1917	150 г	131	10
1918	Бармоқ изи сканери	131	11
1919	145 x 74 x 8	131	12
1920	2	131	13
1921	2G (GSM) 3G (HSDPA) 4G (LTE)	131	14
1922	Brown	131	15
1923	Андроид	132	1
1924	1,14 ГГц	132	2
1925	16 ГБ	132	3
1926	1.5 ГБ	132	4
1927	13 МП	132	5
1928	5 МП	132	6
1929	In-Cell Touch IPS [2]	132	7
1930	5.3 дюйм	132	8
1931	2300 мАч	132	9
1932	140 г	132	10
1933	146.6 x 74.8 x 8.8	132	12
1934	2	132	13
1935	2G (GSM) 3G (HSDPA) 4G (LTE)	132	14
1936	Black	132	15
1937	Андроид	133	1
1938	1,5 ГГц	133	2
1939	16 ГБ	133	3
1940	2 ГБ	133	4
1941	13 МП	133	5
1942	5 МП	133	6
1943	IPS (In-Cell Touch)	133	7
1944	5.3 дюйм	133	8
1945	2800 мАч	133	9
1946	138 г	133	10
1947	Бармоқ изи сканери	133	11
1948	146.7 x 75.3 x 7.99	133	12
1949	2	133	13
1950	2G (GSM) 3G (HSDPA) 4G (LTE)	133	14
1951	Titan	133	15
1952	Андроид	134	1
1953	1,5 ГГц	134	2
1954	16 ГБ	134	3
1955	2 ГБ	134	4
1956	13 МП	134	5
1957	5 МП	134	6
1958	IPS (In-Cell Touch)	134	7
1959	5.3 дюйм	134	8
1960	2800 мАч	134	9
1961	138 г	134	10
1962	Бармоқ изи сканери	134	11
1963	146.7 x 75.3 x 7.99	134	12
1964	2	134	13
1965	2G (GSM) 3G (HSDPA) 4G (LTE)	134	14
1966	Black	134	15
1967	Андроид	135	1
1968	1.3 ГГц	135	2
1969	16 ГБ	135	3
1970	1.5 ГБ	135	4
1971	13 МП	135	5
1972	5 МП	135	6
1973	IPS (On-Cell Touch)	135	7
1974	5 дюйм	135	8
1975	2500 мАч	135	9
1976	147.8 г	135	10
1977	147.15 x 73.2 x 8.25	135	12
1978	2	135	13
1979	2G (GSM) 3G (HSDPA) 4G (LTE)	135	14
1980	Black	135	15
1981	Андроид	136	1
1982	1.3 ГГц	136	2
1983	16 ГБ	136	3
1984	1.5 ГБ	136	4
1985	13 МП	136	5
1986	5 МП	136	6
1987	IPS (On-Cell Touch)	136	7
1988	5 дюйм	136	8
1989	2500 мАч	136	9
1990	147.8 г	136	10
1991	147.15 x 73.2 x 8.25	136	12
1992	2	136	13
1993	2G (GSM) 3G (HSDPA) 4G (LTE)	136	14
1994	Gold	136	15
1995	VC18M21A0S1/EV	137	16
1996	1800W	137	17
1997	380W	137	18
1998	Cyclone Force with Anti-tangle Turbine	137	19
1999	1.5L	137	20
2000	87dBA	137	21
2001	6m	137	22
2002	9m	137	23
2003	Body Variable (On/Off)	137	24
2004	Micro+Sponge	137	25
2005	EPA 12	137	26
2006	2-Step (NB250)	137	27
2007	-	137	28
2008	2-in-1	137	29
2009	Steel Telescopic	137	30
2010	+	137	31
2011	+	137	32
2012	Pure Burgundy	137	15
2013	W272 x D398 x H243	137	33
2014	4.6kg	137	34
2015	8kg	137	35
2016	VC18M2130SR/EV	138	16
2017	1800W	138	17
2018	380W	138	18
2019	Cycloneforce with Anti-Tangle Turbine	138	19
2020	1.5L	138	20
2021	87dBA	138	21
2022	6m	138	22
2023	9m	138	23
2024	On/Off (NEW HANDLE)	138	24
2025	Micro+Sponge	138	25
2026	EPA 12	138	26
2027	2-Step (NB250)	138	27
2028	Parquet Brush(HB 100)	138	28
2029	2-in-1	138	29
2030	Steel Telescopic	138	30
2031	+	138	31
2032	+	138	32
2033	Vitality Red	138	15
2034	W272 х D398 х H243	138	33
2035	4.6kg	138	34
2036	8kg	138	35
2037	Андроид 8.0	139	1
2038	HUAWEI Kirin 659	139	2
2039	32 ГБ	139	3
2040	3 ГБ	139	4
2041	13 МП + 2 МП	139	5
2042	8 МП	139	6
2043	TFT-LCD	139	7
2044	5.65 дюйм	139	8
2045	3000 мАh	139	9
2046	143 г	139	10
2047	Бармоқ изи сканери	139	11
2048	72.05 x 150.1 x 7.45	139	12
2049	2	139	13
2050	2G, 3G, 4G, LTE	139	14
2051	Black	139	15
2052	Андроид 8.0	140	1
2053	HUAWEI Kirin 659	140	2
2054	32 ГБ	140	3
2055	3 ГБ	140	4
2056	13 МП + 2 МП	140	5
2057	8 МП	140	6
2058	TFT-LCD	140	7
2059	5.65 дюйм	140	8
2060	3000 мАh	140	9
2061	143 г	140	10
2062	Бармоқ изи сканери	140	11
2063	72.05 x 150.1 x 7.45	140	12
2064	2	140	13
2065	2G, 3G, 4G, LTE	140	14
2066	Gold	140	15
2067	Андроид	141	1
2068	HiSilicon Kirin 659	141	2
2069	64 ГБ	141	3
2070	4 ГБ	141	4
2071	16 Мп + 2 Мп	141	5
2072	2 МП	141	6
2073	TFT,  2280 x 1080	141	7
2074	5.84 дюйм	141	8
2075	3000 мАh	141	9
2076	145 г	141	10
2077	Бармоқ изи сканери	141	11
2078	148.6 x 71.2 x 7.4	141	12
2079	2	141	13
2080	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	141	14
2081	Black	141	15
2082	Андроид	142	1
2083	HiSilicon Kirin 659	142	2
2084	64 ГБ	142	3
2085	4 ГБ	142	4
2086	16 Мп + 2 Мп	142	5
2087	2 МП	142	6
2088	TFT,  2280 x 1080	142	7
2089	5.84 дюйм	142	8
2090	3000 мАh	142	9
2091	145 г	142	10
2092	Бармоқ изи сканери	142	11
2093	148.6 x 71.2 x 7.4	142	12
2094	2	142	13
2095	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	142	14
2096	Blue	142	15
2097	Андроид 8.1 Oreo (Emotion UI 8.1)	143	1
2098	Восьмиядерный Kirin 970 + сопроцессор i7	143	2
2099	128 ГБ	143	3
2100	4 ГБ	143	4
2101	32 МП	143	5
2102	24 МП	143	6
2103	IPS LCD,  2244 x 1080	143	7
2104	5.8 дюйм	143	8
2105	3400 мАh	143	9
2106	165 г	143	10
2107	Бармоқ изи сканери	143	11
2108	150 x 72 x 7	143	12
2109	2	143	13
2110	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	143	14
2111	Black	143	15
2112	Андроид	144	1
2113	1,4 ГГц	144	2
2114	16 ГБ	144	3
2115	2 ГБ	144	4
2116	13 Мп	144	5
2117	5 Мп	144	6
2118	IPS (In-Cell Touch)	144	7
2119	5.5 дюйм	144	8
2120	3000 мАч	144	9
2121	149 г	144	10
2122	142.5 x 69.3 x 8.1	144	12
2123	2	144	13
2124	2G (GSM) 3G (HSPA) 4G (LTE)	144	14
2125	Black	144	15
2126	Андроид 8.1 Oreo (Emotion UI 8.1)	145	1
2127	Восьмиядерный Kirin 970 + сопроцессор i7	145	2
2128	128 ГБ	145	3
2129	4 ГБ	145	4
2130	32 МП	145	5
2131	24 МП	145	6
2132	IPS LCD,  2244 x 1080	145	7
2133	5.8 дюйм	145	8
2134	3400 мАh	145	9
2135	165 г	145	10
2136	Бармоқ изи сканери	145	11
2137	150 x 72 x 7	145	12
2138	2	145	13
2139	3G (WCDMA/UMTS) 2G (EDGE) 4G (LTE)	145	14
2140	Blue	145	15
2141	Андроид	146	1
2142	1,4 ГГц	146	2
2143	16 ГБ	146	3
2144	Андроид 7.0 (Nougat)	147	1
2145	Octa-core 1.5 GHz Cortex-A53	147	2
2146	16 ГБ	147	3
2147	2 ГБ	147	4
2148	12 МП	147	5
2149	5 МП	147	6
2150	IPS LCD, 720 x 1280	147	7
2151	5 дюйм	147	8
2152	3020 мАh	147	9
2153	143 г	147	10
2154	Бармоқ изи сканери	147	11
2155	143.7 x 71 x 8.2	147	12
2156	2	147	13
2157	2G (GSM) 3G (HSDPA) 4G (LTE)	147	14
2158	Black	147	15
2159	2 ГБ	146	4
2160	13 Мп	146	5
2161	5 Мп	146	6
2162	IPS (In-Cell Touch)	146	7
2163	5.5 дюйм	146	8
2164	3000 мАч	146	9
2165	149 г	146	10
2166	142.5 x 69.3 x 8.1	146	12
2167	2	146	13
2168	2G (GSM) 3G (HSPA) 4G (LTE)	146	14
2169	Gold	146	15
2170	Андроид 6.0	148	1
2171	HiSilicon Kirin 650	148	2
2172	16 ГБ	148	3
2173	2 ГБ	148	4
2174	12 МП	148	5
2175	8 МП	148	6
2176	IPS LCD, 1920 x 1080	148	7
2177	5.2 дюйм	148	8
2178	3000 мАh	148	9
2179	156 г	148	10
2180	Бармоқ изи сканери	148	11
2181	147.1 x 73.76 x 8.3	148	12
2182	2	148	13
2183	2G (GSM) 3G (HSDPA) 4G (LTE)	148	14
2184	White	148	15
2185	Андроид 7.1	149	1
2186	Hisilicon Kirin 655	149	2
2187	16 ГБ	149	3
2188	3 ГБ	149	4
2189	12 МП	149	5
2190	8 МП	149	6
2191	IPS LCD, 1920 x 1080	149	7
2192	5.2 дюйм	149	8
2193	3000 мАh	149	9
2194	147 г	149	10
2195	Бармоқ изи сканери	149	11
2196	147.2 x 72.9 x 7.6	149	12
2197	2	149	13
2198	2G (GSM) 3G (HSDPA) 4G (LTE)	149	14
2199	Black	149	15
2200	Андроид 7.1	150	1
2201	Hisilicon Kirin 655	150	2
2202	16 ГБ	150	3
2203	3 ГБ	150	4
2204	12 МП	150	5
2205	8 МП	150	6
2206	IPS LCD, 1920 x 1080	150	7
2207	5.2 дюйм	150	8
2208	3000 мАh	150	9
2209	147 г	150	10
2210	Бармоқ изи сканери	150	11
2211	147.2 x 72.9 x 7.6	150	12
2212	2	150	13
2213	2G (GSM) 3G (HSDPA) 4G (LTE)	150	14
2214	Gold	150	15
2215	Андроид 6.0	151	1
2216	HiSilicon Kirin 620	151	2
2217	16 ГБ	151	3
2218	3 ГБ	151	4
2219	13 МП	151	5
2220	5 МП	151	6
2221	IPS	151	7
2222	5 дюйм	151	8
2223	2200 мАh	151	9
2224	131 г	151	10
2225	143 x 70.60 x 7.70	151	12
2226	2	151	13
2227	2G (GSM) 3G (HSDPA) 4G (LTE)	151	14
2228	Black	151	15
2229	Андроид	152	1
2230	1,5 ГГц	152	2
2231	16 ГБ	152	3
2232	2 ГБ	152	4
2233	13 Мп	152	5
2234	5 Мп	152	6
2235	IPS (In-Cell Touch)	152	7
2236	5.5 дюйм	152	8
2237	4500 мАч	152	9
2238	164 г	152	10
2239	154.7 x 78.1 x 8.4	152	12
2240	2	152	13
2241	2G (GSM) 3G (HSPA) 4G (LTE)	152	14
2242	Black	152	15
2243	Андроид 6.0	153	1
2244	HiSilicon Kirin 620	153	2
2245	16 ГБ	153	3
2246	3 ГБ	153	4
2247	13 МП	153	5
2248	5 МП	153	6
2249	IPS	153	7
2250	5 дюйм	153	8
2251	2200 мАh	153	9
2252	131 г	153	10
2253	143 x 70.60 x 7.70	153	12
2254	2	153	13
2255	2G (GSM) 3G (HSDPA) 4G (LTE)	153	14
2256	Gold	153	15
2257	Андроид	154	1
2258	1,5 ГГц	154	2
2259	16 ГБ	154	3
2260	2 ГБ	154	4
2261	13 Мп	154	5
2262	5 Мп	154	6
2263	IPS (In-Cell Touch)	154	7
2264	5.5 дюйм	154	8
2265	4500 мАч	154	9
2266	164 г	154	10
2267	154.7 x 78.1 x 8.4	154	12
2268	2	154	13
2269	2G (GSM) 3G (HSPA) 4G (LTE)	154	14
2270	Gold	154	15
2271	Андроид 6.0	155	1
2272	HiSilicon Kirin 620	155	2
2273	16 ГБ	155	3
2274	3 ГБ	155	4
2275	13 МП	155	5
2276	5 МП	155	6
2277	IPS	155	7
2278	5 дюйм	155	8
2279	2200 мАh	155	9
2280	131 г	155	10
2281	143 x 70.60 x 7.70	155	12
2282	2	155	13
2283	2G (GSM) 3G (HSDPA) 4G (LTE)	155	14
2284	White	155	15
2285	Андроид 6.0 (Marshmallow)	156	1
2286	Mediatek MT6737М	156	2
2287	8 ГБ	156	3
2288	1 ГБ	156	4
2289	8 МП	156	5
2290	2 МП	156	6
2291	IPS LCD capacitive touchscreen	156	7
2292	5 дюйм	156	8
2293	2200 мАh	156	9
2294	175 г	156	10
2295	145.1 x 73.7 x 9.5	156	12
2296	2	156	13
2297	2G (GSM) 3G (HSDPA) 4G (LTE)	156	14
2298	Gold	156	15
2299	Андроид OS, v5.1 (Lollipop)	157	1
2300	Mediatek MT6735P	157	2
2301	8/16 ГБ	157	3
2302	1/2 ГБ	157	4
2303	8 МП	157	5
2304	2 МП	157	6
2305	IPS LCD	157	7
2306	5 дюйм	157	8
2307	2200 мАh	157	9
2308	135 г	157	10
2309	143.8 x 72 x 8.9	157	12
2310	2	157	13
2311	2G (GSM) 3G (HSDPA) 4G (LTE)	157	14
2312	Gold	157	15
2313	Андроид	158	1
2314	2.45 ГГц	158	2
2315	128 ГБ	158	3
2316	4 ГБ	158	4
2317	16 Мп	158	5
2318	5 Мп	158	6
2319	POLED (On-Cell touch)	158	7
2320	6 дюйм	158	8
2321	3300 мАч	158	9
2322	158 г	158	10
2323	Бармоқ изи сканери	158	11
2324	151.7 × 75.4 × 7.39	158	12
2325	2	158	13
2326	2G (GSM) 3G (HSPA) 4G (LTE)	158	14
2327	Black	158	15
2328	Андроид OS, v5.1 (Lollipop)	159	1
2329	Mediatek MT6735P	159	2
2330	8/16 ГБ	159	3
2331	1/2 ГБ	159	4
2332	8 МП	159	5
2333	2 МП	159	6
2334	IPS LCD	159	7
2335	5 дюйм	159	8
2336	2200 мАh	159	9
2337	135 г	159	10
2338	143.8 x 72 x 8.9	159	12
2339	2	159	13
2340	2G (GSM) 3G (HSDPA) 4G (LTE)	159	14
2341	Black	159	15
2342	Андроид 6.x+	160	1
2343	MediaTek MT8127	160	2
2344	8 ГБ	160	3
2345	1 ГБ	160	4
2346	2 МП	160	5
2347	2 МП	160	6
2348	IPS	160	7
2349	7 дюйм	160	8
2350	3100 мАh	160	9
2351	250 г	160	10
2352	179 x 103.68 x 8.6	160	12
2353	2	160	13
2354	2G (GSM) 3G (HSDPA) 4G (LTE)	160	14
2355	Black	160	15
2356	Андроид	161	1
2357	1,4 ГГц	161	2
2358	32 ГБ	161	3
2359	3 ГБ	161	4
2360	13 Мп	161	5
2361	5 Мп	161	6
2362	IPS (In-Cell Touch)	161	7
2363	5.5 дюйм	161	8
2364	3000 мАч	161	9
2365	149 г	161	10
2366	142.5 x 69.3 x 8.1	161	12
2367	2	161	13
2368	2G (GSM) 3G (HSPA) 4G (LTE)	161	14
2369	Black	161	15
2370	Андроид 7.0 Nougat с прошивкой EMUI 5.1	162	1
2371	Qualcomm Snapdragon 425	162	2
2372	16 ГБ	162	3
2373	2 ГБ	162	4
2374	5 МП	162	5
2375	2 МП	162	6
2376	IPS	162	7
2377	10 дюйм	162	8
2378	4800 мАh	162	9
2379	460 г	162	10
2380	229,8х159,8х7,95	162	12
2381	2	162	13
2382	GSM, UMTS, LTE	162	14
2383	Black	162	15
2384	VC18M21B0S2/EV	163	16
2385	1800W	163	17
2386	380W	163	18
2387	Cycloneforce with Anti-Tangle Turbine	163	19
2388	1.5L	163	20
2389	87dBA	163	21
2390	6m	163	22
2391	9m	163	23
2392	Body Variable (On/Off)	163	24
2393	Micro+Sponge	163	25
2394	EPA 12	163	26
2395	2-Step (NB250)	163	27
2396	Parquet Brush(HB 100)	163	28
2397	2-in-1	163	29
2398	Steel Telescopic	163	30
2399	+	163	31
2400	+	163	32
2401	Blue Cosmo	163	15
2402	4.6kg	163	34
2403	8.2kg	163	35
2404	W272 x D398 x H243	163	33
2405	VC18M21A0SB/EV	164	16
2406	1800W	164	17
2407	380W	164	18
2408	Cyclone Force with Anti-tangle Turbine	164	19
2409	1.5L	164	20
2410	87dBA	164	21
2411	6m	164	22
2412	9m	164	23
2413	Body Variable (On/Off)	164	24
2414	Micro+Sponge	164	25
2415	EPA 12	164	26
2416	2-Step (NB250)	164	27
2417	-	164	28
2418	2-in-1	164	29
2419	Steel Telescopic	164	30
2420	+	164	31
2421	+	164	32
2422	Vitality Blue	164	15
2423	W272 x D398 x H243	164	33
2424	4.6kg	164	34
2425	8kg	164	35
2426	ME81ARW-K/BW	166	16
2427	Ўзбекистон	166	37
2428	Оқ	166	15
2429	Оддий (соло)	166	38
2430	Механик	166	24
2431	27.5 х 48.9 х 36.4 см	166	12
2432	11.5 кг	166	10
2433	23 л	166	39
2434	Биокерамик эмаль	166	40
2435	800 Вт	166	41
2436	1150 Вт	166	17
2437	1 йил	166	42
2438	ME83ARW-K/BW	167	16
2439	Ўзбекистон	167	37
2440	Оқ	167	15
2441	Оддий (соло)	167	38
2442	Электрон	167	24
2443	49 х 27 х 36 см	167	12
2444	11.5 кг	167	10
2445	23 л	167	39
2446	Биокерамик эмаль	167	40
2447	800 Вт	167	41
2448	1150 Вт	167	17
2449	1 йил	167	42
2450	Болалардан ҳимоя, товушли сигнал, таймер	167	11
2451	Таймер	166	11
2452	Android 8.1 Oreo	168	1
2453	Helio A22	168	2
2454	16 Гб	168	3
2455	2 Гб	168	4
2456	13 Мп	168	5
2457	5 Мп	168	6
2458	5.45	168	8
2459	3000 mAh	168	9
2460	black	168	15
2461	GE81ARW-K/BW	169	16
2462	Ўзбекистон	169	37
2463	Оқ	169	15
2464	Оддий (соло)	169	38
2465	Механик	169	24
2466	49 х 27 х 36 см	169	12
2467	12.5 кг	169	10
2468	23 л	169	39
2469	Биокерамик эмаль	169	40
2470	Болалардан ҳимоя, товушли сигнал, таймер, грил	169	11
2471	800 Вт	169	41
2472	1 йил	169	42
2473	GE83ARW-K/BW	170	16
2474	Ўзбекистон	170	37
2475	Оқ	170	15
2476	Оддий (соло)	170	38
2477	Электрон	170	24
2478	27 х 49 х 36 см	170	12
2479	12 кг	170	10
2480	23 л	170	39
2481	Эмаль	170	40
2482	Болалардан ҳимоя, Товушли сигнал, Таймер, Грил	170	11
2483	800 Вт	170	41
2484	1100 Вт	170	44
2485	2200 Вт	170	17
2486	ME81KRW-1K BW	171	16
2487	Ўзбекистон	171	37
2488	Оқ	171	15
2489	Оддий (соло)	171	38
2490	Механик	171	24
2491	49 х 27 х 36 см	171	12
2492	11.5 кг	171	10
2493	23 л	171	39
2494	Биокерамик эмаль	171	40
2495	Таймер	171	11
2496	800 Вт	171	41
2497	1150 Вт	171	17
2498	1 йил	171	42
2499	32" (81 см)	172	45
2500	16:09	172	46
2501	1366x768	172	47
2502	720p HD	172	48
2503	мавжуд, Edge LED	172	49
2504	мавжуд	172	50
2505	60Гц	172	51
2506	PAL, SECAM, NTSC	172	52
2507	DVB-C MPEG4	172	53
2508	DVB-C MPEG4	172	54
2509	мавжуд	172	55
2510	480i, 480p, 576i, 576p, 720p, 1080i, 1080p	172	56
2511	640x480 800x600 1024x768 1360x768	172	57
2512	20 Вт (2x10 Вт)	172	58
2513	икки динамик	172	59
2514	мавжуд	172	60
2515	мавжуд	172	61
2516	MP3, WMA, MPEG4, MKV, JPEG	172	62
2517	SCART, HDMI x2, USB	172	63
2518	Оптик	172	64
2519	мавжуд	172	65
2520	Мавжуд, CI+ ни қўллаб-қувватлайди	172	66
2521	2	172	67
2522	мавжуд	172	68
2523	мавжуд	172	69
2524	745x466x151 мм	172	70
2525	745x442x69 мм	172	12
2526	4.1 кг	172	71
2527	4 кг	172	10
2528	қора	172	15
2529	ME83KRS-1K BW	173	16
2530	Ўзбекистон	173	37
2531	Кумушранг	173	15
2532	Оддий (соло)	173	38
2533	Электрон	173	24
2534	28 х 49 х 36 см	173	12
2535	11 кг	173	10
2536	23 л	173	39
2537	Биокерамик эмаль	173	40
2538	Болалардан ҳимоя, товушли сигнал, таймер, соат,  дисплей	173	11
2539	800 Вт	173	41
2540	1150 Вт	173	17
2541	1 йил	173	42
\.


--
-- Name: store_specification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_specification_id_seq', 2541, true);


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
17	Истеъмол қуввати
18	Шланг қуввати
19	Айланиш тури
20	Сиғими
21	Шовқин даражаси
22	Шнур узунлиги
23	Ҳаракат радиуси
24	Бошқарув
25	Pre-Motor фильтри
26	Чиқариш фильтри
27	Асосий чўткаси
28	Қўшимча чўткаси
29	Аксесуарлар
30	Труба
31	Шнурнинг автоматик қайтиши
32	Фильтр назорати
34	Соф оғирлиги
35	Умумий оғирлиги
33	Ўлчами
16	Модел
37	Ишлаб чиқарилган давлат
38	Тип
39	Камера хажми
40	Камера ички қопламаси
41	Қуввати
42	Кафолат мухлати
44	Грил қуввати
45	Экран диагонали
46	Экран формати
47	Рухсат этилган ўлчамлари
48	HD қўллаши
49	Светодиодли (LED) ёритиш
50	Стереозвук
51	Янгиланиш частотаси
52	Телевизион стандартларни қўллаш
53	DVB-T ни қўллаб-қувватлаш
54	DVB-C ни қўллаб-қувватлаш
55	Телетекст
56	Кирувчи сигналларни қўллаб-қувватлаш форматлари
57	Компьютерга улашда қўллаб-қувватланадиган ўлчамлар
58	Товуш баландлиги
59	Акустик тизим
60	Dolby Digital декодери
61	Қуршалган товуш
62	Қўллаб-қувватланадиган форматлар
63	Кириш портлари
64	Чиқиш портлари
65	Наушник учун разъем
66	CI учун жой (кенгайтиргич)
67	Мустақил TV-тюнерлар сони
68	Кутиш таймери
69	Деворга ўрнатиш имконияти
70	Таглик билан бирга ўлчамлари (ШxВxГ)
71	Таглик билан вазни
\.


--
-- Name: store_specificationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bozorcom
--

SELECT pg_catalog.setval('public.store_specificationtype_id_seq', 71, true);


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
-- Name: store_cartitem store_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_pkey PRIMARY KEY (id);


--
-- Name: store_order store_order_pkey; Type: CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_pkey PRIMARY KEY (id);


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
-- Name: store_cartitem_order_id_ee1448c2; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_cartitem_order_id_ee1448c2 ON public.store_cartitem USING btree (order_id);


--
-- Name: store_cartitem_product_id_4238d443; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_cartitem_product_id_4238d443 ON public.store_cartitem USING btree (product_id);


--
-- Name: store_order_customer_id_13d6d43e; Type: INDEX; Schema: public; Owner: bozorcom
--

CREATE INDEX store_order_customer_id_13d6d43e ON public.store_order USING btree (customer_id);


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
-- Name: store_cartitem store_cartitem_order_id_ee1448c2_fk_store_order_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_order_id_ee1448c2_fk_store_order_id FOREIGN KEY (order_id) REFERENCES public.store_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_cartitem store_cartitem_product_id_4238d443_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_cartitem
    ADD CONSTRAINT store_cartitem_product_id_4238d443_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_order store_order_customer_id_13d6d43e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bozorcom
--

ALTER TABLE ONLY public.store_order
    ADD CONSTRAINT store_order_customer_id_13d6d43e_fk_auth_user_id FOREIGN KEY (customer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

