USE [master]
GO
/****** Object:  Database [SchoolERP1]    Script Date: 7/28/2018 10:27:46 AM ******/
CREATE DATABASE [SchoolERP1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolERP1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SchoolERP1.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SchoolERP1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SchoolERP1_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SchoolERP1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolERP1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolERP1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolERP1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolERP1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolERP1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolERP1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolERP1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SchoolERP1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolERP1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolERP1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolERP1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolERP1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolERP1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolERP1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolERP1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolERP1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolERP1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolERP1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolERP1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolERP1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolERP1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolERP1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolERP1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolERP1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchoolERP1] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolERP1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolERP1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolERP1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolERP1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SchoolERP1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SchoolERP1]
GO
/****** Object:  UserDefinedTableType [dbo].[CustomerType]    Script Date: 7/28/2018 10:27:46 AM ******/
CREATE TYPE [dbo].[CustomerType] AS TABLE(
	[EmployeeCode] [varchar](150) NULL,
	[JoiningDate] [date] NULL,
	[Department] [varchar](100) NULL,
	[Designation] [varchar](150) NULL,
	[Qualification] [varchar](150) NULL,
	[TotalExperience] [varchar](150) NULL,
	[StaffType] [varchar](150) NULL,
	[FirstName] [varchar](150) NULL,
	[MiddleName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[DOB] [date] NULL,
	[Gender] [varchar](150) NULL,
	[MaritalStatus] [varchar](150) NULL,
	[Religon] [varchar](150) NULL,
	[FatherName] [varchar](150) NULL,
	[MotherName] [varchar](150) NULL,
	[Country] [varchar](150) NULL,
	[State] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[PinCode] [varchar](150) NULL,
	[MobileNo] [varchar](150) NULL,
	[EmailAddress] [varchar](150) NULL,
	[AdhaarNumber] [varchar](150) NULL,
	[PresentAddress] [nvarchar](max) NULL,
	[PermanentAddress] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StudentExcel]    Script Date: 7/28/2018 10:27:46 AM ******/
CREATE TYPE [dbo].[StudentExcel] AS TABLE(
	[StudentCode] [varchar](150) NULL,
	[AcademicYear] [nvarchar](150) NULL,
	[AdmissionDate] [varchar](150) NULL,
	[Class] [varchar](150) NULL,
	[Section] [varchar](150) NULL,
	[Stream] [varchar](150) NULL,
	[FirstName] [varchar](150) NULL,
	[MiddleName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[DOB] [varchar](150) NULL,
	[Gender] [varchar](150) NULL,
	[Nationality] [varchar](150) NULL,
	[Category] [varchar](150) NULL,
	[ResidentalAddress] [varchar](max) NULL,
	[City] [varchar](150) NULL,
	[State] [varchar](150) NULL,
	[PinCode] [varchar](150) NULL,
	[PhoneNumberForSMS] [bigint] NULL,
	[FatherName] [varchar](150) NULL,
	[FMobileNo] [bigint] NULL,
	[MotherName] [varchar](150) NULL,
	[MMobileNo] [bigint] NULL,
	[EmergencyContactNo] [varchar](150) NULL,
	[ContactPerson] [varchar](150) NULL,
	[Relationship] [varchar](350) NULL,
	[Status] [nvarchar](100) NULL
)
GO
/****** Object:  Table [dbo].[AppointmentDiary]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentDiary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[EmpID] [int] NOT NULL,
	[SomeImportantKey] [int] NOT NULL,
	[DateTimeScheduled] [datetime] NOT NULL,
	[AppointmentLength] [int] NOT NULL,
	[StatusENUM] [int] NOT NULL CONSTRAINT [DF_ConsultantBookings_Status]  DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAcademicYear]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAcademicYear](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateFrom] [date] NOT NULL,
	[DateTo] [date] NOT NULL,
	[Description] [varchar](max) NULL,
	[UpdateDt] [date] NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblAcademicYear_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblAcademicYear] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAdvertisingVedio]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdvertisingVedio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VedioUrl] [nvarchar](max) NULL,
	[VedioDuration] [varchar](150) NULL,
	[VedioTitle] [nvarchar](150) NULL,
	[status] [bit] NOT NULL DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblBatch]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [nvarchar](200) NULL,
	[ClassId] [int] NULL,
	[StartDate] [nvarchar](100) NULL,
	[EndDate] [nvarchar](100) NULL,
	[MaxNoOfStudent] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCastCategory]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCastCategory](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NOT NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblCast] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCaste]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCaste](
	[CasteId] [int] IDENTITY(1,1) NOT NULL,
	[CasteName] [varchar](150) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_tblCaste_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblCaste] PRIMARY KEY CLUSTERED 
(
	[CasteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](200) NULL,
	[CountryId] [bigint] NULL,
	[StateId] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[Datecreated] [date] NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblClass]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](150) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tblClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblClassTeacherAllocation]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassTeacherAllocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[EmpID] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[intEmpID] [int] NULL,
 CONSTRAINT [PK_tblClassTeacherAllocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblClassTiming]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblClassTiming](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblClassTiming_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblClassTiming] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblClassTimingDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblClassTimingDet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[STime] [time](7) NOT NULL,
	[ETime] [time](7) NOT NULL,
	[IsBreak] [bit] NULL CONSTRAINT [DF_tblClassTimingDet_IsBreak]  DEFAULT ((0)),
	[CT_ID] [bigint] NOT NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblClassTimingDet_Status]  DEFAULT ((1)),
	[StartTime] [varchar](20) NULL,
	[EndTime] [varchar](20) NULL,
 CONSTRAINT [PK_tblClassTimingDet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCountry](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCourses]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](200) NULL,
	[CourseDesc] [nvarchar](1000) NULL,
	[Code] [nvarchar](100) NULL,
	[MinimumAttendencPer] [nvarchar](50) NULL,
	[AttendencType] [nvarchar](150) NULL,
	[TotalWorkingDay] [nvarchar](150) NULL,
	[SyllabusName] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartmnet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDepartmnet](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblDepartmnet] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDesignation]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDesignation](
	[DesigID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_TBLDesignation] PRIMARY KEY CLUSTERED 
(
	[DesigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDestination]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDestination](
	[DestinationID] [int] NOT NULL,
	[DestinationName] [varchar](150) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblDestination] PRIMARY KEY CLUSTERED 
(
	[DestinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDocument]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](150) NULL,
	[DocumentDesc] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[userId] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDocumentNo]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](150) NULL,
	[Perfix] [nvarchar](150) NULL,
	[Suffix] [nvarchar](150) NULL,
	[DocumentNo] [nvarchar](10) NULL,
	[StartSeries] [nvarchar](50) NULL,
	[LastSeries] [nvarchar](50) NULL,
	[Serprator] [nvarchar](10) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [date] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Empcode] [varchar](150) NOT NULL,
	[JoiningDt] [date] NOT NULL,
	[DeptID] [int] NOT NULL,
	[DesigID] [int] NOT NULL,
	[Qualification] [int] NOT NULL,
	[Experience] [float] NOT NULL,
	[StaffCategory] [int] NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[DOB] [date] NOT NULL,
	[GenderID] [int] NOT NULL,
	[UserID] [varchar](100) NULL,
	[Pwd] [varchar](50) NULL,
	[City] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[Pincode] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [varchar](250) NOT NULL,
	[PresentAddress] [varchar](max) NOT NULL,
	[PermAddress] [varchar](max) NOT NULL,
	[MaritalSatus] [int] NOT NULL,
	[AdharNo] [nvarchar](50) NULL,
	[Religion] [int] NOT NULL,
	[FatherName] [varchar](250) NULL,
	[MotherName] [varchar](250) NULL,
	[Image] [varchar](max) NULL,
	[BiometricID] [varchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF__tblEmploy__Statu__114A936A]  DEFAULT ((1)),
	[PaymentMod] [nvarchar](150) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[IFSCCode] [nvarchar](150) NULL,
	[PFNo] [nvarchar](50) NULL,
	[PANNO] [nvarchar](150) NULL,
	[ESINO] [nvarchar](150) NULL,
	[BankName] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEmployeeAccountInformation]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeAccountInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [bigint] NULL,
	[EmployeeId] [bigint] NULL,
	[GradeId] [bigint] NULL,
	[BankAccountName] [nvarchar](150) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[IFSCCode] [nvarchar](50) NULL,
	[PfNo] [nvarchar](50) NULL,
	[PanNo] [nvarchar](50) NULL,
	[ESINo] [nvarchar](150) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeeAttendence]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeAttendence](
	[AttendenceId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[DesigId] [bigint] NOT NULL,
	[DepId] [bigint] NOT NULL,
	[LeaveType] [nvarchar](150) NULL,
	[AttendenceType] [nvarchar](150) NULL,
	[AttendenceDate] [date] NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
	[IsBiometric] [bit] NOT NULL DEFAULT ((0)),
	[TimeIn] [nvarchar](150) NULL,
	[TimeOut] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeeDocuments]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NULL,
	[EmployeeId] [bigint] NOT NULL,
	[DocImage] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblemployeeLeaveRequest]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblemployeeLeaveRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [bigint] NULL,
	[Department] [bigint] NULL,
	[Designation] [bigint] NULL,
	[LeaveType] [bigint] NULL,
	[StatDate] [date] NULL,
	[EndDate] [date] NULL,
	[TakeLeaveCount] [bigint] NULL,
	[Reason] [nvarchar](max) NULL,
	[LeavStatus] [bigint] NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_tblemployeeLeaveRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployeeSalaryDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeSalaryDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DesignationId] [bigint] NULL,
	[EmployeeId] [bigint] NULL,
	[FromDate] [date] NULL,
	[toDate] [date] NULL,
	[GradeId] [bigint] NULL,
	[MonthlyGross] [nvarchar](100) NULL,
	[MonthlyDeduction] [nvarchar](100) NULL,
	[GrossEarning] [nvarchar](100) NULL,
	[GrossDeduction] [nvarchar](100) NULL,
	[NoOfLeave] [bigint] NULL,
	[NetSalary] [nvarchar](100) NULL,
	[totalDayInMonth] [bigint] NULL,
	[salayDayInMonth] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployyeMonthSalaryStructure]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployyeMonthSalaryStructure](
	[fldId] [int] IDENTITY(1,1) NOT NULL,
	[salaryDetailId] [bigint] NOT NULL,
	[HeadId] [bigint] NULL,
	[HeadAmount] [nvarchar](150) NULL,
	[HeadType] [nvarchar](150) NULL,
	[Salrytpe] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_tblEmployyeMonthSalaryStructure] PRIMARY KEY CLUSTERED 
(
	[fldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEventDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventDetails](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](250) NULL,
	[EventType] [bigint] NULL,
	[Description] [nvarchar](500) NULL,
	[StartdateTime] [datetime] NULL,
	[EnddateTime] [datetime] NULL,
	[InchargeName] [nvarchar](250) NULL,
	[EventFor] [nvarchar](250) NULL,
	[courseId] [nvarchar](50) NULL,
	[SectionId] [nvarchar](150) NULL,
	[DepartmentId] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEventType]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEventType](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblEventType] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblExPayeeDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExPayeeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PayeeName] [nvarchar](150) NULL,
	[CategoryId] [nvarchar](10) NULL,
	[PrimaryDate] [date] NULL,
	[LastDate] [date] NULL,
	[TotalAmount] [nvarchar](150) NULL,
	[PaymentType] [bigint] NULL,
	[PayingAmount] [nvarchar](150) NULL,
	[DuesAmount] [nvarchar](150) NULL,
	[PaymentDate] [date] NULL,
	[PaymentMode] [nvarchar](150) NULL,
	[ChequeNo] [nvarchar](100) NULL,
	[ChequeDate] [date] NULL,
	[BankName] [nvarchar](150) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[dateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblExpenseCategory]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpenseCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFeeCalculate]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblFeeCalculate](
	[fldId] [int] IDENTITY(1,1) NOT NULL,
	[AcademicYear] [int] NULL,
	[Months] [nvarchar](150) NULL,
	[monthId] [bigint] NULL,
	[monthlyAmount] [nvarchar](100) NULL,
	[PaidAmount] [nvarchar](100) NULL,
	[duesAmount] [nvarchar](100) NULL,
	[fldstudentID] [bigint] NULL,
	[dateCreated] [datetime] NULL,
	[discountPer] [nvarchar](50) NULL,
	[discountAmnt] [nvarchar](100) NULL,
	[ActualPayableAmnt] [nvarchar](100) NULL,
	[DiscountReason] [varchar](250) NULL,
	[feePaid] [int] NULL,
	[feeStructureID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFeeCalculate_temp]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFeeCalculate_temp](
	[fldId] [int] IDENTITY(1,1) NOT NULL,
	[Months] [nvarchar](150) NULL,
	[monthId] [bigint] NULL,
	[monthlyAmount] [nvarchar](100) NULL,
	[PaidAmount] [nvarchar](100) NULL,
	[duesAmount] [nvarchar](100) NULL,
	[fldstudentID] [bigint] NULL,
	[dateCreated] [datetime] NULL,
	[discountPer] [nvarchar](50) NULL,
	[discountAmnt] [nvarchar](100) NULL,
	[ActualPayableAmnt] [nvarchar](100) NULL,
	[DiscountReason] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[fldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFeeCategory]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFeeCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeeCategory] [varchar](50) NOT NULL,
	[Cat_Desc] [varchar](200) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblFeeCategory_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblFeeCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFeeStructure]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFeeStructure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StructureName] [varchar](100) NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblFeeStructure_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblFeeStructure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFeeStructureAssign]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeeStructureAssign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[FeeStructureID] [int] NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_tblFeeStructureAssign_isActive]  DEFAULT ((1)),
	[isDeleted] [bit] NOT NULL CONSTRAINT [DF_tblFeeStructureAssign_isDeleted]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_tblFeeStructureAssign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFeeStructureClasses]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeeStructureClasses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[FeeStructureID] [int] NOT NULL,
 CONSTRAINT [PK_tblFeeStructureClasses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFeeStructureConfig]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeeStructureConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FeeCategory] [bigint] NOT NULL,
	[Amount] [nvarchar](100) NOT NULL,
	[FeeStructureID] [int] NOT NULL,
 CONSTRAINT [PK_tblFeeStructureConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGender]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGender](
	[gender_id] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [varchar](150) NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblGender] PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGradeAssignSalaryHead]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGradeAssignSalaryHead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HeadId] [bigint] NULL,
	[GradeId] [bigint] NULL,
	[Amount] [nvarchar](50) NULL,
	[Type] [nvarchar](100) NULL,
	[dateCreated] [datetime] NULL DEFAULT (getdate()),
	[headType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHomeAssignment]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHomeAssignment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssignmentNm] [varchar](200) NULL,
	[AssignmentDesc] [varchar](max) NULL,
	[AcademicYear] [int] NULL,
	[Class] [int] NULL,
	[Section] [int] NULL,
	[Subject] [bigint] NULL,
	[Marks] [nchar](50) NULL,
	[SubmitDt] [date] NULL,
	[FilePath] [varchar](max) NULL,
	[HW_Dt] [date] NULL,
	[HW_givenBy] [int] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_tblHomeAssignment_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblHomeAssignment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLLanguages]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLLanguages](
	[LangID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [varchar](100) NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_TBLLanguages_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TBLLanguages] PRIMARY KEY CLUSTERED 
(
	[LangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblLeaveDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LeaveCategory] [int] NULL,
	[leaveDesgination] [int] NULL,
	[leaveAssgin] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLeaveType]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLeaveType](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[LeaveName] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMaritalStatus]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaritalStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMasterGrade]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMasterGrade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [nvarchar](200) NULL,
	[DesignationId] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[datecreated] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_tblMasterGrade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblModule]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblModule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[Module] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblModule_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_tblModule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNoticeBoard]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNoticeBoard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[NoticeDate] [date] NULL,
	[description] [nvarchar](max) NULL,
	[userType] [nvarchar](100) NULL,
	[NoticeFile] [nvarchar](151) NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
	[dateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLPrevSchoolDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLPrevSchoolDet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PSYear] [varchar](50) NULL,
	[School] [varchar](250) NULL,
	[Board] [varchar](250) NULL,
	[Class] [int] NULL,
	[StudentID] [int] NULL,
	[Marks] [varchar](250) NULL,
	[TCNo] [varchar](250) NULL,
	[Awards] [varchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_TBLPrevSchoolDet_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TBLPrevSchoolDet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblQualifications]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblQualifications](
	[QualificationId] [int] IDENTITY(1,1) NOT NULL,
	[QualificationName] [varchar](150) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_tblQualifications_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblQualifications] PRIMARY KEY CLUSTERED 
(
	[QualificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblReligion]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblReligion](
	[ReligionId] [int] IDENTITY(1,1) NOT NULL,
	[ReligionName] [varchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblReligion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoleAssign]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoleAssign](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_tblRoleAssign] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoleMaster]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoleMaster](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblRoleMaster] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoleSubModAssign]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleSubModAssign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[SubmoduleID] [int] NOT NULL,
 CONSTRAINT [PK_tblRoleSubModAssign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoteDestination]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoteDestination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NULL,
	[PickAndDrop] [nvarchar](250) NULL,
	[StopTime] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSalaryHead]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSalaryHead](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalaryType] [varchar](150) NULL,
	[Name] [varchar](150) NULL,
	[Code] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblScholarRegister]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblScholarRegister](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SRno] [nvarchar](50) NULL,
	[StudentID] [int] NOT NULL,
	[WithdrawalNo] [nvarchar](50) NULL,
	[TCNo] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblScholarRegister_Status]  DEFAULT ((1)),
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_tblScholarRegister] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblScholarRegisterDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblScholarRegisterDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_ID] [bigint] NOT NULL,
	[AcademicYear] [int] NULL,
	[ClassID] [int] NULL,
	[SectionID] [int] NULL,
	[ActionTaken] [varchar](50) NULL,
	[ActionDate] [date] NULL,
	[Remarks] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_tblScholarRegisterDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSchoolDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSchoolDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[School] [varchar](max) NULL,
	[SchoolCode] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[State] [int] NULL,
	[City] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[Board] [varchar](250) NULL,
	[Pincode] [bigint] NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[Website] [nvarchar](250) NULL,
	[LogoPic] [nvarchar](max) NULL,
	[PrincipalID] [int] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_tblSchoolDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSections]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](150) NULL,
	[ClassId] [bigint] NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStaffCategory]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaffCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblStaffCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblState]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblState](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](150) NULL,
	[countryId] [int] NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](250) NOT NULL,
	[stStatus] [bit] NOT NULL DEFAULT ((1)),
	[LeaveStatus] [int] NULL,
	[StudentStatus] [int] NULL,
 CONSTRAINT [PK_TBLStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStream]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStream](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Class] [bigint] NULL,
	[StreamName] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStRegDocs]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStRegDocs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[DocID] [bigint] NOT NULL,
	[DocPath] [varchar](max) NOT NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblStRegDocs_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblStRegDocs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStRegHealthDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStRegHealthDet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[VisionLeft] [float] NULL,
	[VisionRight] [float] NULL,
	[MedicationDetails] [varchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblStRegHealthDet_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblStRegHealthDet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStRegistration]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStRegistration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StreamID] [int] NOT NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[DOB] [date] NULL,
	[GenderID] [int] NULL,
	[BloodGroup] [varchar](50) NULL,
	[BirthPlace] [varchar](250) NULL,
	[Religion] [int] NULL,
	[Nationality] [varchar](50) NULL,
	[MotherTongue] [varchar](250) NULL,
	[Languages] [varchar](250) NULL,
	[CategoryID] [int] NULL,
	[AadharNo] [nvarchar](50) NULL,
	[PermanentAddress] [varchar](max) NULL,
	[CorrespondAddress] [varchar](max) NULL,
	[PermPincode] [numeric](18, 0) NULL,
	[PermState] [varchar](100) NULL,
	[PermCity] [varchar](100) NULL,
	[CorsPincode] [numeric](18, 0) NULL,
	[CorsState] [varchar](100) NULL,
	[CorsCity] [varchar](100) NULL,
	[phone] [nvarchar](50) NULL,
	[SMSmobileNo] [nvarchar](50) NULL,
	[emailID] [varchar](250) NULL,
	[FatherName] [varchar](250) NULL,
	[FMobile] [nvarchar](50) NULL,
	[FJob] [varchar](250) NULL,
	[FDOB] [date] NULL,
	[FDesig] [varchar](100) NULL,
	[FNationality] [varchar](50) NULL,
	[FOfficeAddress] [varchar](max) NULL,
	[Fmail] [varchar](250) NULL,
	[FQualification] [int] NULL,
	[FAdharNo] [nvarchar](50) NULL,
	[MotherName] [varchar](250) NULL,
	[Mmobile] [nvarchar](50) NULL,
	[MJob] [varchar](250) NULL,
	[MDOB] [date] NULL,
	[MDesig] [varchar](100) NULL,
	[MNationality] [varchar](50) NULL,
	[MOfficeAddress] [varchar](max) NULL,
	[Mmail] [varchar](250) NULL,
	[MQualification] [int] NULL,
	[MAdharNo] [nvarchar](50) NULL,
	[FIncome] [nvarchar](250) NULL,
	[MIncome] [nvarchar](250) NULL,
	[GuardianName] [varchar](250) NULL,
	[Relation] [varchar](250) NULL,
	[GQualification] [int] NULL,
	[GJob] [varchar](250) NULL,
	[GIncome] [nvarchar](250) NULL,
	[GNationality] [varchar](50) NULL,
	[GDesig] [varchar](100) NULL,
	[Gmobile] [nvarchar](50) NULL,
	[GOfficeAddress] [varchar](max) NULL,
	[GAdharNo] [nvarchar](50) NULL,
	[Gmail] [varchar](250) NULL,
	[EmergencyNo] [nvarchar](50) NULL,
	[EmerContPerson] [varchar](250) NULL,
	[ContPersRelation] [varchar](100) NULL,
	[PicPath] [varchar](max) NULL,
	[FPicPath] [varchar](max) NULL,
	[MPicPath] [varchar](max) NULL,
	[RegCode] [varchar](250) NULL,
	[SPwd] [varchar](250) NULL,
	[ActionTakenBy] [varchar](50) NULL,
	[ActionDt] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblStRegistration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStRegPrevSchoolDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStRegPrevSchoolDet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PSYear] [varchar](50) NULL,
	[School] [varchar](250) NULL,
	[Board] [varchar](250) NULL,
	[Class] [int] NULL,
	[StudentID] [int] NULL,
	[Marks] [varchar](250) NULL,
	[TCNo] [varchar](250) NULL,
	[Awards] [varchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblStRegPrevSchoolDet_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblStRegPrevSchoolDet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLStudent]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLStudent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AcademicYear] [varchar](100) NOT NULL,
	[RegNo] [varchar](250) NOT NULL,
	[SRNo] [varchar](250) NULL,
	[JoiningDate] [date] NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[BatchID] [int] NOT NULL,
	[StreamID] [int] NOT NULL,
	[RollNo] [varchar](250) NOT NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[DOB] [date] NULL,
	[GenderID] [int] NULL,
	[BloodGroup] [varchar](50) NULL,
	[BirthPlace] [varchar](250) NULL,
	[Religion] [int] NULL,
	[Nationality] [varchar](50) NULL,
	[MotherTongue] [varchar](250) NULL,
	[Languages] [varchar](250) NULL,
	[CategoryID] [int] NULL,
	[CasteID] [int] NULL,
	[AadharNo] [nvarchar](50) NULL,
	[PermanentAddress] [varchar](max) NULL,
	[CorrespondAddress] [varchar](max) NULL,
	[PermPincode] [numeric](18, 0) NULL,
	[PermState] [varchar](100) NULL,
	[PermCity] [varchar](100) NULL,
	[CorsPincode] [numeric](18, 0) NULL,
	[CorsState] [varchar](100) NULL,
	[CorsCity] [varchar](100) NULL,
	[phone] [nvarchar](50) NULL,
	[SMSmobileNo] [nvarchar](50) NULL,
	[emailID] [varchar](250) NULL,
	[FatherName] [varchar](250) NULL,
	[FMobile] [nvarchar](50) NULL,
	[FJob] [varchar](250) NULL,
	[FDOB] [date] NULL,
	[FDesig] [varchar](100) NULL,
	[FNationality] [varchar](50) NULL,
	[FOfficeAddress] [varchar](max) NULL,
	[Fmail] [varchar](250) NULL,
	[FQualification] [int] NULL,
	[FAdharNo] [nvarchar](50) NULL,
	[MotherName] [varchar](250) NULL,
	[Mmobile] [nvarchar](50) NULL,
	[MJob] [varchar](250) NULL,
	[MDOB] [date] NULL,
	[MDesig] [varchar](100) NULL,
	[MNationality] [varchar](50) NULL,
	[MOfficeAddress] [varchar](max) NULL,
	[Mmail] [varchar](250) NULL,
	[MQualification] [int] NULL,
	[MAdharNo] [nvarchar](50) NULL,
	[FIncome] [nvarchar](250) NULL,
	[MIncome] [nvarchar](250) NULL,
	[GuardianName] [varchar](250) NULL,
	[Relation] [varchar](250) NULL,
	[GQualification] [int] NULL,
	[GJob] [varchar](250) NULL,
	[GIncome] [nvarchar](250) NULL,
	[GNationality] [varchar](50) NULL,
	[GDesig] [varchar](100) NULL,
	[Gmobile] [nvarchar](50) NULL,
	[GOfficeAddress] [varchar](max) NULL,
	[GAdharNo] [nvarchar](50) NULL,
	[Gmail] [varchar](250) NULL,
	[EmergencyNo] [nvarchar](50) NULL,
	[EmerContPerson] [varchar](250) NULL,
	[ContPersRelation] [varchar](100) NULL,
	[RouteID] [int] NULL,
	[DestinationID] [int] NULL,
	[PicPath] [varchar](max) NULL,
	[FPicPath] [varchar](max) NULL,
	[MPicPath] [varchar](max) NULL,
	[SUserID] [varchar](250) NULL,
	[SPwd] [varchar](250) NULL,
	[PUserID] [varchar](250) NULL,
	[PPwd] [varchar](250) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_TBLStudent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudentAttendence]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentAttendence](
	[AttendenceId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[AttendenceType] [nvarchar](150) NULL,
	[AttendenceDate] [date] NULL,
	[TeacherId] [bigint] NOT NULL,
	[ClassId] [bigint] NULL,
	[SectionId] [bigint] NOT NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[AttendenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBLStudentDocs]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLStudentDocs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[DocID] [bigint] NOT NULL,
	[DocPath] [varchar](max) NOT NULL,
	[Status] [int] NULL CONSTRAINT [DF_TBLStudentDocs_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TBLStudentDocs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBLStudentHealthDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBLStudentHealthDet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[VisionLeft] [float] NULL,
	[VisionRight] [float] NULL,
	[MedicationDetails] [varchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_TBLStudentHealthDet_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TBLStudentHealthDet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudentLeaveApply]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudentLeaveApply](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[datefrom] [date] NOT NULL,
	[dateto] [date] NOT NULL,
	[Reason] [varchar](max) NULL,
	[RequestDt] [date] NULL,
	[ApproveDt] [date] NULL,
	[ApprovedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblStudentLeaveApply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubject](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](max) NOT NULL,
	[SubCode] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblSubject_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubjectTeacherAllocate]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubjectTeacherAllocate](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectID] [bigint] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblSubjectTeacherAllocate_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblSubjectTeacherAllocate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubModule]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubModule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubModuleID] [int] NOT NULL,
	[SubModule] [varchar](100) NOT NULL,
	[ModuleID] [int] NOT NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_tblSubModule_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_tblSubModule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTaskDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[TaskPriority] [nvarchar](150) NULL,
	[TaskDate] [date] NULL,
	[UserType] [int] NULL,
	[Department] [bigint] NULL,
	[Employee] [bigint] NULL,
	[classId] [bigint] NULL,
	[SectionId] [bigint] NULL,
	[Student] [bigint] NULL,
	[Status] [nvarchar](150) NULL,
	[dateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaskToDo]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskToDo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](250) NULL,
	[Message] [nvarchar](max) NULL,
	[TaskDate] [date] NULL,
	[UserType] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaskToDoForEmployee]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaskToDoForEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](250) NULL,
	[Message] [nvarchar](max) NULL,
	[TaskDate] [date] NULL,
	[UserType] [nvarchar](100) NULL,
	[EmployeeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTeacherDiary]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeacherDiary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmpId] [bigint] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[startdate] [date] NULL,
	[endDate] [date] NULL,
	[startTime] [time](7) NULL,
	[endTime] [time](7) NULL,
	[backgroundcolor] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblThoughtsOfDay]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblThoughtsOfDay](
	[fldId] [int] IDENTITY(1,1) NOT NULL,
	[Thoughts] [nvarchar](max) NULL,
	[dateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[fldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTimeTable]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTimeTable](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CTDet_ID] [bigint] NULL,
	[CT_ID] [bigint] NULL,
	[TimeTableID] [bigint] NULL,
	[WeekDay] [varchar](10) NULL,
	[SubjectID] [bigint] NULL,
	[TeacherID] [int] NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblTimeTable_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblTimeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTimeTableConfig]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTimeTableConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[AcademicYear] [int] NULL,
	[ClassID] [int] NULL,
	[SectionID] [int] NULL,
	[StartDT] [date] NULL,
	[EndDt] [date] NULL,
	[WeekDays] [varchar](50) NULL,
	[CT_ID] [bigint] NULL,
	[Status] [int] NULL CONSTRAINT [DF_tblTimeTableConfig_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_tblTimeTableConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransExPayeeDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransExPayeeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExpDetailsId] [bigint] NOT NULL,
	[PayingAmount] [nvarchar](100) NULL,
	[PaymentDate] [date] NULL,
	[PaymentMode] [nvarchar](150) NULL,
	[chequeNo] [nvarchar](100) NULL,
	[ChequeDate] [date] NULL,
	[BankName] [nvarchar](250) NULL,
	[Remarks] [nvarchar](max) NULL,
	[datecreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTransportAllocation]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransportAllocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [nvarchar](50) NULL,
	[DestinationId] [nvarchar](50) NULL,
	[UserType] [nvarchar](100) NULL,
	[ClassId] [nvarchar](50) NULL,
	[SectionId] [nvarchar](50) NULL,
	[StudentId] [nvarchar](100) NULL,
	[DepId] [nvarchar](50) NULL,
	[EmployeeId] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
	[Status] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTransportDriver]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransportDriver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NULL,
	[DriveId] [int] NOT NULL,
	[PresentAddress] [nvarchar](max) NULL,
	[PermanentAddress] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[phone] [nvarchar](15) NULL,
	[LicenseNo] [nvarchar](150) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTransportVehicalDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransportVehicalDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicalNo] [nvarchar](150) NULL,
	[TotalSeats] [varchar](100) NULL,
	[AllowedSeats] [nvarchar](100) NULL,
	[OwnershipType] [nvarchar](150) NULL,
	[InsuranceDate] [nvarchar](100) NULL,
	[PollutionDate] [nvarchar](100) NULL,
	[TrackNumber] [nvarchar](100) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransRoute]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransRoute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NULL,
	[RouteCode] [nvarchar](150) NULL,
	[StartPlace] [nvarchar](150) NULL,
	[EndPlace] [nvarchar](150) NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [varchar](150) NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[DOB] [date] NOT NULL,
	[GenderID] [int] NOT NULL,
	[MaritalSatus] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Religion] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
	[DesigID] [int] NOT NULL,
	[StaffCategory] [int] NOT NULL,
	[Grade] [int] NOT NULL,
	[JobTitle] [varchar](250) NOT NULL,
	[JoiningDt] [date] NOT NULL,
	[Qualification] [int] NOT NULL,
	[Experience] [float] NOT NULL,
	[PresentAddress] [varchar](max) NOT NULL,
	[PermAddress] [varchar](max) NOT NULL,
	[City] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Country] [int] NOT NULL,
	[Pincode] [numeric](18, 0) NOT NULL,
	[Phone] [numeric](18, 0) NULL,
	[Mobile] [numeric](18, 0) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[AdharNo] [numeric](18, 0) NULL,
	[EmpType] [varchar](250) NOT NULL,
	[FatherName] [varchar](250) NULL,
	[MotherName] [varchar](250) NULL,
	[BloodGroup] [varchar](50) NULL,
	[PicPath] [varchar](max) NULL,
	[UserID] [varchar](100) NULL,
	[Pwd] [varchar](50) NULL,
	[BiometricID] [varchar](250) NULL,
	[Status] [int] NULL,
	[Signature] [varchar](max) NULL,
 CONSTRAINT [PK_TBLEmployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserType]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[status] [bit] NULL DEFAULT ((1)),
	[dataCreated] [datetime] NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWeekDays]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWeekDays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WeekDay] [varchar](50) NOT NULL,
	[DayID] [int] NOT NULL,
 CONSTRAINT [PK_tblWeekDays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AppointmentDiary] ON 

GO
INSERT [dbo].[AppointmentDiary] ([ID], [Title], [EmpID], [SomeImportantKey], [DateTimeScheduled], [AppointmentLength], [StatusENUM]) VALUES (1, N'popupEventForm', 1, 0, CAST(N'2017-11-27 00:00:00.000' AS DateTime), 456, 0)
GO
SET IDENTITY_INSERT [dbo].[AppointmentDiary] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAcademicYear] ON 

GO
INSERT [dbo].[tblAcademicYear] ([ID], [DateFrom], [DateTo], [Description], [UpdateDt], [Status]) VALUES (1, CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date), N'dsdw', CAST(N'2017-01-01' AS Date), 1)
GO
INSERT [dbo].[tblAcademicYear] ([ID], [DateFrom], [DateTo], [Description], [UpdateDt], [Status]) VALUES (3, CAST(N'2016-01-01' AS Date), CAST(N'2017-01-01' AS Date), N'resfs', CAST(N'2016-01-01' AS Date), 1)
GO
INSERT [dbo].[tblAcademicYear] ([ID], [DateFrom], [DateTo], [Description], [UpdateDt], [Status]) VALUES (4, CAST(N'2015-01-01' AS Date), CAST(N'2016-01-01' AS Date), N'dfdf', CAST(N'2016-01-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[tblAcademicYear] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAdvertisingVedio] ON 

GO
INSERT [dbo].[tblAdvertisingVedio] ([Id], [VedioUrl], [VedioDuration], [VedioTitle], [status]) VALUES (1, NULL, N'8', N'A', 1)
GO
SET IDENTITY_INSERT [dbo].[tblAdvertisingVedio] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBatch] ON 

GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (3, N'te', 1002, N'10/31/2017', N'11/23/2017', 4, 0, CAST(N'2017-11-16 11:17:37.347' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (5, N'001', 1, N'11/01/2017', N'11/29/2017', 250, 0, CAST(N'2017-11-16 11:56:40.750' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (6, N'wer', 1, N'11/06/2017', N'11/14/2017', 56, 1, CAST(N'2017-11-20 16:47:16.867' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (7, NULL, 1, NULL, NULL, NULL, 1, CAST(N'2017-11-21 11:42:51.070' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (8, N'2016-2017', 3, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:05:42.717' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (9, N'2016-2017', 4, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:20.090' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (10, N'2016-2017', 5, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:27.080' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (11, N'2016-2017', 6, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:30.287' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (12, N'2016-2017', 7, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:33.900' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (13, N'2016-2017', 8, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:37.370' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (14, N'2016-2017', 9, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:41.577' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (15, N'2016-2017', 10, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:45.057' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (16, N'2016-2017', 11, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:48.187' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (17, N'2016-2017', 12, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:51.007' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (18, N'2016-2017', 13, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:54.173' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (19, N'2016-2017', 14, N'04/01/2016', N'03/31/2017', 20, 1, CAST(N'2017-11-21 12:07:57.483' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (20, NULL, 0, NULL, NULL, NULL, 0, CAST(N'2018-01-10 13:20:33.997' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (21, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2018-01-10 13:25:51.127' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (22, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2018-01-10 13:26:49.893' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (23, NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2018-01-10 13:27:09.287' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (25, N'dfs', 3, N'01/01/2018', N'01/08/2018', 3, 1, CAST(N'2018-01-13 16:59:26.310' AS DateTime))
GO
INSERT [dbo].[tblBatch] ([Id], [BatchName], [ClassId], [StartDate], [EndDate], [MaxNoOfStudent], [Status], [DateCreated]) VALUES (26, N'dfs', 3, N'01/01/2018', N'01/08/2018', 3, 1, CAST(N'2018-01-13 16:59:30.910' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblBatch] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCastCategory] ON 

GO
INSERT [dbo].[tblCastCategory] ([CatId], [CategoryName], [Status]) VALUES (3, N'General', 1)
GO
INSERT [dbo].[tblCastCategory] ([CatId], [CategoryName], [Status]) VALUES (4, N'ST', 0)
GO
INSERT [dbo].[tblCastCategory] ([CatId], [CategoryName], [Status]) VALUES (5, N'SC', 1)
GO
INSERT [dbo].[tblCastCategory] ([CatId], [CategoryName], [Status]) VALUES (6, N'Other', 1)
GO
SET IDENTITY_INSERT [dbo].[tblCastCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCaste] ON 

GO
INSERT [dbo].[tblCaste] ([CasteId], [CasteName], [Status]) VALUES (3, N'Genral', 1)
GO
INSERT [dbo].[tblCaste] ([CasteId], [CasteName], [Status]) VALUES (4, N'SC', 1)
GO
INSERT [dbo].[tblCaste] ([CasteId], [CasteName], [Status]) VALUES (5, N'ST', 1)
GO
INSERT [dbo].[tblCaste] ([CasteId], [CasteName], [Status]) VALUES (6, N'Others', 1)
GO
INSERT [dbo].[tblCaste] ([CasteId], [CasteName], [Status]) VALUES (7, N'OBC', 1)
GO
SET IDENTITY_INSERT [dbo].[tblCaste] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 

GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (1, N'Mussoorie', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (2, N'Kausani', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (3, N'Dhanaulti', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (4, N'Nainital', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (5, N'Haridwar', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (6, N'Kotdwara', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[tblCity] ([Id], [CityName], [CountryId], [StateId], [Status], [Datecreated]) VALUES (7, N'Haldwani', 1, 12, 1, CAST(N'2018-04-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tblCity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassTeacherAllocation] ON 

GO
INSERT [dbo].[tblClassTeacherAllocation] ([ID], [ClassID], [SectionID], [EmpID], [Status], [intEmpID]) VALUES (1, 3, 4, NULL, 1, 1)
GO
INSERT [dbo].[tblClassTeacherAllocation] ([ID], [ClassID], [SectionID], [EmpID], [Status], [intEmpID]) VALUES (2, 3, 3, NULL, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[tblClassTeacherAllocation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassTiming] ON 

GO
INSERT [dbo].[tblClassTiming] ([ID], [Name], [Description], [Status]) VALUES (2, N'Time Table', N'', 1)
GO
INSERT [dbo].[tblClassTiming] ([ID], [Name], [Description], [Status]) VALUES (3, N'Second class', N'', 1)
GO
INSERT [dbo].[tblClassTiming] ([ID], [Name], [Description], [Status]) VALUES (4, N'Winter', N'Timings', 1)
GO
SET IDENTITY_INSERT [dbo].[tblClassTiming] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassTimingDet] ON 

GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (1, N'First', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (2, N'Second', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (3, N'Third', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (4, N'Fourth', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (5, N'Lunch Break', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (6, N'Sixth', CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (7, N'seventh', CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, 2, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (8, N'1 Peroid', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, 3, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (9, N'2nd Period', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, 3, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (10, N'Time 1', CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), 1, 4, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (11, N'test', CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), 1, 4, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (12, N'test', CAST(N'15:30:00' AS Time), CAST(N'16:30:00' AS Time), 0, 4, 1, NULL, NULL)
GO
INSERT [dbo].[tblClassTimingDet] ([ID], [Name], [STime], [ETime], [IsBreak], [CT_ID], [Status], [StartTime], [EndTime]) VALUES (13, N'dfgdf', CAST(N'16:15:00' AS Time), CAST(N'16:15:00' AS Time), 0, 4, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblClassTimingDet] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

GO
INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [Status]) VALUES (1, N'India', 0)
GO
INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [Status]) VALUES (2, N'Australia', 1)
GO
INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [Status]) VALUES (3, N'Brazil', 1)
GO
INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [Status]) VALUES (4, N'Canada', 1)
GO
INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [Status]) VALUES (5, N'China', 1)
GO
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCourses] ON 

GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (3, N'1', N'', N'First', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:54:40.767' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (4, N'2', N'', N'Second', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:55:26.797' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (5, N'3', N'', N'Third', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:55:43.343' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (6, N'4', N'', N'Fourth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:55:54.260' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (7, N'5', N'', N'Fifth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:02.777' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (8, N'6', N'', N'Sixth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:10.497' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (9, N'7', N'', N'Seventh', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:25.803' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (10, N'8', N'', N'Eighth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:39.960' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (11, N'9', N'', N'Ninth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:49.683' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (12, N'10', N'', N'Tenth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:56:56.883' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (13, N'11', N'', N'Eleventh', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:57:07.547' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (14, N'12', N'', N'Twelveth', N'90', N'Daily', N'220', N'', 1, CAST(N'2017-11-21 11:57:22.600' AS DateTime))
GO
INSERT [dbo].[tblCourses] ([Id], [CourseName], [CourseDesc], [Code], [MinimumAttendencPer], [AttendencType], [TotalWorkingDay], [SyllabusName], [Status], [DateCreated]) VALUES (15, N'sdfsd', N'sdfsd', N'sdfs', N'33', N'Daily', N'4', N'GPA', 1, CAST(N'2018-04-30 12:48:00.610' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDepartmnet] ON 

GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (2, N'Computer Science', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (3, N'Music', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (4, N'Personal Development', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (5, N'Expressive Arts', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (6, N'Physical Education', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (7, N'Visual Arts', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (8, N'Home Economics', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (9, N'Political Science', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (10, N'It', 1)
GO
INSERT [dbo].[tblDepartmnet] ([DepartmentId], [DepartmentName], [Status]) VALUES (11, N'Driving', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDepartmnet] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDesignation] ON 

GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (11, N'Principal', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (12, N'Vice Principal', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (13, N'Accountant', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (14, N'English literature teacher', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (15, N'English language teacher', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (16, N'Hindi language teacher', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (17, N'Hindi Literature teacher', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (18, N'Maths Teacher', 1)
GO
INSERT [dbo].[tblDesignation] ([DesigID], [Designation], [Status]) VALUES (19, N'Driver', 1)
GO
SET IDENTITY_INSERT [dbo].[tblDesignation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDocument] ON 

GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (1, N'Graduation Certificate', NULL, 1, N'3')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (2, N'Experience Letter', NULL, 1, N'3')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (3, N'Offer Letter', N'', 1, N'3')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (4, N'Salary Slip', NULL, 1, N'3')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (5, N'Proof of being a single parent', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (6, N'Transfer Certificate', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (7, N'Sibling certificate', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (8, N'Proof of address', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (9, N'Transfer Case of Parents (Applicable mainly for government employees, as per school terms)', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (10, N'Any other document', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (11, N'Proof of alumni', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (12, N'Birth Certificate', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (13, N'Passport size Photographs of the child/Mother/ Father/ Escort', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (14, N'Staff Quota', NULL, 1, N'4')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (15, N'Copy of Medical Certificate or Immunization Chart (as per school own terms)', NULL, 1, N'3')
GO
INSERT [dbo].[tblDocument] ([Id], [DocumentName], [DocumentDesc], [Status], [userId]) VALUES (16, N'Character certificate', NULL, 1, N'4')
GO
SET IDENTITY_INSERT [dbo].[tblDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDocumentNo] ON 

GO
INSERT [dbo].[tblDocumentNo] ([Id], [UserType], [Perfix], [Suffix], [DocumentNo], [StartSeries], [LastSeries], [Serprator], [Status], [DateCreated]) VALUES (1, N'Student', N'Reg', N'00', N'1', N'001', N'23', N'/', 1, CAST(N'2017-11-25' AS Date))
GO
INSERT [dbo].[tblDocumentNo] ([Id], [UserType], [Perfix], [Suffix], [DocumentNo], [StartSeries], [LastSeries], [Serprator], [Status], [DateCreated]) VALUES (2, N'Employee', N'Emp', N'00', N'1', N'001', N'26', N'/', 1, CAST(N'2017-11-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tblDocumentNo] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

GO
INSERT [dbo].[tblEmployee] ([Id], [Empcode], [JoiningDt], [DeptID], [DesigID], [Qualification], [Experience], [StaffCategory], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [UserID], [Pwd], [City], [State], [Country], [Pincode], [Phone], [Mobile], [Email], [PresentAddress], [PermAddress], [MaritalSatus], [AdharNo], [Religion], [FatherName], [MotherName], [Image], [BiometricID], [Status], [PaymentMod], [AccountNumber], [IFSCCode], [PFNo], [PANNO], [ESINO], [BankName]) VALUES (1, N'Emp/00/018', CAST(N'2018-06-05' AS Date), 2, 18, 6, 5, 1, N'Rahul', N'Prasad', N'Bharti', CAST(N'1994-06-05' AS Date), 1, N'rahul', N'321', 6, 12, 1, N'248001', N'', N'9536909129', N'bhartirahul90@gmail.com', N'Premnager Dehradun', N'Kotdwar', 1, N'224578521254875', 1, N'D.k Bharti', N'Anuradha Bharti', N'/Images/Employee/EmployyeImage/37150screencapture-aws-amazon-getting-started-projects-host-static-website-2018-03-23-10_24_28.png', NULL, 1, N'Cash', N'59550001100004117', N'OPUN220244', N'', N'', N'', N'PUNJAB AND SIND BANK')
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeAccountInformation] ON 

GO
INSERT [dbo].[tblEmployeeAccountInformation] ([Id], [DesignationId], [EmployeeId], [GradeId], [BankAccountName], [AccountNo], [IFSCCode], [PfNo], [PanNo], [ESINo], [DateCreated], [Status]) VALUES (1, 11, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-28 11:59:22.993' AS DateTime), 1)
GO
INSERT [dbo].[tblEmployeeAccountInformation] ([Id], [DesignationId], [EmployeeId], [GradeId], [BankAccountName], [AccountNo], [IFSCCode], [PfNo], [PanNo], [ESINo], [DateCreated], [Status]) VALUES (2, 11, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-28 11:59:48.127' AS DateTime), 1)
GO
INSERT [dbo].[tblEmployeeAccountInformation] ([Id], [DesignationId], [EmployeeId], [GradeId], [BankAccountName], [AccountNo], [IFSCCode], [PfNo], [PanNo], [ESINo], [DateCreated], [Status]) VALUES (3, 11, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-28 11:59:52.150' AS DateTime), 1)
GO
INSERT [dbo].[tblEmployeeAccountInformation] ([Id], [DesignationId], [EmployeeId], [GradeId], [BankAccountName], [AccountNo], [IFSCCode], [PfNo], [PanNo], [ESINo], [DateCreated], [Status]) VALUES (4, 18, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-28 17:06:27.077' AS DateTime), 1)
GO
INSERT [dbo].[tblEmployeeAccountInformation] ([Id], [DesignationId], [EmployeeId], [GradeId], [BankAccountName], [AccountNo], [IFSCCode], [PfNo], [PanNo], [ESINo], [DateCreated], [Status]) VALUES (5, 18, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-04-28 17:06:41.910' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeAccountInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeAttendence] ON 

GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (1, 1, 18, 2, N'', N'Present', CAST(N'2018-06-01' AS Date), CAST(N'2018-06-08 18:10:24.553' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (2, 1, 18, 2, N'', N'Present', CAST(N'2018-06-02' AS Date), CAST(N'2018-06-08 18:10:24.607' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (3, 1, 18, 2, N'', N'Present', CAST(N'2018-06-04' AS Date), CAST(N'2018-06-08 18:10:24.657' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (4, 1, 18, 2, N'', N'Present', CAST(N'2018-06-05' AS Date), CAST(N'2018-06-08 18:10:24.710' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (5, 1, 18, 2, N'', N'Present', CAST(N'2018-06-06' AS Date), CAST(N'2018-06-08 18:10:24.767' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (6, 1, 18, 2, N'', N'Present', CAST(N'2018-06-07' AS Date), CAST(N'2018-06-08 18:10:24.823' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (7, 1, 18, 2, N'', N'Present', CAST(N'2018-06-08' AS Date), CAST(N'2018-06-08 18:10:24.880' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (8, 1, 18, 2, N'', N'Present', CAST(N'2018-06-09' AS Date), CAST(N'2018-06-08 18:10:24.940' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (9, 1, 18, 2, N'', N'Present', CAST(N'2018-06-11' AS Date), CAST(N'2018-06-08 18:10:25.003' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (10, 1, 18, 2, N'', N'Present', CAST(N'2018-06-12' AS Date), CAST(N'2018-06-08 18:10:25.067' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (11, 1, 18, 2, N'', N'Present', CAST(N'2018-06-13' AS Date), CAST(N'2018-06-08 18:10:25.127' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (12, 1, 18, 2, N'', N'Present', CAST(N'2018-06-14' AS Date), CAST(N'2018-06-08 18:10:25.183' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (13, 1, 18, 2, N'', N'Present', CAST(N'2018-06-15' AS Date), CAST(N'2018-06-08 18:10:25.237' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (14, 1, 18, 2, N'', N'Present', CAST(N'2018-06-16' AS Date), CAST(N'2018-06-08 18:10:25.300' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (15, 1, 18, 2, N'', N'Present', CAST(N'2018-06-18' AS Date), CAST(N'2018-06-08 18:10:25.350' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (16, 1, 18, 2, N'', N'Absent', CAST(N'2018-06-19' AS Date), CAST(N'2018-06-08 18:10:25.413' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (17, 1, 18, 2, N'', N'Present', CAST(N'2018-06-20' AS Date), CAST(N'2018-06-08 18:10:25.463' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (18, 1, 18, 2, N'', N'Present', CAST(N'2018-06-21' AS Date), CAST(N'2018-06-08 18:10:25.563' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (19, 1, 18, 2, N'', N'Present', CAST(N'2018-06-22' AS Date), CAST(N'2018-06-08 18:10:25.620' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (20, 1, 18, 2, N'', N'Present', CAST(N'2018-06-23' AS Date), CAST(N'2018-06-08 18:10:25.687' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (21, 1, 18, 2, N'', N'Present', CAST(N'2018-06-25' AS Date), CAST(N'2018-06-08 18:10:25.750' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (22, 1, 18, 2, N'', N'Present', CAST(N'2018-06-26' AS Date), CAST(N'2018-06-08 18:10:25.800' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (23, 1, 18, 2, N'', N'Present', CAST(N'2018-06-27' AS Date), CAST(N'2018-06-08 18:10:25.863' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (24, 1, 18, 2, N'', N'Present', CAST(N'2018-06-28' AS Date), CAST(N'2018-06-08 18:10:25.920' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (25, 1, 18, 2, N'', N'Present', CAST(N'2018-06-29' AS Date), CAST(N'2018-06-08 18:10:25.980' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (26, 1, 18, 2, N'', N'Present', CAST(N'2018-06-30' AS Date), CAST(N'2018-06-08 18:10:26.030' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (27, 168, 19, 11, N'', N'Absent', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:14.450' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (28, 167, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:15.283' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (29, 166, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:16.153' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (30, 165, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:17.017' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (31, 164, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:17.980' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (32, 163, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:18.787' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (33, 162, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:19.577' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (34, 161, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:20.420' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (35, 160, 11, 4, N'', N'Absent', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:21.800' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (36, 159, 11, 3, N'', N'Absent', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:23.143' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (37, 158, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:24.540' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (38, 157, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:25.377' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (39, 156, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:26.527' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (40, 155, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:27.580' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (41, 154, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:28.617' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (42, 153, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:29.437' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (43, 152, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:30.620' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (44, 151, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:31.290' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (45, 150, 11, 3, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:32.190' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (46, 149, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:33.367' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (47, 148, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:35.163' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (48, 147, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:36.020' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (49, 146, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:36.890' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (50, 145, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:38.250' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (51, 144, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:39.120' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (52, 143, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:39.917' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (53, 142, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:40.940' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (54, 141, 11, 3, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:42.187' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (55, 140, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:43.230' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (56, 139, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:44.340' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (57, 138, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:45.207' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (58, 137, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:46.980' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (59, 136, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:48.503' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (60, 135, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:49.287' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (61, 134, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:50.197' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (62, 133, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:51.213' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (63, 130, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:51.980' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (64, 129, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:53.020' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (65, 128, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:53.800' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (66, 127, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:55.027' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (67, 126, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:55.737' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (68, 125, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:56.500' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (69, 124, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:57.390' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (70, 121, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:58.197' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (71, 120, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:00:59.413' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (72, 119, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:00.337' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (73, 118, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:00.880' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (74, 117, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:01.520' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (75, 116, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:02.220' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (76, 115, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:03.147' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (77, 112, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:04.033' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (78, 111, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:05.013' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (79, 110, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:05.813' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (80, 109, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:06.793' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (81, 108, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:08.440' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (82, 107, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:10.533' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (83, 106, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:12.550' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (84, 103, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:13.347' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (85, 102, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:14.150' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (86, 101, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:14.880' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (87, 100, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:15.890' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (88, 99, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:16.703' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (89, 98, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:17.647' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (90, 97, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:18.970' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (91, 94, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:20.900' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (92, 93, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:21.823' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (93, 92, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:22.460' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (94, 91, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:25.123' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (95, 90, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:26.667' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (96, 89, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:27.400' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (97, 88, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:28.067' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (98, 85, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:29.117' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (99, 84, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:29.890' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (100, 83, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:30.553' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (101, 82, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:31.150' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (102, 81, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:31.790' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (103, 80, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:32.347' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (104, 79, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:32.927' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (105, 76, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:33.560' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (106, 75, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:34.117' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (107, 74, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:34.830' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (108, 73, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:35.420' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (109, 72, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:36.073' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (110, 71, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:36.813' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (111, 70, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:37.800' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (112, 67, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:38.583' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (113, 66, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:39.170' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (114, 65, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:39.840' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (115, 64, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:40.440' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (116, 63, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:41.507' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (117, 62, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:42.267' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (118, 61, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:43.560' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (119, 58, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:44.300' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (120, 57, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:44.960' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (121, 56, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:45.697' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (122, 55, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:46.380' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (123, 54, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:47.637' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (124, 53, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:48.620' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (125, 52, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:49.880' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (126, 49, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:50.693' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (127, 48, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:52.097' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (128, 47, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:52.757' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (129, 46, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:53.410' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (130, 45, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:54.120' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (131, 44, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:54.847' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (132, 43, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:55.503' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (133, 40, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:56.147' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (134, 39, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:56.983' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (135, 38, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:57.783' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (136, 37, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:58.463' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (137, 36, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:59.093' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (138, 35, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:01:59.833' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (139, 34, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:01.200' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (140, 33, 11, 3, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:02.123' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (141, 32, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:02.850' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (142, 31, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:03.453' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (143, 30, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:04.067' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (144, 29, 11, 10, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:04.643' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (145, 28, 11, 9, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:05.310' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (146, 27, 11, 8, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:06.000' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (147, 26, 11, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:06.843' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (148, 25, 11, 4, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:07.757' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (149, 24, 11, 3, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:08.737' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (150, 23, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:09.630' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (151, 22, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:10.213' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (152, 21, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:10.993' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (153, 20, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:11.663' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (154, 17, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:12.727' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (155, 14, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:13.813' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (156, 11, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:14.640' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (157, 10, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:16.187' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (158, 5, 18, 7, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:17.210' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (159, 4, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:17.930' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (160, 3, 11, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:18.630' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (161, 2, 11, 3, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:19.237' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tblEmployeeAttendence] ([AttendenceId], [EmployeeId], [DesigId], [DepId], [LeaveType], [AttendenceType], [AttendenceDate], [DateCreated], [IsBiometric], [TimeIn], [TimeOut]) VALUES (162, 1, 18, 2, N'', N'Present', CAST(N'2018-07-14' AS Date), CAST(N'2018-07-14 13:02:20.097' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeAttendence] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeDocuments] ON 

GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1, 2, 1002, N'/Images/Employee/Documents/0587_12251company.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (2, 3, 1002, N'/Images/Employee/Documents/0587_12927check_false.gif', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (3, 4, 1002, N'/Images/Employee/Documents/0587_12754add.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (4, 1, 1002, N'/Images/Employee/Documents/0587_17313bottom.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (5, 3, 1003, N'/Images/Employee/Documents/005058_19228company.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (7, 15, 1003, N'/Images/Employee/Documents/005058_19278del.gif', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1002, 2, 2004, N'/Images/Employee/Documents/28154email.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1003, 3, 2004, N'/Images/Employee/Documents/28280del.gif', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1004, 4, 2004, N'/Images/Employee/Documents/28306bottom.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1005, 1, 2005, N'/Images/Employee/Documents/31318email.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1006, 2, 2006, N'/Images/Employee/Documents/34689check_false.gif', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1007, 1, 2011, N'/Images/Employee/Documents/48868admin.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1008, 1, 2017, N'/Images/Employee/Documents/39571Chrysanthemum.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1009, 2, 2017, N'/Images/Employee/Documents/3911Hydrangeas.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1010, 3, 2017, N'/Images/Employee/Documents/3984Tulips.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1012, 15, 2017, N'/Images/Employee/Documents/39231Tulips.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (6, 4, 1003, N'/Images/Employee/Documents/005058_19772cancel.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1011, 4, 2017, N'/Images/Employee/Documents/39142Lighthouse.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1013, 1, 1, N'/Images/Employee/Documents/37273screencapture-spos-tecdiary-products-add-2018-04-19-13_24_26.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1014, 2, 1, N'/Images/Employee/Documents/37343screencapture-spos-tecdiary-products-add-2018-04-19-13_24_26.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1015, 3, 1, N'/Images/Employee/Documents/37370Bigbucket.png', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1016, 4, 1, N'/Images/Employee/Documents/5433Tulips.jpg', 1)
GO
INSERT [dbo].[tblEmployeeDocuments] ([Id], [DocumentId], [EmployeeId], [DocImage], [Status]) VALUES (1017, 1, 3, N'/Images/Employee/Documents/8317screencapture-localhost-49209-portal-2018-03-31-13_27_54.png', 1)
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[tblemployeeLeaveRequest] ON 

GO
INSERT [dbo].[tblemployeeLeaveRequest] ([Id], [EmployeeID], [Department], [Designation], [LeaveType], [StatDate], [EndDate], [TakeLeaveCount], [Reason], [LeavStatus], [DateCreated]) VALUES (1, 1, 2, 18, 1, CAST(N'2018-07-05' AS Date), CAST(N'2018-07-06' AS Date), 2, N'5645', 4, CAST(N'2018-07-05 13:29:47.810' AS DateTime))
GO
INSERT [dbo].[tblemployeeLeaveRequest] ([Id], [EmployeeID], [Department], [Designation], [LeaveType], [StatDate], [EndDate], [TakeLeaveCount], [Reason], [LeavStatus], [DateCreated]) VALUES (2, 0, 2, 18, 1, CAST(N'2018-07-05' AS Date), CAST(N'2018-07-06' AS Date), 2, N'5645', 4, CAST(N'2018-07-05 13:38:22.067' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblemployeeLeaveRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeSalaryDetails] ON 

GO
INSERT [dbo].[tblEmployeeSalaryDetails] ([Id], [DesignationId], [EmployeeId], [FromDate], [toDate], [GradeId], [MonthlyGross], [MonthlyDeduction], [GrossEarning], [GrossDeduction], [NoOfLeave], [NetSalary], [totalDayInMonth], [salayDayInMonth], [Status], [DateCreated]) VALUES (1, 11, 2, CAST(N'2018-07-01' AS Date), CAST(N'2018-07-31' AS Date), 1, N'35000', N'2412', N'32741', N'2256', 2, N'30485', 31, 31, 1, CAST(N'2018-07-14 13:17:55.797' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeSalaryDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployyeMonthSalaryStructure] ON 

GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (1, 1, 1002, N'14032', N'Amount', N'Earning', CAST(N'2018-07-14 13:17:56.963' AS DateTime))
GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (2, 1, 1003, N'9355', N'Amount', N'Earning', CAST(N'2018-07-14 13:17:57.180' AS DateTime))
GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (3, 1, 1006, N'4677', N'Amount', N'Earning', CAST(N'2018-07-14 13:17:57.417' AS DateTime))
GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (4, 1, 1007, N'4677', N'Amount', N'Earning', CAST(N'2018-07-14 13:17:57.667' AS DateTime))
GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (5, 1, 1004, N'1684', N'Amount', N'Deduction', CAST(N'2018-07-14 13:17:57.867' AS DateTime))
GO
INSERT [dbo].[tblEmployyeMonthSalaryStructure] ([fldId], [salaryDetailId], [HeadId], [HeadAmount], [HeadType], [Salrytpe], [DateCreated]) VALUES (6, 1, 1005, N'573', N'Amount', N'Deduction', CAST(N'2018-07-14 13:17:58.093' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblEmployyeMonthSalaryStructure] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEventDetails] ON 

GO
INSERT [dbo].[tblEventDetails] ([EventId], [EventName], [EventType], [Description], [StartdateTime], [EnddateTime], [InchargeName], [EventFor], [courseId], [SectionId], [DepartmentId], [Status]) VALUES (14, N'New Event for Computer Science Department', 1003, N'test by rahul bharti', CAST(N'2018-02-01 04:15:00.000' AS DateTime), CAST(N'2018-02-16 16:15:00.000' AS DateTime), N'Rahul Bharti', N'3', N'', N'', 7, 1)
GO
INSERT [dbo].[tblEventDetails] ([EventId], [EventName], [EventType], [Description], [StartdateTime], [EnddateTime], [InchargeName], [EventFor], [courseId], [SectionId], [DepartmentId], [Status]) VALUES (17, N'Events Name', 1003, N'sdfds', CAST(N'2018-01-01 04:15:00.000' AS DateTime), CAST(N'2018-02-08 12:45:00.000' AS DateTime), N'sd', N'2', N'3', N'3', 0, 1)
GO
INSERT [dbo].[tblEventDetails] ([EventId], [EventName], [EventType], [Description], [StartdateTime], [EnddateTime], [InchargeName], [EventFor], [courseId], [SectionId], [DepartmentId], [Status]) VALUES (21, N'pimk', 1003, N'sadfdsa', CAST(N'2018-02-19 16:30:00.000' AS DateTime), CAST(N'2018-02-19 04:15:00.000' AS DateTime), N'test', N'1', N'', N'', 0, 1)
GO
INSERT [dbo].[tblEventDetails] ([EventId], [EventName], [EventType], [Description], [StartdateTime], [EnddateTime], [InchargeName], [EventFor], [courseId], [SectionId], [DepartmentId], [Status]) VALUES (22, N'Farewell Celebrations', 1003, N'deee', CAST(N'2018-04-20 13:00:00.000' AS DateTime), CAST(N'2018-04-20 17:00:00.000' AS DateTime), N'Akash', N'1', N'', N'', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[tblEventDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEventType] ON 

GO
INSERT [dbo].[tblEventType] ([EventId], [EventName], [Status]) VALUES (1003, N'Farewell', 1)
GO
INSERT [dbo].[tblEventType] ([EventId], [EventName], [Status]) VALUES (3003, N'sdfsd', 1)
GO
SET IDENTITY_INSERT [dbo].[tblEventType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblExPayeeDetails] ON 

GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (1, N'rahul', N'9', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-28' AS Date), N'1500', 2, N'500', N'0', CAST(N'2018-02-01' AS Date), N'Cash', NULL, NULL, NULL, N'', 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (2, N'Rahuol Bharti', N'9', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-23' AS Date), N'1500', 2, N'500', N'0', CAST(N'2018-02-22' AS Date), N'Cash', NULL, NULL, NULL, N'test', 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (3, N'test', N'9', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-02' AS Date), N'1500', 2, N'500', N'0', CAST(N'2018-02-21' AS Date), N'Cash', NULL, NULL, NULL, N'teste', 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (4, N'yess', N'9', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-09' AS Date), N'1500', 2, N'1000', N'500', CAST(N'2018-02-13' AS Date), N'Cash', NULL, NULL, NULL, N'sdf', 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (5, N'test', N'9', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-28' AS Date), N'1500', 3, N'0', N'1500', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (6, N'ashish shrama', N'10', CAST(N'2018-02-01' AS Date), CAST(N'2018-02-15' AS Date), N'1500', 3, N'0', N'1500', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (7, N'aakas', N'9', CAST(N'2018-02-14' AS Date), CAST(N'2018-02-14' AS Date), N'8000', 3, N'7000', N'1000', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (8, N'yees', N'9', CAST(N'2018-02-22' AS Date), CAST(N'2018-02-14' AS Date), N'3455', 2, N'3455', N'0', CAST(N'2018-02-22' AS Date), N'Cheque', N'897857', CAST(N'2018-02-28' AS Date), NULL, N'test', 0, NULL)
GO
INSERT [dbo].[tblExPayeeDetails] ([Id], [PayeeName], [CategoryId], [PrimaryDate], [LastDate], [TotalAmount], [PaymentType], [PayingAmount], [DuesAmount], [PaymentDate], [PaymentMode], [ChequeNo], [ChequeDate], [BankName], [Remarks], [Status], [dateCreated]) VALUES (9, N'rahul', N'9', CAST(N'2018-04-11' AS Date), CAST(N'2018-04-30' AS Date), N'1500', 2, N'0', N'1500', CAST(N'2018-04-23' AS Date), N'Cash', NULL, NULL, NULL, N'yuyt', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblExPayeeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblExpenseCategory] ON 

GO
INSERT [dbo].[tblExpenseCategory] ([Id], [CategoryName], [Status]) VALUES (9, N'Mobile Allowance', 1)
GO
INSERT [dbo].[tblExpenseCategory] ([Id], [CategoryName], [Status]) VALUES (10, N'Maintainence Allowance', 1)
GO
INSERT [dbo].[tblExpenseCategory] ([Id], [CategoryName], [Status]) VALUES (11, N'Food Allowance', 1)
GO
INSERT [dbo].[tblExpenseCategory] ([Id], [CategoryName], [Status]) VALUES (12, N'Recharg', 1)
GO
SET IDENTITY_INSERT [dbo].[tblExpenseCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeCalculate] ON 

GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (1, 1, N'January', 0, N'4500', N'4500', N'0', 2, CAST(N'2018-02-19 17:50:24.467' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (2, 1, N'February', 1, N'4500', N'4500', N'0', 2, CAST(N'2018-02-19 17:50:24.467' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (3, 1, N'March', 2, N'4500', N'3000', N'-1500', 2, CAST(N'2018-02-19 17:51:17.320' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (4, 1, N'March', 2, N'4500', N'1000', N'-500', 2, CAST(N'2018-02-19 17:51:52.950' AS DateTime), NULL, N'0', N'1500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (5, 1, N'March', 2, N'4500', N'500', N'0', 2, CAST(N'2018-02-19 17:52:27.907' AS DateTime), NULL, N'0', N'500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (6, 1, N'April', 3, N'4500', N'2800', N'-1700', 2, CAST(N'2018-02-19 17:53:12.777' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (7, 1, N'April', 3, N'4500', N'1000', N'-700', 2, CAST(N'2018-02-19 17:53:59.577' AS DateTime), NULL, N'0', N'1700', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (8, 1, N'January', 0, N'4500', N'4500', N'0', 4, CAST(N'2018-02-20 13:35:37.870' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (9, 1, N'February', 1, N'4500', N'4500', N'0', 4, CAST(N'2018-02-20 13:35:37.870' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (10, 1, N'March', 2, N'4500', N'4500', N'0', 4, CAST(N'2018-02-20 13:40:06.027' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (11, 1, N'April', 3, N'4500', N'100', N'-4400', 4, CAST(N'2018-02-20 13:40:06.027' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (12, 1, N'April', 3, N'4500', N'4400', N'0', 4, CAST(N'2018-02-20 13:40:51.583' AS DateTime), NULL, N'0', N'4400', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (13, 1, N'April', 3, N'4500', N'700', N'0', 2, CAST(N'2018-04-20 13:20:42.817' AS DateTime), NULL, N'0', N'700', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (14, 1, N'May', 4, N'4500', N'4000', N'-500', 2, CAST(N'2018-04-20 13:21:29.620' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (15, 1, N'May', 4, N'4500', N'500', N'0', 2, CAST(N'2018-04-20 13:22:01.393' AS DateTime), NULL, N'0', N'500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (16, 1, N'January', 0, N'4500', N'4500', N'0', 1, CAST(N'2018-04-20 14:11:21.683' AS DateTime), NULL, N'0', N'4500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (17, 1, N'February', 1, N'5000', N'4900', N'0', 1, CAST(N'2018-04-20 16:56:23.713' AS DateTime), N'2', N'100', N'4900', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (18, 1, N'March', 2, N'5500', N'5000', N'-500', 1, CAST(N'2018-04-23 13:08:48.213' AS DateTime), NULL, N'0', N'5500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (19, 1, N'March', 2, N'5500', N'500', N'0', 1, CAST(N'2018-04-23 13:09:01.820' AS DateTime), NULL, N'0', N'500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (20, 1, N'June', 5, N'5500', N'5500', N'0', 2, CAST(N'2018-07-14 13:39:26.913' AS DateTime), NULL, N'0', N'5500', NULL, 1, 2)
GO
INSERT [dbo].[tblFeeCalculate] ([fldId], [AcademicYear], [Months], [monthId], [monthlyAmount], [PaidAmount], [duesAmount], [fldstudentID], [dateCreated], [discountPer], [discountAmnt], [ActualPayableAmnt], [DiscountReason], [feePaid], [feeStructureID]) VALUES (21, 1, N'June', 5, N'5500', N'4500', N'-1000', 2, CAST(N'2018-07-14 13:39:26.913' AS DateTime), NULL, N'0', N'5500', NULL, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[tblFeeCalculate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeCategory] ON 

GO
INSERT [dbo].[tblFeeCategory] ([ID], [FeeCategory], [Cat_Desc], [Status]) VALUES (1, N'Tution Fee', N'Tution Fees hgfhh', 1)
GO
INSERT [dbo].[tblFeeCategory] ([ID], [FeeCategory], [Cat_Desc], [Status]) VALUES (2, N'Bus Fee', N'Bus Fee jkskdh', 1)
GO
INSERT [dbo].[tblFeeCategory] ([ID], [FeeCategory], [Cat_Desc], [Status]) VALUES (3, N'Hostel Fee', N'fdgdfg', 1)
GO
INSERT [dbo].[tblFeeCategory] ([ID], [FeeCategory], [Cat_Desc], [Status]) VALUES (4, N'Computer Fees', N'Computer Fees', 1)
GO
SET IDENTITY_INSERT [dbo].[tblFeeCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructure] ON 

GO
INSERT [dbo].[tblFeeStructure] ([ID], [StructureName], [AcademicYear], [Status]) VALUES (2, N'from 1 to 4', 1, 1)
GO
INSERT [dbo].[tblFeeStructure] ([ID], [StructureName], [AcademicYear], [Status]) VALUES (3, N'from 5 to 7', 1, 1)
GO
INSERT [dbo].[tblFeeStructure] ([ID], [StructureName], [AcademicYear], [Status]) VALUES (4, N'10-12', 1, 0)
GO
INSERT [dbo].[tblFeeStructure] ([ID], [StructureName], [AcademicYear], [Status]) VALUES (5, N'class 10-11 fee structure', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructure] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureAssign] ON 

GO
INSERT [dbo].[tblFeeStructureAssign] ([ID], [StudentID], [FeeStructureID], [isActive], [isDeleted], [DateCreated], [DateModified]) VALUES (1, 10, 3, 1, 0, CAST(N'2018-07-12 11:05:47.393' AS DateTime), CAST(N'2018-07-12 11:05:49.360' AS DateTime))
GO
INSERT [dbo].[tblFeeStructureAssign] ([ID], [StudentID], [FeeStructureID], [isActive], [isDeleted], [DateCreated], [DateModified]) VALUES (2, 1017, 3, 1, 0, CAST(N'2018-07-12 11:06:00.777' AS DateTime), CAST(N'2018-07-12 11:06:01.117' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureClasses] ON 

GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10011, 3, 3, 2)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10012, 3, 4, 2)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10013, 4, 5, 2)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10014, 4, 6, 2)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10015, 4, 7, 2)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10022, 7, 11, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10023, 7, 12, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10024, 8, 13, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10025, 8, 14, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10026, 9, 15, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10027, 9, 16, 3)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10037, 13, 43, 4)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10038, 14, 44, 4)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10039, 14, 45, 4)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10040, 12, 41, 5)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10041, 12, 42, 5)
GO
INSERT [dbo].[tblFeeStructureClasses] ([ID], [ClassID], [SectionID], [FeeStructureID]) VALUES (10042, 13, 43, 5)
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureConfig] ON 

GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (1, 1, N'2500', 2)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (2, 2, N'1000', 2)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (3, 1, N'1000', 3)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (4, 2, N'1500', 3)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (6, 3, N'4000', 3)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (7, 1, N'1500', 5)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (10, 4, N'1200', 5)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (11, 4, N'1500', 2)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (12, 2, N'600', 5)
GO
INSERT [dbo].[tblFeeStructureConfig] ([ID], [FeeCategory], [Amount], [FeeStructureID]) VALUES (13, 3, N'500', 2)
GO
SET IDENTITY_INSERT [dbo].[tblFeeStructureConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGender] ON 

GO
INSERT [dbo].[tblGender] ([gender_id], [GenderName], [status]) VALUES (1, N'Male', 1)
GO
INSERT [dbo].[tblGender] ([gender_id], [GenderName], [status]) VALUES (2, N'Female', 1)
GO
INSERT [dbo].[tblGender] ([gender_id], [GenderName], [status]) VALUES (3, N'Other', 1)
GO
SET IDENTITY_INSERT [dbo].[tblGender] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGradeAssignSalaryHead] ON 

GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (1, 1002, 1, N'15000', N'Amount', CAST(N'2018-07-14 13:15:32.130' AS DateTime), N'Earning')
GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (2, 1003, 1, N'10000', N'Amount', CAST(N'2018-07-14 13:15:32.370' AS DateTime), N'Earning')
GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (3, 1006, 1, N'5000', N'Amount', CAST(N'2018-07-14 13:15:32.680' AS DateTime), N'Earning')
GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (4, 1007, 1, N'5000', N'Amount', CAST(N'2018-07-14 13:15:33.140' AS DateTime), N'Earning')
GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (5, 1004, 1, N'12', N'Percent', CAST(N'2018-07-14 13:15:33.373' AS DateTime), N'Deduction')
GO
INSERT [dbo].[tblGradeAssignSalaryHead] ([Id], [HeadId], [GradeId], [Amount], [Type], [dateCreated], [headType]) VALUES (6, 1005, 1, N'1.75', N'Percent', CAST(N'2018-07-14 13:15:33.577' AS DateTime), N'Deduction')
GO
SET IDENTITY_INSERT [dbo].[tblGradeAssignSalaryHead] OFF
GO
SET IDENTITY_INSERT [dbo].[tblHomeAssignment] ON 

GO
INSERT [dbo].[tblHomeAssignment] ([ID], [AssignmentNm], [AssignmentDesc], [AcademicYear], [Class], [Section], [Subject], [Marks], [SubmitDt], [FilePath], [HW_Dt], [HW_givenBy], [Status]) VALUES (1, N'Test', N'tes', 1, 3, 4, 1, N'10                                                ', CAST(N'2018-07-25' AS Date), N'/Images/Assignments/1_b/Hindi/CertificateManager.png', CAST(N'2018-07-04' AS Date), 1, 1)
GO
INSERT [dbo].[tblHomeAssignment] ([ID], [AssignmentNm], [AssignmentDesc], [AcademicYear], [Class], [Section], [Subject], [Marks], [SubmitDt], [FilePath], [HW_Dt], [HW_givenBy], [Status]) VALUES (2, N'hindi', N'tests', 1, 3, 4, 1, N'                                                  ', CAST(N'2018-06-26' AS Date), N'/Images/Assignments/1_b/Hindi/TA_month_rep1.png', CAST(N'2018-07-05' AS Date), 1, 1)
GO
INSERT [dbo].[tblHomeAssignment] ([ID], [AssignmentNm], [AssignmentDesc], [AcademicYear], [Class], [Section], [Subject], [Marks], [SubmitDt], [FilePath], [HW_Dt], [HW_givenBy], [Status]) VALUES (3, N'asdfsa', N'fsa', 1, 3, 4, 1, N'                                                  ', CAST(N'2018-07-20' AS Date), N'/Images/Assignments/1_b/Hindi/permission_error.png', CAST(N'2018-07-05' AS Date), 1, 1)
GO
INSERT [dbo].[tblHomeAssignment] ([ID], [AssignmentNm], [AssignmentDesc], [AcademicYear], [Class], [Section], [Subject], [Marks], [SubmitDt], [FilePath], [HW_Dt], [HW_givenBy], [Status]) VALUES (4, N'rahul', NULL, 1, 3, 4, 1, N'                                                  ', CAST(N'2018-07-20' AS Date), NULL, CAST(N'2018-07-05' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblHomeAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLLanguages] ON 

GO
INSERT [dbo].[TBLLanguages] ([LangID], [Language], [Status]) VALUES (1, N'Hindi', 1)
GO
INSERT [dbo].[TBLLanguages] ([LangID], [Language], [Status]) VALUES (2, N'English', 1)
GO
INSERT [dbo].[TBLLanguages] ([LangID], [Language], [Status]) VALUES (3, N'Marathi', 1)
GO
INSERT [dbo].[TBLLanguages] ([LangID], [Language], [Status]) VALUES (4, N'Bengali', 1)
GO
INSERT [dbo].[TBLLanguages] ([LangID], [Language], [Status]) VALUES (5, N'Punjabi', 1)
GO
SET IDENTITY_INSERT [dbo].[TBLLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLeaveDetails] ON 

GO
INSERT [dbo].[tblLeaveDetails] ([Id], [LeaveCategory], [leaveDesgination], [leaveAssgin], [StartDate], [EndDate], [Status], [DateCreated]) VALUES (1, 1, 11, 4, CAST(N'2018-04-01' AS Date), CAST(N'2018-12-31' AS Date), 1, CAST(N'2018-04-20 12:47:03.917' AS DateTime))
GO
INSERT [dbo].[tblLeaveDetails] ([Id], [LeaveCategory], [leaveDesgination], [leaveAssgin], [StartDate], [EndDate], [Status], [DateCreated]) VALUES (2, 3, 11, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-12-31' AS Date), 1, CAST(N'2018-04-20 12:47:24.550' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblLeaveDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLeaveType] ON 

GO
INSERT [dbo].[tblLeaveType] ([LeaveId], [LeaveName], [Status]) VALUES (1, N'Sick Leave', 1)
GO
INSERT [dbo].[tblLeaveType] ([LeaveId], [LeaveName], [Status]) VALUES (3, N'Medical Leave', 1)
GO
INSERT [dbo].[tblLeaveType] ([LeaveId], [LeaveName], [Status]) VALUES (4, N'Unpaid', 1)
GO
SET IDENTITY_INSERT [dbo].[tblLeaveType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMaritalStatus] ON 

GO
INSERT [dbo].[tblMaritalStatus] ([Id], [Name], [Status]) VALUES (1, N'Married', 1)
GO
INSERT [dbo].[tblMaritalStatus] ([Id], [Name], [Status]) VALUES (2, N'Un-Married', 1)
GO
SET IDENTITY_INSERT [dbo].[tblMaritalStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMasterGrade] ON 

GO
INSERT [dbo].[tblMasterGrade] ([Id], [GradeName], [DesignationId], [Status], [datecreated]) VALUES (1, N'Grade A', 11, 1, CAST(N'2018-07-14 13:15:30.767' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblMasterGrade] OFF
GO
SET IDENTITY_INSERT [dbo].[tblModule] ON 

GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (1, 1, N'Employee Management', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (2, 2, N'Student Management', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (3, 3, N'Time Table', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (5, 4, N'Leave Management', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (8, 5, N'Attendance', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (9, 6, N'Events', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (10, 7, N'Tasks', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (11, 8, N'Notice', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (13, 9, N'Reports', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (14, 10, N'Payroll', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (15, 11, N'Accounts', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (16, 12, N'Fees', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (17, 13, N'Communications', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (18, 14, N'Import Export', 1)
GO
INSERT [dbo].[tblModule] ([ID], [ModuleID], [Module], [Status]) VALUES (19, 15, N'Transport', 1)
GO
SET IDENTITY_INSERT [dbo].[tblModule] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNoticeBoard] ON 

GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (1, N'Metting', CAST(N'2018-02-17' AS Date), N'rahul', N'G', N'/Images/Noticeboard/21816Chrysanthemum.jpg', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (2, N'Global Event on Sports', CAST(N'2018-02-12' AS Date), N'Sports Event in Next Week. Interested student complete reg', N'S', N'/Images/Noticeboard/22822Jellyfish.jpg', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (3, N'Sports Week', CAST(N'2018-02-17' AS Date), N'Please enroll your name for sports week starting from 3-10-20', N'E', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (4, N'Fees Payment', CAST(N'2018-02-17' AS Date), N'Please pay Fees of your Son/Daughter before 30-09-2016', N'S', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (5, N'Tomorow Parents Seminar', CAST(N'2018-07-27' AS Date), N'Special Meeting Seminar', N'G', N'/Images/Noticeboard/15650screencapture-s3-console-aws-amazon-s3-buckets-elasticbeanstalk-us-west-2-250756774621-2018-03-23-10_49_52.png', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (7, N'cghfh', CAST(N'2018-04-24' AS Date), N'fghfg', N'G', N'/Images/Noticeboard/43274Untitled.png', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (8, N'dsa', CAST(N'2018-07-11' AS Date), N'sdfsaf', N'G', N'/Images/Noticeboard/57401TA_month_rep2.png', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (9, N'test', CAST(N'2018-07-04' AS Date), N'test by rahul bharti', N'S', N'/Images/Noticeboard/9319TAreport_tabcontent.png', 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (11, N'Tile is here', CAST(N'2018-06-26' AS Date), N'Description is herer', N'S', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (12, N'Principle Meeting', CAST(N'2018-07-11' AS Date), N'all student Please Reach in PlayGround', N'G', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (13, N'sdfgsd', CAST(N'2018-07-02' AS Date), N'sfdgsdgf', N'G', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (14, N'asdfsa', CAST(N'2018-07-17' AS Date), N'asdfasdf', N'G', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (15, N'asdfsaf', CAST(N'2018-07-03' AS Date), N'sfsadf', N'G', NULL, 1, NULL)
GO
INSERT [dbo].[tblNoticeBoard] ([Id], [Title], [NoticeDate], [description], [userType], [NoticeFile], [status], [dateCreated]) VALUES (16, N'Notice 1st', CAST(N'2018-07-18' AS Date), N'sdfsdf', N'G', N'/Images/Noticeboard/7836CertificateManager.png', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblNoticeBoard] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLPrevSchoolDet] ON 

GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (1, N'1990', N'hfghfgh', N'hfghfghh', 4, 2, N'hfghfh', N'hgfh54355', N'hfghfhghf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (2, N'1991', N'hfghfh', N'hfghfh', 5, 2, N'hfghfgh', NULL, N'hfghfhghf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (3, N'1992', N'hfghfgh', NULL, 6, 2, N'hfghf', NULL, N'hfghfhghf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (4, N'1991', N'wg', N'dfsgds', 3, 1, N'58', N'64645', N'dfdsaf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (5, N'1990', N'dfsg', N'gdf', 3, 1, N'58', NULL, N'dfdsaf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (6, N'1992', N'dsgsdfg', NULL, 4, 1, N'85', NULL, N'dfdsaf', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (7, N'1992', N'asdf', N'456', 3, 2, N'6456', N'', N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (8, N'2003', N'sadfas', N'456', 3, 2, N'45645', NULL, N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (9, N'2004', N'dfsad', NULL, 14, 2, N'45645', NULL, N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (10, N'1990', N'mvn Public School', N'UK', 3, 5, N'50', N'', N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (11, N'-1', N'', N'', -1, 5, N'', NULL, N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (12, N'-1', N'', NULL, -1, 5, N'', NULL, N'', NULL)
GO
INSERT [dbo].[TBLPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (13, N'1993', N'', N'', 3, 6, N'', N'', N'', NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLPrevSchoolDet] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQualifications] ON 

GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (3, N'Nursery Teacher Training (NTT)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (4, N'Bachelor of Elementary Education(B.EL.ED)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (5, N'Diploma in Elementary Education(D.EL.ED)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (6, N'Bachelor of Education(B.Ed)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (7, N'Bachelor of Physical Education(B.P.ED)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (8, N'Post Graduate Teacher(PGT)', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (9, N'CTET', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (10, N'NTT', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (11, N'STET', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (12, N'TGT', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (13, N'PRT', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (14, N'BTC', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (15, N'B.Sc', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (16, N'10th Pass', 1)
GO
INSERT [dbo].[tblQualifications] ([QualificationId], [QualificationName], [Status]) VALUES (17, N'12th Pass', 1)
GO
SET IDENTITY_INSERT [dbo].[tblQualifications] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReligion] ON 

GO
INSERT [dbo].[tblReligion] ([ReligionId], [ReligionName], [Status]) VALUES (1, N'Hindu', 1)
GO
INSERT [dbo].[tblReligion] ([ReligionId], [ReligionName], [Status]) VALUES (2, N'Muslim', 1)
GO
INSERT [dbo].[tblReligion] ([ReligionId], [ReligionName], [Status]) VALUES (3, N'Sikh', 1)
GO
INSERT [dbo].[tblReligion] ([ReligionId], [ReligionName], [Status]) VALUES (4, N'Isai', 1)
GO
SET IDENTITY_INSERT [dbo].[tblReligion] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoleAssign] ON 

GO
INSERT [dbo].[tblRoleAssign] ([RoleID], [RoleName], [EmpID]) VALUES (2, N'Admin_Fees', 3)
GO
INSERT [dbo].[tblRoleAssign] ([RoleID], [RoleName], [EmpID]) VALUES (3, N'Admin1', 1)
GO
INSERT [dbo].[tblRoleAssign] ([RoleID], [RoleName], [EmpID]) VALUES (5, N'teset', 2)
GO
SET IDENTITY_INSERT [dbo].[tblRoleAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoleMaster] ON 

GO
INSERT [dbo].[tblRoleMaster] ([Role_id], [RoleName], [Status]) VALUES (4, N'Accountant', 1)
GO
INSERT [dbo].[tblRoleMaster] ([Role_id], [RoleName], [Status]) VALUES (5, N'ERP MANAGER', 1)
GO
INSERT [dbo].[tblRoleMaster] ([Role_id], [RoleName], [Status]) VALUES (6, N'ERP Admin', 1)
GO
INSERT [dbo].[tblRoleMaster] ([Role_id], [RoleName], [Status]) VALUES (7, N'Librarian', 1)
GO
INSERT [dbo].[tblRoleMaster] ([Role_id], [RoleName], [Status]) VALUES (8, N'Guard', 1)
GO
SET IDENTITY_INSERT [dbo].[tblRoleMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoleSubModAssign] ON 

GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (3, 2, 12, 33)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (4, 2, 12, 34)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (5, 2, 12, 35)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (6, 3, 8, 25)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (13, 5, 1, 1)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (14, 5, 1, 2)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (15, 5, 1, 3)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (16, 5, 1, 4)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (17, 5, 1, 5)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (18, 5, 1, 23)
GO
INSERT [dbo].[tblRoleSubModAssign] ([ID], [RoleID], [ModuleID], [SubmoduleID]) VALUES (19, 5, 2, 6)
GO
SET IDENTITY_INSERT [dbo].[tblRoleSubModAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoteDestination] ON 

GO
INSERT [dbo].[tblRoteDestination] ([Id], [RouteId], [PickAndDrop], [StopTime], [DateCreated]) VALUES (1, 3, N'Bindaal Bridge', N'11:30 AM', CAST(N'2018-06-30 13:03:53.750' AS DateTime))
GO
INSERT [dbo].[tblRoteDestination] ([Id], [RouteId], [PickAndDrop], [StopTime], [DateCreated]) VALUES (2, 4, N'dehradun-Delhi', N'2:15 PM', CAST(N'2018-07-12 14:02:58.833' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblRoteDestination] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSalaryHead] ON 

GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1002, N'Earning', N'Basic', N'001', 1)
GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1003, N'Earning', N'HRA', N'002', 1)
GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1004, N'Deduction', N'PF', N'1000', 1)
GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1005, N'Deduction', N'ESI', N'1300', 1)
GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1006, N'Earning', N'CA', N'0210', 1)
GO
INSERT [dbo].[tblSalaryHead] ([Id], [SalaryType], [Name], [Code], [Status]) VALUES (1007, N'Earning', N'SA', N'SA', 1)
GO
SET IDENTITY_INSERT [dbo].[tblSalaryHead] OFF
GO
SET IDENTITY_INSERT [dbo].[tblScholarRegister] ON 

GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (1, NULL, 1035, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (2, NULL, 1036, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (3, NULL, 1037, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (4, NULL, 1038, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (5, NULL, 1039, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (6, NULL, 1040, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (7, NULL, 1041, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (8, NULL, 1042, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (9, NULL, 1043, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (10, NULL, 1044, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (11, NULL, 1045, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (12, NULL, 1046, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (13, NULL, 1047, NULL, NULL, 1, CAST(N'2018-06-19' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (14, NULL, 1048, NULL, NULL, 1, CAST(N'2018-06-20' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (15, NULL, 1049, NULL, NULL, 1, CAST(N'2018-06-20' AS Date))
GO
INSERT [dbo].[tblScholarRegister] ([ID], [SRno], [StudentID], [WithdrawalNo], [TCNo], [Status], [ModifiedDate]) VALUES (16, NULL, 1050, NULL, NULL, 1, CAST(N'2018-06-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tblScholarRegister] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSchoolDetails] ON 

GO
INSERT [dbo].[tblSchoolDetails] ([ID], [School], [SchoolCode], [Address], [State], [City], [District], [Board], [Pincode], [Phone], [Fax], [Mobile], [Email], [Website], [LogoPic], [PrincipalID], [DateCreated]) VALUES (1, N'Maharishi Vidhya Mandir School', N'#MH0021', N'Premnagar Nanadai ki chowki Poundha Road Dehradun', 3003, N'Dehradun', N'Dehradun', N'CBSE', 248001, N'8958955065', N'8978974588', N'9536909129', N'bhartirahul90@gmail.com', N'www.exampreprations.com', N'/Images/Admin/AdmitCards/55957logo.png', 11, CAST(N'2018-02-19 17:55:06.773' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblSchoolDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSections] ON 

GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (1, N'B', 1, 1, CAST(N'2017-12-06 11:15:09.013' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (2, N'B', 1, 1, CAST(N'2017-12-06 11:15:09.073' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (3, N'a', 3, 1, CAST(N'2017-12-06 11:15:09.120' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (4, N'b', 3, 1, CAST(N'2017-12-06 11:15:09.167' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (5, N'd', 4, 1, CAST(N'2017-12-06 11:15:09.207' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (6, N'a', 4, 1, CAST(N'2017-12-06 11:15:09.247' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (7, N'b', 4, 1, CAST(N'2017-12-06 11:15:09.290' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (8, N'c', 5, 1, CAST(N'2017-12-06 11:15:09.347' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (9, N'a', 5, 1, CAST(N'2017-12-06 11:15:09.387' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (10, N'd', 6, 1, CAST(N'2017-12-06 11:15:09.447' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (11, N'c', 7, 1, CAST(N'2017-12-06 11:15:09.487' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (12, N'a', 7, 1, CAST(N'2017-12-06 11:15:09.530' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (13, N'a', 8, 1, CAST(N'2017-12-06 11:15:09.570' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (14, N'c', 8, 1, CAST(N'2017-12-06 11:15:09.613' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (15, N'd', 9, 1, CAST(N'2017-12-06 11:15:09.653' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (16, N'b', 9, 1, CAST(N'2017-12-06 11:15:09.697' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (17, N'a', 10, 1, CAST(N'2017-12-06 11:15:09.737' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (18, N'b', 10, 1, CAST(N'2017-12-06 11:15:09.783' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (19, N'd', 10, 1, CAST(N'2017-12-06 11:15:09.823' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (20, N'd', 11, 1, CAST(N'2017-12-06 11:15:09.863' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (21, N'b', 11, 1, CAST(N'2017-12-06 11:15:09.903' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (22, N'd', 12, 1, CAST(N'2017-12-06 11:15:09.947' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (23, N'b', 12, 1, CAST(N'2017-12-06 11:15:09.990' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (24, N'b', 13, 1, CAST(N'2017-12-06 11:15:10.030' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (25, N'd', 13, 1, CAST(N'2017-12-06 11:15:10.073' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (26, N'b', 14, 1, CAST(N'2017-12-06 11:15:10.113' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (27, N'c', 14, 1, CAST(N'2017-12-06 11:15:10.153' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (28, N'c', 4, 1, CAST(N'2017-12-06 11:15:10.200' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (29, N'd', 5, 1, CAST(N'2017-12-06 11:15:10.250' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (30, N'b', 5, 1, CAST(N'2017-12-06 11:15:10.293' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (31, N'a', 6, 1, CAST(N'2017-12-06 11:15:10.333' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (32, N'c', 6, 1, CAST(N'2017-12-06 11:15:10.373' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (33, N'd', 7, 1, CAST(N'2017-12-06 11:15:10.420' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (34, N'b', 7, 1, CAST(N'2017-12-06 11:15:10.460' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (35, N'b', 8, 1, CAST(N'2017-12-06 11:15:10.520' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (36, N'd', 8, 1, CAST(N'2017-12-06 11:15:10.563' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (37, N'a', 9, 1, CAST(N'2017-12-06 11:15:10.603' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (38, N'c', 10, 1, CAST(N'2017-12-06 11:15:10.650' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (39, N'a', 11, 1, CAST(N'2017-12-06 11:15:10.693' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (40, N'c', 11, 1, CAST(N'2017-12-06 11:15:10.737' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (41, N'a', 12, 1, CAST(N'2017-12-06 11:15:10.780' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (42, N'c', 12, 1, CAST(N'2017-12-06 11:15:10.830' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (43, N'c', 13, 1, CAST(N'2017-12-06 11:15:10.880' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (44, N'd', 14, 1, CAST(N'2017-12-06 11:15:10.920' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (45, N'a', 14, 1, CAST(N'2017-12-06 11:15:10.960' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (46, N'd', 14, 1, CAST(N'2017-12-06 11:15:11.003' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (47, N'b', 6, 1, CAST(N'2017-12-06 11:15:11.050' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (48, N'c', 9, 1, CAST(N'2017-12-06 11:15:11.090' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (49, N'a', 13, 1, CAST(N'2017-12-06 11:15:11.130' AS DateTime))
GO
INSERT [dbo].[tblSections] ([Id], [SectionName], [ClassId], [Status], [DateCreated]) VALUES (51, N'f', 3, 1, CAST(N'2018-01-22 15:44:15.040' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblSections] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStaffCategory] ON 

GO
INSERT [dbo].[tblStaffCategory] ([Id], [Name], [Status]) VALUES (1, N'Teaching', 1)
GO
INSERT [dbo].[tblStaffCategory] ([Id], [Name], [Status]) VALUES (2, N'Non-Teaching', 1)
GO
SET IDENTITY_INSERT [dbo].[tblStaffCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblState] ON 

GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (1, N'Andhra Pradesh', 1, 0)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (2, N'Arunachal Pradesh', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (3, N'Assam', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (4, N'Bihar', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (5, N'Chhattisgarh', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (6, N'Goa', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (7, N'Gujarat', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (8, N'Haryana', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (9, N'Haryana', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (10, N'Himachal Pradesh', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (11, N'Jammu & Kashmir', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (12, N'Uttarakhand', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (13, N'Uttar Pradesh', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (24, N'adf', 1, 1)
GO
INSERT [dbo].[tblState] ([StateId], [StateName], [countryId], [status]) VALUES (25, N'asfa', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblState] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (3, N'Active', 1, 0, 1)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (4, N'Pending', 1, 1, 1)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (5, N'Approved', 1, 1, 1)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (6, N'UnApproved', 1, 1, 1)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (7, N'Assigned', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (8, N'Inactive', 1, 0, 1)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (9, N'Compete', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (10, N'UnIncomplete', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (11, N'UnAssigned', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (12, N'Ok', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (13, N'Issue', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (14, N'Returned', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (15, N'Proposed', 1, 0, 0)
GO
INSERT [dbo].[tblStatus] ([StatusID], [Status], [stStatus], [LeaveStatus], [StudentStatus]) VALUES (16, N'Sheduled', 1, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStream] ON 

GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (1, 1, N'Commerce', 0)
GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (2, 1, N'Commerce', 0)
GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (3, 2, N'Science', 1)
GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (4, 2, N'Others', 1)
GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (5, 3, N'Science', 1)
GO
INSERT [dbo].[tblStream] ([Id], [Class], [StreamName], [Status]) VALUES (6, 3, N'Commerce', 1)
GO
SET IDENTITY_INSERT [dbo].[tblStream] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStRegDocs] ON 

GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (1, 1, 6, N'/Images/StRegistration/1_Anjaney/Docs/Transfer Certificate1.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (3, 1, 12, N'/Images/StRegistration/1_Anjaney/Docs/Birth Certificate1.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (4, 2, 12, N'/Images/StRegistration/2_Raghav/Docs/Birth Certificate2.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (5, 2, 8, N'/Images/StRegistration/2_Raghav/Docs/Proof of address2.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (6, 3, 12, N'/Images/StRegistration/3_Ruchika/Docs/Birth Certificate3.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (7, 3, 12, N'/Images/StRegistration/3_Ruchika/Docs/Birth Certificate3.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (8, 4, 6, N'/Images/StRegistration/4_Ajinkya/Docs/Transfer Certificate4.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (10, 4, 12, N'/Images/StRegistration/4_Ajinkya/Docs/Birth Certificate4.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (11, 5, 8, N'/Images/StRegistration/5_Rahul/Docs/Proof of address5.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (13, 5, 12, N'/Images/StRegistration/5_Rahul/Docs/Birth Certificate5.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (14, 6, 6, N'/Images/StRegistration/6_tete/Docs/Transfer Certificate6.png', 1)
GO
INSERT [dbo].[tblStRegDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (15, 6, 7, N'/Images/StRegistration/6_tete/Docs/Sibling certificate6.png', 1)
GO
SET IDENTITY_INSERT [dbo].[tblStRegDocs] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStRegHealthDet] ON 

GO
INSERT [dbo].[tblStRegHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (1, 1, 4, 3, 4, 3, N'reff', NULL)
GO
INSERT [dbo].[tblStRegHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (2, 2, 4, 3, 3, 4, N'fdfgdfg', NULL)
GO
INSERT [dbo].[tblStRegHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (3, 3, 43, 43, 3, 23, N'ffdgd', NULL)
GO
INSERT [dbo].[tblStRegHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (4, 4, 45, 33, 33, 33, N'33434', NULL)
GO
INSERT [dbo].[tblStRegHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (5, 5, 453, 434, 4, 4, N'4ff', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblStRegHealthDet] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStRegistration] ON 

GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (1, 3, -1, N'Anjaney', N'Kumar', N'Singh', CAST(N'2018-05-01' AS Date), 1, N'B+', N'fddsfdsf', 1, N'Indian', N'fdsfsdf', N'1', 3, N'5435345', N'fdsfsdf', N'fdsfsdf', CAST(4234332 AS Numeric(18, 0)), N'3003', N'fdsfs', CAST(4234332 AS Numeric(18, 0)), N'3003', N'fdsfs', NULL, N'4353455', NULL, N'Ranjan', N'5435345', N'fsfs', NULL, N'fsf', N'Indian', N'ffsfsd', N'fddfgdfg', 4, N'45345345', N'Maya', N'53534', N'fdsf', NULL, N'fsdf', N'Indian', N'dsfs', N'gdfgdf', 5, N'43242444', N'32432452', N'543535', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'43253245', N'fsdfdsf', N'4fdsf', N'/Images/StRegistration/1_Anjaney/Student/Anjaney1.png', N'/Images/StRegistration/1_Anjaney/Father/Ranjan1.jpg', N'/Images/StRegistration/1_Anjaney/Mother/Maya1.jpg', NULL, NULL, NULL, NULL, 17)
GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (2, 5, 0, N'Raghav', N'Kumar', N'Sen', NULL, 1, N'A-', N'ffdg', -1, N'----Select----', N'', N'1', -1, N'5435', N'rsereswr', N'rsereswr', CAST(54535 AS Numeric(18, 0)), N'1', N'fddfg', CAST(54535 AS Numeric(18, 0)), N'1', N'fddfg', NULL, N'4432434', NULL, N'tretredte', N'', N'', CAST(N'2018-12-01' AS Date), N'', N'Others', N'gfgfh', N'', 5, N'', N'gfdgd', N'', N'', CAST(N'2018-06-01' AS Date), N'', N'Indian', N'', N'', 4, N'', N'', N'', N'trtggfg', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'543535', N'gggf', N'hgfhf', N'/Images/StRegistration/2_Raghav/Student/Raghav2.png', N'/Images/StRegistration/2_Raghav/Father/tretredte2.png', N'/Images/StRegistration/2_Raghav/Mother/gfdgd2.png', NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (3, 5, 0, N'Ruchika', N'', N'', NULL, 2, N'B+', N'', -1, N'----Select----', N'', N'1', -1, N'ff3213213', N'ffdfg', N'ffdfg', CAST(43244 AS Numeric(18, 0)), N'3', N'gfdg', CAST(43244 AS Numeric(18, 0)), N'3', N'gfdg', NULL, N'434343', NULL, N'Kumar', N'3213123', N'', NULL, N'', N'----Select----', N'', N'', -1, N'32424', N'Nisha', N'432424', N'', NULL, N'', N'----Select----', N'', N'', -1, N'4324234', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'', N'', N'', N'/Images/StRegistration/3_Ruchika/Student/Ruchika3.png', N'/Images/StRegistration/3_Ruchika/Father/Kumar3.png', N'/Images/StRegistration/3_Ruchika/Mother/Nisha3.png', NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (4, 5, 0, N'Ajinkya', N'', N'', NULL, -1, N'----Select----', N'', -1, N'----Select----', N'', N'1', -1, N'', N'dfsfsd', N'dfsfsd', CAST(432423 AS Numeric(18, 0)), N'1004', N'fdsf', CAST(432423 AS Numeric(18, 0)), N'1004', N'fdsf', NULL, N'454355', NULL, N'Rajul', N'', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'lata', N'', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'', N'', N'', N'/Images/StRegistration/4_Ajinkya/Student/Ajinkya4.png', N'/Images/StRegistration/4_Ajinkya/Father/Rajul4.png', N'/Images/StRegistration/4_Ajinkya/Mother/lata4.png', NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (5, 6, 0, N'Rahul', N'', N'', NULL, -1, N'----Select----', N'', -1, N'----Select----', N'', N'1', -1, N'', N'fdsfsdf', N'fdsfsdf', CAST(3253444 AS Numeric(18, 0)), N'3003', N'fsdfs', CAST(3253444 AS Numeric(18, 0)), N'3003', N'fsdfs', NULL, N'8768567744', NULL, N'Kaushal', N'43253', N'', NULL, N'', N'----Select----', N'', N'', -1, N'54353', N'Vandana', N'53453', N'', NULL, N'', N'----Select----', N'', N'', -1, N'43435', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'', N'', N'', N'/Images/StRegistration/5_Rahul/Student/Rahul5.png', N'/Images/StRegistration/5_Rahul/Father/Kaushal5.png', N'/Images/StRegistration/5_Rahul/Mother/Vandana5.png', NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[tblStRegistration] ([ID], [ClassID], [StreamID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [PicPath], [FPicPath], [MPicPath], [RegCode], [SPwd], [ActionTakenBy], [ActionDt], [Status]) VALUES (6, 3, -1, N'tete', N'rwrw', N'tet', NULL, 1, N'A+', N'ded', 1, N'Indian', N'fsdf', N'1,2', 3, N'2480012458', N'dasgfd', N'dasgfd', CAST(345435 AS Numeric(18, 0)), N'1', N'sadf', CAST(345435 AS Numeric(18, 0)), N'1', N'sadf', NULL, N'345sdfetr4354', NULL, N'test', N'3434545', N'3453', NULL, N'3453', N'Indian', N'345', N'test@gmail.com', 3, N'46456456', N'testtest', N'', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'345', N'', N'tteset', N'we', -1, N'', N'', N'Indian', N'', N'', N'', N'', N'', N'657678678', N'65675675', N'567567', N'/Images/StRegistration/6_tete/Student/tete6.png', N'/Images/StRegistration/6_tete/Father/test6.png', N'/Images/StRegistration/6_tete/Mother/testtest6.png', NULL, NULL, NULL, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[tblStRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStRegPrevSchoolDet] ON 

GO
INSERT [dbo].[tblStRegPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (1, N'1992', N'thfghfgh', N'hgfhfh', 3, 2, N'hfghfh', N'456tr', N'hfghf', 17)
GO
INSERT [dbo].[tblStRegPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (2, N'2000', N'gfhffg', N'hghfg', 6, 2, N'hfghf', N'543534', N'hfghf', 17)
GO
INSERT [dbo].[tblStRegPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (3, N'2005', N'rtere', N'uk', 12, 6, N'59.53', N'34', N'asf', 17)
GO
INSERT [dbo].[tblStRegPrevSchoolDet] ([ID], [PSYear], [School], [Board], [Class], [StudentID], [Marks], [TCNo], [Awards], [Status]) VALUES (4, N'1990', N'asdfas', N'345', 4, 6, N'345', N'345', N'345', 17)
GO
SET IDENTITY_INSERT [dbo].[tblStRegPrevSchoolDet] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLStudent] ON 

GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1, N'2017-2018', N'Reg/00/005', N'67676', CAST(N'2018-01-19' AS Date), 3, 4, -1, 5, N'789888', N'Rahul ', N'', N'bharti', CAST(N'1994-06-05' AS Date), 1, N'A+', N'', 1, N'Indian', N'', N'1,2', 3, NULL, N'35sdfsdfsd', N'testset', N'testset', CAST(248008 AS Numeric(18, 0)), N'1', N'DEHRADUN', CAST(248008 AS Numeric(18, 0)), N'1', N'DEHRADUN', NULL, N'9536909129', NULL, N'Test', N'9594755', N'', NULL, N'', N'', N'', N'', -1, N'', N'testse', N'', N'', NULL, N'', N'', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'8941914176', N'Rahul', N'Test', NULL, NULL, N'/Images/Student/Pics/789888.PNG', N'/Images/Parent/8941914173.jpg', N'/Images/Parent/8865882313.jpg', N'rahul', N'rahul', N'test', N'test', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (2, N'', N'Reg/00/004', NULL, CAST(N'2017-12-01' AS Date), 3, 4, 0, -1, N'894215', N'Ankush', N'', N'Rawat', CAST(N'2017-12-14' AS Date), 1, N'A+', N'UK', 1, N'Indian', N'Hindi', N'1,2', 3, NULL, N'2480001', N'Dehradun', N'Dehradun', CAST(248001 AS Numeric(18, 0)), N'1', N'Dehradun', CAST(248001 AS Numeric(18, 0)), N'1', N'Dehradun', NULL, N'95369091429', NULL, N'rk', N'9536909129', N'IT', CAST(N'2017-12-28' AS Date), N'desdf', N'Indian', N'sdf', N'teste@gmail.com', 3, N'25487847', N'sdsd', N'45645645645646456', N'', NULL, N'', N'----Select----', N'', N'', NULL, N'', N'248000', N'', N'sdsd', N'345', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'8941914176', N'353453', N'45345', NULL, NULL, NULL, NULL, NULL, N'ankush', N'123', N'9536909129', N'', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (3, N'2017-2018', N'Reg/00/005', N'8952451', CAST(N'2017-12-07' AS Date), 14, 44, 19, 0, N'89445547', N'Manish', N'', N'Rj', CAST(N'2017-12-13' AS Date), 1, N'A+', N'', -1, N'Indian', N'', N'1,4', -1, NULL, N'345345345', N'sdfsda', N'', CAST(35543 AS Numeric(18, 0)), N'3', N'sadfsad', NULL, N'-1', N'', NULL, N'345345', NULL, N'', N'', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'', N'', N'', NULL, NULL, N'/Images/Student/Pics/89445547.png', N'', N'', N'manish', N'123', N'', N'', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (4, N'2017-2018', N'Reg/00/018', N'3534', CAST(N'2018-02-01' AS Date), 4, 5, -1, 0, N'24802578', N'Tescj', N'', N'Ashed', CAST(N'2018-02-14' AS Date), 1, N'A+', N'dehradun', 1, N'Indian', N'', N'1,2', 3, NULL, N'34563453', N'dsgsdg', N'dsgsdg', CAST(456456 AS Numeric(18, 0)), N'1', N'dfgd', CAST(456456 AS Numeric(18, 0)), N'1', N'dfgd', NULL, N'9897415942', NULL, N'TEst', N'9874587985', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'sdf', N'897987854', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'5345345', N'rahul', N'dfsdf', NULL, NULL, N'', N'', N'', N'fsd', N'sfsd', N'9874587985', N'345345', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (5, N'2017-2018', N'Reg/00/018', N'', CAST(N'2018-04-04' AS Date), 3, 4, 0, 5, N'21554', N'akash', N'', N'Negi', CAST(N'2000-01-01' AS Date), 1, N'A+', N'', 1, N'Indian', N'', N'1,2', 3, NULL, N'1254875542214', N'Premnager Dehradun', N'Premnager Dehradun', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', NULL, N'9536909129', NULL, N'DS', N'8865882313', N'', CAST(N'2018-04-11' AS Date), N'', N'Indian', N'', N'', 8, N'', N'sas', N'8865882313', N'', CAST(N'2018-04-09' AS Date), N'', N'Indian', N'', N'', 8, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'9536909129', N'Rahul', N'test', NULL, NULL, N'/Images/Student/Pics/21554.png', N'/Images/Parent/8865882313.png', N'/Images/Parent/8865882313.png', N'akash', N'123', N'parent', N'123', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (6, N'1', N'Reg/00/018', N'47894', CAST(N'2018-04-10' AS Date), 3, 3, 0, 5, N'498489', N'cfgfdg', N'dfg', N'dfgdf', CAST(N'2018-04-25' AS Date), 2, N'A-', N'', -1, N'Indian', N'', N'1,2', 3, NULL, N'34534534543', N'fdgfdg', N'fdgfdg', CAST(654656 AS Numeric(18, 0)), N'12', N'dfgdf', CAST(654656 AS Numeric(18, 0)), N'12', N'dfgdf', NULL, N'9536909129', NULL, N'fghfg', N'58978978978', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'gfhfgh', N'789789789', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'hgjhgjhgjh', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'9536909129', N'fghgfh', N'hghg', NULL, NULL, N'', N'', N'', N'', N'', N'58978978978', N'', 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (7, N'1', N'Reg/00/018', N'45345', CAST(N'2018-04-03' AS Date), 6, 31, 0, 0, N'3453453', N'Rakesh', N'', N'Uniyal', CAST(N'2018-04-11' AS Date), 1, N'A+', N'', -1, N'Indian', N'', N'1', 3, NULL, N'547896655225', N'dehradun', N'dehradun', CAST(215455 AS Numeric(18, 0)), N'12', N'dehradun', CAST(215455 AS Numeric(18, 0)), N'12', N'dehradun', NULL, N'9897415942', NULL, N'test', N'8941914176', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'defa', N'8865882313', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'9536909129', N'rahul', N'ddaddadd', NULL, NULL, N'/Images/Student/Pics/3453453.png', N'/Images/Parent/8941914176.png', N'/Images/Parent/8865882313.png', N'rakesh', N'123', N'8941914176', N'123', 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (8, N'1', N'Reg/00/018', N'565', CAST(N'2018-04-20' AS Date), 3, 3, 0, 6, N'22626', N'test', N'', N'test', CAST(N'2018-04-26' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1,2', 3, NULL, N'4554888484848', N'adsfs', N'', CAST(54448 AS Numeric(18, 0)), N'13', N'sfs', NULL, N'-1', N'', NULL, N'99989898898', NULL, N'dsfsdfs', N'7889878958954894', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'sdfdsfds', N'4444478548', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'96595959599', N'dsafdsf', N'sdfs', NULL, NULL, N'/Images/Student/Pics/22626.png', N'/Images/Parent/7889878958954894.png', N'/Images/Parent/4444478548.png', N'sdfsd', N'fs', N'7889878958954894', N'sdfsdf', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (9, N'3', N'Reg/00/022', N'gdg', CAST(N'2018-04-02' AS Date), 5, 9, 0, 0, N'dfg', N'gdf', N'df', N'dfg', CAST(N'2018-04-18' AS Date), 1, N'B+', N'dfg', 2, N'Indian', N'dfg', N'1', 3, NULL, N'dfgdf', N'dfg', N'dfg', CAST(6464 AS Numeric(18, 0)), N'11', N'gd', CAST(6464 AS Numeric(18, 0)), N'-1', N'gd', NULL, N'34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (10, N'3', N'Reg/00/022', N'31323', CAST(N'2018-04-03' AS Date), 7, 12, 0, 0, N'2313', N'fdsf', N'fsfs', N'fds', CAST(N'2018-04-26' AS Date), 2, N'B+', N'', 3, N'Indian', N'ggfd', N'1', 3, NULL, N'343432', N'bff', N'bff', CAST(46 AS Numeric(18, 0)), N'11', N'xb', CAST(46 AS Numeric(18, 0)), N'11', N'xb', NULL, N'54', NULL, N'dfjksafh', N'65465', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'dfSGASD', N'674598458', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'64646', N'44664', N'KHU', NULL, NULL, N'/Images/Student/Pics/2313.png', N'/Images/Parent/65465.png', N'/Images/Parent/674598458.png', N'KJADSH', N'ASKJDK', N'65465', N'KASDK', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (11, N'1', N'Reg/00/023', N'4564', CAST(N'2018-04-17' AS Date), 3, 3, 0, 5, N'56456', N'456', N'', N'sadfds', CAST(N'2018-04-11' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'sdfasdf', N'', CAST(345345 AS Numeric(18, 0)), N'12', N'sdfsd', NULL, N'-1', N'', NULL, N'345345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (12, N'3', N'Reg/00/023', N'', CAST(N'2018-04-23' AS Date), 8, -1, 0, 0, N'', N'dsfgsd', N'', N'sgfs', CAST(N'2018-04-26' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'sd', N'', CAST(4234 AS Numeric(18, 0)), N'9', N'ss', NULL, N'-1', N'', NULL, N'423', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (13, N'3', N'Reg/00/023', N'', CAST(N'2018-04-04' AS Date), 8, -1, 0, 0, N'', N'dfdgfd', N'', N'dfgdfg', CAST(N'2018-04-29' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'b', N'', CAST(345 AS Numeric(18, 0)), N'10', N'bbx', NULL, N'-1', N'', NULL, N'534', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (14, N'1', N'Reg/00/023', N'', CAST(N'2018-04-16' AS Date), 4, -1, 0, 0, N'', N'sadfsadfasd', N'', N'asdfsda', CAST(N'2018-04-18' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'sdfgsdf', N'', CAST(45645 AS Numeric(18, 0)), N'12', N'gdsfg', NULL, N'-1', N'', NULL, N'6456456', NULL, N'asdfdsaf', N'4564564', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'asdfasf', N'34534534', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'34534534', N'345345', N'345345', NULL, NULL, N'', N'', N'', N'gsdfg', N'dsfg', N'4564564', N'sdfg', 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (15, N'3', N'Reg/00/023', N'', CAST(N'2018-04-09' AS Date), 7, -1, 0, 0, N'', N'dvdcv', N'', N'xcv', CAST(N'2018-04-11' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'', 3, NULL, N'', N'zv', N'', CAST(32423 AS Numeric(18, 0)), N'4', N'xvcv', NULL, N'-1', N'', NULL, N'43242', NULL, N'vxcv', N'42342', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'vxc', N'3434234', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'234', N'dsf', N'dsf', NULL, NULL, N'', N'', N'', N'amrit', N'123', N'amit', N'123', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (16, N'1', N'Reg/00/024', N'', CAST(N'2018-05-09' AS Date), 4, 6, 0, 0, N'21500', N'Pankj', N'', N'Kumar', CAST(N'2018-05-15' AS Date), 1, N'A+', N'', 1, N'Indian', N'', N'1', 3, NULL, N'34534534', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', NULL, N'09536909129', NULL, N'sdf', N'345344444445', N'', CAST(N'2018-05-24' AS Date), N'', N'----Select----', N'', N'', -1, N'', N'43543', N'435345435', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'34534534', N'534534534', N'534534534', NULL, NULL, N'/Images/Student/Pics/21500.png', N'', N'', N'3453453', N'4534534', N'345344444445', N'345345', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1016, N'1', N'Reg/00/024', NULL, CAST(N'2018-05-16' AS Date), 3, 4, 0, -1, N'', N'Hariom', N'', N'Joshi', CAST(N'2018-05-28' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1,2', 3, NULL, N'', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', CAST(248001 AS Numeric(18, 0)), N'12', N'Dehradun', NULL, N'8744966987', NULL, N'tetes', N'34534534', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'sdfdsa', N'34534', N'', NULL, N'', N'----Select----', N'', N'', NULL, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'8744966987', N'Harihom', N'test', NULL, NULL, NULL, NULL, NULL, N'test', N'test', N'34534534', N'test', NULL)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1017, N'1', N'Reg/00/024', N'', CAST(N'2018-05-02' AS Date), 7, 12, 0, 0, N'', N'fjhj', N'', N'gergrt', CAST(N'2012-02-09' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1,2', 3, NULL, N'', N'dafg', N'', CAST(248001 AS Numeric(18, 0)), N'12', N'dafd', NULL, N'-1', N'', NULL, N'8744966987', NULL, N'fsda', N'4567891234', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'afsdsa', N'9846123897', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'12345', N'fadaf', N'adaa', NULL, NULL, N'', N'', N'', N'Harish', N'123456', N'Mohan', N'123456', 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1018, N'1', N'Reg/00/024', N'5345', CAST(N'2018-06-13' AS Date), 3, 3, 0, 6, N'34', N'test', N'', N'test', CAST(N'2018-06-13' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'sdfsa', N'sdfsa', CAST(534534 AS Numeric(18, 0)), N'12', N'dfasdf', CAST(534534 AS Numeric(18, 0)), N'12', N'dfasdf', NULL, N'3534534534', NULL, N'RA', N'345345', N'', CAST(N'2018-06-20' AS Date), N'', N'----Select----', N'', N'', -1, N'', N'345345', N'534534', N'', NULL, N'', N'----Select----', N'', N'', -1, N'', N'', N'', N'', N'', -1, N'', N'', N'----Select----', N'', N'', N'', N'', N'', N'35345', N'3453', N'4534', NULL, NULL, N'', N'', N'', N'', N'', N'345345', N'', 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1019, N'1', N'Reg/00/024', N'', CAST(N'2018-05-30' AS Date), 3, 3, 0, 5, N'', N'dfsfds', N'', N'fsdf', CAST(N'2018-06-06' AS Date), 1, N'----Select----', N'', -1, N'Indian', N'', N'1', 3, NULL, N'', N'sdfsfsfsfs', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', CAST(248001 AS Numeric(18, 0)), N'1', N'fsds', CAST(248001 AS Numeric(18, 0)), N'-1', N'Dehradun', NULL, N'3453453', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1038, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9.89742e+009', NULL, N'Rahl', N'8.94191e+009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8.86588e+009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1039, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9897415942', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1040, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1041, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1042, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1043, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1044, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1045, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'911897411152', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'4.35456e+006', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1046, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'43545ghjgh64', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1047, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'43545ghjgh64', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1048, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9.53691e+009', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1049, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9.53691e+009', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1050, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941914176', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9.53691e+009', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1051, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 5, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941917624', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9.53691e+009', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6)
GO
INSERT [dbo].[TBLStudent] ([ID], [AcademicYear], [RegNo], [SRNo], [JoiningDate], [ClassID], [SectionID], [BatchID], [StreamID], [RollNo], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [BloodGroup], [BirthPlace], [Religion], [Nationality], [MotherTongue], [Languages], [CategoryID], [CasteID], [AadharNo], [PermanentAddress], [CorrespondAddress], [PermPincode], [PermState], [PermCity], [CorsPincode], [CorsState], [CorsCity], [phone], [SMSmobileNo], [emailID], [FatherName], [FMobile], [FJob], [FDOB], [FDesig], [FNationality], [FOfficeAddress], [Fmail], [FQualification], [FAdharNo], [MotherName], [Mmobile], [MJob], [MDOB], [MDesig], [MNationality], [MOfficeAddress], [Mmail], [MQualification], [MAdharNo], [FIncome], [MIncome], [GuardianName], [Relation], [GQualification], [GJob], [GIncome], [GNationality], [GDesig], [Gmobile], [GOfficeAddress], [GAdharNo], [Gmail], [EmergencyNo], [EmerContPerson], [ContPersRelation], [RouteID], [DestinationID], [PicPath], [FPicPath], [MPicPath], [SUserID], [SPwd], [PUserID], [PPwd], [Status]) VALUES (1054, N'1', N'Reg/00/078', NULL, CAST(N'1991-06-05' AS Date), 3, 3, 0, 0, N'', N'Mukesh', NULL, N'Chand', CAST(N'1991-06-05' AS Date), 1, NULL, NULL, NULL, N'Indian', NULL, NULL, 3, NULL, NULL, N'Deahrdun ', NULL, CAST(248001 AS Numeric(18, 0)), N'1', N'Test', NULL, NULL, NULL, NULL, N'9118974111', NULL, N'Rahl', N'8941917624', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'test', N'8865882313', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'9.53691e+009', N'rahuk', N'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6)
GO
SET IDENTITY_INSERT [dbo].[TBLStudent] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudentAttendence] ON 

GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (1, 1, N'Present', CAST(N'2018-02-01' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.613' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (2, 1, N'Present', CAST(N'2018-02-02' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.687' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (3, 1, N'Present', CAST(N'2018-02-03' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.767' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (4, 1, N'Present', CAST(N'2018-02-05' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.833' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (5, 1, N'Present', CAST(N'2018-02-06' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.900' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (6, 1, N'Absent', CAST(N'2018-02-07' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:47.980' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (7, 1, N'Present', CAST(N'2018-02-08' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.050' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (8, 1, N'Present', CAST(N'2018-02-09' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.113' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (9, 1, N'Present', CAST(N'2018-02-10' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.177' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (10, 1, N'Present', CAST(N'2018-02-12' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.250' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (11, 1, N'Present', CAST(N'2018-02-13' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.330' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (12, 1, N'Present', CAST(N'2018-02-14' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.390' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (13, 1, N'Present', CAST(N'2018-02-15' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.457' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (14, 1, N'Present', CAST(N'2018-02-16' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.530' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (15, 1, N'Absent', CAST(N'2018-02-17' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.607' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (16, 1, N'Present', CAST(N'2018-02-19' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.677' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (17, 1, N'Present', CAST(N'2018-02-20' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.740' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (18, 1, N'Present', CAST(N'2018-02-21' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.807' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (19, 1, N'Present', CAST(N'2018-02-22' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.870' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (20, 1, N'Present', CAST(N'2018-02-23' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:48.950' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (21, 1, N'Present', CAST(N'2018-02-24' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:49.043' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (22, 1, N'Present', CAST(N'2018-02-26' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:49.113' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (23, 1, N'Present', CAST(N'2018-02-27' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:49.180' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (24, 1, N'Present', CAST(N'2018-02-28' AS Date), 1, 3, 4, CAST(N'2018-06-09 17:44:49.267' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (25, 1, N'Present', CAST(N'2018-07-05' AS Date), 1, 3, 4, CAST(N'2018-07-05 14:06:36.647' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (26, 2, N'Present', CAST(N'2018-07-05' AS Date), 1, 3, 4, CAST(N'2018-07-05 14:06:36.820' AS DateTime))
GO
INSERT [dbo].[tblStudentAttendence] ([AttendenceId], [StudentId], [AttendenceType], [AttendenceDate], [TeacherId], [ClassId], [SectionId], [DateCreated]) VALUES (27, 5, N'Present', CAST(N'2018-07-05' AS Date), 1, 3, 4, CAST(N'2018-07-05 14:06:36.983' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblStudentAttendence] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLStudentDocs] ON 

GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (1, 1, 1, N'/Images/Student/Docs/GraduationCertificate1.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (2, 1, 2, N'/Images/Student/Docs/ExperienceLetter1.gif', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (3, 2, 1, N'/Images/Student/Docs/GraduationCertificate2.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (4, 2, 2, N'/Images/Student/Docs/ExperienceLetter2.gif', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (5, 0, 1, N'/Images/Student/Docs/GraduationCertificate0.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (6, 0, 1, N'/Images/Student/Docs/GraduationCertificate0.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (7, 1, 1, N'/Images/Student/Docs/GraduationCertificate1.PNG', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (8, 2, 1, N'/Images/Student/Docs/GraduationCertificate2.png', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (9, 2, 2, N'/Images/Student/Docs/ExperienceLetter2.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (10, 1006, 5, N'/Images/Student/Docs/Proofofbeingasingleparent1006.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (11, 1006, 6, N'/Images/Student/Docs/TransferCertificate1006.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (12, 1, 5, N'/Images/Student/Docs/Proofofbeingasingleparent1.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (13, 1, 6, N'/Images/Student/Docs/TransferCertificate1.jpg', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (14, 5, 5, N'/Images/Student/Docs/Proofofbeingasingleparent5.png', 1)
GO
INSERT [dbo].[TBLStudentDocs] ([ID], [StudentID], [DocID], [DocPath], [Status]) VALUES (15, 5, 6, N'/Images/Student/Docs/TransferCertificate5.png', 1)
GO
SET IDENTITY_INSERT [dbo].[TBLStudentDocs] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLStudentHealthDet] ON 

GO
INSERT [dbo].[TBLStudentHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (1, 1, 45, 34, 4, 4, N'fdsfsdfgsdg', NULL)
GO
INSERT [dbo].[TBLStudentHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (2, 2, 44, 434, 42, 43, N'fdgdfgd', NULL)
GO
INSERT [dbo].[TBLStudentHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (3, 1, 6, 556, 56, 5, N'5shgf', NULL)
GO
INSERT [dbo].[TBLStudentHealthDet] ([ID], [StudentID], [Height], [Weight], [VisionLeft], [VisionRight], [MedicationDetails], [Status]) VALUES (4, 5, 50, 15, 0, 0, N'', NULL)
GO
SET IDENTITY_INSERT [dbo].[TBLStudentHealthDet] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudentLeaveApply] ON 

GO
INSERT [dbo].[tblStudentLeaveApply] ([ID], [StudentID], [datefrom], [dateto], [Reason], [RequestDt], [ApproveDt], [ApprovedBy], [Status]) VALUES (1, 1, CAST(N'2018-07-13' AS Date), CAST(N'2018-07-14' AS Date), N'tes by', CAST(N'2018-07-13' AS Date), NULL, 1, 4)
GO
INSERT [dbo].[tblStudentLeaveApply] ([ID], [StudentID], [datefrom], [dateto], [Reason], [RequestDt], [ApproveDt], [ApprovedBy], [Status]) VALUES (2, 1, CAST(N'2018-07-13' AS Date), CAST(N'0001-01-01' AS Date), N'test by rahul bharti', CAST(N'2018-07-13' AS Date), NULL, 1, 4)
GO
INSERT [dbo].[tblStudentLeaveApply] ([ID], [StudentID], [datefrom], [dateto], [Reason], [RequestDt], [ApproveDt], [ApprovedBy], [Status]) VALUES (3, 1, CAST(N'2018-07-13' AS Date), CAST(N'2018-07-14' AS Date), N'sdfasf', CAST(N'2018-07-13' AS Date), NULL, 1, 4)
GO
INSERT [dbo].[tblStudentLeaveApply] ([ID], [StudentID], [datefrom], [dateto], [Reason], [RequestDt], [ApproveDt], [ApprovedBy], [Status]) VALUES (4, 1, CAST(N'2018-07-13' AS Date), CAST(N'0001-01-01' AS Date), N'test by rahul bharti', CAST(N'2018-07-13' AS Date), NULL, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[tblStudentLeaveApply] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (1, N'Hindi', N'hin01', NULL, 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (2, N'English', N'Eng01', N'sdfsdfsd', 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (3, N'Mathematics', N'Math01', NULL, 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (4, N'Computers', N'Comp01', NULL, 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (5, N'Social Science', N'SSC01', NULL, 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (6, N'Science & Technology', N'Sc01', NULL, 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (7, N'Physics', N'phy001', N'sda', 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (8, N'Histo', N'saf', N'as', 0)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (9, N'asfs', N'a', N'a', 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (10, N'asdas', N'dasd', N'34534', 1)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (11, N'sfsd', N'fsdf', N'sdafsd', 0)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (12, N'test', N'test', N'test', 0)
GO
INSERT [dbo].[tblSubject] ([ID], [Subject], [SubCode], [Description], [Status]) VALUES (10012, N'gsjd', N'dadsa', N'asda', 1)
GO
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubjectTeacherAllocate] ON 

GO
INSERT [dbo].[tblSubjectTeacherAllocate] ([ID], [SubjectID], [TeacherID], [Status]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[tblSubjectTeacherAllocate] ([ID], [SubjectID], [TeacherID], [Status]) VALUES (2, 3, 1, 1)
GO
INSERT [dbo].[tblSubjectTeacherAllocate] ([ID], [SubjectID], [TeacherID], [Status]) VALUES (3, 2, 2, 1)
GO
INSERT [dbo].[tblSubjectTeacherAllocate] ([ID], [SubjectID], [TeacherID], [Status]) VALUES (4, 4, 2, 1)
GO
INSERT [dbo].[tblSubjectTeacherAllocate] ([ID], [SubjectID], [TeacherID], [Status]) VALUES (5, 5, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[tblSubjectTeacherAllocate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubModule] ON 

GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (1, 1, N'AddEmployee', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (2, 2, N'ViewEmployee', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (3, 3, N'ViewEmployeeDetails', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (4, 4, N'AddDesignation', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (5, 5, N'DepartmentMaster', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (6, 6, N'AddStudent', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (7, 7, N'ViewStudent', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (8, 8, N'AddCourse', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (9, 9, N'AddSection', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (10, 10, N'ClassTeacherMaster', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (11, 11, N'TeacherSubjectAllocation', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (12, 12, N'ClassTiming', 3, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (13, 13, N'TimeTableConfig', 3, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (14, 14, N'EmployeeAttendence', 5, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (15, 15, N'TakeStudentAttendence', 5, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (17, 16, N'View Reg Application', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (18, 17, N'Add Events', 6, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (19, 18, N'Event Type', 6, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (20, 19, N'Employee Leave Request', 4, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (21, 20, N'Leave Category', 4, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (25, 21, N'Leave Details', 4, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (27, 23, N'Add Qualification', 1, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (28, 24, N'Add Stream', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (29, 25, N'Notice', 8, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (30, 26, N'AllEmployee Attendence Reports', 5, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (31, 27, N'Assign Task', 7, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (32, 28, N'View Task', 7, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (33, 29, N'Expense Category', 11, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (34, 30, N'Create Payee', 11, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (35, 31, N'View PayeeAccounts', 11, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (37, 32, N'Expenses List', 11, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (39, 33, N'Fee Head', 12, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (40, 34, N'Fee Structure', 12, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (41, 35, N'Fee Payment', 12, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (42, 36, N'Send SMS to Parent', 13, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (43, 37, N'Send Email to Parent', 13, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (44, 38, N'Send SMS to Employee', 13, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (45, 39, N'Send Email to Employee', 13, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (46, 40, N'Employee List', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (47, 41, N'Student List', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (48, 42, N'Student Attendance Report', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (49, 43, N'Employee Attendance Report', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (50, 44, N'Total Expense Report', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (51, 45, N'Class Teachers List', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (53, 46, N'Employee Leave Requests', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (54, 47, N'Salary Reports', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (55, 48, N'Fees Paid Report', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (56, 49, N'UnPaid Fee Report', 9, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (57, 50, N'Salary Head', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (58, 51, N'Salary Grade', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (59, 52, N'Emp. Account Information', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (60, 53, N'View Assgin Grade', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (61, 54, N'View Salary Grade', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (62, 55, N'View Salary Structure', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (63, 56, N'Salary Payment', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (64, 57, N'View Employee Salary Details', 10, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (65, 58, N'Add Subject', 2, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (66, 59, N'Empolyee Import', 14, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (67, 60, N'Empolyee Attendence Import', 14, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (68, 61, N'Student Attendence Import', 14, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (69, 62, N'Student Details Import', 14, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (70, 63, N'Add Vehicle', 15, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (1067, 64, N'Add Driver', 15, 1)
GO
INSERT [dbo].[tblSubModule] ([ID], [SubModuleID], [SubModule], [ModuleID], [Status]) VALUES (1068, 65, N'Add Route', 15, 1)
GO
SET IDENTITY_INSERT [dbo].[tblSubModule] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTaskDetails] ON 

GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (2, N'task Detais', N'test', N'Highest Priority', CAST(N'2018-01-23' AS Date), 2, 2, 2, NULL, NULL, NULL, N'Open', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (3, N'test', N'tests', N'Highest Priority', CAST(N'2018-01-24' AS Date), 1, NULL, NULL, 3, 4, 1, N'Resolved', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (6, N'kelvin', N'kels', N'Low Priority', CAST(N'2018-03-31' AS Date), 1, NULL, NULL, 3, 4, 1, N'Resolved', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (7, N'addd', N'sddfsd', N'Highest Priority', CAST(N'2018-02-07' AS Date), 2, 2, 1, NULL, NULL, NULL, N'Resolved', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (8, N'addd', N'sddfsd', N'Highest Priority', CAST(N'2018-02-07' AS Date), 2, 2, 2, NULL, NULL, NULL, N'Open', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (9, N'addd', N'sddfsd', N'Highest Priority', CAST(N'2018-02-07' AS Date), 2, 2, 3, NULL, NULL, NULL, N'Resolved', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (10, N'Class Assignment check', N'Class Assignment check', N'Highest Priority', CAST(N'2018-04-20' AS Date), 2, 2, 1, NULL, NULL, NULL, N'Open', NULL)
GO
INSERT [dbo].[tblTaskDetails] ([Id], [TaskName], [Description], [TaskPriority], [TaskDate], [UserType], [Department], [Employee], [classId], [SectionId], [Student], [Status], [dateCreated]) VALUES (11, N'teset', N'fgyg', N'Highest Priority', CAST(N'2018-04-21' AS Date), 2, 2, 1, NULL, NULL, NULL, N'Resolved', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblTaskDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTaskToDo] ON 

GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (2, N'et', N'sdf', CAST(N'2018-01-11' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (6, N'test', N'etst', CAST(N'2018-01-12' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (10, N'asdf', N'sadf', CAST(N'2018-01-23' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (11, N'test', N'tet', CAST(N'2018-01-24' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (12, N'aniversary', N'rahul', CAST(N'2018-02-27' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (13, N'sdf', N'sdf', CAST(N'2018-04-28' AS Date), N'1')
GO
INSERT [dbo].[tblTaskToDo] ([Id], [Subject], [Message], [TaskDate], [UserType]) VALUES (14, N'yht', N'hjh', CAST(N'2018-04-20' AS Date), N'1')
GO
SET IDENTITY_INSERT [dbo].[tblTaskToDo] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTaskToDoForEmployee] ON 

GO
INSERT [dbo].[tblTaskToDoForEmployee] ([Id], [Subject], [Message], [TaskDate], [UserType], [EmployeeId]) VALUES (2, N'test', N'test', CAST(N'2018-01-12' AS Date), N'3', 1002)
GO
INSERT [dbo].[tblTaskToDoForEmployee] ([Id], [Subject], [Message], [TaskDate], [UserType], [EmployeeId]) VALUES (3, N'testte', N'test', CAST(N'2018-01-24' AS Date), N'3', 1)
GO
SET IDENTITY_INSERT [dbo].[tblTaskToDoForEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTeacherDiary] ON 

GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (1, 1, N'Go home', CAST(N'2017-11-27' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#f39c12')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (2, 1, N'Sleep tight', CAST(N'2017-12-05' AS Date), CAST(N'2017-12-05' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#dd4b39')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (3, 1, N'Work on UI design', CAST(N'2017-12-08' AS Date), CAST(N'2017-12-08' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#3c8dbc')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (4, 1, N'Do homework', CAST(N'2017-12-08' AS Date), CAST(N'2017-12-08' AS Date), CAST(N'11:30:00' AS Time), CAST(N'13:30:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (5, 1, N'Sleep tight', CAST(N'2017-12-06' AS Date), CAST(N'2017-12-06' AS Date), CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), N'#dd4b39')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (6, 1, N'Do homework', CAST(N'2017-12-06' AS Date), CAST(N'2017-12-06' AS Date), CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (7, 1, N'Sleep tight', CAST(N'2017-12-08' AS Date), CAST(N'2017-12-08' AS Date), CAST(N'11:30:00' AS Time), CAST(N'13:30:00' AS Time), N'#dd4b39')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (8, 1, N'Sleep tight', CAST(N'2017-12-08' AS Date), CAST(N'2017-12-08' AS Date), CAST(N'17:30:00' AS Time), CAST(N'19:30:00' AS Time), N'#dd4b39')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (9, 1, N'Do homework', CAST(N'2017-11-26' AS Date), CAST(N'2017-11-26' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (10, 1, N'Do homework', CAST(N'2017-11-27' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (11, 1, N'sdhfjhsdjfh sd', CAST(N'2017-11-27' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#3c8dbc')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (12, 1, N'12 calss bskdf', CAST(N'2017-10-02' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#3c8dbc')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (13, 1, N'Go home', CAST(N'2018-01-01' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#f39c12')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (14, 1, N'Lunch', CAST(N'2017-12-06' AS Date), CAST(N'2017-12-06' AS Date), CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), N'#00a65a')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (15, 1, N'Go home', CAST(N'2017-11-28' AS Date), CAST(N'2017-11-28' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#f39c12')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (16, 1, N'Do homework', CAST(N'2017-10-30' AS Date), CAST(N'2017-10-30' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (17, 1, N'Sleep tight', CAST(N'2017-10-01' AS Date), CAST(N'2017-10-01' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#dd4b39')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (18, 1, N'Do homework', CAST(N'2017-11-29' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#00c0ef')
GO
INSERT [dbo].[tblTeacherDiary] ([Id], [EmpId], [Message], [startdate], [endDate], [startTime], [endTime], [backgroundcolor]) VALUES (19, 1, N'Lunch', CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'05:30:00' AS Time), CAST(N'07:30:00' AS Time), N'#00a65a')
GO
SET IDENTITY_INSERT [dbo].[tblTeacherDiary] OFF
GO
SET IDENTITY_INSERT [dbo].[tblThoughtsOfDay] ON 

GO
INSERT [dbo].[tblThoughtsOfDay] ([fldId], [Thoughts], [dateCreated]) VALUES (1, N'this is two player', CAST(N'2018-02-15 15:55:01.017' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblThoughtsOfDay] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTimeTable] ON 

GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (1, 1, 2, 1, N'1', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (2, 1, 2, 1, N'2', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (3, 1, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (4, 1, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (5, 1, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (6, 1, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (7, 2, 2, 1, N'1', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (8, 2, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (9, 2, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (10, 2, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (11, 2, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (12, 2, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (13, 3, 2, 1, N'1', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (14, 3, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (15, 3, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (16, 3, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (17, 3, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (18, 3, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (19, 4, 2, 1, N'1', 4, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (20, 4, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (21, 4, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (22, 4, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (23, 4, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (24, 4, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (25, 5, 2, 1, N'1', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (26, 5, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (27, 5, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (28, 5, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (29, 5, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (30, 5, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (31, 7, 2, 1, N'1', 5, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (32, 7, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (33, 7, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (34, 7, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (35, 7, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (36, 7, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (37, 8, 2, 1, N'1', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (38, 8, 2, 1, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (39, 8, 2, 1, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (40, 8, 2, 1, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (41, 8, 2, 1, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (42, 8, 2, 1, N'6', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (43, 1, 2, 2, N'1', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (44, 1, 2, 2, N'2', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (45, 1, 2, 2, N'3', 4, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (46, 1, 2, 2, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (47, 1, 2, 2, N'5', 5, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (48, 2, 2, 2, N'1', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (49, 2, 2, 2, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (50, 2, 2, 2, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (51, 2, 2, 2, N'4', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (52, 2, 2, 2, N'5', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (53, 3, 2, 2, N'1', 5, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (54, 3, 2, 2, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (55, 3, 2, 2, N'3', 5, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (56, 3, 2, 2, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (57, 3, 2, 2, N'5', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (58, 4, 2, 2, N'1', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (59, 4, 2, 2, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (60, 4, 2, 2, N'3', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (61, 4, 2, 2, N'4', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (62, 4, 2, 2, N'5', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (63, 5, 2, 2, N'1', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (64, 5, 2, 2, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (65, 5, 2, 2, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (66, 5, 2, 2, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (67, 5, 2, 2, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (68, 7, 2, 2, N'1', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (69, 7, 2, 2, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (70, 7, 2, 2, N'3', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (71, 7, 2, 2, N'4', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (72, 7, 2, 2, N'5', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (73, 8, 2, 2, N'1', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (74, 8, 2, 2, N'2', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (75, 8, 2, 2, N'3', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (76, 8, 2, 2, N'4', 3, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (77, 8, 2, 2, N'5', 2, 2, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (78, 10, 3, 3, N'1', 1, 1, 1)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (79, 10, 3, 3, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (80, 10, 3, 3, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (81, 10, 3, 3, N'4', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (82, 11, 3, 3, N'1', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (83, 11, 3, 3, N'2', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (84, 11, 3, 3, N'3', NULL, NULL, NULL)
GO
INSERT [dbo].[tblTimeTable] ([ID], [CTDet_ID], [CT_ID], [TimeTableID], [WeekDay], [SubjectID], [TeacherID], [Status]) VALUES (85, 11, 3, 3, N'4', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblTimeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTimeTableConfig] ON 

GO
INSERT [dbo].[tblTimeTableConfig] ([ID], [Name], [AcademicYear], [ClassID], [SectionID], [StartDT], [EndDt], [WeekDays], [CT_ID], [Status]) VALUES (1, N'First A Time Table', 1, 3, 3, CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date), N'1,2,3,4,5,6', 2, 1)
GO
INSERT [dbo].[tblTimeTableConfig] ([ID], [Name], [AcademicYear], [ClassID], [SectionID], [StartDT], [EndDt], [WeekDays], [CT_ID], [Status]) VALUES (2, N'1-b', 1, 3, 4, CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date), N'1,2,3,4,5', 2, 1)
GO
INSERT [dbo].[tblTimeTableConfig] ([ID], [Name], [AcademicYear], [ClassID], [SectionID], [StartDT], [EndDt], [WeekDays], [CT_ID], [Status]) VALUES (3, N'2 nd b', 1, 4, 7, CAST(N'2018-04-01' AS Date), CAST(N'2018-12-31' AS Date), N'1,2,3,4', 3, 1)
GO
SET IDENTITY_INSERT [dbo].[tblTimeTableConfig] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransExPayeeDetails] ON 

GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (1, 1, N'500', CAST(N'2018-02-01' AS Date), N'Cash', NULL, NULL, NULL, N'', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (2, 2, N'500', CAST(N'2018-02-22' AS Date), N'Cash', NULL, NULL, NULL, N'test', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (3, 3, N'500', CAST(N'2018-02-21' AS Date), N'Cash', NULL, NULL, NULL, N'teste', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (4, 4, N'500', CAST(N'2018-02-13' AS Date), N'Cash', NULL, NULL, NULL, N'sdf', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (5, 4, N'500', CAST(N'2018-02-14' AS Date), N'Cash', NULL, NULL, NULL, N'test', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (6, 7, N'7000', CAST(N'2018-02-02' AS Date), N'Cash', NULL, NULL, NULL, N'test', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (7, 8, N'1501', CAST(N'2018-02-22' AS Date), N'Cheque', N'897857', CAST(N'2018-02-28' AS Date), NULL, N'test', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (9, 8, N'1953', CAST(N'2018-02-20' AS Date), N'Cash', NULL, NULL, NULL, N'sdf', NULL)
GO
INSERT [dbo].[tblTransExPayeeDetails] ([Id], [ExpDetailsId], [PayingAmount], [PaymentDate], [PaymentMode], [chequeNo], [ChequeDate], [BankName], [Remarks], [datecreated]) VALUES (10, 8, N'1', CAST(N'2018-02-21' AS Date), N'Cash', NULL, NULL, NULL, N'dfgd', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblTransExPayeeDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransportAllocation] ON 

GO
INSERT [dbo].[tblTransportAllocation] ([Id], [RouteId], [DestinationId], [UserType], [ClassId], [SectionId], [StudentId], [DepId], [EmployeeId], [DateCreated], [Status]) VALUES (1, N'4', N'2', N'Employee', N'0', N'0', N'0', N'2', N'84', CAST(N'2018-07-03 18:28:22.197' AS DateTime), 1)
GO
INSERT [dbo].[tblTransportAllocation] ([Id], [RouteId], [DestinationId], [UserType], [ClassId], [SectionId], [StudentId], [DepId], [EmployeeId], [DateCreated], [Status]) VALUES (23, N'4', N'2', N'Student', N'3', N'4', N'1', N'0', N'0', CAST(N'2018-07-13 16:19:31.687' AS DateTime), 1)
GO
INSERT [dbo].[tblTransportAllocation] ([Id], [RouteId], [DestinationId], [UserType], [ClassId], [SectionId], [StudentId], [DepId], [EmployeeId], [DateCreated], [Status]) VALUES (24, N'3', N'1', N'Student', N'3', N'4', N'2', N'0', N'0', CAST(N'2018-07-13 16:19:33.200' AS DateTime), 1)
GO
INSERT [dbo].[tblTransportAllocation] ([Id], [RouteId], [DestinationId], [UserType], [ClassId], [SectionId], [StudentId], [DepId], [EmployeeId], [DateCreated], [Status]) VALUES (25, N'3', N'1', N'Student', N'3', N'4', N'5', N'0', N'0', CAST(N'2018-07-13 16:19:35.393' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tblTransportAllocation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransportDriver] ON 

GO
INSERT [dbo].[tblTransportDriver] ([Id], [VehicleId], [DriveId], [PresentAddress], [PermanentAddress], [DOB], [phone], [LicenseNo], [DateCreated]) VALUES (1, 1, 168, N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', CAST(N'2018-06-20' AS Date), N'9897415942', N'234234', CAST(N'2018-06-28 13:55:23.343' AS DateTime))
GO
INSERT [dbo].[tblTransportDriver] ([Id], [VehicleId], [DriveId], [PresentAddress], [PermanentAddress], [DOB], [phone], [LicenseNo], [DateCreated]) VALUES (2, 1, 168, N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', N'29/2, Chakarata Rd, Prakash Nagar, Khurbura Mohalla', CAST(N'2018-06-20' AS Date), N'9897415942', N'6456456', CAST(N'2018-06-28 13:56:48.530' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblTransportDriver] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransportVehicalDetails] ON 

GO
INSERT [dbo].[tblTransportVehicalDetails] ([Id], [VehicalNo], [TotalSeats], [AllowedSeats], [OwnershipType], [InsuranceDate], [PollutionDate], [TrackNumber], [DateCreated]) VALUES (1, N'345', N'345', N'345', N'Ownership', N'27/06/2018', N'26/06/2018', N'5', CAST(N'2018-06-27 12:11:32.763' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblTransportVehicalDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransRoute] ON 

GO
INSERT [dbo].[tblTransRoute] ([Id], [VehicleId], [RouteCode], [StartPlace], [EndPlace], [DateCreated]) VALUES (3, 1, N'DH001', N'Deradun', N'Premnagar', CAST(N'2018-06-29 15:59:03.760' AS DateTime))
GO
INSERT [dbo].[tblTransRoute] ([Id], [VehicleId], [RouteCode], [StartPlace], [EndPlace], [DateCreated]) VALUES (4, 1, N'002', N'Indian', N'Bindia', CAST(N'2018-07-12 14:02:39.990' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblTransRoute] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

GO
INSERT [dbo].[tblUser] ([ID], [EmpID], [FirstName], [MiddleName], [LastName], [DOB], [GenderID], [MaritalSatus], [Category], [Religion], [DeptID], [DesigID], [StaffCategory], [Grade], [JobTitle], [JoiningDt], [Qualification], [Experience], [PresentAddress], [PermAddress], [City], [State], [Country], [Pincode], [Phone], [Mobile], [Email], [AdharNo], [EmpType], [FatherName], [MotherName], [BloodGroup], [PicPath], [UserID], [Pwd], [BiometricID], [Status], [Signature]) VALUES (11, N'1222', N'Rahul', NULL, N'Bharti', CAST(N'1995-05-06' AS Date), 1, 1, 1, 1, 1, 1, 1, 1, N'1', CAST(N'2017-11-11' AS Date), 1, 3, N'sdfsdfas', N'sdfsdf', 1, 1, 1, CAST(11 AS Numeric(18, 0)), CAST(111 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), N'test@gmail.com', NULL, N'3453453', NULL, NULL, NULL, N'../../Images/Admin/admin.png', N'admin', N'123', NULL, 1, N'/Images/Admin/sign1.png')
GO
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserType] ON 

GO
INSERT [dbo].[tblUserType] ([id], [Name], [status], [dataCreated]) VALUES (1, N'Admin', 1, CAST(N'2017-11-11 11:20:32.260' AS DateTime))
GO
INSERT [dbo].[tblUserType] ([id], [Name], [status], [dataCreated]) VALUES (2, N'Owner', 0, CAST(N'2017-11-11 11:22:00.857' AS DateTime))
GO
INSERT [dbo].[tblUserType] ([id], [Name], [status], [dataCreated]) VALUES (3, N'Employee', 1, CAST(N'2017-11-11 11:22:08.120' AS DateTime))
GO
INSERT [dbo].[tblUserType] ([id], [Name], [status], [dataCreated]) VALUES (4, N'Student', 1, CAST(N'2017-11-11 11:22:11.583' AS DateTime))
GO
INSERT [dbo].[tblUserType] ([id], [Name], [status], [dataCreated]) VALUES (5, N'Parent', 1, CAST(N'2017-11-11 11:22:15.170' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblUserType] OFF
GO
SET IDENTITY_INSERT [dbo].[tblWeekDays] ON 

GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (2, N'Monday', 1)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (3, N'TuesDay', 2)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (4, N'Wednesday', 3)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (5, N'Thursday', 4)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (6, N'Friday', 5)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (7, N'Saturday', 6)
GO
INSERT [dbo].[tblWeekDays] ([ID], [WeekDay], [DayID]) VALUES (8, N'Sunday', 7)
GO
SET IDENTITY_INSERT [dbo].[tblWeekDays] OFF
GO
ALTER TABLE [dbo].[tblFeeCalculate_temp] ADD  DEFAULT (getdate()) FOR [dateCreated]
GO
ALTER TABLE [dbo].[tblScholarRegisterDetails] ADD  CONSTRAINT [DF_tblScholarRegisterDetails_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[ImportEmployeeExcelData]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[ImportEmployeeExcelData]
      @tblCustomers CustomerType READONLY
AS
BEGIN
      SET NOCOUNT ON;
     
	 create table tblEmployeeTempImport(Id int identity(1,1),
	 [EmployeeCode] [varchar](150) NULL,
[JoiningDate] date NULL,
[Department] [varchar](100) NULL,
[Designation] [varchar](150) NULL,

[Qualification] [varchar](150) NULL,
[TotalExperience] [varchar](150) NULL,
[StaffType] [varchar](150) NULL,
[FirstName] [varchar](150) NULL,
[MiddleName] [varchar](150) NULL,
[LastName] [varchar](150) NULL,
[DOB] date NULL,
[Gender] [varchar](150) NULL,
[MaritalStatus] [varchar](150) NULL,

[Religon] [varchar](150) NULL,
[FatherName] [varchar](150) NULL,
[MotherName] [varchar](150) NULL,
[Country] [varchar](150) NULL,
[State] [varchar](150) NULL,
[City] [varchar](150) NULL,
[PinCode] [varchar](150) NULL,

[MobileNo] [varchar](150) NULL,
[EmailAddress] [varchar](150) NULL,
[AdhaarNumber] [varchar](150) NULL,
[PresentAddress][nvarchar](max) Null,				
[PermanentAddress][nvarchar](max) Null
	 )

      INSERT INTO tblEmployeeTempImport(EmployeeCode,JoiningDate,Department,Designation,Qualification,TotalExperience,StaffType,FirstName,
MiddleName,LastName,DOB,Gender,MaritalStatus,Religon,FatherName,MotherName,Country,State,
City,PinCode,MobileNo,EmailAddress,AdhaarNumber,PresentAddress,PermanentAddress)
      SELECT EmployeeCode,JoiningDate,Department,Designation,Qualification,TotalExperience,StaffType,FirstName,
MiddleName,LastName,DOB,Gender,MaritalStatus,Religon,FatherName,MotherName,Country,State,
City,PinCode,MobileNo,EmailAddress,AdhaarNumber,PresentAddress,PermanentAddress FROM @tblCustomers

	  exec sp_ImportEmployeeDetails
END


GO
/****** Object:  StoredProcedure [dbo].[SalarySlipGenerate]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SalarySlipGenerate 1,0,0,'frd'

CREATE procedure [dbo].[SalarySlipGenerate]
(
@Id bigint,
@gradeId bigint,
@employeeId bigint,
@Month nvarchar(150)
)
as begin

create table #tblSalaryStructure(Id int identity(1,1),description nvarchar(250),Rate nvarchar(100),Earning nvarchar(150),ArrearAmt nvarchar(120),
TotalAmt nvarchar(150))
 
 create table #tblsalarythimonth(Id int identity(1,1),Name nvarchar(150),HeadAmount nvarchar(150))
  create table #tblsalaryGreade(Id int identity(1,1),Name nvarchar(150),amount nvarchar(150))
    create table #tblsalary(Id int identity(1,1),Name nvarchar(150),TotalAmount nvarchar(150))
 insert into #tblsalaryGreade(Name,amount)
   select ss.Name,sh.Amount from tblGradeAssignSalaryHead sh
  left outer join tblSalaryHead ss on ss.Id=sh.HeadId
  where sh.GradeId=@gradeId


  --select * from tblGradeAssignSalaryHead

  --select * from  tblEmployyeMonthSalaryStructure 
  --select * from tblEmployeeSalaryDetails
 
 
insert into #tblsalarythimonth(Name,HeadAmount)
   select sh.Name,  CASE  WHEN ss.Salrytpe ='Deduction' THEN '0' ELSE ss.HeadAmount end HeadAmount  from tblEmployeeSalaryDetails sd
  left outer join tblEmployyeMonthSalaryStructure ss on ss.salaryDetailId=sd.Id
  left outer join tblSalaryHead sh on sh.Id=ss.HeadId
  where DATENAME(month,sd.FromDate)='December' and sd.Id=@Id and sd.EmployeeId=@employeeId




  insert into #tblsalary(Name,TotalAmount)
    select sh.Name,  CASE  WHEN ss.Salrytpe ='Deduction' THEN '-'+ss.HeadAmount ELSE ss.HeadAmount end HeadAmount  from tblEmployeeSalaryDetails sd
  left outer join tblEmployyeMonthSalaryStructure ss on ss.salaryDetailId=sd.Id
  left outer join tblSalaryHead sh on sh.Id=ss.HeadId
  where DATENAME(month,sd.FromDate)='December' and sd.Id=@Id and sd.EmployeeId=@employeeId






	insert #tblSalaryStructure (description,Rate,Earning,ArrearAmt,TotalAmt)
	  select sg.Name,sg.amount Rate ,sm.HeadAmount Earning,'0',s.TotalAmount totalAmount from #tblsalaryGreade sg 
  left outer join #tblsalarythimonth sm on sm.Name=sg.Name
    left outer join #tblsalary s on s.Name=sg.Name

	select * from #tblSalaryStructure

drop table  #tblSalaryStructure
 --select * from tblEmployyeMonthSalaryStructure
 --tblEmployeeSalaryDetails
end
--select * from [dbo].[tblGradeAssignSalaryHead]
--truncate table tblEmployeeAccountInformation



GO
/****** Object:  StoredProcedure [dbo].[Sp_checkLeaveYearforEmployee]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_checkLeaveYearforEmployee]
(
@startdate date,
@enddate date,
@leaveType bigint,
@desig bigint
)
as begin 
  -- select * from tblLeaveDetails where StartDate>@startdate and EndDate<@enddate and LeaveCategory=@leaveType

 select * from tblLeaveDetails where StartDate< convert(date, @startdate, 103) and EndDate>convert(date, @enddate, 103) and LeaveCategory=@leaveType
end



GO
/****** Object:  StoredProcedure [dbo].[sp_fetchEmployeeTakeAssgnLeave]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_fetchEmployeeTakeAssgnLeave 11,1002,3

 CREATE procedure [dbo].[sp_fetchEmployeeTakeAssgnLeave]
 (
 @desgId nvarchar(150),
 @EmpId bigint,
 @leaveType bigint
 )
 as begin
   create table #tblEmployyeLeaveTakeAss
   (
   fldId int Identity(1,1),
   fldType nvarchar(150),
   leaveAssign bigint,
   takeLeave bigint,
   remainingLeave bigint
   )


   declare @leave nvarchar(150),@assignLeave bigint,@takeLeave bigint,@availableLeave bigint

   select @leave=lt.LeaveName,@assignLeave=td.leaveAssgin from tblLeaveDetails  td
   inner join tblLeaveType lt on lt.LeaveId=td.LeaveCategory
   where  leaveDesgination=@desgId and LeaveCategory=@leaveType

   select @takeLeave=sum(TakeLeaveCount) from tblemployeeLeaveRequest where EmployeeID=@EmpId and Designation=@desgId and LeaveType=@leaveType

set @availableLeave=@assignLeave-isnull(@takeLeave,0);

print @availableLeave

insert into #tblEmployyeLeaveTakeAss(fldType,leaveAssign,takeLeave,remainingLeave) 
values(@leave,@assignLeave,ISNULL(@takeLeave,0),@availableLeave)

select * from #tblEmployyeLeaveTakeAss

drop table #tblEmployyeLeaveTakeAss


 end



GO
/****** Object:  StoredProcedure [dbo].[sp_getAllEmployeeDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getAllEmployeeDetails]
as begin
select em.Id,Empcode,td.DepartmentName,desg.Designation,sc.Name staff,qc.QualificationName,FirstName,MiddleName,LastName,Cast(DOB AS DATE) DOB,	gen.GenderName,em.Image,em.Status
,em.Mobile,em.Email from tblEmployee em
left outer join tblDepartmnet td on td.DepartmentId=em.DeptID 
left outer join tblDesignation desg on desg.DesigID=em.DesigID 
left outer join tblStaffCategory sc on sc.Id=em.StaffCategory 
left outer join tblQualifications qc on qc.QualificationId=em.Qualification 
left outer join tblGender gen on gen.gender_id=em.GenderID 
order by em.id desc
end



GO
/****** Object:  StoredProcedure [dbo].[sp_getAllEmployeeDetailsForAttendence]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_getAllEmployeeDetailsForAttendence]
as begin
select em.DeptID,em.DesigID,em.Id,Empcode,td.DepartmentName,desg.Designation,sc.Name staff,qc.QualificationName,FirstName,MiddleName,LastName,Cast(DOB AS DATE) DOB,	gen.GenderName,em.Image,em.Status from tblEmployee em
left outer join tblDepartmnet td on td.DepartmentId=em.DeptID 
left outer join tblDesignation desg on desg.DesigID=em.DesigID 
left outer join tblStaffCategory sc on sc.Id=em.StaffCategory 
left outer join tblQualifications qc on qc.QualificationId=em.Qualification 
left outer join tblGender gen on gen.gender_id=em.GenderID 
where em.Status=1
order by em.id desc

end



GO
/****** Object:  StoredProcedure [dbo].[sp_getAllEmployeeDetailsReports]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getAllEmployeeDetailsReports]
as begin
select em.Id,Empcode,td.DepartmentName,desg.Designation,sc.Name staff,
qc.QualificationName,FirstName,MiddleName,LastName,Cast(DOB AS DATE) DOB,
	gen.GenderName,em.Image,em.Status,em.Mobile,em.Email,
	Cast(em.JoiningDt AS DATE) JoiningDate,em.Experience,
	em.AdharNo,em.BankName,em.BiometricID,em.ESINO,em.IFSCCode,
	em.PANNO,em.PFNo,em.AccountNumber,em.BankName from tblEmployee em
left outer join tblDepartmnet td on td.DepartmentId=em.DeptID 
left outer join tblDesignation desg on desg.DesigID=em.DesigID 
left outer join tblStaffCategory sc on sc.Id=em.StaffCategory 
left outer join tblQualifications qc on qc.QualificationId=em.Qualification 
left outer join tblGender gen on gen.gender_id=em.GenderID 
order by em.id desc
end



GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentDet]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetStudentDet]
 @id int
AS
BEGIN
     
 SELECT st.ID,st.AcademicYear,st.RegNo,st.SRNo,st.JoiningDate,st.ClassID,st.SectionID
            ,st.BatchID,st.StreamID,st.RollNo,st.FirstName,st.MiddleName,st.LastName,st.DOB,st.GenderID,st.BloodGroup,st.[BirthPlace]
            ,st.[Religion],st.[Nationality],st.[MotherTongue],st.[Languages],st.[CategoryID],st.[CasteID],st.[AadharNo],st.[PermanentAddress]
            ,st.[CorrespondAddress],st.[PermPincode],st.[PermState],st.[PermCity],st.[CorsPincode],st.[CorsState],st.[CorsCity],st.[phone],st.[SMSmobileNo]
            ,st.[emailID],st.[FatherName],st.[FMobile],st.[FJob],st.[FDOB],st.[FDesig],st.[FNationality],st.[FOfficeAddress],st.[Fmail],st.[FQualification]
           ,st.[FAdharNo],st.[MotherName],st.[Mmobile],st.[MJob],st.[MDOB],st.[MDesig],st.[MNationality],st.[MOfficeAddress],st.[Mmail],st.[MQualification]
            ,st.[MAdharNo],st.[FIncome],st.MIncome,st.GuardianName,st.[Relation],st.[GQualification],st.[GJob],st.[GIncome],st.[GNationality],st.[GDesig],st.[Gmobile]
            ,st.[GOfficeAddress],st.[GAdharNo],st.[Gmail],st.[EmergencyNo],st.[EmerContPerson],st.[ContPersRelation],st.[RouteID],st.[DestinationID],st.[PicPath],st.[FPicPath]
           ,st.[MPicPath],st.[SUserID],st.[SPwd],st.[PUserID],st.[PPwd],st.[Status]
     --, strm.StreamName
     ,r.ReligionName, c.CategoryName,cl.CourseName
     --,bt.BatchName
     ,g.GenderName,state.StateName as permst,state1.StateName as cospst,sec.SectionName,stat.Status as stats
            FROM [TBLStudent] as st 
   --inner join tblStream strm on strm.Id= st.StreamID
            inner join tblReligion r on r.ReligionId= st.Religion inner join tblCastCategory c on c.CatId=st.CategoryID inner join tblCourses cl on cl.Id=st.ClassID
            -- inner join tblBatch bt on bt.Id=st.BatchID 
    inner join tblGender g on g.gender_id = st.GenderID inner join tblState state on state.StateId=convert(int,st.PermState)
            inner join tblState state1 on state1.StateId=convert(int,st.CorsState) inner join tblSections sec on sec.Id=st.SectionID inner join  tblStatus stat on stat.StatusID=st.Status
            where st.ID = @id;
 end



GO
/****** Object:  StoredProcedure [dbo].[sp_getStudentDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getStudentDetails]
as begin

select st.ID,RegNo,c.CourseName Class,FirstName,MiddleName,LastName,PicPath,
RollNo,s.SectionName,st.SMSmobileNo,ss.Status StatusName,st.Status from TBLStudent st
inner join tblCourses c on c.Id=st.ClassID
inner join tblSections s on s.Id=st.SectionID
left outer join tblStatus ss on ss.StatusID=st.Status 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_getStudentDetailsReports]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getStudentDetailsReports]
as begin

select st.ID,RegNo,c.CourseName Class,FirstName,MiddleName,LastName,PicPath,
RollNo,s.SectionName,st.DOB,st.FatherName,st.SMSmobileNo,st.MotherName,
st.FMobile,st.Mmobile,ss.Status StatusName,st.Status,
st.AadharNo,st.FAdharNo,st.MAdharNo,st.Fmail,st.Mmail,
g.GenderName,stre.StreamName,st.emailID,st.BloodGroup,
cct.CategoryName,st.AadharNo,
st.BirthPlace,st.GuardianName,st.Gmobile,st.GAdharNo,
st.Gmail,st.EmergencyNo,st.EmerContPerson,st.AcademicYear,
st.JoiningDate from TBLStudent st
inner join tblCourses c on c.Id=st.ClassID
inner join tblSections s on s.Id=st.SectionID
left outer join tblStatus ss on ss.StatusID=st.Status 
left outer join tblStream stre on stre.Id=st.StreamID 
left outer join tblCastCategory cct on cct.CatId=st.CategoryID 
left outer join tblGender g on g.gender_id=st.GenderID 
end


select * from TBLStudent

select * from tblCastCategory



GO
/****** Object:  StoredProcedure [dbo].[sp_ImportEmployeeDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[sp_ImportEmployeeDetails]
as begin
  declare @count int

  select @count=count(*) from tblEmployeeTempImport
  declare @num int;

set @num=1;

while(@count>=@num)
  begin
  declare @total int

  insert into tblEmployee(Empcode,JoiningDt,DeptID,DesigID,Qualification,Experience
  ,StaffCategory,FirstName,MiddleName,LastName,DOB,GenderID,City,State,Country,Pincode,Mobile,Email,
  MaritalSatus,AdharNo,Religion,FatherName,MotherName,PresentAddress,PermAddress)
	select EmployeeCode,JoiningDate,dp.DepartmentId,dg.DesigID,Q.QualificationId,TotalExperience,
	ut.id Staff,FirstName,MiddleName,LastName,DOB,g.gender_id,ct.Id,st.StateId,c.CountryID,PinCode,MobileNo,EmailAddress,
	mt.Id maritalstatus,AdhaarNumber,rg.ReligionId,FatherName,MotherName ,PresentAddress,PermanentAddress from tblEmployeeTempImport EI
	left outer join tblDepartmnet dp on dp.DepartmentName=EI.Department
	left outer join tblDesignation dg on dg.Designation=EI.Designation
	left outer join tblQualifications Q on Q.QualificationName=EI.Qualification
	left outer join tblStaffCategory ut on ut.Name=EI.StaffType
	left outer join tblGender g on g.GenderName=EI.Gender
	left outer join tblCountry c on c.CountryName=EI.Country
	left outer join tblCity  ct on ct.CityName=EI.City
	left outer join tblState  st on st.StateName=EI.State
	left outer join tblMaritalStatus  mt on mt.Name=EI.MaritalStatus
	left outer join tblReligion  rg on rg.ReligionName=EI.Religon

  where EI.Id=@num;
       set @num= @num+1;
	   print @num;
  end

  drop table tblEmployeeTempImport
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ImportStudentDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_ImportStudentDetails
CREATE Procedure [dbo].[sp_ImportStudentDetails]
as begin
BEGIN TRY
  declare @count int

  select @count=count(*) from tblStudentTempImport
  declare @num int;

set @num=1;

while(@count>=@num)
  begin
  declare @total int
insert into TBLStudent(AcademicYear,RegNo,JoiningDate,ClassID,SectionID,StreamID,FirstName,MiddleName,LastName,DOB,GenderID,
   Nationality,CategoryID,PermanentAddress,PermPincode,PermState,PermCity,SMSmobileNo,FatherName,
     FMobile,MotherName,Mmobile,EmergencyNo,EmerContPerson,ContPersRelation,Status,BatchID,RollNo)
     select ay.ID,StudentCode,AdmissionDate,c.Id,s.Id,ISNULL(ss.Id,0),FirstName,MiddleName,LastName,DOB,g.gender_id,
   Nationality,cc.CatId,ResidentalAddress,PinCode,st.StateId,City,PhoneNumberForSMS,FatherName,
   FMobileNo,MotherName,MMobileNo,EmergencyContactNo,ContactPerson,Relationship,sta.StatusID,0,'' from
   tblStudentTempImport si
  left outer join  tblAcademicYear ay on cast(year(ay.DateFrom) as varchar(50)) +'-'+SUBSTRING(cast(year(ay.DateTo) as varchar(50)),3,3) =si.AcademicYear
    left outer join tblCourses c on c.CourseName=si.Class
   left outer join tblSections s on s.SectionName=si.Section and s.ClassId=c.Id
  left outer join tblStream ss on ss.StreamName=si.Stream  and ss.Class=c.Id
   left outer join tblGender g on g.GenderName=si.Gender
   left outer join tblCastCategory cc on cc.CategoryName=si.Category
   left outer join tblState st on st.StateName=si.State
   left outer join tblStatus sta on sta.Status=si.Status
   where si.Id=@num;

   declare @statuss nvarchar(150),@stdId int,@regNo nvarchar(150)
  

    select @statuss=Status,@regNo=StudentCode from tblStudentTempImport where Id=@num
	select @stdId=ID from TBLStudent where RegNo=@regNo
	if(@statuss='Active') 
	begin 
	   insert into tblScholarRegister(StudentID,ModifiedDate) values(@stdId,GETDATE())
	end

    set @num= @num+1;
	   print @num;
  end

  drop table tblStudentTempImport 
  END TRY
  BEGIN CATCH
     drop table tblStudentTempImport
	End CATCH
end


--select * from tblStudentTempImport



select * from TBLStudent
 


GO
/****** Object:  StoredProcedure [dbo].[sp_ImportStudentImportExcelData]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[sp_ImportStudentImportExcelData]
      @tblStudentsExcel StudentExcel  READONLY
AS
BEGIN
BEGIN TRY
      SET NOCOUNT ON;
     
	 create table tblStudentTempImport(Id int identity(1,1),
	[StudentCode] [varchar](150) NULL,
	[AcademicYear] [nvarchar](150) NULL,
	[AdmissionDate] varchar(150) NULL,
	[Class] [varchar](150) NULL,
	[Section] [varchar](150) NULL,
 	[Stream] [varchar](150) NULL,
	[FirstName] [varchar](150) NULL,
	[MiddleName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[DOB] varchar(150) NULL,
	[Gender] [varchar](150) NULL,
	[Nationality] [varchar](150) NULL,
	[Category] [varchar](150) NULL,
	[ResidentalAddress] [varchar](max) NULL,
	[City] [varchar](150) NULL,
	[State] [varchar](150) NULL,
	[PinCode] [varchar](150) NULL,
	[PhoneNumberForSMS] bigint NULL,
	[FatherName] [varchar](150) NULL,
	[FMobileNo] bigint NULL,
	[MotherName] [varchar](150) NULL,
	[MMobileNo] bigint NULL,
	[EmergencyContactNo] [varchar](150) NULL,
	[ContactPerson] [varchar](150) NULL,
	[Relationship] [varchar](350) NULL,
	[Status] [nvarchar](100) NULL
	
	 )

      INSERT INTO tblStudentTempImport(StudentCode,AcademicYear,AdmissionDate,Class,Section,
 	Stream,FirstName,MiddleName,LastName,DOB,Gender,Nationality,Category,
	ResidentalAddress,City,State,PinCode,PhoneNumberForSMS,FatherName,FMobileNo,
	MotherName,MMobileNo,EmergencyContactNo,ContactPerson,Relationship,Status)
      SELECT StudentCode,AcademicYear,AdmissionDate,Class,Section,
 	Stream,FirstName,MiddleName,LastName,DOB,Gender,Nationality,Category,
	ResidentalAddress,City,State,PinCode,PhoneNumberForSMS,FatherName,FMobileNo,
	MotherName,MMobileNo,EmergencyContactNo,ContactPerson,Relationship,Status FROM @tblStudentsExcel

	  exec sp_ImportStudentDetails
	END TRY
	BEGIN CATCH
  	    drop table tblStudentTempImport
	End CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[sp_searchClassTeacherReport]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_searchExpensePaymentDetails 'rahul','01/17/2018','Cash'
create procedure [dbo].[sp_searchClassTeacherReport]
@class varchar(15),
@section varchar(150),
@teacherName varchar(150)
 
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@startdated varchar(150),@enddated varchar(150)

 set @clause='';
 
 
   
   if(@class!='0')
   begin
     set @clause+=' and ct.ClassID  like ''%'+@class+'%''';
   end
   if(@section!='')
    begin
     set @clause = ' and ct.SectionID ='''+@section+''''
	 print @clause
	end
   if(@teacherName!='')
    begin
     set @clause+= ' and ct.EmpID='''+@teacherName +'''';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select c.CourseName,s.SectionName,e.FirstName,e.MiddleName,e.LastName,
					d.DepartmentName,dg.Designation,ct.* from tblClassTeacherAllocation ct
					left outer join tblCourses c on c.Id=ct.ClassID
					left outer join tblSections s on s.Id=ct.SectionID
					left outer join tblemployee e on e.Id=ct.EmpID
					left outer join tblDepartmnet d on d.DepartmentId=e.DeptID
					left outer join tblDesignation dg on dg.DesigID=e.DeptID
			  	   where '+@mainClause+' and ct.Status=3';

											 

   exec (@query)
 
 
 
 
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeAttendenceForFilter]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForSms '','Bharti','0','0','0'

CREATE procedure [dbo].[sp_searchEmployeeAttendenceForFilter]
@empcode varchar(100),
@empName nvarchar(200),
@department varchar(15),
@designation varchar(15),
@staff varchar(15)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max)

 set @clause='';
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@department!='0')
    begin
     set @clause+= ' and DeptID='+@department+'';
	 
	end
	 if(@designation!='0')
    begin
     set @clause+= ' and DesigID='+@designation+'';
 	end
	 if(@staff!='0')
    begin
     set @clause+= ' and StaffCategory='+@staff+'';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query=' select * from   tblEmployee where '+@mainClause+' and Status=1';

--print @query
  exec (@query)
 
 
 

 --select * from   tblEmployee where 
 
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeForAttendence]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForSms '','Bharti','0','0','0'

CREATE procedure [dbo].[sp_searchEmployeeForAttendence]
@empcode varchar(100),
@empName nvarchar(200),
@department varchar(15),
@designation varchar(15),
@staff varchar(15)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max)

 set @clause='';
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@department!='0')
    begin
     set @clause+= ' and em.DeptID='+@department+'';
	 
	end
	 if(@designation!='0')
    begin
     set @clause+= ' and em.DesigID='+@designation+'';
 	end
	 if(@staff!='0')
    begin
     set @clause+= ' and em.StaffCategory='+@staff+'';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select d.DepartmentName,desg.Designation,qualf.QualificationName,sc.Name staff
                                            , g.GenderName, cit.CityName, st.StateName, c.CountryName, ms.Name Marital,
                                            rg.ReligionName, em.* from tblEmployee em
                                             left outer join tblDepartmnet d on d.DepartmentId = em.DeptID
                                            left outer join tblDesignation desg on desg.DesigID = em.DesigID
                                            left outer join tblQualifications qualf on qualf.QualificationId = em.Qualification
                                            left outer join tblStaffCategory sc on sc.Id = em.StaffCategory
                                            left outer join tblGender g on g.gender_id = em.GenderID
                                            left outer join tblCity cit   on cit.Id = em.City
                                            left outer join tblState st   on st.StateId = em.State
                                            left outer join tblCountry c   on c.CountryID = em.Country
                                            left outer join tblMaritalStatus ms   on ms.Id = em.MaritalSatus
                                            left outer join tblReligion rg   on rg.ReligionId = em.Religion
                                            where '+@mainClause+' and em.Status=1';

--print @query
  exec (@query)
 
 
 
 
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeForLeaveRequest]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForLeaveRequest '','Bharti','12-10-2017','12-31-2017',4

CREATE procedure [dbo].[sp_searchEmployeeForLeaveRequest]
@empcode varchar(100),
@empName nvarchar(200),
@startdate varchar(150),
@enddate varchar(150),
@status varchar(50)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@startdated varchar(150),@enddated varchar(150)

 set @clause='';
 set @startdated= convert(date, @startdate,105)
  set @enddated= convert(date, @enddate,105)
  print @startdated
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@startdate!='' and  @enddate!='')
    begin
  --set @clause+= ' and lr.StatDate> '''+ convert(date, @startdate,103)+''' and lr.EndDate<'''+convert(date,@enddate,103) +'''';

  -- set @clause+= ' and lr.StatDate> '''+ cast(convert(date, ''+@startdate+'',103)+''' and lr.EndDate<'''+convert(date,''+@enddate+'',103) as date)+'''';

    set @clause = ' and lr.StatDate >'''+@startdated+''' AND lr.EndDate < '''+@enddated+ ''''
	 print @clause
	end
   if(@status!='0')
    begin
     set @clause+= ' and lr.LeavStatus='''+@status +'''';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select e.FirstName,e.MiddleName,e.LastName,d.DepartmentName,dd.Designation,e.Image,lt.LeaveName,s.Status ,lr.* from tblemployeeLeaveRequest lr
                                                left outer join tblEmployee e on e.Id=lr.EmployeeID
                                                left outer join tblDepartmnet d on d.DepartmentId=lr.Department
                                                left outer join tblDesignation dd on dd.DesigID=lr.Designation
                                                left outer join tblLeaveType lt on lt.LeaveId=lr.LeaveType
                                                left outer join tblStatus s on s.StatusID=lr.LeavStatus
                                            where '+@mainClause+'';

											 

--print @query
  exec (@query)
 
 
 
 
 
end

 

--select e.FirstName,e.MiddleName,e.LastName,d.DepartmentName,dd.Designation,e.Image,lt.LeaveName,s.Status ,lr.* from tblemployeeLeaveRequest lr
--                                             left outer join tblEmployee e on e.Id=lr.EmployeeID
--                                             left outer join tblDepartmnet d on d.DepartmentId=lr.Department
--                                             left outer join tblDesignation dd on dd.DesigID=lr.Designation
--                                             left outer join tblLeaveType lt on lt.LeaveId=lr.LeaveType
--                                             left outer join tblStatus s on s.StatusID=lr.LeavStatus
--                                         where FirstName+MiddleName+LastName  like '%Bharti%'  and  lr.StatDate   >convert(date,@,103) AND  lr.EndDate  < convert(date,'31-12-2017',103)



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeForLeaveRequestReport]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForLeaveRequest '','Bharti','12-10-2017','12-31-2017',4

CREATE procedure [dbo].[sp_searchEmployeeForLeaveRequestReport]
@empcode varchar(100),
@empName nvarchar(200),
@startdate varchar(150),
@enddate varchar(150),
@status varchar(50),
@dept varchar(50),
@desg varchar(50),
@staff varchar(50),
@leaveType varchar(50)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@startdated varchar(150),@enddated varchar(150)

 set @clause='';
 set @startdated= convert(date, @startdate,105)
  set @enddated= convert(date, @enddate,105)
  print @startdated
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@startdate!='' and  @enddate!='')
    begin
    set @clause = ' and lr.StatDate >'''+@startdated+''' AND lr.EndDate < '''+@enddated+ ''''
	 print @clause
	end
   if(@status!='0')
    begin
     set @clause+= ' and lr.LeavStatus='''+@status +'''';
	    
	end
	if(@dept!='0')
		begin
		 set @clause+= ' and lr.Department='''+@dept +'''';
		end
	 if(@desg!='0')
		begin
		 set @clause+= ' and lr.Designation='''+@desg +'''';
		end
		if(@staff!='0')
		begin
 
		 set @clause+= ' and e.StaffCategory='''+@staff +'''';
		end
		if(@leaveType!='0')
		begin
 
		 set @clause+= ' and lr.LeaveType='''+@leaveType +'''';
		end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
		set @query='select e.FirstName,e.Empcode,e.MiddleName,e.LastName,d.DepartmentName,dd.Designation,e.Image
		            ,e.StaffCategory,lt.LeaveName,s.Status ,lr.* from tblemployeeLeaveRequest lr
						left outer join tblEmployee e on e.Id=lr.EmployeeID
						left outer join tblDepartmnet d on d.DepartmentId=lr.Department
						left outer join tblDesignation dd on dd.DesigID=lr.Designation
						left outer join tblLeaveType lt on lt.LeaveId=lr.LeaveType
						left outer join tblStatus s on s.StatusID=lr.LeavStatus
					where '+@mainClause+'';

											 

--print @query
  exec (@query)
 
 
 
 
 
end

 

--select e.FirstName,e.Empcode,e.MiddleName,e.LastName,d.DepartmentName,dd.Designation,e.Image,lt.LeaveName,s.Status ,lr.* from tblemployeeLeaveRequest lr
--left outer join tblEmployee e on e.Id=lr.EmployeeID
--left outer join tblDepartmnet d on d.DepartmentId=lr.Department
--left outer join tblDesignation dd on dd.DesigID=lr.Designation
--left outer join tblLeaveType lt on lt.LeaveId=lr.LeaveType
--left outer join tblStatus s on s.StatusID=lr.LeavStatus
--                                         where FirstName+MiddleName+LastName  like '%Bharti%'  and  lr.StatDate   >convert(date,@,103) AND  lr.EndDate  < convert(date,'31-12-2017',103)



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeForSms]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForSms '','Bharti','0','0','0'

CREATE procedure [dbo].[sp_searchEmployeeForSms]
@empcode varchar(100),
@empName nvarchar(200),
@department varchar(15),
@designation varchar(15),
@staff varchar(15)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max)

 set @clause='';
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@department!='0')
    begin
     set @clause+= ' and em.DeptID='+@department+'';
	 
	end
	 if(@designation!='0')
    begin
     set @clause+= ' and em.DesigID='+@designation+'';
 	end
	 if(@staff!='0')
    begin
     set @clause+= ' and em.StaffCategory='+@staff+'';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select d.DepartmentName,desg.Designation,qualf.QualificationName,sc.Name staff
                                            , g.GenderName, cit.CityName, st.StateName, c.CountryName, ms.Name Marital,
                                            rg.ReligionName, em.* from tblEmployee em
                                             left outer join tblDepartmnet d on d.DepartmentId = em.DeptID
                                            left outer join tblDesignation desg on desg.DesigID = em.DesigID
                                            left outer join tblQualifications qualf on qualf.QualificationId = em.Qualification
                                            left outer join tblStaffCategory sc on sc.Id = em.StaffCategory
                                            left outer join tblGender g on g.gender_id = em.GenderID
                                            left outer join tblCity cit   on cit.Id = em.City
                                            left outer join tblState st   on st.StateId = em.State
                                            left outer join tblCountry c   on c.CountryID = em.Country
                                            left outer join tblMaritalStatus ms   on ms.Id = em.MaritalSatus
                                            left outer join tblReligion rg   on rg.ReligionId = em.Religion
                                            where '+@mainClause+'';

--print @query
  exec (@query)
 
 
 
 
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeReporting]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeReporting '','arun','0','0','0','true'

CREATE procedure [dbo].[sp_searchEmployeeReporting]
@empcode varchar(100),
@empName nvarchar(200),
@department varchar(15),
@designation varchar(15),
@staff varchar(15),
@status varchar(100) 
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@st bit 
 
 set @clause='';
 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
   end
   if(@department!='0')
    begin
     set @clause+= ' and em.DeptID='+@department+'';
	 
	end
	 if(@designation!='0')
    begin
     set @clause+= ' and em.DesigID='+@designation+'';
 	end
	 if(@staff!='0')
    begin
     set @clause+= ' and em.StaffCategory='+@staff+'';
	    
	end
	 if(@status!='0')
    begin
    print @status;
    if(@status='true')
        begin
         set @clause+= ' and em.Status=''true''' ;
	    end
	    else
	      begin 
	      set @clause+= ' and em.Status=''false''' ;
	      end
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select em.Id,Empcode,td.DepartmentName,desg.Designation,sc.Name staff,
qc.QualificationName,FirstName,MiddleName,LastName,Cast(DOB AS DATE) DOB,
	gen.GenderName,em.Image,em.Status,em.Mobile,em.Email,
	Cast(em.JoiningDt AS DATE) JoiningDate,em.Experience,
	em.AdharNo,em.BankName,em.BiometricID,em.ESINO,em.IFSCCode,
	em.PANNO,em.PFNo,em.AccountNumber,em.BankName from tblEmployee em
left outer join tblDepartmnet td on td.DepartmentId=em.DeptID 
left outer join tblDesignation desg on desg.DesigID=em.DesigID 
left outer join tblStaffCategory sc on sc.Id=em.StaffCategory 
left outer join tblQualifications qc on qc.QualificationId=em.Qualification 
left outer join tblGender gen on gen.gender_id=em.GenderID 
				where '+@mainClause+' and em.Status=1';

--print @query
  exec (@query)
 
 
 
 
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchEmployeeSalryDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeSalryDetails '','arun','02/01/2018','02/28/2018','0'
CREATE procedure [dbo].[sp_searchEmployeeSalryDetails]
@empcode varchar(100),
@empName nvarchar(200),
@startdate varchar(150),
@enddate varchar(150),
@designation varchar(50)
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@startdated varchar(150),@enddated varchar(150)

 set @clause='';
 set @startdated= convert(date, @startdate,110)
   print @startdated
  set @enddated= convert(date, @enddate,110)

 if @empcode!='' 
 begin
     set @clause+=' and Empcode='''+@empcode+'''';
	 
   end
   if(@empName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@empName+'%''';
	 print @clause
   end
   if(@startdate!='' and  @enddate!='')
    begin
     set @clause += ' and s.FromDate >='''+@startdated+''' AND s.toDate <= '''+@enddated+ ''''
	-- print @clause
	end
   if(@designation!='0')
    begin
     set @clause+= ' and s.DesignationId='''+@designation +'''';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select e.FirstName,e.MiddleName,e.LastName,d.DepartmentName,dd.Designation,e.Image,s.* from tblEmployeeSalaryDetails s
left outer join tblEmployee e on e.Id=s.EmployeeId
left outer join tblDesignation dd on dd.DesigID=s.DesignationId
left outer join tblDepartmnet d on d.DepartmentId=e.DeptID
                                            where '+@mainClause+'';
 											 

 print @query
  exec (@query)
 
 
  
 
end



GO
/****** Object:  StoredProcedure [dbo].[sp_searchExpensePaymentDetails]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_searchExpensePaymentDetails 'rahul','01/17/2018','Cash'
CREATE procedure [dbo].[sp_searchExpensePaymentDetails]
@name varchar(100),
@date varchar(150),
@paymentMode varchar(150)
 
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@startdated varchar(150),@enddated varchar(150)

 set @clause='';
 set @startdated= convert(date, @date,101)
 
  print @startdated
   if(@name!='')
   begin
     set @clause+=' and ee.PayeeName  like ''%'+@name+'%''';
   end
   if(@date!='')
    begin
  --set @clause+= ' and lr.StatDate> '''+ convert(date, @startdate,103)+''' and lr.EndDate<'''+convert(date,@enddate,103) +'''';

  -- set @clause+= ' and lr.StatDate> '''+ cast(convert(date, ''+@startdate+'',103)+''' and lr.EndDate<'''+convert(date,''+@enddate+'',103) as date)+'''';

    set @clause = ' and ep.PaymentDate ='''+@startdated+''''
	 print @clause
	end
   if(@paymentMode!='')
    begin
     set @clause+= ' and ep.PaymentMode='''+@paymentMode +'''';
	    
	end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
				left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
				left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId
			  	   where '+@mainClause+'';

											 

--print @query
  exec (@query)
 
 
 
 
 
end

 --select * from tblTransExPayeeDetails



GO
/****** Object:  StoredProcedure [dbo].[sp_searchStudentattendenceReports]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchEmployeeForSms '','Bharti','0','0','0'

create procedure [dbo].[sp_searchStudentattendenceReports]
@regcode varchar(100),
@stuname nvarchar(200),
@section varchar(15),
@class varchar(15)
 
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max)

 set @clause='';
 if @regcode!='' 
 begin
     set @clause+=' and RegNo='''+@regcode+'''';
	 
   end
   if(@stuname!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@stuname+'%''';
   end
   if(@class!='0')
    begin
     set @clause+= ' and ClassID='+@class+'';
	 
	end
	 if(@section!='0')
    begin
     set @clause+= ' and SectionID='+@section+'';
 	end
	-- if(@staff!='0')
 --   begin
 --    set @clause+= ' and StaffCategory='+@staff+'';
	    
	--end

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query=' select * from   TBLStudent where '+@mainClause+' and Status=3';

--print @query
  exec (@query)
 
 
 

 --select * from   tblEmployee where 
 
 
end


 
 
--select * from TBLStudent



GO
/****** Object:  StoredProcedure [dbo].[sp_searchStudentForAttendence]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_searchStudentForAttendence '','rahul','12/27/2017',1002
CREATE procedure [dbo].[sp_searchStudentForAttendence]
@regNo varchar(100),
@studentName nvarchar(200),
@attendenceDate date,
@empId nvarchar(20) 

as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@attdate nvarchar(100)

 set @clause='';
 set @attdate= convert(date, @attendenceDate,101)
 if @regNo!='' 
 begin
     set @clause+=' and s.RegNo='''+@regNo+'''';
	 
   end
   if(@studentName!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@studentName+'%''';
	 
   end
   if(@attendenceDate!='')
    begin
	    set @clause += ' and st.AttendenceDate ='''+@attdate+''''; 
  	end
 
 	  print @clause
	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query=' select s.RegNo,s.PicPath,s.RollNo,s.FirstName,s.MiddleName,s.LastName,st.* from tblStudentAttendence st
				left outer join TBLStudent s on s.ID=st.StudentId
				where '+@mainClause+' and TeacherId='+@empId;

--print @query
  exec (@query)
 
 
 
 
 
end

 

 --select s.regno,s.picpath,s.rollno,s.firstname,s.middlename,s.lastname,st.* from tblstudentattendence st
 --left outer join tblstudent s on s.id=st.studentid
 --where FirstName+MiddleName+LastName  like '%rahul%'  firstname+middlename+lastname like '%rahul%'



GO
/****** Object:  StoredProcedure [dbo].[sp_searchStudentReporting]    Script Date: 7/28/2018 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_searchStudentReporting]
@studentcode varchar(100),
@stdname nvarchar(200),
@class varchar(15),
@section varchar(15),
@rollno varchar(150),
@status varchar(100) 
as begin
 
declare @clause varchar(500),@mainClause varchar(600),@query nvarchar(max),@st bit 
 
 set @clause='';
 if @studentcode!='' 
 begin
     set @clause+=' and RegNo='''+@studentcode+'''';
	 
   end
   if(@stdname!='')
   begin
     set @clause+=' and FirstName+MiddleName+LastName  like ''%'+@stdname+'%''';
   end
   if(@class!='0')
    begin
     set @clause+= ' and st.ClassID='+@class+'';
	 
	end
	 if(@section!='0')
    begin
     set @clause+= ' and st.SectionID='+@section+'';
 	end
	 if(@rollno!='')
    begin
     set @clause+= ' and st.RollNo='''+@rollno+'''';
	    
	end
	 if(@status!='0')
        begin
         set @clause+= ' and st.Status='+@status+'' ;
	    end
	    
	 

	  SET @mainClause = RIGHT(RTRIM(@clause), LEN(@clause) - 4)

 
   set @query='select st.ID,RegNo,c.CourseName Class,FirstName,MiddleName,LastName,PicPath,
			RollNo,s.SectionName,st.DOB,st.FatherName,st.SMSmobileNo,st.MotherName,
			st.FMobile,st.Mmobile,ss.Status StatusName,st.Status,
			st.AadharNo,st.FAdharNo,st.MAdharNo,st.Fmail,st.Mmail,
			g.GenderName,stre.StreamName,st.emailID,st.BloodGroup,
			cct.CategoryName,st.AadharNo,
			st.BirthPlace,st.GuardianName,st.Gmobile,st.GAdharNo,
			st.Gmail,st.EmergencyNo,st.EmerContPerson,st.AcademicYear,
			st.JoiningDate from TBLStudent st
			inner join tblCourses c on c.Id=st.ClassID
			inner join tblSections s on s.Id=st.SectionID
			left outer join tblStatus ss on ss.StatusID=st.Status 
			left outer join tblStream stre on stre.Id=st.StreamID 
			left outer join tblCastCategory cct on cct.CatId=st.CategoryID 
			left outer join tblGender g on g.gender_id=st.GenderID 
			where '+@mainClause+'';

--print @query
  exec (@query)
 
 
 
 
 
end



GO
USE [master]
GO
ALTER DATABASE [SchoolERP1] SET  READ_WRITE 
GO
