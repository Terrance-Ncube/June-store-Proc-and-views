USE [AdventureWorks2019]
GO
	-- Create the EmailLog table
CREATE TABLE dbo.EmailLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    SentDateTime DATETIME DEFAULT GETDATE(),
    Subject NVARCHAR(255),
    Body NVARCHAR(MAX),
    Recipients NVARCHAR(255),
    Status NVARCHAR(50)
);