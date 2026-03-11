CREATE TABLE 진료과 (
    과번호    NUMBER NOT NULL,
    과이름    VARCHAR2(20) NOT NULL,
    전화번호  CHAR(20),
    CONSTRAINT PK_진료과 PRIMARY KEY (과번호)
);

CREATE TABLE 의사 (
    의사번호   NUMBER NOT NULL,
    이름       CHAR(10) NOT NULL,
    전화번호   CHAR(20),
    주소       CHAR(10),
    과번호     NUMBER,
    CONSTRAINT PK_의사 PRIMARY KEY (의사번호),
    CONSTRAINT FK_의사_진료과 FOREIGN KEY (과번호)
        REFERENCES 진료과(과번호)
);

CREATE TABLE 간호사 (
    간호사번호 NUMBER NOT NULL,
    이름       CHAR(10) NOT NULL,
    전화번호   CHAR(20),
    주소       CHAR(10),
    과번호     NUMBER,
    CONSTRAINT PK_간호사 PRIMARY KEY (간호사번호),
    CONSTRAINT FK_간호사_진료과 FOREIGN KEY (과번호)
        REFERENCES 진료과(과번호)
);

CREATE TABLE 환자 (
    환자번호      NUMBER NOT NULL,
    이름          CHAR(10) NOT NULL,
    전화번호      CHAR(20),
    주소          CHAR(10),
    주민등록번호  CHAR(20),
    신장          NUMBER(5,1),
    몸무게        NUMBER(5,1),
    혈액형        VARCHAR2(4),
    성별          CHAR(6),
    처치일        DATE,
    처치내용      VARCHAR2(20),
    간호사번호    NUMBER,
    CONSTRAINT PK_환자 PRIMARY KEY (환자번호),
    CONSTRAINT FK_환자_간호사 FOREIGN KEY (간호사번호)
        REFERENCES 간호사(간호사번호),
    CONSTRAINT CK_환자_혈액형 CHECK (혈액형 IN ('A', 'B', 'O', 'AB'))
);

CREATE TABLE 진료 (
    진료번호   NUMBER NOT NULL,
    진료일     DATE,
    의사번호   NUMBER,
    환자번호   NUMBER,
    CONSTRAINT PK_진료 PRIMARY KEY (진료번호, 의사번호, 환자번호),
    CONSTRAINT FK_진료_의사 FOREIGN KEY (의사번호)
        REFERENCES 의사(의사번호),
    CONSTRAINT FK_진료_환자 FOREIGN KEY (환자번호)
        REFERENCES 환자(환자번호)
);

CREATE TABLE 입원 (
    입원일     DATE NOT NULL,
    퇴원일     DATE,
    입원실     NUMBER,
    환자번호   NUMBER,
    CONSTRAINT PK_입원 PRIMARY KEY (환자번호, 입원일),
    CONSTRAINT FK_입원_환자 FOREIGN KEY (환자번호)
        REFERENCES 환자(환자번호)
);

CREATE TABLE 진료내용 (
    진료내용   VARCHAR2(20) NOT NULL,
    환자번호   NUMBER,
    CONSTRAINT PK_진료내용 PRIMARY KEY (진료내용, 환자번호),
    CONSTRAINT FK_진료내용_환자 FOREIGN KEY (환자번호)
        REFERENCES 환자(환자번호)
);