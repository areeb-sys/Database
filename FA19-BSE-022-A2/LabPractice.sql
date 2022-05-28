CREATE DATABASE DB;
USE DB;

CREATE TABLE BRANCH
(
	branchNO varchar(4) PRIMARY KEY,
	street varchar(50) NOT NULL,
	city varchar(20) NOT NULL,
	postcode varchar(20)
)


INSERT INTO BRANCH
VALUES('B005','22 Deer Rd','LONDON','SW1 4EH');
INSERT INTO BRANCH
VALUES('B007','16 Argyll St','ABERDEEN','AB2 3SU');
INSERT INTO BRANCH
VALUES('B003','163 Main St','GLASGOW','G11 9QX');
INSERT INTO BRANCH
VALUES('B002','56 Clover Dr','LONDON','NW10 6EU');
SELECT*
FROM BRANCH

CREATE TABLE STAFF
(
	staffNo varchar(20) PRIMARY KEY,
	fName varchar(20) NOT NULL,
	lName varchar(20) ,
	position varchar(20) NOT NULL,
	sex varchar(1)NOT NULL,
	DOB varchar(10) NOT NULL,
	salary int NOT NULL,
	branchNO varchar(4) FOREIGN KEY REFERENCES BRANCH(branchNO)
)

INSERT INTO STAFF
VALUES('SL21','JOHN','WHITE','MANAGER','M','1-Oct-45',30000,'B005');
INSERT INTO STAFF
VALUES('SG37','ANN','BEECH','ASSISTANT','F','10-Nov-60',12000,'B003');
INSERT INTO STAFF
VALUES('SG14','DAVID','FORD','SUPERVISOR','M','24-Mar-45',18000,'B003');
INSERT INTO STAFF
VALUES('SA9','MARY','HOWE','ASSISTANT','F','19-Feb-70',9000,'B007');
INSERT INTO STAFF
VALUES('SG5','SUSAN','BRAND','MANAGER','F','3-JUN-40',24000,'B003');
INSERT INTO STAFF
VALUES('SL41','JULIE','LEE','ASSISTANT','F','13-Jun-65',9000,'B005');

SELECT*
FROM STAFF

CREATE TABLE Client(

	clientNo varchar(20) PRIMARY KEY ,
	fName varchar (20) NOT NULL,
	lName varchar(20) ,
	telNo varchar(30) NOT NULL,
	prefType varchar(20) NOT NULL,
	maxRent int NOT NULL,
)

DROP TABLE Client
INSERT INTO Client
VALUES('CR76','john','kay','0207-774-5632','Flat',425);
INSERT INTO Client
VALUES('CR56','Aline','stewart','0141-848-1825','Flat',350);
INSERT INTO Client
VALUES('CR74','Mike','Ritchie','01475-392178','House',750);
INSERT INTO Client
VALUES('CR62','Mary','Tregear','01224-196720','Flat',600);

SELECT* 
FROM Client;


CREATE TABLE PrivateOwner
(
ownerNo varchar (5) PRIMARY KEY ,
fName varchar(20) NOT NULL,
lName varchar(20) ,
address varchar (50) NOT NULL,
telNo varchar(30) NOT NULL,

)
INSERT INTO PrivateOwner
VALUES ('CO46','Joy','Keogh','2 Fergus Dr Aberdeen AB27SX','01224-861212')
INSERT INTO PrivateOwner
VALUES ('CO87','Carol','Farrel','6 Achray St GlassGow G329DX','0141-357-7419')
INSERT INTO PrivateOwner
VALUES ('CO40','Tina','Murphy','63 WellSt G42','0141-943-1728')
INSERT INTO PrivateOwner
VALUES ('CO93','Tony','Shaw','12 ParkPI,Glasgow G4oQR','0141-225-7025')

SELECT* 
FROM PrivateOwner


CREATE TABLE PropertyForRent
(
	propertyNo varchar(20) ,
	street varchar(30) NOT NULL,
	city varchar(15) NOT NULL,
	postcode varchar(15) NOT NULL,
	type varchar(10) NOT NULL,
	rooms int,
	rent int NOT NULL,
	ownerNO varchar(5) FOREIGN KEY REFERENCES PrivateOwner(ownerNo),
	staffNo varchar(20) FOREIGN KEY REFERENCES STAFF(staffNo),
	branchNO varchar(4) FOREIGN KEY REFERENCES BRANCH(branchNO),
	
)


INSERT INTO PropertyForRent
VALUES('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007');
INSERT INTO PropertyForRent
VALUES('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005');
INSERT INTO PropertyForRent
VALUES('PG4','6 Lawerence St','Glasgow','G11 9QX','Flat',3,350,'CO40', NULL,'B003');
INSERT INTO PropertyForRent
VALUES('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93', 'SG37','B003');
INSERT INTO PropertyForRent
VALUES('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87', 'SG37','B003');
INSERT INTO PropertyForRent
VALUES('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93', 'SG14','B003');

SELECT*
FROM PropertyForRent

SELECT*
FROM STAFF
WHERE POSITION IN ('MANAGER','SUPERVISOR');


SELECT*
FROM PrivateOwner
WHERE POSITION IN ('MANAGER','SUPERVISOR');

SELECT*
FROM PropertyForRent
WHERE staffNo is NOT NULL

SELECT *
FROM STAFF
ORDER BY Salary DESC;


SELECT *
FROM STAFF
ORDER BY Salary ASC;


SELECT *
FROM STAFF
ORDER BY Salary ;

SELECT*
FROM PropertyForRent

SELECT*
FROM STAFF
WHERE POSITION IN ('MANAGER','SUPERVISOR');


SELECT*
FROM PrivateOwner
WHERE POSITION IN ('MANAGER','SUPERVISOR');

SELECT*
FROM PropertyForRent
WHERE staffNo is NOT NULL

SELECT *
FROM STAFF
ORDER BY Salary DESC;


SELECT *
FROM STAFF
ORDER BY Salary ASC;


SELECT *
FROM PropertyForRent
ORDER BY  TYPE,rent DESC;

SELECT*
FROM PropertyForRent

SELECT*
FROM STAFF
WHERE POSITION IN ('MANAGER','SUPERVISOR');


SELECT*
FROM PrivateOwner
WHERE POSITION IN ('MANAGER','SUPERVISOR');

SELECT*
FROM PropertyForRent
WHERE staffNo is NOT NULL

SELECT *
FROM STAFF
ORDER BY Salary DESC;


SELECT *
FROM STAFF
ORDER BY Salary ASC;


SELECT *
FROM STAFF
ORDER BY POSITION ,Salary DESC;

SELECT*
FROM PropertyForRent

SELECT*
FROM STAFF
WHERE POSITION IN ('MANAGER','SUPERVISOR');


SELECT*
FROM PrivateOwner
WHERE POSITION IN ('MANAGER','SUPERVISOR');

SELECT*
FROM PropertyForRent
WHERE staffNo is NOT NULL

SELECT *
FROM STAFF
ORDER BY Salary DESC;


SELECT *
FROM STAFF
ORDER BY Salary ASC;


SELECT COUNT (*) AS myCount
FROM PropertyForRent
WHERE rent>350 ;


SELECT*
FROM PropertyForRent
WHERE rent>350 ;

SELECT COUNT(distinct salary) as myC
FROM STAFF
WHERE salary>8000;

SELECT*
FROM STAFF
WHERE salary>8000;

SELECT COUNT(staffNo) AS myC , SUM(salary) AS mySum
FROM Staff
WHERE Position = 'MANAGER';


SELECT AVG(salary) AS myAVg
FROM Staff;

SELECT SUM(salary) AS mySum
FROM STAFF
where branchNo = 'B003';

SELECT COUNT(*)
FROM STAFF
where branchNo='B005';

SELECT *
FROM PropertyForRent
ORDER BY City , Rent DESC;

SELECT *
FROM Client
Order BY maxRent DESC


SELECT branchNo,COUNT(staffNO) AS myC, SUM(salary) AS mySUm
FROM STAFF
GROUP BY branchNo
Order BY branchNo


SELECT branchNo,COUNT(staffNO) AS myC, SUM(salary) AS mySUm
FROM STAFF
GROUP BY branchNo
Order BY branchNo

SELECT branchNo,COUNT(staffNO) AS myC, SUM(salary) AS mySUm
FROM STAFF
GROUP BY branchNo
HAVING COUNT(staffNo)>1
Order BY branchNo;


SELECT branchNo,COUNT(staffNO) AS myC, SUM(salary) AS mySUm
FROM STAFF
GROUP BY branchNo
HAVING COUNT(staffNo)>1
Order BY branchNo;

SELECT COUNT(type) as myC
FROM PropertyForRent
GROUP BY type

SELECT COUNT(ownerNo) as myC
FROM PropertyForRent
GROUP BY OwnerNo

SELECT branchNo,sex,COUNT(sex) as myC
FROM STAFF
GROUP BY branchNO,sex

SELECT branchNo,position,COUNT(position) as myC
FROM STAFF
GROUP BY branchNo,position order BY branchNo

SELECT branchNo,COUNT(staffNo) myC
FROM STAFF
Group BY branchNo
HAVING COUNT(staffNo)>1


SELECT s.branchNo, s.staffNo, fName,lName,PropertyNo
FROM Staff s , PropertyForRent p
WHERE s.staffNo = p.staffNo
ORDER BY s.branchNo, s.staffNo, propertyNo;

SELECT b.branchNo, b.city s.staffNo, fName, lName ,propertyNo
FROM BRANCH b, STAFF s, PropertyForRent p
WHERE b.branchNo = s.branchNo AND s.staffNo = p.staffNo
ORDER BY b.branchNo, s.staffNo, propertyNo;


//SUBQUERY

SELECT staffNo
FROM STAFF
WHERE branchNo=(SELECT branchNo
				FROM branch
				WHERE street='163 Main St');

SELECT staffNo,salary-(SELECT AVG(salary) FROM STAFF) AS salDiff
FROM STAFF
WHERE salary>(SELECT AVG(salary)
				FROM STAFF);
SELECT staffNo,salary
FROM Staff
WHERE (SELECT AVG(salary) FROM Staff) < salary;

SELECT propertyNo,street,city,postcode,type,rooms,rent
FROM PropertyForRent
WHERE staffNo IN (SELECT staffNo
				FROM STAFF
				WHERE branchNo=(SELECT branchNo
				FROM branch
				WHERE street='163 Main St'));

// ANY/ALL 
SELECT staffNo,fName,lName,position,salary
FROM STAFF
WHERE salary> SOME(SELECT salary
				FROM STAFF
				WHERE branchNo='B003');   /* (max) */
SELECT staffNo,fName,lName,position,salary
FROM STAFF
WHERE salary> ALL(SELECT salary
				FROM STAFF
				WHERE branchNo='B003');  /* (min) */


SELECT staffNo,fName,lName,position
FROM STAFF s
WHERE EXISTS (SELECT *
				FROM BRANCH b
				WHERE s.branchNo = b.branchNo AND city = 'LONDON');
SELECT staffNo,fName,lName,position
FROM STAFF s, BRANCH b
WHERE s.branchNo = b.branchNo AND city = 'LONDON';

SELECT city
FROM BRANCH
WHERE city IS NOT NULL
UNION
(SELECT city
FROM PropertyForRent
WHERE city IS NOT NULL);

SELECT city
FROM BRANCH
WHERE city IS NOT NULL
INTERSECT
(SELECT city
FROM PropertyForRent
WHERE city IS NOT NULL);

SELECT city
FROM BRANCH
EXCEPT
(SELECT city
FROM PropertyForRent);



CREATE TABLE Branch1
(
	branchNo varchar(4) PRIMARY KEY,
	bCity varchar(20) NOT NULL
)

CREATE TABLE PropertyForRent1
(
	propertyNo varchar(4) PRIMARY KEY,
	pCity varchar(20) NOT NULL 
)

INSERT INTO Branch1
VALUES('B003','Glasgow');
INSERT INTO Branch1
VALUES('B004','Bristol');
INSERT INTO Branch1
VALUES('B002','London');

DROP TABLE Branch1

DROP TABLE PropertyForRent1

INSERT INTO PropertyForRent1
VALUES('PA14','Abendeen');

INSERT INTO PropertyForRent1
VALUES('PL94','London');

INSERT INTO PropertyForRent1
VALUES('PG4','Glassgow');

SELECT*
FROM Branch1

SELECT*
FROM PropertyForRent1

//Left OuterJoin

SELECT b.*, p.*
FROM Branch1 b LEFT JOIN PropertyForRent1 p ON b.bCity = p.pCity;

SELECT*
FROM Branch1 b,PropertyForRent1 p
WHERE b.bCity = p.pCity

SELECT b.*, p.*
FROM Branch1 b FULL JOIN PropertyForRent1 p ON b.bCity = p.pCity;

update STAFF
set salary = salary * 1.03;

select salary
from staff

UPDATE Staff
SET position = 'Manager', salary = 18000
where STAFF;


update PropertyForRent
set rent = rent *1.01
where city = 'LONDON';

SELECT*
FROM PropertyForRent

update PrivateOwner
set telNo = '0900-78601'
where fName = 'Tina' and lName = 'Murphy'

SELECT*
FROM PrivateOwner;

update PropertyForRent
set staffNo = 'SG37'
where type = 'Flat' and rooms = 3

DELETE STAFF
where staffNo = 'SA9';