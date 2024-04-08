--드랍
DROP TABLE COM_SCRAP_TB;
DROP TABLE COMPANY_INFO_TB;
DROP TABLE JOB_POST_TB;
DROP TABLE PERSON_INFO_TB;
DROP TABLE PERSON_PROPOSAL_TB;
DROP TABLE PERSON_SCRAP_TB;
DROP TABLE PERSON_SKILL_TB;
DROP TABLE POST_SKILL_TB;
DROP TABLE PROPOSAL_STATUS_TB;
DROP TABLE RESUME_TB;
DROP TABLE SKILL_TB;
DROP TABLE USER_FAQ_TB;
DROP TABLE USER_TB;

-- 1) 유저 테이블
CREATE TABLE user_tb (
    id            VARCHAR2(255)   NOT NULL,
    password      VARCHAR2(255)   NOT NULL,
    type          NUMBER(8)       NOT NULL,
    user_email    VARCHAR2(255)   NOT NULL,
    created_date  DATE            DEFAULT SYSDATE   NOT NULL,
    PRIMARY KEY (id, type)
);


-- 2) 개인 회원 테이블
CREATE TABLE person_info_tb (
	id              varchar2(255)   PRIMARY KEY     NOT NULL,
	pname           varchar2(255)   NOT NULL,
	phone           varchar2(255)   NOT NULL,
    address         varchar2(255)   NOT NULL,
	birth           date            NOT NULL
);


-- 3) 기업 회원 테이블
CREATE TABLE company_info_tb (
    id                      varchar2(255)   PRIMARY KEY     NOT NULL,
    cnumber                 number(8)       NOT NULL,
    cname                   varchar2(255)   NOT NULL,
	com_logo                varchar2(255)   NOT NULL,
	crepresentive           varchar2(255)   NOT NULL,
	address                 varchar2(255)   NOT NULL,
	manager_name            varchar2(255)   NOT NULL,
    company_managerPhone    varchar2(255)   NOT NULL,
	csize                   number(20)      NOT NULL,
	cyear                   date			NOT NULL
);


-- 4) 스킬 테이블
CREATE TABLE skill_tb (
    skill_idx   number(8)       PRIMARY KEY     NOT NULL,
	skill_name  varchar2(255)   NOT NULL	
);


-- 5) 구직자가 가진 스킬 테이블
CREATE TABLE person_skill_tb (
    psno        number(8)       PRIMARY KEY     NOT NULL,
	id          varchar2(255)   NOT NULL,
	skill_idx   number(8)       NOT NULL
);


-- 6) 기업 공고가 가진 스킬 테이블 : 기업 공고 테이블에 데이터를 먼저 생성을 해주고 데이터 생성을 해야한다
CREATE TABLE post_skill_tb (
    csno        number(8)   PRIMARY KEY     NOT NULL,
	post_idx    number(8)   NOT NULL,
	skill_idx   number(8)   NOT NULL
);


-- 7) 기업 공고 테이블
CREATE TABLE job_post_tb (
	post_idx        number(8)       PRIMARY KEY     NOT NULL,
    id              varchar2(255)   NOT NULL,
	post_name       varchar2(1000)  NOT NULL,
    career          varchar2(255)   NOT NULL,
    job_type        varchar2(255)   NOT NULL,
    pay             varchar2(255)   NOT NULL,
    go_work         varchar2(255)   NOT NULL,
	go_home         varchar2(255)   NOT NULL,
	deadline        date			NOT NULL,
    job_intro       varchar2(4000)  NOT NULL,
	c_intro         varchar2(4000)  NOT NULL,
    created_date    DATE            DEFAULT SYSDATE NOT NULL
);


-- 8) 구직자가 지원한 공고 테이블 : 구직자 이력서 테이블에 데이터를 먼저 생성을 해주고 데이터 생성을 해야한다
CREATE TABLE person_proposal_tb (
    pro_idx     number(8)       PRIMARY KEY     NOT NULL,
    id          varchar2(255)   NOT NULL,
	post_idx    number(8)       NOT NULL,
    resume_idx  number(8)       NOT NULL,
	status      number(8)       DEFAULT 0       NOT NULL,
	created_at  date            DEFAULT SYSDATE NOT NULL
);


-- 9) 구직자가 지원한 공고 테이블의 상태 테이블
-- status는 제가 임의로 대기 : 0 / 합격 : 1 / 불합격 : 2 으로 부여했습니다
CREATE TABLE proposal_status_tb (
    status_idx  NUMBER(8)       PRIMARY KEY     NOT NULL,
    id          VARCHAR2(255)   NOT NULL,
    pro_idx     NUMBER(8)       NOT NULL,
    post_idx    NUMBER(8)       NOT NULL,
    status      number(8)       DEFAULT 0       			NOT NULL,
    comments    VARCHAR2(255)   DEFAULT '미처리중입니다'	NOT NULL
);


-- 10) 구직자 이력서 테이블
CREATE TABLE resume_tb (
	resume_idx  number(10)      PRIMARY KEY     NOT NULL,
	id          varchar2(255)   NOT NULL,
	profile     varchar2(255)   NOT NULL,
	title       varchar2(1000)  NOT NULL,
	portfolio   varchar2(1000)  NOT NULL,
	publish     number(8)       NOT NULL,
	self_intro  varchar2(4000)  NOT NULL,
	created_at  date            DEFAULT SYSDATE NOT NULL
);


-- 11) 기업이 관심있어 하는 구직자 리스트
CREATE TABLE com_scrap_tb (
	cscrap_idx  number(8)       PRIMARY KEY     NOT NULL,
    cid         varchar2(255)   NOT NULL,
    resume_idx  number(8)       NOT NULL
);


-- 12) 구직자과 관심있어 하는 기업 공고 리스트
CREATE TABLE person_scrap_tb (
	pscrap_idx  number(8)       PRIMARY KEY     NOT NULL,
	pid         varchar2(255)   NOT NULL,
	post_idx    number(8)       NOT NULL
);


-- 13) 고객센터 FAQ 테이블
CREATE TABLE user_faq_tb (
	q_idx       number(8)       PRIMARY KEY     NOT NULL,
	type        number(8)       NOT NULL,
	question    varchar2(4000)  NOT NULL,
	answer      varchar2(4000)  NOT NULL
);

