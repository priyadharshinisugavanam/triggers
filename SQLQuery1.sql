CREATE TABLE PROGRAMMER
(
id numeric(3) not null PRIMARY KEY,
Name varchar(8) not null ,
DOB date,
DOJ date,
Sex varchar(1),
Prof1 varchar(8),
Prof2 varchar(8),
Salary int not null,
)
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (1,'Somdutt', '21-Apr-98', '21-Apr-18', 'm', 'java', 'basic', 3200);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (12,'Priya', '16-Sep-98', '22-Apr-19', 'm', 'dotnet', 'cobal', 6000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (22,'Lavi', '16-Apr-99', '20-Apr-18', 'm', 'pascal', 'c++', 3500);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (2,'Mary', '21-Apr-95', '21-Sep-17', 'm', 'dotnet', 'cobal', 6000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (13,'Asihu', '31-Aug-94', '30-Apr-11', 'f', 'clipper', 'pascal', 4000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (20,'Vishnu', '28-Feb-99', '20-Jan-19', 'm', 'c', 'dotnet', 3300);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (16,'Rama', '10-Jan-92', '21-Apr-17', 'm', 'java', 'basic', 3200);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (5,'Ankitha', '02-Dec-91', '22-Apr-16', 'f', 'cobal', 'c', 3100);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (3,'malini', '01-May-93', '20-Apr-16', 'm', 'python', 'basic', 3200);
select* from PROGRAMMER;
use Assignment1


/*CREATE PROCEDURE PROCEDURES
@programmerName varchar(8),
@DOB date,
@DOJ date,
@Sex varchar(1),
@Prof1 varchar(8),
@Prof2 varchar(8),
@Salary int ,
@Action numeric(1)

as
BEGIN
	--INSERT
	 IF @Action=1
	 BEGIN
		INSERT INTO PROGRAMMER(Name, DOB, DOJ, Sex, Prof1, Prof2, Salary) VALUES (@programmerName,@DOB, @DOJ, @Sex,@Prof1, @Prof2, @Salary)
	 END

	

	 
END
Create procedure Proceduress
@Action Int
as
BEGIN
	--INSERT
	 IF @Action=2
	 BEGIN
	

	Select * from PROGRAMMER
end
end
Create procedure Procedurs
@programmerName varchar(8),
@DOB date,
@DOJ date,
@Sex varchar(1),
@Prof1 varchar(8),
@Prof2 varchar(8),
@Salary int ,
@Action numeric(1),
@ename varchar(8)
as
BEGIN
	--INSERT
	 IF @Action=4
	 BEGIN
	 UPDATE Programmer set Name=@programmerName ,DOB=@DOB ,DOJ=@DOJ,Prof1=@Prof1,Prof2=@Prof2,Salary=@Salary where Name=@ename

	 end
	 end

Create procedure Procedurss
@programmerName varchar(8),
@Action numeric(1)
as
BEGIN
	--INSERT
	 IF @Action=3
	 BEGIN
	 Delete from PROGRAMMER where name=@programmerName

	 end
	 end



Drop Procedure Procedurss*/
CREATE VIEW Id_greaterthan_5 AS
SELECT * from PROGRAMMER
WHERE id > 18;
select * from Id_greaterthan_5

SELECT * FROM EligibleList
CREATE TABLE PROGRAMMERAUDIT
(
Name Varchar(20),
AUDITDATA VARCHAR(50)
)

SELECT * FROM PROGRAMMER
SELECT * FROM PROGRAMMERAUDIT

CREATE TRIGGER TR_TABLE_FORINSERT
ON PROGRAMMER
FOR INSERT
AS
BEGIN
	DECLARE @Id NUMERIC(20)
	
	SELECT @Id=id FROM INSERTED
	INSERT INTO PROGRAMMERAUDIT VALUES('PROGRAMMER id='+CAST(@id AS VARCHAR(5)),'IS ADDED AT'+CAST(GETDATE() AS varchar(20)))
END
Insert into programmer(id,name,DOB,DOJ,Prof1,Prof2,Salary)values(37,'naveen','22-Apr-1999','22-May-1999','c#','java',50000)
drop trigger TR_TABLE_FORINSERT
select * from PROGRAMMERAUDIT
drop table PROGRAMMERAudit

CREATE TRIGGER TR_TABLE_FORDELETE
ON PROGRAMMER
FOR DELETE
AS
BEGIN
	DECLARE @Id NUMERIC(20)
	
	SELECT @Id=id FROM deleted
	INSERT INTO PROGRAMMERAUDIT VALUES('PROGRAMMER id='+CAST(@id AS VARCHAR(5)),'IS deleted AT'+CAST(GETDATE() AS varchar(20)))
END
delete from PROGRAMMER where id=37

CREATE TRIGGER TR_TABLE_FORUPDATE
ON PROGRAMMER
FOR UPDATE
AS
BEGIN
	DECLARE @Id NUMERIC(3)
    DECLARE @NAME varchar(8)
	DECLARE @ONAME varchar(8)
	DECLARE @PROF1 varchar(8)
	DECLARE @OPROF1 varchar(8)
	DECLARE @PROF2 varchar(8)
	DECLARE @OPROF2 varchar(8)
	DECLARE @SALARY NUMERIC(8)
	DECLARE @OSALARY NUMERIC(8)
	DECLARE @AUDITSTRING varchar(1000)

	
	SELECT * INTO #TEMPTABLE FROM inserted
	WHILE(EXISTS(SELECT ID FROM #TEMPTABLE))
	
	BEGIN
	SET @AUDITSTRING=''
	SELECT TOP 1 @Id=Id,@NAME=NAME,@PROF1=PROF1,@PROF2=PROF2,@SALARY=SALARY FROM #TEMPTABLE
	SELECT @ONAME=NAME,@OPROF1=PROF1,@OPROF2=PROF2,@OSALARY=SALARY FROM deleted WHERE ID=@ID
	SET @AUDITSTRING='ID'+CAST(@ID AS varchar(4))+'CHANGED'
	IF(@ONAME<>@NAME)
		SET @AUDITSTRING=@AUDITSTRING+'NAME FROM'+@ONAME+'TO'+@NAME
	
	IF(@OPROF1<>@PROF1)
		SET @AUDITSTRING=@AUDITSTRING+'PROF1 FROM'+@OPROF1+'TO'+@PROF1
	IF(@OPROF2<>@PROF2)
		SET @AUDITSTRING=@AUDITSTRING+'PROF2 FROM'+@OPROF2+'TO'+@PROF2
	IF(@OSALARY<>@SALARY)
		SET @AUDITSTRING=@AUDITSTRING+'SALARY FROM'+CAST(@OSALARY AS varchar(10))+'TO'+ CAST(@SALARY AS varchar(10))


	INSERT INTO PROGRAMMERAUDIT VALUES(@AUDITSTRING)
	DELETE FROM #TEMPTABLE WHERE Id=@ID
	END


END
drop trigger TR_TABLE_FORUPDATE
UPDATE PROGRAMMER SET NAME='NANDHU' WHERE ID=1