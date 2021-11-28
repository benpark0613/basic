-- 신규 사용자 생성하기
-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호;

-- 오라클 12버전 이전 버전의 사용자 생성방식을 사용하도록 설정
ALTER SESSION SET "_ORACLE_SCRIPT" = true;

-- 신규 사용자 생성
CREATE USER HTA IDENTIFIED BY zxcv1234;

-- 신규 사용자에게 권한 부여하기
-- GRANT 시스템권한, 시스템권한, ... TO 사용자;
-- GRANT 롤, 롤, 롤 ... TO 사용자;

-- HTA 사용자에게 CONNECT 롤과 RESOURCE 롤 부여
-- CONNECT 롤: 데이터베이스와 연결하는 세션을 생성할 수 있는 시스템 권한을 포함하고 있는 롤
-- RESOURCE 롤 : 데이터베이스 객체(테이블, 뷰, 시퀀스, 인덱스 등)의 생성/변경/삭제, PL/SQL을 사용할 수 있는 권한 등을 포함하고 있는 롤, 
--              데이터베이스 사용자에게 필수적으로 필요한 시스템권한이 포함되어 있는 롤이다.
GRANT CONNECT, RESOURCE, DBA TO HTA;