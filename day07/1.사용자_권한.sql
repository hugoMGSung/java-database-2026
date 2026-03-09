-- system 계정으로 실행
-- 사용자 생성
-- 아래와 같이 사용자를 생성하면 insert 등 저장에 문제발생
CREATE USER orclstudy
IDENTIFIED BY oracle;

-- 아래와 같이 사용자를 생성해야 문제가 발새하지 않음
CREATE USER orclstudy
IDENTIFIED BY oracle
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users; -- 무제한 용량

-- 또는 용량제한
ALTER USER orclstudy
QUOTA 100M ON users;  -- 100M 용량제한

-- 아직까지 접속 불가
-- 접속 권한 추가
GRANT CREATE SESSION TO orclstudy;

-- 사용자 정보확인
SELECT * 
  FROM ALL_USERS;

SELECT *
  FROM dba_objects
 WHERE owner = 'ORCLSTUDY';

-- ALTER로 사용자 패스워드 변경
ALTER USER orclstudy
IDENTIFIED BY "oracle#!";

-- DROP으로 사용자 삭제
DROP USER sample CASCADE;


-- orclstudy에 테이블 생성 권한 부여
GRANT CREATE TABLE TO orclstudy;
GRANT RESOURCE TO orclstudy;

-- ORA-01950: 테이블스페이스 'USERS'에 대한 권한이 없습니다.
-- 테이블스페이스 저장권한(Quota)이 없어서 발생
ALTER USER orclstudy
quota unlimited ON users;

-- 권한취소
REVOKE RESOURCE, CREATE TABLE FROM orclstudy;