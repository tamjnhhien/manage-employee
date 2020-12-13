--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2020-12-13 12:41:13

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16912)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    company_id bigint NOT NULL,
    create_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL,
    company_name text,
    manager_id bigint NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16910)
-- Name: company_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_company_id_seq OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 200
-- Name: company_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_company_id_seq OWNED BY public.company.company_id;


--
-- TOC entry 203 (class 1259 OID 16923)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id bigint NOT NULL,
    create_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL,
    department_name text,
    company_id bigint NOT NULL,
    manager_id bigint NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16921)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 202
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 205 (class 1259 OID 16934)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id bigint NOT NULL,
    create_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL,
    age integer,
    employee_name text,
    gender boolean,
    "position" integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16932)
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 204
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- TOC entry 206 (class 1259 OID 16943)
-- Name: employee_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_team (
    employee_id bigint NOT NULL,
    team_id bigint NOT NULL
);


ALTER TABLE public.employee_team OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16948)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    team_id bigint NOT NULL,
    create_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone NOT NULL,
    description text,
    team_name text,
    department_id bigint NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16946)
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_team_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 207
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_team_id_seq OWNED BY public.team.team_id;


--
-- TOC entry 2876 (class 2604 OID 16915)
-- Name: company company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN company_id SET DEFAULT nextval('public.company_company_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 16926)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 16937)
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 16951)
-- Name: team team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN team_id SET DEFAULT nextval('public.team_team_id_seq'::regclass);


--
-- TOC entry 2881 (class 2606 OID 16920)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (company_id);


--
-- TOC entry 2885 (class 2606 OID 16931)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- TOC entry 2889 (class 2606 OID 16942)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 2891 (class 2606 OID 16956)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2883 (class 2606 OID 16958)
-- Name: company uk_a5g6icik7hlclc4a07hwlgo13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT uk_a5g6icik7hlclc4a07hwlgo13 UNIQUE (manager_id);


--
-- TOC entry 2887 (class 2606 OID 16960)
-- Name: department uk_g9435hkqyjp3h3qsaslcmk4rw; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT uk_g9435hkqyjp3h3qsaslcmk4rw UNIQUE (manager_id);


--
-- TOC entry 2896 (class 2606 OID 16981)
-- Name: employee_team fk9b0vbuh33vl7363ja02n4jfjo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_team
    ADD CONSTRAINT fk9b0vbuh33vl7363ja02n4jfjo FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 2897 (class 2606 OID 16986)
-- Name: team fkcitsl0ygrf7nbmydhlcqorb3p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT fkcitsl0ygrf7nbmydhlcqorb3p FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 2892 (class 2606 OID 16961)
-- Name: company fkd3n13rtkatuw4gwf3gsnqdf5e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fkd3n13rtkatuw4gwf3gsnqdf5e FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 2893 (class 2606 OID 16966)
-- Name: department fkh1m88q0f7sc0mk76kju4kcn6f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT fkh1m88q0f7sc0mk76kju4kcn6f FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- TOC entry 2895 (class 2606 OID 16976)
-- Name: employee_team fkhg31v0x2pxtkrcbio71bd0pe5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_team
    ADD CONSTRAINT fkhg31v0x2pxtkrcbio71bd0pe5 FOREIGN KEY (team_id) REFERENCES public.team(team_id);


--
-- TOC entry 2894 (class 2606 OID 16971)
-- Name: department fkmp68t6xcos91gmiaj59fi077o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT fkmp68t6xcos91gmiaj59fi077o FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE company; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.company FROM postgres;
GRANT ALL ON TABLE public.company TO postgres WITH GRANT OPTION;


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE department; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.department FROM postgres;
GRANT ALL ON TABLE public.department TO postgres WITH GRANT OPTION;


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE employee; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.employee FROM postgres;
GRANT ALL ON TABLE public.employee TO postgres WITH GRANT OPTION;


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE employee_team; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.employee_team FROM postgres;
GRANT ALL ON TABLE public.employee_team TO postgres WITH GRANT OPTION;


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE team; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.team FROM postgres;
GRANT ALL ON TABLE public.team TO postgres WITH GRANT OPTION;


-- Completed on 2020-12-13 12:41:13

--
-- PostgreSQL database dump complete
--

