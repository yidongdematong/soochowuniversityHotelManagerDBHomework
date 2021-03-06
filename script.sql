USE [master]
GO
/****** Object:  Database [HotelDB]    Script Date: 2018/4/24 周二 14:56:11 ******/
CREATE DATABASE [HotelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelDB', FILENAME = N'C:\DATA\HotelDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelDB_log', FILENAME = N'C:\DATA\HotelDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelDB] SET  MULTI_USER 
GO
ALTER DATABASE [HotelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HotelDB]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillDetail](
	[AccountID] [int] NOT NULL,
	[CheckInID] [int] NOT NULL,
	[ConsumeContent] [varchar](40) NULL,
	[ConsumeMoney] [money] NULL,
	[ConsumeTime] [datetime] NULL,
	[Memo] [varchar](100) NULL,
 CONSTRAINT [BillDetail_AccountID] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingList]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingList](
	[CheckInID] [int] NOT NULL,
	[VIPID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[ArriveTime] [datetime] NULL,
	[LeaveTime] [datetime] NULL,
	[BillState] [varchar](20) NULL,
	[CheckInNumber] [int] NULL,
	[RoomID] [int] NOT NULL,
	[CheckinPrice] [money] NULL,
	[Discount] [float] NULL,
	[DiscountReason] [varchar](20) NULL,
	[AddBed] [bit] NULL,
	[Earnest] [money] NULL,
	[DestMan] [varchar](20) NULL,
	[DestCompany] [varchar](60) NULL,
	[Phone] [varchar](15) NULL,
	[Operator] [varchar](10) NULL,
	[Memo] [varchar](50) NULL,
 CONSTRAINT [BookingList_CheckInID] PRIMARY KEY CLUSTERED 
(
	[CheckInID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CheckInBill]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CheckInBill](
	[CheckInID] [int] NOT NULL,
	[VIPID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[ArriveTime] [datetime] NULL,
	[LeaveTime] [datetime] NULL,
	[BillState] [varchar](20) NULL,
	[CheckInNumber] [int] NULL,
	[RoomID] [int] NOT NULL,
	[CheckinPrice] [money] NULL,
	[Discount] [float] NULL,
	[DiscountReason] [varchar](20) NULL,
	[AddBed] [bit] NULL,
	[Earnest] [money] NULL,
	[DestMan] [varchar](20) NULL,
	[DestCompany] [varchar](60) NULL,
	[Phone] [varchar](15) NULL,
	[Operator] [varchar](10) NULL,
	[Memo] [varchar](50) NULL,
	[AmountRece] [money] NULL,
	[ConsumeMoney] [money] NULL,
	[AccountState] [bit] NULL,
	[AccountTime] [datetime] NULL,
	[PayMode] [varchar](20) NULL,
 CONSTRAINT [CheckInBill_CheckInID] PRIMARY KEY CLUSTERED 
(
	[CheckInID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FloorInfo]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FloorInfo](
	[Floorid] [int] NOT NULL,
	[Floorname] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Floorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuestRoomInfo]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuestRoomInfo](
	[RoomID] [int] NOT NULL,
	[FloorID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[GuestNumber] [int] NULL,
	[BedNumber] [int] NULL,
	[RoomDesc] [varchar](40) NULL,
	[Memo] [varchar](100) NULL,
	[State] [varchar](4) NULL,
 CONSTRAINT [GuestRoomInfo_RoomID] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuestRoomType]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuestRoomType](
	[TypeID] [int] NOT NULL,
	[Typename] [varchar](40) NULL,
	[Price] [money] NULL,
	[CombinPrice] [money] NULL,
	[OverdestineNum] [int] NULL,
	[Combination] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tableVIP]    Script Date: 2018/4/24 周二 14:56:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tableVIP](
	[VIPID] [int] NOT NULL,
	[Name] [varchar](10) NULL,
	[Job] [varchar](40) NULL,
	[Phone] [varchar](15) NULL,
	[E_mail] [varchar](20) NULL,
	[Memo] [varchar](80) NULL,
 CONSTRAINT [tableVIP_VIPID] PRIMARY KEY CLUSTERED 
(
	[VIPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[GuestRoomInfo] ADD  DEFAULT ('无人住') FOR [State]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [BillDetail_CheckInID] FOREIGN KEY([CheckInID])
REFERENCES [dbo].[CheckInBill] ([CheckInID])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [BillDetail_CheckInID]
GO
ALTER TABLE [dbo].[BookingList]  WITH CHECK ADD  CONSTRAINT [BookingList_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[GuestRoomInfo] ([RoomID])
GO
ALTER TABLE [dbo].[BookingList] CHECK CONSTRAINT [BookingList_RoomID]
GO
ALTER TABLE [dbo].[BookingList]  WITH CHECK ADD  CONSTRAINT [BookingList_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[GuestRoomType] ([TypeID])
GO
ALTER TABLE [dbo].[BookingList] CHECK CONSTRAINT [BookingList_TypeID]
GO
ALTER TABLE [dbo].[BookingList]  WITH CHECK ADD  CONSTRAINT [BookingList_VIPID] FOREIGN KEY([VIPID])
REFERENCES [dbo].[tableVIP] ([VIPID])
GO
ALTER TABLE [dbo].[BookingList] CHECK CONSTRAINT [BookingList_VIPID]
GO
ALTER TABLE [dbo].[CheckInBill]  WITH CHECK ADD  CONSTRAINT [CheckInBill_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[GuestRoomInfo] ([RoomID])
GO
ALTER TABLE [dbo].[CheckInBill] CHECK CONSTRAINT [CheckInBill_RoomID]
GO
ALTER TABLE [dbo].[CheckInBill]  WITH CHECK ADD  CONSTRAINT [CheckInBill_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[GuestRoomType] ([TypeID])
GO
ALTER TABLE [dbo].[CheckInBill] CHECK CONSTRAINT [CheckInBill_TypeID]
GO
ALTER TABLE [dbo].[CheckInBill]  WITH CHECK ADD  CONSTRAINT [CheckInBill_VIPID] FOREIGN KEY([VIPID])
REFERENCES [dbo].[tableVIP] ([VIPID])
GO
ALTER TABLE [dbo].[CheckInBill] CHECK CONSTRAINT [CheckInBill_VIPID]
GO
ALTER TABLE [dbo].[GuestRoomInfo]  WITH CHECK ADD  CONSTRAINT [GuestRoomInfo_FloorID] FOREIGN KEY([FloorID])
REFERENCES [dbo].[FloorInfo] ([Floorid])
GO
ALTER TABLE [dbo].[GuestRoomInfo] CHECK CONSTRAINT [GuestRoomInfo_FloorID]
GO
ALTER TABLE [dbo].[GuestRoomInfo]  WITH CHECK ADD  CONSTRAINT [GuestRoomInfo_TypeID] FOREIGN KEY([TypeID])
REFERENCES [dbo].[GuestRoomType] ([TypeID])
GO
ALTER TABLE [dbo].[GuestRoomInfo] CHECK CONSTRAINT [GuestRoomInfo_TypeID]
GO
ALTER TABLE [dbo].[GuestRoomInfo]  WITH CHECK ADD CHECK  (([BedNumber]>(0)))
GO
ALTER TABLE [dbo].[GuestRoomInfo]  WITH CHECK ADD CHECK  (([GuestNumber]>(0)))
GO
ALTER TABLE [dbo].[tableVIP]  WITH CHECK ADD CHECK  (([E_mail] like '%@%'))
GO
ALTER TABLE [dbo].[tableVIP]  WITH CHECK ADD CHECK  ((len([Phone])>=(11)))
GO
USE [master]
GO
ALTER DATABASE [HotelDB] SET  READ_WRITE 
GO
