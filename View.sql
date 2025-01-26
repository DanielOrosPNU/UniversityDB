CREATE VIEW StudentClubsFullInfo AS (    
SELECT Students_Clubs.StudentID, Students.FirstName, Students.LastName, Clubs.ClubName, Students_Clubs.ClubID from Students    
    JOIN Students_Clubs on Students.StudentID = Students_Clubs.StudentID    
JOIN Clubs on Students_Clubs.ClubID = Clubs.ClubID  )    
GO    
    
CREATE VIEW StudentWithScholarship AS (    
SELECT Student_Scholarships.StudentID, Students.FirstName, Students.LastName, Scholarships.ScholarshipName, Scholarships.Amount from Student_Scholarships    
    JOIN Students on Students.StudentID = Student_Scholarships.StudentID    
JOIN Scholarships on Student_Scholarships.ScholarshipID = Scholarships.ScholarshipID  )    
GO    
    
CREATE VIEW ProfessorsCourseName AS (    
SELECT Professors.ProfessorID, Professors.Firstname, Professors.Lastname, Courses.CourseName, Courses.CourseID from Professors    
    JOIN Courses_Professors on Professors.ProfessorID = Courses_Professors.ProfessorID    
JOIN Courses on Courses_Professors.CourseID = Courses.CourseID  )    
GO    
    
CREATE VIEW StudentsGrade AS (    
SELECT Students.Firstname, Students.Lastname, Grades.Grade from Students    
    JOIN Grades on Students.StudentID = Grades.StudentID where Grade > 4  )    
GO    
    
CREATE VIEW NullableBookReturnDate AS (    
SELECT Students.Firstname, Students.Lastname, Library.Title, BookLoans.ReturnDate from Students    
    JOIN BookLoans on Students.StudentID = BookLoans.StudentID    
JOIN Library on BookLoans.BookID = Library.BookID where ReturnDate IS NULL  )    
GO 