#날짜 : 2026.05.08
# 이름 : 김민찬
# 내용 : 5장 데이터베이스 개체 

# 실습 5-1


show index from user1;
show index from user2;
show index from user3;
select * from user3;
 
# 실습 5-2 
create index idx_user1_userid on user1(userid);
analyze table user1;

# 실습 5-3 
drop index idx_user1_userid on user1;

# 실습 5-4 
create view vw_user1 as (select name, hp, age from user1);
select * from vw_user1;   # result view

create view vw_user4_age_under30 
as (select * from user4 where age < 30);

create view vw_Employee_with_sales as(
select 
a.empno as 직원번호,
b.name as 직원이름,
b.job AS 직급,
c.dname AS 부서명,
a.year AS 매출년도,
a.month AS 월,
a.price AS 매출액
from sale as a
join employee as b on a.empno = b.empno
join dept as c on b.depno = c.depno
);

# 실습 5 -5 
select * from vw_employee_with_sales;
select * from vw_user1;
select * from vw_user2_age_under30;

# 실습 5-6 
drop view vw_user1;
drop view vw_user4_age_under30;
drop view vw_employee_with_sales;

# 실습 5-7
delimiter $$
	create procedure proc_test1()
    begin
		select * from employee;
        select * from dept;
    end $$
delimiter ;

call proc_test1();

# 5 -8
delimiter $$
 create procedure proc_test2(in _username varchar(10))
 begin
  select * from employee where name =_username;
  end $$
delimiter ;

call proc_test2('김유신');

delimiter $$
 create procedure proc_test3(in _job varchar(10), in _depno tinyint)
 begin
  select * from employee where job =_job and depno=_depno;
  end $$
  delimiter ;
  call proc_test3('차장',103);

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT)
BEGIN
    SELECT COUNT(*) INTO _count FROM Employee WHERE job=_job;
END $$
DELIMITER ;

call proc_test4('대리', @_count);
select concat('_count :',@_count)

# 실습 5-9
delimiter $$
	create procedure proc_test5(in _name varchar(10))
    begin
     declare _empno int;
     select empno into _empno from employee where name = _name;
     select * from sale where empno = _empno;
     end $$
     delimiter ;

call proc_test5('김유신');

DELIMITER $$

CREATE PROCEDURE proc_test6()
BEGIN
    DECLARE num1 INT; -- 변수 선언
    DECLARE num2 INT; -- 변수 선언 

    SET num1 = 1; -- 값할당
    SET num2 = 2; -- 값할당

    IF (NUM1 > NUM2) THEN
        SELECT 'NUM1이 NUM2보다 크다.' AS 결과2;
    ELSE
        SELECT 'NUM1이 NUM2보다 작다.' AS 결과2;
    END IF;
END $$

DELIMITER ;

call proc_test6();

DELIMITER $$

CREATE PROCEDURE proc_test7()
BEGIN
    DECLARE sum INT;
    DECLARE num INT;

    SET sum = 0;
    SET num = 1;

    WHILE (num <= 10) DO
        SET sum = sum + num;
        SET num = num + 1;
    END WHILE;

    SELECT sum AS '1부터 10까지 합계';
END $$

DELIMITER ;

call proc_test7();

# 실습 5-10, 커서를 활용한 프로시저

delimiter $$
	create procedure proc_test8()
    begin
     # 변수 선언
     declare total int default 0;
     declare temp int;
     declare endOfRow boolean default false;
     
     # 커서 선언 : 테이블의 특정 컬럼을 포인팅하는 가상개체
     declare saleCursor cursor for 
     select price from sale;
     
     # 반복 조건
     declare continue handler for not found
     set endOfRow = true;
     
     # 커서 열기 
     open saleCursor;
     
     cursor_loop : LOOP
     
     -- 커서가 기리키는 현재 행의 값을 temp 변수에 저장, 한번 반복마다 한행씩 이동
      fetch saleCursor into temp;
      
      if endOfRow then
		leave cursor_loop;
	  end if;
      
       set total = total + temp;
	end loop;
    
    select total as '전체 합계';
    
    close saleCursor;
    end $$
    delimiter ;
    
call proc_test8();
    

# 실습 5-11 저장 함수 생성 및 호출 
delimiter $$
	create function func_test1(_empno int) returns int -- 반환타입
    begin
      declare total int;
	
      select sum(price) into
      total from sale where empno = _empno;
      
      return total;
      
	end $$
	delimiter $$
    
      
      
      
      
      
      
      
      
    
    
      
     
     
     
     
     
     
     
     end $$
delimiter $$
     
     
     
     
     
     
     
     




















