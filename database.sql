USE [Project_Prj]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 02-Mar-24 9:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Accounts] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment ]    Script Date: 02-Mar-24 9:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment ](
	[id] [int] NOT NULL,
	[score] [decimal](4, 2) NULL,
	[weight] [decimal](3, 2) NULL,
	[required] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[CourseGrade]    Script Date: 02-Mar-24 9:30:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseGrade](
	[cid] [int] NOT NULL,
	[gradeid] [int] NOT NULL,
	[weight] [decimal](4, 3) NULL,
	[required] [nchar](10) NULL,
 CONSTRAINT [PK_CourseGrade] PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[gradeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[DetailCourse]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[DetailGrade]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[GradeCategories]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Groups]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[HasGroup]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Instructors]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[IsAttend]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UN_Rooms] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNQ_Students] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermDepart]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[Terms]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 02-Mar-24 9:30:15 PM ******/
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
ALTER TABLE [dbo].[IsAttend] ADD  CONSTRAINT [DF_IsAttend_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Sessions] ADD  CONSTRAINT [DF_Sessions_attend]  DEFAULT ((0)) FOR [attend]
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
