USE [master]
GO
/****** Object:  Database [HappyProgramingEditV3]    Script Date: 6/20/2024 8:36:59 PM ******/
CREATE DATABASE [HappyProgramingEditV3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HappyProgramingEditV3', FILENAME = N'E:\Term_3\DBI202\MSSQL16.MSSQLSERVER\MSSQL\DATA\HappyProgramingEditV3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HappyProgramingEditV3_log', FILENAME = N'E:\Term_3\DBI202\MSSQL16.MSSQLSERVER\MSSQL\DATA\HappyProgramingEditV3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HappyProgramingEditV3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HappyProgramingEditV3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HappyProgramingEditV3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ARITHABORT OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HappyProgramingEditV3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HappyProgramingEditV3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HappyProgramingEditV3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HappyProgramingEditV3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET RECOVERY FULL 
GO
ALTER DATABASE [HappyProgramingEditV3] SET  MULTI_USER 
GO
ALTER DATABASE [HappyProgramingEditV3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HappyProgramingEditV3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HappyProgramingEditV3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HappyProgramingEditV3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HappyProgramingEditV3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HappyProgramingEditV3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HappyProgramingEditV3', N'ON'
GO
ALTER DATABASE [HappyProgramingEditV3] SET QUERY_STORE = ON
GO
ALTER DATABASE [HappyProgramingEditV3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HappyProgramingEditV3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
	[roleid] [int] NOT NULL,
	[email] [nchar](100) NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [nvarchar](max) NULL,
	[intro] [nvarchar](max) NULL,
	[achievement] [nvarchar](max) NULL,
	[experience] [nvarchar](max) NULL,
	[certificate] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[menid] [int] NULL,
	[skills] [nvarchar](max) NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[url] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] NOT NULL,
	[rate] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[userid] [int] NOT NULL,
	[menid] [int] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[dateofbirth] [date] NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](max) NULL,
	[ava] [nvarchar](max) NULL,
	[accid] [int] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [nchar](20) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[dateofbirth] [date] NULL,
	[ava] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
	[accid] [int] NOT NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Mentor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor_Skill]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor_Skill](
	[mentorid] [int] NOT NULL,
	[skillid] [int] NOT NULL,
 CONSTRAINT [PK_Mentor_Skill] PRIMARY KEY CLUSTERED 
(
	[mentorid] ASC,
	[skillid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[createdAt] [datetime] NULL,
	[isRead] [bit] NULL,
	[title] [nvarchar](max) NULL,
	[menid] [int] NULL,
	[userid] [int] NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Notification_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[id] [int] NOT NULL,
	[menid] [int] NULL,
	[price] [money] NULL,
	[skillid] [int] NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[deadlineTime] [datetime] NULL,
	[skills] [nvarchar](100) NULL,
	[contentRequest] [nvarchar](max) NULL,
	[status] [nchar](20) NULL,
	[userid] [int] NOT NULL,
	[menid] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleid] [int] NOT NULL,
	[feaid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[feaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id] [int] NOT NULL,
	[status] [nchar](20) NULL,
	[menid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[slotid] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[skill] [nvarchar](100) NULL,
	[menid] [int] NOT NULL,
	[userid] [int] NULL,
	[requestid] [int] NULL,
	[tempuserid] [int] NULL,
	[checkStatus] [bit] NULL,
	[managerid] [int] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skillname] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[id] [int] NOT NULL,
	[from] [time](7) NULL,
	[to] [time](7) NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/20/2024 8:36:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Phone] [nchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[accid] [int] NOT NULL,
	[ava] [nvarchar](max) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (3, N'mentee11                                          ', N'123456                                            ', 2, N'vuvien73@gmail.com                                                                                  ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (4, N'metor33                                           ', N'123456                                            ', 1, N'a@gmail.com                                                                                         ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (10, N'admin89                                           ', N'123456                                            ', 1, N'b@gmail.com                                                                                         ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (11, N'adminVNM                                          ', N'123456                                            ', 3, N'minhdao3444@gmail.com                                                                               ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (12, N'manager                                           ', N'123456                                            ', 4, N'minhdao3888@gmail.com                                                                               ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (13, N'mentee1                                           ', N'123456                                            ', 2, N'c@gmail.com                                                                                         ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (14, N'mentor1                                           ', N'12345678                                          ', 1, N'vuvienabc@gmail.com                                                                                 ', 1)
INSERT [dbo].[Account] ([accid], [username], [password], [roleid], [email], [status]) VALUES (15, N'NhatNon                                           ', N'123456                                            ', 1, N'nguyenbuinhatls31@gmail.com                                                                         ', 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (1, N'View profile of mentee', N'/profile')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (2, N'View request', N'/view')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (3, N'Create request', N'/request')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (4, N'List request', N'/list_request')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (5, N'Update request', N'/update_request')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (6, N'Dashboard controller', N'/admin')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (7, N'Update skill', N'/updateskill')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (8, N'Create schedule', N'/schedule')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (9, N'View mentor schedule', N'/view_schedule')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (10, N'Book mentor', N'/book_mentor')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (11, N'View profile mentor', N'/mentor_profile')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (12, N'Create CV', N'/mentor_cv')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (13, N'Manage CV of manager', N'/manage_cv')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (14, N'View CV of manager', N'/viewcv')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (15, N'Accept CV of manager', N'/changestatus')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (16, N'Reject CV of manager', N'/rejectcv')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (17, N'Reject user request', N'/reject_request')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (18, N'Accrpt user request', N'/accept_request')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (19, N'Check schedule', N'/check_schedule')
INSERT [dbo].[Feature] ([id], [name], [url]) VALUES (20, N'View mentee request', N'/mentee_request')
GO
SET IDENTITY_INSERT [dbo].[Mentor] ON 

INSERT [dbo].[Mentor] ([id], [name], [gender], [phone], [address], [dateofbirth], [ava], [status], [accid], [managerid]) VALUES (3, N'Vu', 1, N'0123456789          ', N'Lang son', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[Mentor] ([id], [name], [gender], [phone], [address], [dateofbirth], [ava], [status], [accid], [managerid]) VALUES (4, N'Vien', 1, N'012345678           ', N'laks', NULL, NULL, 1, 10, NULL)
INSERT [dbo].[Mentor] ([id], [name], [gender], [phone], [address], [dateofbirth], [ava], [status], [accid], [managerid]) VALUES (5, N'Minh Nhật', 1, N'0123456789          ', N'Thanh Hóa', CAST(N'2001-05-09' AS Date), N'teacher-8.jpg', 1, 14, NULL)
INSERT [dbo].[Mentor] ([id], [name], [gender], [phone], [address], [dateofbirth], [ava], [status], [accid], [managerid]) VALUES (6, N'Nhat Non', 1, N'0961442233          ', N'Lang Son', CAST(N'2002-02-20' AS Date), N'loc.png', 0, 15, NULL)
SET IDENTITY_INSERT [dbo].[Mentor] OFF
GO
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (3, 2)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (3, 5)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (3, 11)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (4, 6)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (4, 12)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (4, 13)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (5, 7)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (5, 9)
INSERT [dbo].[Mentor_Skill] ([mentorid], [skillid]) VALUES (5, 12)
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (23, N'Em muon hoc java', CAST(N'2024-06-08T06:19:00.000' AS DateTime), N'Java', N'-Em muon nang cao kha nang
-Co viec lam on dinh', N'Open                ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (24, N'Em muon hoc CSS', CAST(N'2024-06-07T06:40:00.000' AS DateTime), N'CSS', N'Nhu cútdbssjhdj', N'Cancel              ', 5, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (25, N'Em muon hoc javascript', CAST(N'2024-06-09T07:28:00.000' AS DateTime), N'Javascript', N'Nhu cut', N'Cancel              ', 5, 4)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (27, N'sjdsdjds', CAST(N'2024-06-15T09:47:00.000' AS DateTime), N'CSS', N'jdsjshjshd', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (28, N'skjskdjskdjds', CAST(N'2024-06-15T09:52:00.000' AS DateTime), N'Java', N'ksdkjksjd 
skdjskjsdksjksdjskjskdjs', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (29, N'1', CAST(N'2024-06-15T09:57:00.000' AS DateTime), N'Java', N'33456', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (30, N'jsjshdjshd', CAST(N'2024-06-15T10:07:00.000' AS DateTime), N'Java', N'jhsjdhsjhsjhdjhs sdjshjshjshdsj', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (31, N'nhu loaoaos', CAST(N'2024-06-15T10:11:00.000' AS DateTime), N'Java', N'mjisdisd ksjdksd', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (32, N'smdjsd sjdssd sjdsd', CAST(N'2024-06-15T23:41:00.000' AS DateTime), N'Java', N'ssdmsdmsdmsdms', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (33, N'jsjsjd', CAST(N'2024-06-15T23:47:00.000' AS DateTime), N'Java', N'sdjsjd', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (34, N'jsjdsjd sjdsjsjds', CAST(N'2024-06-15T23:51:00.000' AS DateTime), N'CSS', N'ksdskksdksdk', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (35, N'sjdjsjdjds', CAST(N'2024-06-16T00:28:00.000' AS DateTime), N'Java', N'sdsmsmsmsd', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (36, N'jsjdsjd', CAST(N'2024-06-16T00:32:00.000' AS DateTime), N'Java', N'ssdjsdjs', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (37, N'jsjsd', CAST(N'2024-06-16T00:37:00.000' AS DateTime), N'Java', N'smdmsmsdmsdmsmd', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (38, N'ssdks', CAST(N'2024-06-16T00:39:00.000' AS DateTime), N'Python', N'skskdskdks', N'Cancel              ', 4, 3)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (39, N'Em muon hoc Sql', CAST(N'2024-06-17T11:06:00.000' AS DateTime), N'MySQL', N'abc', N'Cancel              ', 4, 5)
INSERT [dbo].[Request] ([id], [title], [deadlineTime], [skills], [contentRequest], [status], [userid], [menid]) VALUES (40, N'abc', CAST(N'2024-06-17T09:17:00.000' AS DateTime), N'AI', N'abc', N'Cancel              ', 4, 5)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Mentor')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Mentee')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'Manager')
GO
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 8)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 9)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 11)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 12)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 17)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 18)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 19)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (1, 20)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 1)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 2)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 3)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (2, 10)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (3, 6)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (3, 7)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (4, 13)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (4, 14)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (4, 15)
INSERT [dbo].[Role_Feature] ([roleid], [feaid]) VALUES (4, 16)
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (22, CAST(N'2024-06-13' AS Date), 1, 1, N'CSS', 3, 5, 24, 5, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (23, CAST(N'2024-06-14' AS Date), 1, 0, N'CSS', 3, 5, 24, 5, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (24, CAST(N'2024-06-11' AS Date), 1, 1, N'Java', 3, 4, 23, 4, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (25, CAST(N'2024-06-11' AS Date), 2, 1, N'Java', 3, 4, 23, 4, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (26, CAST(N'2024-06-12' AS Date), 1, 1, N'Java', 3, 4, 23, 4, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (33, CAST(N'2024-06-12' AS Date), 2, 1, N'Java', 3, 4, 23, 4, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (61, CAST(N'2024-06-18' AS Date), 1, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (62, CAST(N'2024-06-18' AS Date), 3, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (63, CAST(N'2024-06-22' AS Date), 1, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([id], [date], [slotid], [status], [skill], [menid], [userid], [requestid], [tempuserid], [checkStatus], [managerid]) VALUES (64, CAST(N'2024-06-22' AS Date), 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Skill] ON 

INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (1, N'C', 1, N'A fundamental language for beginner', N'C.jpg')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (2, N'Java', 1, NULL, N'Java.png')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (3, N'C#', 1, NULL, N'csharp.jpg')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (5, N'Python', 1, NULL, N'python.jpg')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (6, N'Javascript', 1, NULL, N'javascript.png')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (7, N'AI', 1, NULL, N'AI.png')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (9, N'HH', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (10, N'HTML', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (11, N'CSS', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (12, N'MySQL', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (13, N'PostgreSQL', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (14, N'SpringBoot', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (16, N'VueJS', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (17, N'AngularJS', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (18, N'23', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (19, N'56', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (20, N'343', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (21, N'343', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (22, N'jjfd', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (23, N'333', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (25, N'3435', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (26, N'2323', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (27, N'232323', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (28, N'3434', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (29, N'7080', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (30, N'ere', 1, NULL, NULL)
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (40, N'Hay lam', 1, N'skdsk nxc', N'SwimlaneDiagram-Chatting with mentor.drawio.png')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (41, N'ssm', 1, N'ss', N'Screenshot 2024-05-28 160834.png')
INSERT [dbo].[Skill] ([id], [skillname], [status], [description], [image]) VALUES (44, N'ASP.NET', 1, N'La mon hoc c#', N'Screenshot 2024-05-28 161432.png')
SET IDENTITY_INSERT [dbo].[Skill] OFF
GO
INSERT [dbo].[Slot] ([id], [from], [to]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:50:00' AS Time))
INSERT [dbo].[Slot] ([id], [from], [to]) VALUES (2, CAST(N'10:00:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[Slot] ([id], [from], [to]) VALUES (3, CAST(N'12:50:00' AS Time), CAST(N'15:10:00' AS Time))
INSERT [dbo].[Slot] ([id], [from], [to]) VALUES (4, CAST(N'15:20:00' AS Time), CAST(N'17:40:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userid], [Name], [Gender], [Phone], [Address], [DateOfBirth], [accid], [ava]) VALUES (4, N'Vu Vien Chiennn', 1, N'0123456789', N'Quang', CAST(N'2024-05-09' AS Date), 3, N'SwimlaneDiagram-Register schedule.drawio.png')
INSERT [dbo].[User] ([userid], [Name], [Gender], [Phone], [Address], [DateOfBirth], [accid], [ava]) VALUES (5, N'Nhu cut la', 0, N'0123456789', N'Lang Son', NULL, 13, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Account_1]    Script Date: 6/20/2024 8:37:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Account_1] ON [dbo].[Account]
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CV]    Script Date: 6/20/2024 8:37:00 PM ******/
ALTER TABLE [dbo].[CV] ADD  CONSTRAINT [IX_CV] UNIQUE NONCLUSTERED 
(
	[menid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Manager]    Script Date: 6/20/2024 8:37:00 PM ******/
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [IX_Manager] UNIQUE NONCLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mentor]    Script Date: 6/20/2024 8:37:00 PM ******/
ALTER TABLE [dbo].[Mentor] ADD  CONSTRAINT [IX_Mentor] UNIQUE NONCLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Mentor_Skill]    Script Date: 6/20/2024 8:37:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Mentor_Skill] ON [dbo].[Mentor_Skill]
(
	[mentorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Schedule]    Script Date: 6/20/2024 8:37:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Schedule] ON [dbo].[Schedule]
(
	[menid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_1]    Script Date: 6/20/2024 8:37:00 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User_1] UNIQUE NONCLUSTERED 
(
	[accid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_Manager] FOREIGN KEY([managerid])
REFERENCES [dbo].[Manager] ([id])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_Manager]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_Mentor]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Mentor]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Account] FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Account]
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Account] FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[Mentor] CHECK CONSTRAINT [FK_Mentor_Account]
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Manager] FOREIGN KEY([managerid])
REFERENCES [dbo].[Manager] ([id])
GO
ALTER TABLE [dbo].[Mentor] CHECK CONSTRAINT [FK_Mentor_Manager]
GO
ALTER TABLE [dbo].[Mentor_Skill]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Skill_Mentor] FOREIGN KEY([mentorid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Mentor_Skill] CHECK CONSTRAINT [FK_Mentor_Skill_Mentor]
GO
ALTER TABLE [dbo].[Mentor_Skill]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Skill_Skill] FOREIGN KEY([skillid])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Mentor_Skill] CHECK CONSTRAINT [FK_Mentor_Skill_Skill]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Manager] FOREIGN KEY([managerid])
REFERENCES [dbo].[Manager] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Manager]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Mentor]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Mentor]
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Skill] FOREIGN KEY([skillid])
REFERENCES [dbo].[Skill] ([id])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Skill]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Mentor]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([feaid])
REFERENCES [dbo].[Feature] ([id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Mentor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Manager] FOREIGN KEY([managerid])
REFERENCES [dbo].[Manager] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Manager]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Mentor] FOREIGN KEY([menid])
REFERENCES [dbo].[Mentor] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Mentor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Request] FOREIGN KEY([requestid])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Request]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Slot1] FOREIGN KEY([slotid])
REFERENCES [dbo].[Slot] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Slot1]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_User] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([userid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([accid])
REFERENCES [dbo].[Account] ([accid])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
GO
USE [master]
GO
ALTER DATABASE [HappyProgramingEditV3] SET  READ_WRITE 
GO
