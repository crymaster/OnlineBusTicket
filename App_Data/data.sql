USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 07/27/2014 15:12:12 ******/
/****** Object:  Table [dbo].[Locations]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1000, N'Hanoi')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1001, N'Hai Phong')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1002, N'Nghe An')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1003, N'Ha Tinh')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Employees]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification]) VALUES (1, 1000, N'Son', N'son', N'123', N'abc', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Customers]    Script Date: 07/27/2014 15:12:12 ******/
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Customer', 1, N'customer@gmail.com', N'abc', N'333                 ', CAST(0x0000A3AF00000000 AS DateTime), CAST(0x0000A37100000000 AS DateTime), N'1           ')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Son', 1, N'son@gmail.com', N'afa', N'123456              ', CAST(0x0000844C00000000 AS DateTime), CAST(0x0000A37301745EB1 AS DateTime), N'2           ')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Nguyen Hai Nam', 0, N'', N'', N'                    ', CAST(0x000095CF00000000 AS DateTime), CAST(0x0000A37400363444 AS DateTime), N'3           ')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Tran Tuan Vu', 1, N'', N'', N'                    ', CAST(0x000052D700000000 AS DateTime), CAST(0x0000A37400417EA7 AS DateTime), N'4           ')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'a', 1, N'', N'', N'                    ', CAST(0x00009BA500000000 AS DateTime), CAST(0x0000A374004CA7C5 AS DateTime), N'5           ')
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'as', 1, N'', N'', N'                    ', CAST(0x00008E0200000000 AS DateTime), CAST(0x0000A3740054C0EB AS DateTime), N'6           ')
/****** Object:  Table [dbo].[Centrals]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Centrals] ON
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (1000, N'Hanoi', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Centrals] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description]) VALUES (1, N'Express', NULL, NULL)
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description]) VALUES (2, N'Luxury', NULL, NULL)
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Rate], [Description]) VALUES (3, N'Volvo', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Bus]    Script Date: 07/27/2014 15:12:12 ******/
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [StationID], [NumberPlate], [Cat_ID]) VALUES (1, N'', 20, NULL, NULL, 1)
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1000, 1, CAST(0x0000A37100000000 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1001, 1, CAST(0x0000A37301745EBA AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1002, 1, CAST(0x0000A3730174C709 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1003, 1, CAST(0x0000A37301768911 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1004, 1, CAST(0x0000A374002B5506 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1005, 1, CAST(0x0000A374003347C4 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1006, 1, CAST(0x0000A37400363449 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1007, 1, CAST(0x0000A37400417EA8 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1008, 1, CAST(0x0000A374004CA7C5 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1009, 1, CAST(0x0000A37400542DDD AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1010, 1, CAST(0x0000A3740183378C AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1011, 1, CAST(0x0000A37500ECDA15 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1012, 1, CAST(0x0000A37500F0A5C5 AS DateTime))
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1013, 1, CAST(0x0000A37500F4701A AS DateTime))
SET IDENTITY_INSERT [dbo].[Bookings] OFF
/****** Object:  Table [dbo].[Routes]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[Routes] ON
INSERT [dbo].[Routes] ([StartingPlace], [Destination], [RouteID], [Distance]) VALUES (1000, 1001, 1, 100)
SET IDENTITY_INSERT [dbo].[Routes] OFF
/****** Object:  Table [dbo].[RouteBus]    Script Date: 07/27/2014 15:12:12 ******/
SET IDENTITY_INSERT [dbo].[RouteBus] ON
INSERT [dbo].[RouteBus] ([BusID], [RouteID], [DateStart], [RBID], [AvailableSeat], [Price]) VALUES (1, 1, CAST(0x0000A375018B3BB0 AS DateTime), 1000, 4, 500)
SET IDENTITY_INSERT [dbo].[RouteBus] OFF
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/27/2014 15:12:24 ******/
SET IDENTITY_INSERT [dbo].[Tickets] ON
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 1, 1000,1)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 2, 1001,1)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 3, 1002,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 4, 1003,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 5, 1004,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 6, 1005,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 7, 1006,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 8, 1007,0)
INSERT [dbo].[Tickets] ([RBID], [SeatNum], [TicketID],[Status]) VALUES (1000, 9, 1008,0)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 07/27/2014 15:12:24 ******/
SET IDENTITY_INSERT [dbo].[BookingDetails] ON
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1000, 1000, N'1           ', 1001, 100, 0)
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1003, 1001, N'2           ', 1004, 500, 0)
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1006, 1002, N'3           ', 1005, 250, 1)
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1007, 1003, N'4           ', 1006, 350, 1)
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1008, 1004, N'5           ', 1007, 0, 1)
INSERT [dbo].[BookingDetails] ([BookID], [TicketID], [CustomerID], [BDID], [Price], [IsCanceled]) VALUES (1009, 1005, N'6           ', 1008, 500, 1)
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 07/27/2014 15:12:24 ******/
SET IDENTITY_INSERT [dbo].[CanceledTickets] ON
INSERT [dbo].[CanceledTickets] ([CTID], [BDID], [Refund], [Date], [Reason]) VALUES (2, 1008, 350, CAST(0x0000A375001646E3 AS DateTime), N'No reason')
INSERT [dbo].[CanceledTickets] ([CTID], [BDID], [Refund], [Date], [Reason]) VALUES (3, 1007, 0, CAST(0x0000A37500DFE3DE AS DateTime), N'No reason')
INSERT [dbo].[CanceledTickets] ([CTID], [BDID], [Refund], [Date], [Reason]) VALUES (4, 1006, 245, CAST(0x0000A37500E31530 AS DateTime), N'No reason')
INSERT [dbo].[CanceledTickets] ([CTID], [BDID], [Refund], [Date], [Reason]) VALUES (5, 1005, 175, CAST(0x0000A37500E34A30 AS DateTime), N'No reason')
SET IDENTITY_INSERT [dbo].[CanceledTickets] OFF
