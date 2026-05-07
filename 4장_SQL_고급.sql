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
select * from sale order by price asc;    -- asc : ascending, 오름차순
select * from sale order by price desc;    -- desc :  desceding, 내림차순

select *
from employee
order by name;

select * 
from employee
order by regdate asc;




select * 
from sale 
where price > 50000 
order by year desc,month, price desc;

# 실습 4-5

select *
from sale limit 3;

select *
from sale limit 0,3;

select * 
from sale limit 1,2;

select *
from sale
where price > 50000
order by year desc, month asc, price desc 
limit 5;

# 실습 4-6
select sum(price) as 합계
from sale;

select ceiling(1.2);
select ceiling(1.8); -- 올림함수
select floor(1.2); -- 내림함수
select floor(1.8);
select round(1.2);
select round(1.8);
select rand(); -- 0~1 사이의 실수
select ceiling(rand() * 45);

select count(price) as 갯수
from sale;
update sale set price = 80000 where no = 3;

select count(*) as 튜플갯수
from sale;

select left('HelloWorld',5);
select right('HelloWorld',5);
select substring('HelloWorld',6,5);
select concat('Hello','World'); -- 2개 문자열을 하나로 만들기 
SELECT CONCAT(empno, name, hp) FROM Employee WHERE empno='1008';

select curdate();
select curtime();
select now();

INSERT INTO Employee SET
empno = '1012',
name = '을지문덕',
gender = 'F',
hp = '010-1234-1012',
regdate = NOW();


# 실습 4-7
select sum(price) as 급여합계
from sale
where year = 2018 and month = 1;

# 실습 4-8
select sum(price) as 매출총합 , avg(price) as 평균
from sale
where year = '2019' and month = '2' and price > 50000;

# 실습 4-9
select max(price) as 최고매출 , min(price) as 최저매출
from sale
where year = '2020';

# 실습 4-10
select empno
from sale
group by empno; -- group by절에서 사용한 컬럼을 select 조회
select empno, year 
from sale
group by empno, year;

select empno, count(*) as 건수 
from sale
group by empno;


select empno, year, sum(price) as 합계
from sale
where price >= 50000
group by empno, year
order by 합계 desc
limit 3;
# 실습 4-11
select empno, sum(price) as 합계
from sale
group by empno
having 합계 >= 200000;

select empno,year,sum(price) as 합계
from sale
where price >= 100000
group by empno, year
having 합계 >= 200000
order by 합계 desc;
# 실습 4-12

create table sale2 like sale;
select * from sale2;
insert into sale2 select * from sale;


update sale2 set year = year + 4;

select * 
from sale
union
select *
from sale2;

SELECT * FROM Sale WHERE price >= 100000
UNION
SELECT * FROM Sale2 WHERE price >= 100000;

SELECT empno, year  FROM Sale
UNION
SELECT empno, year FROM Sale2;

SELECT empno, year, SUM(price) AS 합계 FROM Sale
GROUP BY empno, year
UNION
SELECT empno, year, SUM(price) AS 합계 FROM Sale2
GROUP BY empno, year
ORDER BY year ASC, 합계 DESC;

# 실습 4-13
select  *
from sale 
inner join employee on sale.empno = employee.empno;

select * from employee join dept on employee.depno = dept.depno;

select *
from sale as a
join employee as b
on a.empno = b.empno;

select * from sale as a
join employee as b
using(empno); -- using : 두 테이블의 컬럼명이 동일한 경우 using 사용

select a.no, a.empno, a.price, b.name, b.job, c.dname 
from sale as a
join employee as b on a.empno = b.empno
join dept as c on b.depno = c.depno
where price > 100000
order by price desc;


select *
from sale as a
left join employee as b
on a.empno = b.empno;



select *
from sale as a
right join employee as b
on a.empno = b.empno;










# 실습 4-14
SELECT * FROM Sale AS a LEFT JOIN Employee AS b ON a.empno = b.empno;
SELECT * FROM Sale AS a RIGHT JOIN Employee AS b ON a.empno = b.empno;
SELECT a.no, a.empno, price, name, job FROM Sale AS a
LEFT JOIN Employee AS b USING(empno);
# 실습 4-15

select a.empno, a.name, a.job, b.dname
from employee as  a
join dept as b
on a.depno = b.depno;



# 실습 4-16

select sum(price) as 매출합
from employee as a
join sale as b
on a.empno = b.empno
where name = '김유신' and year=2019;










# 실습 4-17
select  b.name,
		c.dname,
		b.job,
        a.year,
        sum(price) as 매출합계
from sale as a join employee as b on a.empno = b.empno
join dept as c on c.depno = b.depno
where year = 2019 and price > 50000
group by a.empno
having 매출합계 >= 100000
order by 매출합계 desc;




 
 
 
 
 
 
 
 
 
 
 