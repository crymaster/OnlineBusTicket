USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 08/05/2014 22:44:08 ******/
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
	[Deactived] [varchar](5) NOT NULL,
 CONSTRAINT [PK__Customers__2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID], [Deactived]) VALUES (N'Vũ Văn Luân', 1, N'luanvuhlu@gmail.com', N'Số 11 ngách 199/68', N'841648089101        ', CAST(0x0000A37900000000 AS DateTime), CAST(0x0000A37901488A4C AS DateTime), N'1           ', N'N')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID], [Deactived]) VALUES (N'Luân Văn Vũ', 1, N'luanvuhlu@gmail.com', N'Số 11 ngách 199/68', N'841648089101        ', CAST(0x0000A36900000000 AS DateTime), CAST(0x0000A3750165FB3D AS DateTime), N'5           ', N'N')
/****** Object:  Table [dbo].[Centrals]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Centrals](
	[CentralID] [int] IDENTITY(1,1) NOT NULL,
	[Cent_Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Director] [nvarchar](50) NULL,
	[Phone] [nchar](20) NULL,
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CentralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Centrals] ON
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone], [Deactived]) VALUES (1, N'Lương Yên', N'Nguyễn Khoái', N'Luân', N'12425423534         ', N'N')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone], [Deactived]) VALUES (2, N'Long Biên', N'Số 11 ngách 199/68', N'Luân', N'841648089101        ', N'N')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone], [Deactived]) VALUES (4, N'Cầu Giấy', N'dfgdfgdfg', N'dfgdfgdfgf', N'841648089101        ', N'N')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone], [Deactived]) VALUES (5, N'Long Biên2', N'Số 11 ngách 199/68', N'sdvsdmnk', N'01648089101         ', N'Y')
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone], [Deactived]) VALUES (6, N'Cầu Giấy', N'Số 11 ngách 199/68', N'Luân', N'12425423534         ', N'Y')
SET IDENTITY_INSERT [dbo].[Centrals] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Rate] [float] NULL,
	[Description] [nvarchar](100) NULL,
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description], [Deactived]) VALUES (1, N'Luân Văn Vũ', 2, N'', N'Y')
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description], [Deactived]) VALUES (2, N'Volvo', 1.5, N'', N'N')
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description], [Deactived]) VALUES (4, N'Luân Văn Vũ 2', 2, N'', N'N')
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 08/05/2014 22:44:08 ******/
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
INSERT [dbo].[Admin] ([AdminID], [Email], [Password], [Name]) VALUES (1, N'luanvu@gmail.com', N'40bd001563085fc35165329ea1ff5c5ecbdbbeef', N'luan')
/****** Object:  Table [dbo].[Locations]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationID], [Name], [Deactived]) VALUES (1000, N'Bưu điện Cầu Giấy', N'N')
INSERT [dbo].[Locations] ([LocationID], [Name], [Deactived]) VALUES (1001, N'Minh Khai', N'N')
INSERT [dbo].[Locations] ([LocationID], [Name], [Deactived]) VALUES (1002, N'Lương Yên', N'N')
INSERT [dbo].[Locations] ([LocationID], [Name], [Deactived]) VALUES (1003, N'Bờ Hồ', N'N')
INSERT [dbo].[Locations] ([LocationID], [Name], [Deactived]) VALUES (1005, N'Bưu điện Cầu Giấy 2', N'Y')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification], [Deactived]) VALUES (100000, 1, N'Luan', N'Luan@gmail.com', N'69fbf3d043de091b1c73eaeb0f08b27efa96629d', N'Cau GIay', N'01648089101         ', CAST(0x0000A37500000000 AS DateTime), N'12354645', N'N')
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification], [Deactived]) VALUES (100002, 6, N'Vũ Văn Luân', N'luanvuhlu@gmail.com', N'HNA', N'Số 11 ngách 199/68', N'841648089101        ', CAST(0x0000A37600000000 AS DateTime), N'12354645', N'N')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Bookings]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookID] [int] IDENTITY(1000,1) NOT NULL,
	[EmpID] [int] NULL,
	[BookingDate] [datetime] NULL,
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate], [Deactived]) VALUES (1000, 100000, CAST(0x0000A3750165FB4B AS DateTime), N'N')
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate], [Deactived]) VALUES (1001, 100000, CAST(0x0000A37901488AAB AS DateTime), N'N')
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate], [Deactived]) VALUES (1002, 100000, CAST(0x0000A37E016A1FDD AS DateTime), N'N')
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate], [Deactived]) VALUES (1003, 100000, CAST(0x0000A37E016DC522 AS DateTime), N'N')
SET IDENTITY_INSERT [dbo].[Bookings] OFF
/****** Object:  Table [dbo].[Bus]    Script Date: 08/05/2014 22:44:08 ******/
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
	[Deactived] [varchar](5) NOT NULL,
 CONSTRAINT [PK__Bus__47DBAE45] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bus] ON
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (1, N'12334', 34, 4, N'12                  ', 4, N'N')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (3, N'Unknown', 34, 1, N'1234                ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (5, N'1213', 32, 2, N'12sdsd              ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (6, N'5', 34, 4, N'12sds               ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (7, N'0013', 12, 1, N'1234567878          ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (8, N'0042', 34, 4, N'4tergrg             ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (9, N'0014', 32, 4, N'12                12', 4, N'N')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (10, N'001013', 12, 1, N'123                 ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (11, N'001014', 12, 1, N'12334546            ', 1, N'Y')
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID], [Deactived]) VALUES (12, N'001015', 12, 1, N'12334546            ', 1, N'Y')
SET IDENTITY_INSERT [dbo].[Bus] OFF
/****** Object:  Table [dbo].[Routes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Routes](
	[StartingPlace] [int] NOT NULL,
	[Destination] [int] NOT NULL,
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[Distance] [float] NULL,
	[Deactived] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Routes] PRIMARY KEY CLUSTERED 
(
	[StartingPlace] ASC,
	[Destination] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Routes] ON [dbo].[Routes] 
(
	[RouteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Routes] ON
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance], [Deactived]) VALUES (1000, 1001, 1, 20, N'Y')
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance], [Deactived]) VALUES (1000, 1002, 7, 1, N'N')
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance], [Deactived]) VALUES (1000, 1003, 8, 188, N'N')
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance], [Deactived]) VALUES (1001, 1002, 2, 12, N'N')
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance], [Deactived]) VALUES (1003, 1002, 9, 120, N'Y')
SET IDENTITY_INSERT [dbo].[Routes] OFF
/****** Object:  Table [dbo].[RouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RouteBus](
	[BusID] [int] NOT NULL,
	[RouteID] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[RBID] [int] IDENTITY(1,1) NOT NULL,
	[AvailableSeat] [int] NULL,
	[Price] [float] NULL,
	[Deactived] [varchar](5) NOT NULL,
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RouteBus] ON
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (1, 1, CAST(0x0000A38000C5C100 AS DateTime), 7, 22, 12, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (1, 1, CAST(0x0000A384017B0740 AS DateTime), 4, 33, 1234, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (1, 1, CAST(0x0000A39600000000 AS DateTime), 1, 34, 20000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (5, 7, CAST(0x0000A37000000000 AS DateTime), 2, 32, 1234, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (7, 8, CAST(0x0000A38500000000 AS DateTime), 8, 12, 188000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (9, 7, CAST(0x0000A36800000000 AS DateTime), 12, 32, 1000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (9, 7, CAST(0x0000A39701499700 AS DateTime), 11, 33, 1000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (10, 1, CAST(0x0000A34700000000 AS DateTime), 15, 12, 20000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (10, 1, CAST(0x0000A37500000000 AS DateTime), 14, 12, 20000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (10, 1, CAST(0x0000A39E00000000 AS DateTime), 13, 12, 20000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (10, 1, CAST(0x0000A4E400000000 AS DateTime), 16, 12, 20000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (10, 8, CAST(0x0000A38000000000 AS DateTime), 5, 12, 12, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (12, 9, CAST(0x0000A37500000000 AS DateTime), 10, 12, 120000, N'N')
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price], [Deactived]) VALUES (12, 9, CAST(0x0000A37C00000000 AS DateTime), 9, 12, 120000, N'N')
SET IDENTITY_INSERT [dbo].[RouteBus] OFF
/****** Object:  Table [dbo].[Tickets]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tickets](
	[RBID] [int] NOT NULL,
	[SeatNum] [int] NOT NULL,
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NULL,
	[Deactived] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[RBID] ASC,
	[SeatNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tickets] ON [dbo].[Tickets] 
(
	[TicketID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (1, 1, 1, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 1, 13, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 2, 12, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 3, 11, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 4, 10, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 5, 9, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 6, 8, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 7, 7, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 8, 6, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 9, 5, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 10, 4, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 11, 3, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (5, 12, 2, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 1, 25, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 2, 24, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 3, 23, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 4, 22, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 5, 21, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 6, 20, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 7, 19, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 8, 18, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 9, 17, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 10, 16, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 11, 15, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (8, 12, 14, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 1, 37, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 2, 36, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 3, 35, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 4, 34, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 5, 33, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 6, 32, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 7, 31, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 8, 30, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 9, 29, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 10, 28, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 11, 27, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (9, 12, 26, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 1, 49, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 2, 48, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 3, 47, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 4, 46, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 5, 45, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 6, 44, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 7, 43, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 8, 42, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 9, 41, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 10, 40, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 11, 39, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (10, 12, 38, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 1, 81, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 2, 80, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 3, 79, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 4, 78, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 5, 77, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 6, 76, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 7, 75, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 8, 74, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 9, 73, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 10, 72, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 11, 71, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 12, 70, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 13, 69, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 14, 68, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 15, 67, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 16, 66, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 17, 65, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 18, 64, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 19, 63, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 20, 62, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 21, 61, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 22, 60, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 23, 59, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 24, 58, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 25, 57, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 26, 56, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 27, 55, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 28, 54, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 29, 53, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 30, 52, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 31, 51, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (11, 32, 50, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 1, 113, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 2, 112, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 3, 111, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 4, 110, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 5, 109, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 6, 108, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 7, 107, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 8, 106, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 9, 105, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 10, 104, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 11, 103, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 12, 102, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 13, 101, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 14, 100, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 15, 99, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 16, 98, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 17, 97, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 18, 96, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 19, 95, 0, N'N')
GO
print 'Processed 100 total records'
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 20, 94, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 21, 93, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 22, 92, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 23, 91, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 24, 90, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 25, 89, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 26, 88, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 27, 87, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 28, 86, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 29, 85, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 30, 84, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 31, 83, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (12, 32, 82, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 1, 125, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 2, 124, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 3, 123, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 4, 122, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 5, 121, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 6, 120, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 7, 119, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 8, 118, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 9, 117, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 10, 116, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 11, 115, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (13, 12, 114, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 1, 137, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 2, 136, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 3, 135, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 4, 134, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 5, 133, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 6, 132, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 7, 131, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 8, 130, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 9, 129, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 10, 128, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 11, 127, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (14, 12, 126, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 1, 149, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 2, 148, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 3, 147, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 4, 146, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 5, 145, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 6, 144, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 7, 143, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 8, 142, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 9, 141, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 10, 140, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 11, 139, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (15, 12, 138, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 1, 161, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 2, 160, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 3, 159, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 4, 158, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 5, 157, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 6, 156, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 7, 155, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 8, 154, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 9, 153, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 10, 152, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 11, 151, 0, N'N')
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID], [Status], [Deactived]) VALUES (16, 12, 150, 0, N'N')
SET IDENTITY_INSERT [dbo].[Tickets] OFF
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 08/05/2014 22:44:08 ******/
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
	[IsCanceled] [bit] NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[BookingDetails] ADD [Deactived] [varchar](5) NOT NULL
ALTER TABLE [dbo].[BookingDetails] ADD  CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC,
	[TicketID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
ALTER TABLE [dbo].[BookingDetails] ADD  CONSTRAINT [IX_BookingDetails] UNIQUE NONCLUSTERED 
(
	[BDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] ON
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled], [Deactived]) VALUES (1003, 81, N'1           ', 1, 0, 1, N'N')
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CanceledTickets](
	[CTID] [int] IDENTITY(1,1) NOT NULL,
	[BDID] [int] NULL,
	[Refund] [float] NOT NULL,
	[Date] [datetime] NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[Deactived] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CanceledTickets] ON
INSERT [dbo].[CanceledTickets] ([CTID], [BDID], [Refund], [Date], [Reason], [Deactived]) VALUES (1, 1, 0, CAST(0x0000A37E016E415C AS DateTime), N'No reason', N'N')
SET IDENTITY_INSERT [dbo].[CanceledTickets] OFF
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCustomer]
@Name nvarchar(100),
@Gender bit,
@Email nvarchar(50),
@Address nvarchar(100),
@Phone nchar(20),
@DOB datetime,
@DateCreated datetime,
@CustomerID char(6) 
AS
 UPDATE Customers
 Set
  Name=@Name,Gender=@Gender,Email=@Email,Address=@Address,Phone=@Phone,DOB=@DOB,DateCreated=@DateCreated
  where CustomerID=@CustomerID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCustomer]
@CustomerID char(6)
as
 UPDATE Customers
 SET Deactived = 'Y'
 WHERE CustomerID=@CustomerID
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddCustomer]
@Name nvarchar(100),
@Gender bit,
@Email nvarchar(50),
@Address nvarchar(100),
@Phone nchar(20),
@DOB datetime,
@DateCreated datetime,
@CustomerID char(6)
as
insert into Customers(Name,Gender,Email,Address,Phone,DOB,DateCreated,CustomerID)
values(@Name,@Gender,@Email,@Address,@Phone,@DOB,@DateCreated,@CustomerID)
GO
/****** Object:  UserDefinedFunction [dbo].[NextTableNumber]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[NextTableNumber](@TableType char(20)) 
returns char(6) 
as 
begin 
    declare @Prefix char(1)
    select @Prefix=
    case @TableType
      when 'Customers' then 'C'
      when 'Employees' then 'E'
      when 'Bus' then 'B' 
      when 'Routes' then 'R'
    end
 
	declare @lastval int 
	select @lastval = 
       case  @TableType
         when 'Customers' then (select right(max(CustomerID),2) from Customers)
		 when 'Employees' then (select right(max(EmpID),2) from Employees)
         when 'Bus' then (select right(max(BusID),2) from Bus)
         when 'Routes' then (select right(max(RouteID),2) from Routes) 		
        end

	if @lastval is null set @lastval = @Prefix+'0001' 
	
	return @Prefix + right('000' + convert(varchar(10),@lastval+1),4) 
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomers]
	@CustomerID char(50),
	@Name nvarchar(100),
	@Email nvarchar(100)
AS
	if(@CustomerID != '')
		BEGIN
			Select * From Customers
			where CustomerID=@CustomerID
			AND Deactived='N'
		END
	else
		BEGIN
			Select * From Customers
			Where Name like N'%'+@Name+'%'
			AND Email like N'%'+@Email+'%'
			AND Deactived='N'
		END
GO
/****** Object:  StoredProcedure [dbo].[GetBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBus]
	@BusID varchar,
	@Name nvarchar(50),
	@NumberPlate nvarchar(20),
	@CentralID int,
	@Cat_ID int
AS
	IF(@Cat_ID != 0 AND @CentralID != 0)
		Begin
			select Bus.BusID, Bus.Name, Bus.NumberPlate, Bus.NumSeat,
			Centrals.Cent_Name, Categories.Type from Bus INNER JOIN Centrals
			ON Bus.StationID = Centrals.CentralID 
			INNER JOIN Categories
			ON Bus.Cat_ID=Categories.Cat_ID
			Where 
			Bus.Cat_ID = @Cat_ID
			AND Bus.StationID=@CentralID
			AND Bus.Name like N'%'+@Name+'%'
			AND Bus.NumberPlate like N'%'+@NumberPlate+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
	ELSE IF(@CentralID != 0)
		Begin
			select Bus.BusID, Bus.Name, Bus.NumberPlate, Bus.NumSeat,
			Centrals.Cent_Name, Categories.Type from Bus INNER JOIN Centrals
			ON Bus.StationID = Centrals.CentralID 
			INNER JOIN Categories
			ON Bus.Cat_ID=Categories.Cat_ID
			WHERE
			Bus.StationID=@CentralID
			AND Bus.Name like N'%'+@Name+'%'
			AND Bus.NumberPlate like N'%'+@NumberPlate+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
	ELSE IF(@Cat_ID != 0)
		Begin
			select Bus.BusID, Bus.Name, Bus.NumberPlate, Bus.NumSeat,
			Centrals.Cent_Name, Categories.Type from Bus INNER JOIN Centrals
			ON Bus.StationID = Centrals.CentralID 
			INNER JOIN Categories
			ON Bus.Cat_ID=Categories.Cat_ID
			Where Bus.Cat_ID = @Cat_ID
			AND Bus.Name like N'%'+@Name+'%'
			AND Bus.NumberPlate like N'%'+@NumberPlate+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
	ELSE
		Begin
			select Bus.BusID, Bus.Name, Bus.NumberPlate, Bus.NumSeat,
			Centrals.Cent_Name, Categories.Type from Bus INNER JOIN Centrals
			ON Bus.StationID = Centrals.CentralID 
			INNER JOIN Categories
			ON Bus.Cat_ID=Categories.Cat_ID
			Where Bus.Name like N'%'+@Name+'%'
			AND Bus.NumberPlate like N'%'+@NumberPlate+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployees]
	@EmpId int,
	@Name nvarchar(50),
	@CentralID int
AS
	if(@EmpId != 0 AND @CentralID !=0)
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Centrals.CentralID=@CentralID
			AND Employees.EmpID=@EmpId
			AND Employees.Name like N'%'+@Name+'%'
			AND Employees.Deactived='N'
			AND Centrals.Deactived='N'
		END
	ELSE IF (@EmpId != 0)
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Employees.EmpID=@EmpId
			AND Employees.Name like N'%'+@Name+'%'
			AND Employees.Deactived='N'
			AND Centrals.Deactived='N'
		END
	ELSE IF (@CentralID != 0)
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Centrals.CentralID=@CentralID
			AND Employees.Name like N'%'+@Name+'%'
			AND Employees.Deactived='N'
			AND Centrals.Deactived='N'
			
		END
	else
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Employees.Name like N'%'+@Name+'%'
			AND Employees.Deactived='N'
			AND Centrals.Deactived='N'
			
		END
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test]
	@CentralID varchar
AS
	Select * From Centrals
			Where CentralID like @CentralID+'%'
GO
/****** Object:  StoredProcedure [dbo].[AddCentrals]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCentrals]
	@Cent_Name nvarchar(50),
	@Address nvarchar(100),
	@Director nvarchar(50),
	@Phone nchar(20)
AS
	Insert Into Centrals values
	(
		@Cent_Name,
		@Address,
		@Director,
		@Phone	
	)
GO
/****** Object:  StoredProcedure [dbo].[DeleteCentrals]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCentrals]
	@CentralID int
AS
	UPDATE Centrals
	SET Deactived = 'Y'
	Where CentralID = @CentralID
	UPDATE BUS
	SET Deactived = 'Y'
	WHERE StationID=@CentralID
GO
/****** Object:  StoredProcedure [dbo].[GetBusBy_Centrals_Categories]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBusBy_Centrals_Categories]
	@BusName nvarchar(50),
	@StationID int,
	@Cat_ID int
AS
	IF(@Cat_ID = 0 and @BusName = '0')
		Begin
			Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
			where Bus.StationID = @StationID and Centrals.CentralID = Bus.StationID and Categories.Cat_ID = Bus.Cat_ID
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
	IF(@StationID = 0 and @BusName = '0')
		Begin
			Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
			where Bus.Cat_ID = @Cat_ID and Centrals.CentralID = Bus.StationID and Categories.Cat_ID = Bus.Cat_ID
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
	IF(@StationID = 0 And @Cat_ID = 0)
		Begin
			Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
			where Bus.Name like '%'+@BusName+'%' and Centrals.CentralID = Bus.StationID and Categories.Cat_ID = Bus.Cat_ID
			AND Bus.Deactived='N'
			AND Centrals.Deactived='N'
			AND Categories.Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesById]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeesById]
	@EmpId nvarchar(50)
AS
	if(@EmpId != '')
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees,Centrals
			where Centrals.CentralID = Employees.CentralID
			AND Employees.Deactived='N'
			AND Centrals.Deactived='N'
		END
	else
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees,Centrals
			where
			 Employees.Deactived='N'
			AND Centrals.Deactived='N'
		END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCentrals]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[UpdateCentrals]
	@CentralID int,
	@Cent_Name nvarchar(50),
	@Address nvarchar(100),
	@Director nvarchar(50),
	@Phone nchar(20)
AS
	Update Centrals 
	Set
		Cent_Name = @Cent_Name,
		Address = @Address,
		Director = @Director,
		Phone = @Phone
	Where CentralID = @CentralID
GO
/****** Object:  StoredProcedure [dbo].[GetCentral]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCentral]
	@CentralID int,
	@Cent_Name nvarchar(50)
AS
	IF(@CentralID != 0)
		Begin
			Select * From Centrals
			Where CentralID = @CentralID
			AND Cent_Name like N'%'+@Cent_Name+'%'
			AND Deactived='N'
		End
	
	ELSE 
		Begin
			Select * From Centrals
			WHERE Cent_Name like N'%'+@Cent_Name+'%'
			AND Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[SearchBus_1]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchBus_1]
	
AS
BEGIN
		Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
		where Categories.Cat_ID = Bus.Cat_ID and Centrals.CentralID = Bus.StationID
		 AND Bus.Deactived='N'
			 AND Categories.Deactived='N'
			 AND Centrals.Deactived='N'
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
 @Type nvarchar(50),
 @Rate float, 
 @Description nvarchar(100)
 as
 INSERT INTO Categories(Type,Rate,Description)
 VALUES(@Type,@Rate,@Description)
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategories]
	@Cat_ID int,
	@Type nvarchar(50)
AS
	IF(@Cat_ID != 0)
		Begin
			Select * From Categories
			Where Cat_ID = @Cat_ID
			AND Deactived='N'
		End
	ELSE IF(@Type != '0')
		Begin
			Select * From Categories
			Where Type like N'%'+@Type+'%'
			AND Deactived='N'
		End
	ELSE 
		Begin
			Select * From Categories
			WHERE Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCategory]
@Cat_ID int,
 @Type nvarchar(50),
 @Rate float, 
 @Description nvarchar(100)
 as
 Update Categories 
	Set
		Type = @Type,
		Rate = @Rate,
		Description = @Description
	Where Cat_ID = @Cat_ID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCategory]
	@Cat_ID int
AS
	UPDATE Categories
	SET Deactived = 'Y'
	Where Cat_ID = @Cat_ID
	UPDATE BUS
	SET Deactived = 'Y'
	WHERE Cat_ID=@Cat_ID
GO
/****** Object:  StoredProcedure [dbo].[SearchRouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchRouteBus]
@RBID varchar
,
@RouteID varchar,
@BusID varchar,
@BusName nvarchar(50),
@StartingPlace int,
@Destination int,
@DateAbove DateTime,
@DateBelow DateTime
AS
		IF (@StartingPlace!=0 AND @Destination!=0)
			select RouteBus.RBID, Routes.RouteID, Bus.BusID, Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus 
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
			INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			WHERE RouteBus.RBID like @RBID+'%'
			AND Routes.StartingPlace = @StartingPlace
			AND Routes.Destination = @Destination
			AND Routes.RouteID like @RouteID+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Name like N'%'+@BusName+'%'
			AND RouteBus.DateStart >= @DateAbove
			AND RouteBus.DateStart <= @DateBelow
			AND Bus.Deactived='N'
			AND Routes.Deactived='N'
			AND RouteBus.Deactived='N'
		ELSE IF (@StartingPlace!=0)
		select RouteBus.RBID, Routes.RouteID, Bus.BusID, Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus 
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
			INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			WHERE RouteBus.RBID like @RBID+'%'
			AND Routes.StartingPlace = @StartingPlace
			AND Routes.RouteID like @RouteID+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Name like N'%'+@BusName+'%'
			AND RouteBus.DateStart >= @DateAbove
			AND RouteBus.DateStart <= @DateBelow
			AND Bus.Deactived='N'
			AND Routes.Deactived='N'
			AND RouteBus.Deactived='N'
	ELSE IF (@Destination!=0)
		select RouteBus.RBID, Routes.RouteID, Bus.BusID, Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus 
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
			INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			WHERE RouteBus.RBID like @RBID+'%'
			AND Routes.Destination = @Destination
			AND Routes.RouteID like @RouteID+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Name like N'%'+@BusName+'%'
			AND RouteBus.DateStart >= @DateAbove
			AND RouteBus.DateStart <= @DateBelow
			AND Bus.Deactived='N'
			AND Routes.Deactived='N'
			AND RouteBus.Deactived='N'
		ELSE 
		select RouteBus.RBID, Routes.RouteID, Bus.BusID, Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus 
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
			INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			WHERE RouteBus.RBID like @RBID+'%'
			AND Routes.RouteID like @RouteID+'%'
			AND Bus.BusID like @BusID+'%'
			AND Bus.Name like N'%'+@BusName+'%'
			AND RouteBus.DateStart >= @DateAbove
			AND RouteBus.DateStart <= @DateBelow
			AND Bus.Deactived='N'
			AND Routes.Deactived='N'
			AND RouteBus.Deactived='N'
GO
/****** Object:  StoredProcedure [dbo].[GetBusByBusID]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBusByBusID]
	@BusID char(6)
AS
	Select * From Bus
	Where BusID = @BusID
GO
/****** Object:  StoredProcedure [dbo].[InsertBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[InsertBus]
	@BusNumSeat int,
	@BusNumberPlate char(20),
	@StationID int,
	@Cat_ID int
AS

Begin

DECLARE @Name nvarchar(50)
DECLARE @No int
SET @No=(SELECT COUNT(*) FROM Bus WHERE StationID=@StationID AND Cat_ID=@Cat_ID)+1
SET @Name=(SELECT RIGHT('00000'+ CONVERT(VARCHAR, @StationID),3))
	+ (SELECT RIGHT('00000'+ CONVERT(VARCHAR, @Cat_ID),2))
	+CONVERT(VARCHAR, @No)

	Insert into Bus(Name, NumSeat, NumberPlate, StationID, Cat_ID) values
	(
		@Name,
		@BusNumSeat,
		@BusNumberPlate,
		@StationID,
		@Cat_ID
	)
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBus]
	@BusID char(6)
AS
	UPDATE Bus
	SET Deactived = 'Y'
	WHERE BusID=@BusID
GO
/****** Object:  StoredProcedure [dbo].[UpdateBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBus]
	@BusID char(6),
	@BusNumSeat int,
	@BusNumberPlate char(20),
	@StationID nvarchar(50),
	@Cat_ID nvarchar(50)
AS

Begin
	Update Bus set
		NumSeat = @BusNumSeat,
		NumberPlate = @BusNumberPlate,
		StationID = @StationID,
		Cat_ID = @Cat_ID
	Where BusID = @BusID
End
GO
/****** Object:  StoredProcedure [dbo].[AddRouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRouteBus]
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@DateStart nvarchar(100),
	@Price float
AS
BEGIN
DECLARE @AvailableSeat int
DECLARE @NewRBID int
DECLARE @Count int
SET @AvailableSeat=(SELECT NumSeat FROM Bus WHERE BusID=@BusID)
	Insert into RouteBus values
	(
		@BusID,
		@RouteID,
		@DateStart,
		@AvailableSeat,
		@Price
	)
	SET @NewRBID=SCOPE_IDENTITY()
	SET @Count=@AvailableSeat
	WHILE @Count >0
	BEGIN
		INSERT Tickets (RBID, SeatNum)
		VALUES
		(@NewRBID, @Count)
		SET @Count=@Count-1
		END
			
	     
END
GO
/****** Object:  StoredProcedure [dbo].[GetRouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRouteBus]
	@RBID int
AS
	IF(@RBID != 0)
		Begin
			select RouteBus.RBID, Bus.BusID, Routes.RouteID, Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
			WHERE RouteBus.RBID = @RBID
			 AND Bus.Deactived='N'
			 AND Routes.Deactived='N'
			  AND RouteBus.Deactived='N'
			ORDER BY RouteBus.RBID DESC
		End
	ELSE
		Begin
			select RouteBus.RBID, Bus.BusID,  Routes.RouteID,Bus.Name, 
				(SELECT ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
					FROM [OnlineBusTicket].[dbo].[Routes]
					inner join Locations ON Routes.StartingPlace=Locations.LocationID 
					WHERE RouteBus.RouteID=Routes.RouteID) as [RouteName],
			RouteBus.DateStart, RouteBus.AvailableSeat, RouteBus.Price
			FROM RouteBus INNER JOIN Bus
				ON Bus.BusID = RouteBus.BusID
			INNER JOIN Routes
				ON RouteBus.RouteID=Routes.RouteID
				where Bus.Deactived='N'
			 AND Routes.Deactived='N'
			  AND RouteBus.Deactived='N'
			ORDER BY RouteBus.RBID DESC
		End
GO
/****** Object:  StoredProcedure [dbo].[AddBooking]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBooking]
@EmpID char(6),
@BookingDate datetime,
@id int output
as
 insert into Bookings(EmpID,BookingDate)
 values(@EmpID,@BookingDate)
  SET @id=SCOPE_IDENTITY()
  RETURN  @id
GO
/****** Object:  StoredProcedure [dbo].[GetLastedBookID]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedBookID]
as
 select max(BookID)
 from Bookings
	where Deactived='N'
GO
/****** Object:  StoredProcedure [dbo].[AddRoutes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRoutes]
	@StartingPlace int,
	@Destination int,
	@Distance int
AS
	Insert into Routes values
	(
		@StartingPlace,
		@Destination,
		@Distance
	)
GO
/****** Object:  StoredProcedure [dbo].[demo]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[demo]
as
select StartingPlace,Destination
from Routes
where RouteID in 
(select top(2) routeID from
 RouteBus
)
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoutes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRoutes]
	@RouteID nvarchar(50)
AS
	UPDATE Routes
	SET Deactived = 'Y'
	where RouteID = @RouteID
GO
/****** Object:  StoredProcedure [dbo].[GetRoutes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoutes]
	@RouteID int,
	@StartingPlace int,
	@Destination int
AS
	IF(@RouteID != 0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.RouteID=@RouteID
			 AND Routes.Deactived='N'
			 AND Locations.Deactived='N'
		End
	ELSE IF(@StartingPlace != 0 AND @Destination !=0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.StartingPlace=@StartingPlace AND Routes.Destination=@Destination
			 AND Routes.Deactived='N'
			 AND Locations.Deactived='N'
		End
	ELSE IF(@StartingPlace != 0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.StartingPlace=@StartingPlace
			 AND Routes.Deactived='N'
			 AND Locations.Deactived='N'
		End
	ELSE IF(@Destination !=0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.Destination=@Destination
			 AND Routes.Deactived='N'
			 AND Locations.Deactived='N'
		End
	ELSE
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			 where Routes.Deactived='N'
			 AND Locations.Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[GetTopRoutes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopRoutes]
as
 select Locations.Name
 from Locations,Routes
 where Routes.StartingPlace=Locations.LocationID
 and StartingPlace in
 (
 select StartingPlace
 from Routes
 where RouteID in 
(select top(2) routeID from
 RouteBus
  where Deactived='N'
)
)
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoutes]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoutes]
	@RouteID nvarchar(50),
	@StartingPlace int,
	@Destination int,
	@Distance int
AS
	Update Routes Set
		StartingPlace = @StartingPlace,
		Destination = @Destination,
		Distance = @Distance
	Where RouteID = @RouteID
GO
/****** Object:  StoredProcedure [dbo].[UpdateRouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRouteBus]
	@RBID int,
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@DateStart nvarchar(100),
	@Price float
AS
BEGIN


	UPDATE RouteBus
	SET
		BusID=@BusID,
		RouteID=@RouteID,
		DateStart=@DateStart,
		
		Price=@Price
	WHERE RBID=@RBID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRouteBus]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRouteBus]
	@RBID int
AS
	UPDATE RouteBus 
	SET Deactived = 'Y'
	where RBID = @RBID
GO
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTicket]
@rbid int,
@seatnum int
as
 insert into Tickets(RBID,SeatNum)
 values(@rbid,@seatnum)
GO
/****** Object:  StoredProcedure [dbo].[GetLastedTicketID]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedTicketID]
as
 select max(TicketID)
 from Tickets
where Deactived='N'
GO
/****** Object:  StoredProcedure [dbo].[CheckAdminLogin]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckAdminLogin]
	@Email varchar(50),
	@Password varchar(100)
AS
BEGIN
Select * From [Admin]
		where Email=@Email
				AND [Password]=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[ChangeAdminPassword]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ChangeAdminPassword]
	@AdminID int,
	@Password nvarchar(100)
AS
	Update Admin 
	Set
		Password=@Password
	Where AdminID = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[GetAdminByID]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdminByID]
	@AdminID int
AS
	Select * From Admin
	Where AdminID = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[GetLocationByLoID]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocationByLoID]
@LocationID int
as
 SELECT Name from Locations
 where LocationID=@LocationID
 AND Deactived='N'
GO
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddLocation]
	@Name nvarchar(50)
AS
	Insert Into Locations values
	(
		@Name	
	)
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocation]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateLocation]
@LocationID int,
	@Name nvarchar(50)
AS
	UPDATE Locations SET
	
		Name=@Name	
		WHERE LocationID=@LocationID
GO
/****** Object:  StoredProcedure [dbo].[DeleteLocation]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLocation]
@LocationID int
AS
	UPDATE Locations
	SET Deactived = 'Y'
		WHERE LocationID=@LocationID
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocations]
	@LocationID int,
	@Name nvarchar(50)
AS
	IF(@LocationID != 0)
		Begin
			Select * From Locations
			Where LocationID = @LocationID
			 AND Deactived='N'
		End
	ELSE IF(@Name != '0')
		Begin
			Select * From Locations
			Where Name like N'%'+@Name+'%'
			 AND Deactived='N'
		End
	ELSE 
		Begin
			Select * From Locations where Deactived='N'
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
@EmpId char(6),
@CentralID int,
@Name nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(50),
@Phone nchar(20),
@DOB datetime,
@Qualification nvarchar(50)
as
 UPDATE Employees
 SET
 CentralID=@CentralID,Name=@Name,Email=@Email,Address=@Address,Phone=@Phone,DOB=@DOB,Qualification=@Qualification
 WHERE EmpID=@EmpId
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmployee]
@CentralID int,
@Name nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(50),
@Phone nchar(20),
@DOB datetime,
@Qualification nvarchar(50)
as
insert into Employees(CentralID,[Name],Email,Address,Phone,DOB,Qualification, [Password])
values(@CentralID,@Name,@Email,@Address,@Phone,@DOB,@Qualification, @Email);
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
@EmpID char(6)
as
UPDATE Employees
SET Deactived = 'Y'
WHERE EmpID=@EmpID
GO
/****** Object:  StoredProcedure [dbo].[ChangeEmployeePassword]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ChangeEmployeePassword]
	@EmpId int,
	@Password nvarchar(100)
AS
	Update Employees 
	Set
		Password=@Password
	Where EmpId = @EmpId
GO
/****** Object:  StoredProcedure [dbo].[CheckEmployeeLogin]    Script Date: 08/05/2014 22:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckEmployeeLogin]
	@Email nvarchar(50),
	@Password nvarchar(100)
AS
BEGIN
Select EmpId From Employees 
		where Email=@Email
				AND Password=@Password
				AND Deactived='N'
END
GO
/****** Object:  Default [DF__Customers__Deact__656C112C]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Centrals__Deacti__5CD6CB2B]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Centrals] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Categorie__Deact__5BE2A6F2]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Locations__Deact__5EBF139D]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Locations] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Employees__Deact__5DCAEF64]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Bookings__Deacti__628FA481]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Bus__Deactived__5AEE82B9]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Bus] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__Routes__Deactive__60A75C0F]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Routes] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__RouteBus__Deacti__5FB337D6]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[RouteBus] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF_Tickets_Status]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF__Tickets__Deactiv__619B8048]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__BookingDe__Deact__6477ECF3]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[BookingDetails] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  Default [DF__CanceledT__Deact__6383C8BA]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[CanceledTickets] ADD  DEFAULT ('N') FOR [Deactived]
GO
/****** Object:  ForeignKey [FK_Bookings_Employees]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Employees] FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpId])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Employees]
GO
/****** Object:  ForeignKey [FK_Bus_Categories]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Categories] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Categories] ([Cat_ID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Categories]
GO
/****** Object:  ForeignKey [FK_Bus_Centrals]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Centrals] FOREIGN KEY([StationID])
REFERENCES [dbo].[Centrals] ([CentralID])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Centrals]
GO
/****** Object:  ForeignKey [FK_Routes_Locations]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations] FOREIGN KEY([StartingPlace])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations]
GO
/****** Object:  ForeignKey [FK_Routes_Locations1]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Routes_Locations1] FOREIGN KEY([Destination])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Routes_Locations1]
GO
/****** Object:  ForeignKey [FK_RouteBus_Bus]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Bus] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Bus]
GO
/****** Object:  ForeignKey [FK_RouteBus_Route]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Route] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Route]
GO
/****** Object:  ForeignKey [FK_RouteBus_Routes]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK_RouteBus_Routes] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK_RouteBus_Routes]
GO
/****** Object:  ForeignKey [FK_Tickets_RouteBus]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_RouteBus] FOREIGN KEY([RBID])
REFERENCES [dbo].[RouteBus] ([RBID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_RouteBus]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Bookings]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings] FOREIGN KEY([BookID])
REFERENCES [dbo].[Bookings] ([BookID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Customers]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Customers]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Tickets]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Tickets]
GO
/****** Object:  ForeignKey [FK_CanceledTickets_BookingDetails]    Script Date: 08/05/2014 22:44:08 ******/
ALTER TABLE [dbo].[CanceledTickets]  WITH CHECK ADD  CONSTRAINT [FK_CanceledTickets_BookingDetails] FOREIGN KEY([BDID])
REFERENCES [dbo].[BookingDetails] ([BDID])
GO
ALTER TABLE [dbo].[CanceledTickets] CHECK CONSTRAINT [FK_CanceledTickets_BookingDetails]
GO
