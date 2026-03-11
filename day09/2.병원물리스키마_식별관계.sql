CREATE TABLE "Admits" (
	"AdmNo"	NUMBER		NOT NULL,
	"TrtNo"	NUMBER		NOT NULL,
	"DocNo"	NUMBER(8)		NOT NULL,
	"PatNo"	NUMBER(8)		NOT NULL,
	"RoomNo"	NUMBER(4)		NOT NULL,
	"AdmDt"	DATE		NOT NULL,
	"LeaveDt"	DATE		NULL
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
	"DocNo"	NUMBER(8)		NOT NULL,
	"PatNo"	NUMBER(8)		NOT NULL,
	"TrtDt"	DATE		NOT NULL,
	"Content"	VARCHAR2(4000)		NULL
);

CREATE TABLE "Handles" (
	"HdlNo"	NUMBER		NOT NULL,
	"TrtNo"	NUMBER		NOT NULL,
	"DocNo"	NUMBER(8)		NOT NULL,
	"NurNo"	NUMBER(8)		NOT NULL,
	"PatNo"	NUMBER(8)		NOT NULL,
	"HdlDt"	DATE		NOT NULL,
	"Content"	VARCHAR2(4000)		NULL
);

-- PK 제약조건
ALTER TABLE "Admits" ADD CONSTRAINT "PK_ADMITS" PRIMARY KEY (
	"AdmNo",
	"TrtNo",
	"DocNo",
	"PatNo"
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
	"TrtNo",
	"DocNo",
	"PatNo"
);

ALTER TABLE "Handles" ADD CONSTRAINT "PK_HANDLES" PRIMARY KEY (
	"HdlNo",
	"TrtNo",
	"DocNo",
	"NurNo",
	"PatNo"
);

-- FK 제약조건 설정
ALTER TABLE "Nurses" ADD CONSTRAINT "FK_Nurses" FOREIGN KEY ("DeptNo")
REFERENCES "Depts"("DeptNo");

ALTER TABLE "Doctors" ADD CONSTRAINT "FK_Doctors_On_DeptNo" FOREIGN KEY ("DeptNo")
REFERENCES "Depts"("DeptNo");

ALTER TABLE "Treatments" ADD CONSTRAINT "FK_Doctors_TO_Treatments_1" FOREIGN KEY ("DocNo")
REFERENCES "Doctors" ("DocNo");

ALTER TABLE "Treatments" ADD CONSTRAINT "FK_Patients_TO_Treatments_1" FOREIGN KEY ("PatNo")
REFERENCES "Patients" ("PatNo");

ALTER TABLE "Handles" ADD CONSTRAINT "FK_Nurses_TO_Handles_1" FOREIGN KEY ("NurNo")
REFERENCES "Nurses" ("NurNo");

-- 이 아래는 수동 쿼리 변경 작성
-- 처치에서 진료번호, 의사번호, 환자번호를 복합 FK로
ALTER TABLE "Handles" 
ADD CONSTRAINT "FK_Treatments_TO_Handles" 
	   FOREIGN KEY ("TrtNo", "DocNo", "PatNo")
  	REFERENCES "Treatments" ("TrtNo", "DocNo","PatNo");

-- 입원에서 진료번호, 의사번호, 환자번호를 복합 FK로
ALTER TABLE "Admits" 
ADD CONSTRAINT "FK_Treatments_TO_Admits" 
       FOREIGN KEY ("TrtNo", "DocNo", "PatNo") 
    REFERENCES "Treatments"("TrtNo", "DocNo", "PatNo");
