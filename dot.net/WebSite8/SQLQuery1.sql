create database db1
use db1

drop table join_now
create table join_now
(
 ParentID int unique,
RefererID int constraint c1 unique,
name1 varchar(20),
address varchar(100),
country varchar(20),
city varchar(20),
pin varchar(20),
phone varchar(20),
Email varchar(20),
 Cheque_in_favour varchar(20),
username varchar(20) constraint c2 unique,
password varchar(20),
Security_ques varchar(40),
answer varchar(20)
)
 
select * from join_now
