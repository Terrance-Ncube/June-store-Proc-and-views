
-- CREATE PROCEDURE for June 1st

CREATE PROCEDURE dbo.sendMail
AS
BEGIN

-- declare variables for mail
	DECLARE @subject VARCHAR(255) = 'DAILY MAIL';
	DECLARE @body VARCHAR (Max) = 'Here is your daily mail.' + CONVERT(VARCHAR, GETDATE(), 120) ;
	DECLARE @recipients VARCHAR (255) = 'teemann95@gmail.com';

	--send mail
	EXEC [dbo].[sp_send_dbmail]
	@recipients = @recipients,
	@subject = @subject,
	@body = @body ,
	@profile_name = 'Terrance mail list'

END;
GO

--the below is the output when I run the query
--The module 'sendMail' depends on the missing object 'msdb.dbo.sp_send_mail'. The module will still be created; however, it cannot run successfully until the object exists.

