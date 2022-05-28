CREATE DATABASE Project;
USE Project


CREATE TABLE Customer
(
	customer_userID int PRIMARY KEY,
	fName varchar(30) NOT NULL,
	lName varchar(30) NOT NULL,
	email_ID varchar(30) NOT NULL,
	phoneNo varchar(20) NOT NULL,
	paymentType varchar(4) check(paymentType='Card' or paymentType='Cash' or paymentType='card' or paymentType='cash')
)


CREATE TABLE Movie
(
	movieID varchar(5) PRIMARY KEY,
	movieTitle varchar(30) NOT NULL,
	Genre varchar(20) NOT NULL,
	duration varchar(20) NOT NULL,
	releaseDate date NOT NULL
)
CREATE TABLE HallData
(
	hallID varchar(6) PRIMARY KEY,
	hallType varchar(10) NOT NULL check (hallType ='Premium' or hallType='Standard' or hallType ='premium' or hallType='standard'),
	screenType varchar(2) NOT NULL check (screenType='3D'or screenType='2D') ,
	seatingCapacity int NOT NULL CHECK(SeatingCapacity>0),
	seatsSold int CHECK(seatsSold >= 0)
)

CREATE TABLE Booking
(
	bookingID varchar(5) PRIMARY KEY,
	customerID int FOREIGN KEY REFERENCES Customer(customer_userID),
	movieID varchar(5) FOREIGN KEY REFERENCES Movie(movieId),
	hallID varchar(6) FOREIGN KEY REFERENCES HallData(hallID),
	dateSold date not null
)

Create table Ticket
(
 TicketID varchar(6) Primary Key,
 BookingID varchar(5) FOREIGN KEY REFERENCES Booking(bookingID),
 Price int check(price>0),
 Class varchar(10) check (class = 'Gold' or class ='Standard' or class = 'gold' or class ='standard')
)





Insert into Movie values
('MV001', 'Hichki','Drama/Comedy','2h 50mins','4-28-2021'),
('MV002', 'Pacific Rim Uprising','Fantasy/SciFi', '1h 50mins','5-28-2021'),
('MV003', 'Strangers : Prey at night','Horror', '2h 30mins','3-30-2021'),
('MV004', 'Tomb Raider','Fantasy/Action', '2h 35mins','2-20-2021'),
('MV005', 'Midnight Sun', 'Romance','2h 20mins','2-15-2021'),
('MV006', 'Peter Rabbit', 'Fantasy/Adventure','2h 10mins','3-15-2021'),
('MV007', 'Black Panther','Fantasy/SciFi','2h 05mins','2-15-2021'),
('MV008', 'Maze Runner: The Death Cure', 'Fantasy/SciFi','2h 50mins','2-22-2021'),
('MV009', 'Insidious: The Last Key', 'Horror','2h 20mins','1-17-2021'),
('MV010', 'Blackmail', 'Comedy','2h 50mins','6-10-2021'),
('MV011', 'Spiderman : Homecoming', 'Drama/Thriller','2h 22mins','3-18-2021'),
('MV012', '3 Storeys', 'Drama','1h 35mins','4-14-2021'),
('MV013', 'Wall-E', 'Adventure','2h 45mins','6-15-2021'),
('MV014', 'Avengers Infinity War', 'Drama/Thriller','2h 50mins','6-18-2021'),
('MV015', '1918', 'History','1h 55mins','6-19-2021'),
('MV016', 'Johnny English Reborn', 'Romance/Comedy','1h 50mins','6-22-2021');




Insert into Customer
Values(101,'Ali ','Kamran','alikamran2@gmail.com','03107893345','Card');

Insert into Customer
Values(102,'Zubair ','Javed','zubi432@gmail.com','03107498849','Card');

Insert into Customer
Values(103,'Simran ','Hamad','simha@yahoo.com','03119805564','Cash');

Insert into Customer
Values(104,'Zulfiqar ','Nawaz','herozulfi18@yahoo.com','03104490321','Cash');

Insert into Customer
Values(105,'Sana ','Atif','Sana_atif@hotmail.com','03124678990','Card');

Insert into Customer
Values(106,'Bilal ','Ismail','bilal321@yahoo.com','03118890334','Cash');

Insert into Customer
Values(107,'Qasim ','Raza','qasim_raza@yahoo.com','03105567980','Cash');

Insert into Customer
Values(108,'Aliya ','Shahbaz','Aliee333@gmail.com','03155554442','Card');

Insert into Customer
Values(109,'Mohsin ','Ikram','mosinss@yahoo.com','03205890332','Cash');

Insert into Customer
Values(110,'Ahad ','Ali','aa007@hotmail.com','03139994567','Cash');

Insert into Customer
Values(111,'Sahir ','Ali','sa_boss@hotmail.com','03147789456','Card');

Insert into Customer
Values(112,'Mahira ','Asim','missy222@yahoo.com','03159927867','Cash');

Insert into Customer
Values(113,'Javeria ','Sahil','java98@hotmail.com','03105567112','Card');

Insert into Customer
Values(114,'Asim ','Amir','asim_amir@hotmail.com','03139905556','Card');

Insert into Customer
Values(115,'Munib ','Ikram','munib009@hotmail.com','03158890676','Cash');

Insert into Customer
Values(116,'Sara ','Falak','sarafalak92@yahoo.com','03238883567','Cash');

Insert into Customer
Values(117,'Abdullah ','Yasir','Abdy95@hotmail.com','03169935562','Card');

Insert into Customer
Values(118,'Kashif ','Azad','azadi44@hotmail.com','03339995961','Cash');

Insert into Customer
Values(119,'Ahmer ','Abullah','ahmer32@gmail.com','03159386527','Card');

Insert into Customer
Values(120,'Aleena ','Yaqoob','fairytale456@hotmail.com','03239594590','Cash');


Insert into HallData
Values('Hall01','Premium','3D',350,276);

Insert into HallData
Values('Hall02','Standard','2D',400,243);

Insert into HallData
Values('Hall03','Premium','2D',350,299);


Insert into HallData
Values('Hall04','Standard','3D',400,325);

Insert into HallData
Values('Hall05','Premium','2D',450,259);

Insert into HallData
Values('Hall06','Standard','2D',400,374);

Insert into HallData
Values('Hall07','Premium','3D',350,179);

Insert into HallData
Values('Hall08','Standard','3D',450,399);

Insert into HallData
Values('Hall09','Premium','2D',350,269);

Insert into HallData
Values('Hall10','Standard','2D',400,332);



INSERT INTO Booking
VALUES
('BK001',101,'MV001','Hall01','06-18-2021'),
('BK002',103,'MV001','Hall01','06-18-2021'),
('BK003',108,'MV001','Hall01','06-19-2021'),
('BK004',110,'MV001','Hall01','06-20-2021'),
('BK005',102,'MV002','Hall02','06-13-2021'),
('BK006',105,'MV002','Hall02','06-13-2021'),
('BK007',107,'MV002','Hall02','06-13-2021'),
('BK008',111,'MV004','Hall04','06-6-2021'),
('BK009',112,'MV004','Hall04','6-06-2021'),
('BK010',113,'MV005','Hall05','06-18-2021'),
('BK011',115,'MV006','Hall06','06-21-2021'),
('BK012',117,'MV010','Hall08','06-22-2021');


INSERT INTO Ticket VALUES
('TKT101','BK002',700, 'gold'),
('TKT102','BK004',700, 'gold'),
('TKT103','BK005',1500, 'Standard'),
('TKT104','BK001',1500, 'Standard'),
('TKT105','BK003',700, 'gold'),
('TKT106','BK006',1500, 'Standard'),
('TKT107','BK007',700, 'gold'),
('TKT108','BK008',700, 'gold'),
('TKT109','BK009',1500, 'Standard'),
('TKT110','BK010',1500, 'Standard'),
('TKT111','BK011',700, 'gold'),
('TKT112','BK012',700, 'gold');

select * from booking
select * from movie

Query : Which movie is being watched the most

select movieTitle , count(Booking.movieID) as 'Count'
from booking , Movie
where movie.movieID = Booking.movieID
group by movieTitle
order by count(Booking.movieID) desc


Query: Which customer paid by card

select customer_userID , fname , lname
from Customer
where paymentType='Card'

Query: What class of seat sold most

select class , count(class) as 'Count'
from Ticket
group by class

Query: What Hall is being utilized the most
select Booking.hallID, count(halldata.hallID) as 'Number Of Shows'
from HallData , Booking
where HallData.hallID = Booking.hallID
group by Booking.hallID

Query: What day of the week most movies are being watched on
select DateName(WEEKDAY,dateSold) as 'Days'  , COUNT(DateName(WEEKDAY,dateSold)) as 'Count'
from Booking
group by DateName(WEEKDAY,dateSold)
order by COUNT(DateName(WEEKDAY,dateSold)) desc

Query: how many premium cenima halls we have?

SELECT HallType , COUNT(HallType) AS Count
FROM HallData
WHERE hallType = 'Premium'
GROUP BY hallType

Query: how many customers paid for premium hall?

SELECT Booking.customerID, Count(Booking.customerID) AS Count
From booking , HallData
Where booking.hallid= HallData.hallid
GROUP BY customerID

 

Function that takes first name and last name and shows Customer Details
create function showCustomerDetails(@firstName varchar(30) , @lastName varchar(30))
returns table
as
return (select * from Customer where fName=@firstName and lName=@lastName)

select * from showCustomerDetails('Zulfiqar','Nawaz')

Function that takes customerID and shows the movie he watched
create function showCustomerMovie(@cID int)
returns table
as 
return(select Booking.customerID , Movie.movieTitle from Booking,Movie where Booking.movieID=Movie.movieID and Booking.customerID=@CiD)




select * from showCustomerMovie(108)




select * from Booking
select * from HallData








