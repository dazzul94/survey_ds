-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** survey_mst

CREATE TABLE survey_mst
(
 survey_no    int NOT NULL,
 survey_nm    varchar(200) NOT NULL,
 use_yn       varchar(1) NULL,
 survey_st_dt varchar(8) NOT NULL,
 survey_ed_dt varchar(8) NOT NULL,
 CONSTRAINT PK_survey_mst PRIMARY KEY ( survey_no )
);

COMMENT ON TABLE survey_mst IS '설문조사 Master';

COMMENT ON COLUMN survey_mst.survey_no IS '설문조사 No';
COMMENT ON COLUMN survey_mst.survey_nm IS '설문명';
COMMENT ON COLUMN survey_mst.use_yn IS '사용여부';
COMMENT ON COLUMN survey_mst.survey_st_dt IS '설문시작일';
COMMENT ON COLUMN survey_mst.survey_ed_dt IS '설문종료일';


-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** survey_qst

CREATE TABLE survey_qst
(
 survey_no int NOT NULL,
 qst_no    int NOT NULL,
 qst_seq   int NOT NULL,
 qst_cont  varchar(500) NOT NULL,
 qst_type  varchar(2) NOT NULL,
 use_yn    varchar(1) NULL,
 CONSTRAINT PK_survey_qst PRIMARY KEY ( survey_no, qst_no ),
 CONSTRAINT FK_40 FOREIGN KEY ( survey_no ) REFERENCES survey_mst ( survey_no )
);

CREATE INDEX fkIdx_40 ON survey_qst
(
 survey_no
);

COMMENT ON TABLE survey_qst IS '설문조사 질문';

COMMENT ON COLUMN survey_qst.qst_seq IS '질문 순번';
COMMENT ON COLUMN survey_qst.qst_cont IS '질문 내용';
COMMENT ON COLUMN survey_qst.qst_type IS '질문유형';
COMMENT ON COLUMN survey_qst.use_yn IS '사용여부';
COMMENT ON COLUMN survey_qst.survey_no IS '설문조사 No';
COMMENT ON COLUMN survey_qst.qst_no IS '질문 No';

-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** survey_exp

CREATE TABLE survey_exp
(
 survey_no int NOT NULL,
 qst_no    int NOT NULL,
 exp_no    int NOT NULL,
 exp_seq   int NOT NULL,
 exp_cont  varchar(200) NOT NULL,
 use_yn    varchar(1) NULL,
 CONSTRAINT PK_survey_exp PRIMARY KEY ( survey_no, qst_no, exp_no ),
 CONSTRAINT FK_44 FOREIGN KEY ( survey_no, qst_no ) REFERENCES survey_qst ( survey_no, qst_no )
);

CREATE INDEX fkIdx_44 ON survey_exp
(
 survey_no,
 qst_no
);

COMMENT ON TABLE survey_exp IS '설문조사 보기';

COMMENT ON COLUMN survey_exp.exp_seq IS '보기 순번';
COMMENT ON COLUMN survey_exp.exp_cont IS '보기 내용';
COMMENT ON COLUMN survey_exp.use_yn IS '사용여부';
COMMENT ON COLUMN survey_exp.survey_no IS '설문조사 No';
COMMENT ON COLUMN survey_exp.qst_no IS '질문 No';
COMMENT ON COLUMN survey_exp.exp_no IS '보기 No';




-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** survey_rsp

CREATE TABLE survey_rsp
(
 survey_no  int NOT NULL,
 qst_no     int NOT NULL,
 rsp_no     int NOT NULL,
 rso_sel_no varchar(50) NULL,
 rsp_cont   varchar(500) NOT NULL,
 rsp_dt     timestamp NOT NULL,
 CONSTRAINT PK_survey_rsp PRIMARY KEY ( survey_no, qst_no, rsp_no ),
 CONSTRAINT FK_54 FOREIGN KEY ( survey_no, qst_no ) REFERENCES survey_qst ( survey_no, qst_no )
);

CREATE INDEX fkIdx_54 ON survey_rsp
(
 survey_no,
 qst_no
);

COMMENT ON TABLE survey_rsp IS '설문조사 답변';

COMMENT ON COLUMN survey_rsp.rso_sel_no IS '답변선택번호';
COMMENT ON COLUMN survey_rsp.rsp_cont IS '답변내용';
COMMENT ON COLUMN survey_rsp.rsp_dt IS '답변일시';
COMMENT ON COLUMN survey_rsp.survey_no IS '설문조사 No';
COMMENT ON COLUMN survey_rsp.qst_no IS '질문 No';
COMMENT ON COLUMN survey_rsp.rsp_no IS '답변 No';











