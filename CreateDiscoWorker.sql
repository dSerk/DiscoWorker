BEGIN TRY 
	drop database DW
	PRINT 'DW has been dropped.'
END TRY
BEGIN CATCH
	PRINT 'DW doesn''t exist'
END CATCH
go

BEGIN TRY
	create database DW
	PRINT 'DW has been created'
END TRY
BEGIN CATCH 
	PRINT 'Could not create DW'
END CATCH
go

use DW
go

-- create all the tables

-- Processing Data Center personnel
-- we might just want to leave this without any relation to other tables and use it simply to populate controls
create table Personnel (
	id int primary key identity(1,1),
	name nvarchar(max),
	emailaddress nvarchar(max)
	)

create table Clients (
	id int primary key identity(1,1),
	name nvarchar(max)
	)

create table Projects (
	id int primary key identity(1,1), 
	clientId int foreign key references Clients(id),
	billingcode varchar(max)
	)

create table Jobs (
	id int primary key identity(1,1), 
	projectid int foreign key references Projects(id),
	jobnumber varchar(max)
	)

create table Media (
	id int primary key identity(1,1), 
	jobid int foreign key references Jobs(id), 
	trackingnum varchar(max),
	serialnum varchar(max),
	dateReceived datetime   
	)

create table Cases(
	id int primary key identity(1,1),
	name varchar(max),
	path varchar(max)
	)

create table Reports (
	id int primary key identity(1,1),
	name varchar(max)
	)

GO

SELECT * FROM Sys.Tables T JOIN sys.databases D on T.on