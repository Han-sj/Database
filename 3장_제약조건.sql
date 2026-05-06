# 날짜 : 2026/05/06
# 이름 : 한성주
# 내용 : 3장 제약조건

# 실습 3-1 기본키 실습
Create table User2 (
userid varchar(10) primary key,
name   varchar(10),
birth  char(10),
addr   varchar(50)
);

insert into User2 values('A101', '김유신', '1968-05-09', '경남 김해시');
insert into User2 values('A102', '김춘추', '1972-12-23', '경남 경주시');
insert into User2 values('A103', '장보고', '1978-03-01', '전남 완도군');
insert into User2 values('A104', '강감찬', '1979-08-16', '서울 관악구');
insert into User2 values('A105', '이순신', '1981-05-23', '부산시 진구');

select * from User2;

insert into User1 values('A101', '정약용', '010-7897-1223', 22);

# 실습 3-3. 고유키 실습
Create table User3 (
	userid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10),
    hp 		char(13) unique,
    addr	varchar(50)
    );
    
# 실습 3-4. User3 데이터 입력
insert into User3 values('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into User3 values('A102', '김춘추', '1972-12-23', '010-1234-1002', '경남 경주시');
insert into User3 values('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into User3 values('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울 관악구');
insert into User3 values('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
insert into User3 values('A106', '정약용', '1981-05-22', null, '부산시 진구');
insert into user3 (userid, birth, addr, name)
				values('A108', '1983-03-22', '부산 동래구', '송상헌');

insert into user3 set
					userid = 'B101',
					name   = '홍길동',
					birth  = '1992-05-09',
					addr   = '부산 연제구';
                    

select * from user3;

# 3-4. 외래키 실습
create table Parent (
	pid 	varchar(10) primary key,
    name 	varchar(10),
    birth 	char(10),
    addr 	varchar(100)
    );

create table Child (
	cid 	varchar(10) primary key,
    name 	varchar(10),
    hp 		char(13) unique,
    parent 	varchar(10),
    foreign key (parent) references parent (pid) -- 외래키 설정 FK(~) references ~ (~)
    );
    
insert into Parent values('P101', '김유신', '1968-05-09', '경남 김해시');
insert into Parent values('P102', '김춘추', '1972-11-23', '경남 진주시');
insert into Parent values('P103', '장보고', '1978-03-01', '전남 완도군');
insert into Parent values('P104', '강감찬', '1979-08-16', '서울 관악구');
insert into Parent values('P105', '이순신', '1981-05-23', '부산시 진구');
select * from Parent;

insert into Child values('C101', '김철수', '010-1234-1001', 'P101');
insert into Child values('C102', '김영희', '010-1234-1002', 'P101');
insert into Child values('C103', '강철수', '010-1234-1003', 'P103');
insert into Child values('C104', '이철수', '010-1234-1004', 'P105');
insert into Child values('C105', '이수영', '010-1234-1005', 'P100'); -- 부모값이 존재하지 않기에 되지 않음
insert into Child values('C106', '최영', '010-1234-1006', null); 

select * from child;

# 실습 3-7. Default와 Not Null 실습
create table User4(
	userid	varchar(10) primary key,
    name	varchar(10) not null,
    gender	char(1),
    age		int default 1,
    hp		char(13) unique,
    addr	varchar(20)
    );
    
insert into User4 values('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into User4 values('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
insert into User4 values('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도군');
insert into User4 values('A104', '강감찬', 'M', 42, '010-1234-4444', '서울 관악구');
insert into User4 (userid, name, gender, hp, addr)
	values('A105', '이순신', 'M', '010-1234-5555', '부산시 진구');
insert into User4 values('A106', '신사임당', 'F', 32, null, '강릉시');
insert into User4 values('A107', '허난설헌', 'F', 27, null, '경기도 광주시');
select * from user4;
    
create table User5(
	seq		int primary key auto_increment,
    name	varchar(10) not null,
	gender	char(1) check (gender in ('M', 'F')),
    age 	int default 1 check (age > 0 and age < 100),
    addr 	varchar(20)
    );
    
    
insert into User5 (name, gender, age, addr)
				values('김유신', 'M', 25, '경남 김해시');
insert into User5 (name, gender, age, addr)
				values('김춘추', 'M', 23, '경남 경주시');
insert into User5 (name, gender, age, addr)
				values('장보고', 'M', 35, '전남 완도군');
insert into User5 (name, gender, age, addr)
				values('강감찬', 'M', 42, '서울 관악구');
insert into User5 (name, gender, age, addr)
				values('이순신', 'M', 51, '부산시'); -- Check 'A' 젠더값 안 맞으면 insert 안됨
insert into User5 (name, gender, age, addr)
				values('신사임당', 'F', 21, '강릉시'); -- Check '-1' 나이값 안 맞으면 insert 안됨
select * from user5;