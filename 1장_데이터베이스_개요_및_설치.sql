-- 날짜 : 2026.05.04
-- 이름 : 김민찬
-- 내용 : 1장 데이터베이스 개요 및 설치

# MySQL 접속
#> mysql -u root -p 
#> -u: user, 사용자 계정 
#> -p: password, 비밀번호

# 데이터베이스 생성, 제거
create database mydb;
drop database mydb; -- 실행 단축키 : Ctrl + Enter


# 데이터베이스 목록 조회
show databases;

# 작업 데이터베이스 선택
use mydb;
use studydb;

----------------------
# 일반 관리자 생성

create user 'admin'@'%' identified by '1234';    -- admin 계정 생성, %는 외부접속 IP를 의미	
grant all privileges on mydb.* to 'admin'@'%';  -- admin에게 mydb의 모든권(읽기,쓰기,수정,삭제) 부여 
flush privileges;	-- admin 계정권한 반영

# 계정 삭제
drop user 'admin'@'%'; -- %는 외부접속 IP를 의미

# 비밀번호 수정
alter user 'admin'@'%' identified by 'abcd';






