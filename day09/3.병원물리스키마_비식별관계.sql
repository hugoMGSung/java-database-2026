-- 사용자 생성
CREATE USER hospitaluser
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users; -- 무제한 용량

-- 사용자 권한
GRANT CONNECT, RESOURCE, DBA TO hospitaluser;

-- hospitaluser로 로그인 후
-- 아래 쿼리를 하나씩 실행(Ctrl + Enter)
CREATE TABLE "Admits" (
	"AdmNo"	NUMBER		NOT NULL,
	"RoomNo"	NUMBER(4)		NOT NULL,
	"AdmDt"	DATE		NOT NULL,
	"LeaveDt"	DATE		NULL,
	"TrtNo"	NUMBER		NOT NULL
);

CREATE TABLE "Nurses" (
	"NurNo"	NUMBER(8)		NOT NULL,
	"NurName"	VARCHAR2(20)		NOT NULL,
	"Tel"	VARCHAR2(20)		NOT NULL,
	"Addr"	VARCHAR2(120)		NULL,
	"Position"	VARCHAR2(10)		NOT NULL,
	"DeptNo"	NUMBER(4)		NULL
);

CREATE TABLE "Doctors" (
	"DocNo"	NUMBER(8)		NOT NULL,
	"DocName"	VARCHAR2(20)		NOT NULL,
	"Tel"	VARCHAR2(20)		NOT NULL,
	"Addr"	VARCHAR2(20)		NULL,
	"Position"	VARCHAR2(10)		NOT NULL,
	"DeptNo"	NUMBER(4)		NULL
);

CREATE TABLE "Depts" (
	"DeptNo"	NUMBER(4)		NOT NULL,
	"DeptName"	VARCHAR2(20)		NOT NULL,
	"Tel"	VARCHAR2(20)		NOT NULL,
	"Fax"	VARCHAR2(20)		NULL
);

CREATE TABLE "Patients" (
	"PatNo"	NUMBER(8)		NOT NULL,
	"PatName"	VARCHAR2(20)		NOT NULL,
	"Tel"	VARCHAR2(20)		NOT NULL,
	"JuminNo"	CHAR(14)		NOT NULL,
	"Addr"	VARCHAR2(120)		NULL,
	"BloodType"	VARCHAR2(10)		NOT NULL,
	"Height"	NUMBER(4,1)		NULL,
	"Weight"	NUMBER(4,1)		NULL,
	"Gender"	CHAR(4)		NOT NULL
);

CREATE TABLE "Treatments" (
	"TrtNo"	NUMBER		NOT NULL,
	"TrtDt"	DATE		NOT NULL,
	"Content"	VARCHAR2(4000)		NULL,
	"DocNo"	NUMBER(8)		NOT NULL,
	"PatNo"	NUMBER(8)		NOT NULL
);

CREATE TABLE "Handles" (
	"HdlNo"	NUMBER		NOT NULL,
	"NurNo"	NUMBER(8)		NOT NULL,
	"HdlDt"	DATE		NOT NULL,
	"Content"	VARCHAR2(4000)		NULL,
	"TrtNo"	NUMBER		NOT NULL
);

ALTER TABLE "Admits" ADD CONSTRAINT "PK_ADMITS" PRIMARY KEY (
	"AdmNo"
);

ALTER TABLE "Nurses" ADD CONSTRAINT "PK_NURSES" PRIMARY KEY (
	"NurNo"
);

ALTER TABLE "Doctors" ADD CONSTRAINT "PK_DOCTORS" PRIMARY KEY (
	"DocNo"
);

ALTER TABLE "Depts" ADD CONSTRAINT "PK_DEPTS" PRIMARY KEY (
	"DeptNo"
);

ALTER TABLE "Patients" ADD CONSTRAINT "PK_PATIENTS" PRIMARY KEY (
	"PatNo"
);

ALTER TABLE "Treatments" ADD CONSTRAINT "PK_TREATMENTS" PRIMARY KEY (
	"TrtNo"
);

ALTER TABLE "Handles" ADD CONSTRAINT "PK_HANDLES" PRIMARY KEY (
	"HdlNo",
	"NurNo"
);

ALTER TABLE "Admits" ADD CONSTRAINT "FK_Treatments_TO_Admits_1" FOREIGN KEY (
	"TrtNo"
)
REFERENCES "Treatments" (
	"TrtNo"
);

ALTER TABLE "Nurses" ADD CONSTRAINT "FK_Depts_TO_Nurses_1" FOREIGN KEY (
	"DeptNo"
)
REFERENCES "Depts" (
	"DeptNo"
);

ALTER TABLE "Doctors" ADD CONSTRAINT "FK_Depts_TO_Doctors_1" FOREIGN KEY (
	"DeptNo"
)
REFERENCES "Depts" (
	"DeptNo"
);

ALTER TABLE "Treatments" ADD CONSTRAINT "FK_Doctors_TO_Treatments_1" FOREIGN KEY (
	"DocNo"
)
REFERENCES "Doctors" (
	"DocNo"
);

ALTER TABLE "Treatments" ADD CONSTRAINT "FK_Patients_TO_Treatments_1" FOREIGN KEY (
	"PatNo"
)
REFERENCES "Patients" (
	"PatNo"
);

ALTER TABLE "Handles" ADD CONSTRAINT "FK_Nurses_TO_Handles_1" FOREIGN KEY (
	"NurNo"
)
REFERENCES "Nurses" (
	"NurNo"
);

ALTER TABLE "Handles" ADD CONSTRAINT "FK_Treatments_TO_Handles_1" FOREIGN KEY (
	"TrtNo"
)
REFERENCES "Treatments" (
	"TrtNo"
);

