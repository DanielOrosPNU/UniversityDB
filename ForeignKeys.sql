ALTER TABLE Professors    
ADD FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID);  GO    
    
ALTER TABLE Courses    
ADD FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID);  GO    
    
ALTER TABLE Enrollments    
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,    
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);  GO    
    
ALTER TABLE Grades    
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,    
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);  GO    
    
ALTER TABLE Departments    
ADD FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID);  GO    
    
ALTER TABLE Courses_Professors    
ADD FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),    
FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID) ON DELETE CASCADE;  GO    
    
ALTER TABLE Students_Clubs    
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,    
FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID);  GO    
    
ALTER TABLE BookLoans    
ADD FOREIGN KEY (BookID) REFERENCES Library(BookID),    
FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE;  GO    
    
ALTER TABLE Student_Scholarships    
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,    
FOREIGN KEY (ScholarshipID) REFERENCES Scholarships(ScholarshipID);  GO