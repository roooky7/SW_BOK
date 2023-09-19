create table teacher (
   teacher_id varchar(30) primary key,
   teacher_pwd varchar(100) not null,
   teacher_nm varchar(30) not null,
   teacher_cttpc varchar(30) not null,
   teacher_grade int(30) not null,
   teacher_clas int(30) not null
   );
drop table teacher;   
select * from teacher;
desc teacher;
   
 create table s_parents (
   s_parents_id varchar(50) primary key,
   s_parents_pwd varchar(100) not null,
   s_parents_cttpc varchar(50) ,
   s_parents_nm varchar(50) ,
   rel  varchar(50) ,
   chldren_nm  varchar(50) ,
   chldren_schl  varchar(50) ,
   chldren_grade int(11) ,
   chldren_clas int(11) ,
   chldren_sexdstn  varchar(50) ,
   chldren_brdt date null
   );
drop table s_parents;   
desc s_parents;
select * from s_parents;

CREATE TABLE rsvt (
rsvt_no varchar(100) PRIMARY KEY,
s_parents_id VARCHAR(100) NULL,
teacher_id VARCHAR(100) NOT NULL,
pst_ttl_nm VARCHAR(100) NOT NULL,
rsvt_cn VARCHAR(100) NOT NULL,
rsvt_dt DATE NOT NULL,
rsvt_hr TIME NOT NULL,
rsvt_fhr TIME NOT NULL
);

drop table notice_board;

create table ids(
table_name VARCHAR(16) primary key,
next_id numeric(30) not null
);

CREATE TABLE notice_board (
    ntc_no INT AUTO_INCREMENT PRIMARY KEY,
    ntc_ttl VARCHAR(200),
    ntc_writer VARCHAR(20),
    ntc_cn VARCHAR(200),
    ntc_ymd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ntc_imp VARCHAR(12),
    ntc_img VARCHAR(12),
    ntc_cnt INT DEFAULT 0 NOT NULL
);
drop table notice_board;

CREATE TABLE INQUIRY_BOARD (
    INQUIRY_ID INT AUTO_INCREMENT PRIMARY KEY,
    INQUIRY_TTL VARCHAR(200),
    INQUIRY_WRITER VARCHAR(20),
    INQUIRY_CN VARCHAR(200),
    INQUIRY_TMD TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INQUIRY_SC VARCHAR(12),
    INQUIRY_REPLY VARCHAR(200),
    INQUIRY_RCNT INT DEFAULT 0 NOT NULL
);
drop table INQUIRY_BOARD; 

SELECT *, ROW_NUMBER() OVER() AS RN
			FROM INQUIRY_BOARD
			LEFT JOIN (
			    SELECT s_parents_id, chldren_grade, chldren_clas
			    FROM s_parents
			) AS s_parents_subset
			ON inquiry_writer = s_parents_subset.s_parents_id
			WHERE 1 = 1;

			SELECT *
FROM INQUIRY_BOARD
LEFT JOIN (
    SELECT teacher_id, chldren_grade, chldren_clas
    FROM teacher
) AS s_parents_subset
ON inquiry_writer = teacher_subset.teacher_grade
WHERE INQUIRY_ID = 10;