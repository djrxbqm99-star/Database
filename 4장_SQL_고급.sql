# 날짜 : 2026.05.06
# 이름 : 김민찬
# 내용 : 4장 SQL 고급 실습

# 실습 4-1

create table Employee(
	empno int primary key,
    name varchar(10)not null,
    gender char(1)not null,
    hp char(13) unique not null,
    job varchar(10) ,
    depno int,
    regdate date not null
);

create table Dept(
	depno int primary key,
    dname varchar(10) not null,
    tel varchar(12) not null
);

create table Sale(
	no int auto_increment primary key,
	empno int not null,
    year year not null,
    month tinyint not null,
    price int default 0
);

# 실습 4-2
insert into Employee values('1001','김유신','M','010-1234-1001','부장',101,'2026-11-19');
insert into Employee values('1002','김춘추','M','010-1234-1002','차장',104,'2026-11-19');
insert into Employee values('1003','장보고','M','010-1234-1003','사원',NULL,'2026-11-19');
insert into Employee values('1004','강감찬','M','010-1234-1004','대리',102,'2026-11-19');
insert into Employee values('1005','신사임당','F','010-1234-1005','과장',102,'2026-11-19');
insert into Employee values('1006','이황','M','010-1234-1006','차장',103,'2026-11-19');
insert into Employee values('1007','이이','M','010-1234-1007','사원',105,'2026-11-19');
insert into Employee values('1008','이순신','M','010-1234-1008',NULL,NULL,'2026-11-19');
insert into Employee values('1009','허난설현','F','010-1234-1009','사원',104,'2026-11-19');
insert into Employee values('1010','정약용','M','010-1234-1010','대리',104,'2026-11-19');

select * from Employee;



insert into dept values('101','경영지원부','051-512-1001');
insert into dept values('102','영업부','051-512-1002');
insert into dept values('103','개발부','051-512-1003');
insert into dept values('104','인사부','051-512-1004');
insert into dept values('105','기획부','051-512-1005');



insert into sale(empno,year,month,price) values(1001,2018,1,98100);
insert into sale(empno,year,month,price) values(1002,2018,1,136000);
insert into sale(empno,year,month,price) values(1003,2018,1,80000);
insert into sale(empno,year,month,price) values(1004,2018,1,78000);
insert into sale(empno,year,month,price) values(1005,2018,1,93000);
----------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1001,2018,2,24000);
insert into sale(empno,year,month,price) values(1002,2018,2,126000);
insert into sale(empno,year,month,price) values(1003,2018,2,19000);
insert into sale(empno,year,month,price) values(1004,2018,2,19000);
insert into sale(empno,year,month,price) values(1005,2018,2,53000);
------------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1001,2019,1,24000);
insert into sale(empno,year,month,price) values(1002,2019,1,109000);
insert into sale(empno,year,month,price) values(1003,2019,1,101000);
insert into sale(empno,year,month,price) values(1004,2019,1,53000);
insert into sale(empno,year,month,price) values(1007,2019,1,24000);
----------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1002,2019,2,160000);
insert into sale(empno,year,month,price) values(1003,2019,2,101000);
insert into sale(empno,year,month,price) values(1004,2019,2,43000);
insert into sale(empno,year,month,price) values(1005,2019,2,24000);
insert into sale(empno,year,month,price) values(1006,2019,2,109000);
---------------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1002,2020,1,201000);
insert into sale(empno,year,month,price) values(1004,2020,1,63000);
insert into sale(empno,year,month,price) values(1005,2020,1,74000);
insert into sale(empno,year,month,price) values(1006,2020,1,122000);
insert into sale(empno,year,month,price) values(1007,2020,1,111000);
-----------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1002,2020,2,120000);
insert into sale(empno,year,month,price) values(1003,2020,2,93000);
insert into sale(empno,year,month,price) values(1004,2020,2,84000);
insert into sale(empno,year,month,price) values(1005,2020,2,180000);
insert into sale(empno,year,month,price) values(1008,2020,2,76000);
------------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1001,2021,1,56000);
insert into sale(empno,year,month,price) values(1002,2021,1,123000);
insert into sale(empno,year,month,price) values(1005,2021,1,91000);
insert into sale(empno,year,month,price) values(1007,2021,1,78000);
insert into sale(empno,year,month,price) values(1002,2021,2,32000);
----------------------------------------------------------------------------
insert into sale(empno,year,month,price) values(1003,2021,2,148000);
insert into sale(empno,year,month,price) values(1004,2021,2,106000);
insert into sale(empno,year,month,price) values(1005,2021,2,112000);
insert into sale(empno,year,month,price) values(1001,2021,3,47000);
insert into sale(empno,year,month,price) values(1006,2021,3,36000);

select * from sale;


# 실습 4-3

select * from employee where name != '김춘추';
select * from employee where name <> '김춘추'; -- != 연산자와 동일
select * from employee where job = '사원' or job = '대리';
select * from employee where job in ('사원','대리');  -- 위 or 조건절과 동일 
select * from employee where name like '%신'; -- 신으로 끝나는 직원
select * from employee where name like '김%'; -- % : 와일드카드, 아무 문자열
select * from employee where name like '이_'; -- 이름이 '이'씨로 시작하는 두글자 직원
SELECT * FROM Employee WHERE name LIKE '_순%';
SELECT * FROM Employee WHERE HP LIKE '010-%';
SELECT * FROM Employee WHERE JOB IS NULL;
SELECT * FROM Employee WHERE JOB IS NOT NULL;
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPNO = 10;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPNO IN (10,30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영___';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;
SELECT * FROM SALE WHERE MONTH IN (1, 2);












# 실습 4-4
# 실습 4-5
# 실습 4-6
# 실습 4-7
# 실습 4-8
# 실습 4-9
# 실습 4-10
# 실습 4-11
# 실습 4-12
# 실습 4-13
# 실습 4-14
# 실습 4-15
# 실습 4-16
# 실습 4-17






 
 
 
 
 
 
 
 
 
 
 