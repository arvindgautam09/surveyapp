create database if not exists `esurvey`;

use `esurvey`;

/* 
TABLE TO STORE INFORMATION ABOUT TYPE OF THE QUESTION.
*/

DROP TABLE IF EXISTS `QUESTION_TYPE`;

CREATE TABLE QUESTION_TYPE (
QST_ID				INT(2),			/* ID OF THE QUESTION TYPE. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
QST_NAME			VARCHAR(50),	/* TYPE OF QUESTION. FIELD IS NOT NULL. */
QST_FLAG			VARCHAR(1) 	 	/* TO ENABLE OR DISABLE RECORD. VALUE ARE E FOR ENABLE AND  D FOR DISABLE. DEFAULT IS E. */
);

/*
TABLE TO STORE NAME OF DIFFERENT CATEGORY OF QUESTION
*/
DROP TABLE IF EXISTS `QUESTION_CATEGORY`;

CREATE TABLE QUESTION_CATEGORY
(
QSC_ID INT(2),	/* ID OF THE CATEGORY. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
QSC_NAME	VARCHAR(50),	/* NAME OF THE QUESTION CATEGORY. FIELD IS NOT NULL AND UNIQUE. */
QSC_FLAG	VARCHAR(1) 	DEFAULT 'E' 	/* TO ENABLE OR DISABLE RECORD. VALUE ARE E FOR ENABLE AND  D FOR DISABLE. DEFAULT IS E. */
);

/*
TABLE TO STORE QUESTION CATEGORY WISE.
*/
DROP TABLE IF EXISTS QUESTION_MASTER ;
CREATE TABLE QUESTION_MASTER
(
QSM_ID INT(6),	/* ID OF THE ROLE. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
QSM_QUESTION VARCHAR(15),	/* TO STORE QUESTION. FIELD IS NOT NULL. */
QSM_QST_ID	INT(2) REFERENCES  QUESTION_TYPE(QST_ID),	/* ID OF THE QUESTION_TYPE TABLE. REFERENCE QUESTION_TYPE(QST_ID). FIELD IS NOT NULL. */
QSM_QSC_ID	INT(2) REFERENCES  QUESTION_CATEGORY(QSC_ID),	/* ID OF THE QUESTION_CATEGORY TABLE. REFERENCE QUESTION_CATEGORY(QSC_ID). FIELD IS NOT NULL. */
QSM_FLAG	VARCHAR(1) DEFAULT 'E' /* TO ENABLE OR DISABLE RECORD. VALUE ARE E FOR ENABLE AND  D FOR DISABLE. DEFAULT IS E. */
);

/*
TABLE TO STORE OPTION VALUES FOR A QUESTION.
*/
DROP TABLE IF EXISTS QUESTION_OPTION;
CREATE TABLE QUESTION_OPTION
(
QSO_ID INT(6),	/* ID OF THE RECORD. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
QSO_OPTION	VARCHAR(50), /* NAME OF THE PRIVILEGE. FIELD IS NOT NULL. */
QSO_TYPE	VARCHAR(1),	 /* TYPE OF OPTION. VALUES ATE R FOR ROW AND C FOR COLUMN. */
QSO_QSM_ID	INT(6) REFERENCES QUESTION_MASTER(QSM_ID)	/* ID OF THE QUESTION_MASTER TABLE. FIELD IS NOT NULL. REFERENCE QUESTION_MASTER(QSM_ID). */
);

/*
TABLE TO STORE LIST OF TYPE OF SERVEY.
*/
DROP TABLE IF EXISTS SURVEY_TYPE;
CREATE TABLE SURVEY_TYPE
(
SRT_ID INT(6),	/* ID OF THE RECORD. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
SRT_NAME	VARCHAR(50),	/* TO STORE TYPE OF A SERVEY. FIELD IS NOT NULL. FIELD IS UNIQUE. */
SRT_FLAG	VARCHAR(1)	DEFAULT 'E'  	/* TO ENABLE OR DISABLE RECORD. VALUE ARE E FOR ENABLE AND  D FOR DISABLE. DEFAULT IS E. */
);


/*
TABLE TO STORE SUB CATEGORY OF A SERVEY.
*/
DROP TABLE IF EXISTS SURVEY_MASTER ;
CREATE TABLE SURVEY_MASTER
(
SRM_ID INT(2),	/* ID OF THE RECORD. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
SRM_NAME	VARCHAR(50),	/* TO STORE SUB CATEGORY OF A SERVEY. FIELD IS NOT NULL. */
SRM_REPEAT_COUNT	INT(2),	/* NO OF REPEATION FOR THE SERVEY. FIELD IS NOT NULL. */
SRM_REPEAT_INTERVAL	VARCHAR(25),	/* FREQUENCY OF SERVEY. FIELD IS NOT NULL. */
SRM_SRT_ID	INT(2) REFERENCES SURVEY_TYPE(SRT_ID),	/* ID OF THE SURVEY TYPE. REFERENCE SURVEY_TYPE(SRT_ID). FILES ID NOT NULL. */
SRM_FLAG	VARCHAR(1)	DEFAULT 'E'  	/* TO ENABLE OR DISABLE RECORD. VALUE ARE E FOR ENABLE AND  D FOR DISABLE. DEFAULT IS E. */
);

/*
TABLE TO STORE MAPPING OF QUESTION WITH SURVEY .
*/
DROP TABLE IF EXISTS SURVEY_QUESTION_MAPPING;
CREATE TABLE SURVEY_QUESTION_MAPPING
(
SQM_ID 		INT(6),	/* ID OF THE RECORD. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
SQM_SRM_ID	INT(6) REFERENCES SURVEY_MASTER(SRM_ID),	/* ID OF THE SURVEY_MASTER TABLE.  FIELD IS NOT NULL. REFERENCE SURVEY_MASTER(SRM_ID). COMBINED UNIQUE KEY WITH SQM_QSM_ID. */
SQM_QSM_ID	INT(2) REFERENCES QUESTION_MASTER (QSM_ID)	/* ID OF THE QUESTION_MASTER TABLE. FILD IS NOT NULL. REFERENCE QUESTION_MASTER (QSM_ID). COMBINED UNIQUE KEY WITH SQM_SRM_ID .*/
);

/*
TABLE TO STORE ANSWER INFORMATION.
*/
DROP TABLE IF EXISTS  ANSWER_MASTER;
CREATE TABLE ANSWER_MASTER
(
ASM_ID			INT(6),  	/* ID OF THE RECORD. TO BE GENERATED AUTOMATICALLY. FIELD IS PRIMARY KEY. */
ASM_QSM_ID		INT(6) REFERENCES QUESTION_MASTER (QSM_ID),/* ID OF THE QUESTION_MASTER TABLE. FILD IS NOT NULL. REFERENCE QUESTION_MASTER (QSM_ID). */
ASM_SRM_ID		INT(6) REFERENCES SURVEY_MASTER(SRM_ID), /* ID OF THE SURVEY_MASTER TABLE.  FIELD IS NOT NULL. REFERENCE SURVEY_MASTER(SRM_ID). */
ASM_COUNT		INT(4),  	/* NO OF TIME A ANSWER IS HIT. */
ASM_ROW_OPTION	INT(2),/* STORE ROW VALUE FOR ANSWER. */
ASM_COL_OPTION 	INT(2),/* STORE COLUMN VALUE FOR ANSWER. */
ASM_DESCRIPTION VARCHAR(200) /* DESCRIPTIVE ANSWER. */
);
