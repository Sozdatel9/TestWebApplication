USE [master]
GO
/****** Object:  Database [TestWebApplication]    Script Date: 09/20/2017 16:34:44 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TestWebApplication')
BEGIN
CREATE DATABASE [TestWebApplication] ON  PRIMARY 
( NAME = N'users', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\users.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'users_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\users_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Cyrillic_General_CI_AS
END
GO
ALTER DATABASE [TestWebApplication] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestWebApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestWebApplication] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TestWebApplication] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TestWebApplication] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TestWebApplication] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TestWebApplication] SET ARITHABORT OFF
GO
ALTER DATABASE [TestWebApplication] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TestWebApplication] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TestWebApplication] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TestWebApplication] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TestWebApplication] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TestWebApplication] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TestWebApplication] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TestWebApplication] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TestWebApplication] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TestWebApplication] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TestWebApplication] SET  DISABLE_BROKER
GO
ALTER DATABASE [TestWebApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TestWebApplication] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TestWebApplication] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TestWebApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TestWebApplication] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TestWebApplication] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TestWebApplication] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TestWebApplication] SET  READ_WRITE
GO
ALTER DATABASE [TestWebApplication] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TestWebApplication] SET  MULTI_USER
GO
ALTER DATABASE [TestWebApplication] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TestWebApplication] SET DB_CHAINING OFF
GO
USE [TestWebApplication]
GO
/****** Object:  ForeignKey [FK__UsersAndT__TaskI__22751F6C]    Script Date: 09/20/2017 16:34:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UsersAndT__TaskI__22751F6C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]'))
ALTER TABLE [dbo].[UsersAndTasks] DROP CONSTRAINT [FK__UsersAndT__TaskI__22751F6C]
GO
/****** Object:  ForeignKey [FK__Log__UserId__44CA3770]    Script Date: 09/20/2017 16:34:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Log__UserId__44CA3770]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK__Log__UserId__44CA3770]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 09/20/2017 16:34:54 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Log__UserId__44CA3770]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK__Log__UserId__44CA3770]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[UsersAndTasks]    Script Date: 09/20/2017 16:34:53 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UsersAndT__TaskI__22751F6C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]'))
ALTER TABLE [dbo].[UsersAndTasks] DROP CONSTRAINT [FK__UsersAndT__TaskI__22751F6C]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]') AND type in (N'U'))
DROP TABLE [dbo].[UsersAndTasks]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 09/20/2017 16:34:53 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tasks__Added__1BC821DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [DF__Tasks__Added__1BC821DD]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Tasks__Completed__1CBC4616]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [DF__Tasks__Completed__1CBC4616]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND type in (N'U'))
DROP TABLE [dbo].[Tasks]
GO
/****** Object:  Table [dbo].[UnsuccessAuth]    Script Date: 09/20/2017 16:34:53 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Unsuccess__Total__2B0A656D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UnsuccessAuth] DROP CONSTRAINT [DF__Unsuccess__Total__2B0A656D]
END
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Unsuccess__Locke__2BFE89A6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UnsuccessAuth] DROP CONSTRAINT [DF__Unsuccess__Locke__2BFE89A6]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnsuccessAuth]') AND type in (N'U'))
DROP TABLE [dbo].[UnsuccessAuth]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/20/2017 16:34:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 09/20/2017 16:34:45 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 09/20/2017 16:34:44 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 09/20/2017 16:34:44 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Пользователи')
DROP LOGIN [BUILTIN\Пользователи]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 09/20/2017 16:34:44 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [NT SERVICE\MSSQL$SQLEXPRESS]    Script Date: 09/20/2017 16:34:44 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQL$SQLEXPRESS')
DROP LOGIN [NT SERVICE\MSSQL$SQLEXPRESS]
GO
/****** Object:  Login [WIN-J3ZQCU5V5ZC\Администратор]    Script Date: 09/20/2017 16:34:44 ******/
IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'WIN-J3ZQCU5V5ZC\Администратор')
DROP LOGIN [WIN-J3ZQCU5V5ZC\Администратор]
GO
/****** Object:  Login [WIN-J3ZQCU5V5ZC\Администратор]    Script Date: 09/20/2017 16:34:44 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'WIN-J3ZQCU5V5ZC\Администратор')
CREATE LOGIN [WIN-J3ZQCU5V5ZC\Администратор] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\MSSQL$SQLEXPRESS]    Script Date: 09/20/2017 16:34:44 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQL$SQLEXPRESS')
CREATE LOGIN [NT SERVICE\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 09/20/2017 16:34:44 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 09/20/2017 16:34:44 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Пользователи')
CREATE LOGIN [BUILTIN\Пользователи] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 09/20/2017 16:34:44 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'>¿HB§v;ÜÌá§&Õ-,.(´ç½', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 09/20/2017 16:34:45 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'1ªÖ·SÅcÂÁvå7öóæl³0V_i¢ãF', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
USE [TestWebApplication]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/20/2017 16:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Pass] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND name = N'IX_Users_1')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_1] ON [dbo].[Users] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([UserId], [Name], [Pass], [LastLoginDate]) VALUES (1, N'Alen', N'1234', CAST(0x0000A7F400EFFB8C AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Pass], [LastLoginDate]) VALUES (2, N'Stephen', N'9999', CAST(0x0000A7F300A5CFA8 AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Pass], [LastLoginDate]) VALUES (3, N'Beavis', N'z1y2x3w4', CAST(0x0000A7F40104535C AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Pass], [LastLoginDate]) VALUES (21, N'OliverTwist', N'2017', CAST(0x0000A7F301496118 AS DateTime))
INSERT [dbo].[Users] ([UserId], [Name], [Pass], [LastLoginDate]) VALUES (23, N'Альберт', N'7ZfMgaY', CAST(0x0000A7F40104C634 AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UnsuccessAuth]    Script Date: 09/20/2017 16:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnsuccessAuth]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UnsuccessAuth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastAttemptDate] [datetime] NOT NULL,
	[TotalAttempts] [int] NOT NULL CONSTRAINT [DF__Unsuccess__Total__2B0A656D]  DEFAULT ((0)),
	[Locked] [bit] NOT NULL CONSTRAINT [DF__Unsuccess__Locke__2BFE89A6]  DEFAULT ('0'),
 CONSTRAINT [PK__Unsucces__3214EC0729221CFB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 09/20/2017 16:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Content] [text] COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Added] [datetime] NOT NULL CONSTRAINT [DF__Tasks__Added__1BC821DD]  DEFAULT (getdate()),
	[DateOfComplete] [datetime] NULL,
	[Completed] [bit] NOT NULL CONSTRAINT [DF__Tasks__Completed__1CBC4616]  DEFAULT ('0'),
 CONSTRAINT [PK__Tasks__7C6949B119DFD96B] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (1, N'Сходить в магазин', N'Купить айфон', CAST(0x0000A7F000CC9FFC AS DateTime), NULL, 0)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (9, N'Положить деньги на счет', N'Сходить в Сбербанк', CAST(0x0000A7F00040BCA8 AS DateTime), NULL, 0)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (13, N'gfd', N'hgfhgfhff', CAST(0x0000A7F0010AA93C AS DateTime), NULL, 0)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (14, N'Выпить кофе с сахаром', N'Выпить кофе, поужинать, почистить зубы', CAST(0x0000A7F001611894 AS DateTime), CAST(0x0000A7F400079BA8 AS DateTime), 1)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (15, N'Купить клавиатуру для нетбука', N'Заказать на алиэкспресс клавиатуру для нетбука', CAST(0x0000A7F001709634 AS DateTime), NULL, 0)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (17, N'Купить кока колу', N'Сходить в BurgerWorld, купить колы с буррито', CAST(0x0000A7F3016AE464 AS DateTime), NULL, 0)
INSERT [dbo].[Tasks] ([TaskId], [Title], [Content], [Added], [DateOfComplete], [Completed]) VALUES (26, N'Съездить за грибами', N'Съездить за грибами в ближайшие выходные', CAST(0x0000A7F40104E704 AS DateTime), CAST(0x0000A7F40105219C AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
/****** Object:  Table [dbo].[UsersAndTasks]    Script Date: 09/20/2017 16:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsersAndTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
 CONSTRAINT [PK__UsersAnd__3214EC071F98B2C1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[UsersAndTasks] ON
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (1, 2, 1)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (5, 2, 9)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (6, 2, 13)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (7, 3, 14)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (8, 3, 15)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (10, 3, 17)
INSERT [dbo].[UsersAndTasks] ([Id], [UserId], [TaskId]) VALUES (19, 23, 26)
SET IDENTITY_INSERT [dbo].[UsersAndTasks] OFF
/****** Object:  Table [dbo].[Log]    Script Date: 09/20/2017 16:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) COLLATE Cyrillic_General_CI_AS NULL,
	[Period] [datetime] NOT NULL,
	[Actions] [varchar](200) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[OtherInfo] [varchar](200) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK__Log__5E54864842E1EEFE] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (1, 21, N'OliverTwist', CAST(0x0000A7F300CD5474 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (2, 21, N'OliverTwist', CAST(0x0000A7F300CD57F8 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (3, 21, N'OliverTwist', CAST(0x0000A7F300CD602C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (4, 21, N'OliverTwist', CAST(0x0000A7F300CD6734 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (5, 21, N'OliverTwist', CAST(0x0000A7F300CD7544 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (6, 21, N'OliverTwist', CAST(0x0000A7F300CD779C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (7, 21, N'OliverTwist', CAST(0x0000A7F300CD80FC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (8, 21, N'TomSawyer', CAST(0x0000A7F300CD9998 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (9, 21, N'TomSawyer', CAST(0x0000A7F300CD9AC4 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (10, 21, N'TomSawyer', CAST(0x0000A7F300CDA67C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (11, 3, N'Beavis', CAST(0x0000A7F300CEFDE6 AS DateTime), N'gjjkljkl', N'34tgtr')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (12, 21, N'TomSawyer', CAST(0x0000A7F300D6BDD4 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (13, 21, N'TomSawyer', CAST(0x0000A7F300D6C02C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (14, 21, N'TomSawyer', CAST(0x0000A7F300D6C98C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (15, 21, N'TomSawyer', CAST(0x0000A7F300D6D8C8 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (16, 21, N'OliverTwist', CAST(0x0000A7F300D6E228 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (17, 1, N'Alen', CAST(0x0000A7F300D776FC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (18, 1, N'Alen', CAST(0x0000A7F300D77A80 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (19, 1, N'Alen', CAST(0x0000A7F300D7B068 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (20, 1, N'Alen', CAST(0x0000A7F300D8B10C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (21, 1, N'Alen', CAST(0x0000A7F300D8FF90 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (22, 1, N'Alen', CAST(0x0000A7F300D9056C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (23, 1, N'Alen', CAST(0x0000A7F300D9218C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (24, 1, N'Alen', CAST(0x0000A7F300D9344C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (25, 1, N'Alen', CAST(0x0000A7F300D93DAC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (26, 1, N'Alen', CAST(0x0000A7F300D944B4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (27, 1, N'Alen', CAST(0x0000A7F300DA5B9C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (28, 1, N'Alen', CAST(0x0000A7F300DA5B9C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (29, 1, N'Alen', CAST(0x0000A7F300DA6178 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (30, 1, N'Alen', CAST(0x0000A7F300DA64FC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (31, 1, N'Alen', CAST(0x0000A7F300DAA570 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (32, 1, N'Alen', CAST(0x0000A7F300DAAB4C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (33, 1, N'Alen', CAST(0x0000A7F300DAAFFC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (34, 1, N'Alen', CAST(0x0000A7F300DAB380 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (35, 1, N'Alen', CAST(0x0000A7F300DB9A5C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (36, 1, N'Alen', CAST(0x0000A7F300DBA3BC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (37, 1, N'Alen', CAST(0x0000A7F300DBAF74 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (38, 1, N'Alen', CAST(0x0000A7F300DBBB2C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (39, 1, N'Alen', CAST(0x0000A7F300DBC5B8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (40, 3, N'Beavis', CAST(0x0000A7F300E0F1F0 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (41, 3, N'Beavis', CAST(0x0000A7F300E0F574 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (42, 3, N'Beavis', CAST(0x0000A7F300E10000 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (43, 3, N'Beavis', CAST(0x0000A7F300E10834 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (44, 3, N'Beavis', CAST(0x0000A7F300E11194 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (45, 3, N'Beavis', CAST(0x0000A7F300E11E78 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (46, 3, N'Beavis', CAST(0x0000A7F300E6760C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (47, 3, N'Beavis', CAST(0x0000A7F300E68674 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (48, 3, N'Beavis', CAST(0x0000A7F300E695B0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (49, 3, N'Beavis', CAST(0x0000A7F300E69A60 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (50, 3, N'Beavis', CAST(0x0000A7F300E69DE4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (51, 3, N'Beavis', CAST(0x0000A7F300E6AF78 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (52, 3, N'Beavis', CAST(0x0000A7F300E6BC5C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (53, 3, N'Beavis', CAST(0x0000A7F300E791A4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (54, 3, N'Beavis', CAST(0x0000A7F300EEAA0C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (55, 3, N'Beavis', CAST(0x0000A7F300EEAB38 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (56, 3, N'Beavis', CAST(0x0000A7F300EEB498 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (57, 3, N'Beavis', CAST(0x0000A7F300EEC17C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (58, 3, N'Beavis', CAST(0x0000A7F300EED1E4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (59, 3, N'Beavis', CAST(0x0000A7F300F2E4DC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (60, 3, N'Beavis', CAST(0x0000A7F300F31BF0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (61, 3, N'Beavis', CAST(0x0000A7F3011CCC34 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (62, 3, N'Beavis', CAST(0x0000A7F3011CCE8C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (63, 3, N'Beavis', CAST(0x0000A7F3011DEED4 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (64, 3, N'Beavis', CAST(0x0000A7F3011DF12C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (65, 3, N'Beavis', CAST(0x0000A7F3011EB288 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (66, 3, N'Beavis', CAST(0x0000A7F3011EB3B4 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (67, 3, N'Beavis', CAST(0x0000A7F30143D84C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (68, 3, N'Beavis', CAST(0x0000A7F30143D84C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (69, 3, N'Beavis', CAST(0x0000A7F30143DCFC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (70, 3, N'Beavis', CAST(0x0000A7F30143E1AC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (71, 3, N'Beavis', CAST(0x0000A7F30143E404 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (72, 3, N'Beavis', CAST(0x0000A7F30143E788 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (73, 3, N'Beavis', CAST(0x0000A7F301445934 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (74, 3, N'Beavis', CAST(0x0000A7F30144C75C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (75, 3, N'Beavis', CAST(0x0000A7F30144CF90 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (76, 3, N'Beavis', CAST(0x0000A7F30144DDA0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (77, 3, N'Beavis', CAST(0x0000A7F30144F3E4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (78, 3, N'Beavis', CAST(0x0000A7F30145EB28 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (79, 3, N'Beavis', CAST(0x0000A7F30146223C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (80, 3, N'Beavis', CAST(0x0000A7F301465CD4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (81, 3, N'Beavis', CAST(0x0000A7F3014752EC AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (82, 3, N'Beavis', CAST(0x0000A7F3014766D8 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (83, 3, N'Beavis', CAST(0x0000A7F3014796E4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (84, 3, N'Beavis', CAST(0x0000A7F30147A29C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (85, 3, N'Beavis', CAST(0x0000A7F30147D884 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (86, 3, N'Beavis', CAST(0x0000A7F30147E7C0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (87, 3, N'Beavis', CAST(0x0000A7F301480AE8 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (88, 21, N'OliverTwist', CAST(0x0000A7F301496118 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (89, 21, N'OliverTwist', CAST(0x0000A7F301496370 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (90, 21, N'OliverTwist', CAST(0x0000A7F301496BA4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (91, 21, N'OliverTwist', CAST(0x0000A7F301497054 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (92, 21, N'OliverTwist', CAST(0x0000A7F3014973D8 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (93, 3, N'Beavis', CAST(0x0000A7F3016AAFA8 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (94, 3, N'Beavis', CAST(0x0000A7F3016AB32C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (95, 3, N'Beavis', CAST(0x0000A7F3016AC010 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (96, 3, N'Beavis', CAST(0x0000A7F3016ACE20 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (97, 3, N'Beavis', CAST(0x0000A7F3016AE464 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (98, 3, N'Beavis', CAST(0x0000A7F3016AE590 AS DateTime), N'Добавление новой задачи', N'Название: Купить буррито,описание: Сходить в Бургер ворлд, купить колы с буррито')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (99, 3, N'Beavis', CAST(0x0000A7F3016AE914 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (100, 3, N'Beavis', CAST(0x0000A7F3016AF4CC AS DateTime), N'Просмотр списка задач', N'')
GO
print 'Processed 100 total records'
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (101, 3, N'Beavis', CAST(0x0000A7F3016AF97C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (102, 3, N'Beavis', CAST(0x0000A7F3016B0408 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (103, 1, N'Alen', CAST(0x0000A7F400021660 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (104, 1, N'Alen', CAST(0x0000A7F40002178C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (105, 1, N'Alen', CAST(0x0000A7F400023280 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (106, 3, N'Beavis', CAST(0x0000A7F400023F64 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (107, 3, N'Beavis', CAST(0x0000A7F400023F64 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (108, 3, N'Beavis', CAST(0x0000A7F4000242E8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (109, 3, N'Beavis', CAST(0x0000A7F4000248C4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (110, 3, N'Beavis', CAST(0x0000A7F400024EA0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (111, 3, N'Beavis', CAST(0x0000A7F4000256D4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (112, 3, N'Beavis', CAST(0x0000A7F400025A58 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (113, 3, N'Beavis', CAST(0x0000A7F400025DDC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (114, 3, N'Beavis', CAST(0x0000A7F400026D18 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (115, 3, N'Beavis', CAST(0x0000A7F40002FE68 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (116, 3, N'Beavis', CAST(0x0000A7F4000300C0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (117, 3, N'Beavis', CAST(0x0000A7F400030570 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (118, 3, N'Beavis', CAST(0x0000A7F400030B4C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (119, 3, N'Beavis', CAST(0x0000A7F400031A88 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (120, 3, N'Beavis', CAST(0x0000A7F400032064 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (121, 3, N'Beavis', CAST(0x0000A7F4000337D4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (122, 3, N'Beavis', CAST(0x0000A7F40003726C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (123, 3, N'Beavis', CAST(0x0000A7F40003E418 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (124, 3, N'Beavis', CAST(0x0000A7F40003E544 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (125, 3, N'Beavis', CAST(0x0000A7F40003E9F4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (126, 3, N'Beavis', CAST(0x0000A7F40003EC4C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (127, 3, N'Beavis', CAST(0x0000A7F4000588CC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (128, 3, N'Beavis', CAST(0x0000A7F4000589F8 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (129, 3, N'Beavis', CAST(0x0000A7F400058EA8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (130, 3, N'Beavis', CAST(0x0000A7F40005922C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (131, 3, N'Beavis', CAST(0x0000A7F400059CB8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (132, 3, N'Beavis', CAST(0x0000A7F40005A294 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (133, 3, N'Beavis', CAST(0x0000A7F40005A870 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (134, 3, N'Beavis', CAST(0x0000A7F40005AE4C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (135, 3, N'Beavis', CAST(0x0000A7F40005B554 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (136, 3, N'Beavis', CAST(0x0000A7F40005BB30 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (137, 3, N'Beavis', CAST(0x0000A7F40005C238 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (138, 3, N'Beavis', CAST(0x0000A7F40005C814 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (139, 3, N'Beavis', CAST(0x0000A7F40005EA10 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (140, 3, N'Beavis', CAST(0x0000A7F4000639C0 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (141, 3, N'Beavis', CAST(0x0000A7F4000639C0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (142, 3, N'Beavis', CAST(0x0000A7F400063D44 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (143, 3, N'Beavis', CAST(0x0000A7F400064320 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (144, 3, N'Beavis', CAST(0x0000A7F40006A6BC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (145, 3, N'Beavis', CAST(0x0000A7F40006A914 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (146, 3, N'Beavis', CAST(0x0000A7F400077AD8 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (147, 3, N'Beavis', CAST(0x0000A7F400077D30 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (148, 3, N'Beavis', CAST(0x0000A7F4000796F8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (149, 3, N'Beavis', CAST(0x0000A7F400079A7C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (150, 3, N'Beavis', CAST(0x0000A7F400079BA8 AS DateTime), N'Отметка о выполнении задачи', N'Название: Выпить кофе,описание: Выпить кофе, поужинать, почистить зубы')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (151, 3, N'Beavis', CAST(0x0000A7F40007A058 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (152, 1, N'Alen', CAST(0x0000A7F400D2D890 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (153, 1, N'Alen', CAST(0x0000A7F400D2D9BC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (154, 1, N'Alen', CAST(0x0000A7F400D2DD40 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (155, 1, N'Alen', CAST(0x0000A7F400D2E1F0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (156, 1, N'Alen', CAST(0x0000A7F400D2EB50 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (157, 1, N'Alen', CAST(0x0000A7F400D2EB50 AS DateTime), N'Добавление новой задачи', N'Название: Пикабууууу,описание: опваолдпваолдпа')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (158, 1, N'Alen', CAST(0x0000A7F400D2EDA8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (159, 1, N'Alen', CAST(0x0000A7F400D2F4B0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (160, 1, N'Alen', CAST(0x0000A7F400D2FBB8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (161, 1, N'Alen', CAST(0x0000A7F400D30068 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (162, 3, N'Beavis', CAST(0x0000A7F400D95D50 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (163, 3, N'Beavis', CAST(0x0000A7F400D95E7C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (164, 3, N'Beavis', CAST(0x0000A7F400D96200 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (165, 3, N'Beavis', CAST(0x0000A7F400D96DB8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (166, 3, N'Beavis', CAST(0x0000A7F400D97A9C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (167, 3, N'Beavis', CAST(0x0000A7F400DA0D18 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (168, 3, N'Beavis', CAST(0x0000A7F400DA26E0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (169, 3, N'Beavis', CAST(0x0000A7F400DA33C4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (170, 3, N'Beavis', CAST(0x0000A7F400DA9E68 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (171, 3, N'Beavis', CAST(0x0000A7F400DAA444 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (172, 3, N'Beavis', CAST(0x0000A7F400DAAC78 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (173, 3, N'Beavis', CAST(0x0000A7F400DAB704 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (174, 3, N'Beavis', CAST(0x0000A7F400DABCE0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (175, 3, N'Beavis', CAST(0x0000A7F400DABE0C AS DateTime), N'Добавление новой задачи', N'Название: gdfgfdg,описание: gfgdfgdfg')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (176, 3, N'Beavis', CAST(0x0000A7F400DAC2BC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (177, 3, N'Beavis', CAST(0x0000A7F400DAC76C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (178, 3, N'Beavis', CAST(0x0000A7F400DADDB0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (179, 3, N'Beavis', CAST(0x0000A7F400DAE83C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (180, 3, N'Beavis', CAST(0x0000A7F400DAEF44 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (181, 3, N'Beavis', CAST(0x0000A7F400DAF070 AS DateTime), N'Отметка о выполнении задачи', N'Название: Купить клавиатуру для нетбука,описание: Заказать на алиэкспресс клавиатуру для нетбука')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (182, 3, N'Beavis', CAST(0x0000A7F400DAF2C8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (183, 3, N'Beavis', CAST(0x0000A7F400DAF3F4 AS DateTime), N'Снятие отметки о выполнении задачи', N'Название: Купить клавиатуру для нетбука,описание: Заказать на алиэкспресс клавиатуру для нетбука')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (184, 1, N'Alen', CAST(0x0000A7F400DB879C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (185, 1, N'Alen', CAST(0x0000A7F400DB89F4 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (186, 1, N'Alen', CAST(0x0000A7F400DB8EA4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (187, 1, N'Alen', CAST(0x0000A7F400DB9354 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (188, 1, N'Alen', CAST(0x0000A7F400DB9A5C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (189, 1, N'Alen', CAST(0x0000A7F400DB9B88 AS DateTime), N'Добавление новой задачи', N'Название: hgfdhdfhgfh,описание: ddfhdfhfh')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (190, 1, N'Alen', CAST(0x0000A7F400DB9F0C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (191, 1, N'Alen', CAST(0x0000A7F400DBA290 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (192, 1, N'Alen', CAST(0x0000A7F400DCF8C0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (193, 1, N'Alen', CAST(0x0000A7F400DD05A4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (194, 1, N'Alen', CAST(0x0000A7F400DD0F04 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (195, 1, N'Alen', CAST(0x0000A7F400DD1030 AS DateTime), N'Добавление новой задачи', N'Название: hhhhhhhhhhhhhh,описание: gh5666456456')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (196, 1, N'Alen', CAST(0x0000A7F400DD13B4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (197, 1, N'Alen', CAST(0x0000A7F400DD1864 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (198, 1, N'Alen', CAST(0x0000A7F400DE5BD4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (199, 1, N'Alen', CAST(0x0000A7F400DE7CA4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (200, 1, N'Alen', CAST(0x0000A7F400DE8604 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (201, 1, N'Alen', CAST(0x0000A7F400DEFC60 AS DateTime), N'Просмотр списка задач', N'')
GO
print 'Processed 200 total records'
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (202, 1, N'Alen', CAST(0x0000A7F400DF06EC AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (203, 1, N'Alen', CAST(0x0000A7F400DF0B9C AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (204, 1, N'Alen', CAST(0x0000A7F400DF0DF4 AS DateTime), N'Добавление новой задачи', N'Название: fhdfh,описание: hhhhhhhgfhgfh')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (205, 1, N'Alen', CAST(0x0000A7F400DF1C04 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (206, 1, N'Alen', CAST(0x0000A7F400DF1E5C AS DateTime), N'Добавление новой задачи', N'Название: 0890897897978h,k,описание: ttttrrrrrrrghgbgfgf5345345')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (207, 1, N'Alen', CAST(0x0000A7F400DF20B4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (208, 1, N'Alen', CAST(0x0000A7F400DF2A14 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (209, 1, N'Alen', CAST(0x0000A7F400E05AC4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (210, 1, N'Alen', CAST(0x0000A7F400E06C58 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (211, 1, N'Alen', CAST(0x0000A7F400E10384 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (212, 1, N'Alen', CAST(0x0000A7F400E11770 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (213, 1, N'Alen', CAST(0x0000A7F400E12454 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (214, 1, N'Alen', CAST(0x0000A7F400E12B5C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (215, 1, N'Alen', CAST(0x0000A7F400E12EE0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (216, 1, N'Alen', CAST(0x0000A7F400E13390 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (217, 1, N'Alen', CAST(0x0000A7F400E134BC AS DateTime), N'Добавление новой задачи', N'Название: ggdf,описание: g456456')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (218, 1, N'Alen', CAST(0x0000A7F400E13BC4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (219, 1, N'Alen', CAST(0x0000A7F400E14074 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (220, 1, N'Alen', CAST(0x0000A7F400E16BD0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (221, 3, N'Beavis', CAST(0x0000A7F400E17FBC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (222, 3, N'Beavis', CAST(0x0000A7F400E18214 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (223, 3, N'Beavis', CAST(0x0000A7F400E186C4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (224, 3, N'Beavis', CAST(0x0000A7F400E1AB18 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (225, 3, N'Beavis', CAST(0x0000A7F400E1AB18 AS DateTime), N'Снятие отметки о выполнении задачи', N'Название: Купить буррито,описание: Сходить в BurgerWorld, купить колы с буррито')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (226, 3, N'Beavis', CAST(0x0000A7F400E3D8E8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (227, 3, N'Beavis', CAST(0x0000A7F400E3DEC4 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (228, 3, N'Beavis', CAST(0x0000A7F400E3E824 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (229, 3, N'Beavis', CAST(0x0000A7F400E3E824 AS DateTime), N'Добавление новой задачи', N'Название: Пикабууууу,описание: aaaaaaпвапавпвап')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (230, 3, N'Beavis', CAST(0x0000A7F400E3EBA8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (231, 3, N'Beavis', CAST(0x0000A7F400E3F184 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (232, 3, N'Beavis', CAST(0x0000A7F400E3F2B0 AS DateTime), N'Удалениезадачи', N'Название: Пикабууууу')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (233, 1, N'Alen', CAST(0x0000A7F400EFFB8C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (234, 1, N'Alen', CAST(0x0000A7F400EFFDE4 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (235, 1, N'Alen', CAST(0x0000A7F400F003C0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (236, 3, N'Beavis', CAST(0x0000A7F400F012FC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (237, 3, N'Beavis', CAST(0x0000A7F400F01554 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (238, 3, N'Beavis', CAST(0x0000A7F400F01C5C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (239, 3, N'Beavis', CAST(0x0000A7F400F02238 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (240, 3, N'Beavis', CAST(0x0000A7F400F06888 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (241, 3, N'Beavis', CAST(0x0000A7F400F06C0C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (242, 3, N'Beavis', CAST(0x0000A7F400F06F90 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (243, 3, N'Beavis', CAST(0x0000A7F400F0D7DC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (244, 3, N'Beavis', CAST(0x0000A7F400F10914 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (245, 3, N'Beavis', CAST(0x0000A7F400F113A0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (246, 3, N'Beavis', CAST(0x0000A7F400F3F840 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (247, 3, N'Beavis', CAST(0x0000A7F400F3FF48 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (248, 3, N'Beavis', CAST(0x0000A7F400F409D4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (249, 3, N'Beavis', CAST(0x0000A7F400F447F0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (250, 3, N'Beavis', CAST(0x0000A7F400F4491C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (251, 3, N'Beavis', CAST(0x0000A7F400F44B74 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (252, 3, N'Beavis', CAST(0x0000A7F400F44B74 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (253, 3, N'Beavis', CAST(0x0000A7F400F454D4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (254, 3, N'Beavis', CAST(0x0000A7F400F45D08 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (255, 3, N'Beavis', CAST(0x0000A7F400F469EC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (256, 3, N'Beavis', CAST(0x0000A7F400F5337C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (257, 3, N'Beavis', CAST(0x0000A7F400F53CDC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (258, 3, N'Beavis', CAST(0x0000A7F400F54894 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (259, 3, N'Beavis', CAST(0x0000A7F400F64938 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (260, 3, N'Beavis', CAST(0x0000A7F400F6516C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (261, 3, N'Beavis', CAST(0x0000A7F400F65F7C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (262, 3, N'Beavis', CAST(0x0000A7F400F74E8C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (263, 3, N'Beavis', CAST(0x0000A7F400F75B70 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (264, 3, N'Beavis', CAST(0x0000A7F400F76020 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (265, 3, N'Beavis', CAST(0x0000A7F400F76980 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (266, 3, N'Beavis', CAST(0x0000A7F400F883EC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (267, 3, N'Beavis', CAST(0x0000A7F400F8A714 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (268, 3, N'Beavis', CAST(0x0000A7F400F8ACF0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (269, 3, N'Beavis', CAST(0x0000A7F400F96BF4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (270, 3, N'Beavis', CAST(0x0000A7F400F970A4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (271, 3, N'Beavis', CAST(0x0000A7F400F97D88 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (272, 3, N'Beavis', CAST(0x0000A7F400F97EB4 AS DateTime), N'Изменение задачиНазвание: Купить буррито, описание: Сходить в BurgerWorld, купить колы с бурритоДата добавления  19.09.2017 22:01:15', N'Новые данные: Название: Купить кока колу, описание: Сходить в BurgerWorld, купить колы с бурритоДата добавления  19.09.2017 22:01:15')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (273, 3, N'Beavis', CAST(0x0000A7F400F9C9B4 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (274, 3, N'Beavis', CAST(0x0000A7F400F9D8F0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (275, 3, N'Beavis', CAST(0x0000A7F400F9DFF8 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (276, 3, N'Beavis', CAST(0x0000A7F400FABFCC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (277, 3, N'Beavis', CAST(0x0000A7F400FAD28C AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (278, 3, N'Beavis', CAST(0x0000A7F400FADBEC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (279, 3, N'Beavis', CAST(0x0000A7F400FB63DC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (280, 3, N'Beavis', CAST(0x0000A7F400FB6634 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (281, 3, N'Beavis', CAST(0x0000A7F400FB6AE4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (282, 3, N'Beavis', CAST(0x0000A7F400FB71EC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (283, 3, N'Beavis', CAST(0x0000A7F400FBDC90 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (284, 3, N'Beavis', CAST(0x0000A7F400FC0468 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (285, 3, N'Beavis', CAST(0x0000A7F400FC13A4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (286, 3, N'Beavis', CAST(0x0000A7F400FC5544 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (287, 3, N'Beavis', CAST(0x0000A7F400FC58C8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (288, 3, N'Beavis', CAST(0x0000A7F400FC66D8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (289, 3, N'Beavis', CAST(0x0000A7F400FD24B0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (290, 3, N'Beavis', CAST(0x0000A7F400FD2834 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (291, 3, N'Beavis', CAST(0x0000A7F400FD2E10 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (292, 3, N'Beavis', CAST(0x0000A7F400FD2E10 AS DateTime), N'Изменение данных пользователяСтарое имя пользователя: BeavisДата последнего входа 20.09.2017 14:34:05', N'Новое имя пользователя: Butthead')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (293, 3, N'Butthead', CAST(0x0000A7F400FD32C0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (294, 3, N'Butthead', CAST(0x0000A7F400FD3770 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (295, 3, N'Butthead', CAST(0x0000A7F400FD3770 AS DateTime), N'Изменение данных пользователяСтарое имя пользователя: ButtheadДата последнего входа 20.09.2017 14:34:05', N'Новое имя пользователя: Beavis')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (296, 3, N'Beavis', CAST(0x0000A7F400FD5714 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (297, 3, N'Beavis', CAST(0x0000A7F400FD62CC AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (298, 3, N'Beavis', CAST(0x0000A7F400FD62CC AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (299, 3, N'Beavis', CAST(0x0000A7F400FD6650 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (300, 3, N'Beavis', CAST(0x0000A7F400FD6B00 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (301, 3, N'Beavis', CAST(0x0000A7F400FD6B00 AS DateTime), N'Изменение данных пользователяСтарое имя пользователя: BeavisДата последнего входа 20.09.2017 15:22:33', N'Новое имя пользователя: Butthead')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (302, 3, N'Butthead', CAST(0x0000A7F400FD6E84 AS DateTime), N'Просмотр списка задач', N'')
GO
print 'Processed 300 total records'
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (303, 3, N'Butthead', CAST(0x0000A7F400FD7208 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (304, 3, N'Butthead', CAST(0x0000A7F400FD76B8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (305, 3, N'Butthead', CAST(0x0000A7F400FD7B68 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (306, 3, N'Butthead', CAST(0x0000A7F400FD84C8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (307, 3, N'Butthead', CAST(0x0000A7F400FD884C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (308, 3, N'Butthead', CAST(0x0000A7F400FD98B4 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (309, 3, N'Butthead', CAST(0x0000A7F400FD99E0 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (310, 3, N'Butthead', CAST(0x0000A7F400FD9E90 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (311, 3, N'Butthead', CAST(0x0000A7F400FDA340 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (312, 3, N'Butthead', CAST(0x0000A7F400FDA340 AS DateTime), N'Изменение данных пользователяСтарое имя пользователя: ButtheadДата последнего входа 20.09.2017 15:23:19', N'Новое имя пользователя: Beavis')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (313, 3, N'Beavis', CAST(0x0000A7F400FDCFC8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (314, 3, N'Beavis', CAST(0x0000A7F400FDD34C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (315, 3, N'Beavis', CAST(0x0000A7F400FDDB80 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (316, 3, N'Beavis', CAST(0x0000A7F400FDE3B4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (317, 3, N'Beavis', CAST(0x0000A7F400FDFC50 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (318, 3, N'Beavis', CAST(0x0000A7F400FDFEA8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (319, 3, N'Beavis', CAST(0x0000A7F400FE6A78 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (320, 3, N'Beavis', CAST(0x0000A7F400FEA060 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (321, 3, N'Beavis', CAST(0x0000A7F400FEA3E4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (322, 3, N'Beavis', CAST(0x0000A7F400FEAD44 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (323, 3, N'Beavis', CAST(0x0000A7F400FEAE70 AS DateTime), N'Изменение задачи. Название: Выпить кофе, описание: Выпить кофе, поужинать, почистить зубыДата добавления  16.09.2017 21:25:35', N'Новые данные. Название: Выпить кофе с сахаром, описание: Выпить кофе, поужинать, почистить зубы')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (324, 3, N'Beavis', CAST(0x0000A7F40104535C AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (325, 3, N'Beavis', CAST(0x0000A7F401045488 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (326, 3, N'Beavis', CAST(0x0000A7F401045B90 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (327, 23, N'Альберт', CAST(0x0000A7F40104C634 AS DateTime), N'Успешная авторизация пользователя', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (328, 23, N'Альберт', CAST(0x0000A7F40104C760 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (329, 23, N'Альберт', CAST(0x0000A7F40104CC10 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (330, 23, N'Альберт', CAST(0x0000A7F40104CE68 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (331, 23, N'Альберт', CAST(0x0000A7F40104E704 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (332, 23, N'Альберт', CAST(0x0000A7F40104E704 AS DateTime), N'Добавление новой задачи', N'Название: Съездить за грибами,описание: Съездить за грибами в ближайшие выходные')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (333, 23, N'Альберт', CAST(0x0000A7F40104EA88 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (334, 23, N'Альберт', CAST(0x0000A7F40104F2BC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (335, 23, N'Альберт', CAST(0x0000A7F40104F3E8 AS DateTime), N'Отметка о выполнении задачи', N'Название: Съездить за грибами, описание: Съездить за грибами в ближайшие выходные')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (336, 23, N'Альберт', CAST(0x0000A7F40104FFA0 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (337, 23, N'Альберт', CAST(0x0000A7F401051134 AS DateTime), N'Добавление новой задачи', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (338, 23, N'Альберт', CAST(0x0000A7F401051134 AS DateTime), N'Добавление новой задачи', N'Название: Купить пирог,описание: купить пирог')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (339, 23, N'Альберт', CAST(0x0000A7F4010514B8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (340, 23, N'Альберт', CAST(0x0000A7F401051BC0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (341, 23, N'Альберт', CAST(0x0000A7F401051E18 AS DateTime), N'Снятие отметки о выполнении задачи', N'Название: Купить пирог,описание: купить пирог')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (342, 23, N'Альберт', CAST(0x0000A7F401052070 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (343, 23, N'Альберт', CAST(0x0000A7F4010522C8 AS DateTime), N'Отметка о выполнении задачи', N'Название: Съездить за грибами, описание: Съездить за грибами в ближайшие выходные')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (344, 23, N'Альберт', CAST(0x0000A7F401052520 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (345, 23, N'Альберт', CAST(0x0000A7F40105264C AS DateTime), N'Отметка о выполнении задачи', N'Название: Купить пирог, описание: купить пирог')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (346, 23, N'Альберт', CAST(0x0000A7F401053204 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (347, 23, N'Альберт', CAST(0x0000A7F40105426C AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (348, 23, N'Альберт', CAST(0x0000A7F401054398 AS DateTime), N'Изменение задачи. Название: Купить пирог, описание: купить пирог. Дата добавления  20.09.2017 15:50:31', N'Новые данные. Название: Купить пирог, описание: Купить пирог с чаем')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (349, 23, N'Альберт', CAST(0x0000A7F401054848 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (350, 23, N'Альберт', CAST(0x0000A7F401069AF4 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (351, 23, N'Альберт', CAST(0x0000A7F40106B138 AS DateTime), N'Административная панель - главная страница', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (352, 23, N'Альберт', CAST(0x0000A7F40106B390 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (353, 23, N'Альберт', CAST(0x0000A7F40106B714 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (354, 23, N'Альберт', CAST(0x0000A7F40106C1A0 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (355, 23, N'Альберт', CAST(0x0000A7F40106C1A0 AS DateTime), N'Изменение задачи. Название: Купить пирог, описание: Купить пирог с чаем. Дата добавления  20.09.2017 15:50:31', N'Новые данные. Название: Купить пирог, описание: Купить пирог с кофе')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (356, 23, N'Альберт', CAST(0x0000A7F40106C524 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (357, 23, N'Альберт', CAST(0x0000A7F40107C118 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (358, 23, N'Альберт', CAST(0x0000A7F40107C5C8 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (359, 23, N'Альберт', CAST(0x0000A7F40107C820 AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (360, 23, N'Альберт', CAST(0x0000A7F40107C820 AS DateTime), N'Удаление задачи', N'Название: Купить пирог, описание: Купить пирог с кофеДата добавления  20.09.2017 15:50:31Дата выполнения 20.09.2017 15:50:48')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (361, 23, N'Альберт', CAST(0x0000A7F40107CDFC AS DateTime), N'Просмотр списка задач', N'')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (362, 23, N'Альберт', CAST(0x0000A7F40107CDFC AS DateTime), N'Удаление задачи', N'Название: Купить пирог, описание: Купить пирог с кофеДата добавления  20.09.2017 15:50:31Дата выполнения 20.09.2017 15:50:48')
INSERT [dbo].[Log] ([LogId], [UserId], [UserName], [Period], [Actions], [OtherInfo]) VALUES (363, 23, N'Альберт', CAST(0x0000A7F40107D2AC AS DateTime), N'Просмотр списка задач', N'')
SET IDENTITY_INSERT [dbo].[Log] OFF
/****** Object:  ForeignKey [FK__UsersAndT__TaskI__22751F6C]    Script Date: 09/20/2017 16:34:53 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UsersAndT__TaskI__22751F6C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]'))
ALTER TABLE [dbo].[UsersAndTasks]  WITH CHECK ADD  CONSTRAINT [FK__UsersAndT__TaskI__22751F6C] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([TaskId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__UsersAndT__TaskI__22751F6C]') AND parent_object_id = OBJECT_ID(N'[dbo].[UsersAndTasks]'))
ALTER TABLE [dbo].[UsersAndTasks] CHECK CONSTRAINT [FK__UsersAndT__TaskI__22751F6C]
GO
/****** Object:  ForeignKey [FK__Log__UserId__44CA3770]    Script Date: 09/20/2017 16:34:54 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Log__UserId__44CA3770]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK__Log__UserId__44CA3770] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Log__UserId__44CA3770]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK__Log__UserId__44CA3770]
GO
