--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: admin_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_info (
    admin_id integer NOT NULL,
    admin_name character varying(100),
    email character varying(100),
    phone_no character varying(20),
    signature_exist boolean DEFAULT false,
    signature_image bytea,
    school_id integer
);


ALTER TABLE public.admin_info OWNER TO postgres;

--
-- Name: admin_info_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_info_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_info_admin_id_seq OWNER TO postgres;

--
-- Name: admin_info_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_info_admin_id_seq OWNED BY public.admin_info.admin_id;


--
-- Name: all_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.all_topics (
    topic_id integer NOT NULL,
    subject character varying(255),
    unit integer,
    chapter integer,
    topic integer
);


ALTER TABLE public.all_topics OWNER TO postgres;

--
-- Name: all_topics_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.all_topics_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.all_topics_topic_id_seq OWNER TO postgres;

--
-- Name: all_topics_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.all_topics_topic_id_seq OWNED BY public.all_topics.topic_id;


--
-- Name: certificate_registry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificate_registry (
    certificate_id integer NOT NULL,
    student_id integer,
    course_enrollment_id integer,
    certificate_status character varying(255),
    certificate_renewal_date date
);


ALTER TABLE public.certificate_registry OWNER TO postgres;

--
-- Name: certificate_registry_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certificate_registry_certificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificate_registry_certificate_id_seq OWNER TO postgres;

--
-- Name: certificate_registry_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certificate_registry_certificate_id_seq OWNED BY public.certificate_registry.certificate_id;


--
-- Name: chapter_badge_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapter_badge_tracking (
    unit_badge_id integer NOT NULL,
    student_id integer,
    subject character varying(50),
    unit integer,
    chapter integer,
    test_type character varying(50),
    badge_number integer,
    badge_date date
);


ALTER TABLE public.chapter_badge_tracking OWNER TO postgres;

--
-- Name: unit_badge_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit_badge_tracking (
    chapter_badge_id integer NOT NULL,
    student_id integer,
    subject character varying(50),
    unit integer,
    test_type character varying(50),
    badge_number integer,
    badge_date date
);


ALTER TABLE public.unit_badge_tracking OWNER TO postgres;

--
-- Name: chapter_badge_tracking_chapter_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapter_badge_tracking_chapter_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapter_badge_tracking_chapter_badge_id_seq OWNER TO postgres;

--
-- Name: chapter_badge_tracking_chapter_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapter_badge_tracking_chapter_badge_id_seq OWNED BY public.unit_badge_tracking.chapter_badge_id;


--
-- Name: course_registry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_registry (
    course_id integer NOT NULL,
    course_name character varying(255),
    course_tags character varying(255),
    course_details character varying(255),
    course_description text,
    course_price numeric(10,2),
    trainer_id integer
);


ALTER TABLE public.course_registry OWNER TO postgres;

--
-- Name: course_registry_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_registry_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_registry_course_id_seq OWNER TO postgres;

--
-- Name: course_registry_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_registry_course_id_seq OWNED BY public.course_registry.course_id;


--
-- Name: course_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_tracking (
    tracking_id integer NOT NULL,
    student_id integer,
    course_id integer,
    course_enrollment_id integer,
    test_result character varying(255),
    date_of_test_taken date,
    course_progress character varying(255),
    test_grade character varying(255)
);


ALTER TABLE public.course_tracking OWNER TO postgres;

--
-- Name: course_tracking_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_tracking_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_tracking_tracking_id_seq OWNER TO postgres;

--
-- Name: course_tracking_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_tracking_tracking_id_seq OWNED BY public.course_tracking.tracking_id;


--
-- Name: dsp_tracking_today; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dsp_tracking_today (
    tracking_id integer NOT NULL,
    student_id integer,
    maths integer,
    science integer,
    history integer,
    date date,
    percentage double precision DEFAULT 0,
    maths_percentage double precision DEFAULT 0,
    science_percentage double precision DEFAULT 0,
    history_percentage double precision DEFAULT 0,
    login_time_track timestamp without time zone
);


ALTER TABLE public.dsp_tracking_today OWNER TO postgres;

--
-- Name: dsp_tracking_today_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dsp_tracking_today_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dsp_tracking_today_tracking_id_seq OWNER TO postgres;

--
-- Name: dsp_tracking_today_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dsp_tracking_today_tracking_id_seq OWNED BY public.dsp_tracking_today.tracking_id;


--
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    student_id integer NOT NULL,
    student_id_fr integer NOT NULL
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- Name: grade_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade_tracking (
    student_id integer,
    topic_id integer,
    grade_tracking_id integer NOT NULL,
    test_type character varying(255),
    grade character varying(255),
    exam_taking_date date,
    subject character varying,
    time_taken integer
);


ALTER TABLE public.grade_tracking OWNER TO postgres;

--
-- Name: grade_tracking_grade_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_tracking_grade_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grade_tracking_grade_tracking_id_seq OWNER TO postgres;

--
-- Name: grade_tracking_grade_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_tracking_grade_tracking_id_seq OWNED BY public.grade_tracking.grade_tracking_id;


--
-- Name: school_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school_info (
    school_id integer NOT NULL,
    country character varying(100),
    state character varying(100),
    districts character varying(100),
    name character varying(200)
);


ALTER TABLE public.school_info OWNER TO postgres;

--
-- Name: school_info_school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.school_info_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.school_info_school_id_seq OWNER TO postgres;

--
-- Name: school_info_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.school_info_school_id_seq OWNED BY public.school_info.school_id;


--
-- Name: student_course_enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_course_enrollment (
    course_enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    course_start_date date,
    course_end_date date,
    course_status character varying(255)
);


ALTER TABLE public.student_course_enrollment OWNER TO postgres;

--
-- Name: student_course_enrollment_course_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_course_enrollment_course_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_course_enrollment_course_enrollment_id_seq OWNER TO postgres;

--
-- Name: student_course_enrollment_course_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_course_enrollment_course_enrollment_id_seq OWNED BY public.student_course_enrollment.course_enrollment_id;


--
-- Name: student_education_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_education_info (
    student_edu_id integer NOT NULL,
    student_id integer,
    ed_qualification character varying(255),
    college_name character varying(255),
    specialization character varying(255)
);


ALTER TABLE public.student_education_info OWNER TO postgres;

--
-- Name: student_education_info_student_edu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_education_info_student_edu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_education_info_student_edu_id_seq OWNER TO postgres;

--
-- Name: student_education_info_student_edu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_education_info_student_edu_id_seq OWNED BY public.student_education_info.student_edu_id;


--
-- Name: student_exam_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_exam_table (
    score_id integer NOT NULL,
    student_id integer,
    test_type character varying(255),
    subject_name character varying(255),
    exam_score double precision
);


ALTER TABLE public.student_exam_table OWNER TO postgres;

--
-- Name: student_exam_table_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_exam_table_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_exam_table_score_id_seq OWNER TO postgres;

--
-- Name: student_exam_table_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_exam_table_score_id_seq OWNED BY public.student_exam_table.score_id;


--
-- Name: student_personal_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_personal_info (
    student_id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    dob date,
    gender character varying(255),
    phone_no character varying(255),
    email character varying(255),
    address character varying(255),
    date_of_registration date,
    date_of_recent_login date,
    seq_time integer,
    grade integer,
    section integer,
    school_id integer
);


ALTER TABLE public.student_personal_info OWNER TO postgres;

--
-- Name: student_personal_info_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_personal_info_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_personal_info_student_id_seq OWNER TO postgres;

--
-- Name: student_personal_info_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_personal_info_student_id_seq OWNED BY public.student_personal_info.student_id;


--
-- Name: student_time_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_time_track (
    time_track_id integer NOT NULL,
    student_id integer NOT NULL,
    date date NOT NULL,
    time_spend interval NOT NULL
);


ALTER TABLE public.student_time_track OWNER TO postgres;

--
-- Name: student_time_track_time_track_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_time_track_time_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_time_track_time_track_id_seq OWNER TO postgres;

--
-- Name: student_time_track_time_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_time_track_time_track_id_seq OWNED BY public.student_time_track.time_track_id;


--
-- Name: subject_badge_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject_badge_tracking (
    subject_badge_id integer NOT NULL,
    student_id integer,
    subject character varying(50),
    test_type character varying(50),
    badge_number integer,
    badge_date date
);


ALTER TABLE public.subject_badge_tracking OWNER TO postgres;

--
-- Name: subject_badge_tracking_subject_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_badge_tracking_subject_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_badge_tracking_subject_badge_id_seq OWNER TO postgres;

--
-- Name: subject_badge_tracking_subject_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_badge_tracking_subject_badge_id_seq OWNED BY public.subject_badge_tracking.subject_badge_id;


--
-- Name: super_admin_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_admin_info (
    admin_id integer NOT NULL,
    admin_name character varying(100),
    email character varying(100),
    phone_no character varying(20),
    signature_exist boolean DEFAULT false,
    signature_image bytea
);


ALTER TABLE public.super_admin_info OWNER TO postgres;

--
-- Name: super_admin_info_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_admin_info_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_admin_info_admin_id_seq OWNER TO postgres;

--
-- Name: super_admin_info_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_admin_info_admin_id_seq OWNED BY public.super_admin_info.admin_id;


--
-- Name: topic_badge_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topic_badge_tracking (
    topic_badge_id integer NOT NULL,
    student_id integer,
    subject character varying(50),
    unit integer,
    chapter integer,
    topic integer,
    test_type character varying(50),
    badge_number integer,
    badge_date date
);


ALTER TABLE public.topic_badge_tracking OWNER TO postgres;

--
-- Name: topic_badge_tracking_topic_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topic_badge_tracking_topic_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topic_badge_tracking_topic_badge_id_seq OWNER TO postgres;

--
-- Name: topic_badge_tracking_topic_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topic_badge_tracking_topic_badge_id_seq OWNED BY public.topic_badge_tracking.topic_badge_id;


--
-- Name: trainer_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainer_info (
    trainer_id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    dob date,
    gender character varying(255),
    phone_no character varying(255),
    email character varying(255),
    address character varying(255),
    date_of_registration date,
    date_of_recent_login date,
    signature_exist boolean DEFAULT false,
    signature_image bytea
);


ALTER TABLE public.trainer_info OWNER TO postgres;

--
-- Name: trainer_info_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trainer_info_trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trainer_info_trainer_id_seq OWNER TO postgres;

--
-- Name: trainer_info_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trainer_info_trainer_id_seq OWNED BY public.trainer_info.trainer_id;


--
-- Name: unit_badge_tracking_unit_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_badge_tracking_unit_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_badge_tracking_unit_badge_id_seq OWNER TO postgres;

--
-- Name: unit_badge_tracking_unit_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_badge_tracking_unit_badge_id_seq OWNED BY public.chapter_badge_tracking.unit_badge_id;


--
-- Name: admin_info admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_info ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_info_admin_id_seq'::regclass);


--
-- Name: all_topics topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.all_topics ALTER COLUMN topic_id SET DEFAULT nextval('public.all_topics_topic_id_seq'::regclass);


--
-- Name: certificate_registry certificate_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate_registry ALTER COLUMN certificate_id SET DEFAULT nextval('public.certificate_registry_certificate_id_seq'::regclass);


--
-- Name: chapter_badge_tracking unit_badge_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapter_badge_tracking ALTER COLUMN unit_badge_id SET DEFAULT nextval('public.unit_badge_tracking_unit_badge_id_seq'::regclass);


--
-- Name: course_registry course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_registry ALTER COLUMN course_id SET DEFAULT nextval('public.course_registry_course_id_seq'::regclass);


--
-- Name: course_tracking tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_tracking ALTER COLUMN tracking_id SET DEFAULT nextval('public.course_tracking_tracking_id_seq'::regclass);


--
-- Name: dsp_tracking_today tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsp_tracking_today ALTER COLUMN tracking_id SET DEFAULT nextval('public.dsp_tracking_today_tracking_id_seq'::regclass);


--
-- Name: grade_tracking grade_tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_tracking ALTER COLUMN grade_tracking_id SET DEFAULT nextval('public.grade_tracking_grade_tracking_id_seq'::regclass);


--
-- Name: school_info school_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_info ALTER COLUMN school_id SET DEFAULT nextval('public.school_info_school_id_seq'::regclass);


--
-- Name: student_course_enrollment course_enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollment ALTER COLUMN course_enrollment_id SET DEFAULT nextval('public.student_course_enrollment_course_enrollment_id_seq'::regclass);


--
-- Name: student_education_info student_edu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_education_info ALTER COLUMN student_edu_id SET DEFAULT nextval('public.student_education_info_student_edu_id_seq'::regclass);


--
-- Name: student_exam_table score_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exam_table ALTER COLUMN score_id SET DEFAULT nextval('public.student_exam_table_score_id_seq'::regclass);


--
-- Name: student_personal_info student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_personal_info ALTER COLUMN student_id SET DEFAULT nextval('public.student_personal_info_student_id_seq'::regclass);


--
-- Name: student_time_track time_track_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_time_track ALTER COLUMN time_track_id SET DEFAULT nextval('public.student_time_track_time_track_id_seq'::regclass);


--
-- Name: subject_badge_tracking subject_badge_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_badge_tracking ALTER COLUMN subject_badge_id SET DEFAULT nextval('public.subject_badge_tracking_subject_badge_id_seq'::regclass);


--
-- Name: super_admin_info admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_admin_info ALTER COLUMN admin_id SET DEFAULT nextval('public.super_admin_info_admin_id_seq'::regclass);


--
-- Name: topic_badge_tracking topic_badge_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic_badge_tracking ALTER COLUMN topic_badge_id SET DEFAULT nextval('public.topic_badge_tracking_topic_badge_id_seq'::regclass);


--
-- Name: trainer_info trainer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer_info ALTER COLUMN trainer_id SET DEFAULT nextval('public.trainer_info_trainer_id_seq'::regclass);


--
-- Name: unit_badge_tracking chapter_badge_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_badge_tracking ALTER COLUMN chapter_badge_id SET DEFAULT nextval('public.chapter_badge_tracking_chapter_badge_id_seq'::regclass);


--
-- Name: admin_info admin_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_info
    ADD CONSTRAINT admin_info_pkey PRIMARY KEY (admin_id);


--
-- Name: all_topics all_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.all_topics
    ADD CONSTRAINT all_topics_pkey PRIMARY KEY (topic_id);


--
-- Name: certificate_registry certificate_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate_registry
    ADD CONSTRAINT certificate_registry_pkey PRIMARY KEY (certificate_id);


--
-- Name: unit_badge_tracking chapter_badge_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_badge_tracking
    ADD CONSTRAINT chapter_badge_tracking_pkey PRIMARY KEY (chapter_badge_id);


--
-- Name: course_registry course_registry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_registry
    ADD CONSTRAINT course_registry_pkey PRIMARY KEY (course_id);


--
-- Name: course_tracking course_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_tracking
    ADD CONSTRAINT course_tracking_pkey PRIMARY KEY (tracking_id);


--
-- Name: dsp_tracking_today dsp_tracking_today_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsp_tracking_today
    ADD CONSTRAINT dsp_tracking_today_pkey PRIMARY KEY (tracking_id);


--
-- Name: grade_tracking grade_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_tracking
    ADD CONSTRAINT grade_tracking_pkey PRIMARY KEY (grade_tracking_id);


--
-- Name: friends pk_friends; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT pk_friends PRIMARY KEY (student_id, student_id_fr);


--
-- Name: school_info school_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_info
    ADD CONSTRAINT school_info_pkey PRIMARY KEY (school_id);


--
-- Name: student_course_enrollment student_course_enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollment
    ADD CONSTRAINT student_course_enrollment_pkey PRIMARY KEY (course_enrollment_id);


--
-- Name: student_education_info student_education_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_education_info
    ADD CONSTRAINT student_education_info_pkey PRIMARY KEY (student_edu_id);


--
-- Name: student_exam_table student_exam_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exam_table
    ADD CONSTRAINT student_exam_table_pkey PRIMARY KEY (score_id);


--
-- Name: student_personal_info student_personal_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_personal_info
    ADD CONSTRAINT student_personal_info_pkey PRIMARY KEY (student_id);


--
-- Name: student_time_track student_time_track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_time_track
    ADD CONSTRAINT student_time_track_pkey PRIMARY KEY (time_track_id);


--
-- Name: subject_badge_tracking subject_badge_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_badge_tracking
    ADD CONSTRAINT subject_badge_tracking_pkey PRIMARY KEY (subject_badge_id);


--
-- Name: super_admin_info super_admin_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_admin_info
    ADD CONSTRAINT super_admin_info_pkey PRIMARY KEY (admin_id);


--
-- Name: topic_badge_tracking topic_badge_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic_badge_tracking
    ADD CONSTRAINT topic_badge_tracking_pkey PRIMARY KEY (topic_badge_id);


--
-- Name: trainer_info trainer_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer_info
    ADD CONSTRAINT trainer_info_pkey PRIMARY KEY (trainer_id);


--
-- Name: chapter_badge_tracking unit_badge_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapter_badge_tracking
    ADD CONSTRAINT unit_badge_tracking_pkey PRIMARY KEY (unit_badge_id);


--
-- Name: certificate_registry certificate_registry_course_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate_registry
    ADD CONSTRAINT certificate_registry_course_enrollment_id_fkey FOREIGN KEY (course_enrollment_id) REFERENCES public.student_course_enrollment(course_enrollment_id);


--
-- Name: certificate_registry certificate_registry_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate_registry
    ADD CONSTRAINT certificate_registry_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: unit_badge_tracking chapter_badge_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_badge_tracking
    ADD CONSTRAINT chapter_badge_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: course_registry course_registry_trainer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_registry
    ADD CONSTRAINT course_registry_trainer_id_fkey FOREIGN KEY (trainer_id) REFERENCES public.trainer_info(trainer_id);


--
-- Name: course_tracking course_tracking_course_enrollment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_tracking
    ADD CONSTRAINT course_tracking_course_enrollment_id_fkey FOREIGN KEY (course_enrollment_id) REFERENCES public.student_course_enrollment(course_enrollment_id);


--
-- Name: course_tracking course_tracking_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_tracking
    ADD CONSTRAINT course_tracking_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course_registry(course_id);


--
-- Name: course_tracking course_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_tracking
    ADD CONSTRAINT course_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: dsp_tracking_today dsp_tracking_today_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsp_tracking_today
    ADD CONSTRAINT dsp_tracking_today_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: friends fk_student_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: friends fk_student_id_fr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT fk_student_id_fr FOREIGN KEY (student_id_fr) REFERENCES public.student_personal_info(student_id);


--
-- Name: grade_tracking grade_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_tracking
    ADD CONSTRAINT grade_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: grade_tracking grade_tracking_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_tracking
    ADD CONSTRAINT grade_tracking_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.all_topics(topic_id);


--
-- Name: student_course_enrollment student_course_enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollment
    ADD CONSTRAINT student_course_enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course_registry(course_id);


--
-- Name: student_course_enrollment student_course_enrollment_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollment
    ADD CONSTRAINT student_course_enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: student_education_info student_education_info_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_education_info
    ADD CONSTRAINT student_education_info_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: student_exam_table student_exam_table_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_exam_table
    ADD CONSTRAINT student_exam_table_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: subject_badge_tracking subject_badge_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject_badge_tracking
    ADD CONSTRAINT subject_badge_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: topic_badge_tracking topic_badge_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic_badge_tracking
    ADD CONSTRAINT topic_badge_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- Name: chapter_badge_tracking unit_badge_tracking_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapter_badge_tracking
    ADD CONSTRAINT unit_badge_tracking_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student_personal_info(student_id);


--
-- PostgreSQL database dump complete
--

