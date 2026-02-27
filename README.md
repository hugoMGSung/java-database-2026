# java-database-2026
자바개발자 과정 데이터베이스 리포지토리

## Day01

### 데이터/정보

데이터는 단순한 컴퓨터환겨의 특정 값을 의미, 정보는 데이터에 의미를 부여한 것

### 데이터베이스(DataBase : DB)

데이터를 기반으로 하는 관리 시스템을 의미. 데이터를 보아둔 장소를 의미하기도 함

- DataBase Management System 을 줄여서 DBMS라고 부름
- DBMS를 줄여서 DB라고도 함
- 대부분 기업의 `도메인 정보`를 저장하고 있음
- IT에서 가장 중요하게 생각해야할 기술중 하나

![alt text](image.png)


### 데이터베이스 종류
- 관계형 데이터베이스(RDBMS)
    - `Oracle` - 학습할 DB
    - SQLServer - Microsoft사 제품. Oracle보다 성능이 낮음
    - MySQL - 오프소스진영에서 Oracle로 합병
    - MariaDB - MySQL 개발자들이 다시 만든 오픈소스 DB
    - PostgreSQL - 오픈소스 데이터베이스

- NoSQL 데이터베이스(빅데이터...)
    - Redis
    - MongoDB
    - Apache Cassandra

- In-Memory 데이터베이스
    - SAP HANA (겁나 빠름)


### 오라클 설치 방법
1. 로컬 설치 

    ![alt text](image-1.png)

2. 도커 설치(클라우드 동일)

    ![alt text](image-2.png)

### 오라클 설치 이전

1. 도커 설치 - DevOps의 필수품
    - https://www.docker.com/
    - Download Docker Desktop 버틑 클릭
    - Download for Windows - AMD64 선택

2. 설치 후 실행
    - Settings(오른쪽 상단 기어모양) 클릭
    - Start Docker Desktop when... 체크 후 Apply

### 오라클 설치

1. Docker Desktop에서 검색 후 Pull로 이미지 다운로드 가능 - 하지말 것

2. Docker Command 사용

    - Powershell 오픈 후, 도커 실행 확인

        ```bash
        docker --version
        Docker version 29.2.1, build a5c7197
        ```

    - 이미지 검색

        ```bash
        docker search oracle-xe
        NAME                      DESCRIPTION                                      STARS     OFFICIAL
        gvenzl/oracle-xe          Oracle Database XE (21c, 18c, 11g) for every…   355      **
        owncloudci/oracle-xe                                                       0
        abstractdog/oracle-xe                                                      0
        ```
    
    - 이미지 당겨오기

        ```bash
        docker pull gvenzl/oracle-xe:21-slim
        ```

        ![alt text](image-3.png)

    - 컨테이너 실행

        ```bash
        docker run -d --name oracle-xe -p 1521:1521 -e ORACLE_PASSWORD=P12345s! gvenzl/oracle-xe:21-slim
        ``` 

        ![alt text](image-4.png)
        

    - 컨테이터 내부 접속

        ```bash
        docker exec -it oracle-xe sqlplus system/P12345s!@XE
        
        SQL*Plus: Release 21.0.0.0.0 - Production on Thu Feb 26 04:44:25 2026
        Version 21.3.0.0.0

        Copyright (c) 1982, 2021, Oracle.  All rights reserved.

        Last Successful login time: Thu Feb 26 2026 03:18:25 +00:00

        Connected to:
        Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
        Version 21.3.0.0.0

        SQL> 
        ```
    
    - 강의용 사용자 생성

        ```sql
        CREATE USER java IDENTIFIED BY java12345;

        GRANT CONNECT, RESOURCE TO java;
        GRANT CREATE TABLE TO java;

        GRANT all privileges TO java;  -- INSERT등 추가권한 할당
        ```

### 데이터베이스 개발툴 설치

1. 개발툴 종류
    - SQL*Plus - 콘솔개발 화면. 가장 기초적인 SQL실행도구. 매우 사용불편
    - Oracle SQL Developer - 오라클사가 제공하는 무료툴. 오프소스. java개발툴 eclipse를 커스터마이징해서 개발
    - Toad for Oracle - DB개발툴 가장 강력한 SW. 상용라이선스
    - `DBeaver` - 오픈소스, 거의 모든 DB를 다 사용. 대중성이 매우 높음

2. DBeaver 설치
    - https://dbeaver.io/
    - Community Edition 클릭 Windows (Installer) 선택

3. VS Code 확장
    - Database Client, Database Client JDBC 확장 설치

    ![alt text](image-8.png)


### DBeaver 사용법

- Database Navigator 에서 DB연결 시작

    ![alt text](image-5.png)

    - 마우스 오른쪽버튼 > Create > Connection

        ![alt text](image-6.png)

    - 연결정보 입력 Test Connection
    - 입력 시 주의사항 : Port번호 확인, Database 이름변경 Oracle -> XE로, Username, Password 일치


        ![alt text](image-7.png)


### 기본 사용법

- DBeaver
    - 연결된 XE - java > Schema(Database와 같은의미) 확장 > JAVA 선택
    - 마우스 오른쪽 버튼 > SQL 편집기
    - 글자 크기 변경 > 메뉴 윈도우 > 환경 설정
        - User Interface > 모양 > 색상 및 글꼴 > DBeaver Fonts > Monospace font를 편집

        ![alt text](image-9.png)

- 샘플 데이터베이스 생성

    1. 테이블 생성 : [쿼리](./day01/1.sample_schemas.sql)
    2. 시퀀스 생성 : [쿼리](./day01/2.sequences.sql)
    3. 부서데이터 추가 : [쿼리](./day01/3.department_datas.sql)
    4. 직원데이터 추가 : [쿼리](./day01/4.employee_datas.sql)
    5. 고객데이터 추가 : [쿼리](./day01/5.customer_datas.sql)
    6. 상품데이터 추가 : [쿼리](./day01/6.product_datas.sql)
    7. 주문과 주문상세데이터 추가 : [쿼리](./day01/7.order_order_item_datas.sql)

- 간단 연습 : [쿼리](./day01/8.샘플쿼리.sql)
    - DB 파일은 확장자를 `.sql`
    - 하나의 명령으로 ;으로 끝나는 문장을 쿼리(query)로 지칭
    - 쿼리문은 대소문자 구분 없음
    - DBeaver에서 쿼리 한줄 실행은 `Ctrl+Enter`
    - 여러줄 동시실행은 `Alt+x`

- SQL(Structured Query Language) 
    - 구조화된 질의 언어
    - 관계형 데이터베이스에서 DBMS상에 데이터를 정의, 조작, 제어하기 위해 사용하는 표준 프로그래밍 언어

## Day02

### DBeaver 사용법, DB작업시 사전지식
- 메뉴 상 용어들
    - 검색 > `DB Full-Text` - Full Text Search(대용량 텍스트 내에서 필요한 단어를 검색할 때)
    - SQL 편집기 > `실행계획` - 현재의 쿼리가 실행되는데 비용이 얼마나 발생하는지 파악하는 기술. 최적화 실행속도 빠르게 하기 전에 분석
    - 데이터베이스 > `트랜잭션` 모드 - 쿼리들이 실행되는 논리적 덩어리, Auto-Commit(조금 위험), None Commit

![alt text](image-10.png)

- 위 스키마 하위에서 지금 알아야 할 내용들
    - 테이블
    - 뷰
    - 인덱스
    - 스퀀스
    - 프로시저
    - 펑션
    - SQL 문법까지

### 기본, SELECT문

- 문법이전 데이터 타입 일부
    - `NUMBER` - 숫자타입, 최대 22byte
    - INTEGER - 정수타입, 모든 데이터 기초 4byte(-21억 ~ +21억)
    - FLOAT - 실수타입, 소수점포함, 최대 22byte
    - `CHAR`(n) - Character 문자열타입, 고정형, 최대 2000byte
        - CHAR(20)기분 'Hello World'를 저장하면, 'Hello World&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' 로 저장됨. 무조건 자리수를 20자리로 고정해서 생성
    - `VARCHAR2`(n) - 가변형문자열, 최대 4000byte
        - 오라클에서 VARCHAR(n)는 사용안함
        - VARCHAR2(20)으로 'Hello World'를 저장하면, 'Hello World'. 뒤에 9자리는 버림.
    - `LONG`(n) - 가변길이 문자열, 최대 2Gbyte
    - LONG RAW(n) - 바이너리(이진)데이터, 0과 1의 숫자로만 저장. 최대2Gbyte
    - CLOB - 대용량 텍스트타입, 최대 4Gbyte
    - BLOB - 대용량 바이너리타입, 최대 4Gbyte
    - `DATE` - 날짜타입. 문자열과 다름

- 데이터 조회 3가지 방법 - [쿼리](./day02/1.데이터조회방법.sql)
    - `셀렉션`(Selection) - 행단위로 조회
    - `프로젝션`(Projection) - 열단위로 조회
    - `조인`(Join) - 두 개 이상 테이블을 조합해서 조회

- SELECT 문법
    - 기본쿼리, 별명 - [쿼리](./day02/2.기본쿼리%20및%20별명지정쿼리.sql)
    - 중복제거 - [쿼리](./day02/3.중복제거쿼리.sql)
    - 정렬 - [쿼리](./day02/4.정렬쿼리.sql)
    - WHERE절 - [쿼리](./day02/5.조건쿼리.sql)

    ```sql
    -- 주석 한줄 주석
    /* 여러줄 
       주석(C언어 주석) */
    -- 기본 문법
    SELECT [*|열이름 나열]
      FROM [dual|테이블명];

    -- 별명추가
    SELECT 컬럼명 [AS 별명], 
           계산식 AS "별명",
           ...
      FROM 테이블명 [테이블별명];

    -- 데이터 정렬
    SELECT 위와동일
      FROM 테이블명
     ORDER BY [정렬할 열이름(여러개)][ASC|DESC];
    /*
    ASC - ascending(오름차순)
    DESC - descending(내림차순)
    ASC는 기본이고 생략가능
    */

    -- 조건절 WHERE절
    -- 원하는 조건으로 다양하게 조회할때
    SELECT 위와동일
      FROM 테이블명
    [WHERE 조회할 행을 선별하는 조건식]
    [ORDER BY [정렬할 열이름(여러개)][ASC|DESC]];
    ```

- SELECT 연산 - [쿼리](./day02/6.연산자.sql)

    ```sql
    -- 산술연산자 + - * /
    -- 비교연산자 >(크다) <(작다) >=(크거나같다) <=(작거나같다) ==(같다) <>, !=(같지않다)
    -- 논리부정연산자 NOT
    -- IN = OR와 동일
    -- BETWEEN
    ```

- 오라클 함수 : DB별로 추가학습 필요 - [쿼리](./day02/8.오라클함수.sql)

    - 문자열 함수 
        - `UPPER`(모두 대문자), `LOWER`(모두 소문자), `INITCAP`(첫글자만 대문자로)
        - `LENGTH`(문자열길이)
        - `SUBSTR`(문자열, 시작, 길이), 길이를 안적으면 끝까지 추출
        - `INSTR`(문자열, 찾을문자열, [횟수]), 문자열에서 찾을 문자열의 위치를 리턴
        - `REPLACE`(문자열, 찾는문자열, 바꿀문자열), 찾은 문자열을 바꿀문자열로 변경
        - `LPAD`(문자열, 자리수, 채울문자열), `RPAD`(문자열, 자리수, 채울문자열), L/R 기준으로 자리수만큼 빈공간 특정문자로 채우기
        - `CONCAT`(앞쪽문자열, 뒤쪽문자열), 두 문자열 합치기
        - `TRIM`(공백있는문자열), `LTRIM`(공백있는문자열), `RTRIM`(공백있는문자열), 문자열 앞뒤의 빈공백 제거

    - 숫자 함수
        - `ROUND`(반올림할수, 반올림위치)
        - `TRUNC`(숫자, 버림위치)
        - `CEIL`(올림할수)
        - `FLOOR`(내림할수)
        - `MOD`(나머지구할수)

### DB 특징 

- 모든 언어는 인덱스가 0부터 시작
- 단, `데이터베이스는 인덱스 1부터` 시작!

## Day03

### 함수

- 오라클 함수 계속
    - 날짜함수
    - 형변환함수
    - NULL 처리함수
    - DECODE, CASE

### 데이터 그룹화

### 조인
