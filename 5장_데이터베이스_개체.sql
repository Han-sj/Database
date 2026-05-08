# 날짜 : 2026/05/08
# 이름 : 한성주
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
select * from vw_user1;
create view vw_user4_age_under30 as (select * from user4 where age <30);
create view vw_employee_with_sales as (
 select
		a.empno as 직원번호,
		b.name as 직원이름,
		b.job as 직급,
		c.dname as 부서명,
		a.year as 매출년도,
		a.month as 월,
		a.price as 매출액
        from sale as a
        join employee as b on a.empno = b.empno
        join dept as c on b.depno = c.depno
        );



# 실습 5-5
SELECT * FROM vw_user1;
SELECT * FROM vw_user2_age_under30;

# 실습 5-6
DROP VIEW vw_user1;
DROP VIEW vw_user4_age_under30;

# 실습 5-7
> DELIMITER $$
CREATE PROCEDURE proc_test1()
BEGIN
SELECT * FROM Employee;
SELECT * FROM Dept;
END $$
DELIMITER ;
CALL proc_test1();


# 실습 5-8
delimiter $$
 create procedure proc_test2(in _username varchar(10))
 begin
  select * from employee where name =_username;
  end $$
delimiter ;

call proc_test2('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test3(IN _job VARCHAR(10), IN _depno TINYINT)
BEGIN
SELECT * FROM Employee WHERE job=_job AND depno=_depno;
END $$
DELIMITER ;

CALL proc_test3('차장', 101);

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT)
BEGIN
SELECT COUNT(*) INTO _count FROM Employee WHERE job=_job;
END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count : ', @_count)

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

delimiter $$
create procedure proc_test6()
begin
declare num1 int;
declare num2 int;
set num1 = 1;
set num2 = 2;
if(num1 > num2) then
select 'num1이 num2보다 크다.' as 결과2;
else
select 'num1이 num2보다 작다.' as 결과2;
end if;
end $$
delimiter ;

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

CALL proc_test7();

# 실습 5-10. 커서를 활용한 프로시저
DELIMITER $$
	CREATE PROCEDURE proc_test8()
	BEGIN
	# 변수 선언
	DECLARE total INT DEFAULT 0;
	DECLARE temp INT;
	DECLARE endOfRow BOOLEAN DEFAULT false;
    
	# 커서 선언
	DECLARE saleCursor CURSOR FOR
		SELECT price FROM Sale;
        
	# 반복 조건
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET endOfRow = TRUE;
        
	# 커서 열기
	OPEN saleCursor;
	
    cursor_loop: LOOP
    -- 커서가 가리키는 현재 행의 값을 temp 변수에 저장, 한 번 반복마다 한 행 씩 이동
	FETCH saleCursor INTO temp;
	
    IF endOfRow THEN
		LEAVE cursor_loop;
	END IF;
	
    SET total = total + temp;
END LOOP;

	SELECT total AS '전체 합계';
CLOSE saleCursor;
END $$
DELIMITER ;

CALL proc_test8();

select price from sale;

# 실습 5-11
-- root로 접속해서 아래 환경설정 후 실행해야 함수 생성됨
delimiter $$

	create function func_test1(_empno int) returns int
	begin
		declare total int;
        
        select sum(price) into total from sale where empno = _empno;
        
        return total;
        end $$
delimiter ;

select func_test1(1001); -- 함수는 select, 프로시저는 call

delimiter $$

	create function func_test2(_price int) returns double
	begin
		declare bonus double;
        
        if(_price >= 100000) then
			set bonus = _price * 0.1;
        else
			set bonus = _price * 0.05;
        end if;
        
        return bonus;
        end $$
delimiter ;

select 
	empno, 
    year, 
    month, 
    price, 
    func_test2(price) as bonus 
    from sale;