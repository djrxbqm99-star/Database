# 날짜 : 2026.05.18
# 이름 : 김민찬
# 내용 : SQL 연습문제2 

# 실습 2-1
CREATE DATABASE `Bank`;
CREATE USER 'bank'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Bank.* TO 'bank'@'%';
FLUSH PRIVILEGES;

