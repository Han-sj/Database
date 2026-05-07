# 날짜 : 2026/05/06
# 이름 : 한성주
# 내용 : 4장 SQL 고급 실습

# 실습 4-1
create table Employee (
	empno 		int primary key,
    name		varchar(10) not null,
    gender		char(1) not null,
    hp			varchar(13) unique,
    job			char(10),
    depno		int,
    regdate		date not null
    );
    
create table Dept (
	depno		int primary key,
    dname		varchar(10) not null,
    tel			varchar(12) not null
    );
    
create table Sale (
	no			int primary key auto_increment,
    empno		int not null,
    year		year not null,
    month		tinyint not null,
    price		int default 0
    );

# 실습 4-2
insert into employee values (1001, '김유신', 'M', '010-1234-1001', '부장', 101, '2026-11-19');
insert into employee values (1002, '김춘추', 'M', '010-1234-1002', '차장', 104, '2026-11-19');
insert into employee values (1003, '장보고', 'M', '010-1234-1003', '사원', null, '2026-11-19');
insert into employee values (1004, '강감찬', 'M', '010-1234-1004', '대리', 102, '2026-11-19');
insert into employee values (1005, '신사임당', 'F', '010-1234-1005', '과장', 102, '2026-11-19');
insert into employee values (1006, '이황', 'M', '010-1234-1006', '차장', 103, '2026-11-19');
insert into employee values (1007, '이이', 'M', '010-1234-1007', '사원', 105, '2026-11-19');
insert into employee values (1008, '이순신', 'M', '010-1234-1008', null, null, '2026-11-19');
insert into employee values (1009, '허난설헌', 'F', '010-1234-1009', '사원', 104, '2026-11-19');
insert into employee values (1010, '정약용', 'M', '010-1234-1010', '대리', 104, '2026-11-19');
select * from employee;

insert into dept values (101, '경영지원부', '051-512-1001');
insert into dept values (102, '영업부', '051-512-1002');
insert into dept values (103, '개발부', '051-512-1003');
insert into dept values (104, '인사부', '051-512-1004');
insert into dept values (105, '기획부', '051-512-1005');
select * from dept;

insert into sale (empno, year, month, price) values(1001, 2018, 1, 98100);
insert into sale (empno, year, month, price) values(1002, 2018, 1, 136000);
insert into sale (empno, year, month, price) values(1003, 2018, 1, 80000);
insert into sale (empno, year, month, price) values(1004, 2018, 1, 78000);
insert into sale (empno, year, month, price) values(1005, 2018, 1, 93000);

insert into sale (empno, year, month, price) values(1001, 2018, 2, 24000);
insert into sale (empno, year, month, price) values(1002, 2018, 2, 126000);
insert into sale (empno, year, month, price) values(1003, 2018, 2, 19000);
insert into sale (empno, year, month, price) values(1005, 2018, 2, 19000);
insert into sale (empno, year, month, price) values(1006, 2018, 2, 53000);

insert into sale (empno, year, month, price) values(1001, 2019, 1, 24000);
insert into sale (empno, year, month, price) values(1002, 2019, 1, 109000);
insert into sale (empno, year, month, price) values(1003, 2019, 1, 101000);
insert into sale (empno, year, month, price) values(1004, 2019, 1, 53000);
insert into sale (empno, year, month, price) values(1007, 2019, 1, 24000);

insert into sale (empno, year, month, price) values(1002, 2019, 2, 160000);
insert into sale (empno, year, month, price) values(1003, 2019, 2, 101000);
insert into sale (empno, year, month, price) values(1004, 2019, 2, 43000);
insert into sale (empno, year, month, price) values(1005, 2019, 2, 24000);
insert into sale (empno, year, month, price) values(1006, 2019, 2, 109000);

insert into sale (empno, year, month, price) values(1002, 2020, 1, 201000);
insert into sale (empno, year, month, price) values(1004, 2020, 1, 63000);
insert into sale (empno, year, month, price) values(1005, 2020, 1, 74000);
insert into sale (empno, year, month, price) values(1006, 2020, 1, 122000);
insert into sale (empno, year, month, price) values(1007, 2020, 1, 111000);

insert into sale (empno, year, month, price) values(1002, 2020, 2, 120000);
insert into sale (empno, year, month, price) values(1003, 2020, 2, 93000);
insert into sale (empno, year, month, price) values(1004, 2020, 2, 84000);
insert into sale (empno, year, month, price) values(1005, 2020, 2, 180000);
insert into sale (empno, year, month, price) values(1008, 2020, 2, 76000);

insert into sale (empno, year, month, price) values(1001, 2021, 1, 56000);
insert into sale (empno, year, month, price) values(1002, 2021, 1, 123000);
insert into sale (empno, year, month, price) values(1005, 2021, 1, 91000);
insert into sale (empno, year, month, price) values(1007, 2021, 1, 78000);
insert into sale (empno, year, month, price) values(1002, 2021, 2, 32000);

insert into sale (empno, year, month, price) values(1003, 2021, 2, 148000);
insert into sale (empno, year, month, price) values(1004, 2021, 2, 106000);
insert into sale (empno, year, month, price) values(1005, 2021, 2, 112000);
insert into sale (empno, year, month, price) values(1001, 2021, 3, 47000);
insert into sale (empno, year, month, price) values(1006, 2021, 3, 36000);

select * from sale;

# 실습 4-3

select * from employee where name != '김춘추'; -- !=와
select * from employee where name <> '김춘추'; -- <>는 not으로 같은 기호이다.
select * from employee where job = '사원' or job = '대리'; 
select * from employee where job in ('사원','대리'); -- 위 Or 조건절과 동일
select * from employee where name like '김%'; -- 이름이 김~인 것, % : 와일드 카드, 아무 문자열
select * from employee where name like '%신'; -- 이름이 ~신인 것
select * from employee where name like '이_'; -- 이름이 이로 시작하는 외자인 것
select * from employee where name like '_순%';
select * from employee where hp like '010-%';
select * from employee where job is null;
select * from employee where job is not null;
select * from employee where depno is null;
select * from employee where depno is not null;
select * from employee where empno >= 1005;
select * from dept where depno = 10;
select * from dept where dname = '개발부';
select * from dept where tel like '%30%';
select * from dept where depno in (10, 30);
select * from dept where dname like '경영___';
select * from sale where price > 50000;
select * from sale where price >= 50000 and price < 100000 and month = 1;
select * from sale where price between 50000 and 100000;
select * from sale where price not between 50000 and 100000;
select * from sale where year = 2024;
select * from sale where year = 2024 and month = 2;
select * from sale where month in (1, 2);

# 실습 4-4
select * from sale;
select * from sale order by price;
select * from sale order by price asc;
select * from sale order by price desc;
select * from sale 
	where price > 50000 
    order by year desc, month, price desc;
select * from employee order by name desc;
select * from employee order by regdate asc;

# 실습 4-5
select * from sale limit 3;
select * from sale limit 0, 3;
select * from sale limit 1, 2;
SELECT * FROM Sale LIMIT 5, 3;
select * from sale order by price desc limit 3, 5;
SELECT * FROM Sale WHERE price < 50000 ORDER BY price DESC LIMIT 3;
select * from sale where price > 50000 order by year desc, month asc, price desc limit 5;

# 실습 4-6
SELECT SUM(price) AS 합계 FROM Sale;
SELECT AVG(price) AS 평균 FROM Sale;
SELECT MAX(price) AS 최대값 FROM Sale;
SELECT MIN(price) AS 최소값 FROM Sale;
SELECT CEILING(1.2);
SELECT CEILING(1.8); -- 올림함수
SELECT FLOOR(1.2);
SELECT FLOOR(1.8); -- 내림함수
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND(); -- 0 ~ 1 사이 실수
SELECT CEILING(RAND() * 10);
SELECT COUNT(price) AS 갯수 FROM Sale;
SELECT COUNT(*) AS 튜플갯수 FROM Sale; -- * : 튜플
SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(empno, name, hp) FROM Employee WHERE empno = '1008';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

insert into employee set
	empno = '1012',
    name = '을지문덕',
    gender = 'F',
    hp = '010-1234-1012',
    regdate = now();

select * from employee;

# 실습 4-7
select sum(price) as '1월 매출 총합' from sale where year = 2018 and month = 1;

# 실습 4-8
select sum(price) as '2019년 2월 매출 총합',
	   avg(price) as '2019년 2월 매출 평균'
			from sale where price >= 50000 
			and year = 2019 and month = 2;
            
# 실습 4-9
select max(price) as '2020년 최고 매출',
       min(price) as '2020년 최저 매출'
		from sale where year = 2020;
        
# 실습 4-10
select empno from sale group by empno;
select year from sale group by year;
select empno, year from sale group by empno, year;
select empno, count(*) as 건수 from sale group by empno;
select empno, sum(price) as 합계 from sale group by empno;
select empno, avg(price) as 평균 from sale group by empno;

select 
    empno,
    year,
    sum(price) as 합계
from sale
where price >= 50000
group by empno, year
order by 합계 desc
limit 3;

select empno, year, sum(price) as 합계
from sale
group by empno, year;

select empno, year, sum(price) as 합계
from sale
group by empno, year
order by year asc, 합계 desc;

select empno, year, sum(price) as 합계
from sale
where price >= 50000
group by empno, year
order by 합계 desc;

# 실습 4-11

select empno, sum(price) as 합계 from sale
group by empno
having 합계 >= 200000;

select empno, year, sum(price) as 합계
from sale
where price >= 100000
group by empno, year
having 합계 >= 200000
order by 합계 desc;

# 실습 4-12

create table sale2 like sale;
insert into sale2 select * from sale;
update sale2 set year = year + 4;
select * from sale2;

select * from sale 
union 
select * from sale2;

select * from sale where price >= 100000
union
select * from sale2 where price >= 100000;

select empno, year sale from sale
union 
select empno, year sale from sale2;

select empno, year, sum(price) as 합계
from sale
group by empno, year
union
select empno, year, sum(price) as 합계
from sale2
group by empno, year
order by year asc, 합계 desc;

# 실습 4-13
select * 
from sale 
inner join employee on sale.empno = employee.empno;
-- 위 아래 같은 코드
select * from sale as a
		join employee as b
        on a.empno = b.empno; -- as 생략 가능
-- 위 아래 같은 코드
select * from sale as a
		join employee as b
        using (empno); -- 두 테이블의 컬럼명이 동일한 경우 using 사용

select * from employee inner join dept on employee.depno = dept.depno;
-- inner 생략한 코드
select * from employee join dept on employee.depno = dept.depno;

select a.no, a.empno, price, name, job from sale as a
join employee as b using (empno);

select 
	a.no, a.empno, a.price, b.name, b.job, c.dname
from sale as a
	join employee as b on a.empno = b.empno -- = employee as b using(empno) 가능
    join dept as c on b.depno = c.depno
    where price >= 100000
    order by price desc;

# 실습 4-14

select * from sale as a left join employee as b on a.empno = b.empno;
select * from sale as a right join employee as b on a.empno = b.empno;

select a.no, a.empno, price, name, job from sale as a
left join employee as b using(empno);
select a.no, a.empno, price, name, job from sale as a
right join employee as b using(empno);

# 실습 4-15

select 
a.empno, a.name, a.job, b.dname
from employee as a 
join dept as b 
 on a.depno = b.depno;

# 실습 4-16

select 
	sum(price) as 매출합 
	from employee as a
	join sale as b
	on a.empno = b.empno
    where a.name = '김유신' and b.year = 2019;

# 실습 4-17

select 
	a.empno, 
	b.name,
	c.dname,
	b.job,
	a.year,
	sum(price) as 매출합
from sale as a
join employee as b on a.empno = b.empno
join dept as c on b.depno = c.depno
where year = 2019 and price >= 50000
group by empno
having 매출합 >= 100000
order by 매출합 desc;
