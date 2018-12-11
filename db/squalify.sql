--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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
-- Name: account_user; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.account_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.account_user OWNER TO irsyadmhdilham;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.account_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO irsyadmhdilham;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.account_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_groups_id_seq OWNER TO irsyadmhdilham;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.account_user_groups_id_seq OWNED BY public.account_user_groups.id;


--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_id_seq OWNER TO irsyadmhdilham;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account_user.id;


--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.account_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO irsyadmhdilham;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.account_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_user_permissions_id_seq OWNER TO irsyadmhdilham;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.account_user_user_permissions_id_seq OWNED BY public.account_user_user_permissions.id;


--
-- Name: apis_agency; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_agency (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    agency_image character varying(100) NOT NULL,
    company_id integer NOT NULL,
    industry_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.apis_agency OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_agency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_agency_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_agency_id_seq OWNED BY public.apis_agency.id;


--
-- Name: apis_agency_members; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_agency_members (
    id integer NOT NULL,
    agency_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.apis_agency_members OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_members_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_agency_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_agency_members_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_agency_members_id_seq OWNED BY public.apis_agency_members.id;


--
-- Name: apis_agency_posts; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_agency_posts (
    id integer NOT NULL,
    agency_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.apis_agency_posts OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_agency_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_agency_posts_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_agency_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_agency_posts_id_seq OWNED BY public.apis_agency_posts.id;


--
-- Name: apis_comment; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_comment (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    commented_by_id integer NOT NULL
);


ALTER TABLE public.apis_comment OWNER TO irsyadmhdilham;

--
-- Name: apis_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_comment_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_comment_id_seq OWNED BY public.apis_comment.id;


--
-- Name: apis_company; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_company (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_company OWNER TO irsyadmhdilham;

--
-- Name: apis_company_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_company_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_company_id_seq OWNED BY public.apis_company.id;


--
-- Name: apis_contact; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_contact (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    remark text,
    contact_no character varying(30) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    image character varying(100),
    contact_type_id integer NOT NULL,
    status_id character varying(30) NOT NULL,
    referrer_id integer
);


ALTER TABLE public.apis_contact OWNER TO irsyadmhdilham;

--
-- Name: apis_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_contact_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_contact_id_seq OWNED BY public.apis_contact.id;


--
-- Name: apis_contact_schedules; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_contact_schedules (
    id integer NOT NULL,
    contact_id integer NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public.apis_contact_schedules OWNER TO irsyadmhdilham;

--
-- Name: apis_contact_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_contact_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_contact_schedule_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_contact_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_contact_schedule_id_seq OWNED BY public.apis_contact_schedules.id;


--
-- Name: apis_contactstatus; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_contactstatus (
    id integer NOT NULL,
    status character varying(30) NOT NULL
);


ALTER TABLE public.apis_contactstatus OWNER TO irsyadmhdilham;

--
-- Name: apis_contactstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_contactstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_contactstatus_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_contactstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_contactstatus_id_seq OWNED BY public.apis_contactstatus.id;


--
-- Name: apis_contacttype; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_contacttype (
    id integer NOT NULL,
    contact_type character varying(30) NOT NULL
);


ALTER TABLE public.apis_contacttype OWNER TO irsyadmhdilham;

--
-- Name: apis_contacttype_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_contacttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_contacttype_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_contacttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_contacttype_id_seq OWNED BY public.apis_contacttype.id;


--
-- Name: apis_conversation; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_conversation (
    id integer NOT NULL,
    conversation jsonb NOT NULL
);


ALTER TABLE public.apis_conversation OWNER TO irsyadmhdilham;

--
-- Name: apis_conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_conversation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_conversation_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_conversation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_conversation_id_seq OWNED BY public.apis_conversation.id;


--
-- Name: apis_conversation_subscriber; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_conversation_subscriber (
    id integer NOT NULL,
    conversation_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.apis_conversation_subscriber OWNER TO irsyadmhdilham;

--
-- Name: apis_conversation_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_conversation_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_conversation_subscriber_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_conversation_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_conversation_subscriber_id_seq OWNED BY public.apis_conversation_subscriber.id;


--
-- Name: apis_designation; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_designation (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_designation OWNER TO irsyadmhdilham;

--
-- Name: apis_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_designation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_designation_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_designation_id_seq OWNED BY public.apis_designation.id;


--
-- Name: apis_group; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_group (
    id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.apis_group OWNER TO irsyadmhdilham;

--
-- Name: apis_group_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_group_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_group_id_seq OWNED BY public.apis_group.id;


--
-- Name: apis_group_members; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_group_members (
    id integer NOT NULL,
    group_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.apis_group_members OWNER TO irsyadmhdilham;

--
-- Name: apis_group_members_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_group_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_group_members_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_group_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_group_members_id_seq OWNED BY public.apis_group_members.id;


--
-- Name: apis_inbox; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_inbox (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    conversation_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE public.apis_inbox OWNER TO irsyadmhdilham;

--
-- Name: apis_inbox_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_inbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_inbox_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_inbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_inbox_id_seq OWNED BY public.apis_inbox.id;


--
-- Name: apis_industry; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_industry (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_industry OWNER TO irsyadmhdilham;

--
-- Name: apis_industry_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_industry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_industry_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_industry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_industry_id_seq OWNED BY public.apis_industry.id;


--
-- Name: apis_like; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_like (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    liker_id integer NOT NULL
);


ALTER TABLE public.apis_like OWNER TO irsyadmhdilham;

--
-- Name: apis_like_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_like_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_like_id_seq OWNED BY public.apis_like.id;


--
-- Name: apis_notification; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_notification (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    notification_type_id integer NOT NULL,
    notified_by_id integer NOT NULL,
    post_rel_id integer
);


ALTER TABLE public.apis_notification OWNER TO irsyadmhdilham;

--
-- Name: apis_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_notification_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_notification_id_seq OWNED BY public.apis_notification.id;


--
-- Name: apis_notificationtype; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_notificationtype (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_notificationtype OWNER TO irsyadmhdilham;

--
-- Name: apis_notificationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_notificationtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_notificationtype_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_notificationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_notificationtype_id_seq OWNED BY public.apis_notificationtype.id;


--
-- Name: apis_point; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_point (
    id integer NOT NULL,
    date date NOT NULL,
    logs jsonb NOT NULL
);


ALTER TABLE public.apis_point OWNER TO irsyadmhdilham;

--
-- Name: apis_point_attributes; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_point_attributes (
    id integer NOT NULL,
    point_id integer NOT NULL,
    pointattribute_id integer NOT NULL
);


ALTER TABLE public.apis_point_attributes OWNER TO irsyadmhdilham;

--
-- Name: apis_point_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_point_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_point_attributes_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_point_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_point_attributes_id_seq OWNED BY public.apis_point_attributes.id;


--
-- Name: apis_point_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_point_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_point_id_seq OWNED BY public.apis_point.id;


--
-- Name: apis_pointattribute; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_pointattribute (
    id integer NOT NULL,
    point integer NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    attribute_id integer NOT NULL
);


ALTER TABLE public.apis_pointattribute OWNER TO irsyadmhdilham;

--
-- Name: apis_pointattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_pointattribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_pointattribute_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_pointattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_pointattribute_id_seq OWNED BY public.apis_pointattribute.id;


--
-- Name: apis_pointfield; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_pointfield (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.apis_pointfield OWNER TO irsyadmhdilham;

--
-- Name: apis_pointfield_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_pointfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_pointfield_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_pointfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_pointfield_id_seq OWNED BY public.apis_pointfield.id;


--
-- Name: apis_post; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_post (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    contact_rel_id integer,
    post_type_id integer NOT NULL,
    posted_by_id integer NOT NULL
);


ALTER TABLE public.apis_post OWNER TO irsyadmhdilham;

--
-- Name: apis_post_comments; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_post_comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    comment_id integer NOT NULL
);


ALTER TABLE public.apis_post_comments OWNER TO irsyadmhdilham;

--
-- Name: apis_post_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_post_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_post_comments_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_post_comments_id_seq OWNED BY public.apis_post_comments.id;


--
-- Name: apis_post_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_post_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_post_id_seq OWNED BY public.apis_post.id;


--
-- Name: apis_post_likes; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_post_likes (
    id integer NOT NULL,
    post_id integer NOT NULL,
    like_id integer NOT NULL
);


ALTER TABLE public.apis_post_likes OWNER TO irsyadmhdilham;

--
-- Name: apis_post_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_post_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_post_likes_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_post_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_post_likes_id_seq OWNED BY public.apis_post_likes.id;


--
-- Name: apis_post_sales_rel; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_post_sales_rel (
    id integer NOT NULL,
    post_id integer NOT NULL,
    sales_id integer NOT NULL
);


ALTER TABLE public.apis_post_sales_rel OWNER TO irsyadmhdilham;

--
-- Name: apis_post_sales_rel_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_post_sales_rel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_post_sales_rel_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_post_sales_rel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_post_sales_rel_id_seq OWNED BY public.apis_post_sales_rel.id;


--
-- Name: apis_post_users_tagged; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_post_users_tagged (
    id integer NOT NULL,
    post_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.apis_post_users_tagged OWNER TO irsyadmhdilham;

--
-- Name: apis_post_users_tagged_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_post_users_tagged_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_post_users_tagged_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_post_users_tagged_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_post_users_tagged_id_seq OWNED BY public.apis_post_users_tagged.id;


--
-- Name: apis_posttype; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_posttype (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_posttype OWNER TO irsyadmhdilham;

--
-- Name: apis_posttype_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_posttype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_posttype_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_posttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_posttype_id_seq OWNED BY public.apis_posttype.id;


--
-- Name: apis_profile; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    profile_image character varying(100) NOT NULL,
    settings jsonb NOT NULL,
    agency_id integer NOT NULL,
    designation_id integer NOT NULL,
    group_id integer,
    upline_id integer,
    user_id integer NOT NULL,
    fcm_token text
);


ALTER TABLE public.apis_profile OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_contacts; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_contacts (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.apis_profile_contacts OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_contacts_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_contacts_id_seq OWNED BY public.apis_profile_contacts.id;


--
-- Name: apis_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_id_seq OWNED BY public.apis_profile.id;


--
-- Name: apis_profile_inbox; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_inbox (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    inbox_id integer NOT NULL
);


ALTER TABLE public.apis_profile_inbox OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_inbox_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_inbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_inbox_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_inbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_inbox_id_seq OWNED BY public.apis_profile_inbox.id;


--
-- Name: apis_profile_notifications; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_notifications (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    notification_id integer NOT NULL
);


ALTER TABLE public.apis_profile_notifications OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_notifications_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_notifications_id_seq OWNED BY public.apis_profile_notifications.id;


--
-- Name: apis_profile_points; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_points (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    point_id integer NOT NULL
);


ALTER TABLE public.apis_profile_points OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_points_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_points_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_points_id_seq OWNED BY public.apis_profile_points.id;


--
-- Name: apis_profile_sales; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_sales (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    sales_id integer NOT NULL
);


ALTER TABLE public.apis_profile_sales OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_sales_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_sales_id_seq OWNED BY public.apis_profile_sales.id;


--
-- Name: apis_profile_schedules; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_profile_schedules (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    schedule_id integer NOT NULL
);


ALTER TABLE public.apis_profile_schedules OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_profile_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_profile_schedules_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_profile_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_profile_schedules_id_seq OWNED BY public.apis_profile_schedules.id;


--
-- Name: apis_sales; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_sales (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    location character varying(200),
    amount numeric(10,2) NOT NULL,
    commission numeric(10,2),
    document_id character varying(100),
    contact_id integer,
    sales_status_id character varying(30) NOT NULL,
    sales_type_id integer NOT NULL,
    surcharge_id integer,
    repeat_sales boolean NOT NULL
);


ALTER TABLE public.apis_sales OWNER TO irsyadmhdilham;

--
-- Name: apis_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_sales_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_sales_id_seq OWNED BY public.apis_sales.id;


--
-- Name: apis_salesstatus; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_salesstatus (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_salesstatus OWNER TO irsyadmhdilham;

--
-- Name: apis_salesstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_salesstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_salesstatus_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_salesstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_salesstatus_id_seq OWNED BY public.apis_salesstatus.id;


--
-- Name: apis_salestype; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_salestype (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_salestype OWNER TO irsyadmhdilham;

--
-- Name: apis_salestype_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_salestype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_salestype_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_salestype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_salestype_id_seq OWNED BY public.apis_salestype.id;


--
-- Name: apis_schedule; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_schedule (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    remark text,
    location character varying(200) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    reminder jsonb,
    contact_id integer
);


ALTER TABLE public.apis_schedule OWNER TO irsyadmhdilham;

--
-- Name: apis_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_schedule_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_schedule_id_seq OWNED BY public.apis_schedule.id;


--
-- Name: apis_surcharge; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_surcharge (
    id integer NOT NULL,
    name double precision NOT NULL
);


ALTER TABLE public.apis_surcharge OWNER TO irsyadmhdilham;

--
-- Name: apis_surcharge_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_surcharge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_surcharge_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_surcharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_surcharge_id_seq OWNED BY public.apis_surcharge.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO irsyadmhdilham;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO irsyadmhdilham;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO irsyadmhdilham;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO irsyadmhdilham;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO irsyadmhdilham;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO irsyadmhdilham;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: irsyadmhdilham
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


ALTER TABLE public.django_admin_log OWNER TO irsyadmhdilham;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO irsyadmhdilham;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO irsyadmhdilham;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO irsyadmhdilham;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO irsyadmhdilham;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO irsyadmhdilham;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO irsyadmhdilham;

--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_groups ALTER COLUMN id SET DEFAULT nextval('public.account_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.account_user_user_permissions_id_seq'::regclass);


--
-- Name: apis_agency id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency ALTER COLUMN id SET DEFAULT nextval('public.apis_agency_id_seq'::regclass);


--
-- Name: apis_agency_members id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_members ALTER COLUMN id SET DEFAULT nextval('public.apis_agency_members_id_seq'::regclass);


--
-- Name: apis_agency_posts id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_posts ALTER COLUMN id SET DEFAULT nextval('public.apis_agency_posts_id_seq'::regclass);


--
-- Name: apis_comment id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_comment ALTER COLUMN id SET DEFAULT nextval('public.apis_comment_id_seq'::regclass);


--
-- Name: apis_company id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_company ALTER COLUMN id SET DEFAULT nextval('public.apis_company_id_seq'::regclass);


--
-- Name: apis_contact id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact ALTER COLUMN id SET DEFAULT nextval('public.apis_contact_id_seq'::regclass);


--
-- Name: apis_contact_schedules id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules ALTER COLUMN id SET DEFAULT nextval('public.apis_contact_schedule_id_seq'::regclass);


--
-- Name: apis_contactstatus id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contactstatus ALTER COLUMN id SET DEFAULT nextval('public.apis_contactstatus_id_seq'::regclass);


--
-- Name: apis_contacttype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contacttype ALTER COLUMN id SET DEFAULT nextval('public.apis_contacttype_id_seq'::regclass);


--
-- Name: apis_conversation id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation ALTER COLUMN id SET DEFAULT nextval('public.apis_conversation_id_seq'::regclass);


--
-- Name: apis_conversation_subscriber id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation_subscriber ALTER COLUMN id SET DEFAULT nextval('public.apis_conversation_subscriber_id_seq'::regclass);


--
-- Name: apis_designation id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_designation ALTER COLUMN id SET DEFAULT nextval('public.apis_designation_id_seq'::regclass);


--
-- Name: apis_group id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group ALTER COLUMN id SET DEFAULT nextval('public.apis_group_id_seq'::regclass);


--
-- Name: apis_group_members id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members ALTER COLUMN id SET DEFAULT nextval('public.apis_group_members_id_seq'::regclass);


--
-- Name: apis_inbox id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox ALTER COLUMN id SET DEFAULT nextval('public.apis_inbox_id_seq'::regclass);


--
-- Name: apis_industry id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_industry ALTER COLUMN id SET DEFAULT nextval('public.apis_industry_id_seq'::regclass);


--
-- Name: apis_like id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_like ALTER COLUMN id SET DEFAULT nextval('public.apis_like_id_seq'::regclass);


--
-- Name: apis_notification id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification ALTER COLUMN id SET DEFAULT nextval('public.apis_notification_id_seq'::regclass);


--
-- Name: apis_notificationtype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notificationtype ALTER COLUMN id SET DEFAULT nextval('public.apis_notificationtype_id_seq'::regclass);


--
-- Name: apis_point id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point ALTER COLUMN id SET DEFAULT nextval('public.apis_point_id_seq'::regclass);


--
-- Name: apis_point_attributes id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_attributes ALTER COLUMN id SET DEFAULT nextval('public.apis_point_attributes_id_seq'::regclass);


--
-- Name: apis_pointattribute id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointattribute ALTER COLUMN id SET DEFAULT nextval('public.apis_pointattribute_id_seq'::regclass);


--
-- Name: apis_pointfield id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointfield ALTER COLUMN id SET DEFAULT nextval('public.apis_pointfield_id_seq'::regclass);


--
-- Name: apis_post id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post ALTER COLUMN id SET DEFAULT nextval('public.apis_post_id_seq'::regclass);


--
-- Name: apis_post_comments id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_comments ALTER COLUMN id SET DEFAULT nextval('public.apis_post_comments_id_seq'::regclass);


--
-- Name: apis_post_likes id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_likes ALTER COLUMN id SET DEFAULT nextval('public.apis_post_likes_id_seq'::regclass);


--
-- Name: apis_post_sales_rel id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_sales_rel ALTER COLUMN id SET DEFAULT nextval('public.apis_post_sales_rel_id_seq'::regclass);


--
-- Name: apis_post_users_tagged id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_users_tagged ALTER COLUMN id SET DEFAULT nextval('public.apis_post_users_tagged_id_seq'::regclass);


--
-- Name: apis_posttype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_posttype ALTER COLUMN id SET DEFAULT nextval('public.apis_posttype_id_seq'::regclass);


--
-- Name: apis_profile id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_id_seq'::regclass);


--
-- Name: apis_profile_contacts id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_contacts ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_contacts_id_seq'::regclass);


--
-- Name: apis_profile_inbox id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_inbox ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_inbox_id_seq'::regclass);


--
-- Name: apis_profile_notifications id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_notifications ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_notifications_id_seq'::regclass);


--
-- Name: apis_profile_points id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_points ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_points_id_seq'::regclass);


--
-- Name: apis_profile_sales id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_sales ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_sales_id_seq'::regclass);


--
-- Name: apis_profile_schedules id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_schedules ALTER COLUMN id SET DEFAULT nextval('public.apis_profile_schedules_id_seq'::regclass);


--
-- Name: apis_sales id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales ALTER COLUMN id SET DEFAULT nextval('public.apis_sales_id_seq'::regclass);


--
-- Name: apis_salesstatus id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salesstatus ALTER COLUMN id SET DEFAULT nextval('public.apis_salesstatus_id_seq'::regclass);


--
-- Name: apis_salestype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salestype ALTER COLUMN id SET DEFAULT nextval('public.apis_salestype_id_seq'::regclass);


--
-- Name: apis_schedule id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_schedule ALTER COLUMN id SET DEFAULT nextval('public.apis_schedule_id_seq'::regclass);


--
-- Name: apis_surcharge id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_surcharge ALTER COLUMN id SET DEFAULT nextval('public.apis_surcharge_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.account_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
14	pbkdf2_sha256$120000$A1mbJrDtOAod$Uc4yCHFRRVjXzIhRbm/K6520PubaOosjNkd4RX5h1mA=	\N	f			f	t	2018-12-04 17:15:07.346692+08	afif@vve.com
1	pbkdf2_sha256$120000$sDv3OkbSidfX$Prh72xTlnqoRJQW5SEr9//xXUdQybMGys9JCkrVQtbk=	2018-12-07 01:19:08.582429+08	t			t	t	2018-11-13 23:50:54.377288+08	irsyadmhdilham@gmail.com
12	pbkdf2_sha256$120000$x7tBWjPIFeak$QRiW43CBICAMFrnPWn0dHQSWxUDgBcJNxDzlpPMVhdY=	\N	f	Irsyad Mhd Ilham		f	t	2018-11-14 23:05:42+08	cwa@cwa.com
13	pbkdf2_sha256$120000$iT0Oe8uucPUt$HhiNavnlIu2WoA9y7/qkMAh7VLcxYvrKulsRQq/8y4U=	\N	f			f	t	2018-12-03 15:55:11+08	irfan@vve.com
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: apis_agency; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_agency (id, name, agency_image, company_id, industry_id, owner_id) FROM stdin;
1	Squalify Agency	agencies/1/bg.jpg	2	1	15
\.


--
-- Data for Name: apis_agency_members; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_agency_members (id, agency_id, profile_id) FROM stdin;
1	1	15
2	1	16
3	1	17
\.


--
-- Data for Name: apis_agency_posts; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_agency_posts (id, agency_id, post_id) FROM stdin;
8	1	8
9	1	9
10	1	10
\.


--
-- Data for Name: apis_comment; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_comment (id, "timestamp", text, commented_by_id) FROM stdin;
6	2018-12-09 22:56:40.0452+08	Mantap syad	16
7	2018-12-10 12:54:21.322895+08	Congrats 	16
8	2018-12-10 12:55:58.037508+08	Cool bro	15
9	2018-12-10 12:56:12.48882+08	Cool lah bro	15
10	2018-12-10 12:57:30.908218+08	Boleh qualify cpt ni	16
\.


--
-- Data for Name: apis_company; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_company (id, name) FROM stdin;
1	Public Mutual
2	CWA
\.


--
-- Data for Name: apis_contact; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_contact (id, name, remark, contact_no, created_on, last_modified, image, contact_type_id, status_id, referrer_id) FROM stdin;
45	Mr Nelson Mandela	Meet on 13 December	019 899 8822	2018-11-29 18:27:42.312798+08	2018-11-30 09:32:12.867547+08		2	Appointment secured	\N
49	Adib	\N	019 779223	2018-12-02 13:42:42.350794+08	2018-12-02 17:37:15.972838+08		1	Appointment secured	\N
50	Trevor James	\N	017 8888 283	2018-12-02 17:35:04.139199+08	2018-12-02 17:37:43.34612+08		1	None	47
48	Micheal Learns to rock	\N	012323	2018-12-02 12:46:21.575463+08	2018-12-02 17:42:15.986675+08		2	Appointment secured	\N
51	Irfan Bakti Badrul	\N	019 882333	2018-12-04 11:00:24.76398+08	2018-12-04 11:16:46.250055+08		2	Appointment secured	\N
52	Hello world	\N	01923233	2018-12-04 11:17:36.002545+08	2018-12-04 11:21:14.457737+08		1	Appointment secured	51
53	Hello sdsdsd	\N	233333	2018-12-04 11:20:14.114466+08	2018-12-04 11:22:02.152627+08		1	Appointment secured	52
54	Tambah lagi	\N	02832333	2018-12-04 11:26:23.483483+08	2018-12-04 12:51:06.411739+08		1	Appointment secured	52
47	Yunos Alwi	\N	019 2323	2018-12-02 12:43:01.283276+08	2018-12-09 13:51:11.690463+08		1	Appointment secured	\N
56	Karen	\N	016555789	2018-12-09 22:50:53.446867+08	2018-12-09 22:50:53.486227+08		1	None	52
57	Jamal	Maybank kl	0182334577	2018-12-09 23:13:54.055187+08	2018-12-09 23:15:37.763934+08		2	Appointment secured	\N
58	Ahmad	\N	0185782689	2018-12-10 14:43:23.751064+08	2018-12-10 14:43:23.751108+08		2	None	\N
59	Mary	\N	085468	2018-12-10 17:06:07.180745+08	2018-12-10 17:06:07.181497+08		2	None	\N
\.


--
-- Data for Name: apis_contact_schedules; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_contact_schedules (id, contact_id, schedule_id) FROM stdin;
1	45	34
2	49	36
3	48	37
8	47	45
9	57	48
\.


--
-- Data for Name: apis_contactstatus; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_contactstatus (id, status) FROM stdin;
1	None
2	Called
3	Appointment secured
4	Rejected
5	Client
6	Customer
7	Other
\.


--
-- Data for Name: apis_contacttype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_contacttype (id, contact_type) FROM stdin;
1	Referral
2	Face to face
3	Nesting
4	Booth
5	Table to table
\.


--
-- Data for Name: apis_conversation; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_conversation (id, conversation) FROM stdin;
\.


--
-- Data for Name: apis_conversation_subscriber; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_conversation_subscriber (id, conversation_id, profile_id) FROM stdin;
\.


--
-- Data for Name: apis_designation; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_designation (id, name) FROM stdin;
1	Group Agency Manager
2	Agency Manager
3	Agency Supervisor
4	Unit Trust Consultant
\.


--
-- Data for Name: apis_group; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_group (id, owner_id) FROM stdin;
2	16
1	15
\.


--
-- Data for Name: apis_group_members; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_group_members (id, group_id, profile_id) FROM stdin;
2	1	16
3	2	17
7	1	17
\.


--
-- Data for Name: apis_inbox; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_inbox (id, created_on, last_modified, conversation_id, sender_id) FROM stdin;
\.


--
-- Data for Name: apis_industry; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_industry (id, name) FROM stdin;
1	Unit trust investment
\.


--
-- Data for Name: apis_like; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_like (id, "timestamp", liker_id) FROM stdin;
43	2018-12-09 22:56:20.737825+08	16
44	2018-12-09 23:07:11.370272+08	16
\.


--
-- Data for Name: apis_notification; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_notification (id, "timestamp", notification_type_id, notified_by_id, post_rel_id) FROM stdin;
\.


--
-- Data for Name: apis_notificationtype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_notificationtype (id, name) FROM stdin;
1	Joining field work
2	Sales closed
3	Comment
4	Direct message
5	Like
\.


--
-- Data for Name: apis_point; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_point (id, date, logs) FROM stdin;
6	2018-11-24	{"logs": [{"time": "2018-11-24T07:15:20.154509", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-11-24T07:31:28.928938", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-11-24T07:33:56.287311", "type": "add", "point": 2, "attribute": "Referrals"}, {"time": "2018-11-24T07:35:05.722509", "type": "add", "point": 4, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-11-24T08:26:05.538905", "type": "add", "point": 2, "attribute": "Update upline"}, {"time": "2018-11-24T09:16:51.508681", "type": "add", "point": 3, "attribute": "Be early training"}, {"time": "2018-11-24T09:16:59.606514", "type": "add", "point": 1, "attribute": "Personal coaching"}, {"time": "2018-11-24T09:17:10.027041", "type": "add", "point": 3, "attribute": "Millionnaire suit"}, {"time": "2018-11-24T09:18:00.139674", "type": "add", "point": 1, "attribute": "Joining field work"}, {"time": "2018-11-24T09:18:04.675414", "type": "add", "point": 3, "attribute": "Referrals"}]}
1	2018-11-23	{}
8	2018-11-25	{"logs": [{"time": "2018-11-25T03:34:59.261093", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-11-25T03:37:06.261872", "type": "add", "point": 1, "attribute": "Joining field work"}, {"time": "2018-11-25T03:37:56.311838", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}]}
9	2018-11-26	{"logs": [{"time": "2018-11-26T10:56:05.148052", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-11-26T10:56:28.332658", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-11-26T10:56:30.025953", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-11-26T10:56:32.423051", "type": "add", "point": 3, "attribute": "Sales presentation"}, {"time": "2018-11-26T10:56:34.225338", "type": "add", "point": 3, "attribute": "Sign up contract"}, {"time": "2018-11-26T10:56:35.496948", "type": "add", "point": 4, "attribute": "Case closed"}, {"time": "2018-11-26T10:56:36.428986", "type": "add", "point": 3, "attribute": "Career presentation"}, {"time": "2018-11-26T10:56:37.737372", "type": "add", "point": 6, "attribute": "Sales presentation"}, {"time": "2018-11-26T10:56:39.629881", "type": "add", "point": 1, "attribute": "Joining field work"}, {"time": "2018-11-26T10:56:40.721729", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}]}
14	2018-11-27	{"logs": [{"time": "2018-11-27T02:07:35.758250", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-11-27T02:07:36.928367", "type": "add", "point": 1, "attribute": "Joining field work"}, {"time": "2018-11-27T02:07:38.936586", "type": "add", "point": 2, "attribute": "Joining field work"}, {"time": "2018-11-27T02:07:47.384919", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-11-27T02:07:48.403837", "type": "add", "point": 4, "attribute": "Case closed"}, {"time": "2018-11-27T02:07:49.489056", "type": "add", "point": 3, "attribute": "Sales presentation"}, {"time": "2018-11-27T02:07:50.359979", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-11-27T02:07:51.547584", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-11-27T02:07:52.341769", "type": "add", "point": 2, "attribute": "Calls/Email/Socmed"}, {"time": "2018-11-27T02:07:53.131472", "type": "add", "point": 3, "attribute": "Calls/Email/Socmed"}, {"time": "2018-11-27T02:07:53.948452", "type": "add", "point": 4, "attribute": "Calls/Email/Socmed"}, {"time": "2018-11-27T02:07:56.817148", "type": "add", "point": 2, "attribute": "Update upline"}, {"time": "2018-11-27T02:07:57.607545", "type": "add", "point": 3, "attribute": "Millionnaire suit"}, {"time": "2018-11-27T02:07:59.504366", "type": "add", "point": 3, "attribute": "Be early training"}, {"time": "2018-11-27T02:08:00.696692", "type": "add", "point": 1, "attribute": "Personal coaching"}, {"time": "2018-11-27T02:08:01.749197", "type": "add", "point": 5, "attribute": "Agency program"}, {"time": "2018-11-27T02:08:02.691056", "type": "add", "point": 1, "attribute": "Servicing/Follow up"}]}
15	2018-11-29	{"logs": [{"time": "2018-11-29T10:05:04.906063", "type": "add", "point": 4, "attribute": "Case closed"}, {"time": "2018-11-29T10:27:43.037223", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}]}
16	2018-11-30	{"logs": [{"time": "2018-11-30T06:15:34.787444", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-11-30T06:15:45.172811", "type": "add", "point": 2, "attribute": "Referrals"}]}
17	2018-12-02	{"logs": [{"time": "2018-12-02T05:42:42.464621", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-02T07:03:55.786363", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-12-02T07:11:02.363740", "type": "add", "point": 4, "attribute": "Appointment secured"}, {"time": "2018-12-02T09:35:04.241580", "type": "add", "point": 4, "attribute": "FTF/Nesting/Booth"}]}
18	2018-12-04	{"logs": [{"time": "2018-12-04T02:55:24.807374", "type": "add", "point": 3, "attribute": "Career presentation"}, {"time": "2018-12-04T02:58:43.391001", "type": "add", "point": 3, "attribute": "Sign up contract"}, {"time": "2018-12-04T03:00:25.024822", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-04T03:13:27.191669", "type": "add", "point": 2, "attribute": "Update upline"}, {"time": "2018-12-04T03:17:36.085005", "type": "add", "point": 4, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-04T03:20:14.223903", "type": "add", "point": 6, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-04T03:20:16.488706", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-12-04T03:22:02.021759", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-12-04T03:26:23.581321", "type": "add", "point": 8, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-04T03:27:45.585753", "type": "add", "point": 2, "attribute": "Referrals"}, {"time": "2018-12-04T03:41:12.574534", "type": "add", "point": 4, "attribute": "Appointment secured"}, {"time": "2018-12-04T04:48:49.273728", "type": "add", "point": 6, "attribute": "Appointment secured"}, {"time": "2018-12-04T04:51:03.663009", "type": "add", "point": 8, "attribute": "Appointment secured"}, {"time": "2018-12-04T05:58:16.292214", "type": "add", "point": 10, "attribute": "Appointment secured"}, {"time": "2018-12-04T05:58:18.674526", "type": "add", "point": 10, "attribute": "Appointment secured"}, {"time": "2018-12-04T06:00:30.565566", "type": "add", "point": 12, "attribute": "Appointment secured"}, {"time": "2018-12-04T06:03:32.193376", "type": "add", "point": 14, "attribute": "Appointment secured"}]}
19	2018-12-08	{"logs": [{"time": "2018-12-08T09:18:40.727505", "type": "add", "point": 3, "attribute": "Career presentation"}, {"time": "2018-12-08T09:18:46.831028", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-08T09:19:16.972535", "type": "add", "point": 3, "attribute": "Millionnaire suit"}, {"time": "2018-12-08T09:19:20.563906", "type": "add", "point": 5, "attribute": "Agency program"}]}
20	2018-12-09	{"logs": [{"time": "2018-12-09T05:50:23.555789", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T05:51:08.940944", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-12-09T07:58:10.925222", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T07:58:29.690283", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T08:00:02.314561", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T08:01:21.612187", "type": "add", "point": 2, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T08:02:38.232268", "type": "add", "point": 3, "attribute": "Millionnaire suit"}, {"time": "2018-12-09T08:02:40.357506", "type": "add", "point": 2, "attribute": "Update upline"}]}
21	2018-12-09	{"logs": [{"time": "2018-12-09T14:48:08.279388", "type": "add", "point": 1, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T14:49:05.068727", "type": "add", "point": 1, "attribute": "Joining field work"}, {"time": "2018-12-09T14:49:36.909624", "type": "add", "point": 3, "attribute": "Sales presentation"}, {"time": "2018-12-09T14:49:38.751673", "type": "add", "point": 3, "attribute": "Sign up contract"}, {"time": "2018-12-09T14:50:53.631313", "type": "add", "point": 1, "attribute": "Referrals"}, {"time": "2018-12-09T14:51:19.928779", "type": "add", "point": 2, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T14:51:47.575476", "type": "add", "point": 3, "attribute": "Career presentation"}, {"time": "2018-12-09T14:52:11.539800", "type": "add", "point": 1, "attribute": "Servicing/Follow up"}, {"time": "2018-12-09T14:52:12.870843", "type": "add", "point": 2, "attribute": "Update upline"}, {"time": "2018-12-09T14:52:14.100659", "type": "add", "point": 3, "attribute": "Millionnaire suit"}, {"time": "2018-12-09T14:52:18.513466", "type": "add", "point": 3, "attribute": "Be early training"}, {"time": "2018-12-09T14:58:17.799146", "type": "add", "point": 6, "attribute": "Sales presentation"}, {"time": "2018-12-09T14:59:57.242457", "type": "add", "point": 2, "attribute": "Appointment secured"}, {"time": "2018-12-09T15:13:54.295578", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-09T15:14:39.351878", "type": "add", "point": 3, "attribute": "Calls/Email/Socmed"}, {"time": "2018-12-09T15:15:34.849238", "type": "add", "point": 4, "attribute": "Appointment secured"}, {"time": "2018-12-09T15:22:02.191373", "type": "add", "point": 4, "attribute": "Update upline"}, {"time": "2018-12-09T15:22:04.445652", "type": "add", "point": 6, "attribute": "Be early training"}, {"time": "2018-12-09T15:22:53.596538", "type": "add", "point": 2, "attribute": "Joining field work"}, {"time": "2018-12-09T15:29:59.836986", "type": "add", "point": 6, "attribute": "Sign up contract"}, {"time": "2018-12-09T15:37:35.332852", "type": "add", "point": 1, "attribute": "Personal coaching"}, {"time": "2018-12-09T15:37:37.345106", "type": "add", "point": 6, "attribute": "Update upline"}, {"time": "2018-12-09T15:46:17.301186", "type": "add", "point": 5, "attribute": "Agency program"}, {"time": "2018-12-09T15:46:34.553199", "type": "add", "point": 10, "attribute": "Agency program"}]}
22	2018-12-10	{"logs": [{"time": "2018-12-10T06:43:24.616882", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-10T06:44:21.193517", "type": "add", "point": 2, "attribute": "Appointment secured"}]}
23	2018-12-10	{"logs": [{"time": "2018-12-10T09:06:07.371305", "type": "add", "point": 2, "attribute": "FTF/Nesting/Booth"}, {"time": "2018-12-10T09:20:41.866641", "type": "add", "point": 2, "attribute": "Update upline"}, {"time": "2018-12-10T09:20:49.779469", "type": "add", "point": 3, "attribute": "Millionnaire suit"}]}
\.


--
-- Data for Name: apis_point_attributes; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_point_attributes (id, point_id, pointattribute_id) FROM stdin;
1	1	1
2	1	4
3	1	5
4	1	6
6	1	8
7	1	9
9	1	11
11	1	13
12	1	14
13	1	15
20	1	22
21	1	23
22	1	24
36	6	39
37	6	40
38	6	41
39	6	42
40	6	43
41	6	44
42	6	45
45	8	48
46	8	49
47	8	50
48	9	51
49	9	52
50	9	53
51	9	54
52	9	55
53	9	56
54	9	57
55	9	58
56	9	59
61	14	64
62	14	65
63	14	66
64	14	67
65	14	68
66	14	69
67	14	70
68	14	71
69	14	72
70	14	73
71	14	74
72	14	75
73	14	76
74	15	77
75	15	78
76	16	79
77	17	81
78	17	82
79	18	83
80	18	84
81	18	85
82	18	86
83	18	87
84	18	88
85	19	89
86	19	90
87	19	91
88	19	92
89	20	93
90	20	94
91	20	95
92	20	96
93	21	97
94	21	98
95	21	99
96	21	100
97	21	101
98	21	102
99	21	103
100	21	104
101	21	105
102	21	106
103	21	107
104	21	108
105	21	109
106	21	110
107	22	111
108	22	112
109	23	114
110	23	115
111	23	116
\.


--
-- Data for Name: apis_pointattribute; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointattribute (id, point, last_modified, attribute_id) FROM stdin;
95	3	2018-12-09 16:02:38.240633+08	10
96	2	2018-12-09 16:02:40.365967+08	11
5	4	2018-11-23 18:26:09.643161+08	8
64	2	2018-11-27 10:07:35.769069+08	1
8	3	2018-11-23 18:44:34.213108+08	7
65	2	2018-11-27 10:07:38.952623+08	2
66	2	2018-11-27 10:07:47.397635+08	5
6	3	2018-11-23 18:48:06.154649+08	2
9	4	2018-11-23 18:48:16.905265+08	5
1	4	2018-11-23 18:48:39.690132+08	3
67	4	2018-11-27 10:07:48.416018+08	8
68	3	2018-11-27 10:07:49.502732+08	6
11	6	2018-11-23 18:50:11.520258+08	9
69	1	2018-11-27 10:07:50.374163+08	3
13	4	2018-11-23 18:53:38.000884+08	11
14	2	2018-11-23 18:56:25.336798+08	12
15	3	2018-11-23 22:53:53.234705+08	14
70	4	2018-11-27 10:07:53.989506+08	4
71	2	2018-11-27 10:07:56.834942+08	11
72	3	2018-11-27 10:07:57.636583+08	10
73	3	2018-11-27 10:07:59.515001+08	14
74	1	2018-11-27 10:08:00.7795+08	13
22	3	2018-11-23 23:19:15.173448+08	10
4	6	2018-11-23 23:20:25.701599+08	1
75	5	2018-11-27 10:08:01.763277+08	15
24	10	2018-11-23 23:31:44.223179+08	15
23	2	2018-11-23 23:31:53.454745+08	4
76	1	2018-11-27 10:08:02.700897+08	12
77	4	2018-11-29 18:05:04.940307+08	8
40	4	2018-11-24 15:35:05.742278+08	1
41	2	2018-11-24 16:26:05.575168+08	11
42	3	2018-11-24 17:16:51.539874+08	14
43	1	2018-11-24 17:16:59.621018+08	13
44	3	2018-11-24 17:17:10.040401+08	10
45	1	2018-11-24 17:18:00.15724+08	2
39	3	2018-11-24 17:18:04.691534+08	3
78	2	2018-11-29 18:27:43.04928+08	1
101	1	2018-12-09 22:50:53.639756+08	3
48	1	2018-11-25 11:34:59.323171+08	3
49	1	2018-11-25 11:37:06.272042+08	2
50	1	2018-11-25 11:37:56.323839+08	4
51	1	2018-11-26 18:56:05.21445+08	3
52	2	2018-11-26 18:56:28.343775+08	5
53	1	2018-11-26 18:56:30.03574+08	4
79	2	2018-11-30 14:15:45.18562+08	3
55	3	2018-11-26 18:56:34.244232+08	9
56	4	2018-11-26 18:56:35.511703+08	8
57	3	2018-11-26 18:56:36.445239+08	7
54	6	2018-11-26 18:56:37.835988+08	6
58	1	2018-11-26 18:56:39.644702+08	2
59	2	2018-11-26 18:56:40.733686+08	1
82	4	2018-12-02 15:11:02.386313+08	5
81	4	2018-12-02 17:35:04.256379+08	1
83	3	2018-12-04 10:55:25.076457+08	7
84	3	2018-12-04 10:58:43.400815+08	9
102	3	2018-12-09 22:51:47.583669+08	7
86	2	2018-12-04 11:13:27.238316+08	11
103	1	2018-12-09 22:52:11.548039+08	12
85	8	2018-12-04 11:26:23.597333+08	1
87	2	2018-12-04 11:27:45.604633+08	3
105	3	2018-12-09 22:52:14.108702+08	10
99	6	2018-12-09 22:58:17.810268+08	6
88	14	2018-12-04 14:03:32.207057+08	5
89	3	2018-12-08 17:18:41.185534+08	7
90	1	2018-12-08 17:18:46.842529+08	4
91	3	2018-12-08 17:19:16.980816+08	10
92	5	2018-12-08 17:19:20.571967+08	15
94	2	2018-12-09 13:51:08.949331+08	5
108	2	2018-12-09 23:13:54.303951+08	1
97	3	2018-12-09 23:14:39.381366+08	4
93	2	2018-12-09 16:01:21.62271+08	4
107	4	2018-12-09 23:15:34.859859+08	5
106	6	2018-12-09 23:22:04.457053+08	14
98	2	2018-12-09 23:22:53.608101+08	2
100	6	2018-12-09 23:29:59.848119+08	9
109	1	2018-12-09 23:37:35.352682+08	13
104	6	2018-12-09 23:37:37.356039+08	11
110	10	2018-12-09 23:46:34.564829+08	15
111	2	2018-12-10 14:43:24.65636+08	1
112	2	2018-12-10 14:44:21.204527+08	5
113	1	2018-12-10 14:57:11.357167+08	2
114	2	2018-12-10 17:06:07.377815+08	1
115	2	2018-12-10 17:20:41.877216+08	11
116	3	2018-12-10 17:20:49.792584+08	10
\.


--
-- Data for Name: apis_pointfield; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointfield (id, name) FROM stdin;
2	Joining field work
3	Referrals
5	Appointment secured
7	Career presentation
8	Case closed
9	Sign up contract
10	Millionnaire suit
11	Update upline
13	Personal coaching
15	Agency program
12	Servicing/Follow up
4	Calls/Email/Socmed
6	Sales presentation
1	FTF/Nesting/Booth
14	Be early training
\.


--
-- Data for Name: apis_post; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post (id, "timestamp", contact_rel_id, post_type_id, posted_by_id) FROM stdin;
8	2018-12-08 21:39:51.325369+08	\N	1	15
9	2018-12-09 22:48:51.058992+08	\N	1	16
10	2018-12-10 13:58:31.873943+08	\N	1	15
\.


--
-- Data for Name: apis_post_comments; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_comments (id, post_id, comment_id) FROM stdin;
5	8	6
6	9	7
7	9	8
8	8	9
9	8	10
\.


--
-- Data for Name: apis_post_likes; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_likes (id, post_id, like_id) FROM stdin;
43	8	43
44	9	44
\.


--
-- Data for Name: apis_post_sales_rel; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_sales_rel (id, post_id, sales_id) FROM stdin;
1	8	16
2	8	17
3	9	18
4	9	19
5	9	20
6	10	21
\.


--
-- Data for Name: apis_post_users_tagged; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_users_tagged (id, post_id, profile_id) FROM stdin;
\.


--
-- Data for Name: apis_posttype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_posttype (id, name) FROM stdin;
1	sales closed
2	joining field work
\.


--
-- Data for Name: apis_profile; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile (id, name, profile_image, settings, agency_id, designation_id, group_id, upline_id, user_id, fcm_token) FROM stdin;
16	Irfan Baktiar	users/16/man.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	1	2	2	\N	13	eUcV0BRXAvk:APA91bHzo7kLlBXohYpAhRgyMvBu166bkk8uVNrCvnLmuhWcS826lhz7srGZoRkyJdC2zt9atvEFKHYcb_UZ0iLhivSdm9j6_JSpDBR-aj1E9O9DWMO178KE_kyJhF3aTSnKyNHO9Dcx
15	Aziz Ismail	users/15/man.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	1	1	1	\N	12	null
17	Afif	users/17/baby.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	1	3	\N	\N	14	\N
\.


--
-- Data for Name: apis_profile_contacts; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_contacts (id, profile_id, contact_id) FROM stdin;
45	15	45
47	15	47
48	15	48
49	15	49
50	15	50
51	16	51
52	16	52
53	16	53
54	16	54
56	16	56
57	16	57
58	16	58
59	15	59
\.


--
-- Data for Name: apis_profile_inbox; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_inbox (id, profile_id, inbox_id) FROM stdin;
\.


--
-- Data for Name: apis_profile_notifications; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_notifications (id, profile_id, notification_id) FROM stdin;
\.


--
-- Data for Name: apis_profile_points; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_points (id, profile_id, point_id) FROM stdin;
1	15	1
6	15	6
8	15	8
9	15	9
14	15	14
15	15	15
16	15	16
17	15	17
18	16	18
19	15	19
20	15	20
21	16	21
22	16	22
23	15	23
\.


--
-- Data for Name: apis_profile_sales; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_sales (id, profile_id, sales_id) FROM stdin;
1	15	1
2	15	2
3	15	3
6	15	6
7	15	7
8	15	8
9	15	9
10	15	10
11	15	11
12	15	12
16	15	16
17	15	17
18	16	18
19	16	19
20	16	20
21	15	21
\.


--
-- Data for Name: apis_profile_schedules; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_schedules (id, profile_id, schedule_id) FROM stdin;
20	15	21
29	15	30
30	15	31
31	15	32
32	15	33
33	15	34
35	15	36
36	15	37
42	16	43
43	16	44
44	15	45
45	16	46
46	16	47
47	16	48
48	16	49
49	16	50
50	16	51
51	16	52
\.


--
-- Data for Name: apis_sales; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_sales (id, "timestamp", location, amount, commission, document_id, contact_id, sales_status_id, sales_type_id, surcharge_id, repeat_sales) FROM stdin;
1	2018-11-26 08:17:59.832301+08	\N	100000.00	\N	\N	\N	Submitted	1	\N	f
2	2018-11-26 08:20:31.899943+08	Kajang	28999.00	\N	\N	\N	Submitted	1	\N	t
3	2018-11-26 10:35:32.866267+08	Shah Alam, Plaza Masalam	80000.00	\N	\N	\N	Submitted	2	\N	f
6	2018-11-26 15:40:19.566789+08	Kajang	78987.00	3119.99	\N	\N	Submitted	2	\N	f
7	2018-11-26 15:57:02.112928+08	Sepang	14300.00	564.85	\N	\N	Submitted	2	\N	t
8	2018-11-28 14:12:55.402803+08	Putrajaya	75000.00	1950.00	\N	\N	Submitted	1	\N	f
9	2018-11-28 14:15:44.240599+08	Kajang	6766.00	267.26	\N	\N	Submitted	2	\N	t
10	2018-11-28 17:29:07.228802+08	Cyberjaya	19500.00	507.00	\N	\N	Submitted	1	\N	f
11	2018-11-28 17:30:47.682363+08	Cyberjaya	19320.00	763.14	\N	\N	Submitted	2	\N	f
12	2018-11-29 18:05:04.022296+08	JB	17666.00	459.32	\N	\N	Submitted	1	\N	f
16	2018-12-08 21:39:51.199747+08	Pahang	12000.00	312.00	\N	\N	Submitted	1	\N	f
17	2018-12-08 21:42:46.44175+08	KL	42300.00	1670.85	\N	\N	Submitted	2	\N	f
18	2018-12-09 22:48:50.792067+08	KL	17000.00	419.90	\N	\N	Submitted	1	\N	f
19	2018-12-09 23:04:26.554002+08	Damansara	200000.00	7380.00	\N	\N	Submitted	2	\N	f
20	2018-12-09 23:10:04.853235+08	Kajang	15000.00	370.50	\N	\N	Submitted	1	\N	t
21	2018-12-10 13:58:31.640832+08	Kl	12400.00	\N	\N	\N	Submitted	1	\N	f
\.


--
-- Data for Name: apis_salesstatus; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_salesstatus (id, name) FROM stdin;
1	Submitted
2	Processed
3	Disbursed
4	Rejected
\.


--
-- Data for Name: apis_salestype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_salestype (id, name) FROM stdin;
1	EPF
2	Cash
3	PRS
4	ASB
5	Takaful
6	Wasiat
\.


--
-- Data for Name: apis_schedule; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_schedule (id, date, title, remark, location, created_on, last_modified, reminder, contact_id) FROM stdin;
30	2018-11-21 14:48:00+08	Kamijo	Call bacn	Japan	2018-11-21 10:48:49.669682+08	2018-11-22 00:05:13.080448+08	\N	\N
21	2018-12-20 17:08:00+08	Ahmad Albab	Call back sd	Kajang	2018-11-20 23:08:13.066982+08	2018-11-22 07:42:03.366864+08	\N	\N
31	2018-12-19 14:00:00+08	Meet Dr Hisham	Buy dominos	Kajang	2018-11-30 09:25:06.797477+08	2018-11-30 09:25:06.797512+08	\N	\N
32	2018-11-30 01:28:00+08	Hello world	\N	Kajang	2018-11-30 09:28:31.359332+08	2018-11-30 09:28:31.359364+08	\N	\N
33	2018-11-30 13:30:00+08	Yellow brother	Meet	KL	2018-11-30 09:30:31.622613+08	2018-11-30 09:30:31.622643+08	\N	\N
34	2018-12-22 13:31:00+08	Meeting meeting	Bring dominos	Shah Alam	2018-11-30 09:32:12.472464+08	2018-11-30 09:32:12.992198+08	\N	45
36	2018-12-02 19:03:00+08	Meeting Hello world	\N	KL	2018-12-02 15:03:55.352195+08	2018-12-02 15:03:55.98089+08	\N	49
37	2018-12-02 08:10:00+08	Brunch with micheal	Get espresso	Paradigm Mall KJ	2018-12-02 15:11:01.897575+08	2018-12-02 15:11:02.514058+08	\N	48
43	2018-12-04 06:00:00+08	Asamara	\N	Pontian	2018-12-04 14:00:30.738607+08	2018-12-04 14:00:30.738639+08	\N	\N
44	2018-12-04 06:03:00+08	Qasta	Meet	KL	2018-12-04 14:03:32.288852+08	2018-12-04 14:03:32.288885+08	\N	\N
45	2018-12-09 17:50:00+08	Meeting with yunos	Bring dominos	Sg buloh	2018-12-09 13:51:09.049536+08	2018-12-09 13:51:11.828702+08	\N	47
46	2018-12-12 15:55:00+08	Gym	\N	Damansara	2018-12-09 22:55:48.576817+08	2018-12-09 22:55:48.57685+08	\N	\N
47	2018-12-14 14:59:00+08	Mr Razi	\N	Ampang	2018-12-09 22:59:57.377627+08	2018-12-09 22:59:57.377657+08	\N	\N
48	2018-12-18 01:30:00+08	Karen	None	Kajang	2018-12-09 23:15:35.008755+08	2018-12-09 23:40:52.742148+08	\N	57
49	2018-12-16 16:04:00+08	Man	\N	Bangi	2018-12-10 00:04:29.298771+08	2018-12-10 00:04:29.298801+08	\N	\N
50	2018-12-13 16:05:00+08	Mary Ann	Just try out	Kelana Jaya	2018-12-10 00:06:22.185521+08	2018-12-10 00:06:22.185551+08	\N	\N
51	2018-12-11 14:30:00+08	Mr chu	\N	Kajang	2018-12-10 12:57:10.096989+08	2018-12-10 12:57:10.097019+08	\N	\N
52	2018-12-12 08:44:00+08	Sabri	White coffee	Damansara	2018-12-10 14:44:21.402221+08	2018-12-10 14:44:21.402251+08	\N	\N
\.


--
-- Data for Name: apis_surcharge; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_surcharge (id, name) FROM stdin;
1	6.5
2	5
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add agency	7	add_agency
26	Can change agency	7	change_agency
27	Can delete agency	7	delete_agency
28	Can view agency	7	view_agency
29	Can add applause	8	add_applause
30	Can change applause	8	change_applause
31	Can delete applause	8	delete_applause
32	Can view applause	8	view_applause
33	Can add comment	9	add_comment
34	Can change comment	9	change_comment
35	Can delete comment	9	delete_comment
36	Can view comment	9	view_comment
37	Can add company	10	add_company
38	Can change company	10	change_company
39	Can delete company	10	delete_company
40	Can view company	10	view_company
41	Can add contact	11	add_contact
42	Can change contact	11	change_contact
43	Can delete contact	11	delete_contact
44	Can view contact	11	view_contact
45	Can add contact status	12	add_contactstatus
46	Can change contact status	12	change_contactstatus
47	Can delete contact status	12	delete_contactstatus
48	Can view contact status	12	view_contactstatus
49	Can add contact type	13	add_contacttype
50	Can change contact type	13	change_contacttype
51	Can delete contact type	13	delete_contacttype
52	Can view contact type	13	view_contacttype
53	Can add conversation	14	add_conversation
54	Can change conversation	14	change_conversation
55	Can delete conversation	14	delete_conversation
56	Can view conversation	14	view_conversation
57	Can add designation	15	add_designation
58	Can change designation	15	change_designation
59	Can delete designation	15	delete_designation
60	Can view designation	15	view_designation
61	Can add group	16	add_group
62	Can change group	16	change_group
63	Can delete group	16	delete_group
64	Can view group	16	view_group
65	Can add inbox	17	add_inbox
66	Can change inbox	17	change_inbox
67	Can delete inbox	17	delete_inbox
68	Can view inbox	17	view_inbox
69	Can add industry	18	add_industry
70	Can change industry	18	change_industry
71	Can delete industry	18	delete_industry
72	Can view industry	18	view_industry
73	Can add notification	19	add_notification
74	Can change notification	19	change_notification
75	Can delete notification	19	delete_notification
76	Can view notification	19	view_notification
77	Can add notification type	20	add_notificationtype
78	Can change notification type	20	change_notificationtype
79	Can delete notification type	20	delete_notificationtype
80	Can view notification type	20	view_notificationtype
81	Can add point	21	add_point
82	Can change point	21	change_point
83	Can delete point	21	delete_point
84	Can view point	21	view_point
85	Can add post	22	add_post
86	Can change post	22	change_post
87	Can delete post	22	delete_post
88	Can view post	22	view_post
89	Can add post type	23	add_posttype
90	Can change post type	23	change_posttype
91	Can delete post type	23	delete_posttype
92	Can view post type	23	view_posttype
93	Can add profile	24	add_profile
94	Can change profile	24	change_profile
95	Can delete profile	24	delete_profile
96	Can view profile	24	view_profile
97	Can add sales	25	add_sales
98	Can change sales	25	change_sales
99	Can delete sales	25	delete_sales
100	Can view sales	25	view_sales
101	Can add sales status	26	add_salesstatus
102	Can change sales status	26	change_salesstatus
103	Can delete sales status	26	delete_salesstatus
104	Can view sales status	26	view_salesstatus
105	Can add sales type	27	add_salestype
106	Can change sales type	27	change_salestype
107	Can delete sales type	27	delete_salestype
108	Can view sales type	27	view_salestype
109	Can add schedule	28	add_schedule
110	Can change schedule	28	change_schedule
111	Can delete schedule	28	delete_schedule
112	Can view schedule	28	view_schedule
113	Can add surcharge	29	add_surcharge
114	Can change surcharge	29	change_surcharge
115	Can delete surcharge	29	delete_surcharge
116	Can view surcharge	29	view_surcharge
117	Can add point attribute	30	add_pointattribute
118	Can change point attribute	30	change_pointattribute
119	Can delete point attribute	30	delete_pointattribute
120	Can view point attribute	30	view_pointattribute
121	Can add point field	31	add_pointfield
122	Can change point field	31	change_pointfield
123	Can delete point field	31	delete_pointfield
124	Can view point field	31	view_pointfield
125	Can add like	32	add_like
126	Can change like	32	change_like
127	Can delete like	32	delete_like
128	Can view like	32	view_like
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-13 23:59:27.271381+08	1	Public Mutual	1	[{"added": {}}]	10	1
2	2018-11-13 23:59:31.978429+08	2	CWA	1	[{"added": {}}]	10	1
3	2018-11-13 23:59:46.375683+08	1	None	1	[{"added": {}}]	12	1
4	2018-11-13 23:59:50.607873+08	2	Called	1	[{"added": {}}]	12	1
5	2018-11-13 23:59:58.986866+08	3	Appointment secured	1	[{"added": {}}]	12	1
6	2018-11-14 00:00:02.664827+08	4	Rejected	1	[{"added": {}}]	12	1
7	2018-11-14 00:00:05.919905+08	5	Client	1	[{"added": {}}]	12	1
8	2018-11-14 00:00:18.575275+08	6	Customer	1	[{"added": {}}]	12	1
9	2018-11-14 00:01:02.234046+08	7	Other	1	[{"added": {}}]	12	1
10	2018-11-14 00:01:18.394015+08	1	Referral	1	[{"added": {}}]	13	1
11	2018-11-14 00:01:22.081288+08	2	Face to face	1	[{"added": {}}]	13	1
12	2018-11-14 00:01:25.408429+08	3	Nesting	1	[{"added": {}}]	13	1
13	2018-11-14 00:01:28.66806+08	4	booth	1	[{"added": {}}]	13	1
14	2018-11-14 00:01:49.273292+08	1	Group Agency Manager	1	[{"added": {}}]	15	1
15	2018-11-14 00:01:51.860002+08	2	Agency Manager	1	[{"added": {}}]	15	1
16	2018-11-14 00:01:54.408685+08	3	Agency Supervisor	1	[{"added": {}}]	15	1
17	2018-11-14 00:01:57.439713+08	4	Unit Trust Consultant	1	[{"added": {}}]	15	1
18	2018-11-14 00:02:12.899319+08	1	Unit trust investment	1	[{"added": {}}]	18	1
19	2018-11-14 00:02:32.823854+08	1	Joining field work	1	[{"added": {}}]	20	1
20	2018-11-14 00:02:40.694652+08	2	Sales closed	1	[{"added": {}}]	20	1
21	2018-11-14 00:03:05.174717+08	3	Comment	1	[{"added": {}}]	20	1
22	2018-11-14 00:03:08.307206+08	4	Direct message	1	[{"added": {}}]	20	1
23	2018-11-14 00:03:12.352543+08	5	Applause	1	[{"added": {}}]	20	1
24	2018-11-14 00:03:49.673325+08	1	Sales closed	1	[{"added": {}}]	23	1
25	2018-11-14 00:03:53.728426+08	2	Joining field work	1	[{"added": {}}]	23	1
26	2018-11-14 00:04:31.821496+08	1	Submitted	1	[{"added": {}}]	26	1
27	2018-11-14 00:04:37.218504+08	2	Processed	1	[{"added": {}}]	26	1
28	2018-11-14 00:04:43.170697+08	3	Disbursed	1	[{"added": {}}]	26	1
29	2018-11-14 00:04:46.689593+08	4	Rejected	1	[{"added": {}}]	26	1
30	2018-11-14 00:05:03.075338+08	1	EPF	1	[{"added": {}}]	27	1
31	2018-11-14 00:05:06.520083+08	2	Cash	1	[{"added": {}}]	27	1
32	2018-11-14 00:05:10.508154+08	3	PRS	1	[{"added": {}}]	27	1
33	2018-11-14 00:05:14.480851+08	4	ASB	1	[{"added": {}}]	27	1
34	2018-11-14 00:05:17.706261+08	5	Takaful	1	[{"added": {}}]	27	1
35	2018-11-14 00:05:32.825575+08	6	Wasiat	1	[{"added": {}}]	27	1
36	2018-11-14 00:05:55.462715+08	1	6.5	1	[{"added": {}}]	29	1
37	2018-11-14 00:05:58.830613+08	2	5.0	1	[{"added": {}}]	29	1
38	2018-11-14 07:54:00.97494+08	4	hello	3		6	1
39	2018-11-14 17:19:27.642699+08	5	hello@malaon.com	3		6	1
40	2018-11-14 17:19:27.699759+08	3	hello@world.com	3		6	1
41	2018-11-14 17:19:27.702227+08	2	malaon@samdol.com	3		6	1
42	2018-11-14 18:53:41.863159+08	6	irsyadmhdilham@squalify.com	3		6	1
43	2018-11-14 18:55:03.14874+08	7	irsyadmhdilham@squalify.com	3		6	1
44	2018-11-14 18:55:53.030774+08	8	irsyadmhdilham@squalify.com	3		6	1
45	2018-11-14 18:56:45.918794+08	9	irsyadmhdilham@squalify.com	3		6	1
46	2018-11-14 19:56:45.966707+08	10	irsyadmhdilham@squalify.com	3		6	1
47	2018-11-14 19:58:49.401288+08	11	irsyadmhdilham@squalify.com	3		6	1
48	2018-11-15 12:05:07.537385+08	12	irsyadmhdilham@squalify.com	2	[{"changed": {"fields": ["first_name"]}}]	6	1
49	2018-11-15 18:51:54.839488+08	1	irsyadmhdilham@squalify.com	2	[{"changed": {"fields": ["members"]}}]	16	1
50	2018-11-19 17:36:59.786534+08	4	Booth	2	[{"changed": {"fields": ["contact_type"]}}]	13	1
51	2018-11-20 22:33:31.009873+08	15	pk 15: Irsyad Mhd Ilham	2	[{"changed": {"fields": ["schedules"]}}]	24	1
52	2018-11-20 22:33:50.922788+08	14	Akram	3		28	1
53	2018-11-20 22:33:50.92611+08	13	Akram	3		28	1
54	2018-11-20 22:33:50.928725+08	12	Akram	3		28	1
55	2018-11-20 22:33:50.932086+08	11	Akram	3		28	1
56	2018-11-20 22:33:50.934348+08	10	Akram	3		28	1
57	2018-11-20 22:33:50.93635+08	9	Akram	3		28	1
58	2018-11-20 22:33:50.938251+08	8	Hello	3		28	1
59	2018-11-20 22:33:50.939982+08	7	Hello	3		28	1
60	2018-11-20 22:33:50.941695+08	6	Hello	3		28	1
61	2018-11-20 22:33:50.943363+08	5	bangang	3		28	1
62	2018-11-20 22:33:50.945074+08	4	sds	3		28	1
63	2018-11-20 22:33:50.947808+08	3	Meeting	3		28	1
64	2018-11-20 22:33:50.950259+08	2	Appointment with Mr Irsyad	3		28	1
65	2018-11-20 22:51:03.962036+08	15	pk 15: Irsyad Mhd Ilham	2	[{"changed": {"fields": ["schedules"]}}]	24	1
66	2018-11-20 22:51:20.5801+08	20	sdsd	3		28	1
67	2018-11-20 22:51:20.583654+08	19	Akram	3		28	1
68	2018-11-20 22:51:20.585922+08	18	Akram	3		28	1
69	2018-11-20 22:51:20.589186+08	17	Akram	3		28	1
70	2018-11-20 22:51:20.591451+08	16	Akram	3		28	1
71	2018-11-20 22:51:20.593441+08	15	Akram	3		28	1
72	2018-11-22 12:04:48.210132+08	1	FTF/Booth/Nesting	1	[{"added": {}}]	31	1
73	2018-11-22 12:05:10.226765+08	2	Joining field work	1	[{"added": {}}]	31	1
74	2018-11-22 12:05:24.133657+08	3	Referrals	1	[{"added": {}}]	31	1
75	2018-11-22 12:05:50.340264+08	4	Calls/Email & Socmed	1	[{"added": {}}]	31	1
76	2018-11-22 12:05:58.429638+08	5	Appointment secured	1	[{"added": {}}]	31	1
77	2018-11-22 12:06:05.78893+08	6	Sales presentation	1	[{"added": {}}]	31	1
78	2018-11-22 12:06:13.357543+08	7	Career presentation	1	[{"added": {}}]	31	1
79	2018-11-22 12:06:20.092723+08	8	Case closed	1	[{"added": {}}]	31	1
80	2018-11-22 12:06:29.297855+08	9	Sign up contract	1	[{"added": {}}]	31	1
81	2018-11-22 12:06:46.100837+08	10	Millionnaire suit	1	[{"added": {}}]	31	1
82	2018-11-22 12:06:51.074146+08	11	Update upline	1	[{"added": {}}]	31	1
83	2018-11-22 12:07:03.808189+08	12	Servicing/follow up	1	[{"added": {}}]	31	1
84	2018-11-22 12:07:12.082452+08	13	Personal coaching	1	[{"added": {}}]	31	1
85	2018-11-22 12:07:22.521701+08	14	Be early on training	1	[{"added": {}}]	31	1
86	2018-11-22 12:07:30.237566+08	15	Agency program	1	[{"added": {}}]	31	1
87	2018-11-22 12:07:44.541669+08	12	Servicing/Follow up	2	[{"changed": {"fields": ["name"]}}]	31	1
88	2018-11-23 11:12:20.532822+08	4	Calls/Email/Socmed	2	[{"changed": {"fields": ["name"]}}]	31	1
89	2018-11-23 11:12:40.341811+08	6	Sales presentations	2	[{"changed": {"fields": ["name"]}}]	31	1
90	2018-11-23 11:13:02.77926+08	6	Sales presentation	2	[{"changed": {"fields": ["name"]}}]	31	1
91	2018-11-23 11:50:52.613649+08	44	Irsyad Mhd Ilham	3		11	1
92	2018-11-23 11:50:52.617653+08	43	Irsyad	3		11	1
93	2018-11-23 11:50:52.621549+08	42	Irsyad	3		11	1
94	2018-11-23 11:50:52.624073+08	41	Irsyad	3		11	1
95	2018-11-23 11:50:52.626087+08	40	Irsyad	3		11	1
96	2018-11-23 11:50:52.62814+08	39	Irsyad Mhd Ilham	3		11	1
97	2018-11-23 11:50:52.678979+08	38	Irsyad	3		11	1
98	2018-11-23 11:50:52.681391+08	37	Irsyad	3		11	1
99	2018-11-23 11:50:52.683912+08	36	Irsyad	3		11	1
100	2018-11-23 11:50:52.685892+08	35	Irsyad	3		11	1
101	2018-11-23 11:50:52.689443+08	34	Irsyad	3		11	1
102	2018-11-23 11:50:52.691715+08	33	Irsyad	3		11	1
103	2018-11-23 11:50:52.693563+08	32	Irsyad	3		11	1
104	2018-11-23 11:50:52.695494+08	31	Irsyad	3		11	1
105	2018-11-23 11:50:52.697316+08	30	Irsyad	3		11	1
106	2018-11-23 11:50:52.699351+08	29	Irsyad	3		11	1
107	2018-11-23 11:50:52.701976+08	28	sdasdsad	3		11	1
108	2018-11-23 11:50:52.704145+08	27	Oqasdasd	3		11	1
109	2018-11-23 11:50:52.705888+08	26	Irsyad	3		11	1
110	2018-11-23 11:50:52.707956+08	25	Irsyad	3		11	1
111	2018-11-23 11:50:52.71277+08	24	Irsyad	3		11	1
112	2018-11-23 11:50:52.714968+08	23	Irsyad	3		11	1
113	2018-11-23 11:50:52.717875+08	22	Irsyad	3		11	1
114	2018-11-23 11:50:52.719902+08	21	Irsyad	3		11	1
115	2018-11-23 11:50:52.722569+08	20	Irsyad	3		11	1
116	2018-11-23 11:50:52.726022+08	19	Iyaas	3		11	1
117	2018-11-23 11:50:52.728016+08	18	Irsyad	3		11	1
118	2018-11-23 11:50:52.729923+08	17	Irsyad	3		11	1
119	2018-11-23 11:50:52.733171+08	16	Irsyad	3		11	1
120	2018-11-23 11:50:52.735201+08	15	Irsyad	3		11	1
121	2018-11-23 11:50:52.737247+08	14	Irsyad	3		11	1
122	2018-11-23 11:50:52.739016+08	13	Irsyad	3		11	1
123	2018-11-23 11:50:52.742429+08	12	Irsyad	3		11	1
124	2018-11-23 11:50:52.744401+08	11	Irsyad	3		11	1
125	2018-11-23 11:50:52.746182+08	10	Irsyad	3		11	1
126	2018-11-23 11:50:52.750317+08	9	Irsyad	3		11	1
127	2018-11-23 11:50:52.752911+08	8	Irsyad	3		11	1
128	2018-11-23 11:50:52.754847+08	7	sdsd	3		11	1
129	2018-11-23 11:50:52.757172+08	6	Irsyad	3		11	1
130	2018-11-23 11:50:52.759717+08	5	Irsyad	3		11	1
131	2018-11-23 11:50:52.761693+08	4	hello	3		11	1
132	2018-11-23 11:50:52.764031+08	3	Mhd Ilham Mahujan	3		11	1
133	2018-11-23 11:50:52.767058+08	2	Ihsan Mhd Ilham	3		11	1
134	2018-11-23 11:50:52.769031+08	1	Iqbal	3		11	1
135	2018-11-23 11:52:21.404456+08	29	Irsyad again	3		28	1
136	2018-11-23 11:52:21.408137+08	28	Akmal Adham	3		28	1
137	2018-11-23 11:52:21.410343+08	27	Awang	3		28	1
138	2018-11-23 11:52:21.412453+08	26	Irsy	3		28	1
139	2018-11-23 11:52:21.414358+08	25	Helllo	3		28	1
140	2018-11-23 11:52:21.416234+08	24	Irsyad	3		28	1
141	2018-11-23 11:52:21.418153+08	23	Syafiq	3		28	1
142	2018-11-23 11:52:21.420399+08	22	Yazed	3		28	1
143	2018-11-23 16:20:21.462337+08	1	2018-11-23	2	[{"changed": {"fields": ["attributes", "logs"]}}]	21	1
144	2018-11-23 18:14:40.980162+08	1	FTF/Nesting/Booth	2	[{"changed": {"fields": ["name"]}}]	31	1
145	2018-11-23 18:16:53.757943+08	3	2018-11-23 10:16:01.623315+00:00: FTF/Nesting/Booth	3		30	1
146	2018-11-23 18:16:53.765523+08	2	2018-11-23 10:15:03.251359+00:00: FTF/Nesting/Booth	3		30	1
147	2018-11-23 18:29:16.664628+08	7	2018-11-23 10:28:34.541075+00:00: Joining field work	3		30	1
148	2018-11-23 18:46:28.656818+08	10	2018-11-23 10:45:59.152981+00:00: Appointment secured	3		30	1
149	2018-11-23 18:49:57.988148+08	12	2018-11-23 10:49:44.515476+00:00: Sign up contract	3		30	1
150	2018-11-23 22:53:22.421362+08	14	Be early training	2	[{"changed": {"fields": ["name"]}}]	31	1
151	2018-11-23 22:55:15.474454+08	16	2018-11-23 14:54:10.116115+00:00: Be early training	3		30	1
152	2018-11-23 23:02:37.325817+08	18	2018-11-23 15:01:59.828051+00:00: Personal coaching	3		30	1
153	2018-11-23 23:02:47.753123+08	17	2018-11-23 15:01:29.228355+00:00: Personal coaching	3		30	1
154	2018-11-23 23:05:19.990204+08	19	2018-11-23 15:04:07.402698+00:00: Personal coaching	3		30	1
155	2018-11-23 23:05:59.724178+08	21	2018-11-23 15:05:46.382609+00:00: Millionnaire suit	3		30	1
156	2018-11-23 23:05:59.72834+08	20	2018-11-23 15:05:42.280206+00:00: Millionnaire suit	3		30	1
157	2018-11-24 10:19:13.955542+08	26	2018-11-24 02:17:05.538928+00:00: Joining field work	3		30	1
158	2018-11-24 10:19:14.078365+08	25	2018-11-24 02:16:47.900183+00:00: FTF/Nesting/Booth	3		30	1
159	2018-11-24 10:19:34.078771+08	2	2018-11-24	3		21	1
160	2018-11-24 10:21:08.312668+08	27	2018-11-24 02:20:27.799380+00:00: FTF/Nesting/Booth	3		30	1
161	2018-11-24 10:21:20.886415+08	3	2018-11-24	3		21	1
162	2018-11-24 14:51:57.33519+08	36	2018-11-24 05:55:05.357272+00:00: Update upline	3		30	1
163	2018-11-24 14:51:57.368319+08	35	2018-11-24 04:28:13.617991+00:00: Millionnaire suit	3		30	1
164	2018-11-24 14:51:57.370821+08	34	2018-11-24 04:02:21.085658+00:00: Sign up contract	3		30	1
165	2018-11-24 14:51:57.372985+08	33	2018-11-24 04:02:16.932034+00:00: Career presentation	3		30	1
166	2018-11-24 14:51:57.375339+08	32	2018-11-24 04:02:18.350848+00:00: Case closed	3		30	1
167	2018-11-24 14:51:57.377277+08	31	2018-11-24 02:27:21.040466+00:00: Appointment secured	3		30	1
168	2018-11-24 14:51:57.379171+08	30	2018-11-24 02:27:19.572990+00:00: Referrals	3		30	1
169	2018-11-24 14:51:57.381018+08	29	2018-11-24 02:27:18.045030+00:00: Joining field work	3		30	1
170	2018-11-24 14:51:57.382789+08	28	2018-11-24 02:26:30.127530+00:00: FTF/Nesting/Booth	3		30	1
171	2018-11-24 14:52:15.180017+08	4	2018-11-24	3		21	1
172	2018-11-24 14:57:03.540835+08	37	2018-11-24 06:56:19.310152+00:00: FTF/Nesting/Booth	3		30	1
173	2018-11-24 15:14:47.189791+08	38	2018-11-24 07:03:48.687045+00:00: FTF/Nesting/Booth	3		30	1
174	2018-11-24 15:14:53.000272+08	5	2018-11-24	3		21	1
175	2018-11-25 11:08:40.176422+08	6	2018-11-24	2	[{"changed": {"fields": ["logs"]}}]	21	1
176	2018-11-25 11:09:29.423988+08	6	2018-11-24	2	[]	21	1
177	2018-11-25 11:11:18.471407+08	6	2018-11-24	2	[{"changed": {"fields": ["logs"]}}]	21	1
178	2018-11-25 11:26:47.496808+08	7	2018-11-25	3		21	1
179	2018-11-25 11:27:04.44559+08	47	2018-11-25 03:23:18.621195+00:00: Joining field work	3		30	1
180	2018-11-25 11:27:04.451419+08	46	2018-11-25 03:21:42.558026+00:00: Referrals	3		30	1
181	2018-11-25 11:38:30.285382+08	8	2018-11-25	2	[{"changed": {"fields": ["logs"]}}]	21	1
182	2018-11-27 09:40:16.614727+08	10	2018-11-27	3		21	1
183	2018-11-27 09:40:30.335628+08	60	2018-11-27 01:36:32.585424+00:00: Joining field work	3		30	1
184	2018-11-27 09:45:41.727638+08	61	2018-11-27 01:44:05.835711+00:00: Joining field work	3		30	1
185	2018-11-27 09:45:52.041528+08	11	2018-11-27	3		21	1
186	2018-11-27 09:47:17.255861+08	12	2018-11-27	3		21	1
187	2018-11-27 09:47:24.99764+08	62	2018-11-27 01:46:05.509732+00:00: Joining field work	3		30	1
188	2018-11-27 10:06:59.919414+08	63	2018-11-27 01:55:40.263435+00:00: Case closed	3		30	1
189	2018-11-27 10:07:07.472688+08	13	2018-11-27	3		21	1
190	2018-11-27 11:22:45.931225+08	1	sales closed	2	[{"changed": {"fields": ["name"]}}]	23	1
191	2018-11-27 11:22:52.430999+08	2	joining field work	2	[{"changed": {"fields": ["name"]}}]	23	1
192	2018-11-29 08:50:24.572321+08	1	2018-11-29 00:49:45.992065+00:00	3		9	1
193	2018-11-30 08:25:00.894422+08	5	Table to table	1	[{"added": {}}]	13	1
194	2018-12-02 14:21:21.90592+08	35	Appointment secured bro	3		28	1
195	2018-12-03 15:55:12.297059+08	13	shahboy@vve.com	1	[{"added": {}}]	6	1
196	2018-12-03 15:56:08.011016+08	13	irfan@vve.com	2	[{"changed": {"fields": ["email"]}}]	6	1
197	2018-12-03 15:57:14.602532+08	16	pk 16: Irfan Bakti	1	[{"added": {}}]	24	1
198	2018-12-03 17:03:11.860091+08	2	Irfan Bakti	1	[{"added": {}}]	16	1
199	2018-12-03 17:03:19.99999+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
200	2018-12-03 17:03:33.970996+08	1	Vision Victory Empire	2	[{"changed": {"fields": ["members"]}}]	7	1
201	2018-12-03 17:07:59.023339+08	16	16: Vision Victory Empire Irfan Bakti	2	[{"changed": {"fields": ["group"]}}]	24	1
202	2018-12-03 17:11:26.359053+08	16	16: Vision Victory Empire Irfan Bakti	2	[{"changed": {"fields": ["group"]}}]	24	1
203	2018-12-03 17:12:59.914429+08	16	16: Vision Victory Empire Irfan Bakti	2	[{"changed": {"fields": ["group"]}}]	24	1
204	2018-12-04 17:15:07.692872+08	14	afif@vve.com	1	[{"added": {}}]	6	1
205	2018-12-04 17:16:08.768932+08	17	17: Vision Victory Empire Afif	1	[{"added": {}}]	24	1
206	2018-12-04 17:17:05.713399+08	2	Irfan Baktiar	2	[{"changed": {"fields": ["members"]}}]	16	1
207	2018-12-04 17:17:27.88413+08	1	Vision Victory Empire	2	[{"changed": {"fields": ["members"]}}]	7	1
208	2018-12-04 17:33:06.960795+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
209	2018-12-04 17:37:49.648258+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
210	2018-12-04 23:06:28.077737+08	17	17: Vision Victory Empire Afif	2	[{"changed": {"fields": ["profile_image"]}}]	24	1
211	2018-12-05 09:04:50.059981+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
212	2018-12-05 09:05:00.561355+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
213	2018-12-06 11:34:59.733142+08	1	Irsyad Mhd Ilham	2	[{"changed": {"fields": ["members"]}}]	16	1
214	2018-12-08 12:12:42.122312+08	5	Like	2	[{"changed": {"fields": ["name"]}}]	20	1
215	2018-12-08 21:34:42.772525+08	7	Irfan Baktiar, posted on 2018-12-04 06:53:06.195540+00:00	3		22	1
216	2018-12-08 21:34:42.776938+08	6	Irfan Baktiar, posted on 2018-12-04 06:52:25.028749+00:00	3		22	1
217	2018-12-08 21:34:42.779534+08	5	Irfan Baktiar, posted on 2018-12-04 06:51:34.708674+00:00	3		22	1
218	2018-12-08 21:34:42.782609+08	4	Irsyad Mhd Ilham, posted on 2018-11-29 10:05:04.393309+00:00	3		22	1
219	2018-12-08 21:34:42.786365+08	3	Irsyad Mhd Ilham, posted on 2018-11-28 09:30:47.741748+00:00	3		22	1
220	2018-12-08 21:34:42.789099+08	2	Irsyad Mhd Ilham, posted on 2018-11-28 06:15:44.292465+00:00	3		22	1
221	2018-12-08 21:34:42.79214+08	1	Irsyad Mhd Ilham, posted on 2018-11-28 06:12:55.742518+00:00	3		22	1
222	2018-12-08 21:34:50.632234+08	5	2018-11-29 03:05:38.069872+00:00	3		9	1
223	2018-12-08 21:34:50.636064+08	4	2018-11-29 03:04:39.727106+00:00	3		9	1
224	2018-12-08 21:34:50.639016+08	3	2018-11-29 02:59:37.249896+00:00	3		9	1
225	2018-12-08 21:34:50.641483+08	2	2018-11-29 00:52:21.103628+00:00	3		9	1
226	2018-12-08 21:35:05.640462+08	42	2018-12-08 10:35:50.035460+00:00	3		32	1
227	2018-12-08 21:35:05.644175+08	41	2018-12-08 10:24:33.780493+00:00	3		32	1
228	2018-12-08 21:35:05.646401+08	40	2018-12-03 00:28:52.781209+00:00	3		32	1
229	2018-12-08 21:35:05.648427+08	39	2018-12-03 00:28:49.993359+00:00	3		32	1
230	2018-12-08 21:35:05.650713+08	38	2018-12-03 00:28:46.776758+00:00	3		32	1
231	2018-12-10 13:53:25.898254+08	12	cwa@cwa.com	2	[{"changed": {"fields": ["email"]}}]	6	1
232	2018-12-10 13:53:51.009131+08	12	cwa@cwa.com	2	[{"changed": {"fields": ["password"]}}]	6	1
233	2018-12-10 13:54:14.565469+08	1	Vision Victory Empire	2	[{"changed": {"fields": ["company"]}}]	7	1
234	2018-12-10 13:59:55.316825+08	15	15: Vision Victory Empire Aziz Ismail	2	[{"changed": {"fields": ["name", "profile_image"]}}]	24	1
235	2018-12-10 14:01:19.529313+08	1	Squalify Agency	2	[{"changed": {"fields": ["name"]}}]	7	1
236	2018-12-10 14:41:48.330172+08	1	Aziz Ismail	2	[{"changed": {"fields": ["members"]}}]	16	1
237	2018-12-10 14:42:41.651598+08	13	irfan@vve.com	2	[{"changed": {"fields": ["password"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	account	user
7	apis	agency
8	apis	applause
9	apis	comment
10	apis	company
11	apis	contact
12	apis	contactstatus
13	apis	contacttype
14	apis	conversation
15	apis	designation
16	apis	group
17	apis	inbox
18	apis	industry
19	apis	notification
20	apis	notificationtype
21	apis	point
22	apis	post
23	apis	posttype
24	apis	profile
25	apis	sales
26	apis	salesstatus
27	apis	salestype
28	apis	schedule
29	apis	surcharge
30	apis	pointattribute
31	apis	pointfield
32	apis	like
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-13 23:50:02.937678+08
2	contenttypes	0002_remove_content_type_name	2018-11-13 23:50:03.121125+08
3	auth	0001_initial	2018-11-13 23:50:03.47371+08
4	auth	0002_alter_permission_name_max_length	2018-11-13 23:50:03.485505+08
5	auth	0003_alter_user_email_max_length	2018-11-13 23:50:03.499245+08
6	auth	0004_alter_user_username_opts	2018-11-13 23:50:03.51301+08
7	auth	0005_alter_user_last_login_null	2018-11-13 23:50:03.526143+08
8	auth	0006_require_contenttypes_0002	2018-11-13 23:50:03.530699+08
9	auth	0007_alter_validators_add_error_messages	2018-11-13 23:50:03.543174+08
10	auth	0008_alter_user_username_max_length	2018-11-13 23:50:03.562888+08
11	auth	0009_alter_user_last_name_max_length	2018-11-13 23:50:03.576566+08
12	account	0001_initial	2018-11-13 23:50:03.671906+08
13	admin	0001_initial	2018-11-13 23:50:03.775119+08
14	admin	0002_logentry_remove_auto_add	2018-11-13 23:50:03.816171+08
15	admin	0003_logentry_add_action_flag_choices	2018-11-13 23:50:03.848963+08
16	apis	0001_initial	2018-11-13 23:50:06.618043+08
17	apis	0002_auto_20181113_1549	2018-11-13 23:50:06.689002+08
18	sessions	0001_initial	2018-11-13 23:50:06.705651+08
19	apis	0003_auto_20181113_1704	2018-11-14 01:04:23.676038+08
20	apis	0004_auto_20181114_0255	2018-11-14 11:18:20.391931+08
21	apis	0005_auto_20181114_0426	2018-11-14 12:26:50.179819+08
22	apis	0006_auto_20181114_0707	2018-11-14 15:07:29.996376+08
23	apis	0007_auto_20181114_1049	2018-11-14 18:49:53.370328+08
24	apis	0008_auto_20181114_1501	2018-11-14 23:01:45.016391+08
25	apis	0009_auto_20181115_2253	2018-11-16 06:53:30.028202+08
26	apis	0010_auto_20181115_2258	2018-11-16 06:59:00.117179+08
27	apis	0011_auto_20181119_1153	2018-11-19 19:53:56.405957+08
28	apis	0012_auto_20181119_2337	2018-11-20 07:37:41.30181+08
29	apis	0013_auto_20181120_0932	2018-11-20 17:32:58.120766+08
30	apis	0014_auto_20181122_0401	2018-11-22 12:02:06.65597+08
31	apis	0015_auto_20181122_0426	2018-11-22 12:26:15.132728+08
32	apis	0016_auto_20181122_0429	2018-11-22 12:29:18.511742+08
33	apis	0017_auto_20181122_0433	2018-11-22 12:33:29.446483+08
34	apis	0018_auto_20181123_0354	2018-11-23 11:54:07.102568+08
35	apis	0019_auto_20181123_0811	2018-11-23 16:15:04.258663+08
36	apis	0020_auto_20181125_2306	2018-11-26 07:06:06.381803+08
37	apis	0020_auto_20181125_2319	2018-11-26 07:23:07.557772+08
38	apis	0021_auto_20181126_1017	2018-11-26 18:17:29.076715+08
39	apis	0022_auto_20181128_0826	2018-11-28 16:26:19.238399+08
40	apis	0023_auto_20181129_0308	2018-11-29 11:08:54.644132+08
41	apis	0024_auto_20181130_0108	2018-11-30 09:08:38.002936+08
42	apis	0025_auto_20181203_0817	2018-12-03 16:18:18.235359+08
43	apis	0026_auto_20181203_0820	2018-12-03 16:20:57.37551+08
44	apis	0027_notification_post_rel	2018-12-08 12:29:35.287425+08
45	apis	0028_auto_20181208_1332	2018-12-08 21:33:18.525426+08
46	apis	0029_profile_fcm_token	2018-12-09 14:17:17.350295+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
u04wzebmxik0h3rl1w0psyd1cb2abim8	M2ZhYTI3YWIyYjE2MTExYjg2ZTQwZWMxYmYzN2FkYTk4MTUwZDA1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTk0OTYxNWIxZmRkYzQzMTFkZDJjMjU4Nzg2YTllYTk4MzU0ZTZjIn0=	2018-11-27 23:51:32.556776+08
n3q2p3kkquvfxjjvblj0h196h6acccbn	M2ZhYTI3YWIyYjE2MTExYjg2ZTQwZWMxYmYzN2FkYTk4MTUwZDA1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTk0OTYxNWIxZmRkYzQzMTFkZDJjMjU4Nzg2YTllYTk4MzU0ZTZjIn0=	2018-12-12 14:05:52.896691+08
337ifo1vrbmnlr0q3vij9texz03c4az7	M2ZhYTI3YWIyYjE2MTExYjg2ZTQwZWMxYmYzN2FkYTk4MTUwZDA1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmOTk0OTYxNWIxZmRkYzQzMTFkZDJjMjU4Nzg2YTllYTk4MzU0ZTZjIn0=	2018-12-24 14:42:41.664341+08
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.account_user_groups_id_seq', 1, false);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.account_user_id_seq', 14, true);


--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.account_user_user_permissions_id_seq', 1, false);


--
-- Name: apis_agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_agency_id_seq', 1, true);


--
-- Name: apis_agency_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_agency_members_id_seq', 3, true);


--
-- Name: apis_agency_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_agency_posts_id_seq', 10, true);


--
-- Name: apis_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_comment_id_seq', 10, true);


--
-- Name: apis_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_company_id_seq', 2, true);


--
-- Name: apis_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contact_id_seq', 59, true);


--
-- Name: apis_contact_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contact_schedule_id_seq', 9, true);


--
-- Name: apis_contactstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contactstatus_id_seq', 7, true);


--
-- Name: apis_contacttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contacttype_id_seq', 5, true);


--
-- Name: apis_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_conversation_id_seq', 1, false);


--
-- Name: apis_conversation_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_conversation_subscriber_id_seq', 1, false);


--
-- Name: apis_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_designation_id_seq', 4, true);


--
-- Name: apis_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_group_id_seq', 2, true);


--
-- Name: apis_group_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_group_members_id_seq', 7, true);


--
-- Name: apis_inbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_inbox_id_seq', 1, false);


--
-- Name: apis_industry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_industry_id_seq', 1, true);


--
-- Name: apis_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_like_id_seq', 44, true);


--
-- Name: apis_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_notification_id_seq', 1, false);


--
-- Name: apis_notificationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_notificationtype_id_seq', 5, true);


--
-- Name: apis_point_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_point_attributes_id_seq', 111, true);


--
-- Name: apis_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_point_id_seq', 23, true);


--
-- Name: apis_pointattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointattribute_id_seq', 116, true);


--
-- Name: apis_pointfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointfield_id_seq', 15, true);


--
-- Name: apis_post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_comments_id_seq', 9, true);


--
-- Name: apis_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_id_seq', 10, true);


--
-- Name: apis_post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_likes_id_seq', 44, true);


--
-- Name: apis_post_sales_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_sales_rel_id_seq', 6, true);


--
-- Name: apis_post_users_tagged_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_users_tagged_id_seq', 1, false);


--
-- Name: apis_posttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_posttype_id_seq', 2, true);


--
-- Name: apis_profile_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_contacts_id_seq', 59, true);


--
-- Name: apis_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_id_seq', 17, true);


--
-- Name: apis_profile_inbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_inbox_id_seq', 1, false);


--
-- Name: apis_profile_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_notifications_id_seq', 1, false);


--
-- Name: apis_profile_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_points_id_seq', 23, true);


--
-- Name: apis_profile_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_sales_id_seq', 21, true);


--
-- Name: apis_profile_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_schedules_id_seq', 51, true);


--
-- Name: apis_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_sales_id_seq', 21, true);


--
-- Name: apis_salesstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_salesstatus_id_seq', 4, true);


--
-- Name: apis_salestype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_salestype_id_seq', 6, true);


--
-- Name: apis_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_schedule_id_seq', 52, true);


--
-- Name: apis_surcharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_surcharge_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 128, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 237, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 32, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 46, true);


--
-- Name: account_user account_user_email_key; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_email_key UNIQUE (email);


--
-- Name: account_user_groups account_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups account_user_groups_user_id_group_id_4d09af3e_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_group_id_4d09af3e_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions account_user_user_permis_user_id_permission_id_48bdd28b_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permis_user_id_permission_id_48bdd28b_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions account_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: apis_agency_members apis_agency_members_agency_id_profile_id_0c633198_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_members
    ADD CONSTRAINT apis_agency_members_agency_id_profile_id_0c633198_uniq UNIQUE (agency_id, profile_id);


--
-- Name: apis_agency_members apis_agency_members_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_members
    ADD CONSTRAINT apis_agency_members_pkey PRIMARY KEY (id);


--
-- Name: apis_agency apis_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency
    ADD CONSTRAINT apis_agency_pkey PRIMARY KEY (id);


--
-- Name: apis_agency_posts apis_agency_posts_agency_id_post_id_cacc4421_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_posts
    ADD CONSTRAINT apis_agency_posts_agency_id_post_id_cacc4421_uniq UNIQUE (agency_id, post_id);


--
-- Name: apis_agency_posts apis_agency_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_posts
    ADD CONSTRAINT apis_agency_posts_pkey PRIMARY KEY (id);


--
-- Name: apis_comment apis_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_comment
    ADD CONSTRAINT apis_comment_pkey PRIMARY KEY (id);


--
-- Name: apis_company apis_company_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_company
    ADD CONSTRAINT apis_company_pkey PRIMARY KEY (id);


--
-- Name: apis_contact apis_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact
    ADD CONSTRAINT apis_contact_pkey PRIMARY KEY (id);


--
-- Name: apis_contact_schedules apis_contact_schedule_contact_id_schedule_id_a434e481_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedule_contact_id_schedule_id_a434e481_uniq UNIQUE (contact_id, schedule_id);


--
-- Name: apis_contact_schedules apis_contact_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedule_pkey PRIMARY KEY (id);


--
-- Name: apis_contactstatus apis_contactstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contactstatus
    ADD CONSTRAINT apis_contactstatus_pkey PRIMARY KEY (id);


--
-- Name: apis_contactstatus apis_contactstatus_status_key; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contactstatus
    ADD CONSTRAINT apis_contactstatus_status_key UNIQUE (status);


--
-- Name: apis_contacttype apis_contacttype_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contacttype
    ADD CONSTRAINT apis_contacttype_pkey PRIMARY KEY (id);


--
-- Name: apis_conversation apis_conversation_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation
    ADD CONSTRAINT apis_conversation_pkey PRIMARY KEY (id);


--
-- Name: apis_conversation_subscriber apis_conversation_subscr_conversation_id_profile__d465048c_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation_subscriber
    ADD CONSTRAINT apis_conversation_subscr_conversation_id_profile__d465048c_uniq UNIQUE (conversation_id, profile_id);


--
-- Name: apis_conversation_subscriber apis_conversation_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation_subscriber
    ADD CONSTRAINT apis_conversation_subscriber_pkey PRIMARY KEY (id);


--
-- Name: apis_designation apis_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_designation
    ADD CONSTRAINT apis_designation_pkey PRIMARY KEY (id);


--
-- Name: apis_group_members apis_group_members_group_id_profile_id_343aae9d_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members
    ADD CONSTRAINT apis_group_members_group_id_profile_id_343aae9d_uniq UNIQUE (group_id, profile_id);


--
-- Name: apis_group_members apis_group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members
    ADD CONSTRAINT apis_group_members_pkey PRIMARY KEY (id);


--
-- Name: apis_group apis_group_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group
    ADD CONSTRAINT apis_group_pkey PRIMARY KEY (id);


--
-- Name: apis_inbox apis_inbox_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox
    ADD CONSTRAINT apis_inbox_pkey PRIMARY KEY (id);


--
-- Name: apis_industry apis_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_industry
    ADD CONSTRAINT apis_industry_pkey PRIMARY KEY (id);


--
-- Name: apis_like apis_like_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_like
    ADD CONSTRAINT apis_like_pkey PRIMARY KEY (id);


--
-- Name: apis_notification apis_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification
    ADD CONSTRAINT apis_notification_pkey PRIMARY KEY (id);


--
-- Name: apis_notificationtype apis_notificationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notificationtype
    ADD CONSTRAINT apis_notificationtype_pkey PRIMARY KEY (id);


--
-- Name: apis_point_attributes apis_point_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_attributes
    ADD CONSTRAINT apis_point_attributes_pkey PRIMARY KEY (id);


--
-- Name: apis_point_attributes apis_point_attributes_point_id_pointattribute_id_11d1b3ed_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_attributes
    ADD CONSTRAINT apis_point_attributes_point_id_pointattribute_id_11d1b3ed_uniq UNIQUE (point_id, pointattribute_id);


--
-- Name: apis_point apis_point_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point
    ADD CONSTRAINT apis_point_pkey PRIMARY KEY (id);


--
-- Name: apis_pointattribute apis_pointattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointattribute
    ADD CONSTRAINT apis_pointattribute_pkey PRIMARY KEY (id);


--
-- Name: apis_pointfield apis_pointfield_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointfield
    ADD CONSTRAINT apis_pointfield_pkey PRIMARY KEY (id);


--
-- Name: apis_post_comments apis_post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_comments
    ADD CONSTRAINT apis_post_comments_pkey PRIMARY KEY (id);


--
-- Name: apis_post_comments apis_post_comments_post_id_comment_id_9ba078eb_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_comments
    ADD CONSTRAINT apis_post_comments_post_id_comment_id_9ba078eb_uniq UNIQUE (post_id, comment_id);


--
-- Name: apis_post_likes apis_post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_likes
    ADD CONSTRAINT apis_post_likes_pkey PRIMARY KEY (id);


--
-- Name: apis_post_likes apis_post_likes_post_id_like_id_96230b7c_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_likes
    ADD CONSTRAINT apis_post_likes_post_id_like_id_96230b7c_uniq UNIQUE (post_id, like_id);


--
-- Name: apis_post apis_post_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post
    ADD CONSTRAINT apis_post_pkey PRIMARY KEY (id);


--
-- Name: apis_post_sales_rel apis_post_sales_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_sales_rel
    ADD CONSTRAINT apis_post_sales_rel_pkey PRIMARY KEY (id);


--
-- Name: apis_post_sales_rel apis_post_sales_rel_post_id_sales_id_2e680f9a_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_sales_rel
    ADD CONSTRAINT apis_post_sales_rel_post_id_sales_id_2e680f9a_uniq UNIQUE (post_id, sales_id);


--
-- Name: apis_post_users_tagged apis_post_users_tagged_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_users_tagged
    ADD CONSTRAINT apis_post_users_tagged_pkey PRIMARY KEY (id);


--
-- Name: apis_post_users_tagged apis_post_users_tagged_post_id_profile_id_c5e0b68b_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_users_tagged
    ADD CONSTRAINT apis_post_users_tagged_post_id_profile_id_c5e0b68b_uniq UNIQUE (post_id, profile_id);


--
-- Name: apis_posttype apis_posttype_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_posttype
    ADD CONSTRAINT apis_posttype_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_contacts apis_profile_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_contacts
    ADD CONSTRAINT apis_profile_contacts_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_contacts apis_profile_contacts_profile_id_contact_id_222feb58_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_contacts
    ADD CONSTRAINT apis_profile_contacts_profile_id_contact_id_222feb58_uniq UNIQUE (profile_id, contact_id);


--
-- Name: apis_profile_inbox apis_profile_inbox_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_inbox
    ADD CONSTRAINT apis_profile_inbox_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_inbox apis_profile_inbox_profile_id_inbox_id_5249d3a6_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_inbox
    ADD CONSTRAINT apis_profile_inbox_profile_id_inbox_id_5249d3a6_uniq UNIQUE (profile_id, inbox_id);


--
-- Name: apis_profile_notifications apis_profile_notificatio_profile_id_notification__0eeaf46a_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_notifications
    ADD CONSTRAINT apis_profile_notificatio_profile_id_notification__0eeaf46a_uniq UNIQUE (profile_id, notification_id);


--
-- Name: apis_profile_notifications apis_profile_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_notifications
    ADD CONSTRAINT apis_profile_notifications_pkey PRIMARY KEY (id);


--
-- Name: apis_profile apis_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_points apis_profile_points_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_points
    ADD CONSTRAINT apis_profile_points_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_points apis_profile_points_profile_id_point_id_630caf47_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_points
    ADD CONSTRAINT apis_profile_points_profile_id_point_id_630caf47_uniq UNIQUE (profile_id, point_id);


--
-- Name: apis_profile_sales apis_profile_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_sales
    ADD CONSTRAINT apis_profile_sales_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_sales apis_profile_sales_profile_id_sales_id_dee75880_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_sales
    ADD CONSTRAINT apis_profile_sales_profile_id_sales_id_dee75880_uniq UNIQUE (profile_id, sales_id);


--
-- Name: apis_profile_schedules apis_profile_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_schedules
    ADD CONSTRAINT apis_profile_schedules_pkey PRIMARY KEY (id);


--
-- Name: apis_profile_schedules apis_profile_schedules_profile_id_schedule_id_6962fd95_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_schedules
    ADD CONSTRAINT apis_profile_schedules_profile_id_schedule_id_6962fd95_uniq UNIQUE (profile_id, schedule_id);


--
-- Name: apis_sales apis_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_pkey PRIMARY KEY (id);


--
-- Name: apis_salesstatus apis_salesstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salesstatus
    ADD CONSTRAINT apis_salesstatus_pkey PRIMARY KEY (id);


--
-- Name: apis_salesstatus apis_salesstatus_sales_status_key; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salesstatus
    ADD CONSTRAINT apis_salesstatus_sales_status_key UNIQUE (name);


--
-- Name: apis_salestype apis_salestype_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salestype
    ADD CONSTRAINT apis_salestype_pkey PRIMARY KEY (id);


--
-- Name: apis_schedule apis_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_schedule
    ADD CONSTRAINT apis_schedule_pkey PRIMARY KEY (id);


--
-- Name: apis_surcharge apis_surcharge_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_surcharge
    ADD CONSTRAINT apis_surcharge_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: account_user_email_0bd7c421_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX account_user_email_0bd7c421_like ON public.account_user USING btree (email varchar_pattern_ops);


--
-- Name: account_user_groups_group_id_6c71f749; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX account_user_groups_group_id_6c71f749 ON public.account_user_groups USING btree (group_id);


--
-- Name: account_user_groups_user_id_14345e7b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX account_user_groups_user_id_14345e7b ON public.account_user_groups USING btree (user_id);


--
-- Name: account_user_user_permissions_permission_id_66c44191; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX account_user_user_permissions_permission_id_66c44191 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: account_user_user_permissions_user_id_cc42d270; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX account_user_user_permissions_user_id_cc42d270 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: apis_agency_company_id_8ad7200a; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_company_id_8ad7200a ON public.apis_agency USING btree (company_id);


--
-- Name: apis_agency_industry_id_752d3e34; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_industry_id_752d3e34 ON public.apis_agency USING btree (industry_id);


--
-- Name: apis_agency_members_agency_id_5424583a; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_members_agency_id_5424583a ON public.apis_agency_members USING btree (agency_id);


--
-- Name: apis_agency_members_profile_id_c81254e8; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_members_profile_id_c81254e8 ON public.apis_agency_members USING btree (profile_id);


--
-- Name: apis_agency_owner_id_016a6889; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_owner_id_016a6889 ON public.apis_agency USING btree (owner_id);


--
-- Name: apis_agency_posts_agency_id_867d472c; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_posts_agency_id_867d472c ON public.apis_agency_posts USING btree (agency_id);


--
-- Name: apis_agency_posts_post_id_52dfab18; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_agency_posts_post_id_52dfab18 ON public.apis_agency_posts USING btree (post_id);


--
-- Name: apis_comment_commented_by_id_48622e67; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_comment_commented_by_id_48622e67 ON public.apis_comment USING btree (commented_by_id);


--
-- Name: apis_contact_contact_type_id_58bb67ab; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_contact_type_id_58bb67ab ON public.apis_contact USING btree (contact_type_id);


--
-- Name: apis_contact_referrer_id_4516a6cd; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_referrer_id_4516a6cd ON public.apis_contact USING btree (referrer_id);


--
-- Name: apis_contact_schedule_contact_id_e04f1785; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_schedule_contact_id_e04f1785 ON public.apis_contact_schedules USING btree (contact_id);


--
-- Name: apis_contact_schedule_schedule_id_cc74735c; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_schedule_schedule_id_cc74735c ON public.apis_contact_schedules USING btree (schedule_id);


--
-- Name: apis_contact_status_id_e220e489; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_status_id_e220e489 ON public.apis_contact USING btree (status_id);


--
-- Name: apis_contact_status_id_e220e489_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_status_id_e220e489_like ON public.apis_contact USING btree (status_id varchar_pattern_ops);


--
-- Name: apis_contactstatus_status_2fc12b88_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contactstatus_status_2fc12b88_like ON public.apis_contactstatus USING btree (status varchar_pattern_ops);


--
-- Name: apis_conversation_subscriber_conversation_id_d17e4f4f; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_conversation_subscriber_conversation_id_d17e4f4f ON public.apis_conversation_subscriber USING btree (conversation_id);


--
-- Name: apis_conversation_subscriber_profile_id_29fa3e12; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_conversation_subscriber_profile_id_29fa3e12 ON public.apis_conversation_subscriber USING btree (profile_id);


--
-- Name: apis_group_members_group_id_ee819d28; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_group_members_group_id_ee819d28 ON public.apis_group_members USING btree (group_id);


--
-- Name: apis_group_members_profile_id_32261f0f; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_group_members_profile_id_32261f0f ON public.apis_group_members USING btree (profile_id);


--
-- Name: apis_group_owner_id_44b25c10; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_group_owner_id_44b25c10 ON public.apis_group USING btree (owner_id);


--
-- Name: apis_inbox_conversation_id_beed7a3c; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_conversation_id_beed7a3c ON public.apis_inbox USING btree (conversation_id);


--
-- Name: apis_inbox_sender_id_f7ac6d88; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_sender_id_f7ac6d88 ON public.apis_inbox USING btree (sender_id);


--
-- Name: apis_like_likers_id_6becaf55; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_like_likers_id_6becaf55 ON public.apis_like USING btree (liker_id);


--
-- Name: apis_notification_notification_type_id_b85c6168; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_notification_notification_type_id_b85c6168 ON public.apis_notification USING btree (notification_type_id);


--
-- Name: apis_notification_notified_by_id_ec6c08f6; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_notification_notified_by_id_ec6c08f6 ON public.apis_notification USING btree (notified_by_id);


--
-- Name: apis_notification_post_rel_id_5cd2b624; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_notification_post_rel_id_5cd2b624 ON public.apis_notification USING btree (post_rel_id);


--
-- Name: apis_point_attributes_point_id_658d9313; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_point_attributes_point_id_658d9313 ON public.apis_point_attributes USING btree (point_id);


--
-- Name: apis_point_attributes_pointattribute_id_b5c01253; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_point_attributes_pointattribute_id_b5c01253 ON public.apis_point_attributes USING btree (pointattribute_id);


--
-- Name: apis_pointattribute_field_id_38e78352; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_pointattribute_field_id_38e78352 ON public.apis_pointattribute USING btree (attribute_id);


--
-- Name: apis_post_comments_comment_id_4ac6beb1; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_comments_comment_id_4ac6beb1 ON public.apis_post_comments USING btree (comment_id);


--
-- Name: apis_post_comments_post_id_d644be5b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_comments_post_id_d644be5b ON public.apis_post_comments USING btree (post_id);


--
-- Name: apis_post_contact_relation_id_520caf94; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_contact_relation_id_520caf94 ON public.apis_post USING btree (contact_rel_id);


--
-- Name: apis_post_likes_like_id_82f195f3; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_likes_like_id_82f195f3 ON public.apis_post_likes USING btree (like_id);


--
-- Name: apis_post_likes_post_id_839b77bf; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_likes_post_id_839b77bf ON public.apis_post_likes USING btree (post_id);


--
-- Name: apis_post_post_type_id_f670c7f2; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_post_type_id_f670c7f2 ON public.apis_post USING btree (post_type_id);


--
-- Name: apis_post_posted_by_id_ea0a85a8; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_posted_by_id_ea0a85a8 ON public.apis_post USING btree (posted_by_id);


--
-- Name: apis_post_sales_rel_post_id_c7448174; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_sales_rel_post_id_c7448174 ON public.apis_post_sales_rel USING btree (post_id);


--
-- Name: apis_post_sales_rel_sales_id_c80cf50e; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_sales_rel_sales_id_c80cf50e ON public.apis_post_sales_rel USING btree (sales_id);


--
-- Name: apis_post_users_tagged_post_id_ba8acfdc; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_users_tagged_post_id_ba8acfdc ON public.apis_post_users_tagged USING btree (post_id);


--
-- Name: apis_post_users_tagged_profile_id_f3ffb38b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_users_tagged_profile_id_f3ffb38b ON public.apis_post_users_tagged USING btree (profile_id);


--
-- Name: apis_profile_agency_id_ae8aaf65; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_agency_id_ae8aaf65 ON public.apis_profile USING btree (agency_id);


--
-- Name: apis_profile_contacts_contact_id_ca870159; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_contacts_contact_id_ca870159 ON public.apis_profile_contacts USING btree (contact_id);


--
-- Name: apis_profile_contacts_profile_id_b185bd92; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_contacts_profile_id_b185bd92 ON public.apis_profile_contacts USING btree (profile_id);


--
-- Name: apis_profile_designation_id_d8ff8ef1; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_designation_id_d8ff8ef1 ON public.apis_profile USING btree (designation_id);


--
-- Name: apis_profile_group_id_a9ccc7d1; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_group_id_a9ccc7d1 ON public.apis_profile USING btree (group_id);


--
-- Name: apis_profile_inbox_inbox_id_b9943b2c; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_inbox_inbox_id_b9943b2c ON public.apis_profile_inbox USING btree (inbox_id);


--
-- Name: apis_profile_inbox_profile_id_d2375b8a; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_inbox_profile_id_d2375b8a ON public.apis_profile_inbox USING btree (profile_id);


--
-- Name: apis_profile_notifications_notification_id_0cef283e; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_notifications_notification_id_0cef283e ON public.apis_profile_notifications USING btree (notification_id);


--
-- Name: apis_profile_notifications_profile_id_c8f009a2; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_notifications_profile_id_c8f009a2 ON public.apis_profile_notifications USING btree (profile_id);


--
-- Name: apis_profile_points_point_id_0a978019; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_points_point_id_0a978019 ON public.apis_profile_points USING btree (point_id);


--
-- Name: apis_profile_points_profile_id_ecb7a7d2; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_points_profile_id_ecb7a7d2 ON public.apis_profile_points USING btree (profile_id);


--
-- Name: apis_profile_sales_profile_id_98928042; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_sales_profile_id_98928042 ON public.apis_profile_sales USING btree (profile_id);


--
-- Name: apis_profile_sales_sales_id_74881905; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_sales_sales_id_74881905 ON public.apis_profile_sales USING btree (sales_id);


--
-- Name: apis_profile_schedules_profile_id_fa4aa3da; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_schedules_profile_id_fa4aa3da ON public.apis_profile_schedules USING btree (profile_id);


--
-- Name: apis_profile_schedules_schedule_id_0179a6b9; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_schedules_schedule_id_0179a6b9 ON public.apis_profile_schedules USING btree (schedule_id);


--
-- Name: apis_profile_upline_id_dd0402d3; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_upline_id_dd0402d3 ON public.apis_profile USING btree (upline_id);


--
-- Name: apis_profile_user_id_3bc2d6e9; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_profile_user_id_3bc2d6e9 ON public.apis_profile USING btree (user_id);


--
-- Name: apis_sales_contact_id_c504e91c; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_sales_contact_id_c504e91c ON public.apis_sales USING btree (contact_id);


--
-- Name: apis_sales_sales_status_id_03600a56; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_sales_sales_status_id_03600a56 ON public.apis_sales USING btree (sales_status_id);


--
-- Name: apis_sales_sales_status_id_03600a56_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_sales_sales_status_id_03600a56_like ON public.apis_sales USING btree (sales_status_id varchar_pattern_ops);


--
-- Name: apis_sales_sales_type_id_05c42216; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_sales_sales_type_id_05c42216 ON public.apis_sales USING btree (sales_type_id);


--
-- Name: apis_sales_surcharge_id_a0745407; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_sales_surcharge_id_a0745407 ON public.apis_sales USING btree (surcharge_id);


--
-- Name: apis_salesstatus_sales_status_7192711c_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_salesstatus_sales_status_7192711c_like ON public.apis_salesstatus USING btree (name varchar_pattern_ops);


--
-- Name: apis_schedule_contact_id_94ba1054; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_schedule_contact_id_94ba1054 ON public.apis_schedule USING btree (contact_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: account_user_groups account_user_groups_group_id_6c71f749_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_group_id_6c71f749_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_user_id_14345e7b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_14345e7b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_permission_id_66c44191_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_permission_id_66c44191_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_user_id_cc42d270_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_user_id_cc42d270_fk_account_u FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency apis_agency_company_id_8ad7200a_fk_apis_company_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency
    ADD CONSTRAINT apis_agency_company_id_8ad7200a_fk_apis_company_id FOREIGN KEY (company_id) REFERENCES public.apis_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency apis_agency_industry_id_752d3e34_fk_apis_industry_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency
    ADD CONSTRAINT apis_agency_industry_id_752d3e34_fk_apis_industry_id FOREIGN KEY (industry_id) REFERENCES public.apis_industry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency_members apis_agency_members_agency_id_5424583a_fk_apis_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_members
    ADD CONSTRAINT apis_agency_members_agency_id_5424583a_fk_apis_agency_id FOREIGN KEY (agency_id) REFERENCES public.apis_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency_members apis_agency_members_profile_id_c81254e8_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_members
    ADD CONSTRAINT apis_agency_members_profile_id_c81254e8_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency apis_agency_owner_id_016a6889_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency
    ADD CONSTRAINT apis_agency_owner_id_016a6889_fk_apis_profile_id FOREIGN KEY (owner_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency_posts apis_agency_posts_agency_id_867d472c_fk_apis_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_posts
    ADD CONSTRAINT apis_agency_posts_agency_id_867d472c_fk_apis_agency_id FOREIGN KEY (agency_id) REFERENCES public.apis_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_agency_posts apis_agency_posts_post_id_52dfab18_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_agency_posts
    ADD CONSTRAINT apis_agency_posts_post_id_52dfab18_fk_apis_post_id FOREIGN KEY (post_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_comment apis_comment_commented_by_id_48622e67_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_comment
    ADD CONSTRAINT apis_comment_commented_by_id_48622e67_fk_apis_profile_id FOREIGN KEY (commented_by_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_contact apis_contact_contact_type_id_58bb67ab_fk_apis_contacttype_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact
    ADD CONSTRAINT apis_contact_contact_type_id_58bb67ab_fk_apis_contacttype_id FOREIGN KEY (contact_type_id) REFERENCES public.apis_contacttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_contact apis_contact_referrer_id_4516a6cd_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact
    ADD CONSTRAINT apis_contact_referrer_id_4516a6cd_fk_apis_contact_id FOREIGN KEY (referrer_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_contact_schedules apis_contact_schedules_contact_id_b948e9d7_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedules_contact_id_b948e9d7_fk_apis_contact_id FOREIGN KEY (contact_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_contact_schedules apis_contact_schedules_schedule_id_7cd7e2c4_fk_apis_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedules_schedule_id_7cd7e2c4_fk_apis_schedule_id FOREIGN KEY (schedule_id) REFERENCES public.apis_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_contact apis_contact_status_id_e220e489_fk_apis_contactstatus_status; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact
    ADD CONSTRAINT apis_contact_status_id_e220e489_fk_apis_contactstatus_status FOREIGN KEY (status_id) REFERENCES public.apis_contactstatus(status) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_conversation_subscriber apis_conversation_su_conversation_id_d17e4f4f_fk_apis_conv; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation_subscriber
    ADD CONSTRAINT apis_conversation_su_conversation_id_d17e4f4f_fk_apis_conv FOREIGN KEY (conversation_id) REFERENCES public.apis_conversation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_conversation_subscriber apis_conversation_su_profile_id_29fa3e12_fk_apis_prof; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_conversation_subscriber
    ADD CONSTRAINT apis_conversation_su_profile_id_29fa3e12_fk_apis_prof FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_group_members apis_group_members_group_id_ee819d28_fk_apis_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members
    ADD CONSTRAINT apis_group_members_group_id_ee819d28_fk_apis_group_id FOREIGN KEY (group_id) REFERENCES public.apis_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_group_members apis_group_members_profile_id_32261f0f_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members
    ADD CONSTRAINT apis_group_members_profile_id_32261f0f_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_group apis_group_owner_id_44b25c10_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group
    ADD CONSTRAINT apis_group_owner_id_44b25c10_fk_apis_profile_id FOREIGN KEY (owner_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox apis_inbox_conversation_id_beed7a3c_fk_apis_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox
    ADD CONSTRAINT apis_inbox_conversation_id_beed7a3c_fk_apis_conversation_id FOREIGN KEY (conversation_id) REFERENCES public.apis_conversation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox apis_inbox_sender_id_f7ac6d88_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox
    ADD CONSTRAINT apis_inbox_sender_id_f7ac6d88_fk_apis_profile_id FOREIGN KEY (sender_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_like apis_like_liker_id_43520600_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_like
    ADD CONSTRAINT apis_like_liker_id_43520600_fk_apis_profile_id FOREIGN KEY (liker_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_notification apis_notification_notification_type_id_b85c6168_fk_apis_noti; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification
    ADD CONSTRAINT apis_notification_notification_type_id_b85c6168_fk_apis_noti FOREIGN KEY (notification_type_id) REFERENCES public.apis_notificationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_notification apis_notification_notified_by_id_ec6c08f6_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification
    ADD CONSTRAINT apis_notification_notified_by_id_ec6c08f6_fk_apis_profile_id FOREIGN KEY (notified_by_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_notification apis_notification_post_rel_id_5cd2b624_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification
    ADD CONSTRAINT apis_notification_post_rel_id_5cd2b624_fk_apis_post_id FOREIGN KEY (post_rel_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_point_attributes apis_point_attribute_pointattribute_id_b5c01253_fk_apis_poin; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_attributes
    ADD CONSTRAINT apis_point_attribute_pointattribute_id_b5c01253_fk_apis_poin FOREIGN KEY (pointattribute_id) REFERENCES public.apis_pointattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_point_attributes apis_point_attributes_point_id_658d9313_fk_apis_point_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_attributes
    ADD CONSTRAINT apis_point_attributes_point_id_658d9313_fk_apis_point_id FOREIGN KEY (point_id) REFERENCES public.apis_point(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_pointattribute apis_pointattribute_attribute_id_68a88a17_fk_apis_pointfield_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointattribute
    ADD CONSTRAINT apis_pointattribute_attribute_id_68a88a17_fk_apis_pointfield_id FOREIGN KEY (attribute_id) REFERENCES public.apis_pointfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_comments apis_post_comments_comment_id_4ac6beb1_fk_apis_comment_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_comments
    ADD CONSTRAINT apis_post_comments_comment_id_4ac6beb1_fk_apis_comment_id FOREIGN KEY (comment_id) REFERENCES public.apis_comment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_comments apis_post_comments_post_id_d644be5b_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_comments
    ADD CONSTRAINT apis_post_comments_post_id_d644be5b_fk_apis_post_id FOREIGN KEY (post_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post apis_post_contact_rel_id_0d8911ab_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post
    ADD CONSTRAINT apis_post_contact_rel_id_0d8911ab_fk_apis_contact_id FOREIGN KEY (contact_rel_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_likes apis_post_likes_like_id_82f195f3_fk_apis_like_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_likes
    ADD CONSTRAINT apis_post_likes_like_id_82f195f3_fk_apis_like_id FOREIGN KEY (like_id) REFERENCES public.apis_like(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_likes apis_post_likes_post_id_839b77bf_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_likes
    ADD CONSTRAINT apis_post_likes_post_id_839b77bf_fk_apis_post_id FOREIGN KEY (post_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post apis_post_post_type_id_f670c7f2_fk_apis_posttype_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post
    ADD CONSTRAINT apis_post_post_type_id_f670c7f2_fk_apis_posttype_id FOREIGN KEY (post_type_id) REFERENCES public.apis_posttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post apis_post_posted_by_id_ea0a85a8_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post
    ADD CONSTRAINT apis_post_posted_by_id_ea0a85a8_fk_apis_profile_id FOREIGN KEY (posted_by_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_sales_rel apis_post_sales_rel_post_id_c7448174_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_sales_rel
    ADD CONSTRAINT apis_post_sales_rel_post_id_c7448174_fk_apis_post_id FOREIGN KEY (post_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_sales_rel apis_post_sales_rel_sales_id_c80cf50e_fk_apis_sales_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_sales_rel
    ADD CONSTRAINT apis_post_sales_rel_sales_id_c80cf50e_fk_apis_sales_id FOREIGN KEY (sales_id) REFERENCES public.apis_sales(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_users_tagged apis_post_users_tagged_post_id_ba8acfdc_fk_apis_post_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_users_tagged
    ADD CONSTRAINT apis_post_users_tagged_post_id_ba8acfdc_fk_apis_post_id FOREIGN KEY (post_id) REFERENCES public.apis_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_post_users_tagged apis_post_users_tagged_profile_id_f3ffb38b_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_post_users_tagged
    ADD CONSTRAINT apis_post_users_tagged_profile_id_f3ffb38b_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile apis_profile_agency_id_ae8aaf65_fk_apis_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_agency_id_ae8aaf65_fk_apis_agency_id FOREIGN KEY (agency_id) REFERENCES public.apis_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_contacts apis_profile_contacts_contact_id_ca870159_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_contacts
    ADD CONSTRAINT apis_profile_contacts_contact_id_ca870159_fk_apis_contact_id FOREIGN KEY (contact_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_contacts apis_profile_contacts_profile_id_b185bd92_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_contacts
    ADD CONSTRAINT apis_profile_contacts_profile_id_b185bd92_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile apis_profile_designation_id_d8ff8ef1_fk_apis_designation_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_designation_id_d8ff8ef1_fk_apis_designation_id FOREIGN KEY (designation_id) REFERENCES public.apis_designation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile apis_profile_group_id_a9ccc7d1_fk_apis_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_group_id_a9ccc7d1_fk_apis_group_id FOREIGN KEY (group_id) REFERENCES public.apis_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_inbox apis_profile_inbox_inbox_id_b9943b2c_fk_apis_inbox_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_inbox
    ADD CONSTRAINT apis_profile_inbox_inbox_id_b9943b2c_fk_apis_inbox_id FOREIGN KEY (inbox_id) REFERENCES public.apis_inbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_inbox apis_profile_inbox_profile_id_d2375b8a_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_inbox
    ADD CONSTRAINT apis_profile_inbox_profile_id_d2375b8a_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_notifications apis_profile_notific_notification_id_0cef283e_fk_apis_noti; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_notifications
    ADD CONSTRAINT apis_profile_notific_notification_id_0cef283e_fk_apis_noti FOREIGN KEY (notification_id) REFERENCES public.apis_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_notifications apis_profile_notific_profile_id_c8f009a2_fk_apis_prof; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_notifications
    ADD CONSTRAINT apis_profile_notific_profile_id_c8f009a2_fk_apis_prof FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_points apis_profile_points_point_id_0a978019_fk_apis_point_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_points
    ADD CONSTRAINT apis_profile_points_point_id_0a978019_fk_apis_point_id FOREIGN KEY (point_id) REFERENCES public.apis_point(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_points apis_profile_points_profile_id_ecb7a7d2_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_points
    ADD CONSTRAINT apis_profile_points_profile_id_ecb7a7d2_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_sales apis_profile_sales_profile_id_98928042_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_sales
    ADD CONSTRAINT apis_profile_sales_profile_id_98928042_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_sales apis_profile_sales_sales_id_74881905_fk_apis_sales_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_sales
    ADD CONSTRAINT apis_profile_sales_sales_id_74881905_fk_apis_sales_id FOREIGN KEY (sales_id) REFERENCES public.apis_sales(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_schedules apis_profile_schedules_profile_id_fa4aa3da_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_schedules
    ADD CONSTRAINT apis_profile_schedules_profile_id_fa4aa3da_fk_apis_profile_id FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile_schedules apis_profile_schedules_schedule_id_0179a6b9_fk_apis_schedule_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile_schedules
    ADD CONSTRAINT apis_profile_schedules_schedule_id_0179a6b9_fk_apis_schedule_id FOREIGN KEY (schedule_id) REFERENCES public.apis_schedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile apis_profile_upline_id_dd0402d3_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_upline_id_dd0402d3_fk_apis_profile_id FOREIGN KEY (upline_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_profile apis_profile_user_id_3bc2d6e9_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_profile
    ADD CONSTRAINT apis_profile_user_id_3bc2d6e9_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_sales apis_sales_contact_id_c504e91c_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_contact_id_c504e91c_fk_apis_contact_id FOREIGN KEY (contact_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_sales apis_sales_sales_status_id_03600a56_fk_apis_sale; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_sales_status_id_03600a56_fk_apis_sale FOREIGN KEY (sales_status_id) REFERENCES public.apis_salesstatus(name) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_sales apis_sales_sales_type_id_05c42216_fk_apis_salestype_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_sales_type_id_05c42216_fk_apis_salestype_id FOREIGN KEY (sales_type_id) REFERENCES public.apis_salestype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_sales apis_sales_surcharge_id_a0745407_fk_apis_surcharge_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_surcharge_id_a0745407_fk_apis_surcharge_id FOREIGN KEY (surcharge_id) REFERENCES public.apis_surcharge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_schedule apis_schedule_contact_id_94ba1054_fk_apis_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_schedule
    ADD CONSTRAINT apis_schedule_contact_id_94ba1054_fk_apis_contact_id FOREIGN KEY (contact_id) REFERENCES public.apis_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

