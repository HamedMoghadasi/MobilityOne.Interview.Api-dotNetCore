USE [master]
GO
/****** Object:  Database [mo_api]    Script Date: 3/17/2021 3:23:39 PM ******/
CREATE DATABASE [mo_api]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mo_api', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mo_api.mdf' , SIZE = 8192KB , MAXSIZE = 256000KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mo_api_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mo_api_log.ldf' , SIZE = 8192KB , MAXSIZE = 51200KB , FILEGROWTH = 43008KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mo_api] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mo_api].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mo_api] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mo_api] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mo_api] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mo_api] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mo_api] SET ARITHABORT OFF 
GO
ALTER DATABASE [mo_api] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mo_api] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mo_api] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mo_api] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mo_api] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mo_api] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mo_api] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mo_api] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mo_api] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mo_api] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mo_api] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mo_api] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mo_api] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mo_api] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mo_api] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mo_api] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mo_api] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mo_api] SET RECOVERY FULL 
GO
ALTER DATABASE [mo_api] SET  MULTI_USER 
GO
ALTER DATABASE [mo_api] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mo_api] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mo_api] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mo_api] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mo_api] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mo_api', N'ON'
GO
ALTER DATABASE [mo_api] SET QUERY_STORE = OFF
GO
USE [mo_api]
GO
/****** Object:  Table [__EFMigrationsHistory]    Script Date: 3/17/2021 3:23:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users]    Script Date: 3/17/2021 3:23:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NULL,
	[PhoneNumber] [nvarchar](16) NULL,
	[EmailAddress] [nvarchar](38) NULL,
	[Password] [nvarchar](42) NULL,
	[LastLogin] [datetimeoffset](7) NOT NULL,
	[CreateDate] [datetimeoffset](7) NOT NULL,
	[Suspended] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210312123329_AddUser', N'5.0.4')
GO
SET IDENTITY_INSERT [Users] ON 

INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (1, N'Hamed', N'+989197558632', N'hamed@gmail.com', N'123456', CAST(N'2021-03-17T10:25:28.9568308+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:25:28.9570007+00:00' AS DateTimeOffset), 0)
INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (2, N'Nader', N'+989127548695', N'Nade@outlook.com', N'45874555', CAST(N'2021-03-17T10:27:17.7076667+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:27:17.7077025+00:00' AS DateTimeOffset), 0)
INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (3, N'Majid', N'+98915478569', N'Majid@gmail.com', N'745896', CAST(N'2021-03-17T10:27:48.8096069+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:27:48.8102064+00:00' AS DateTimeOffset), 0)
INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (4, N'John Doe', N'+989126547859', N'John@live.com', N'147852', CAST(N'2021-03-17T10:28:25.4340677+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:28:25.4340926+00:00' AS DateTimeOffset), 1)
INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (5, N'Hamed Moghadasi', N'+989197558632', N'Hamed@hotmail.com', N'456852', CAST(N'2021-03-17T10:28:55.8095171+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:28:55.8095490+00:00' AS DateTimeOffset), 0)
INSERT [Users] ([Id], [Name], [PhoneNumber], [EmailAddress], [Password], [LastLogin], [CreateDate], [Suspended]) VALUES (6, N'Shahrzad', N'+989127111458', N'Shahrzad@yahoo.com', N'123845', CAST(N'2021-03-17T10:26:49.4610148+00:00' AS DateTimeOffset), CAST(N'2021-03-17T10:26:49.4610421+00:00' AS DateTimeOffset), 1)
SET IDENTITY_INSERT [Users] OFF
GO
USE [master]
GO
ALTER DATABASE [mo_api] SET  READ_WRITE 
GO
