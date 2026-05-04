# 날짜 : 2026.05.04
# 이름 : 김민찬
# 내용 : 2장 SQL 기초

# 테이블 생성
create table user1(
   userid varchar(20),
   name varchar(20),
   hp char(13),
   age int
);

# 테이블 삭제
drop table user1;
# 실습 2 - 2 (워크북 p4)

insert into user1 values ('A101','김유신','010-1234-1111',25);
insert into user1 values ('A102','김춘추','010-1234-2222',23);
insert into user1 values ('A103','장보고','010-1234-3333',32);
insert into user1(userid, name, age) values ('A104','강감찬',45);
insert into user1 set userid ='A105', name ='이순신', hp = '010-1234-5555';

# 실습 2-3
select * from user1;
select * from user1 where userid = 'A101';
select * from user1 where age < 30;
select * from user1 where age >= 30;
select userid, name, age from user1;

# 실습 2-4
update user1 set hp='010-1234-4444' where userid = 'A104';
update user1 set age=51 where userid = 'A105';
update user1 set hp='010-1234-1001' where userid = 'A101';

# 실습 2-5

delete from user1 where userid ='A101';
delete from user1 where userid ='A102' and age = 25;
delete from user1 where age >=30;

# 실습 2-6. 테이블 컬럼 수정
alter table user1 add gender tinyint;
alter table user1 add birth char(10) after name;
alter table user1 modify gender char(1);
alter table user1 drop gender;
alter table user1 drop birth;
select * from user1;

# 실습 2-7 테이블 복사
create table user1_1 like user1; -- user1 테이블을 가지고 user1_1 테이블 생성, 데이터는 복사 안됨

insert into user1_1 select * from user1; -- user1 테이블 데이터를 user1_1로 복사
select * from user1_1;
































