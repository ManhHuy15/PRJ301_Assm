USE [master]
GO
/****** Object:  Database [Project_Prj]    Script Date: 19-Mar-24 4:42:02 PM ******/
CREATE DATABASE [Project_Prj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_Prj', FILENAME = N'D:\Microsoft SQL 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Project_Prj.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_Prj_log', FILENAME = N'D:\Microsoft SQL 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Project_Prj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project_Prj] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_Prj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_Prj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_Prj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_Prj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_Prj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_Prj] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_Prj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_Prj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_Prj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_Prj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_Prj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_Prj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_Prj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_Prj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_Prj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_Prj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_Prj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_Prj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_Prj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_Prj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_Prj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_Prj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_Prj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_Prj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_Prj] SET  MULTI_USER 
GO
ALTER DATABASE [Project_Prj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_Prj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_Prj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_Prj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_Prj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_Prj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project_Prj] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_Prj] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_Prj]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[accid] [int] NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[accid] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment ]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [decimal](4, 2) NULL,
	[weight] [decimal](3, 2) NULL,
	[required] [int] NULL,
	[sid] [int] NOT NULL,
	[insid] [int] NOT NULL,
	[gradeid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[dateTime] [datetime] NULL,
 CONSTRAINT [PK_GradeCourses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseGrade]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGrade](
	[cid] [int] NOT NULL,
	[gradeid] [int] NOT NULL,
	[weight] [decimal](4, 3) NULL,
	[required] [int] NULL,
 CONSTRAINT [PK_CourseGrade] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[gradeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [int] NOT NULL,
	[code] [nchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[did] [int] NOT NULL,
	[detailid] [int] NULL,
 CONSTRAINT [PK_Coursese] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailCourse]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailCourse](
	[id] [int] NOT NULL,
	[noCredit] [int] NULL,
	[timeStudy] [nvarchar](100) NULL,
	[preRequisite] [varchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[studentTask] [nvarchar](500) NULL,
	[tools] [nvarchar](100) NULL,
 CONSTRAINT [PK_DetailCourse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailGrade]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailGrade](
	[id] [int] NOT NULL,
	[duration] [nvarchar](50) NULL,
	[questionType] [nvarchar](100) NULL,
	[noQuestion] [int] NULL,
	[gradingGuide] [nvarchar](250) NULL,
	[describe] [nvarchar](250) NULL,
 CONSTRAINT [PK_DetailGrade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[url] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [nchar](20) NOT NULL,
	[cateid] [int] NULL,
	[did] [int] NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeCategories]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeCategories](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[priority] [int] NULL,
 CONSTRAINT [PK_GradeCategories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[cid] [int] NOT NULL,
	[insid] [int] NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HasGroup]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HasGroup](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_HasGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[id] [int] NOT NULL,
	[code] [nchar](20) NULL,
	[first_name] [nchar](10) NULL,
	[mid_name] [nchar](10) NULL,
	[last_name] [nchar](10) NOT NULL,
	[isGender] [bit] NULL,
	[email] [varchar](50) NOT NULL,
	[image_src] [varchar](50) NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IsAttend]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsAttend](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[status] [int] NULL,
	[stuid] [int] NOT NULL,
	[sesid] [int] NOT NULL,
	[recordTime] [datetime] NULL,
	[comment] [nvarchar](50) NULL,
 CONSTRAINT [PK_IsAttend] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleId] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[id] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[insid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[dateTime] [date] NULL,
	[attend] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] NOT NULL,
	[code] [nchar](10) NOT NULL,
	[first_name] [nchar](10) NULL,
	[mid_name] [nchar](15) NULL,
	[last_name] [nchar](10) NOT NULL,
	[isGender] [bit] NULL,
	[email] [varchar](50) NOT NULL,
	[image_src] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermDepart]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermDepart](
	[tid] [int] NOT NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_TermDepart] PRIMARY KEY CLUSTERED 
(
	[tid] ASC,
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[id] [int] NOT NULL,
	[name] [nchar](20) NOT NULL,
	[start] [date] NULL,
	[end] [date] NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 19-Mar-24 4:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[id] [int] NOT NULL,
	[start] [nchar](10) NOT NULL,
	[end] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account_Role] ([accid], [roleid]) VALUES (1, 2)
INSERT [dbo].[Account_Role] ([accid], [roleid]) VALUES (2, 1)
INSERT [dbo].[Account_Role] ([accid], [roleid]) VALUES (3, 1)
GO
INSERT [dbo].[Accounts] ([id], [username], [password], [user_id]) VALUES (1, N'huynmhe173566', N'12345', 1)
INSERT [dbo].[Accounts] ([id], [username], [password], [user_id]) VALUES (2, N'sonnt5', N'12345', 1)
INSERT [dbo].[Accounts] ([id], [username], [password], [user_id]) VALUES (3, N'longdq   ', N'12345', 3)
GO
SET IDENTITY_INSERT [dbo].[Assessment ] ON 

INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (1, CAST(9.00 AS Decimal(4, 2)), CAST(0.10 AS Decimal(3, 2)), 0, 1, 5, 5, 1, CAST(N'2024-01-10T09:02:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (2, CAST(8.00 AS Decimal(4, 2)), CAST(0.10 AS Decimal(3, 2)), 0, 1, 5, 6, 1, CAST(N'2024-02-29T12:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (3, CAST(8.00 AS Decimal(4, 2)), CAST(0.10 AS Decimal(3, 2)), 0, 1, 5, 7, 1, CAST(N'2024-02-01T07:48:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (4, CAST(8.00 AS Decimal(4, 2)), CAST(0.10 AS Decimal(3, 2)), 0, 1, 5, 8, 1, CAST(N'2024-02-15T09:48:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (5, CAST(8.50 AS Decimal(4, 2)), CAST(0.30 AS Decimal(3, 2)), 0, 1, 5, 9, 1, CAST(N'2024-02-29T12:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (6, CAST(7.00 AS Decimal(4, 2)), CAST(0.30 AS Decimal(3, 2)), 4, 1, 5, 10, 1, CAST(N'2024-03-01T12:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (7, CAST(10.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 12, 16, CAST(N'2024-01-15T09:34:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (8, CAST(9.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 18, 16, CAST(N'2024-02-15T11:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (9, CAST(9.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 2, 1, 12, 16, CAST(N'2024-03-05T17:32:53.713' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (10, CAST(7.30 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 3, 1, 12, 16, CAST(N'2024-03-05T17:32:53.720' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (11, CAST(6.50 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 4, 1, 12, 16, CAST(N'2024-03-05T17:32:53.720' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (12, CAST(6.50 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 5, 1, 12, 16, CAST(N'2024-03-05T17:32:53.720' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (13, CAST(7.80 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 7, 1, 12, 16, CAST(N'2024-03-05T17:32:53.723' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (14, CAST(8.65 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 9, 1, 12, 16, CAST(N'2024-03-05T17:32:53.723' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (15, CAST(6.54 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 10, 1, 12, 16, CAST(N'2024-03-05T17:32:53.723' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (16, CAST(8.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 13, 16, CAST(N'2024-03-06T08:55:35.897' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (17, CAST(7.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 2, 1, 13, 16, CAST(N'2024-03-06T08:56:16.500' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (18, CAST(0.00 AS Decimal(4, 2)), CAST(0.02 AS Decimal(3, 2)), 0, 1, 1, 18, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (19, CAST(10.00 AS Decimal(4, 2)), CAST(0.02 AS Decimal(3, 2)), 0, 1, 1, 19, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (20, CAST(9.00 AS Decimal(4, 2)), CAST(0.02 AS Decimal(3, 2)), 0, 1, 1, 20, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (21, CAST(8.00 AS Decimal(4, 2)), CAST(0.02 AS Decimal(3, 2)), 0, 1, 1, 21, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (22, CAST(10.00 AS Decimal(4, 2)), CAST(0.02 AS Decimal(3, 2)), 0, 1, 1, 22, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (23, CAST(9.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 12, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (24, CAST(10.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 13, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (25, CAST(8.00 AS Decimal(4, 2)), CAST(0.10 AS Decimal(3, 2)), 0, 1, 1, 17, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (26, CAST(9.00 AS Decimal(4, 2)), CAST(0.40 AS Decimal(3, 2)), 0, 1, 1, 23, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (27, CAST(9.00 AS Decimal(4, 2)), CAST(0.30 AS Decimal(3, 2)), 4, 1, 1, 10, 12, CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Assessment ] ([id], [score], [weight], [required], [sid], [insid], [gradeid], [cid], [dateTime]) VALUES (28, CAST(8.00 AS Decimal(4, 2)), CAST(0.05 AS Decimal(3, 2)), 0, 1, 1, 19, 16, CAST(N'2024-03-19T16:18:05.530' AS DateTime))
SET IDENTITY_INSERT [dbo].[Assessment ] OFF
GO
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 5, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 6, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 7, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 8, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 9, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (1, 10, CAST(0.300 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 11, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 14, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 15, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (2, 16, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 11, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 14, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 15, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (3, 16, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 11, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 14, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 15, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (4, 16, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (7, 1, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (7, 2, CAST(0.200 AS Decimal(4, 3)), 5)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (7, 3, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (7, 4, CAST(0.500 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (8, 1, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (8, 2, CAST(0.200 AS Decimal(4, 3)), 5)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (8, 3, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (8, 4, CAST(0.500 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (9, 1, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (9, 2, CAST(0.200 AS Decimal(4, 3)), 5)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (9, 3, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (9, 4, CAST(0.500 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 10, CAST(0.300 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 12, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 13, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 17, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 18, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 19, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 20, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 21, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 22, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (12, 23, CAST(0.400 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 10, CAST(0.300 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 23, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 24, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (13, 25, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 10, CAST(0.300 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 12, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 13, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 17, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 23, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 26, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 27, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 28, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 29, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (14, 30, CAST(0.020 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 10, CAST(0.200 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 12, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 13, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 17, CAST(0.400 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 18, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 19, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (16, 23, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 10, CAST(0.300 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 12, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 13, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 17, CAST(0.200 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 23, CAST(0.300 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 26, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 27, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 28, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 29, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 30, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (17, 31, CAST(0.017 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 7, CAST(0.075 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 8, CAST(0.075 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 10, CAST(0.400 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 24, CAST(0.150 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 25, CAST(0.150 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 32, CAST(0.075 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (18, 33, CAST(0.075 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 10, CAST(0.400 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 24, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 25, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 34, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (19, 35, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 10, CAST(0.350 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 24, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 25, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 34, CAST(0.100 AS Decimal(4, 3)), 0)
GO
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (21, 36, CAST(0.150 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 10, CAST(0.400 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 13, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 24, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 25, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 34, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (22, 35, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 10, CAST(0.400 AS Decimal(4, 3)), 4)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 12, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 23, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 26, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 27, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 34, CAST(0.100 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 37, CAST(0.050 AS Decimal(4, 3)), 0)
INSERT [dbo].[CourseGrade] ([cid], [gradeid], [weight], [required]) VALUES (23, 38, CAST(0.050 AS Decimal(4, 3)), 0)
GO
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (1, N'IOT102    ', N'Internet of Things', 6, 2)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (2, N'JPD113    ', N'Elementary Japanese1', 2, 3)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (3, N'JPD123    ', N'Elementary Japanese2', 2, 3)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (4, N'JPD133    ', N'Elementary Japanese3', 2, 3)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (7, N'LUK1      ', N'LUK Global 1', 7, 1)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (8, N'LUK2      ', N'LUK Global 2', 7, 1)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (9, N'LUK3      ', N'LUK Global 3 ', 7, 1)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (12, N'PRF192    ', N'Programming Fundamentals', 4, 5)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (13, N'CSD201    ', N'Data Structures and Algotithms', 4, 6)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (14, N'DBI202    ', N'Introduction to Databases', 4, 7)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (16, N'PRJ301    ', N'Java Web Application Development', 4, 8)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (17, N'PRO192    ', N'Object-Oriented Programming', 4, 9)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (18, N'CEA201    ', N'Computer Organization and Architecture', 6, 10)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (19, N'MAE101    ', N'Mathematics for Engineering', 1, 11)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (21, N'MAS291    ', N'Statistics and Probabilty', 1, 12)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (22, N'MAD101    ', N'Discrete Mathematics ', 1, 13)
INSERT [dbo].[Courses] ([id], [code], [name], [did], [detailid]) VALUES (23, N'CSI104    ', N'Introduction to Computer Science', 5, 14)
GO
INSERT [dbo].[Departments] ([id], [name]) VALUES (1, N'Mathematics         ')
INSERT [dbo].[Departments] ([id], [name]) VALUES (2, N'Japanese            ')
INSERT [dbo].[Departments] ([id], [name]) VALUES (3, N'Computing Science   ')
INSERT [dbo].[Departments] ([id], [name]) VALUES (4, N'Computing Fundamental')
INSERT [dbo].[Departments] ([id], [name]) VALUES (5, N'Software Engineering')
INSERT [dbo].[Departments] ([id], [name]) VALUES (6, N'Information Technology Specialization')
INSERT [dbo].[Departments] ([id], [name]) VALUES (7, N'Little UK')
GO
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (1, 0, N'35 sessions', N'None', N'Tiếng Anh chuẩn bị', N'1.Tham gia tối thiểu 80% buổi học-2.Kết quả bài check 2 đạt trên 50%-3.Không có đầu điểm nào 0%', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (2, 3, N'Study hour (150h)', N'Familiarity with C programming', N'This is a 3-credit course. This course has two parts online and offline.
The content includes basic concepts and applications of IoT, practical exercises on the learning KIT.
Students are taught how to learn online, and practice some parts at home. Q & A sessions, the Guidance for important issues, as well as performance assessments, will be conducted in the classroom.', N'	- Students must attend at least 80% of contact sessions in order to be accepted to the final examination.
- Student is responsible to learn all VIDEOs (theory) online given by instructor on Syllabus at home.
- Student is responsible to do all LABs given by instructor on Syllabus at home', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (3, 3, N'45h trên lớp (60 sessions) + 1 giờ thi cuối kỳ + 104 giờ tự học', N'None', N'Môn học cung cấp kiến thức, kỹ năng cơ bản của tiếng Nhật ở trình độ sơ cấp 1 (tương đương với trình độ A1)', N'- Tham dự tối thiểu 80% số giờ học trên lớp
- Trên lớp tích cực tham gia trao đổi, xây dựng bài.', N'Sử dụng Giáo trình chính và GT bổ trợ bằng tiếng Nhật.
- Sử dụng ppt cho bài giảng của giảng viên.')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (4, 6, N'90h trên lớp (120 sessions) + 2 giờ thi cuối kỳ + 208 giờ tự học', N'Passed JPD226 or OJT202', N'Môn học này gồm 5 bài, từ bài 1 đến bài 5. Mỗi bài đều hướng đến trau dồi cho sinh viên đạt được kỹ năng “ Trình bày vấn đề của bản thân, suy nghĩ của bản thân” và “ Năng lực tiếng Nhật ở mức độ có thể trao đổi và giao tiếp với người khác” thông qua các kỹ năng Nghe- Nói, Ngũ Pháp, Đọc-Viết ', N'- Tham dự tối thiểu 80% số giờ học trên lớp
- Trên lớp tích cực tham gia trao đổi, xây dựng bài.', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (5, 3, N'45h contact hours + 1h final exam + 104h self-study', N'None', N'Understand basics of information theory, computer system and methods of software development, focus on function-oriented programming design, coding, testing and discipline in programming. -Explain basic concepts of programming, function-oriented programming design, modularity, understand and coding programs using C
Upon completing the course', N'- Students must attend more than 80% of contact sessions in order to be accepted to the final examination.
- Student is responsible to do all assigned exercises given by instructor in class or at home and submit on time
- Use laptop in class only for learning purpose', N'- C language utility (ex.DevC++ 4.9.9.2)')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (6, 3, N'45h contact hours + 1h TE + 85'' PE + 102.6h self-study', N'PRO192', N'- the connection between data structures and their algorithms, including an analysis of algorithms'' complexity; 
- data structurre in the context of object-oriented program design;
- how data structure are implemented in an OO programming language such as Java- organize and manipulate basic structures: array, linked list, tree, heap, hash
- use algorithms for traversing, sorting, searching on studying structures', N'- Students must attend more than 80% of contact sessions in order to be accepted to the final examination.
- Student is responsible to do all exercises given by instructor in class or at home and submit on time', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (7, 3, N'45h contact hours + 1h final exam + 85'' practical exam + 104h self-study', N'None', N'The content of this course includes aspects of database management basic concepts, database design, database languages, and database-system implementation. Basing on these contents, the course emphasizes on how to organize, maintain and retrieve efficiently data and information from a DBMS.n from a DBMS.', N'- Students must attend more than 80% of contact slots in order to be accepted to the final examination.
- Student is responsible to do all exercises given by instructor in class or at home and submit on time', N'Microsoft SQL Server')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (8, 3, N'45h contact hours + 1h final exam + 104h self-study', N'DBI202, PRO192', N'• Understand the core technologies of Java web programming:
- Servlet and JSP
- Scope of sharing state (session, application, request,page)
- JSP Tags, JSTL, Customtags
- Filtering
• Know how to develop and deploy your own websites using Java
• Understand and be able to apply MVC architecture for the web', N'- Attend more than 80% of contact hours in order to be accepted to the final examination
- Actively participate in class activities
- Fulfil tasks given by intructor after class
- Use their own laptop in class only for learning purpose
- Read the textbook in advance', N' Tomcat 11 or higher,Netbeans 17 or higher Java EE: 1.6 or higher,
MS SQL Server 2019 or higher')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (9, 3, N'45h contact hours + 1h final exam + 85'' practical exam + 104h self-study', N'PRF192', N'-This subject introduces the student to object-oriented programming. The student learns to build reusable objects, encapsulate data and logic within a class, inherit one class from another and implement polymorphism.
- Compose technical documentation of a Java program using internal comments
- Adhere to object-oriented programming principles including encapsulation, polymorphism and inheritance when writing program code', N'- Students must attend at least 80% of contact slots in order to be accepted to the final examination.
- Student is responsible to do all exercises given by instructor in class or at home and submit on time.
- Use laptop in class only for learning purpose', N'Netbean 17 or higher')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (10, 3, N'45h contact hours + 1h final exam + 104h self-study', NULL, N'The main contents include the organization of a simple stored-program computer: CPU, busses and memory; Instruction sets, machine code, and assembly language; Conventions for assembly language generated by compilers; Floating-point number representation; Hardware organization of simple processors; Address translation and virtual memory; Very introductory examples of input/output devices, interrupt handling and multi-tasking systems.', N'- Understand the structure and function of computers generally and a distinction between computer organization and computer architecture.
- Understand computer organization: roles of processors, main memory, and interface between the computer and peripherals
- Understand computer architecture: instruction set, the number of bits used to represent various data types, I/O mechanism and techniques for addressing memory', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (11, 3, N'45h contact hours + 1h final exam + 104h self-study', NULL, N'• The basic concepts of single variable calculus: limit, derivative, integral.
• Concepts of linear system of equations, matrix and their applications
• The concepts of vector spaces, basis and dimension, linear transformations and their applications.
• The range of application of calculus and algebra in science, technology, economics & finance...', N'Students must attend more than 80% of contact hours in order to be accepted
to the final examination.', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (12, 3, N'45h contact hours + 1h final exam + 104h self-study', N'MAE101 ', N'• The fundamental principles of probability and their applications
• The frequently used probability distributions.
• The basics of descriptive statistics
• The inferences of statistics: parameter estimations, hypothesis testing, regressions & correlations.', N'Students must attend more than 80% of contact hours in order to be
accepted to the final examination.', N'Computerized tools (for example Excel and DDXL add-ons) (CT)')
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (13, 3, N'45h contact hours + 1h final exam + 104h self-study', NULL, N'Concepts of logical expressions & predicate logic.-The method of induction and recursive definition.-Concepts of algorithms, recursive algorithms, the complexity.-Set structure and map, counting principles and combinatorics concepts.- The applications of graphs, trees and weighted graphs in information technology.', N'Students must attend more than 80% of contact hours in order to be accepted to the final examination.', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (14, 3, N'45h contact hours + 1h final exam + 104h self-study', NULL, N'	This course provides an overview of computer Fundamentals. Topics cover all areas of computer science in breadth such as computer organization, network, operating system, data structure , file structure, social and ethical issues.', N'Students must attend more than 80% of contact sessions in order to be accepted to the final examination.
- Students are responsible to do all exercises, assignments and labs given by instructor in class or at home and submit on time
- Use laptop in class only for learning purpose', NULL)
INSERT [dbo].[DetailCourse] ([id], [noCredit], [timeStudy], [preRequisite], [description], [studentTask], [tools]) VALUES (15, 3, N' 45h contact hours + 105h self-study', N'PRO192', N'This course focuses on basic problems related to Java programming skills. Students are required to implement all assignments by him/her self in lab rooms.
Each assignment must be completed continuosly in the defined time.', N'- Students must attend at least 80% of contact slots in order to be accepted to the final results.
- Students are responsible to conform to Lab Room Regulations
- Use desktop computers only in lab room for learning purposes', N'NetBean 8.0.2, JAVA DOC')
GO
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (1, NULL, N'Listening, Discussion, Reading and Writing', NULL, NULL, NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (2, NULL, N'Listening and Reading', NULL, NULL, NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (3, NULL, N'Discussion and pronunciation', NULL, NULL, NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (4, N'From start to finish in schedule', N'Private', NULL, N'by instructor', N'Students ask good questions, hard work, self study online.')
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (5, N'Group or Follow lecturer''s proposal', N'Follow lecturer''s proposal', NULL, N'by instructor', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (6, N'Follow lecturer''s proposal', N'Follow lecturer''s proposal', NULL, N'by instructor', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (7, N'60''', N'Multiple choice', 50, N'supervised by proctor(s) sent by exam board', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (8, N'30''', N'Follow lecturer''s proposal', 30, N'by instructor', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (9, N'50''', N'Multiple-choice', 40, N'EOS', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (10, N'15''', N'Multiple choice: listen and choose the correct answer', 10, NULL, NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (11, N'at home', N' Follow lecturer''s proposal', NULL, N'guided by instructor,', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (12, N'85''', N'Preferable to be marked by scripts', NULL, N'supervised by proctor(s) sent by exam board', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (13, N'90''', NULL, NULL, N'in class, by teacher', NULL)
INSERT [dbo].[DetailGrade] ([id], [duration], [questionType], [noQuestion], [gradingGuide], [describe]) VALUES (14, N'Follow lecturer''s proposal', N'Follow lecturer''s proposal', NULL, N'each group selects one topic to present at slot 6 & slot 17 of syllabus; then prepares to present at slot 15 & slot 22', NULL)
GO
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (1, N'Home Instructor', N'/HomeInstructor')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (2, N'Schedule Instructor', N'/ScheduleInstructor')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (3, N'Grade', N'/Grade')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (4, N'Check Attend', N'/CheckAttend')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (5, N'View All Group', N'/AllGroup')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (6, N'Home Student', N'/HomeStudent')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (7, N'Mark Report Student', N'/MarkReportStudent')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (8, N'Schedule', N'/Schedule')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (9, N'GroupInfo', N'/GroupInfo')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (10, N'CourseAttend', N'/CourseAttend')
GO
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (1, N'Check 1', N'on-going            ', 1, 1)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (2, N'Check 2', N'final               ', 2, 1)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (3, N'Online Learning', N'on-going            ', 3, 2)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (4, N'Projects & Observation', N'on-going            ', 4, 3)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (5, N'Active learning', N'on-going            ', 5, 4)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (6, N'Presentation', N'on-going            ', 6, 5)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (7, N'Exercises 1', N'on-going            ', 7, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (8, N'Exercises 2 ', N'on-going            ', 7, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (9, N'Project', N'on-going            ', 8, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (10, N'Final exam', N'final exam          ', 9, 7)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (11, N'Participation', N'on-going            ', 10, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (12, N'Progress test 1 ', N'on-going            ', 11, 8)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (13, N'Progress test 2', N'on-going            ', 11, 8)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (14, N'Mid-term test', N'on-going            ', 12, 9)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (15, N'FE: Listening', N'final exam          ', 9, 10)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (16, N'FE: GVR', N'final exam          ', 9, 9)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (17, N'Assignment', N'on-going            ', 13, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (18, N'Workshop 1', N'on-going            ', 14, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (19, N'Workshop 2', N'on-going            ', 14, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (20, N'Workshop 3', N'on-going            ', 14, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (21, N'Workshop 4', N'on-going            ', 14, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (22, N'Workshop 5', N'on-going            ', 14, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (23, N'Practical Exam ', N'Practical exam      ', 15, 12)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (24, N'Assignment 1', N'on-going            ', 13, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (25, N'Assignment 2', N'on-going            ', 13, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (26, N'Lab 1', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (27, N'Lab 2', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (28, N'Lab 3', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (29, N'Lab 4', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (30, N'Lab 5', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (31, N'Lab 6', N'on-going            ', 16, 13)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (32, N'Exercises 3', N'on-going            ', 7, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (33, N'Exercises 4', N'on-going            ', 7, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (34, N'Progress test 3', N'on-going            ', 11, 8)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (35, N'Assignment 3', N'on-going            ', 13, 6)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (36, N'Computer Project', N'on-going            ', 17, 11)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (37, N'Group presentation 1', N'on-going            ', 18, 14)
INSERT [dbo].[Grade] ([id], [name], [type], [cateid], [did]) VALUES (38, N'Group presentation 2', N'on-going            ', 18, 14)
GO
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (1, N'Check 1   ', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (2, N'Check 2   ', 3)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (3, N'Online Learning', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (4, N'Projects & Observation', 2)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (5, N'Active learning', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (6, N'Presentation', 1)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (7, N'Exercise', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (8, N'Project', 2)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (9, N'Final exam', 4)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (10, N'Participation', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (11, N'Progress test', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (12, N'Mid-term test', 2)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (13, N'Assignment', 1)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (14, N'Workshop', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (15, N'Practical Exam', 3)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (16, N'Lab', NULL)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (17, N'Computer Project', 2)
INSERT [dbo].[GradeCategories] ([id], [name], [priority]) VALUES (18, N'Group presentation', 1)
GO
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (1, N'SE1809    ', 16, 1, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (2, N'SE1899    ', 21, 3, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (3, N'SE1836    ', 18, 1, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (4, N'SE1809    ', 1, 5, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (5, N'IA1723    ', 18, 5, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (6, N'IA1723    ', 23, 8, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (7, N'IA1709    ', 2, 9, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (8, N'IA1776    ', 12, 6, 4)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (9, N'SE1809    ', 14, 5, 3)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (10, N'SE1809    ', 22, 3, 3)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (11, N'SE1850    ', 12, 1, 2)
INSERT [dbo].[Groups] ([id], [name], [cid], [insid], [tid]) VALUES (12, N'SE1820    ', 23, 1, 1)
GO
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (5, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (7, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (9, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (10, 1)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (6, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (7, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (8, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (9, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (11, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (12, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (14, 2)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (2, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (3, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (4, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (5, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (6, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (7, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (8, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (9, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (10, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (11, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (12, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (13, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (19, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (21, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (24, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (26, 3)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (2, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (3, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (4, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (5, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (6, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (8, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (9, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (10, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (11, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (12, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (13, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (14, 4)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (6, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (8, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (11, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (12, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (13, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (14, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (15, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (16, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (17, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (18, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (19, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (20, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (21, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (22, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (23, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (24, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (25, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (26, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (27, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (28, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (29, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (30, 5)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (10, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (13, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (15, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (16, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (17, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (18, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (19, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (20, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (21, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (22, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (23, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (24, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (25, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (26, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (27, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (28, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (29, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (30, 6)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (14, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (15, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (16, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (17, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (18, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (20, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (22, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (23, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (25, 7)
GO
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (27, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (28, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (29, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (30, 7)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (15, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (16, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (17, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (18, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (19, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (20, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (21, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (22, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (23, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (24, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (25, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (26, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (27, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (29, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (30, 8)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 9)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 10)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 11)
INSERT [dbo].[HasGroup] ([sid], [gid]) VALUES (1, 12)
GO
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (1, N'Sonnt5              ', N'Ngô       ', N'Tùng      ', N'Sơn       ', 1, N'Sonnt5@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (2, N'HoaPT8              ', N'Phùng     ', N'Thị       ', N'Hoa       ', 0, N'HoaPT8@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (3, N'LongDQ              ', N'Đặng      ', N'Quang     ', N'Long      ', 1, N'LongDQ@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (4, N'OanhNT11            ', N'Nguyễn    ', N'Thị       ', N'Oanh      ', 0, N'OanhNT11@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (5, N'DucDM39             ', N'Đỗ        ', N'Minh      ', N'Đức       ', 1, N'DucDM39@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (6, N'ThuyBT26            ', N'Bùi       ', N'Thị       ', N'Thùy      ', 0, N'ThuyBT26@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (7, N'NhatNA3             ', N'Nguyễn    ', N'Anh       ', N'Nhật      ', 1, N'NhatNA3@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (8, N'DuyNQ30             ', N'Nguyễn    ', N'Quang     ', N'Duy       ', 1, N'DuyNQ30@fe.edu.vn', NULL)
INSERT [dbo].[Instructors] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (9, N'LongNV78            ', N'Nguyễn    ', N'Văn       ', N'Long      ', 1, N'LongNV78@fe.edu.vn', NULL)
GO
SET IDENTITY_INSERT [dbo].[IsAttend] ON 

INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (1, 2, 1, 1, CAST(N'2024-03-09T10:37:05.530' AS DateTime), N'v')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (2, 2, 1, 2, CAST(N'2024-01-02T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (3, 2, 1, 3, CAST(N'2024-01-03T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (4, 2, 1, 4, CAST(N'2024-01-03T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (5, 2, 1, 5, CAST(N'2024-03-19T16:17:34.187' AS DateTime), N'v')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (6, 1, 1, 6, CAST(N'2024-01-04T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (341, 1, 1, 9, CAST(N'2024-03-09T10:28:02.200' AS DateTime), N'v')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (342, 2, 2, 9, CAST(N'2024-03-09T10:28:02.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (343, 2, 3, 9, CAST(N'2024-03-09T10:28:02.207' AS DateTime), N'v')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (344, 2, 4, 9, CAST(N'2024-03-09T10:28:02.207' AS DateTime), N'v')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (345, 2, 5, 9, CAST(N'2024-03-09T10:28:02.207' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (346, 2, 7, 9, CAST(N'2024-03-09T10:28:02.210' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (347, 2, 9, 9, CAST(N'2024-03-09T10:28:02.210' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (348, 2, 10, 9, CAST(N'2024-03-09T10:28:02.210' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (349, 2, 1, 13, CAST(N'2024-03-19T16:15:17.040' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (350, 2, 2, 13, CAST(N'2024-03-19T16:15:17.053' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (351, 2, 3, 13, CAST(N'2024-03-19T16:15:17.057' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (352, 2, 4, 13, CAST(N'2024-03-19T16:15:17.057' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (353, 2, 5, 13, CAST(N'2024-03-19T16:15:17.060' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (354, 2, 7, 13, CAST(N'2024-03-19T16:15:17.060' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (355, 2, 9, 13, CAST(N'2024-03-19T16:15:17.060' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (356, 2, 10, 13, CAST(N'2024-03-19T16:15:17.063' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (371, 2, 2, 1, CAST(N'2024-03-09T10:37:05.533' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (372, 2, 3, 1, CAST(N'2024-03-09T10:37:05.537' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (373, 2, 4, 1, CAST(N'2024-03-09T10:37:05.537' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (374, 2, 5, 1, CAST(N'2024-03-09T10:37:05.540' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (375, 2, 7, 1, CAST(N'2024-03-09T10:37:05.540' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (376, 2, 9, 1, CAST(N'2024-03-09T10:37:05.540' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (377, 2, 10, 1, CAST(N'2024-03-09T10:37:05.543' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (378, 2, 2, 5, CAST(N'2024-03-19T16:17:34.200' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (379, 2, 3, 5, CAST(N'2024-03-19T16:17:34.200' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (380, 2, 4, 5, CAST(N'2024-03-19T16:17:34.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (381, 2, 5, 5, CAST(N'2024-03-19T16:17:34.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (382, 2, 7, 5, CAST(N'2024-03-19T16:17:34.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (383, 2, 9, 5, CAST(N'2024-03-19T16:17:34.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (384, 2, 10, 5, CAST(N'2024-03-19T16:17:34.203' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (385, 2, 1, 17, CAST(N'2024-03-19T16:16:00.497' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (386, 2, 2, 17, CAST(N'2024-03-19T16:16:00.507' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (387, 2, 3, 17, CAST(N'2024-03-19T16:16:00.510' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (388, 2, 4, 17, CAST(N'2024-03-19T16:16:00.510' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (389, 2, 5, 17, CAST(N'2024-03-19T16:16:00.510' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (390, 2, 7, 17, CAST(N'2024-03-19T16:16:00.513' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (391, 2, 9, 17, CAST(N'2024-03-19T16:16:00.513' AS DateTime), N'')
INSERT [dbo].[IsAttend] ([id], [status], [stuid], [sesid], [recordTime], [comment]) VALUES (392, 2, 10, 17, CAST(N'2024-03-19T16:16:00.513' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[IsAttend] OFF
GO
INSERT [dbo].[Role] ([id], [roleName]) VALUES (1, N'Teacher')
INSERT [dbo].[Role] ([id], [roleName]) VALUES (2, N'Student')
GO
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (2, 7)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (2, 8)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (2, 9)
INSERT [dbo].[Role_Feature] ([roleId], [fid]) VALUES (2, 10)
GO
INSERT [dbo].[Rooms] ([id], [name]) VALUES (1, N'BE101     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (2, N'BE102     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (3, N'BE103     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (4, N'BE104     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (7, N'BE203     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (5, N'BE211     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (6, N'BE212     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (8, N'BE302     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (9, N'BE303     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (10, N'BE304     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (11, N'BE305     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (12, N'BE401     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (13, N'BE402     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (14, N'BE403     ')
INSERT [dbo].[Rooms] ([id], [name]) VALUES (15, N'BE404     ')
GO
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (1, 1, 1, 1, 5, CAST(N'2024-01-02' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (2, 2, 3, 2, 1, CAST(N'2024-01-02' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (3, 3, 1, 1, 2, CAST(N'2024-01-03' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (4, 4, 5, 4, 13, CAST(N'2024-01-03' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (5, 1, 1, 1, 5, CAST(N'2024-01-04' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (6, 2, 3, 2, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (7, 3, 1, 1, 2, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (8, 4, 5, 4, 13, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (9, 1, 1, 1, 5, CAST(N'2024-01-09' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (10, 2, 3, 2, 1, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (11, 3, 1, 1, 2, CAST(N'2024-01-10' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (12, 4, 5, 4, 13, CAST(N'2024-01-10' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (13, 1, 1, 1, 5, CAST(N'2024-01-11' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (14, 2, 3, 2, 1, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (15, 3, 1, 1, 2, CAST(N'2024-01-12' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (16, 4, 5, 4, 13, CAST(N'2024-01-12' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (17, 1, 1, 1, 5, CAST(N'2024-01-16' AS Date), 2)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (18, 2, 3, 2, 1, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (19, 3, 1, 1, 2, CAST(N'2024-01-17' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (20, 4, 5, 4, 13, CAST(N'2024-01-17' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (21, 1, 1, 1, 5, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (22, 2, 3, 2, 1, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (23, 3, 1, 1, 2, CAST(N'2024-01-19' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (24, 4, 5, 4, 13, CAST(N'2024-01-19' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (25, 1, 1, 1, 5, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (26, 2, 3, 2, 1, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (27, 3, 1, 1, 2, CAST(N'2024-01-24' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (28, 4, 5, 4, 13, CAST(N'2024-01-24' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (29, 1, 1, 1, 5, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (30, 2, 3, 2, 1, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (31, 3, 1, 1, 2, CAST(N'2024-01-26' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (32, 4, 5, 4, 13, CAST(N'2024-01-26' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (33, 1, 1, 1, 5, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (34, 2, 3, 2, 1, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (35, 3, 1, 1, 2, CAST(N'2024-01-31' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (36, 4, 5, 4, 13, CAST(N'2024-01-31' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (37, 1, 1, 1, 5, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (38, 2, 3, 2, 1, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (39, 3, 1, 1, 2, CAST(N'2024-02-02' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (40, 4, 5, 4, 13, CAST(N'2024-02-02' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (41, 1, 1, 1, 5, CAST(N'2024-02-13' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (42, 2, 3, 2, 1, CAST(N'2024-02-13' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (43, 3, 1, 1, 2, CAST(N'2024-02-14' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (44, 1, 1, 1, 5, CAST(N'2024-02-15' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (45, 2, 3, 2, 1, CAST(N'2024-02-15' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (46, 3, 1, 1, 2, CAST(N'2024-02-16' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (47, 1, 1, 1, 5, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (48, 2, 3, 2, 1, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (49, 3, 1, 1, 2, CAST(N'2024-02-21' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (50, 1, 1, 1, 5, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (51, 2, 3, 2, 1, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (52, 3, 1, 1, 2, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (53, 1, 1, 1, 5, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (54, 2, 3, 2, 1, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (55, 3, 1, 1, 2, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (56, 1, 1, 1, 5, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (57, 2, 3, 2, 1, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (58, 3, 1, 1, 2, CAST(N'2024-03-01' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (59, 1, 1, 1, 5, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (60, 2, 3, 2, 1, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (61, 3, 1, 1, 2, CAST(N'2024-03-06' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (62, 1, 1, 1, 5, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (63, 2, 3, 2, 1, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (64, 3, 1, 1, 2, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (65, 1, 1, 1, 5, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (66, 2, 3, 2, 1, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (67, 3, 1, 1, 2, CAST(N'2024-03-13' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (68, 1, 1, 1, 5, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (69, 2, 3, 2, 1, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Sessions] ([id], [gid], [insid], [tid], [rid], [dateTime], [attend]) VALUES (70, 3, 1, 1, 2, CAST(N'2024-03-15' AS Date), 0)
GO
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (1, N'HE173566  ', N'Nguyễn    ', N'Mạnh           ', N'Huy       ', 1, N'Huynmhe173566@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (2, N'HE176302  ', N'Kiều      ', N'Thanh Thế      ', N'Anh       ', 1, N'Anhktthe176302@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (3, N'HE176471  ', N'Nguyễn    ', N'Đăng           ', N'Linh      ', 1, N'Linhdlhe176471@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (4, N'HE176772  ', N'Nguyễn    ', N'Anh            ', N'Tuấn      ', 1, N'Tuannahe176772@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (5, N'HE176189  ', N'Lưu       ', N'Thị Thùy       ', N'Linh      ', 0, N'Linhltthe176189@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (6, N'HE176246  ', N'Nguyễn    ', N'Việt           ', N'Đức       ', 1, N'Ducnvhe176246@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (7, N'HE173552  ', N'Viên      ', N'Thanh          ', N'Vũ        ', 1, N'Vuvthe173552@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (8, N'HE173551  ', N'Trịnh     ', N'Văn            ', N'Trường    ', 1, N'Truongtvhe173551@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (9, N'HE173544  ', N'Võ        ', N'Tuấn           ', N'Anh       ', 1, N'Anhvthe173544@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (10, N'HE173504  ', N'Phùng     ', N'Thị            ', N'Linh      ', 0, N'Linhpthe173504@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (11, N'HE173498  ', N'Nguyễn    ', N'Tiến           ', N'Đạt       ', 1, N'Datnthe173498@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (12, N'HE173450  ', N'Lê        ', N'Xuân Huy       ', N'Hoàng     ', 1, N'Hoanglxhhe173450@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (13, N'HE173344  ', N'Hoàng     ', N'Minh           ', N'Đức       ', 1, N'Duchmhe173344@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (14, N'HE173320  ', N'Vũ        ', N'Hoàng          ', N'Sơn       ', 1, N'Sonvhhe173320@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (15, N'HE173092  ', N'Đoàn      ', N'Thế            ', N'Anh       ', 1, N'Anhdthe173092@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (16, N'HE172544  ', N'Vũ        ', N'Ngọc Hải       ', N'Anh       ', 1, N'Anhvnhhe172544@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (17, N'HE172452  ', N'Lê        ', N'Duy            ', N'Hải       ', 1, N'Haildhe172452@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (18, N'HE172256  ', N'Nguyễn    ', N'Đức            ', N'Công      ', 1, N'Congndhe172256@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (19, N'HE172214  ', N'Hoàng     ', N'Công           ', N'Thành
   ', 1, N'Thanhhche172214@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (20, N'HE172148  ', N'Nguyễn    ', N'Đồng           ', N'Lợi       ', 1, N'Loindhe172148@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (21, N'HE171922  ', N'Nguyễn    ', N'Đức            ', N'Thịnh     ', 1, N'Thinhndhe171922@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (22, N'HE171512  ', N'Đoàn      ', N'Mạnh	          ', N'Giỏi      ', 1, N'Gioidmhe171512@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (23, N'HE171286  ', N'Nguyễn    ', N'Minh           ', N'Anh       ', 1, N'Anhnmhe171286@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (24, N'HE171083  ', N'Đoàn      ', N'Nguyễn Minh	   ', N'Hiếu      ', 1, N'Hieudnmhe171083@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (25, N'HE171011  ', N'Nguyễn    ', N'Long	          ', N'Nhật
    ', 1, N'Nhatnlhe171011@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (26, N'HE170601  ', N'Vũ        ', N'Đại	           ', N'Phát      ', 1, N'Phatvnhe170601@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (27, N'HE170483  ', N'	Đỗ       ', N'Ngọc           ', N'Đức       ', 1, N'Dudcnhe170483@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (28, N'HE170179	 ', N'Nguyễn    ', N'Thành          ', N'Long      ', 1, N'Longnthe170179@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (29, N'HE161942  ', N'Đặng      ', N'Đức            ', N'Việt      ', 1, N'Vietddhe161942@fpt.edu.vn', NULL)
INSERT [dbo].[Students] ([id], [code], [first_name], [mid_name], [last_name], [isGender], [email], [image_src]) VALUES (30, N'HE172571  ', N'Nguyễn    ', N'Thành          ', N'Nam       ', 1, N'Namnthe172571@fpt.edu.vn', NULL)
GO
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (1, 1)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (1, 4)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (1, 5)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (1, 6)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (1, 7)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (2, 1)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (2, 3)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (2, 4)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (2, 5)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (2, 6)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 1)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 2)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 3)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 4)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 5)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 6)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (3, 7)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 1)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 2)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 3)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 4)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 5)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 6)
INSERT [dbo].[TermDepart] ([tid], [did]) VALUES (4, 7)
GO
INSERT [dbo].[Terms] ([id], [name], [start], [end]) VALUES (1, N'Spring2023          ', CAST(N'2023-01-02' AS Date), CAST(N'2023-04-29' AS Date))
INSERT [dbo].[Terms] ([id], [name], [start], [end]) VALUES (2, N'Summer2023          ', CAST(N'2023-05-08' AS Date), CAST(N'2023-08-27' AS Date))
INSERT [dbo].[Terms] ([id], [name], [start], [end]) VALUES (3, N'Fall2023            ', CAST(N'2023-09-04' AS Date), CAST(N'2023-12-24' AS Date))
INSERT [dbo].[Terms] ([id], [name], [start], [end]) VALUES (4, N'Spring2024          ', CAST(N'2024-01-01' AS Date), CAST(N'2024-04-29' AS Date))
GO
INSERT [dbo].[TimeSlot] ([id], [start], [end]) VALUES (1, N'7:30      ', N'9:50      ')
INSERT [dbo].[TimeSlot] ([id], [start], [end]) VALUES (2, N'10:00     ', N'12:20     ')
INSERT [dbo].[TimeSlot] ([id], [start], [end]) VALUES (3, N'12:50     ', N'15:10     ')
INSERT [dbo].[TimeSlot] ([id], [start], [end]) VALUES (4, N'15:20     ', N'17:40     ')
INSERT [dbo].[TimeSlot] ([id], [start], [end]) VALUES (5, N'17:50     ', N'20:10     ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Accounts]    Script Date: 19-Mar-24 4:42:02 PM ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UK_Accounts] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UN_Rooms]    Script Date: 19-Mar-24 4:42:02 PM ******/
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [UN_Rooms] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UNQ_Students]    Script Date: 19-Mar-24 4:42:02 PM ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [UNQ_Students] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IsAttend] ADD  CONSTRAINT [DF_IsAttend_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Sessions] ADD  CONSTRAINT [DF_Sessions_attend]  DEFAULT ((0)) FOR [attend]
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Accounts] FOREIGN KEY([accid])
REFERENCES [dbo].[Accounts] ([id])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Accounts]
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Role]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Instructors] FOREIGN KEY([user_id])
REFERENCES [dbo].[Instructors] ([id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Instructors]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Students] FOREIGN KEY([user_id])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Students]
GO
ALTER TABLE [dbo].[Assessment ]  WITH CHECK ADD  CONSTRAINT [FK_Assessment _Courses] FOREIGN KEY([cid])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Assessment ] CHECK CONSTRAINT [FK_Assessment _Courses]
GO
ALTER TABLE [dbo].[Assessment ]  WITH CHECK ADD  CONSTRAINT [FK_Assessment _Grade] FOREIGN KEY([gradeid])
REFERENCES [dbo].[Grade] ([id])
GO
ALTER TABLE [dbo].[Assessment ] CHECK CONSTRAINT [FK_Assessment _Grade]
GO
ALTER TABLE [dbo].[Assessment ]  WITH CHECK ADD  CONSTRAINT [FK_Assessment _Instructors] FOREIGN KEY([insid])
REFERENCES [dbo].[Instructors] ([id])
GO
ALTER TABLE [dbo].[Assessment ] CHECK CONSTRAINT [FK_Assessment _Instructors]
GO
ALTER TABLE [dbo].[Assessment ]  WITH CHECK ADD  CONSTRAINT [FK_Assessment _Students] FOREIGN KEY([sid])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Assessment ] CHECK CONSTRAINT [FK_Assessment _Students]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Courses] FOREIGN KEY([cid])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Courses]
GO
ALTER TABLE [dbo].[CourseGrade]  WITH CHECK ADD  CONSTRAINT [FK_CourseGrade_Grade] FOREIGN KEY([gradeid])
REFERENCES [dbo].[Grade] ([id])
GO
ALTER TABLE [dbo].[CourseGrade] CHECK CONSTRAINT [FK_CourseGrade_Grade]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([did])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_DetailCourse] FOREIGN KEY([detailid])
REFERENCES [dbo].[DetailCourse] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_DetailCourse]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_DetailGrade] FOREIGN KEY([did])
REFERENCES [dbo].[DetailGrade] ([id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_DetailGrade]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_GradeCategories] FOREIGN KEY([cateid])
REFERENCES [dbo].[GradeCategories] ([id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_GradeCategories]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Courses] FOREIGN KEY([cid])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Courses]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Instructors] FOREIGN KEY([insid])
REFERENCES [dbo].[Instructors] ([id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Instructors]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Terms] FOREIGN KEY([tid])
REFERENCES [dbo].[Terms] ([id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Terms]
GO
ALTER TABLE [dbo].[HasGroup]  WITH CHECK ADD  CONSTRAINT [FK_HasGroup_Groups] FOREIGN KEY([gid])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[HasGroup] CHECK CONSTRAINT [FK_HasGroup_Groups]
GO
ALTER TABLE [dbo].[HasGroup]  WITH CHECK ADD  CONSTRAINT [FK_HasGroup_Students] FOREIGN KEY([sid])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[HasGroup] CHECK CONSTRAINT [FK_HasGroup_Students]
GO
ALTER TABLE [dbo].[IsAttend]  WITH CHECK ADD  CONSTRAINT [FK_IsAttend_Sessions] FOREIGN KEY([sesid])
REFERENCES [dbo].[Sessions] ([id])
GO
ALTER TABLE [dbo].[IsAttend] CHECK CONSTRAINT [FK_IsAttend_Sessions]
GO
ALTER TABLE [dbo].[IsAttend]  WITH CHECK ADD  CONSTRAINT [FK_IsAttend_Students] FOREIGN KEY([stuid])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[IsAttend] CHECK CONSTRAINT [FK_IsAttend_Students]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Groups] FOREIGN KEY([gid])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Groups]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Instructors] FOREIGN KEY([insid])
REFERENCES [dbo].[Instructors] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Instructors]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Rooms] FOREIGN KEY([rid])
REFERENCES [dbo].[Rooms] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Rooms]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_TimeSlot]
GO
ALTER TABLE [dbo].[TermDepart]  WITH CHECK ADD  CONSTRAINT [FK_TermDepart_Departments] FOREIGN KEY([did])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[TermDepart] CHECK CONSTRAINT [FK_TermDepart_Departments]
GO
ALTER TABLE [dbo].[TermDepart]  WITH CHECK ADD  CONSTRAINT [FK_TermDepart_Terms] FOREIGN KEY([tid])
REFERENCES [dbo].[Terms] ([id])
GO
ALTER TABLE [dbo].[TermDepart] CHECK CONSTRAINT [FK_TermDepart_Terms]
GO
USE [master]
GO
ALTER DATABASE [Project_Prj] SET  READ_WRITE 
GO
