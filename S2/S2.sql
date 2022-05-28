create database fa19_bse_022;		
use fa19_bse_022;


CREATE TABLE agents
(
AGENT_CODE	varchar(50) PRIMARY KEY,
AGENT_NAME	varchar(50) NOT NULL,
WORKING_AREA varchar(100),
COMMISSION	int,
PHONE_NO	varchar(15),
COUNTRY		varchar(50)
);

CREATE TABLE agent1
(
AGENT_CODE	varchar(50) PRIMARY KEY,
AGENT_NAME	varchar(50) NOT NULL,
WORKING_AREA	varchar(100),
COMMISSION	int,
PHONE_NO	varchar(50),
COUNTRY		varchar(50)
);


CREATE TABLE customer
(
CUST_CODE	varchar(50) PRIMARY KEY,
CUST_NAME	varchar(50) NOT NULL,
CUST_CITY	varchar(50),
WORKING_AREA	varchar(100),
CUST_COUNTRY	varchar(50),
GRADE		int,
OPENING_AMT	int,
RECEIVE_AMT	int,
PAYMENT_AMT	int,
OUTSTANDING_AMT	int,
PHONE_NO	varchar(50),
AGENT_CODE	varchar(50) FOREIGN KEY REFERENCES agents(AGENT_CODE)
);

CREATE TABLE customer1
(
CUST_CODE	varchar(50) PRIMARY KEY,
CUST_NAME	varchar(50) NOT NULL,
CUST_CITY	varchar(50),
WORKING_AREA	varchar(100),
CUST_COUNTRY	varchar(50),
GRADE		int,
OPENING_AMT	int,
RECEIVE_AMT	int,
PAYMENT_AMT	int,
OUTSTANDING_AMT	int,
PHONE_NO	varchar(50),
AGENT_CODE	varchar(50) FOREIGN KEY REFERENCES agents(AGENT_CODE)
);

INSERT INTO agents VALUES
('A007','Ahmad','Bangalore',15,'0321-4578456','Australia'),
('A003','Sara','London',13,'0322-4512756','Canada'),
('A008','Ali','New York',12,'0323-4512476','Australia'),
('A011','Rehan','Bangalore',15,'0322-4248416','Pakistan'),
('A010','Saima','Chennai',14,'0324-4578486','UK'),
('A012','Iqra','San Jose',12,'0311-4545426','USA'),
('A005','Nouman','Brisban',13,'0331-4588410','USA'),
('A001','Sajid','Bangalore',14,'0341-4508050','UK'),
('A002','Alia','Mumbai',11,'0315-4078151','Australia'),
('A006','Saud','London',15,'0334-4504421','Pakistan'),
('A004','Anas','Torento',15,'0320-4551124','Pakistan'),
('A009','Zohaib','Hampshair',15,'0320-4152167','Pakistan')


INSERT INTO customer VALUES
('C00013','Mohsin','LONDON','LONDON','UK',2,6000,5000,7000,4000,'BBBBBBB','A003'),
('C00001','Raza','New York','New York','USA',2,3000,5000,2000,6000,'CCCCCCC','A008'),
('C00020','Shoaib','New York','New York','USA',3,5000,7000,6000,6000,'BBBBSBB','A008'),
('C00025','Irfan','Bangalore','Bangalore','India',2,5000,7000,4000,8000,'AVAVAVA','A011'),
('C00024','Haris','LONDON','LONDON','UK',2,4000,9000,7000,6000,'FSDDSDF','A006'),
('C00015','Afaq','LONDON','LONDON','UK',1,6000,8000,3000,11000,'GFSGERS','A003'),
('C00002','Anam','New York','New York','USA',3,5000,7000,9000,3000,'DDNRDRH','A008'),
('C00018','Sana','Brisban','Brisban','Australia',2,7000,7000,9000,5000,'NHBGVFC','A005'),
('C00021','Komal','Brisban','Brisban','Australia',1,7000,7000,7000,7000,'WERTGDF','A005'),
('C00019','Kashif','Islamabad','Islamabad','Pakistan',1,8000,7000,7000,8000,'ZZZZBFV','A010'),
('C00005','Salman','Lahore','Lahore','Pakistan',1,7000,11000,7000,11000,'147-25896312','A002'),
('C00007','Adnan','Islamabad','Islamabad','Pakistan',1,7000,11000,9000,9000,'GHRDWSD','A010'),
('C00022','Farhan','Lahore','lahore','Pakistan',2,7000,11000,9000,9000,'113-12345678','A002'),
('C00004','Umar','Brisban','Brisban','Australia',1,5000,8000,7000,6000,'AAAAAAA','A005'),
('C00023','Muzammil','London','London','UK',0,4000,6000,7000,3000,'AAAABAA','A006'),
('C00006','Qaiser','Torento','Torento','Canada',1,10000,7000,6000,11000,'DDDDDDD','A004'),
('C00010','Hasnain','Hampshair','Hampshair','Canada',3,6000,4000,5000,5000,'MMMMMMM','A009'),
('C00017','Intizar','Karachi','Karachi','Pakistan',2,8000,4000,3000,9000,'AAAAAAB','A007'),
('C00012','Saba','San Jose','San Jose','USA',1,5000,7000,9000,3000,'KRFYGJK','A012'),
('C00008','Sadia','Torento','Torento','Canada',1,7000,7000,9000,5000,'HJKORED','A004'),
('C00003','Sania','Torento','Torento','Canada',2,8000,7000,7000,8000,'MJYURFD','A004'),
('C00009','Rabia','Karachi','Karachi','Pakistan',3,8000,7000,3000,12000,'Phone No','A002'),
('C00014','Shazia','Lahore','Lahore','Pakistan',2,8000,11000,7000,12000,'AAAATGF','A001'),
('C00016','Fiaz','Lahore','Lahore','Pakistan',2,8000,11000,7000,12000,'JRTVFDD','A007'),
('C00011','Shakil','Islamabad','Islamabad','Pakistan',3,7000,11000,7000,11000,'PPHGRTS','A010')

INSERT INTO customer1 SELECT * FROM customer;
INSERT INTO agent1 SELECT * FROM agents


SELECT*
FROM agents;

SELECT*
FROM customer;

/*QS:2*/
SELECT * 
FROM customer
WHERE OPENING_AMT < (SELECT AVG(OPENING_AMT) FROM customer);

/*QS:8*/
SELECT*
FROM customer
WHERE OPENING_AMT BETWEEN 2000 AND 5000;

/*QS:6*/
SELECT* FROM agents
WHERE PHONE_NO LIKE'0321%' OR PHONE_NO LIKE '0322%';
/*QS:5*/
SELECT AGENT_CODE, CUST_COUNTRY, count(CUST_COUNTRY) as 'COUNTRY cUSTOMER COUNT'
from customer 
GROUP BY AGENT_CODE,CUST_COUNTRY
/*QS:7*/
SELECT GRADE,COUNT(GRADE) as 'GRADE COUNT',MAX(OUTSTANDING_AMT) as 'MAX OUTSTANDING AMMOUNT' 
FROM customer GROUP BY GRADE

/*QS:3*/
SELECT AGENT_CODE ,SUM(PAYMENT_AMT + RECEIVE_AMT + OPENING_AMT) as 'Total Amount'
FROM customer
GROUP BY agent_code
HAVING SUM(PAYMENT_AMT + RECEIVE_AMT + OPENING_AMT) > 15000;
/*QS:4*/
SELECT b.CUST_NAME
FROM customer b
WHERE EXISTS(select a.COUNTRY FROM agents a 
WHERE b.AGENT_CODE=a.AGENT_CODE and COUNTRY='PAKISTAN')
