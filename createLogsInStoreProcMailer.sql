--Create a view of a stored procedure

--Email stored proc will be used.
-- logs need to be stored in a table to allow for the view to be created.
USE [AdventureWorks2019]
GO



CREATE PROCEDURE dbo.sendMail
AS
BEGIN

-- declare variables for mail
	DECLARE @subject VARCHAR(255) = 'DAILY MAIL';
	DECLARE @body VARCHAR (Max) = 'Here is your daily mail.' + CONVERT(VARCHAR, GETDATE(), 120) ; -- possible solution to the syntax error 
	DECLARE @recipients VARCHAR (255) = 'teemann95@gmail.com';

	--send mail
	EXEC MSDB.[dbo].[sp_send_dbmail]
	@recipients = @recipients,
	@subject = @subject,
	@body = @body ,
	@profile_name = 'Terrance mail list'

	--Logs to be stored in a table
	INSERT INTO[dbo].[EmailLog] (Recipients, Subject, Body)
	VALUES(@recipients, @subject, @body);

END;
GO

