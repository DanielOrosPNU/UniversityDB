ALTER TABLE dbo.Students ADD  
ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN  
    CONSTRAINT DF_Students_ValidFrom DEFAULT SYSUTCDATETIME(),  
ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN  
    CONSTRAINT DF_Students_ValidTo DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),  
PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo);  
GO  
  
ALTER TABLE dbo.Students  
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Students_History))  
GO  
  
ALTER TABLE dbo.Professors ADD  
ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN  
    CONSTRAINT DF_Professors_ValidFrom DEFAULT SYSUTCDATETIME(),  
ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN  
    CONSTRAINT DF_Professors_ValidTo DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),  
PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo);  
GO  
ALTER TABLE dbo.Professors  
    SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Professors_History))  
GO