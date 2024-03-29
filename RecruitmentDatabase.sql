USE [master]
GO
/****** Object:  Database [XYZRecruitmentDatabase]    Script Date: 6/4/2020 9:04:29 AM ******/
CREATE DATABASE [XYZRecruitmentDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZRecruitmentDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSS\MSSQL\DATA\XYZRecruitmentDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XYZRecruitmentDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSS\MSSQL\DATA\XYZRecruitmentDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZRecruitmentDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET QUERY_STORE = OFF
GO
USE [XYZRecruitmentDatabase]
GO
/****** Object:  User [Phoebe]    Script Date: 6/4/2020 9:04:29 AM ******/
CREATE USER [Phoebe] FOR LOGIN [Venkata] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [ReimbursementEntry]    Script Date: 6/4/2020 9:04:29 AM ******/
CREATE ROLE [ReimbursementEntry]
GO
ALTER ROLE [ReimbursementEntry] ADD MEMBER [Phoebe]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Phoebe]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ReimbursementEntry]
GO
/****** Object:  Table [dbo].[AirlineReservation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirlineReservation](
	[TicketID] [int] NOT NULL,
	[InterviewID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[InterviewLocationID] [int] NOT NULL,
	[FlightDetails] [varchar](100) NULL,
	[AirlineFare] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelReservation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelReservation](
	[ReservationID] [int] NOT NULL,
	[InterviewID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[InterviewLocationID] [int] NOT NULL,
	[HotelDetails] [varchar](100) NOT NULL,
	[HotelFare] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarRental]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarRental](
	[RentalID] [int] NOT NULL,
	[InterviewID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[InterviewLocationID] [int] NOT NULL,
	[CarDetails] [varchar](50) NULL,
	[RentalFare] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ReiumbursementAmount]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReiumbursementAmount]
AS 
Select x.CandidateID , x.AirlineFare ,y.HotelFare , Z.RentalFAre 
FROM AirlineReservation AS x JOIN HotelReservation  AS y 
on x.CandidateID = y.CandidateID JOIN CarRental as z 
on y.CandidateID = z.CandidateID
GO
/****** Object:  Table [dbo].[JobApplication]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplication](
	[CandidateID] [int] NOT NULL,
	[JobOpeningID] [int] NOT NULL,
	[CandidateDetailsID] [int] NOT NULL,
	[CandidateStatus] [varchar](50) NOT NULL,
	[CandidateName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintHandling]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintHandling](
	[ComplaintID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[InterviewerID] [int] NOT NULL,
	[ComplaintDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ComplaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ComplaintCandidate1]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ComplaintCandidate1]
AS
Select JobApplication.CandidateID , InterviewerID, ComplaintDescription
FROM JobApplication JOIN ComplaintHandling
on JobApplication.CandidateID = ComplaintHandling.CandidateID
GO
/****** Object:  View [dbo].[ComplaintCandidate2]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ComplaintCandidate2]
AS
Select JobApplication.CandidateID , InterviewerID, ComplaintDescription
FROM JobApplication JOIN ComplaintHandling
on JobApplication.CandidateID = ComplaintHandling.CandidateID
GO
/****** Object:  Table [dbo].[Onboarding]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Onboarding](
	[OnboardingID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[JobOpeningID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[CandidateDocuments] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OnboardingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[OnboardingDetails]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[OnboardingDetails](@OnboardingID INT)
RETURNS TABLE
AS
RETURN
(
   SELECT Onboarding.OnboardingID , Onboarding.CandidateDocuments , JobApplication.CandidateName ,JobApplication.CandidateStatus
   FROM Onboarding join JobApplication
   ON Onboarding.CandidateID = JobApplication.CandidateID
   WHERE OnboardingID =@OnboardingID
   );
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[InterviewID] [int] NOT NULL,
	[InterviewerID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[InterviewResult] [char](50) NOT NULL,
	[InterviewType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CandidateInterview]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CandidateInterview]
AS
Select CandidateName , InterviewResult
FROM JobApplication JOIN Interview
ON JobApplication.CandidateID = Interview.CandidateID
GO
/****** Object:  Table [dbo].[JobOfferNegotitation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOfferNegotitation](
	[NegotiationID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[NegotitationStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NegotiationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[JobOfferNegotiation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[JobOfferNegotiation](@NegotiationID INT)
RETURNS TABLE      --VENKATA SAI PAWAN KOMARAVOLU
AS
RETURN
(
   SELECT JobOfferNegotitation.NegotiationID,JobOfferNegotitation.NegotitationStatus,JobApplication.CandidateName
   FROM JobOfferNegotitation join JobApplication
   ON JobOfferNegotitation.CandidateID = JobApplication.CandidateID
   WHERE NegotiationID = @NegotiationID
   );
GO
/****** Object:  Table [dbo].[JobOpening]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobOpening](
	[JobOpeningID] [int] NOT NULL,
	[JobRole] [varchar](50) NOT NULL,
	[JobDescription] [varchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[JobType] [varchar](50) NOT NULL,
	[NoOfJobOpenings] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JobOpeningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CandidateApplied]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CandidateApplied]
AS
Select CandidateName , JobRole ,NoOfJobOpenings
FROM JobApplication JOIN JobOpening
ON JobApplication.JobOpeningID = JobOpening.JobOpeningID
GO
/****** Object:  View [dbo].[CandidateOnsite]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CandidateOnsite]
AS
Select x.CandidateName , y.FlightDetails ,z.HotelDetails
FROM JobApplication AS x join AirlineReservation AS y
ON x.CandidateID = y.CandidateID JOIN HotelReservation AS Z
ON y.CandidateID = z.CandidateID
GO
/****** Object:  View [dbo].[CandidateInterviewLocation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CandidateInterviewLocation]
AS
Select x.CandidateName ,x.CandidateID, y.FlightDetails ,z.HotelDetails
FROM JobApplication AS x join AirlineReservation AS y
ON x.CandidateID = y.CandidateID JOIN HotelReservation AS Z
ON y.CandidateID = z.CandidateID
--Venkata Sai Pawan komaravolu
GO
/****** Object:  View [dbo].[ComplaintCandidate]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ComplaintCandidate]
AS
Select JobApplication.CandidateID , InterviewerID, ComplaintDescription
FROM JobApplication JOIN ComplaintHandling
on JobApplication.CandidateID = ComplaintHandling.CandidateID
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[ContactID] [int] NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateDetails]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateDetails](
	[CandidateDetailsID] [int] NOT NULL,
	[CandidateName] [char](50) NULL,
	[AddressID] [int] NOT NULL,
	[ContactID] [int] NOT NULL,
	[CandidateQualificationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CandidateConatact]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[CandidateConatact]
AS
Select CandidateName , PhoneNumber,EmailAddress
from CandidateDetails join ContactDetails
on CandidateDetails.ContactID = ContactDetails.ContactID
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] NOT NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [char](50) NOT NULL,
	[State] [char](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlacklistCandidate]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlacklistCandidate](
	[CandidateID] [int] NOT NULL,
	[CandidateName] [varchar](50) NOT NULL,
	[CandidateStatus] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlacklistedCandidate]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlacklistedCandidate](
	[CandidateID] [int] NOT NULL,
	[CandidateName] [varchar](50) NOT NULL,
	[CandidateStatus] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateQualification]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateQualification](
	[CandidateQualificationID] [int] NOT NULL,
	[GradGpa] [int] NOT NULL,
	[WorkExperienceYears] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CandidateQualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [char](30) NOT NULL,
	[DepartmentDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviewer]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviewer](
	[InterviewerID] [int] NOT NULL,
	[InterviewerName] [char](50) NOT NULL,
	[InterviewerStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewLocation]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewLocation](
	[InterviewLocationID] [int] NOT NULL,
	[BuildingName] [varchar](50) NOT NULL,
	[City] [char](50) NOT NULL,
	[State] [char](50) NOT NULL,
	[ZipCode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InterviewLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reimbursement]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reimbursement](
	[ReimbursementID] [int] NOT NULL,
	[InterviewID] [int] NOT NULL,
	[CandidateID] [int] NOT NULL,
	[RentalID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
	[ReimbursementAmount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReimbursementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (NULL) FOR [AddressLine2]
GO
ALTER TABLE [dbo].[AirlineReservation]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[AirlineReservation]  WITH CHECK ADD FOREIGN KEY([InterviewID])
REFERENCES [dbo].[Interview] ([InterviewID])
GO
ALTER TABLE [dbo].[AirlineReservation]  WITH CHECK ADD FOREIGN KEY([InterviewLocationID])
REFERENCES [dbo].[InterviewLocation] ([InterviewLocationID])
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD FOREIGN KEY([CandidateQualificationID])
REFERENCES [dbo].[CandidateQualification] ([CandidateQualificationID])
GO
ALTER TABLE [dbo].[CandidateDetails]  WITH CHECK ADD FOREIGN KEY([ContactID])
REFERENCES [dbo].[ContactDetails] ([ContactID])
GO
ALTER TABLE [dbo].[CarRental]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[CarRental]  WITH CHECK ADD FOREIGN KEY([InterviewID])
REFERENCES [dbo].[Interview] ([InterviewID])
GO
ALTER TABLE [dbo].[CarRental]  WITH CHECK ADD FOREIGN KEY([InterviewLocationID])
REFERENCES [dbo].[InterviewLocation] ([InterviewLocationID])
GO
ALTER TABLE [dbo].[ComplaintHandling]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[ComplaintHandling]  WITH CHECK ADD FOREIGN KEY([InterviewerID])
REFERENCES [dbo].[Interviewer] ([InterviewerID])
GO
ALTER TABLE [dbo].[HotelReservation]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[HotelReservation]  WITH CHECK ADD FOREIGN KEY([InterviewID])
REFERENCES [dbo].[Interview] ([InterviewID])
GO
ALTER TABLE [dbo].[HotelReservation]  WITH CHECK ADD FOREIGN KEY([InterviewLocationID])
REFERENCES [dbo].[InterviewLocation] ([InterviewLocationID])
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD FOREIGN KEY([InterviewerID])
REFERENCES [dbo].[Interviewer] ([InterviewerID])
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD FOREIGN KEY([CandidateDetailsID])
REFERENCES [dbo].[CandidateDetails] ([CandidateDetailsID])
GO
ALTER TABLE [dbo].[JobApplication]  WITH CHECK ADD FOREIGN KEY([JobOpeningID])
REFERENCES [dbo].[JobOpening] ([JobOpeningID])
GO
ALTER TABLE [dbo].[JobOfferNegotitation]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[JobOpening]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Onboarding]  WITH CHECK ADD FOREIGN KEY([JobOpeningID])
REFERENCES [dbo].[JobOpening] ([JobOpeningID])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([CandidateID])
REFERENCES [dbo].[JobApplication] ([CandidateID])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([InterviewID])
REFERENCES [dbo].[Interview] ([InterviewID])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([RentalID])
REFERENCES [dbo].[CarRental] ([RentalID])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([ReservationID])
REFERENCES [dbo].[HotelReservation] ([ReservationID])
GO
ALTER TABLE [dbo].[Reimbursement]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[AirlineReservation] ([TicketID])
GO
/****** Object:  StoredProcedure [dbo].[ApplicationStatus]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ApplicationStatus] @Status VARCHAR(50) = NULL
AS
SELECT x.CandidateName , y.CandidateID,y.CandidateStatus
FROM CandidateDetails as x JOIN JobApplication as y
on x.CandidateDetailsID = y.CandidateDetailsID
where CandidateStatus = @Status
GO
/****** Object:  StoredProcedure [dbo].[NegotiationStatus]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[NegotiationStatus] @Status VARCHAR(50) = NULL
AS
SELECT x.CandidateName ,x.CandidateID,y.NegotitationStatus
FROM JobApplication as x JOIN JobOfferNegotitation as y
on x.CandidateID = y.CandidateID
where NegotitationStatus = @Status
GO
/****** Object:  StoredProcedure [dbo].[ReiumburAmount]    Script Date: 6/4/2020 9:04:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReiumburAmount] @CandidateName VARCHAR (50) = NULL
AS
SELECT x.CandidateID, x.CandidateName , y.InterviewID , y.ReimbursementAmount
FROM JobApplication AS x join Reimbursement AS y
on x.CandidateID = y.CandidateID
WHERE CandidateName =  @CandidateName;

EXEC ReiumburAmount @CandidateName='Joey';
GO
USE [master]
GO
ALTER DATABASE [XYZRecruitmentDatabase] SET  READ_WRITE 
GO
