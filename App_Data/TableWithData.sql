USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 07/28/2014 18:29:06 ******/
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
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Luân Văn Vũ', 1, N'luanvuhlu@gmail.com', N'Số 11 ngách 199/68', N'841648089101        ', CAST(0x0000A36900000000 AS DateTime), CAST(0x0000A3750165FB3D AS DateTime), N'5           ')
/****** Object:  Table [dbo].[Centrals]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Centrals] ON
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (1, N'Lương Yên', N'Nguyễn Khoái', N'Luân', N'12425423534         ')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (2, N'Long Biên', N'Số 11 ngách 199/68', N'Luân', N'841648089101        ')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (4, N'Cầu Giấy', N'dfgdfgdfg', N'dfgdfgdfgf', N'841648089101        ')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (5, N'Long Biên2', N'Số 11 ngách 199/68', N'sdvsdmnk', N'01648089101         ')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (6, N'Cầu Giấy', N'Số 11 ngách 199/68', N'Luân', N'12425423534         ')
SET IDENTITY_INSERT [dbo].[Centrals] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description]) VALUES (1, N'Luân Văn Vũ', 2, N'dfvfbdfbdfdb')
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description]) VALUES (2, N'Volvo', 150, N'')
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 07/28/2014 18:29:06 ******/
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
INSERT [dbo].[Admin] ([AdminID], [Email], [Password], [Name]) VALUES (1, N'luanvu@gmail.com', N'123', N'luan')
/****** Object:  Table [dbo].[Locations]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1000, N'Buu dien cau giay')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1001, N'Minh Khai')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1002, N'Lương Yên')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification]) VALUES (100000, 1, N'Luan', N'Luan@gmail.com', N'123', N'Cau GIay', N'01648089101         ', CAST(0x0000A37500000000 AS DateTime), N'12354645')
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification]) VALUES (100002, 6, N'Vũ Văn Luân', N'luanvuhlu@gmail.com', N'luanvuhlu@gmail.com', N'Số 11 ngách 199/68', N'841648089101        ', CAST(0x0000A37600000000 AS DateTime), N'12354645')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1000, 100000, CAST(0x0000A3750165FB4B AS DateTime))
SET IDENTITY_INSERT [dbo].[Bookings] OFF
/****** Object:  Table [dbo].[Bus]    Script Date: 07/28/2014 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bus](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[Bus] ON
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (1, N'12334', 34, 1, N'12                  ', 2)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (3, N'Unknown', 34, 1, N'34e                 ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (4, N'dfbvdfbdfbdf', 32, 5, N'34erter             ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (5, N'1213', 32, 2, N'12sdsd              ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (6, N'5', 34, 4, N'12sds               ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (7, N'0013', 12, 1, N'123                 ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (8, N'0042', 34, 4, N'4tergrg             ', 1)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (9, N'0014', 32, 1, N'12                  ', 2)
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (10, N'001013', 12, 1, N'123                 ', 1)
SET IDENTITY_INSERT [dbo].[Bus] OFF
/****** Object:  Table [dbo].[Routes]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[Routes] ON
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance]) VALUES (1000, 1000, 8, 1)
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance]) VALUES (1000, 1001, 1, 20)
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance]) VALUES (1000, 1002, 7, 1)
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance]) VALUES (1001, 1002, 2, 12)
SET IDENTITY_INSERT [dbo].[Routes] OFF
/****** Object:  Table [dbo].[RouteBus]    Script Date: 07/28/2014 18:29:06 ******/
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
SET IDENTITY_INSERT [dbo].[RouteBus] ON
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price]) VALUES (1, 1, CAST(0x0000A37700000000 AS DateTime), 1, 34, 1234)
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price]) VALUES (1, 1, CAST(0x0000A38000000000 AS DateTime), 4, 34, 1234)
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price]) VALUES (5, 7, CAST(0x0000A37000000000 AS DateTime), 2, 32, 1234)
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price]) VALUES (10, 8, CAST(0x0000A38000000000 AS DateTime), 5, 12, 12)
SET IDENTITY_INSERT [dbo].[RouteBus] OFF
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/28/2014 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[RBID] [int] NOT NULL,
	[SeatNum] [int] NOT NULL,
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[RBID] ASC,
	[SeatNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (1, 1, 1, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 1, 13, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 2, 12, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 3, 11, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 4, 10, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 5, 9, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 6, 8, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 7, 7, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 8, 6, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 9, 5, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 10, 4, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 11, 3, 0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status]) VALUES (5, 12, 2, 0)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 07/28/2014 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[BookingDetails](
	[BookID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
	[CustomerID] [char](12) NOT NULL,
	[BDID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [float] NULL,
	[IsCancel] [bit] NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 07/28/2014 18:29:06 ******/
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
/****** Object:  Default [DF_Tickets_Status]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Bookings]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings] FOREIGN KEY([BookID])
REFERENCES [dbo].[Bookings] ([BookID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Customers]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Customers]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Tickets]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Tickets]
GO
/****** Object:  ForeignKey [FK_Bookings_Employees]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpId])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Employees]
GO
/****** Object:  ForeignKey [FK_Bus_Categories]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Categories] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Categories] ([Cat_ID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Categories]
GO
/****** Object:  ForeignKey [FK_Bus_Centrals]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Centrals] FOREIGN KEY([StationID])
REFERENCES [dbo].[Centrals] ([CentralID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Centrals]
GO
/****** Object:  ForeignKey [FK_CanceledTickets_BookingDetails]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[CanceledTickets]  WITH CHECK ADD  CONSTRAINT [FK_CanceledTickets_BookingDetails] FOREIGN KEY([BDID])
REFERENCES [dbo].[BookingDetails] ([BDID])
GO
ALTER TABLE [dbo].[CanceledTickets] CHECK CONSTRAINT [FK_CanceledTickets_BookingDetails]
GO
/****** Object:  ForeignKey [FK_RouteBus_Bus]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Bus] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Bus]
GO
/****** Object:  ForeignKey [FK_RouteBus_Routes]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Routes]
GO
/****** Object:  ForeignKey [FK_Routes_Locations]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations] FOREIGN KEY([StartingPlace])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations]
GO
/****** Object:  ForeignKey [FK_Routes_Locations1]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations1] FOREIGN KEY([Destination])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations1]
GO
/****** Object:  ForeignKey [FK_Tickets_RouteBus]    Script Date: 07/28/2014 18:29:06 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_RouteBus] FOREIGN KEY([RBID])
REFERENCES [dbo].[RouteBus] ([RBID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_RouteBus]
GO
