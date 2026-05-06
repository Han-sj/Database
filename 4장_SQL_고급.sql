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
