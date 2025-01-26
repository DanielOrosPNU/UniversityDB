CREATE OR ALTER PROCEDURE EnrollStudents
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DateOfBirth DATETIME,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15),
    @Course INT = NULL
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Students WHERE Email = @Email)
        BEGIN
            PRINT N'Студент з таким email вже існує.';
            RETURN;
        END

        INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, Phone)
        VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @Phone);

        DECLARE @StudentID INT;
        SET @StudentID = SCOPE_IDENTITY();

        IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseID = @Course)
        BEGIN
            PRINT N'Курс з таким ID не існує.';
            RETURN;
        END

        INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
        VALUES (@StudentID, @Course, GETDATE());

        PRINT N'Студент успішно зарахований на курс.';
    END TRY
    BEGIN CATCH
        PRINT N'Сталася помилка при зарахуванні студента.';
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE HireProfessor
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15),
    @HireDate DATETIME,
    @FacultyID INT,
    @CourseID INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Professors WHERE Email = @Email)
        BEGIN
            PRINT N'Викладач з таким email вже існує.';
            RETURN;
        END
        IF NOT EXISTS (SELECT 1 FROM Faculties WHERE FacultyID = @FacultyID)
            BEGIN
                PRINT N'Такого факультету не існує.';
                RETURN;
            END
        INSERT INTO Professors (FirstName, LastName, Email, Phone, HireDate, FacultyID)
        VALUES (@FirstName, @LastName, @Email, @Phone, @HireDate, @FacultyID);

        DECLARE @ProfessorID INT;
        SET @ProfessorID = SCOPE_IDENTITY();

        IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseID = @CourseID)
        BEGIN
            PRINT N'Курс з таким ID не існує.';
            RETURN;
        END

        INSERT INTO Courses_Professors (CourseID, ProfessorID)
        VALUES (@CourseID, @ProfessorID);

        PRINT N'Викладач успішно доданий.';
    END TRY
    BEGIN CATCH
        PRINT N'Сталася помилка при додаванні викладача.';
    END CATCH
END
GO

CREATE OR ALTER PROCEDURE ManageGrades
    @GradeID INT = NULL,
    @StudentID INT,
    @CourseID INT,
    @Grade DECIMAL(3, 2) = NULL
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Students WHERE StudentID = @StudentID)
        BEGIN
            PRINT N'Студент з таким ID не існує.';
            RETURN;
        END;

        IF NOT EXISTS (SELECT 1 FROM Courses WHERE CourseID = @CourseID)
        BEGIN
            PRINT N'Курс з таким ID не існує.';
            RETURN;
        END;

        IF NOT EXISTS (SELECT 1 FROM Grades WHERE GradeID = @GradeID)
            BEGIN
            PRINT N'Оцінка під таким ID не існує'
            RETURN;
        END;

        IF @Grade IS NOT NULL
        BEGIN
            EXEC SetGrade @GradeID, @StudentID, @CourseID, @Grade;
        END;

        IF @Grade IS NULL AND @GradeID IS NOT NULL
        BEGIN
            DELETE FROM Grades
            WHERE GradeID = @GradeID;
        END;

        PRINT N'Оцінка успішно оновлена/видалена.';
    END TRY
    BEGIN CATCH
        PRINT N'Сталася помилка при керуванні оцінками.';
    END CATCH
END;
GO

