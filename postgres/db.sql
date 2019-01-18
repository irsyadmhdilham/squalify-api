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
    owner_id integer
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
-- Name: apis_chatmessage; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_chatmessage (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    text text NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.apis_chatmessage OWNER TO irsyadmhdilham;

--
-- Name: apis_chatmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_chatmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_chatmessage_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_chatmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_chatmessage_id_seq OWNED BY public.apis_chatmessage.id;


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
    referrer_id integer,
    status_id character varying(30) NOT NULL
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
-- Name: apis_contact_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_contact_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_contact_schedules_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_contact_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_contact_schedules_id_seq OWNED BY public.apis_contact_schedules.id;


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
-- Name: apis_googleapi; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_googleapi (
    id integer NOT NULL,
    access_token text,
    token_expiry timestamp with time zone
);


ALTER TABLE public.apis_googleapi OWNER TO irsyadmhdilham;

--
-- Name: apis_googleapi_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_googleapi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_googleapi_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_googleapi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_googleapi_id_seq OWNED BY public.apis_googleapi.id;


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
-- Name: apis_groupchat; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_groupchat (
    id integer NOT NULL,
    owner_id integer,
    role_id integer NOT NULL
);


ALTER TABLE public.apis_groupchat OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_groupchat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_groupchat_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_groupchat_id_seq OWNED BY public.apis_groupchat.id;


--
-- Name: apis_groupchat_messages; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_groupchat_messages (
    id integer NOT NULL,
    groupchat_id integer NOT NULL,
    chatmessage_id integer NOT NULL
);


ALTER TABLE public.apis_groupchat_messages OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_groupchat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_groupchat_messages_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_groupchat_messages_id_seq OWNED BY public.apis_groupchat_messages.id;


--
-- Name: apis_groupchat_participants; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_groupchat_participants (
    id integer NOT NULL,
    groupchat_id integer NOT NULL,
    profile_id integer NOT NULL
);


ALTER TABLE public.apis_groupchat_participants OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_groupchat_participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_groupchat_participants_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchat_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_groupchat_participants_id_seq OWNED BY public.apis_groupchat_participants.id;


--
-- Name: apis_groupchatrole; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_groupchatrole (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.apis_groupchatrole OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchatrole_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_groupchatrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_groupchatrole_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_groupchatrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_groupchatrole_id_seq OWNED BY public.apis_groupchatrole.id;


--
-- Name: apis_inbox; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_inbox (
    id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    chat_with_id integer,
    unread integer NOT NULL,
    group_chat_id integer
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
-- Name: apis_inbox_messages; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_inbox_messages (
    id integer NOT NULL,
    inbox_id integer NOT NULL,
    chatmessage_id integer NOT NULL
);


ALTER TABLE public.apis_inbox_messages OWNER TO irsyadmhdilham;

--
-- Name: apis_inbox_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_inbox_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_inbox_messages_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_inbox_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_inbox_messages_id_seq OWNED BY public.apis_inbox_messages.id;


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
    post_rel_id integer,
    read boolean NOT NULL,
    inbox_rel_id integer,
    seen boolean NOT NULL
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
    date date NOT NULL
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
-- Name: apis_point_logs; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_point_logs (
    id integer NOT NULL,
    point_id integer NOT NULL,
    pointlog_id integer NOT NULL
);


ALTER TABLE public.apis_point_logs OWNER TO irsyadmhdilham;

--
-- Name: apis_point_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_point_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_point_logs_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_point_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_point_logs_id_seq OWNED BY public.apis_point_logs.id;


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
-- Name: apis_pointlog; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_pointlog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    point integer NOT NULL,
    attribute_id integer NOT NULL,
    point_type_id integer NOT NULL
);


ALTER TABLE public.apis_pointlog OWNER TO irsyadmhdilham;

--
-- Name: apis_pointlog_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_pointlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_pointlog_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_pointlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_pointlog_id_seq OWNED BY public.apis_pointlog.id;


--
-- Name: apis_pointlogtype; Type: TABLE; Schema: public; Owner: irsyadmhdilham
--

CREATE TABLE public.apis_pointlogtype (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.apis_pointlogtype OWNER TO irsyadmhdilham;

--
-- Name: apis_pointlogtype_id_seq; Type: SEQUENCE; Schema: public; Owner: irsyadmhdilham
--

CREATE SEQUENCE public.apis_pointlogtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apis_pointlogtype_id_seq OWNER TO irsyadmhdilham;

--
-- Name: apis_pointlogtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: irsyadmhdilham
--

ALTER SEQUENCE public.apis_pointlogtype_id_seq OWNED BY public.apis_pointlogtype.id;


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
    fcm_token text,
    agency_id integer,
    designation_id integer NOT NULL,
    group_id integer,
    upline_id integer,
    user_id integer NOT NULL
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
    repeat_sales boolean NOT NULL,
    contact_id integer,
    sales_status_id character varying(30) NOT NULL,
    sales_type_id integer NOT NULL,
    surcharge_id integer
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
-- Name: apis_chatmessage id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_chatmessage ALTER COLUMN id SET DEFAULT nextval('public.apis_chatmessage_id_seq'::regclass);


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

ALTER TABLE ONLY public.apis_contact_schedules ALTER COLUMN id SET DEFAULT nextval('public.apis_contact_schedules_id_seq'::regclass);


--
-- Name: apis_contactstatus id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contactstatus ALTER COLUMN id SET DEFAULT nextval('public.apis_contactstatus_id_seq'::regclass);


--
-- Name: apis_contacttype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contacttype ALTER COLUMN id SET DEFAULT nextval('public.apis_contacttype_id_seq'::regclass);


--
-- Name: apis_designation id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_designation ALTER COLUMN id SET DEFAULT nextval('public.apis_designation_id_seq'::regclass);


--
-- Name: apis_googleapi id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_googleapi ALTER COLUMN id SET DEFAULT nextval('public.apis_googleapi_id_seq'::regclass);


--
-- Name: apis_group id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group ALTER COLUMN id SET DEFAULT nextval('public.apis_group_id_seq'::regclass);


--
-- Name: apis_group_members id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_group_members ALTER COLUMN id SET DEFAULT nextval('public.apis_group_members_id_seq'::regclass);


--
-- Name: apis_groupchat id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat ALTER COLUMN id SET DEFAULT nextval('public.apis_groupchat_id_seq'::regclass);


--
-- Name: apis_groupchat_messages id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_messages ALTER COLUMN id SET DEFAULT nextval('public.apis_groupchat_messages_id_seq'::regclass);


--
-- Name: apis_groupchat_participants id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_participants ALTER COLUMN id SET DEFAULT nextval('public.apis_groupchat_participants_id_seq'::regclass);


--
-- Name: apis_groupchatrole id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchatrole ALTER COLUMN id SET DEFAULT nextval('public.apis_groupchatrole_id_seq'::regclass);


--
-- Name: apis_inbox id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox ALTER COLUMN id SET DEFAULT nextval('public.apis_inbox_id_seq'::regclass);


--
-- Name: apis_inbox_messages id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox_messages ALTER COLUMN id SET DEFAULT nextval('public.apis_inbox_messages_id_seq'::regclass);


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
-- Name: apis_point_logs id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_logs ALTER COLUMN id SET DEFAULT nextval('public.apis_point_logs_id_seq'::regclass);


--
-- Name: apis_pointattribute id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointattribute ALTER COLUMN id SET DEFAULT nextval('public.apis_pointattribute_id_seq'::regclass);


--
-- Name: apis_pointfield id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointfield ALTER COLUMN id SET DEFAULT nextval('public.apis_pointfield_id_seq'::regclass);


--
-- Name: apis_pointlog id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlog ALTER COLUMN id SET DEFAULT nextval('public.apis_pointlog_id_seq'::regclass);


--
-- Name: apis_pointlogtype id; Type: DEFAULT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlogtype ALTER COLUMN id SET DEFAULT nextval('public.apis_pointlogtype_id_seq'::regclass);


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
3	pbkdf2_sha256$120000$y0pzOaHNxj64$qRnVIBdfgPPvAmvJDQirRrI5/YNyxRM0T2+K+cPvAWI=	\N	f			f	t	2018-12-20 00:52:27.666552+08	azri@cwa.com
4	pbkdf2_sha256$120000$6ah1pOTIryzt$RhM0bqF+LVhQbCNu1aIDxfzxbf/h+4G9FKYBD9d314U=	\N	f			f	t	2018-12-20 00:53:02.565292+08	badruddin@cwa.com
1	pbkdf2_sha256$120000$UvAO5yYC89FY$2fRBo02n9Jnz9zVmRdrNAeO+SX/YTXNZkhlOBzqOb3U=	2019-01-04 23:10:37.722869+08	t			t	t	2018-12-20 00:32:03.380181+08	irsyadmhdilham@gmail.com
2	pbkdf2_sha256$120000$WMqpzQuGRYRx$gOLGwwYYgOZpG4saQ994JyLW8LKhGqYjWIa5zNy4LxM=	\N	f			f	t	2018-12-20 00:51:38.0963+08	ramlan@cwa.com
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
1	Otye Excellence Consultants	agencies/1/agency_image_2019-01-09T152257.5132640000.jpg	2	1	2
\.


--
-- Data for Name: apis_agency_members; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_agency_members (id, agency_id, profile_id) FROM stdin;
1	1	2
2	1	3
3	1	4
\.


--
-- Data for Name: apis_agency_posts; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_agency_posts (id, agency_id, post_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
\.


--
-- Data for Name: apis_chatmessage; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_chatmessage (id, "timestamp", text, person_id) FROM stdin;
192	2018-12-28 16:42:55.666937+08	Azri	2
193	2018-12-28 16:43:04.011026+08	yes bo	3
194	2018-12-28 16:43:17.736105+08	Gila ke ape	2
195	2018-12-28 16:43:24.773721+08	mmg gila pon	3
196	2018-12-28 17:18:49.899171+08	hello	2
197	2018-12-28 17:19:00.430169+08	yes bro	3
198	2018-12-28 17:22:38.921281+08	yes bro	2
199	2018-12-28 17:25:23.120175+08	yes again	2
200	2018-12-28 17:27:54.367937+08	aku nk  tnye skit	2
201	2018-12-28 17:29:41.252372+08	Aku nk	2
202	2018-12-28 17:30:04.072077+08	hoi	3
203	2018-12-28 17:30:11.714539+08	hello again	2
204	2018-12-28 17:30:51.456361+08	yes yes	2
205	2018-12-28 17:31:05.225819+08	mane ilang	3
206	2018-12-28 17:31:13.116277+08	ade je kat sini	2
207	2018-12-28 17:32:37.19474+08	Cade kat ne	2
208	2018-12-28 17:36:24.071622+08	bro bro	2
209	2018-12-28 17:38:56.228585+08	hello there	2
210	2018-12-28 17:39:03.624762+08	yes here	3
211	2018-12-28 17:39:13.624429+08	mane ko ilang bro	2
212	2018-12-28 17:39:21.038394+08	ade je ni ha	3
213	2018-12-28 17:39:34.120357+08	mane ko aku cari td xjmpe	2
214	2018-12-28 17:39:46.947804+08	ade td kt blkg ko	3
215	2018-12-28 17:40:10.557786+08	jap jap	2
216	2018-12-28 17:40:18.220402+08	mane ade kejap	3
217	2018-12-28 17:42:35.937545+08	mane ilang	3
218	2018-12-28 17:43:57.611723+08	hoi	2
219	2018-12-28 17:49:38.371949+08	hellooooo	2
220	2018-12-28 17:50:56.002108+08	hello agarn	2
221	2018-12-28 17:52:33.388788+08	yo yo	2
222	2018-12-28 17:52:47.608993+08	mane ko ilang brader	2
223	2018-12-28 17:54:52.290586+08	hello bro	3
224	2018-12-28 17:55:04.88301+08	hello back	3
225	2018-12-28 17:55:16.677669+08	hello og hello	2
226	2018-12-28 17:55:29.747452+08	heiii	3
227	2018-12-28 17:57:12.672913+08	hello	3
228	2018-12-28 17:57:25.748068+08	he'll	2
229	2018-12-28 17:57:37.144071+08	hoi	3
230	2018-12-28 17:57:42.415428+08	oi oi	2
231	2018-12-28 17:57:54.370153+08	lan	3
232	2018-12-28 17:58:02.924612+08	yes	2
233	2018-12-28 17:58:09.394444+08	mane ilang brader	3
234	2018-12-28 17:58:23.669736+08	nah	2
235	2018-12-28 18:07:58.726397+08	hello	3
236	2018-12-28 18:08:07.770099+08	hell no	2
237	2018-12-28 18:08:14.984122+08	mane aku nk tau	3
238	2018-12-28 18:18:24.954962+08	cikabg	3
239	2018-12-28 18:18:36.19439+08	hare	2
240	2018-12-28 18:18:47.243278+08	Bangkok	2
241	2018-12-28 18:18:57.877737+08	bongok	2
242	2018-12-28 18:19:13.318922+08	azure	2
243	2018-12-28 18:19:32.230899+08	heran jgak au	2
244	2018-12-28 18:23:29.62543+08	lan	3
245	2018-12-28 18:23:40.740668+08	mane ko lan	3
246	2018-12-29 07:48:10.200287+08	hello	3
247	2018-12-29 07:48:57.002946+08	yes bro	2
248	2018-12-29 07:50:40.136538+08	ye ye	3
249	2018-12-29 07:50:54.691814+08	mane ko ilang	2
250	2018-12-29 07:51:01.975039+08	ade je kat sini	3
251	2018-12-29 07:58:14.54885+08	hello ramlan	3
252	2018-12-29 21:26:14.156587+08	hello bro	2
253	2018-12-29 21:44:55.638205+08	lg skali	2
254	2018-12-29 21:45:44.514998+08	hello	2
255	2018-12-29 21:51:49.742572+08	bagangn	2
256	2018-12-29 22:31:33.683644+08	mat	3
257	2018-12-30 10:13:58.068157+08	hello mat	2
258	2018-12-30 10:15:22.649749+08	hello again	2
259	2018-12-30 10:16:56.598349+08	hello	2
260	2018-12-30 10:17:11.591597+08	mane ko ilang brader	3
261	2018-12-30 10:17:23.566088+08	ade je kat sini ha x kemana pon	2
262	2018-12-30 10:17:32.108674+08	yeke xkemana	3
263	2018-12-30 10:17:46.601397+08	aye x kemana	2
264	2018-12-30 10:18:54.971692+08	mane ke mana	2
265	2018-12-30 10:19:10.648524+08	kssdsd	2
266	2018-12-30 10:25:43.118143+08	hello	2
267	2018-12-30 10:25:57.977986+08	yes yes	3
268	2018-12-30 10:26:12.327744+08	mane slang	2
269	2018-12-30 10:33:52.105585+08	mae ko	3
270	2018-12-30 10:35:11.487553+08	ade mane	2
271	2018-12-30 10:39:22.016134+08	yell	2
272	2018-12-30 10:39:33.219213+08	yello	3
273	2018-12-30 10:39:42.327265+08	yoyo	2
274	2018-12-30 10:42:07.039194+08	yo wassup	3
275	2018-12-30 12:25:00.623782+08	Assalamualaikum	2
276	2018-12-30 12:25:17.284423+08	Hello world	2
277	2018-12-30 12:32:52.862435+08	Hello	2
278	2018-12-30 12:33:02.934468+08	yes bos	3
279	2018-12-30 12:33:13.964715+08	Ade mane ko	2
280	2018-12-30 12:33:21.424865+08	ade je kat sini	3
281	2018-12-30 12:33:45.502306+08	Ade mane	2
282	2018-12-30 12:43:11.945441+08	Hello	2
283	2018-12-30 12:43:19.877063+08	Mane ko	2
284	2018-12-31 08:32:58.460267+08	Azri	2
285	2018-12-31 08:33:10.859861+08	ye	3
286	2018-12-31 08:36:44.747981+08	Mane ko	2
287	2018-12-31 08:36:58.334348+08	ade je ni ha	3
288	2018-12-31 09:34:13.023149+08	Hello	2
289	2018-12-31 09:34:33.690878+08	Hello bro	2
290	2018-12-31 09:36:17.070384+08	Hello	2
291	2018-12-31 09:36:28.154545+08	Mane ilang	2
292	2019-01-05 00:11:12.358086+08	hello there 	3
293	2019-01-08 12:33:41.0634+08	salam abg zai, are u free this afternoon?	4
294	2019-01-08 18:59:19.337574+08	Hshjss	2
\.


--
-- Data for Name: apis_comment; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_comment (id, "timestamp", text, commented_by_id) FROM stdin;
41	2018-12-31 14:24:40.348891+08	27	2
42	2018-12-31 14:26:15.767331+08	sdsdsd	2
43	2018-12-31 14:26:41.121892+08	sdsdsd	2
44	2018-12-31 14:27:58.873526+08	suds	2
45	2018-12-31 14:41:45.923254+08	incurred	2
46	2018-12-31 14:44:39.181701+08	tang 	2
47	2018-12-31 14:45:49.971061+08	snoop dog	2
48	2018-12-31 15:08:21.035363+08	sdsdsdsd	2
49	2019-01-01 07:44:06.746632+08	good morning	2
50	2019-01-01 07:49:28.463592+08	good 	2
51	2019-01-01 07:51:05.902008+08	good morning	2
52	2019-01-01 07:53:34.457693+08	comment	2
53	2019-01-05 00:17:32.201509+08	Baik la brother	4
54	2019-01-05 00:25:03.050716+08	congrats	2
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

COPY public.apis_contact (id, name, remark, contact_no, created_on, last_modified, image, contact_type_id, referrer_id, status_id) FROM stdin;
1	Irsyad	\N	019 797 6640	2018-12-20 01:15:17.748734+08	2018-12-20 01:15:17.748781+08		3	\N	None
2	kamal	maybank bangsar	0377510976	2019-01-05 00:10:26.198714+08	2019-01-05 00:10:26.19876+08		2	\N	None
3	zamri	cimb kajang	87387643	2019-01-05 00:18:49.421029+08	2019-01-05 00:18:49.42107+08		2	\N	None
4	zack	\N	7356879356	2019-01-05 00:20:56.978427+08	2019-01-05 00:20:56.98609+08		1	3	None
5	Andrew	Mercedes shah alam	0178990786	2019-01-09 23:30:00.906556+08	2019-01-09 23:30:00.9066+08		2	\N	None
6	Liza	\N	0197765438	2019-01-09 23:31:23.903577+08	2019-01-09 23:31:23.910657+08		1	5	None
\.


--
-- Data for Name: apis_contact_schedules; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_contact_schedules (id, contact_id, schedule_id) FROM stdin;
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
6	Other
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
-- Data for Name: apis_designation; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_designation (id, name) FROM stdin;
1	Group Agency Manager
2	Agency Manager
3	Agency Supervisor
4	Unit Trust Consultant
\.


--
-- Data for Name: apis_googleapi; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_googleapi (id, access_token, token_expiry) FROM stdin;
\.


--
-- Data for Name: apis_group; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_group (id, owner_id) FROM stdin;
1	2
2	3
\.


--
-- Data for Name: apis_group_members; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_group_members (id, group_id, profile_id) FROM stdin;
1	1	3
2	2	4
\.


--
-- Data for Name: apis_groupchat; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_groupchat (id, owner_id, role_id) FROM stdin;
1	2	1
2	2	2
\.


--
-- Data for Name: apis_groupchat_messages; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_groupchat_messages (id, groupchat_id, chatmessage_id) FROM stdin;
37	2	196
38	2	197
39	2	198
40	2	199
41	2	200
42	2	201
43	2	202
44	2	203
45	2	204
46	2	205
47	2	206
48	2	207
49	2	208
50	2	209
51	2	210
52	2	211
53	2	212
54	2	213
55	2	214
56	2	215
57	2	216
58	2	217
59	2	218
60	2	219
61	2	220
62	2	221
63	2	222
64	2	223
65	2	224
66	2	225
67	2	226
68	2	227
69	2	228
70	2	229
71	2	230
72	2	238
73	2	239
74	2	240
75	2	241
76	2	275
77	2	276
78	2	277
79	2	278
80	2	279
81	2	280
82	2	281
83	2	282
84	2	283
85	2	288
86	2	291
\.


--
-- Data for Name: apis_groupchat_participants; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_groupchat_participants (id, groupchat_id, profile_id) FROM stdin;
1	1	2
2	1	3
3	1	4
4	2	3
5	2	2
\.


--
-- Data for Name: apis_groupchatrole; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_groupchatrole (id, name) FROM stdin;
1	agency
2	group
\.


--
-- Data for Name: apis_inbox; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_inbox (id, created_on, last_modified, chat_with_id, unread, group_chat_id) FROM stdin;
54	2018-12-28 16:42:55.703856+08	2018-12-31 09:36:34.201419+08	2	0	\N
50	2018-12-27 00:15:22.287582+08	2018-12-31 09:36:36.766364+08	\N	0	2
48	2018-12-24 12:04:41.77943+08	2019-01-05 00:31:48.415086+08	\N	0	1
53	2018-12-28 16:42:55.671083+08	2019-01-06 14:24:31.737565+08	3	0	\N
55	2019-01-06 17:30:48.501449+08	2019-01-06 17:30:48.501488+08	\N	0	1
57	2019-01-08 12:33:41.405124+08	2019-01-08 18:59:10.55441+08	4	0	\N
56	2019-01-08 12:33:41.147175+08	2019-01-08 18:59:19.361584+08	2	1	\N
49	2018-12-25 11:54:03.324931+08	2018-12-30 12:33:22.724689+08	\N	0	2
\.


--
-- Data for Name: apis_inbox_messages; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_inbox_messages (id, inbox_id, chatmessage_id) FROM stdin;
275	53	192
276	54	192
277	54	193
278	53	193
279	53	194
280	54	194
281	54	195
282	53	195
283	54	231
284	53	231
285	53	232
286	54	232
287	54	233
288	53	233
289	53	234
290	54	234
291	54	235
292	53	235
293	53	236
294	54	236
295	54	237
296	53	237
297	53	242
298	54	242
299	53	243
300	54	243
301	54	244
302	53	244
303	54	245
304	53	245
305	54	246
306	53	246
307	53	247
308	54	247
309	54	248
310	53	248
311	53	249
312	54	249
313	54	250
314	53	250
315	54	251
316	53	251
317	53	252
318	54	252
319	53	253
320	54	253
321	53	254
322	54	254
323	53	255
324	54	255
325	54	256
326	53	256
327	53	257
328	54	257
329	53	258
330	54	258
331	53	259
332	54	259
333	54	260
334	53	260
335	53	261
336	54	261
337	54	262
338	53	262
339	53	263
340	54	263
341	53	264
342	54	264
343	53	265
344	54	265
345	53	266
346	54	266
347	54	267
348	53	267
349	53	268
350	54	268
351	54	269
352	53	269
353	53	270
354	54	270
355	53	271
356	54	271
357	54	272
358	53	272
359	53	273
360	54	273
361	54	274
362	53	274
363	53	284
364	54	284
365	54	285
366	53	285
367	53	286
368	54	286
369	54	287
370	53	287
371	53	289
372	54	289
373	53	290
374	54	290
375	54	292
376	53	292
377	56	293
378	57	293
379	57	294
380	56	294
\.


--
-- Data for Name: apis_industry; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_industry (id, name) FROM stdin;
1	Mutual fund investment
\.


--
-- Data for Name: apis_like; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_like (id, "timestamp", liker_id) FROM stdin;
60	2018-12-31 09:25:01.233878+08	2
79	2018-12-31 11:14:03.759453+08	2
83	2019-01-01 12:09:16.56849+08	3
86	2019-01-05 00:24:46.56956+08	2
87	2019-01-05 00:32:25.175798+08	3
88	2019-01-05 15:14:15.828266+08	3
45	2018-12-31 09:05:47.30905+08	3
\.


--
-- Data for Name: apis_notification; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_notification (id, "timestamp", notification_type_id, notified_by_id, post_rel_id, read, inbox_rel_id, seen) FROM stdin;
117	2019-01-01 07:53:34.477273+08	6	2	1	t	\N	f
116	2018-12-31 09:36:28.146145+08	4	2	\N	t	49	f
115	2018-12-31 09:36:17.098844+08	3	2	\N	t	54	f
114	2018-12-31 09:34:33.718303+08	3	2	\N	t	54	f
118	2019-01-01 12:10:52.686612+08	5	2	3	t	\N	f
113	2018-12-31 09:34:13.013215+08	4	2	\N	t	49	f
119	2019-01-01 12:11:27.649184+08	5	2	3	t	\N	f
122	2019-01-05 00:24:46.761951+08	5	2	3	t	\N	f
124	2019-01-05 00:30:10.775837+08	4	2	\N	t	48	f
123	2019-01-05 00:25:03.068478+08	6	2	3	t	\N	f
121	2019-01-05 00:17:32.301141+08	6	4	3	t	\N	f
125	2019-01-05 15:14:16.09286+08	5	3	5	f	\N	f
127	2019-01-08 18:59:19.366634+08	3	2	\N	f	56	f
111	2018-12-31 08:36:44.774142+08	3	2	\N	t	54	f
109	2018-12-31 08:32:58.619938+08	3	2	\N	t	54	f
108	2018-12-30 12:43:11.93554+08	4	2	\N	t	49	f
106	2018-12-30 12:32:52.854011+08	4	2	\N	t	49	f
105	2018-12-30 12:25:00.314124+08	4	2	\N	t	49	f
110	2018-12-31 08:33:11.312908+08	3	3	\N	f	53	t
107	2018-12-30 12:33:02.488625+08	4	3	\N	f	50	t
126	2019-01-08 12:33:41.428425+08	3	4	\N	f	57	t
112	2018-12-31 08:36:58.366707+08	3	3	\N	f	53	t
120	2019-01-05 00:11:12.497742+08	3	3	\N	f	53	t
\.


--
-- Data for Name: apis_notificationtype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_notificationtype (id, name) FROM stdin;
1	closed sales
2	joining field work
3	inbox
4	group inbox
5	like
6	comment
\.


--
-- Data for Name: apis_point; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_point (id, date) FROM stdin;
1	2018-12-19
2	2018-12-23
3	2019-01-02
4	2019-01-03
5	2019-01-04
6	2019-01-04
7	2019-01-04
8	2019-01-05
9	2019-01-08
10	2019-01-09
\.


--
-- Data for Name: apis_point_attributes; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_point_attributes (id, point_id, pointattribute_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	3	8
9	4	9
10	5	10
11	5	11
12	5	12
13	5	13
14	5	14
15	5	15
16	6	16
17	6	17
18	7	18
19	8	19
20	9	20
21	10	21
22	10	22
\.


--
-- Data for Name: apis_point_logs; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_point_logs (id, point_id, pointlog_id) FROM stdin;
1	1	2
2	1	3
3	2	4
4	2	5
5	2	6
6	2	7
7	2	8
8	3	9
9	4	10
10	4	11
11	5	12
12	5	13
13	5	14
14	5	15
15	5	16
16	5	17
17	5	18
18	5	19
19	5	20
20	5	21
21	5	23
22	6	24
23	6	26
24	7	37
25	8	38
26	9	39
27	10	40
28	10	41
\.


--
-- Data for Name: apis_pointattribute; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointattribute (id, point, last_modified, attribute_id) FROM stdin;
1	2	2018-12-20 01:13:56.952717+08	12
2	2	2018-12-20 01:15:17.902041+08	3
3	1	2018-12-23 23:03:19.598531+08	13
4	2	2018-12-23 23:03:49.008534+08	12
5	3	2018-12-23 23:03:51.334118+08	2
6	5	2018-12-23 23:03:54.295357+08	15
7	1	2018-12-23 23:03:55.810607+08	14
8	3	2019-01-02 17:19:04.029947+08	2
9	6	2019-01-03 12:26:47.372471+08	1
11	2	2019-01-04 12:25:14.840037+08	12
13	3	2019-01-04 12:29:44.900003+08	9
10	6	2019-01-04 12:40:33.807877+08	1
12	5	2019-01-04 12:52:30.612182+08	13
14	2	2019-01-05 00:10:26.669047+08	3
15	1	2019-01-05 00:10:35.099625+08	4
16	2	2019-01-05 00:18:49.57854+08	3
17	1	2019-01-05 00:20:57.163891+08	5
18	2	2019-01-05 00:29:08.095783+08	7
19	2	2019-01-05 15:15:47.52751+08	7
20	2	2019-01-08 12:17:45.704573+08	7
21	2	2019-01-09 23:30:01.860195+08	3
22	1	2019-01-09 23:31:24.143613+08	5
\.


--
-- Data for Name: apis_pointfield; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointfield (id, name) FROM stdin;
1	Millionnaire suit
2	Be early on training
3	FTF/Nesting/Booth
4	Joining field work
5	Referrals
6	Calls/Email/Socmed
7	Appointment secured
8	Sales presentation
9	Career presentation
10	Case closed
11	Sign up contract
12	Update upline
13	Servicing/Follow up
14	Personal coaching
15	Agency program
\.


--
-- Data for Name: apis_pointlog; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointlog (id, "timestamp", point, attribute_id, point_type_id) FROM stdin;
2	2018-12-20 08:09:11.078616+08	2	12	1
3	2018-12-20 08:09:35.276231+08	1	3	1
4	2018-12-23 23:03:19.44296+08	1	13	1
5	2018-12-23 23:03:48.99087+08	2	12	1
6	2018-12-23 23:03:51.316231+08	3	2	1
7	2018-12-23 23:03:54.270449+08	5	15	1
8	2018-12-23 23:03:55.795812+08	1	14	1
9	2019-01-02 17:19:03.893106+08	3	2	1
10	2019-01-03 12:24:19.798475+08	3	1	1
11	2019-01-03 12:26:47.32158+08	6	1	1
12	2019-01-04 12:24:07.550742+08	3	1	1
13	2019-01-04 12:25:14.80427+08	2	12	1
14	2019-01-04 12:27:56.878442+08	1	13	1
15	2019-01-04 12:29:44.869792+08	3	9	1
16	2019-01-04 12:30:04.766591+08	2	13	1
17	2019-01-04 12:30:23.916883+08	3	13	1
18	2019-01-04 12:40:33.733579+08	6	1	1
19	2019-01-04 12:44:40.364577+08	4	13	1
20	2019-01-04 12:52:30.568801+08	5	13	1
21	2019-01-05 00:10:26.61917+08	2	3	1
22	2019-01-05 00:10:29.321091+08	2	3	1
23	2019-01-05 00:10:35.082924+08	1	4	1
24	2019-01-05 00:18:49.566462+08	2	3	1
25	2019-01-05 00:18:52.116108+08	1	5	1
26	2019-01-05 00:20:57.147019+08	1	5	1
27	2019-01-05 00:20:59.619066+08	2	5	1
28	2019-01-05 00:21:25.221779+08	5	15	1
29	2019-01-05 00:21:29.008222+08	3	2	1
30	2019-01-05 00:21:31.177535+08	1	14	1
31	2019-01-05 00:21:35.664643+08	1	13	1
32	2019-01-05 00:21:37.849732+08	2	12	1
33	2019-01-05 00:21:39.663444+08	3	1	1
34	2019-01-05 00:21:42.44523+08	3	11	1
35	2019-01-05 00:21:47.258385+08	3	9	1
36	2019-01-05 00:22:20.829675+08	4	10	1
37	2019-01-05 00:29:08.067664+08	2	7	1
38	2019-01-05 15:15:47.379162+08	2	7	1
39	2019-01-08 12:17:41.74762+08	2	7	1
40	2019-01-09 23:30:01.766064+08	2	3	1
41	2019-01-09 23:31:24.123159+08	1	5	1
\.


--
-- Data for Name: apis_pointlogtype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_pointlogtype (id, name) FROM stdin;
2	Subtract
1	Add
\.


--
-- Data for Name: apis_post; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post (id, "timestamp", contact_rel_id, post_type_id, posted_by_id) FROM stdin;
1	2018-12-28 13:10:47.014283+08	\N	1	3
2	2018-12-30 19:15:50.79947+08	\N	1	3
3	2019-01-01 12:10:24.229847+08	\N	1	3
4	2019-01-04 19:19:27.918558+08	\N	1	3
5	2019-01-05 00:22:48.222332+08	\N	1	4
6	2019-01-08 12:18:50.781618+08	\N	1	4
\.


--
-- Data for Name: apis_post_comments; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_comments (id, post_id, comment_id) FROM stdin;
41	2	41
42	2	42
43	2	43
44	2	44
45	2	45
46	2	46
47	2	47
48	1	48
49	2	49
50	2	50
51	1	51
52	1	52
53	3	53
54	3	54
\.


--
-- Data for Name: apis_post_likes; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_likes (id, post_id, like_id) FROM stdin;
60	1	60
79	2	79
83	2	83
86	3	86
87	4	87
88	5	88
45	1	45
\.


--
-- Data for Name: apis_post_sales_rel; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_post_sales_rel (id, post_id, sales_id) FROM stdin;
1	1	2
2	2	3
3	2	4
4	2	5
5	3	6
6	4	7
7	4	8
8	4	9
9	4	10
10	4	11
11	4	12
12	4	13
13	5	14
14	5	15
15	5	16
16	6	17
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
2	joining field work
1	sales closed
\.


--
-- Data for Name: apis_profile; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile (id, name, profile_image, settings, fcm_token, agency_id, designation_id, group_id, upline_id, user_id) FROM stdin;
4	khairuddin	users/4/baby.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	\N	1	3	\N	3	4
3	zamri	users/3/baby.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	fJZ6x1j3Pi0:APA91bG6SCoLNoTgsr5JXzignCLE3FiQmS5cYzJfsK_nELg1GehBtRSfqqVaBoZzNWaOf803eGiWdi6b6MdUBf8QUVI_yj7xq-GW1MKmEu6S9LkcwkSE1CdbrwP2LCICQsDVeOeACK4g	1	2	2	2	3
2	Ramlan	users/2/profile_image_2019-01-09T142402.0489740000.jpg	{"notifications": {"push_notification": {"mentions": true, "reminder": true, "activities": true, "direct_message": true}, "email_notification": true}, "social_net_acc": {"google": null, "dropbox": null, "facebook": null}}	\N	1	1	1	\N	2
\.


--
-- Data for Name: apis_profile_contacts; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_contacts (id, profile_id, contact_id) FROM stdin;
1	2	1
2	3	2
3	4	3
4	4	4
5	3	5
6	3	6
\.


--
-- Data for Name: apis_profile_inbox; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_inbox (id, profile_id, inbox_id) FROM stdin;
57	2	53
58	3	54
59	4	55
60	4	56
61	2	57
50	2	48
51	2	49
52	3	48
54	3	50
\.


--
-- Data for Name: apis_profile_notifications; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_notifications (id, profile_id, notification_id) FROM stdin;
105	3	105
106	3	106
107	2	107
108	3	108
109	3	109
110	2	110
111	3	111
112	2	112
113	3	113
114	3	114
115	3	115
116	3	116
117	3	117
118	3	118
119	3	119
120	2	120
121	3	121
122	3	122
123	3	123
124	3	124
125	4	125
126	2	126
127	4	127
\.


--
-- Data for Name: apis_profile_points; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_points (id, profile_id, point_id) FROM stdin;
1	2	1
2	4	2
3	3	3
4	3	4
5	3	5
6	4	6
7	2	7
8	3	8
9	4	9
10	3	10
\.


--
-- Data for Name: apis_profile_sales; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_sales (id, profile_id, sales_id) FROM stdin;
2	3	2
3	3	3
4	3	4
5	3	5
6	3	6
7	3	7
8	3	8
9	3	9
10	3	10
11	3	11
12	3	12
13	3	13
14	4	14
15	4	15
16	4	16
17	4	17
\.


--
-- Data for Name: apis_profile_schedules; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_profile_schedules (id, profile_id, schedule_id) FROM stdin;
1	2	1
2	4	2
3	3	3
4	3	4
5	4	5
\.


--
-- Data for Name: apis_sales; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_sales (id, "timestamp", location, amount, commission, document_id, repeat_sales, contact_id, sales_status_id, sales_type_id, surcharge_id) FROM stdin;
2	2018-12-28 13:10:46.968921+08	KL	120000.00	\N	\N	f	\N	Submitted	1	\N
3	2018-12-30 19:13:11.121102+08	KL	8000.00	\N	\N	f	\N	Submitted	4	\N
4	2018-12-30 19:15:18.362697+08	KL	1000.00	\N	\N	f	\N	Submitted	1	\N
5	2018-12-30 19:15:50.762203+08	JB	90.00	\N	\N	f	\N	Submitted	2	\N
6	2019-01-01 12:10:23.941553+08	KL	1.00	\N	\N	f	\N	Submitted	2	\N
7	2019-01-04 14:52:46.386619+08	KL	2000.00	\N	\N	f	\N	Submitted	2	\N
8	2019-01-04 14:53:31.035253+08	KL	200.00	\N	\N	f	\N	Submitted	2	\N
9	2019-01-04 14:56:55.938974+08	Kajang	100.00	\N	\N	f	\N	Submitted	1	\N
10	2019-01-04 14:58:32.932885+08	JB	1000.00	\N	\N	f	\N	Submitted	2	\N
11	2019-01-04 14:58:59.907114+08	Penang	15000.00	\N	\N	f	\N	Submitted	1	\N
12	2019-01-04 19:18:37.782542+08	KL	10.00	\N	\N	f	\N	Submitted	1	\N
13	2019-01-04 19:19:27.87916+08	KL	10.00	\N	\N	f	\N	Submitted	5	\N
14	2019-01-05 00:17:10.894671+08	PJ	12000.00	\N	\N	f	\N	Submitted	1	\N
15	2019-01-05 00:22:20.330216+08	\N	7500.00	\N	\N	f	\N	Submitted	2	\N
16	2019-01-05 00:22:48.195767+08	\N	3000.00	\N	\N	f	\N	Submitted	5	\N
17	2019-01-08 12:18:50.179579+08	bangi	12000.00	\N	\N	f	\N	Submitted	1	\N
\.


--
-- Data for Name: apis_salesstatus; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_salesstatus (id, name) FROM stdin;
1	Submitted
\.


--
-- Data for Name: apis_salestype; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_salestype (id, name) FROM stdin;
1	EPF
2	Cash
3	Wasiat
4	ASB
5	PRS
6	Takaful
\.


--
-- Data for Name: apis_schedule; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_schedule (id, date, title, remark, location, created_on, last_modified, reminder, contact_id) FROM stdin;
1	2019-01-05 16:28:00+08	mary	\N	DP	2019-01-05 00:29:08.257157+08	2019-01-05 00:29:08.257191+08	\N	\N
2	2019-01-05 06:27:00+08	Hello world	\N	KL	2019-01-05 14:27:11.963607+08	2019-01-05 14:27:11.963638+08	\N	\N
3	2019-01-06 20:15:00+08	kamal	\N	shah alam	2019-01-05 15:15:47.940724+08	2019-01-05 15:15:47.940771+08	\N	\N
4	2019-01-06 10:16:00+08	ann	\N	ampang	2019-01-05 15:16:53.685065+08	2019-01-05 15:16:53.685096+08	\N	\N
5	2019-01-10 16:17:00+08	arif	\N	kajang kopitiam	2019-01-08 12:17:48.357875+08	2019-01-08 12:17:48.357909+08	\N	\N
\.


--
-- Data for Name: apis_surcharge; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.apis_surcharge (id, name) FROM stdin;
2	5
3	6.5
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
29	Can add chat	8	add_chat
30	Can change chat	8	change_chat
31	Can delete chat	8	delete_chat
32	Can view chat	8	view_chat
33	Can add chat message	9	add_chatmessage
34	Can change chat message	9	change_chatmessage
35	Can delete chat message	9	delete_chatmessage
36	Can view chat message	9	view_chatmessage
37	Can add chat type	10	add_chattype
38	Can change chat type	10	change_chattype
39	Can delete chat type	10	delete_chattype
40	Can view chat type	10	view_chattype
41	Can add comment	11	add_comment
42	Can change comment	11	change_comment
43	Can delete comment	11	delete_comment
44	Can view comment	11	view_comment
45	Can add company	12	add_company
46	Can change company	12	change_company
47	Can delete company	12	delete_company
48	Can view company	12	view_company
49	Can add contact	13	add_contact
50	Can change contact	13	change_contact
51	Can delete contact	13	delete_contact
52	Can view contact	13	view_contact
53	Can add contact status	14	add_contactstatus
54	Can change contact status	14	change_contactstatus
55	Can delete contact status	14	delete_contactstatus
56	Can view contact status	14	view_contactstatus
57	Can add contact type	15	add_contacttype
58	Can change contact type	15	change_contacttype
59	Can delete contact type	15	delete_contacttype
60	Can view contact type	15	view_contacttype
61	Can add designation	16	add_designation
62	Can change designation	16	change_designation
63	Can delete designation	16	delete_designation
64	Can view designation	16	view_designation
65	Can add group	17	add_group
66	Can change group	17	change_group
67	Can delete group	17	delete_group
68	Can view group	17	view_group
69	Can add inbox	18	add_inbox
70	Can change inbox	18	change_inbox
71	Can delete inbox	18	delete_inbox
72	Can view inbox	18	view_inbox
73	Can add industry	19	add_industry
74	Can change industry	19	change_industry
75	Can delete industry	19	delete_industry
76	Can view industry	19	view_industry
77	Can add like	20	add_like
78	Can change like	20	change_like
79	Can delete like	20	delete_like
80	Can view like	20	view_like
81	Can add notification	21	add_notification
82	Can change notification	21	change_notification
83	Can delete notification	21	delete_notification
84	Can view notification	21	view_notification
85	Can add notification type	22	add_notificationtype
86	Can change notification type	22	change_notificationtype
87	Can delete notification type	22	delete_notificationtype
88	Can view notification type	22	view_notificationtype
89	Can add point	23	add_point
90	Can change point	23	change_point
91	Can delete point	23	delete_point
92	Can view point	23	view_point
93	Can add point attribute	24	add_pointattribute
94	Can change point attribute	24	change_pointattribute
95	Can delete point attribute	24	delete_pointattribute
96	Can view point attribute	24	view_pointattribute
97	Can add point field	25	add_pointfield
98	Can change point field	25	change_pointfield
99	Can delete point field	25	delete_pointfield
100	Can view point field	25	view_pointfield
101	Can add post	26	add_post
102	Can change post	26	change_post
103	Can delete post	26	delete_post
104	Can view post	26	view_post
105	Can add post type	27	add_posttype
106	Can change post type	27	change_posttype
107	Can delete post type	27	delete_posttype
108	Can view post type	27	view_posttype
109	Can add profile	28	add_profile
110	Can change profile	28	change_profile
111	Can delete profile	28	delete_profile
112	Can view profile	28	view_profile
113	Can add sales	29	add_sales
114	Can change sales	29	change_sales
115	Can delete sales	29	delete_sales
116	Can view sales	29	view_sales
117	Can add sales status	30	add_salesstatus
118	Can change sales status	30	change_salesstatus
119	Can delete sales status	30	delete_salesstatus
120	Can view sales status	30	view_salesstatus
121	Can add sales type	31	add_salestype
122	Can change sales type	31	change_salestype
123	Can delete sales type	31	delete_salestype
124	Can view sales type	31	view_salestype
125	Can add schedule	32	add_schedule
126	Can change schedule	32	change_schedule
127	Can delete schedule	32	delete_schedule
128	Can view schedule	32	view_schedule
129	Can add surcharge	33	add_surcharge
130	Can change surcharge	33	change_surcharge
131	Can delete surcharge	33	delete_surcharge
132	Can view surcharge	33	view_surcharge
133	Can add point log	34	add_pointlog
134	Can change point log	34	change_pointlog
135	Can delete point log	34	delete_pointlog
136	Can view point log	34	view_pointlog
137	Can add point log type	35	add_pointlogtype
138	Can change point log type	35	change_pointlogtype
139	Can delete point log type	35	delete_pointlogtype
140	Can view point log type	35	view_pointlogtype
141	Can add group chat	36	add_groupchat
142	Can change group chat	36	change_groupchat
143	Can delete group chat	36	delete_groupchat
144	Can view group chat	36	view_groupchat
145	Can add group chat role	37	add_groupchatrole
146	Can change group chat role	37	change_groupchatrole
147	Can delete group chat role	37	delete_groupchatrole
148	Can view group chat role	37	view_groupchatrole
149	Can add google api	38	add_googleapi
150	Can change google api	38	change_googleapi
151	Can delete google api	38	delete_googleapi
152	Can view google api	38	view_googleapi
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-20 00:33:02.449108+08	1	personal	1	[{"added": {}}]	10	1
2	2018-12-20 00:33:05.980026+08	2	group	1	[{"added": {}}]	10	1
3	2018-12-20 00:33:22.680079+08	1	Public Mutual	1	[{"added": {}}]	12	1
4	2018-12-20 00:33:26.19494+08	2	CWA	1	[{"added": {}}]	12	1
5	2018-12-20 00:33:39.622496+08	1	None	1	[{"added": {}}]	14	1
6	2018-12-20 00:33:45.425859+08	2	Called	1	[{"added": {}}]	14	1
7	2018-12-20 00:33:49.233797+08	3	Appointment secured	1	[{"added": {}}]	14	1
8	2018-12-20 00:33:52.124805+08	4	Rejected	1	[{"added": {}}]	14	1
9	2018-12-20 00:33:57.820554+08	5	Client	1	[{"added": {}}]	14	1
10	2018-12-20 00:34:01.420104+08	6	Other	1	[{"added": {}}]	14	1
11	2018-12-20 00:35:22.78914+08	1	Group Agency Manager	1	[{"added": {}}]	16	1
12	2018-12-20 00:35:27.161273+08	2	Agency Manager	1	[{"added": {}}]	16	1
13	2018-12-20 00:35:32.419454+08	3	Agency Supervisor	1	[{"added": {}}]	16	1
14	2018-12-20 00:35:39.162706+08	4	Unit Trust Consultant	1	[{"added": {}}]	16	1
15	2018-12-20 00:36:33.768118+08	1	Referral	1	[{"added": {}}]	15	1
16	2018-12-20 00:36:36.298375+08	2	Face to face	1	[{"added": {}}]	15	1
17	2018-12-20 00:36:39.283732+08	3	Nesting	1	[{"added": {}}]	15	1
18	2018-12-20 00:36:44.234804+08	4	Booth	1	[{"added": {}}]	15	1
19	2018-12-20 00:36:57.379259+08	5	Table to table	1	[{"added": {}}]	15	1
20	2018-12-20 00:38:00.329511+08	1	Unit trust investment	1	[{"added": {}}]	19	1
21	2018-12-20 00:38:29.751405+08	1	Millionnaire suit	1	[{"added": {}}]	25	1
22	2018-12-20 00:38:50.846879+08	2	Be early on training	1	[{"added": {}}]	25	1
23	2018-12-20 00:39:32.676681+08	2	Be early on training	2	[]	25	1
24	2018-12-20 00:41:21.2215+08	3	FTF/Nesting/Booth	1	[{"added": {}}]	25	1
25	2018-12-20 00:41:38.281603+08	4	Joining field work	1	[{"added": {}}]	25	1
26	2018-12-20 00:41:41.456609+08	5	Referrals	1	[{"added": {}}]	25	1
27	2018-12-20 00:41:51.624446+08	6	Calls/Email/Socmed	1	[{"added": {}}]	25	1
28	2018-12-20 00:41:59.660359+08	7	Appointment secured	1	[{"added": {}}]	25	1
29	2018-12-20 00:42:06.904821+08	8	Sales presentation	1	[{"added": {}}]	25	1
30	2018-12-20 00:42:14.926164+08	9	Career presentation	1	[{"added": {}}]	25	1
31	2018-12-20 00:42:19.482768+08	10	Case closed	1	[{"added": {}}]	25	1
32	2018-12-20 00:42:25.211244+08	11	Sign up contract	1	[{"added": {}}]	25	1
33	2018-12-20 00:42:32.56127+08	12	Update upline	1	[{"added": {}}]	25	1
34	2018-12-20 00:42:48.657201+08	13	Servicing/Follow up	1	[{"added": {}}]	25	1
35	2018-12-20 00:42:54.880613+08	14	Personal coaching	1	[{"added": {}}]	25	1
36	2018-12-20 00:43:04.891357+08	15	Agency program	1	[{"added": {}}]	25	1
37	2018-12-20 00:44:46.627414+08	1	Sales closed	1	[{"added": {}}]	27	1
38	2018-12-20 00:44:51.434485+08	2	Joining field work	1	[{"added": {}}]	27	1
39	2018-12-20 00:46:00.375086+08	1	EPF	1	[{"added": {}}]	31	1
40	2018-12-20 00:46:04.305785+08	2	Cash	1	[{"added": {}}]	31	1
41	2018-12-20 00:46:08.543645+08	3	Wasiat	1	[{"added": {}}]	31	1
42	2018-12-20 00:46:12.03603+08	4	ASB	1	[{"added": {}}]	31	1
43	2018-12-20 00:46:15.089009+08	5	PRS	1	[{"added": {}}]	31	1
44	2018-12-20 00:46:31.502218+08	6	Takaful	1	[{"added": {}}]	31	1
45	2018-12-20 00:47:37.602744+08	2	Surcharge object (2)	1	[{"added": {}}]	33	1
46	2018-12-20 00:47:45.219767+08	3	Surcharge object (3)	1	[{"added": {}}]	33	1
47	2018-12-20 00:48:18.961357+08	2	5.0	2	[{"changed": {"fields": ["name"]}}]	33	1
48	2018-12-20 00:48:23.789393+08	3	6.5	2	[{"changed": {"fields": ["name"]}}]	33	1
49	2018-12-20 00:48:45.841472+08	1	Submitted	1	[{"added": {}}]	30	1
50	2018-12-20 00:50:41.402455+08	2	Group	2	[{"changed": {"fields": ["name"]}}]	10	1
51	2018-12-20 00:50:48.314274+08	1	Personal	2	[{"changed": {"fields": ["name"]}}]	10	1
52	2018-12-20 00:51:38.395508+08	2	ramlan@cwa.com	1	[{"added": {}}]	6	1
53	2018-12-20 00:52:27.98325+08	3	azri@cwa.com	1	[{"added": {}}]	6	1
54	2018-12-20 00:53:02.870802+08	4	badruddin@cwa.com	1	[{"added": {}}]	6	1
55	2018-12-20 00:58:00.762895+08	2	Profile object (2)	1	[{"added": {}}]	28	1
56	2018-12-20 00:58:22.348078+08	3	Profile object (3)	1	[{"added": {}}]	28	1
57	2018-12-20 00:59:09.317215+08	3	Azri	2	[{"changed": {"fields": ["upline"]}}]	28	1
58	2018-12-20 00:59:35.051721+08	4	Badruddin	1	[{"added": {}}]	28	1
59	2018-12-20 00:59:55.320519+08	1	Otye Excellence Consultants	1	[{"added": {}}]	7	1
60	2018-12-20 01:00:22.225173+08	1	Ramlan	1	[{"added": {}}]	17	1
61	2018-12-20 01:00:32.237285+08	2	Azri	1	[{"added": {}}]	17	1
62	2018-12-20 01:05:07.025984+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
63	2018-12-20 01:05:15.322332+08	2	2. Ramlan	2	[{"changed": {"fields": ["group"]}}]	28	1
64	2018-12-20 01:08:47.419639+08	2	ramlan@cwa.com	2	[{"changed": {"fields": ["password"]}}]	6	1
65	2018-12-20 01:10:40.911683+08	2	2. Ramlan	2	[{"changed": {"fields": ["agency"]}}]	28	1
66	2018-12-20 01:10:53.036234+08	4	4. Badruddin	2	[{"changed": {"fields": ["agency"]}}]	28	1
67	2018-12-20 01:11:00.024462+08	3	3. Azri	2	[{"changed": {"fields": ["agency"]}}]	28	1
68	2018-12-20 01:12:23.302161+08	2	2. Ramlan	2	[{"changed": {"fields": ["profile_image"]}}]	28	1
69	2018-12-20 01:12:41.945281+08	3	3. Azri	2	[{"changed": {"fields": ["profile_image"]}}]	28	1
70	2018-12-20 01:13:15.283667+08	1	Otye Excellence Consultants	2	[{"changed": {"fields": ["agency_image"]}}]	7	1
71	2018-12-20 08:06:51.457136+08	1	add	1	[{"added": {}}]	35	1
72	2018-12-20 08:06:55.396953+08	2	subtract	1	[{"added": {}}]	35	1
73	2018-12-20 08:07:14.8418+08	2	Subtract	2	[{"changed": {"fields": ["name"]}}]	35	1
74	2018-12-20 08:07:21.351182+08	1	Add	2	[{"changed": {"fields": ["name"]}}]	35	1
75	2018-12-20 08:09:11.08216+08	2	PointLog object (2)	1	[{"added": {}}]	34	1
76	2018-12-20 08:09:35.277769+08	3	PointLog object (3)	1	[{"added": {}}]	34	1
77	2018-12-20 08:10:48.496612+08	1	2018-12-19	2	[{"changed": {"fields": ["logs"]}}]	23	1
78	2018-12-20 11:53:51.750324+08	1	2018-12-19	2	[]	23	1
79	2018-12-20 11:55:11.654567+08	1	2018-12-19	2	[]	23	1
80	2018-12-20 18:18:20.938122+08	1	Ramlan	3		8	1
81	2018-12-20 18:38:16.100084+08	2	Ramlan	3		8	1
82	2018-12-20 18:38:27.467284+08	2	2018-12-20 10:28:17.808575+00:00 > Ramlan	3		9	1
83	2018-12-20 18:38:27.47059+08	1	2018-12-20 10:15:14.141336+00:00 > Ramlan	3		9	1
84	2018-12-20 19:04:32.210834+08	3	Ramlan	3		8	1
85	2018-12-20 19:04:39.678383+08	3	2018-12-20 10:56:18.063341+00:00 > Ramlan	3		9	1
86	2018-12-20 23:15:11.076418+08	4	Ramlan	3		8	1
87	2018-12-20 23:15:25.399022+08	4	2018-12-20 11:05:22.019111+00:00 > Ramlan	3		9	1
88	2018-12-21 00:49:27.233765+08	5	Ramlan	2	[{"changed": {"fields": ["chat_with"]}}]	18	1
89	2018-12-21 01:33:16.183015+08	5	Ramlan	2	[{"changed": {"fields": ["unread"]}}]	18	1
90	2018-12-21 17:20:36.534106+08	5	Ramlan	3		8	1
91	2018-12-21 17:20:47.285533+08	13	2018-12-21 07:51:58.133023+00:00 > Ramlan	3		9	1
92	2018-12-21 17:20:47.289022+08	12	2018-12-21 07:51:53.190616+00:00 > Ramlan	3		9	1
93	2018-12-21 17:20:47.291876+08	11	2018-12-21 07:51:48.955294+00:00 > Ramlan	3		9	1
94	2018-12-21 17:20:47.295074+08	10	2018-12-21 04:49:23.688728+00:00 > Ramlan	3		9	1
95	2018-12-21 17:20:47.29827+08	9	2018-12-21 04:49:11.828153+00:00 > Ramlan	3		9	1
96	2018-12-21 17:20:47.3014+08	8	2018-12-21 04:47:53.995691+00:00 > Ramlan	3		9	1
97	2018-12-21 17:20:47.30359+08	7	2018-12-21 04:34:58.629683+00:00 > Ramlan	3		9	1
98	2018-12-21 17:20:47.305572+08	6	2018-12-21 03:42:39.979750+00:00 > Ramlan	3		9	1
99	2018-12-21 17:20:47.307463+08	5	2018-12-20 15:16:34.010639+00:00 > Ramlan	3		9	1
100	2018-12-21 17:31:54.913381+08	6	Ramlan	3		8	1
101	2018-12-21 17:32:04.663033+08	14	2018-12-21 09:24:08.879702+00:00 > Ramlan	3		9	1
102	2018-12-21 17:45:12.543816+08	7	Ramlan	3		8	1
103	2018-12-21 17:45:31.513309+08	15	2018-12-21 09:32:47.757276+00:00 > Ramlan	3		9	1
104	2018-12-21 17:47:50.043957+08	8	Ramlan	3		8	1
105	2018-12-21 17:47:57.28476+08	16	2018-12-21 09:46:00.515415+00:00 > Ramlan	3		9	1
106	2018-12-21 17:50:17.458753+08	9	Ramlan	3		8	1
107	2018-12-21 17:50:27.763853+08	17	2018-12-21 09:48:19.566598+00:00 > Ramlan	3		9	1
108	2018-12-22 07:48:05.83794+08	18	2018-12-21 09:50:59.960009+00:00 > Ramlan	3		9	1
109	2018-12-22 07:48:38.471086+08	14	chat with > Ramlan	3		18	1
110	2018-12-22 07:48:38.474768+08	13	chat with > Azri	3		18	1
111	2018-12-22 07:53:15.956349+08	16	chat with > Azri	3		18	1
112	2018-12-22 07:53:15.979464+08	15	chat with > Ramlan	3		18	1
113	2018-12-22 07:53:31.965629+08	19	2018-12-21 23:51:18.536623+00:00 > Azri	3		9	1
114	2018-12-22 10:55:04.703137+08	19	chat with > Azri	3		18	1
115	2018-12-22 10:55:24.618886+08	21	2018-12-22 02:53:23.364782+00:00 > Azri	3		9	1
116	2018-12-22 11:13:11.962555+08	2	2. Ramlan	2	[{"changed": {"fields": ["inbox"]}}]	28	1
117	2018-12-22 14:38:11.037324+08	17	chat with > Ramlan	2	[{"changed": {"fields": ["unread"]}}]	18	1
118	2018-12-22 14:41:48.665492+08	17	chat with > Ramlan	2	[{"changed": {"fields": ["unread"]}}]	18	1
119	2018-12-22 14:48:05.967174+08	17	chat with > Ramlan	2	[{"changed": {"fields": ["unread"]}}]	18	1
120	2018-12-22 15:39:54.268875+08	4	4. Badruddin	2	[{"changed": {"fields": ["profile_image"]}}]	28	1
121	2018-12-22 15:42:55.840731+08	21	chat with > Azri	3		18	1
122	2018-12-22 15:42:56.023183+08	20	chat with > Badruddin	3		18	1
123	2018-12-22 15:52:02.343406+08	23	chat with > Azri	3		18	1
124	2018-12-22 15:52:02.373569+08	22	chat with > Badruddin	3		18	1
125	2018-12-22 15:55:46.552868+08	28	2018-12-22 07:52:41.366810+00:00 > Azri	3		9	1
126	2018-12-22 15:55:52.939617+08	27	2018-12-22 07:47:40.009459+00:00 > Azri	3		9	1
127	2018-12-22 15:55:57.552149+08	26	2018-12-22 07:41:26.712406+00:00 > Azri	3		9	1
128	2018-12-22 15:56:11.727464+08	25	chat with > Azri	3		18	1
129	2018-12-22 15:56:11.73135+08	24	chat with > Badruddin	3		18	1
130	2018-12-22 15:58:08.739936+08	27	chat with > Azri	3		18	1
131	2018-12-22 15:58:08.75866+08	26	chat with > Badruddin	3		18	1
132	2018-12-22 15:58:15.522848+08	29	2018-12-22 07:56:56.523256+00:00 > Azri	3		9	1
133	2018-12-22 16:04:46.386512+08	28	chat with > Badruddin	2	[{"changed": {"fields": ["unread"]}}]	18	1
134	2018-12-22 16:04:59.654994+08	28	chat with > Badruddin	2	[{"changed": {"fields": ["unread"]}}]	18	1
135	2018-12-23 19:00:08.223626+08	77	2018-12-23 10:57:11.371700+00:00 > Ramlan	3		9	1
136	2018-12-23 19:00:08.276405+08	76	2018-12-23 10:56:56.500430+00:00 > Ramlan	3		9	1
137	2018-12-23 19:00:08.279584+08	75	2018-12-23 10:56:43.923959+00:00 > Ramlan	3		9	1
138	2018-12-23 19:00:08.281913+08	74	2018-12-23 10:56:24.723746+00:00 > Ramlan	3		9	1
139	2018-12-23 19:00:08.28398+08	73	2018-12-23 10:56:04.885342+00:00 > Ramlan	3		9	1
140	2018-12-23 19:00:08.287679+08	72	2018-12-23 10:54:57.119921+00:00 > Ramlan	3		9	1
141	2018-12-23 19:00:08.289952+08	71	2018-12-23 10:49:49.880268+00:00 > Ramlan	3		9	1
142	2018-12-23 19:00:08.294313+08	70	2018-12-23 10:49:35.749463+00:00 > Ramlan	3		9	1
143	2018-12-23 19:00:08.296576+08	69	2018-12-23 10:49:25.810139+00:00 > Ramlan	3		9	1
144	2018-12-23 19:00:08.298482+08	68	2018-12-23 10:48:37.651265+00:00 > Ramlan	3		9	1
145	2018-12-23 19:00:08.300248+08	67	2018-12-23 10:47:56.728302+00:00 > Azri	3		9	1
146	2018-12-23 19:00:08.303084+08	66	2018-12-23 10:47:22.924766+00:00 > Ramlan	3		9	1
147	2018-12-23 19:00:08.305014+08	65	2018-12-23 10:47:03.062239+00:00 > Ramlan	3		9	1
148	2018-12-23 19:00:08.307115+08	64	2018-12-23 10:46:45.142132+00:00 > Ramlan	3		9	1
149	2018-12-23 19:00:08.317944+08	63	2018-12-23 10:46:27.311624+00:00 > Ramlan	3		9	1
150	2018-12-23 19:00:08.320279+08	62	2018-12-23 10:40:49.945944+00:00 > Ramlan	3		9	1
151	2018-12-23 19:00:08.322931+08	61	2018-12-23 10:40:21.499399+00:00 > Ramlan	3		9	1
152	2018-12-23 19:00:08.327165+08	60	2018-12-23 10:39:28.321078+00:00 > Ramlan	3		9	1
153	2018-12-23 19:00:08.329467+08	59	2018-12-23 10:39:08.409970+00:00 > Ramlan	3		9	1
154	2018-12-23 19:00:08.331811+08	58	2018-12-23 10:38:18.755478+00:00 > Ramlan	3		9	1
155	2018-12-23 19:00:08.335394+08	57	2018-12-23 10:30:58.021413+00:00 > Ramlan	3		9	1
156	2018-12-23 19:00:08.33777+08	56	2018-12-23 10:29:59.021975+00:00 > Ramlan	3		9	1
157	2018-12-23 19:00:08.339904+08	55	2018-12-23 09:24:41.727830+00:00 > Ramlan	3		9	1
158	2018-12-23 19:00:08.344186+08	54	2018-12-23 09:24:21.232318+00:00 > Azri	3		9	1
159	2018-12-23 19:00:08.346751+08	53	2018-12-23 09:24:09.565468+00:00 > Azri	3		9	1
160	2018-12-23 19:00:08.349541+08	52	2018-12-23 09:23:56.055776+00:00 > Ramlan	3		9	1
161	2018-12-23 19:00:08.352356+08	51	2018-12-23 09:22:54.400571+00:00 > Ramlan	3		9	1
162	2018-12-23 19:00:08.354371+08	50	2018-12-23 09:17:03.573251+00:00 > Ramlan	3		9	1
163	2018-12-23 19:00:08.356847+08	49	2018-12-23 09:14:02.054381+00:00 > Ramlan	3		9	1
164	2018-12-23 19:00:08.361151+08	48	2018-12-23 08:47:07.918629+00:00 > Ramlan	3		9	1
165	2018-12-23 19:00:08.36391+08	47	2018-12-23 08:40:50.877395+00:00 > Ramlan	3		9	1
166	2018-12-23 19:00:08.368888+08	46	2018-12-23 08:40:26.295406+00:00 > Azri	3		9	1
167	2018-12-23 19:00:08.371043+08	45	2018-12-23 08:39:23.567940+00:00 > Azri	3		9	1
168	2018-12-23 19:00:08.374362+08	44	2018-12-23 08:38:03.553037+00:00 > Azri	3		9	1
169	2018-12-23 19:00:08.378931+08	43	2018-12-23 08:33:17.804692+00:00 > Azri	3		9	1
170	2018-12-23 19:00:08.381431+08	42	2018-12-23 08:30:49.015984+00:00 > Azri	3		9	1
171	2018-12-23 19:00:08.384996+08	41	2018-12-23 08:29:46.908670+00:00 > Ramlan	3		9	1
172	2018-12-23 19:00:08.387135+08	40	2018-12-23 08:24:36.030619+00:00 > Ramlan	3		9	1
173	2018-12-23 19:00:08.389613+08	39	2018-12-23 08:23:17.169817+00:00 > Azri	3		9	1
174	2018-12-23 19:00:08.395042+08	38	2018-12-23 08:21:47.585122+00:00 > Ramlan	3		9	1
175	2018-12-23 19:00:08.398675+08	37	2018-12-22 09:18:10.378162+00:00 > Azri	3		9	1
176	2018-12-23 19:00:08.40128+08	36	2018-12-22 09:15:40.503394+00:00 > Azri	3		9	1
177	2018-12-23 19:00:08.403676+08	35	2018-12-22 08:11:55.365260+00:00 > Ramlan	3		9	1
178	2018-12-23 19:00:08.407732+08	34	2018-12-22 08:05:58.350625+00:00 > Azri	3		9	1
179	2018-12-23 19:00:08.411837+08	33	2018-12-22 08:05:39.227289+00:00 > Azri	3		9	1
180	2018-12-23 19:00:08.41436+08	32	2018-12-22 08:01:12.110566+00:00 > Azri	3		9	1
181	2018-12-23 19:00:08.416846+08	31	2018-12-22 07:59:08.130979+00:00 > Azri	3		9	1
182	2018-12-23 19:00:08.420124+08	30	2018-12-22 07:58:52.214224+00:00 > Azri	3		9	1
183	2018-12-23 19:00:08.423204+08	25	2018-12-22 07:39:15.395644+00:00 > Azri	3		9	1
184	2018-12-23 19:00:08.425842+08	24	2018-12-22 03:38:53.618964+00:00 > Ramlan	3		9	1
185	2018-12-23 19:00:08.429195+08	23	2018-12-22 03:38:31.668863+00:00 > Ramlan	3		9	1
186	2018-12-23 19:00:08.431832+08	22	2018-12-22 03:16:40.433564+00:00 > Azri	3		9	1
187	2018-12-23 19:00:08.434602+08	20	2018-12-21 23:53:59.961667+00:00 > Azri	3		9	1
188	2018-12-23 19:00:19.23153+08	29	Inbox object (29)	3		18	1
189	2018-12-23 19:00:19.235431+08	28	Inbox object (28)	3		18	1
190	2018-12-23 19:00:19.238578+08	18	Inbox object (18)	3		18	1
191	2018-12-23 19:00:19.240899+08	17	Inbox object (17)	3		18	1
192	2018-12-23 19:09:27.966933+08	31	Inbox object (31)	3		18	1
193	2018-12-23 19:09:28.00096+08	30	Inbox object (30)	3		18	1
194	2018-12-23 19:09:35.55172+08	80	2018-12-23 11:02:31.822015+00:00 > Azri	3		9	1
195	2018-12-23 19:09:35.555856+08	79	2018-12-23 11:01:53.315398+00:00 > Azri	3		9	1
196	2018-12-23 19:09:35.558314+08	78	2018-12-23 11:01:35.812273+00:00 > Ramlan	3		9	1
197	2018-12-23 21:05:01.101402+08	91	2018-12-23 11:14:29.717670+00:00 > Azri	3		9	1
198	2018-12-23 21:05:01.254649+08	90	2018-12-23 11:14:18.567801+00:00 > Ramlan	3		9	1
199	2018-12-23 21:05:01.498709+08	89	2018-12-23 11:14:08.537330+00:00 > Azri	3		9	1
200	2018-12-23 21:05:01.762625+08	88	2018-12-23 11:13:57.409201+00:00 > Azri	3		9	1
201	2018-12-23 21:05:02.003269+08	87	2018-12-23 11:13:47.628401+00:00 > Ramlan	3		9	1
202	2018-12-23 21:05:02.25079+08	86	2018-12-23 11:13:39.963298+00:00 > Azri	3		9	1
203	2018-12-23 21:05:02.451783+08	85	2018-12-23 11:12:19.287130+00:00 > Azri	3		9	1
204	2018-12-23 21:05:02.761309+08	84	2018-12-23 11:12:07.871107+00:00 > Ramlan	3		9	1
205	2018-12-23 21:05:03.01326+08	83	2018-12-23 11:11:21.710212+00:00 > Azri	3		9	1
206	2018-12-23 21:05:03.228906+08	82	2018-12-23 11:11:07.239211+00:00 > Ramlan	3		9	1
207	2018-12-23 21:05:03.452571+08	81	2018-12-23 11:10:45.750732+00:00 > Ramlan	3		9	1
208	2018-12-23 21:05:20.286146+08	33	Inbox object (33)	3		18	1
209	2018-12-23 21:05:20.302636+08	32	Inbox object (32)	3		18	1
210	2018-12-23 21:13:05.355737+08	35	Inbox object (35)	3		18	1
211	2018-12-23 21:13:05.359615+08	34	Inbox object (34)	3		18	1
212	2018-12-23 21:13:12.365134+08	92	2018-12-23 13:12:40.840052+00:00 > Ramlan	3		9	1
213	2018-12-23 21:34:57.446+08	37	Inbox object (37)	3		18	1
214	2018-12-23 21:34:57.451492+08	36	Inbox object (36)	3		18	1
215	2018-12-23 21:35:06.3912+08	97	2018-12-23 13:15:20.594753+00:00 > Ramlan	3		9	1
216	2018-12-23 21:35:06.395234+08	96	2018-12-23 13:15:05.043545+00:00 > Azri	3		9	1
217	2018-12-23 21:35:06.401708+08	95	2018-12-23 13:14:58.087232+00:00 > Ramlan	3		9	1
218	2018-12-23 21:35:06.404088+08	94	2018-12-23 13:14:44.651180+00:00 > Azri	3		9	1
219	2018-12-23 21:35:06.406125+08	93	2018-12-23 13:14:26.568116+00:00 > Ramlan	3		9	1
220	2018-12-23 21:38:45.554201+08	41	Inbox object (41)	3		18	1
221	2018-12-23 21:38:45.559328+08	40	Inbox object (40)	3		18	1
222	2018-12-23 21:38:45.561346+08	39	Inbox object (39)	3		18	1
223	2018-12-23 21:38:45.563084+08	38	Inbox object (38)	3		18	1
224	2018-12-23 21:39:30.372632+08	43	Inbox object (43)	3		18	1
225	2018-12-23 21:39:30.377222+08	42	Inbox object (42)	3		18	1
226	2018-12-24 12:02:56.762693+08	1	Ramlan	1	[{"added": {}}]	36	1
227	2018-12-24 12:04:41.836976+08	48	Inbox object (48)	1	[{"added": {}}]	18	1
228	2018-12-24 12:06:53.265368+08	2	2. Ramlan	2	[{"changed": {"fields": ["inbox"]}}]	28	1
229	2018-12-24 12:24:08.430951+08	1	agency	1	[{"added": {}}]	37	1
230	2018-12-24 12:24:18.35102+08	2	group	1	[{"added": {}}]	37	1
231	2018-12-24 12:24:24.320889+08	3	upline group	1	[{"added": {}}]	37	1
232	2018-12-24 18:02:03.31779+08	48	Inbox object (48)	2	[{"changed": {"fields": ["unread"]}}]	18	1
233	2018-12-25 09:55:08.814834+08	1	Mutual fund investment	2	[{"changed": {"fields": ["name"]}}]	19	1
234	2018-12-25 11:50:03.489774+08	2	Ramlan	1	[{"added": {}}]	36	1
235	2018-12-25 11:54:03.480499+08	49	Group chat	1	[{"added": {}}]	18	1
236	2018-12-25 12:13:50.144837+08	2	2. Ramlan	2	[{"changed": {"fields": ["inbox"]}}]	28	1
237	2018-12-25 12:24:12.65098+08	49	Group chat (Ramlan, group)	2	[{"changed": {"fields": ["unread"]}}]	18	1
238	2018-12-26 10:21:41.757022+08	1	closed sales	1	[{"added": {}}]	22	1
239	2018-12-26 10:21:59.199156+08	2	joining field work	1	[{"added": {}}]	22	1
240	2018-12-26 10:22:13.686842+08	3	inbox	1	[{"added": {}}]	22	1
241	2018-12-26 10:23:14.463228+08	1	3. Azri inbox 2018-12-26 02:23:14.406568+00:00	1	[{"added": {}}]	21	1
242	2018-12-26 10:23:49.544626+08	2	4. Badruddin inbox 2018-12-26 02:23:49.542694+00:00	1	[{"added": {}}]	21	1
243	2018-12-26 10:24:12.821379+08	2	2. Ramlan	2	[{"changed": {"fields": ["notifications"]}}]	28	1
244	2018-12-26 13:08:32.749562+08	4	group inbox	1	[{"added": {}}]	22	1
245	2018-12-26 17:48:06.936433+08	3	4. Badruddin group inbox 2018-12-26 09:48:06.921029+00:00	1	[{"added": {}}]	21	1
246	2018-12-26 17:48:21.670746+08	2	2. Ramlan	2	[{"changed": {"fields": ["notifications"]}}]	28	1
247	2018-12-26 23:03:56.1576+08	3	3. Azri	2	[{"changed": {"fields": ["inbox"]}}]	28	1
248	2018-12-26 23:04:22.553821+08	3	3. Azri	2	[{"changed": {"fields": ["inbox"]}}]	28	1
249	2018-12-26 23:15:05.560347+08	3	upline group	3		37	1
250	2018-12-27 00:15:22.460951+08	50	50.Group chat (group)	1	[{"added": {}}]	18	1
251	2018-12-27 00:16:38.967667+08	3	3. Azri	2	[{"changed": {"fields": ["inbox"]}}]	28	1
252	2018-12-27 00:33:06.031057+08	50	50.Group chat (group)	2	[{"changed": {"fields": ["unread"]}}]	18	1
253	2018-12-27 00:34:37.529771+08	2	Ramlan (group)	2	[{"changed": {"fields": ["participants"]}}]	36	1
254	2018-12-27 14:50:16.03628+08	7	3. Azri inbox 2018-12-27 06:44:10.053552+00:00	3		21	1
255	2018-12-27 14:50:16.139337+08	6	3. Azri inbox 2018-12-27 06:44:10.034168+00:00	3		21	1
256	2018-12-28 07:18:28.119287+08	50	50.Group chat (group)	2	[{"changed": {"fields": ["group_chat"]}}]	18	1
257	2018-12-28 07:18:37.555746+08	49	49.Group chat (group)	2	[{"changed": {"fields": ["group_chat"]}}]	18	1
258	2018-12-28 07:18:47.675312+08	48	48.Group chat (agency)	2	[{"changed": {"fields": ["group_chat"]}}]	18	1
259	2018-12-28 11:56:04.359102+08	11	2. Ramlan group inbox 2018-12-27 08:22:43.324895+00:00	2	[{"changed": {"fields": ["inbox_rel"]}}]	21	1
260	2018-12-28 12:04:59.299951+08	10	10. Azri group inbox	2	[{"changed": {"fields": ["inbox_rel"]}}]	21	1
261	2018-12-28 12:06:49.660802+08	10	10. group inbox	2	[{"changed": {"fields": ["inbox_rel"]}}]	21	1
262	2018-12-28 12:07:12.56288+08	10	10. group inbox	2	[{"changed": {"fields": ["inbox_rel"]}}]	21	1
263	2018-12-28 12:17:26.513962+08	11	11. group inbox	3		21	1
264	2018-12-28 12:17:26.51924+08	10	10. group inbox	3		21	1
265	2018-12-28 12:17:26.521374+08	9	9. group inbox	3		21	1
266	2018-12-28 12:17:26.523343+08	8	8. group inbox	3		21	1
267	2018-12-28 12:17:26.525331+08	5	5. inbox	3		21	1
268	2018-12-28 12:17:26.527559+08	4	4. inbox	3		21	1
269	2018-12-28 12:17:26.530404+08	3	3. group inbox	3		21	1
270	2018-12-28 12:17:26.532699+08	2	2. inbox	3		21	1
271	2018-12-28 12:17:26.535082+08	1	1. inbox	3		21	1
272	2018-12-28 13:09:51.651576+08	2	joining field work	2	[{"changed": {"fields": ["name"]}}]	27	1
273	2018-12-28 13:09:58.66999+08	1	sales closed	2	[{"changed": {"fields": ["name"]}}]	27	1
274	2018-12-28 13:10:13.209918+08	1	2018-12-28 05:06:52.216979+00:00	3		29	1
275	2018-12-28 16:22:31.2035+08	177	2018-12-28 08:22:02.531324+00:00 > Ramlan	3		9	1
276	2018-12-28 16:22:31.208955+08	176	2018-12-28 08:21:31.872741+00:00 > Ramlan	3		9	1
277	2018-12-28 16:22:31.211443+08	175	2018-12-28 08:20:36.495399+00:00 > Azri	3		9	1
278	2018-12-28 16:22:31.214319+08	174	2018-12-28 08:20:28.322346+00:00 > Ramlan	3		9	1
279	2018-12-28 16:22:31.217446+08	173	2018-12-28 08:19:58.354950+00:00 > Azri	3		9	1
280	2018-12-28 16:22:31.219535+08	172	2018-12-28 08:19:38.964928+00:00 > Ramlan	3		9	1
281	2018-12-28 16:22:31.221364+08	171	2018-12-28 08:19:06.332884+00:00 > Azri	3		9	1
282	2018-12-28 16:22:31.223485+08	170	2018-12-28 08:15:58.110632+00:00 > Ramlan	3		9	1
283	2018-12-28 16:22:31.225686+08	169	2018-12-28 08:15:34.521927+00:00 > Ramlan	3		9	1
284	2018-12-28 16:22:31.227995+08	168	2018-12-28 08:13:39.142530+00:00 > Ramlan	3		9	1
285	2018-12-28 16:22:31.452287+08	167	2018-12-28 08:13:05.253575+00:00 > Ramlan	3		9	1
286	2018-12-28 16:22:31.454539+08	166	2018-12-28 08:11:06.267333+00:00 > Ramlan	3		9	1
287	2018-12-28 16:22:31.457073+08	165	2018-12-28 08:05:42.361776+00:00 > Ramlan	3		9	1
288	2018-12-28 16:22:31.458955+08	164	2018-12-28 08:04:58.308394+00:00 > Ramlan	3		9	1
289	2018-12-28 16:22:31.461257+08	163	2018-12-28 08:04:25.537804+00:00 > Azri	3		9	1
290	2018-12-28 16:22:31.465225+08	162	2018-12-28 08:04:01.797571+00:00 > Azri	3		9	1
291	2018-12-28 16:22:31.46838+08	161	2018-12-28 08:03:56.353047+00:00 > Ramlan	3		9	1
292	2018-12-28 16:22:31.470261+08	160	2018-12-28 08:03:31.403483+00:00 > Ramlan	3		9	1
293	2018-12-28 16:22:31.473096+08	159	2018-12-28 08:01:47.401263+00:00 > Azri	3		9	1
294	2018-12-28 16:22:31.475176+08	158	2018-12-28 08:00:26.540414+00:00 > Ramlan	3		9	1
295	2018-12-28 16:22:31.476989+08	157	2018-12-28 07:59:26.981282+00:00 > Ramlan	3		9	1
296	2018-12-28 16:22:31.480593+08	156	2018-12-28 07:57:03.923004+00:00 > Azri	3		9	1
297	2018-12-28 16:22:31.483098+08	155	2018-12-28 07:56:49.569299+00:00 > Ramlan	3		9	1
298	2018-12-28 16:22:31.484936+08	154	2018-12-28 07:53:21.113504+00:00 > Azri	3		9	1
299	2018-12-28 16:22:31.486707+08	153	2018-12-28 07:52:04.164715+00:00 > Ramlan	3		9	1
300	2018-12-28 16:22:31.490017+08	152	2018-12-28 07:50:14.956375+00:00 > Ramlan	3		9	1
301	2018-12-28 16:22:31.492944+08	151	2018-12-28 07:50:00.090694+00:00 > Azri	3		9	1
302	2018-12-28 16:22:31.495348+08	150	2018-12-28 06:49:48.163303+00:00 > Azri	3		9	1
303	2018-12-28 16:22:31.498256+08	149	2018-12-28 06:47:47.008982+00:00 > Azri	3		9	1
304	2018-12-28 16:22:31.500171+08	148	2018-12-28 04:44:46.764521+00:00 > Ramlan	3		9	1
305	2018-12-28 16:22:31.718813+08	147	2018-12-28 04:43:46.892213+00:00 > Ramlan	3		9	1
306	2018-12-28 16:22:31.721234+08	146	2018-12-28 04:40:24.648013+00:00 > Ramlan	3		9	1
307	2018-12-28 16:22:31.723842+08	145	2018-12-28 04:37:59.360361+00:00 > Ramlan	3		9	1
308	2018-12-28 16:22:31.726609+08	144	2018-12-28 04:28:55.447581+00:00 > Ramlan	3		9	1
309	2018-12-28 16:22:31.728897+08	143	2018-12-28 04:26:26.063543+00:00 > Azri	3		9	1
310	2018-12-28 16:22:31.730871+08	142	2018-12-27 08:22:48.448185+00:00 > Ramlan	3		9	1
311	2018-12-28 16:22:31.732638+08	141	2018-12-27 08:22:43.336274+00:00 > Ramlan	3		9	1
312	2018-12-28 16:22:31.73477+08	140	2018-12-27 08:21:08.481409+00:00 > Azri	3		9	1
313	2018-12-28 16:22:31.736576+08	139	2018-12-27 08:19:49.759824+00:00 > Azri	3		9	1
314	2018-12-28 16:22:31.738483+08	138	2018-12-27 06:44:10.061397+00:00 > Azri	3		9	1
315	2018-12-28 16:22:31.74046+08	137	2018-12-27 04:55:45.442054+00:00 > Ramlan	3		9	1
316	2018-12-28 16:22:31.742885+08	136	2018-12-27 04:33:14.568516+00:00 > Azri	3		9	1
317	2018-12-28 16:22:31.745931+08	135	2018-12-27 04:22:24.796717+00:00 > Azri	3		9	1
318	2018-12-28 16:22:31.748114+08	134	2018-12-27 04:19:58.944563+00:00 > Azri	3		9	1
319	2018-12-28 16:22:31.749838+08	133	2018-12-27 04:16:44.903762+00:00 > Azri	3		9	1
320	2018-12-28 16:22:31.751466+08	132	2018-12-26 16:49:04.647747+00:00 > Azri	3		9	1
321	2018-12-28 16:22:31.753059+08	131	2018-12-26 16:46:19.476410+00:00 > Ramlan	3		9	1
322	2018-12-28 16:22:31.754679+08	130	2018-12-26 16:43:31.039875+00:00 > Ramlan	3		9	1
323	2018-12-28 16:22:31.757174+08	129	2018-12-26 16:39:48.469949+00:00 > Azri	3		9	1
324	2018-12-28 16:22:31.759689+08	128	2018-12-26 16:36:54.174079+00:00 > Ramlan	3		9	1
325	2018-12-28 16:22:31.986516+08	127	2018-12-26 16:35:59.333457+00:00 > Azri	3		9	1
326	2018-12-28 16:22:31.989846+08	126	2018-12-26 16:34:58.240114+00:00 > Ramlan	3		9	1
327	2018-12-28 16:22:31.992128+08	125	2018-12-26 16:33:43.135592+00:00 > Azri	3		9	1
328	2018-12-28 16:22:31.99423+08	124	2018-12-26 16:23:30.734676+00:00 > Ramlan	3		9	1
329	2018-12-28 16:22:31.996492+08	123	2018-12-26 16:22:58.337090+00:00 > Ramlan	3		9	1
330	2018-12-28 16:22:31.998544+08	122	2018-12-26 15:16:06.614338+00:00 > Azri	3		9	1
331	2018-12-28 16:22:32.000476+08	121	2018-12-25 04:26:15.941312+00:00 > Ramlan	3		9	1
332	2018-12-28 16:22:32.029693+08	120	2018-12-24 23:57:19.045674+00:00 > Ramlan	3		9	1
333	2018-12-28 16:22:32.032641+08	119	2018-12-24 23:55:00.391538+00:00 > Ramlan	3		9	1
334	2018-12-28 16:22:32.034747+08	118	2018-12-24 23:54:36.450625+00:00 > Ramlan	3		9	1
335	2018-12-28 16:22:32.036829+08	117	2018-12-24 23:47:24.005013+00:00 > Ramlan	3		9	1
336	2018-12-28 16:22:32.039153+08	116	2018-12-24 23:45:02.759292+00:00 > Ramlan	3		9	1
337	2018-12-28 16:22:32.041928+08	115	2018-12-24 23:41:07.574847+00:00 > Ramlan	3		9	1
338	2018-12-28 16:22:32.0439+08	114	2018-12-23 16:00:23.267541+00:00 > Azri	3		9	1
339	2018-12-28 16:22:32.04598+08	113	2018-12-23 16:00:03.078253+00:00 > Ramlan	3		9	1
340	2018-12-28 16:22:32.048639+08	112	2018-12-23 15:48:21.648429+00:00 > Ramlan	3		9	1
341	2018-12-28 16:22:32.050766+08	111	2018-12-23 15:44:43.556820+00:00 > Ramlan	3		9	1
342	2018-12-28 16:22:32.274888+08	110	2018-12-23 13:42:44.261200+00:00 > Azri	3		9	1
343	2018-12-28 16:22:32.277508+08	109	2018-12-23 13:42:39.199191+00:00 > Azri	3		9	1
344	2018-12-28 16:22:32.279715+08	108	2018-12-23 13:42:11.221883+00:00 > Azri	3		9	1
345	2018-12-28 16:22:32.281798+08	107	2018-12-23 13:42:02.676391+00:00 > Badruddin	3		9	1
346	2018-12-28 16:22:32.283713+08	106	2018-12-23 13:41:46.307226+00:00 > Azri	3		9	1
347	2018-12-28 16:22:32.285805+08	105	2018-12-23 13:41:36.065786+00:00 > Badruddin	3		9	1
348	2018-12-28 16:22:32.287647+08	104	2018-12-23 13:41:21.199729+00:00 > Azri	3		9	1
349	2018-12-28 16:22:32.28947+08	103	2018-12-23 13:41:14.176689+00:00 > Badruddin	3		9	1
350	2018-12-28 16:22:32.293447+08	102	2018-12-23 13:40:52.372639+00:00 > Azri	3		9	1
351	2018-12-28 16:22:32.295898+08	101	2018-12-23 13:40:09.041845+00:00 > Azri	3		9	1
352	2018-12-28 16:22:32.297901+08	100	2018-12-23 13:39:14.143489+00:00 > Azri	3		9	1
353	2018-12-28 16:22:32.299699+08	99	2018-12-23 13:37:59.057891+00:00 > Azri	3		9	1
354	2018-12-28 16:22:32.301446+08	98	2018-12-23 13:37:07.291044+00:00 > Azri	3		9	1
355	2018-12-28 16:23:11.365334+08	47	47.Personal	3		18	1
356	2018-12-28 16:23:11.369098+08	46	46.Personal	3		18	1
357	2018-12-28 16:23:11.371409+08	45	45.Personal	3		18	1
358	2018-12-28 16:23:11.373815+08	44	44.Personal	3		18	1
359	2018-12-28 16:39:52.89521+08	191	2018-12-28 08:39:02.945287+00:00 > Azri	3		9	1
360	2018-12-28 16:39:52.899766+08	190	2018-12-28 08:38:52.826422+00:00 > Ramlan	3		9	1
361	2018-12-28 16:39:52.902085+08	189	2018-12-28 08:35:16.267389+00:00 > Azri	3		9	1
362	2018-12-28 16:39:52.90395+08	188	2018-12-28 08:35:00.554386+00:00 > Ramlan	3		9	1
363	2018-12-28 16:39:52.906077+08	187	2018-12-28 08:34:49.787978+00:00 > Azri	3		9	1
364	2018-12-28 16:39:52.908478+08	186	2018-12-28 08:33:01.522024+00:00 > Azri	3		9	1
365	2018-12-28 16:39:52.910268+08	185	2018-12-28 08:32:41.289432+00:00 > Ramlan	3		9	1
366	2018-12-28 16:39:52.911879+08	184	2018-12-28 08:32:25.983536+00:00 > Azri	3		9	1
367	2018-12-28 16:39:52.913647+08	183	2018-12-28 08:31:52.647320+00:00 > Azri	3		9	1
368	2018-12-28 16:39:52.916293+08	182	2018-12-28 08:30:39.893782+00:00 > Azri	3		9	1
369	2018-12-28 16:39:52.918401+08	181	2018-12-28 08:29:59.755350+00:00 > Azri	3		9	1
370	2018-12-28 16:39:52.920021+08	180	2018-12-28 08:29:32.955146+00:00 > Ramlan	3		9	1
371	2018-12-28 16:39:52.921553+08	179	2018-12-28 08:24:29.617430+00:00 > Ramlan	3		9	1
372	2018-12-28 16:39:52.923072+08	178	2018-12-28 08:24:01.707593+00:00 > Azri	3		9	1
373	2018-12-28 16:40:04.05437+08	52	52.Personal	3		18	1
374	2018-12-28 16:40:04.059617+08	51	51.Personal	3		18	1
375	2018-12-28 17:09:29.60779+08	52	52. inbox	3		21	1
376	2018-12-28 17:09:29.611957+08	51	51. inbox	3		21	1
377	2018-12-28 17:09:29.615142+08	24	24. group inbox	3		21	1
378	2018-12-28 17:09:29.617436+08	23	23. group inbox	3		21	1
379	2018-12-28 17:09:29.61962+08	22	22. group inbox	3		21	1
380	2018-12-28 17:09:29.621583+08	21	21. group inbox	3		21	1
381	2018-12-28 17:09:29.623456+08	20	20. group inbox	3		21	1
382	2018-12-28 17:09:29.625254+08	19	19. group inbox	3		21	1
383	2018-12-28 17:09:29.62717+08	18	18. group inbox	3		21	1
384	2018-12-28 17:09:29.629014+08	17	17. group inbox	3		21	1
385	2018-12-28 17:09:29.631686+08	16	16. group inbox	3		21	1
386	2018-12-28 17:09:29.634713+08	15	15. group inbox	3		21	1
387	2018-12-28 17:09:29.636715+08	14	14. group inbox	3		21	1
388	2018-12-28 17:09:29.638528+08	13	13. group inbox	3		21	1
389	2018-12-28 17:09:29.640302+08	12	12. group inbox	3		21	1
390	2018-12-28 17:56:00.187744+08	72	72. group inbox	3		21	1
391	2018-12-28 17:56:00.192278+08	71	71. group inbox	3		21	1
392	2018-12-28 17:56:00.199173+08	70	70. group inbox	3		21	1
393	2018-12-28 17:56:00.202199+08	69	69. group inbox	3		21	1
394	2018-12-28 17:56:00.204233+08	68	68. group inbox	3		21	1
395	2018-12-28 17:56:00.207172+08	67	67. group inbox	3		21	1
396	2018-12-28 17:56:00.209745+08	66	66. group inbox	3		21	1
397	2018-12-28 17:56:00.211708+08	65	65. group inbox	3		21	1
398	2018-12-28 17:56:00.213964+08	64	64. group inbox	3		21	1
399	2018-12-28 17:56:00.216724+08	63	63. group inbox	3		21	1
400	2018-12-28 17:56:00.218839+08	62	62. group inbox	3		21	1
401	2018-12-28 17:56:00.220686+08	61	61. group inbox	3		21	1
402	2018-12-28 17:56:00.222523+08	60	60. group inbox	3		21	1
403	2018-12-28 17:56:00.224641+08	59	59. group inbox	3		21	1
404	2018-12-28 17:56:00.227546+08	58	58. group inbox	3		21	1
405	2018-12-28 17:56:00.229721+08	57	57. group inbox	3		21	1
406	2018-12-28 17:56:00.232365+08	56	56. group inbox	3		21	1
407	2018-12-28 17:56:00.234372+08	55	55. group inbox	3		21	1
408	2018-12-28 17:56:00.236188+08	54	54. group inbox	3		21	1
409	2018-12-28 17:56:00.269584+08	53	53. group inbox	3		21	1
410	2018-12-30 10:12:45.903232+08	92	92. inbox	3		21	1
411	2018-12-30 10:12:46.962368+08	91	91. inbox	3		21	1
412	2018-12-30 10:12:46.995968+08	90	90. inbox	3		21	1
413	2018-12-30 10:12:47.125203+08	89	89. inbox	3		21	1
414	2018-12-30 10:12:47.206617+08	88	88. inbox	3		21	1
415	2018-12-30 10:12:47.261446+08	87	87. inbox	3		21	1
416	2018-12-30 10:12:47.329899+08	86	86. inbox	3		21	1
417	2018-12-30 10:12:47.340399+08	85	85. inbox	3		21	1
418	2018-12-30 10:12:47.342894+08	84	84. inbox	3		21	1
419	2018-12-30 10:12:47.347886+08	83	83. inbox	3		21	1
420	2018-12-30 10:12:47.356728+08	82	82. group inbox	3		21	1
421	2018-12-30 10:12:47.358939+08	81	81. group inbox	3		21	1
422	2018-12-30 10:12:47.361948+08	80	80. inbox	3		21	1
423	2018-12-30 10:12:47.394097+08	79	79. inbox	3		21	1
424	2018-12-30 10:12:47.444795+08	78	78. inbox	3		21	1
425	2018-12-30 10:12:47.473726+08	77	77. inbox	3		21	1
426	2018-12-30 10:12:47.529878+08	76	76. inbox	3		21	1
427	2018-12-30 10:12:47.586633+08	75	75. group inbox	3		21	1
428	2018-12-30 10:12:47.610074+08	74	74. group inbox	3		21	1
429	2018-12-30 10:12:47.659009+08	73	73. group inbox	3		21	1
430	2018-12-30 11:11:59.945089+08	104	104. inbox	3		21	1
431	2018-12-30 11:12:00.109645+08	103	103. inbox	3		21	1
432	2018-12-30 11:12:00.154776+08	102	102. inbox	3		21	1
433	2018-12-30 11:12:00.297424+08	101	101. inbox	3		21	1
434	2018-12-30 11:12:00.50505+08	100	100. inbox	3		21	1
435	2018-12-30 11:12:00.702504+08	99	99. inbox	3		21	1
436	2018-12-30 11:12:00.908171+08	98	98. inbox	3		21	1
437	2018-12-30 11:12:00.917273+08	97	97. inbox	3		21	1
438	2018-12-30 11:12:01.075882+08	96	96. inbox	3		21	1
439	2018-12-30 11:12:01.271728+08	95	95. inbox	3		21	1
440	2018-12-30 11:12:01.310192+08	94	94. inbox	3		21	1
441	2018-12-30 11:12:01.486177+08	93	93. inbox	3		21	1
442	2018-12-31 14:29:29.216411+08	40	2018-12-31 06:24:24.050753+00:00	3		11	1
443	2018-12-31 14:29:29.301383+08	39	2018-12-31 06:24:16.179948+00:00	3		11	1
444	2018-12-31 14:29:29.305108+08	38	2018-12-31 06:22:42.528444+00:00	3		11	1
445	2018-12-31 14:29:29.308208+08	37	2018-12-31 06:20:34.034260+00:00	3		11	1
446	2018-12-31 14:29:29.310374+08	36	2018-12-31 06:19:57.965947+00:00	3		11	1
447	2018-12-31 14:29:29.312484+08	35	2018-12-31 06:18:24.001552+00:00	3		11	1
448	2018-12-31 14:29:29.315002+08	34	2018-12-31 06:16:28.981112+00:00	3		11	1
449	2018-12-31 14:29:29.31748+08	33	2018-12-31 06:16:09.046321+00:00	3		11	1
450	2018-12-31 14:29:29.320438+08	32	2018-12-31 06:13:30.616048+00:00	3		11	1
451	2018-12-31 14:29:29.322559+08	31	2018-12-31 06:10:58.704290+00:00	3		11	1
452	2018-12-31 14:29:29.325147+08	30	2018-12-31 06:10:00.119835+00:00	3		11	1
453	2018-12-31 14:29:29.32701+08	29	2018-12-31 06:09:07.224992+00:00	3		11	1
454	2018-12-31 14:29:29.329561+08	28	2018-12-31 06:08:48.333317+00:00	3		11	1
455	2018-12-31 14:29:29.332908+08	27	2018-12-31 06:08:20.604186+00:00	3		11	1
456	2018-12-31 14:29:29.334961+08	26	2018-12-31 06:07:48.458583+00:00	3		11	1
457	2018-12-31 14:29:29.337412+08	25	2018-12-31 06:04:13.382382+00:00	3		11	1
458	2018-12-31 14:29:29.340349+08	24	2018-12-31 06:01:58.616300+00:00	3		11	1
459	2018-12-31 14:29:29.342431+08	23	2018-12-31 05:59:25.082221+00:00	3		11	1
460	2018-12-31 14:29:29.344193+08	22	2018-12-31 05:58:58.661541+00:00	3		11	1
461	2018-12-31 14:29:29.346494+08	21	2018-12-31 05:58:02.663699+00:00	3		11	1
462	2018-12-31 14:29:29.348946+08	20	2018-12-31 05:56:51.240282+00:00	3		11	1
463	2018-12-31 14:29:29.350805+08	19	2018-12-31 05:55:03.020575+00:00	3		11	1
464	2018-12-31 14:29:29.352538+08	18	2018-12-31 04:32:08.293422+00:00	3		11	1
465	2018-12-31 14:29:29.356295+08	17	2018-12-31 04:31:58.367970+00:00	3		11	1
466	2018-12-31 14:29:29.358552+08	16	2018-12-31 04:30:27.116551+00:00	3		11	1
467	2018-12-31 14:29:29.360346+08	15	2018-12-31 04:27:10.306755+00:00	3		11	1
468	2018-12-31 14:29:29.362297+08	14	2018-12-31 04:26:58.855562+00:00	3		11	1
469	2018-12-31 14:29:29.365357+08	13	2018-12-31 04:26:46.066374+00:00	3		11	1
470	2018-12-31 14:29:29.367258+08	12	2018-12-31 04:26:34.946893+00:00	3		11	1
471	2018-12-31 14:29:29.369646+08	11	2018-12-31 04:25:35.019446+00:00	3		11	1
472	2018-12-31 14:29:29.373141+08	10	2018-12-31 04:25:12.767473+00:00	3		11	1
473	2018-12-31 14:29:29.375062+08	9	2018-12-31 04:21:59.234414+00:00	3		11	1
474	2018-12-31 14:29:29.376824+08	8	2018-12-31 04:21:24.411734+00:00	3		11	1
475	2018-12-31 14:29:29.380117+08	7	2018-12-31 04:20:57.928519+00:00	3		11	1
476	2018-12-31 14:29:29.382184+08	6	2018-12-31 04:19:54.384460+00:00	3		11	1
477	2018-12-31 14:29:29.383835+08	5	2018-12-31 04:19:47.624843+00:00	3		11	1
478	2018-12-31 14:29:29.386467+08	4	2018-12-31 04:18:35.990830+00:00	3		11	1
479	2018-12-31 14:29:29.389272+08	3	2018-12-31 04:18:27.571947+00:00	3		11	1
480	2018-12-31 14:29:29.390977+08	2	2018-12-31 04:18:03.886480+00:00	3		11	1
481	2018-12-31 14:29:29.393072+08	1	2018-12-31 04:17:45.380320+00:00	3		11	1
482	2018-12-31 15:25:13.433253+08	5	like	1	[{"added": {}}]	22	1
483	2018-12-31 15:27:06.163356+08	6	comment	1	[{"added": {}}]	22	1
484	2019-01-02 14:28:55.44072+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
485	2019-01-02 14:29:52.503048+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
486	2019-01-02 14:39:10.994395+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
487	2019-01-02 14:45:49.068459+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
488	2019-01-02 14:50:32.411655+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
489	2019-01-02 14:51:03.910578+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
490	2019-01-02 19:03:10.72365+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
491	2019-01-02 19:03:33.094016+08	3	3. Azri	2	[{"changed": {"fields": ["group"]}}]	28	1
492	2019-01-04 23:11:00.09495+08	2	ramlan@cwa.com	2	[{"changed": {"fields": ["password"]}}]	6	1
493	2019-01-06 17:30:48.842451+08	55	55.Group chat (agency)	1	[{"added": {}}]	18	1
494	2019-01-06 17:31:11.829818+08	4	4. Badruddin	2	[{"changed": {"fields": ["inbox"]}}]	28	1
495	2019-01-09 14:22:50.086934+08	2	ramlan@cwa.com	2	[{"changed": {"fields": ["password"]}}]	6	1
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
8	apis	chat
9	apis	chatmessage
10	apis	chattype
11	apis	comment
12	apis	company
13	apis	contact
14	apis	contactstatus
15	apis	contacttype
16	apis	designation
17	apis	group
18	apis	inbox
19	apis	industry
20	apis	like
21	apis	notification
22	apis	notificationtype
23	apis	point
24	apis	pointattribute
25	apis	pointfield
26	apis	post
27	apis	posttype
28	apis	profile
29	apis	sales
30	apis	salesstatus
31	apis	salestype
32	apis	schedule
33	apis	surcharge
34	apis	pointlog
35	apis	pointlogtype
36	apis	groupchat
37	apis	groupchatrole
38	apis	googleapi
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-20 00:30:51.606896+08
2	contenttypes	0002_remove_content_type_name	2018-12-20 00:30:51.628598+08
3	auth	0001_initial	2018-12-20 00:30:51.683272+08
4	auth	0002_alter_permission_name_max_length	2018-12-20 00:30:51.693756+08
5	auth	0003_alter_user_email_max_length	2018-12-20 00:30:51.706453+08
6	auth	0004_alter_user_username_opts	2018-12-20 00:30:51.740855+08
7	auth	0005_alter_user_last_login_null	2018-12-20 00:30:51.755643+08
8	auth	0006_require_contenttypes_0002	2018-12-20 00:30:51.76709+08
9	auth	0007_alter_validators_add_error_messages	2018-12-20 00:30:51.781248+08
10	auth	0008_alter_user_username_max_length	2018-12-20 00:30:51.807483+08
11	auth	0009_alter_user_last_name_max_length	2018-12-20 00:30:51.827194+08
12	account	0001_initial	2018-12-20 00:30:51.893928+08
13	admin	0001_initial	2018-12-20 00:30:51.942521+08
14	admin	0002_logentry_remove_auto_add	2018-12-20 00:30:51.977392+08
15	admin	0003_logentry_add_action_flag_choices	2018-12-20 00:30:52.007224+08
17	sessions	0001_initial	2018-12-20 00:30:54.949196+08
43	apis	0001_initial	2019-01-10 13:29:58.730557+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: irsyadmhdilham
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bkkai1i05tczl57k965rto1w15rxbdc2	N2RmMDlkZTdmYzk3ZGNmZmM0NDc1M2I5MWMzYzNhMzdmMzQ0ZjU5ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OWZhMWM2MmM3ZmIwNDA1YWI2Y2ZkYTc2NmQ1NjNlZjg3MzMyZDY4In0=	2019-01-03 01:08:47.430784+08
ukmrl5k5kupyzjfvihml6p5tfvbk41dw	N2RmMDlkZTdmYzk3ZGNmZmM0NDc1M2I5MWMzYzNhMzdmMzQ0ZjU5ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OWZhMWM2MmM3ZmIwNDA1YWI2Y2ZkYTc2NmQ1NjNlZjg3MzMyZDY4In0=	2019-01-23 14:22:50.487797+08
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.account_user_groups_id_seq', 1, false);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.account_user_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.apis_agency_posts_id_seq', 6, true);


--
-- Name: apis_chatmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_chatmessage_id_seq', 294, true);


--
-- Name: apis_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_comment_id_seq', 54, true);


--
-- Name: apis_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_company_id_seq', 2, true);


--
-- Name: apis_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contact_id_seq', 6, true);


--
-- Name: apis_contact_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contact_schedules_id_seq', 1, false);


--
-- Name: apis_contactstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contactstatus_id_seq', 6, true);


--
-- Name: apis_contacttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_contacttype_id_seq', 5, true);


--
-- Name: apis_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_designation_id_seq', 4, true);


--
-- Name: apis_googleapi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_googleapi_id_seq', 1, false);


--
-- Name: apis_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_group_id_seq', 2, true);


--
-- Name: apis_group_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_group_members_id_seq', 2, true);


--
-- Name: apis_groupchat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_groupchat_id_seq', 2, true);


--
-- Name: apis_groupchat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_groupchat_messages_id_seq', 86, true);


--
-- Name: apis_groupchat_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_groupchat_participants_id_seq', 5, true);


--
-- Name: apis_groupchatrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_groupchatrole_id_seq', 3, true);


--
-- Name: apis_inbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_inbox_id_seq', 57, true);


--
-- Name: apis_inbox_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_inbox_messages_id_seq', 380, true);


--
-- Name: apis_industry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_industry_id_seq', 1, true);


--
-- Name: apis_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_like_id_seq', 88, true);


--
-- Name: apis_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_notification_id_seq', 127, true);


--
-- Name: apis_notificationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_notificationtype_id_seq', 6, true);


--
-- Name: apis_point_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_point_attributes_id_seq', 22, true);


--
-- Name: apis_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_point_id_seq', 10, true);


--
-- Name: apis_point_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_point_logs_id_seq', 28, true);


--
-- Name: apis_pointattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointattribute_id_seq', 22, true);


--
-- Name: apis_pointfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointfield_id_seq', 15, true);


--
-- Name: apis_pointlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointlog_id_seq', 41, true);


--
-- Name: apis_pointlogtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_pointlogtype_id_seq', 2, true);


--
-- Name: apis_post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_comments_id_seq', 54, true);


--
-- Name: apis_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_id_seq', 6, true);


--
-- Name: apis_post_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_likes_id_seq', 88, true);


--
-- Name: apis_post_sales_rel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_post_sales_rel_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.apis_profile_contacts_id_seq', 6, true);


--
-- Name: apis_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_id_seq', 4, true);


--
-- Name: apis_profile_inbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_inbox_id_seq', 61, true);


--
-- Name: apis_profile_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_notifications_id_seq', 127, true);


--
-- Name: apis_profile_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_points_id_seq', 10, true);


--
-- Name: apis_profile_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_sales_id_seq', 17, true);


--
-- Name: apis_profile_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_profile_schedules_id_seq', 5, true);


--
-- Name: apis_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_sales_id_seq', 17, true);


--
-- Name: apis_salesstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_salesstatus_id_seq', 1, true);


--
-- Name: apis_salestype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_salestype_id_seq', 6, true);


--
-- Name: apis_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_schedule_id_seq', 5, true);


--
-- Name: apis_surcharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.apis_surcharge_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 152, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 495, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 38, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irsyadmhdilham
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);


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
-- Name: apis_chatmessage apis_chatmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_chatmessage
    ADD CONSTRAINT apis_chatmessage_pkey PRIMARY KEY (id);


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
-- Name: apis_contact_schedules apis_contact_schedules_contact_id_schedule_id_c251de6b_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedules_contact_id_schedule_id_c251de6b_uniq UNIQUE (contact_id, schedule_id);


--
-- Name: apis_contact_schedules apis_contact_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_contact_schedules
    ADD CONSTRAINT apis_contact_schedules_pkey PRIMARY KEY (id);


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
-- Name: apis_designation apis_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_designation
    ADD CONSTRAINT apis_designation_pkey PRIMARY KEY (id);


--
-- Name: apis_googleapi apis_googleapi_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_googleapi
    ADD CONSTRAINT apis_googleapi_pkey PRIMARY KEY (id);


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
-- Name: apis_groupchat_messages apis_groupchat_messages_groupchat_id_chatmessage_5c96050c_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_messages
    ADD CONSTRAINT apis_groupchat_messages_groupchat_id_chatmessage_5c96050c_uniq UNIQUE (groupchat_id, chatmessage_id);


--
-- Name: apis_groupchat_messages apis_groupchat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_messages
    ADD CONSTRAINT apis_groupchat_messages_pkey PRIMARY KEY (id);


--
-- Name: apis_groupchat_participants apis_groupchat_participa_groupchat_id_profile_id_cc90f76a_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_participants
    ADD CONSTRAINT apis_groupchat_participa_groupchat_id_profile_id_cc90f76a_uniq UNIQUE (groupchat_id, profile_id);


--
-- Name: apis_groupchat_participants apis_groupchat_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_participants
    ADD CONSTRAINT apis_groupchat_participants_pkey PRIMARY KEY (id);


--
-- Name: apis_groupchat apis_groupchat_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat
    ADD CONSTRAINT apis_groupchat_pkey PRIMARY KEY (id);


--
-- Name: apis_groupchatrole apis_groupchatrole_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchatrole
    ADD CONSTRAINT apis_groupchatrole_pkey PRIMARY KEY (id);


--
-- Name: apis_inbox_messages apis_inbox_messages_inbox_id_chatmessage_id_e4947a50_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox_messages
    ADD CONSTRAINT apis_inbox_messages_inbox_id_chatmessage_id_e4947a50_uniq UNIQUE (inbox_id, chatmessage_id);


--
-- Name: apis_inbox_messages apis_inbox_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox_messages
    ADD CONSTRAINT apis_inbox_messages_pkey PRIMARY KEY (id);


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
-- Name: apis_point_logs apis_point_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_logs
    ADD CONSTRAINT apis_point_logs_pkey PRIMARY KEY (id);


--
-- Name: apis_point_logs apis_point_logs_point_id_pointlog_id_4476446f_uniq; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_logs
    ADD CONSTRAINT apis_point_logs_point_id_pointlog_id_4476446f_uniq UNIQUE (point_id, pointlog_id);


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
-- Name: apis_pointlog apis_pointlog_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlog
    ADD CONSTRAINT apis_pointlog_pkey PRIMARY KEY (id);


--
-- Name: apis_pointlogtype apis_pointlogtype_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlogtype
    ADD CONSTRAINT apis_pointlogtype_pkey PRIMARY KEY (id);


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
-- Name: apis_salesstatus apis_salesstatus_name_key; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salesstatus
    ADD CONSTRAINT apis_salesstatus_name_key UNIQUE (name);


--
-- Name: apis_salesstatus apis_salesstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_salesstatus
    ADD CONSTRAINT apis_salesstatus_pkey PRIMARY KEY (id);


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
-- Name: apis_chatmessage_person_id_50e431f8; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_chatmessage_person_id_50e431f8 ON public.apis_chatmessage USING btree (person_id);


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
-- Name: apis_contact_schedules_contact_id_b948e9d7; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_schedules_contact_id_b948e9d7 ON public.apis_contact_schedules USING btree (contact_id);


--
-- Name: apis_contact_schedules_schedule_id_7cd7e2c4; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_contact_schedules_schedule_id_7cd7e2c4 ON public.apis_contact_schedules USING btree (schedule_id);


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
-- Name: apis_groupchat_messages_chatmessage_id_88aca116; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_messages_chatmessage_id_88aca116 ON public.apis_groupchat_messages USING btree (chatmessage_id);


--
-- Name: apis_groupchat_messages_groupchat_id_e1c9626b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_messages_groupchat_id_e1c9626b ON public.apis_groupchat_messages USING btree (groupchat_id);


--
-- Name: apis_groupchat_owner_id_4ccc30f0; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_owner_id_4ccc30f0 ON public.apis_groupchat USING btree (owner_id);


--
-- Name: apis_groupchat_participants_groupchat_id_226dc3e9; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_participants_groupchat_id_226dc3e9 ON public.apis_groupchat_participants USING btree (groupchat_id);


--
-- Name: apis_groupchat_participants_profile_id_927a2270; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_participants_profile_id_927a2270 ON public.apis_groupchat_participants USING btree (profile_id);


--
-- Name: apis_groupchat_role_id_0d308ecf; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_groupchat_role_id_0d308ecf ON public.apis_groupchat USING btree (role_id);


--
-- Name: apis_inbox_chat_with_id_14248c92; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_chat_with_id_14248c92 ON public.apis_inbox USING btree (chat_with_id);


--
-- Name: apis_inbox_group_chat_id_71eac19b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_group_chat_id_71eac19b ON public.apis_inbox USING btree (group_chat_id);


--
-- Name: apis_inbox_messages_chatmessage_id_fe9b3c70; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_messages_chatmessage_id_fe9b3c70 ON public.apis_inbox_messages USING btree (chatmessage_id);


--
-- Name: apis_inbox_messages_inbox_id_a52ae67e; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_inbox_messages_inbox_id_a52ae67e ON public.apis_inbox_messages USING btree (inbox_id);


--
-- Name: apis_like_liker_id_43520600; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_like_liker_id_43520600 ON public.apis_like USING btree (liker_id);


--
-- Name: apis_notification_inbox_rel_id_fad669b1; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_notification_inbox_rel_id_fad669b1 ON public.apis_notification USING btree (inbox_rel_id);


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
-- Name: apis_point_logs_point_id_03926bdc; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_point_logs_point_id_03926bdc ON public.apis_point_logs USING btree (point_id);


--
-- Name: apis_point_logs_pointlog_id_be28b106; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_point_logs_pointlog_id_be28b106 ON public.apis_point_logs USING btree (pointlog_id);


--
-- Name: apis_pointattribute_attribute_id_68a88a17; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_pointattribute_attribute_id_68a88a17 ON public.apis_pointattribute USING btree (attribute_id);


--
-- Name: apis_pointlog_attribute_id_f7377ac0; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_pointlog_attribute_id_f7377ac0 ON public.apis_pointlog USING btree (attribute_id);


--
-- Name: apis_pointlog_point_type_id_04218b06; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_pointlog_point_type_id_04218b06 ON public.apis_pointlog USING btree (point_type_id);


--
-- Name: apis_post_comments_comment_id_4ac6beb1; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_comments_comment_id_4ac6beb1 ON public.apis_post_comments USING btree (comment_id);


--
-- Name: apis_post_comments_post_id_d644be5b; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_comments_post_id_d644be5b ON public.apis_post_comments USING btree (post_id);


--
-- Name: apis_post_contact_rel_id_0d8911ab; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_post_contact_rel_id_0d8911ab ON public.apis_post USING btree (contact_rel_id);


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
-- Name: apis_salesstatus_name_8bfe33ff_like; Type: INDEX; Schema: public; Owner: irsyadmhdilham
--

CREATE INDEX apis_salesstatus_name_8bfe33ff_like ON public.apis_salesstatus USING btree (name varchar_pattern_ops);


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
-- Name: apis_chatmessage apis_chatmessage_person_id_50e431f8_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_chatmessage
    ADD CONSTRAINT apis_chatmessage_person_id_50e431f8_fk_apis_profile_id FOREIGN KEY (person_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: apis_groupchat_messages apis_groupchat_messa_chatmessage_id_88aca116_fk_apis_chat; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_messages
    ADD CONSTRAINT apis_groupchat_messa_chatmessage_id_88aca116_fk_apis_chat FOREIGN KEY (chatmessage_id) REFERENCES public.apis_chatmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_groupchat_messages apis_groupchat_messa_groupchat_id_e1c9626b_fk_apis_grou; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_messages
    ADD CONSTRAINT apis_groupchat_messa_groupchat_id_e1c9626b_fk_apis_grou FOREIGN KEY (groupchat_id) REFERENCES public.apis_groupchat(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_groupchat apis_groupchat_owner_id_4ccc30f0_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat
    ADD CONSTRAINT apis_groupchat_owner_id_4ccc30f0_fk_apis_profile_id FOREIGN KEY (owner_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_groupchat_participants apis_groupchat_parti_groupchat_id_226dc3e9_fk_apis_grou; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_participants
    ADD CONSTRAINT apis_groupchat_parti_groupchat_id_226dc3e9_fk_apis_grou FOREIGN KEY (groupchat_id) REFERENCES public.apis_groupchat(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_groupchat_participants apis_groupchat_parti_profile_id_927a2270_fk_apis_prof; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat_participants
    ADD CONSTRAINT apis_groupchat_parti_profile_id_927a2270_fk_apis_prof FOREIGN KEY (profile_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_groupchat apis_groupchat_role_id_0d308ecf_fk_apis_groupchatrole_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_groupchat
    ADD CONSTRAINT apis_groupchat_role_id_0d308ecf_fk_apis_groupchatrole_id FOREIGN KEY (role_id) REFERENCES public.apis_groupchatrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox apis_inbox_chat_with_id_14248c92_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox
    ADD CONSTRAINT apis_inbox_chat_with_id_14248c92_fk_apis_profile_id FOREIGN KEY (chat_with_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox apis_inbox_group_chat_id_71eac19b_fk_apis_groupchat_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox
    ADD CONSTRAINT apis_inbox_group_chat_id_71eac19b_fk_apis_groupchat_id FOREIGN KEY (group_chat_id) REFERENCES public.apis_groupchat(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox_messages apis_inbox_messages_chatmessage_id_fe9b3c70_fk_apis_chat; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox_messages
    ADD CONSTRAINT apis_inbox_messages_chatmessage_id_fe9b3c70_fk_apis_chat FOREIGN KEY (chatmessage_id) REFERENCES public.apis_chatmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_inbox_messages apis_inbox_messages_inbox_id_a52ae67e_fk_apis_inbox_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_inbox_messages
    ADD CONSTRAINT apis_inbox_messages_inbox_id_a52ae67e_fk_apis_inbox_id FOREIGN KEY (inbox_id) REFERENCES public.apis_inbox(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_like apis_like_liker_id_43520600_fk_apis_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_like
    ADD CONSTRAINT apis_like_liker_id_43520600_fk_apis_profile_id FOREIGN KEY (liker_id) REFERENCES public.apis_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_notification apis_notification_inbox_rel_id_fad669b1_fk_apis_inbox_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_notification
    ADD CONSTRAINT apis_notification_inbox_rel_id_fad669b1_fk_apis_inbox_id FOREIGN KEY (inbox_rel_id) REFERENCES public.apis_inbox(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: apis_point_logs apis_point_logs_point_id_03926bdc_fk_apis_point_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_logs
    ADD CONSTRAINT apis_point_logs_point_id_03926bdc_fk_apis_point_id FOREIGN KEY (point_id) REFERENCES public.apis_point(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_point_logs apis_point_logs_pointlog_id_be28b106_fk_apis_pointlog_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_point_logs
    ADD CONSTRAINT apis_point_logs_pointlog_id_be28b106_fk_apis_pointlog_id FOREIGN KEY (pointlog_id) REFERENCES public.apis_pointlog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_pointattribute apis_pointattribute_attribute_id_68a88a17_fk_apis_pointfield_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointattribute
    ADD CONSTRAINT apis_pointattribute_attribute_id_68a88a17_fk_apis_pointfield_id FOREIGN KEY (attribute_id) REFERENCES public.apis_pointfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_pointlog apis_pointlog_attribute_id_f7377ac0_fk_apis_pointfield_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlog
    ADD CONSTRAINT apis_pointlog_attribute_id_f7377ac0_fk_apis_pointfield_id FOREIGN KEY (attribute_id) REFERENCES public.apis_pointfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: apis_pointlog apis_pointlog_point_type_id_04218b06_fk_apis_pointlogtype_id; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_pointlog
    ADD CONSTRAINT apis_pointlog_point_type_id_04218b06_fk_apis_pointlogtype_id FOREIGN KEY (point_type_id) REFERENCES public.apis_pointlogtype(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: apis_sales apis_sales_sales_status_id_03600a56_fk_apis_salesstatus_name; Type: FK CONSTRAINT; Schema: public; Owner: irsyadmhdilham
--

ALTER TABLE ONLY public.apis_sales
    ADD CONSTRAINT apis_sales_sales_status_id_03600a56_fk_apis_salesstatus_name FOREIGN KEY (sales_status_id) REFERENCES public.apis_salesstatus(name) DEFERRABLE INITIALLY DEFERRED;


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

