CREATE DATABASE [ADV_Project]
GO
USE [ADV_Project]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop table [CustomerDetail]
CREATE TABLE [dbo].[CustomerDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](50) NULL,
	[Address] [text] NULL,
	[DOB] [nvarchar](50) NULL,
	[Gender] [nchar](10) NULL,
	[Married] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[StartDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
	[Income] [float] NULL
) 

CREATE TABLE [dbo].[Users](	
	[Name] [nvarchar](50) NOT NULL primary key,
	[Password] [nvarchar](50) NULL
) 
