-- 날짜 : 2026/05/04
-- 이름 : 한성주
-- 내용 : 1장 데이터베이스 개요 및 설치

# MySQL 접속(cmd 콘솔 환경)
# > mysql -u root -p
# > -u: user, 사용자 계정
# > -p: password, 비밀번호

# 데이터베이스 생성 및 제거
CREATE DATABASE mydb;
DROP DATABASE mydb; -- 실행 단축키 : Ctrl + Enter

# 데이터베이스 목록 조히
SHOW DATABASES;

# 작업 데이터베이스 선택
USE mydb;
USE studydb;

-------------------
# 일반 관리자 생성, 권한부여, 반영
CREATE USER 'admin'@'%' identified BY '1234'; -- admin 계정 생성, %는 외부 접속 IP를 의미
GRANT ALL privileges ON MYDB.* TO 'admin'@'%'; -- admin에게 mydb의 모든 권한(읽기, 쓰기, 수정, 삭제) 부여
FLUSH privileges; -- admin 계정 권한 반영

# 계정 삭제
DROP USER 'admin'@'%';

# 비밀번호 수정
alter user 'admin'@'%' identified by 'abcd';