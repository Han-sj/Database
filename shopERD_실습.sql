# 날짜 : 2026/05/20
# 이름 : 한성주
# 내용 : ShopERD 실습

# 실습 6-2
insert into customer values('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
insert into customer values('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
insert into customer values('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
insert into customer values('c104', '강감찬', '010-1234-1004', '서울시 관악구', '2023-01-04');
insert into customer values('c105', '이순신', '010-1234-1005', '부산시 금정구', '2023-01-05');
select * from customer;

insert into product values(1, '새우깡', 5000, 1500, '농심');
insert into product values(2, '초코파이', 2500, 2500, '오리온');
insert into product values(3, '포카칩', 3600, 1700, '오리온');
insert into product values(4, '양파링', 1250, 1800, '농심');
insert into product values(5, '죠리퐁', 22000, null, '크라운');
select * from product;


insert into `order` (orderId, orderProduct, orderCount, orderDate) 
													values('c102', 3, 2, now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) 
													values('c101', 4, 1, now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) 
													values('c102', 1, 1, now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) 
													values('c103', 5, 5, now());
insert into `order` (orderId, orderProduct, orderCount, orderDate) 
													values('c105', 2, 1, now());
                                                    
select * from `order`;
