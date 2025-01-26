CREATE OR ALTER   PROCEDURE GetDepartments    
@DepartmentID INT = NULL,    
@DepartmentName NVARCHAR(50) = NULL,    
@FacultyID INT = NULL,    
@PageSize INT = 20,    
@PageNumber INT = 1,    
@SortColumn VARCHAR(120) = NULL,    
@SortDirection BIT = 0  AS    
    
IF @DepartmentID IS NOT NULL  AND NOT EXISTS(SELECT *    
FROM dbo.Departments    
    WHERE DepartmentID = @DepartmentID)    
BEGIN    
PRINT 'Incorrect value of @DepartmentID'    
RETURN  END    
    
    
SELECT *  FROM dbo.Departments    
WHERE DepartmentID = @DepartmentID    
 OR @DepartmentID IS NULL    
AND (DepartmentName LIKE @DepartmentName + '%')    
 OR @DepartmentID IS NULL    
AND @DepartmentName IS NULL    
AND FacultyID = @FacultyID    
ORDER BY  CASE  WHEN @SortDirection = 0 THEN    
CASE @SortColumn    
        WHEN 'DepartmentID' THEN CAST(DepartmentID AS NVARCHAR(50))    
        WHEN 'DepartmentName' THEN DepartmentName    
WHEN 'FacultyID' THEN CAST(FacultyID AS NVARCHAR(50))    
    END  
END,  
CASE  WHEN @SortDirection = 1 THEN    
CASE @SortColumn    
        WHEN 'DepartmentID' THEN CAST(DepartmentID AS NVARCHAR(50))    
        WHEN 'DepartmentName' THEN DepartmentName    
WHEN 'FacultyID' THEN CAST(FacultyID AS NVARCHAR(50))    
    END  
END 
DESC  
OFFSET (@PageNumber - 1) * @PageSize ROWS  FETCH NEXT @PageSize ROWS ONLY;  
GO

CREATE OR ALTER PROCEDURE  SetFaculty  
@FacultyID INT = NULL,  
@FacultyName NVARCHAR(100) = NULL,  
@Dean NVARCHAR(100) = NULL,  
@Phone NVARCHAR(15) = NULL,  
@Email NVARCHAR(100) = NULL  
AS  
BEGIN  
    IF @FacultyID IS NOT NULL  
    BEGIN        UPDATE Faculties  
        SET FacultyName = @FacultyName,  
            Dean = @Dean,  
            Phone = @Phone,  
            Email = @Email  
        WHERE FacultyID = @FacultyID;  
    END    ELSE    BEGIN        INSERT INTO Faculties (FacultyName, Dean, Phone, Email)  
        VALUES (@FacultyName, @Dean, @Phone, @Email);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetProfessor  
@ProfessorID INT = NULL,  
@FirstName NVARCHAR(50) = NULL,  
@LastName NVARCHAR(50) = NULL,  
@Email NVARCHAR(100) = NULL,  
@Phone NVARCHAR(15) = NULL,  
@HireDate DATE = NULL,  
@FacultyID INT = NULL  
AS  
BEGIN  
    IF @ProfessorID IS NOT NULL  
    BEGIN        UPDATE Professors  
        SET FirstName = @FirstName,  
            LastName = @LastName,  
            Email = @Email,  
            Phone = @Phone,  
            HireDate = @HireDate,  
            FacultyID = @FacultyID  
        WHERE ProfessorID = @ProfessorID;  
    END    ELSE    BEGIN        INSERT INTO Professors (FirstName, LastName, Email, Phone, HireDate, FacultyID)  
        VALUES (@FirstName, @LastName, @Email, @Phone, @HireDate, @FacultyID);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetStudent  
@StudentID INT = NULL,  
@FirstName NVARCHAR(50) = NULL,  
@LastName NVARCHAR(50) = NULL,  
@DateOfBirth DATE = NULL,  
@Email NVARCHAR(100) = NULL,  
@Phone NVARCHAR(15) = NULL  
AS  
BEGIN  
    IF @StudentID IS NOT NULL  
    BEGIN        UPDATE Students  
        SET FirstName = @FirstName,  
            LastName = @LastName,  
            DateOfBirth = @DateOfBirth,  
            Email = @Email,  
            Phone = @Phone  
        WHERE StudentID = @StudentID;  
    END    ELSE    BEGIN        INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, Phone)  
        VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @Phone);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetCourse  
@CourseID INT = NULL,  
@CourseName NVARCHAR(100) = NULL,  
@CourseDescription NVARCHAR(MAX) = NULL,  
@Credits INT = NULL,  
@FacultyID INT = NULL  
AS  
BEGIN  
    IF @CourseID IS NOT NULL  
    BEGIN        UPDATE Courses  
        SET CourseName = @CourseName,  
            CourseDescription = @CourseDescription,  
            Credits = @Credits,  
            FacultyID = @FacultyID  
        WHERE CourseID = @CourseID;  
    END    ELSE    BEGIN        INSERT INTO Courses (CourseName, CourseDescription, Credits, FacultyID)  
        VALUES (@CourseName, @CourseDescription, @Credits, @FacultyID);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetClub  
@ClubID INT = NULL,  
@ClubName NVARCHAR(100) = NULL,  
@ClubDescription NVARCHAR(MAX) = NULL  
AS  
BEGIN  
    IF @ClubID IS NOT NULL  
    BEGIN        UPDATE Clubs  
        SET ClubName = @ClubName,  
            ClubDescription = @ClubDescription  
        WHERE ClubID = @ClubID;  
    END    ELSE    BEGIN        INSERT INTO Clubs (ClubName, ClubDescription)  
        VALUES (@ClubName, @ClubDescription);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetEnrollment  
@EnrollmentID INT = NULL,  
@StudentID INT = NULL,  
@CourseID INT = NULL,  
@EnrollmentDate DATE = NULL  
AS  
BEGIN  
    IF @EnrollmentID IS NOT NULL  
    BEGIN        UPDATE Enrollments  
        SET StudentID = @StudentID,  
            CourseID = @CourseID,  
            EnrollmentDate = @EnrollmentDate  
        WHERE EnrollmentID = @EnrollmentID;  
    END    ELSE    BEGIN        INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)  
        VALUES (@StudentID, @CourseID, @EnrollmentDate);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetGrade  
@GradeID INT = NULL,  
@StudentID INT = NULL,  
@CourseID INT = NULL,  
@Grade DECIMAL(3, 2) = NULL  
AS  
BEGIN  
    IF @GradeID IS NOT NULL  
    BEGIN        UPDATE Grades  
        SET StudentID = @StudentID,  
            CourseID = @CourseID,  
            Grade = @Grade  
        WHERE GradeID = @GradeID;  
    END    ELSE    BEGIN        INSERT INTO Grades (StudentID, CourseID, Grade)  
        VALUES (@StudentID, @CourseID,  @Grade);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetDepartment  
@DepartmentID INT = NULL,  
@DepartmentName NVARCHAR(100) = NULL,  
@FacultyID INT = NULL  
AS  
BEGIN  
    IF @DepartmentID IS NOT NULL  
    BEGIN        UPDATE Departments  
        SET DepartmentName = @DepartmentName,  
            FacultyID = @FacultyID  
        WHERE DepartmentID = @DepartmentID;  
    END    ELSE    BEGIN        INSERT INTO Departments (DepartmentName, FacultyID)  
        VALUES (@DepartmentName, @FacultyID);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetCourseProfessor  
@CourseID INT = NULL,  
@ProfessorID INT = NULL  
AS  
BEGIN  
    INSERT INTO Courses_Professors (CourseID, ProfessorID)  
    VALUES (@CourseID, @ProfessorID);  
END  
GO  
  
CREATE OR ALTER PROCEDURE SetStudentClub  
@StudentID INT = NULL,  
@ClubID INT = NULL  
AS  
BEGIN  
    INSERT INTO Students_Clubs (StudentID, ClubID)  
    VALUES (@StudentID, @ClubID);  
END  
GO  
  
  
CREATE OR ALTER PROCEDURE SetEvent  
@EventID INT = NULL,  
@EventName NVARCHAR(100) = NULL,  
@EventDate DATE = NULL,  
@EventDescription NVARCHAR(MAX) = NULL  
AS  
BEGIN  
    IF @EventID IS NOT NULL  
    BEGIN        UPDATE Events  
        SET EventName = @EventName,  
            EventDate = @EventDate,  
            EventDescription = @EventDescription  
        WHERE EventID = @EventID;  
    END    ELSE    BEGIN        INSERT INTO Events (EventName, EventDate, EventDescription)  
        VALUES (@EventName, @EventDate, @EventDescription);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetLibraryBook  
@BookID INT = NULL,  
@Title NVARCHAR(100) = NULL,  
@Author NVARCHAR(100) = NULL,  
@PublicationYear INT = NULL,  
@ISBN NVARCHAR(20) = NULL,  
@AvailableCopies INT = NULL  
AS  
BEGIN  
    IF @BookID IS NOT NULL  
    BEGIN        UPDATE Library        SET Title = @Title,  
            Author = @Author,  
            PublicationYear = @PublicationYear,  
            ISBN = @ISBN,  
            AvailableCopies = @AvailableCopies  
        WHERE BookID = @BookID;  
    END    ELSE    BEGIN        INSERT INTO Library (Title, Author, PublicationYear, ISBN, AvailableCopies)  
        VALUES (@Title, @Author, @PublicationYear, @ISBN, @AvailableCopies);  
    END
END  
GO  
CREATE OR ALTER PROCEDURE SetBookLoan  
@LoanID INT = NULL,  
@BookID INT = NULL,  
@StudentID INT = NULL,  
@LoanDate DATE = NULL,  
@ReturnDate DATE = NULL  
AS  
BEGIN  
    IF @LoanID IS NOT NULL  
    BEGIN        UPDATE BookLoans  
        SET BookID = @BookID,  
            StudentID = @StudentID,  
            LoanDate = @LoanDate,  
            ReturnDate = @ReturnDate  
        WHERE LoanID = @LoanID;  
    END    ELSE    BEGIN        INSERT INTO BookLoans (BookID, StudentID, LoanDate, ReturnDate)  
        VALUES (@BookID, @StudentID, @LoanDate, @ReturnDate);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetScholarship  
@ScholarshipID INT = NULL,  
@ScholarshipName NVARCHAR(100) = NULL,  
@Amount DECIMAL(10, 2) = NULL,  
@EligibilityCriteria NVARCHAR(MAX) = NULL  
AS  
BEGIN  
    IF @ScholarshipID IS NOT NULL  
    BEGIN        UPDATE Scholarships  
        SET ScholarshipName = @ScholarshipName,  
            Amount = @Amount,  
            EligibilityCriteria = @EligibilityCriteria  
        WHERE ScholarshipID = @ScholarshipID;  
    END    ELSE    BEGIN        INSERT INTO Scholarships (ScholarshipName, Amount, EligibilityCriteria)  
        VALUES (@ScholarshipName, @Amount, @EligibilityCriteria);  
    END
END  
GO  
  
CREATE OR ALTER PROCEDURE SetStudentScholarship  
@StudentID INT = NULL,  
@ScholarshipID INT = NULL  
AS  
BEGIN  
    INSERT INTO Student_Scholarships (StudentID, ScholarshipID)  
    VALUES (@StudentID, @ScholarshipID);  
    END
GO
