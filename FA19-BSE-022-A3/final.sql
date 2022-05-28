CREATE DATABASE fa19bse022;
USE fa19bse022;

CREATE TABLE Student
(
	StudentID int PRIMARY KEY,
	Name varchar(20) NOT NULL
)

CREATE TABLE Course
(
	CourseID varchar(5) PRIMARY KEY,
	CourseName varchar(20) NOT NULL,
	TeacherID varchar(6) NOT NULL
)

CREATE TABLE Semester
(
	StudentID int FOREIGN KEY REFERENCES Student(StudentID),
	CourseID varchar(5) FOREIGN KEY REFERENCES Course(CourseID),
	SemesterType varchar(20) check(SemesterType ='Fall 16' or SemesterType='Spring 17' or SemesterType='Spring 16')
	primary key(StudentID , CourseID)

)

INSERT INTO Student
VALUES(48001,'Usama Sakeel');
INSERT INTO Student
VALUES(48007,'Faizan');
INSERT INTO Student
VALUES(48009,'Waleed Iqbal');
INSERT INTO Student
VALUES(48024,'Mubashir Imran');

INSERT INTO Course
VALUES('CS100','Operating System','CSF107');
INSERT INTO Course
VALUES('CS106','Computer Vision','CSF145');
INSERT INTO Course
VALUES('CS119','Game Design','CSF107');
INSERT INTO Course
VALUES('CS104','Internet of Things','CSF567');

INSERT INTO Semester
VALUES(48001,'CS100','Fall 16');
INSERT INTO Semester
VALUES(48001,'CS106','Spring 17');
INSERT INTO Semester
VALUES(48007,'CS100','Fall 16');
INSERT INTO Semester
VALUES(48007,'CS119','Spring 17');
INSERT INTO Semester
VALUES(48009,'CS100','Fall 16');
INSERT INTO Semester
VALUES(48009,'CS104','Spring 17');
INSERT INTO Semester
VALUES(48024,'CS100','Fall 16');
INSERT INTO Semester
VALUES(48024,'CS104','Spring 16');

SELECT StudentID FROM Semester 
WHERE CourseID = 'CS119' or CourseID = 'CS100' 

SELECT Semester.CourseID, Semester.StudentID, Student.Name 
FROM Semester INNER JOIN Student ON Semester.StudentID = Student.StudentID 
WHERE SemesterType = 'Spring 17' AND Semester.StudentID = Student.StudentID

CREATE FUNCTION enrolledCourses(@studID int)
RETURNS TABLE 
AS RETURN (SELECT CourseID from Semester where StudentID=@studID)

SELECT * FROM enrolledCourses(48001)

CREATE FUNCTION enrollmentCounter(@courseID varchar(5) ,@semID varchar(20))
RETURNS INT AS BEGIN
RETURN(SELECT COUNT(StudentID) AS totalStdudent FROM Semester WHERE CourseID=@courseID and SemesterType=@semID)
END
SELECT dbo.enrollmentCounter('CS100','Fall 16')


SELECT sem.CourseID, COUNT(StudentID) AS [No.ofStudents] FROM Semester sem
WHERE [SemesterType] = 'Fall 16'
GROUP BY CourseID