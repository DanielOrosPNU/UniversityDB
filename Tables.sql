CREATE TABLE Faculties 
(    
FacultyID INT PRIMARY KEY IDENTITY,    
FacultyName NVARCHAR(100) NOT NULL,    
Dean NVARCHAR(100) NOT NULL,    
Phone NVARCHAR(15) UNIQUE NOT NULL,    
Email NVARCHAR(100) UNIQUE NOT NULL  
);  
GO    
    
CREATE TABLE Professors (    
ProfessorID INT PRIMARY KEY IDENTITY,    
FirstName NVARCHAR(50) NOT NULL,    
LastName NVARCHAR(50) NOT NULL,    
Email NVARCHAR(100) UNIQUE NOT NULL,    
Phone NVARCHAR(15) UNIQUE NOT NULL,    
HireDate DATE NOT NULL,    
FacultyID INT  
);  
GO    
    
CREATE TABLE Students (    
StudentID INT PRIMARY KEY IDENTITY,    
FirstName NVARCHAR(50) NOT NULL,    
LastName NVARCHAR(50) NOT NULL,    
DateOfBirth DATE NOT NULL,    
Email NVARCHAR(100) UNIQUE NOT NULL,    
Phone NVARCHAR(15) UNIQUE NOT NULL 
);  
GO    
    
CREATE TABLE Courses (    
CourseID INT PRIMARY KEY IDENTITY,    
CourseName NVARCHAR(100) NOT NULL,    
CourseDescription NVARCHAR(500),    
Credits INT NOT NULL,    
FacultyID INT  
);
GO    
    
CREATE TABLE Clubs (    
ClubID INT PRIMARY KEY IDENTITY,    
ClubName NVARCHAR(100) NOT NULL,    
ClubDescription NVARCHAR(MAX)    
);  
GO    
    
CREATE TABLE Enrollments (    
EnrollmentID INT PRIMARY KEY IDENTITY,    
StudentID INT,    
CourseID INT,    
EnrollmentDate DATE NOT NULL  
);  
GO    
    
CREATE TABLE Grades (    
GradeID INT PRIMARY KEY IDENTITY,    
StudentID INT,    
CourseID INT,    
Date DATE NOT NULL,    
Grade DECIMAL(3, 2)    
);
GO    
    
CREATE TABLE Departments (    
DepartmentID INT PRIMARY KEY IDENTITY,    
DepartmentName NVARCHAR(100) NOT NULL,    
FacultyID INT  
);  
GO    
    
CREATE TABLE Courses_Professors (    
CourseID INT,    
ProfessorID INT  
);  
GO    
    
CREATE TABLE Students_Clubs (    
StudentID INT,    
ClubID INT 
);  
GO    
    
CREATE TABLE Events (    
EventID INT PRIMARY KEY IDENTITY,    
EventName NVARCHAR(100) NOT NULL,    
EventDate DATE NOT NULL,    
EventDescription NVARCHAR(MAX)  
);  
GO    
    
CREATE TABLE Library (    
BookID INT PRIMARY KEY IDENTITY,    
Title NVARCHAR(100) NOT NULL,    
Author NVARCHAR(100) NOT NULL,    
PublicationYear INT,    
ISBN NVARCHAR(20),    
AvailableCopies INT  
);  
GO    
    
CREATE TABLE BookLoans (    
LoanID INT PRIMARY KEY IDENTITY,    
BookID INT,    
StudentID INT,    
LoanDate DATE,    
ReturnDate DATE );  
GO    
    
CREATE TABLE Scholarships (    
ScholarshipID INT PRIMARY KEY IDENTITY,    
ScholarshipName NVARCHAR(100) NOT NULL,    
Amount DECIMAL(10, 2) NOT NULL,    
EligibilityCriteria NVARCHAR(500)    
);  
GO    
    
CREATE TABLE Student_Scholarships (    
StudentID INT,    
ScholarshipID INT  
);  
GO  
