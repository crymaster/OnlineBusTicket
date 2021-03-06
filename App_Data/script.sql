CREATE DATABASE OnlineBusTicket
GO
USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin1] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpId] [int] IDENTITY(100000,1) NOT NULL,
	[CentralID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nchar](20) NULL,
	[DOB] [datetime] NULL,
	[Qualification] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nchar](20) NULL,
	[DOB] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[CustomerID] [char](12) NOT NULL,
 CONSTRAINT [PK__Customers__2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Centrals]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centrals](
	[CentralID] [int] IDENTITY(1,1) NOT NULL,
	[Cent_Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Director] [nvarchar](50) NULL,
	[Phone] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CentralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Rate] [float] NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bus](
	[BusID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NumSeat] [int] NULL,
	[StationID] [int] NULL,
	[NumberPlate] [char](20) NULL,
	[Cat_ID] [int] NULL,
 CONSTRAINT [PK__Bus__47DBAE45] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookID] [int] IDENTITY(1000,1) NOT NULL,
	[EmpID] [int] NULL,
	[BookingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[StartingPlace] [int] NOT NULL,
	[Destination] [int] NOT NULL,
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[Distance] [int] NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[StartingPlace] ASC,
	[Destination] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Routes] ON [dbo].[Routes] 
(
	[RouteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RouteBus]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RouteBus](
	[BusID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[RBID] [int] IDENTITY(1,1) NOT NULL,
	[AvailableSeat] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_RouteBus] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC,
	[RouteID] ASC,
	[DateStart] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_RouteBus] UNIQUE NONCLUSTERED 
(
	[RBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[RBID] [int] NOT NULL,
	[SeatNum] [int] NOT NULL,
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[RBID] ASC,
	[SeatNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tickets] ON [dbo].[Tickets] 
(
	[TicketID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[BookID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[CustomerID] [char] (12) NOT NULL,
	[BDID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[IsCanceled] [bit] NOT NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[TicketID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_BookingDetails] UNIQUE NONCLUSTERED 
(
	[BDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 07/25/2014 15:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanceledTickets](
	[CTID] [int] IDENTITY(1,1) NOT NULL,
	[BDID] [int] NULL,
	[Refund] [float] NOT NULL,
	[Date] [datetime] NULL,
	[Reason] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  ForeignKey [FK_Bus_Categories]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Categories] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Categories] ([Cat_ID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Categories]
GO
/****** Object:  ForeignKey [FK_Bus_Centrals]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Centrals] FOREIGN KEY([StationID])
REFERENCES [dbo].[Centrals] ([CentralID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Centrals]
GO
/****** Object:  ForeignKey [FK_Bookings_Employees]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpId])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Employees]
GO
/****** Object:  ForeignKey [FK_Routes_Locations]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations] FOREIGN KEY([StartingPlace])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations]
GO
/****** Object:  ForeignKey [FK_Routes_Locations1]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations1] FOREIGN KEY([Destination])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations1]
GO
/****** Object:  ForeignKey [FK_RouteBus_Bus]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Bus] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Bus]
GO
/****** Object:  ForeignKey [FK_RouteBus_Routes]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Routes]
GO
/****** Object:  ForeignKey [FK_Tickets_RouteBus]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_RouteBus] FOREIGN KEY([RBID])
REFERENCES [dbo].[RouteBus] ([RBID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_RouteBus]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Bookings]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings] FOREIGN KEY([BookID])
REFERENCES [dbo].[Bookings] ([BookID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Employees]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Customers]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Tickets]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Tickets]
GO
/****** Object:  ForeignKey [FK_CanceledTickets_BookingDetails]    Script Date: 07/25/2014 15:48:58 ******/
ALTER TABLE [dbo].[CanceledTickets]  WITH CHECK ADD  CONSTRAINT [FK_CanceledTickets_BookingDetails] FOREIGN KEY([BDID])
REFERENCES [dbo].[BookingDetails] ([BDID])
GO
ALTER TABLE [dbo].[CanceledTickets] CHECK CONSTRAINT [FK_CanceledTickets_BookingDetails]
GO
