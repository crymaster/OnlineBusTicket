USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Centrals]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[Centrals] ON
INSERT [dbo].[Centrals] ([CentralID], [Cent_Name], [Address], [Director], [Phone]) VALUES (1000, N'Hanoi', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Centrals] OFF
/****** Object:  Table [dbo].[Categories]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Description]) VALUES (1, N'Express', NULL)
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Description]) VALUES (2, N'Luxury', NULL)
INSERT [dbo].[Categories] ([Cat_ID], [Type], [Description]) VALUES (3, N'Volvo', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 07/24/2014 09:41:09 ******/
/****** Object:  Table [dbo].[Customers]    Script Date: 07/24/2014 09:41:09 ******/
INSERT [dbo].[Customers] ([Name], [Gender], [Email], [Address], [Phone], [DOB], [DateCreated], [CustomerID]) VALUES (N'Customer', 1, N'customer@gmail.com', N'abc', N'333                 ', CAST(0x0000A3AF00000000 AS DateTime), CAST(0x0000A37100000000 AS DateTime), N'1     ')
/****** Object:  Table [dbo].[Admin]    Script Date: 07/24/2014 09:41:09 ******/
/****** Object:  Table [dbo].[Locations_Destination]    Script Date: 07/24/2014 09:41:09 ******/
/****** Object:  Table [dbo].[Locations]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1000, N'Hanoi')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1001, N'Hai Phong')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1002, N'Nghe An')
INSERT [dbo].[Locations] ([LocationID], [Name]) VALUES (1003, N'Ha Tinh')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[Routes]    Script Date: 07/24/2014 09:41:09 ******/
INSERT [dbo].[Routes] ([RouteID], [StartingPlace], [Destination], [Distance]) VALUES (N'1     ', 1000, 1001, 100)
/****** Object:  Table [dbo].[Employees]    Script Date: 07/24/2014 09:41:09 ******/
INSERT [dbo].[Employees] ([EmpId], [CentralID], [Name], [Email], [Password], [Address], [Phone], [DOB], [Qualification]) VALUES (N'1     ', 1000, N'Son', N'son', N'123', N'abc', NULL, NULL, NULL)
/****** Object:  Table [dbo].[Bus]    Script Date: 07/24/2014 09:41:09 ******/
INSERT [dbo].[Bus] ([BusID], [Name], [NumSeat], [NumberPlate], [StationID], [Cat_ID]) VALUES (N'1     ', N'', 20, NULL, NULL, 1)
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[Bookings] ON
INSERT [dbo].[Bookings] ([BookID], [EmpID], [BookingDate]) VALUES (1000, N'1     ', CAST(0x0000A37100000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Bookings] OFF
/****** Object:  Table [dbo].[RouteBus]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[RouteBus] ON
INSERT [dbo].[RouteBus] ([RBID], [BusID], [RouteID], [DateStart], [AvailableSeat], [Price]) VALUES (1000, N'1     ', N'1     ', CAST(0x0000A371018B3BB0 AS DateTime), 10, 500)
SET IDENTITY_INSERT [dbo].[RouteBus] OFF
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[Tickets] ON
INSERT [dbo].[Tickets] ([TicketID], [RBID], [SeatNum]) VALUES (1000, 1000, 1)
INSERT [dbo].[Tickets] ([TicketID], [RBID], [SeatNum]) VALUES (1001, 1000, 2)
INSERT [dbo].[Tickets] ([TicketID], [RBID], [SeatNum]) VALUES (1002, 1000, 3)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 07/24/2014 09:41:09 ******/
SET IDENTITY_INSERT [dbo].[BookingDetails] ON
INSERT [dbo].[BookingDetails] ([BDID], [BookID], [CustomerID], [TicketID], [Price], [IsCanceled]) VALUES (1001, 1000,'1', 1000, 100, 0)
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 07/24/2014 09:41:09 ******/

