CREATE DATABASE OnlineBusTicket
GO
USE [OnlineBusTicket]
GO
/****** Object:  Table [dbo].[Centrals]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centrals](
	[CentralID] [int] IDENTITY(1000,1) NOT NULL,
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
/****** Object:  Table [dbo].[Categories]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Cat_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cat_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 07/18/2014 23:01:12 ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FBID] [int] IDENTITY(1000,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](250) NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Title] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK__Feedback__3F115E1A] PRIMARY KEY CLUSTERED 
(
	[FBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[Name] [nvarchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nchar](20) NULL,
	[DOB] [datetime] NULL,
	[DateCreated] [datetime] NOT NULL,
	[TimesBooking] [int] NOT NULL,
	[CustomerID] [char](6) NOT NULL,
	[RegistedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK__Customers__2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locations_Destination]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations_Destination](
	[Locations_DestinationID] [int] NOT NULL,
	[DestinationName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Locations_Destination] PRIMARY KEY CLUSTERED 
(
	[Locations_DestinationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 07/18/2014 23:01:12 ******/
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
/****** Object:  Table [dbo].[Location_Starting]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location_Starting](
	[Locations_StartingID] [nchar](10) NOT NULL,
	[StartingName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Location_Starting] PRIMARY KEY CLUSTERED 
(
	[Locations_StartingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatID] [int] IDENTITY(1000,1) NOT NULL,
	[RBID] [int] NULL,
	[AvailableSeats] [nvarchar](250) NULL,
	[NumAvailable] [int] NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK__Seats__656C112C] PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PID] [int] IDENTITY(1000,1) NOT NULL,
	[PromotePercent] [float] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoutes]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoutes]
	@RouteID nvarchar(50),
	@StartingPlace int,
	@Destination int,
	@StartingTiming datetime,
	@DestinationTiming datetime,
	@Distance int
AS
	Update Routers Set
		StartingPlace = @StartingPlace,
		Destination = @Destination,
		StartingTiming = @StartingTiming,
		DestinationTiming = @DestinationTiming,
		Distance = @Distance
	Where RouteID = @RouteID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 07/18/2014 23:01:10 ******/
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
@TimesBooking int,
@CustomerID char(6) 
AS
 UPDATE Customers
 Set
  Name=@Name,Gender=@Gender,Email=@Email,Address=@Address,Phone=@Phone,DOB=@DOB,DateCreated=@DateCreated,TimesBooking=@TimesBooking
  where CustomerID=@CustomerID
GO
/****** Object:  StoredProcedure [dbo].[GetSeatIDByRBID]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSeatIDByRBID]
@rbid int
as
 select SeatID from Seats
 where RBID=@rbid
GO
/****** Object:  StoredProcedure [dbo].[UpdateCentrals]    Script Date: 07/18/2014 23:01:10 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTimesBooking]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTimesBooking]
@Reg nvarchar(50),
@times int
as
 update Customers
 set TimesBooking=@times
 where RegistedBy=@reg
GO
/****** Object:  StoredProcedure [dbo].[UpdateAvailableSeats]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAvailableSeats]
@seat nvarchar(250),
@quantity int,
@RBID int
as
 update Seats
 set AvailableSeats=@seat ,NumAvailable=@quantity
 where RBID=@RBID
GO
/****** Object:  StoredProcedure [dbo].[GetRegistedBy]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRegistedBy]
as
 select RegistedBy
 from Customers
GO
/****** Object:  StoredProcedure [dbo].[GetLocationByLoID]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocationByLoID]
@LocationID int
as
 SELECT Name from Locations
 where LocationID=@LocationID
GO
/****** Object:  StoredProcedure [dbo].[GetCustIDByRegistedBy]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustIDByRegistedBy]
@reg nvarchar(50)
as
 select CustomerID from Customers
 where RegistedBy=@reg
GO
/****** Object:  StoredProcedure [dbo].[GetCustByRegistedBy]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustByRegistedBy]
 @reg nvarchar(50)
 as
  select name,gender,DOB,Address,Phone,Email
   from customers where RegistedBy=@reg
GO
/****** Object:  StoredProcedure [dbo].[GetCentral]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCentral]
	@CentralID int,
	@Cent_Name nvarchar(50), 
	@Address nvarchar(100),
	@Director nvarchar(50)
AS
	IF(@CentralID != 0)
		Begin
			Select * From Centrals
			Where CentralID = @CentralID
		End
	ELSE IF(@Cent_Name != '0')
		Begin
			Select * From Centrals
			Where Cent_Name like N'%'+@Cent_Name+'%'
		End
	ELSE IF(@Address != '0')
		Begin
			Select * From Centrals
			Where Address like N'%'+@Address+'%'
		End
	ELSE IF(@Director != '0')
		Begin
			Select * From Centrals
			Where Director like N'%'+@Director+'%'
		End
	ELSE 
		Begin
			Select * From Centrals
		End
GO
/****** Object:  Table [dbo].[Routes]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Routes](
	[RouteID] [char](6) NOT NULL,
	[StartingPlace] [int] NULL,
	[Destination] [int] NULL,
	[StartingTiming] [datetime] NULL,
	[DestinationTiming] [datetime] NULL,
	[Distance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 07/18/2014 23:01:09 ******/
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
@TimesBooking int,
@CustomerID char(6),
@RegistedBy nvarchar(50)
as
insert into Customers(Name,Gender,Email,Address,Phone,DOB,DateCreated,TimesBooking,CustomerID,RegistedBy)
values(@Name,@Gender,@Email,@Address,@Phone,@DOB,@DateCreated,@TimesBooking,@CustomerID,@RegistedBy )
GO
/****** Object:  StoredProcedure [dbo].[AddCentrals]    Script Date: 07/18/2014 23:01:09 ******/
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
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
 @Cat_ID int,
 @Type nvarchar(50),
 @Description nvarchar(100)
 as
 INSERT INTO Categories(Type,Description)
 VALUES(@Type,@Description)
GO
/****** Object:  StoredProcedure [dbo].[AddFeedback]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddFeedback]
 @FullName nvarchar(50),
 @Address nvarchar(50),
 @Email nvarchar(50),
 @Content nvarchar(250),
 @Telephone nvarchar(20),
 @Title nvarchar(50),
 @DateCreated datetime
as
 INSERT INTO Feedbacks(Fullname,Address,Email,Content,Telephone,Title,DateCreated)
 values(@FullName,@Address,@Email,@Content,@Telephone,@Title,@DateCreated)
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmpId] [char](6) NOT NULL,
	[CentralID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar] (100) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableSeats]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableSeats]
@RBID int
as 
 Select AvailableSeats from Seats
 where RBID=@RBID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCustomer]
@CustomerID char(6)
as
 DELETE Customers
 WHERE CustomerID=@CustomerID
GO
/****** Object:  StoredProcedure [dbo].[DeleteCentrals]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCentrals]
	@CentralID int
AS
	Delete From Centrals
	Where CentralID = @CentralID
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bus](
	[BusID] [char](6) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NumSeat] [int] NULL,
	[NumberPlate] [char](20) NULL,
	[StationID] [int] NULL,
	[Cat_ID] [int] NULL,
 CONSTRAINT [PK__Bus__47DBAE45] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookID] [int] IDENTITY(1000,1) NOT NULL,
	[CustomerID] [char](6) NULL,
	[EmpID] [char](6) NULL,
	[BookingDate] [datetime] NULL,
	[IsCanceled] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteBus]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBus]
	@BusID char(6)
AS
	Delete From Bus
	Where BusID = @BusID
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
@EmpID char(6)
as
DELETE Employees
WHERE EmpID=@EmpID
GO
/****** Object:  StoredProcedure [dbo].[DeleteRoutes]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRoutes]
	@RouteID nvarchar(50)
AS
	Delete Routes
	where RouteID = @RouteID
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmployee]
@EmpId char(6),
@CentralID int,
@Role_ID int,
@Name nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(50),
@Phone nchar(20),
@DOB datetime,
@Qualification nvarchar(50)
as
insert into Employees(EmpId,CentralID,Role_ID,[Name],Email,Address,Phone,DOB,Qualification)
values(@EmpId,@CentralID,@Role_ID,@Name,@Email,@Address,@Phone,@DOB,@Qualification);
GO
/****** Object:  StoredProcedure [dbo].[AddRoutes]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRoutes]
	@RouteID nvarchar(50),
	@StartingPlace int,
	@Destination int,
	@StartingTiming datetime,
	@DestinationTiming datetime,
	@Distance int
AS
	Insert into Routes values
	(
		@RouteID,
		@StartingPlace,
		@Destination,
		@StartingTiming,
		@DestinationTiming,
		@Distance
	)
GO
/****** Object:  Table [dbo].[RouteBus]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RouteBus](
	[RBID] [int] IDENTITY(1000,1) NOT NULL,
	[BusID] [char](6) NULL,
	[RouteID] [char](6) NULL,
	[Travels] [nvarchar](50) NULL,
	[DateStart] [datetime] NULL,
	[AvailableSeat] [int] NULL,
	[MaxSeat] [int] NULL,
	[Price] [float] NULL,
	[Fake] [int] NULL,
	[Counter] [int] NULL,
 CONSTRAINT [PK__RouteBus__619B8048] PRIMARY KEY CLUSTERED 
(
	[RBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetBusByBusID]    Script Date: 07/18/2014 23:01:09 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBusBy_Centrals_Categories]    Script Date: 07/18/2014 23:01:09 ******/
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
		End
	IF(@StationID = 0 and @BusName = '0')
		Begin
			Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
			where Bus.Cat_ID = @Cat_ID and Centrals.CentralID = Bus.StationID and Categories.Cat_ID = Bus.Cat_ID
		End
	IF(@StationID = 0 And @Cat_ID = 0)
		Begin
			Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
			where Bus.Name like '%'+@BusName+'%' and Centrals.CentralID = Bus.StationID and Categories.Cat_ID = Bus.Cat_ID
		End
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesById]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeesById]
	@EmpId nvarchar(50)
AS
	if(@EmpId = '')
		BEGIN
			Select Employees.*,Centrals.Cent_Name,Roles.Role From Employees,Centrals,Roles
			where Centrals.CentralID = Employees.CentralID And Roles.RoleID = Employees.Role_ID
		END
	else
		BEGIN
			Select * From Employees
			where EmpId = @EmpId
		END
GO
/****** Object:  StoredProcedure [dbo].[InsertBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[InsertBus]
	@BusID char(6),
	@BusName nvarchar(50),
	@BusNumSeat int,
	@BusNumberPlate char(20),
	@StationID int,
	@Cat_ID int
AS

Begin
	Insert into Bus values
	(
		@BusID,
		@BusName,
		@BusNumSeat,
		@BusNumberPlate,
		@StationID,
		@Cat_ID
	)
End
GO
/****** Object:  StoredProcedure [dbo].[SearchBus_1]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchBus_1]
	
AS
BEGIN
		Select Bus.*,Categories.Type,Centrals.Cent_Name From Bus,Categories,Centrals
		where Categories.Cat_ID = Bus.Cat_ID and Centrals.CentralID = Bus.StationID
END
GO
/****** Object:  UserDefinedFunction [dbo].[NextTableNumber]    Script Date: 07/18/2014 23:01:13 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
@EmpId char(6),
@CentralID int,
@Role_ID int,
@Name nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(50),
@Phone nchar(20),
@DOB datetime,
@Qualification nvarchar(50)
as
 UPDATE Employees
 SET
 CentralID=@CentralID,Role_ID=@Role_ID,Name=@Name,Email=@Email,Address=@Address,Phone=@Phone,DOB=@DOB,Qualification=@Qualification
 WHERE EmpID=@EmpId
GO
/****** Object:  StoredProcedure [dbo].[UpdateBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBus]
	@BusID char(6),
	@BusName nvarchar(50),
	@BusNumSeat int,
	@BusNumberPlate char(20),
	@StationID nvarchar(50),
	@Cat_ID nvarchar(50)
AS

Begin
	Update Bus set
		[Name] = @BusName,
		NumSeat = @BusNumSeat,
		NumberPlate = @BusNumberPlate,
		StationID = @StationID,
		Cat_ID = @Cat_ID
	Where BusID = @BusID
End
GO
/****** Object:  StoredProcedure [dbo].[GetRoutes]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoutes]
	@RouteID nvarchar(50),
	@StartingPlace int,
	@Destination int
AS
	
	IF(@RouteID != '0')
		Begin
			Select Routes.*,Location_Starting.StartingName,Locations_Destination.DestinationName From Routes,Location_Starting,Locations_Destination
			Where Routes.RouteID = @RouteID and
				  Location_Starting.Locations_StartingID = Routes.StartingPlace and
				  Locations_Destination.Locations_DestinationID = Routes.Destination
		End
	ELSE IF(@StartingPlace != 0 AND @Destination !=0)
		Begin
			Select Routes.*,Location_Starting.StartingName,Locations_Destination.DestinationName From Routes,Location_Starting,Locations_Destination
			Where Routes.StartingPlace = @StartingPlace AND Routes.Destination = @Destination and
				  Location_Starting.Locations_StartingID = Routes.StartingPlace and
				  Locations_Destination.Locations_DestinationID = Routes.Destination
		End
	ELSE
		Begin
			Select Routes.*,Location_Starting.StartingName,Locations_Destination.DestinationName From Routes,Location_Starting,Locations_Destination
			Where Location_Starting.Locations_StartingID = Routes.StartingPlace and
				  Locations_Destination.Locations_DestinationID = Routes.Destination
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateRouteBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRouteBus]
	@RBID int,
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@Travels nvarchar(50),
	@DateStart nvarchar(100),
	@MaxSeat int,
	@Fake int,
	@Counter int
AS
	Update RouteBus set
		BusID = @BusID,
		RouteID = @RouteID,
		Travels = @Travels,
		DateStart = @DateStart,
		MaxSeat = @MaxSeat,
		Fake = @Fake,
		Counter = @Counter
	Where RBID = @RBID
GO
/****** Object:  StoredProcedure [dbo].[UpdateCounterRouteBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCounterRouteBus]
@RBID int
as 
update RouteBus
Set Counter=Counter+1
where RBID=@RBID
GO
/****** Object:  StoredProcedure [dbo].[GetRouteBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRouteBus]
	@RBID int
AS
	IF(@RBID != 0)
		Begin
			select RouteBus.*,Bus.Name from RouteBus,Bus
			Where Bus.BusID = RouteBus.BusID and RouteBus.RBID = @RBID
		End
	ELSE
		Begin
			select RouteBus.*,Bus.Name from RouteBus,Bus
			Where Bus.BusID = RouteBus.BusID
		End
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1000,1) NOT NULL,
	[RBID] [int] NULL,
	[SeatID] [int] NULL,
	[Type] [nvarchar](20) NULL,
	[PromotionID] [int] NULL,
 CONSTRAINT [PK__Tickets__71D1E811] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SearchBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchBus]
 @StartPlace int,
 @Dest int,
 @StartTime datetime
as
select distinct rb.Travels, r.StartingTiming as Departure, r.DestinationTiming as Arrival, rb.Fake,c.Type as BusType,s.NumAvailable as Seat,rb.RBID as Code
from RouteBus rb,Routes r,Categories,Bus b,Categories c,Seats s
where rb.RouteID in( 
  select Routes.RouteID 
  from Routes where StartingPlace=@StartPlace and Destination=@Dest
 and StartingTiming=@StartTime )
and rb.BusID=b.BusID and b.Cat_ID=c.Cat_ID
and s.RBID =rb.RBID
and rb.RouteID=r.RouteID
GO
/****** Object:  StoredProcedure [dbo].[GetTopRoutes]    Script Date: 07/18/2014 23:01:10 ******/
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
 order by counter
 desc
)
)
GO
/****** Object:  StoredProcedure [dbo].[GetLastedBookID]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedBookID]
as
 select max(BookID)
 from Bookings
GO
/****** Object:  StoredProcedure [dbo].[CountCusIDFromBookings]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountCusIDFromBookings]
@CusId char(6)
as
	select count(CustomerID) 
	from Bookings
	where CustomerID=@CusId
GO
/****** Object:  StoredProcedure [dbo].[AddRouteBus]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRouteBus]
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@Travels nvarchar(50),
	@DateStart nvarchar(100),
	@AvailableSeat int,
	@MaxSeat int,
	@Price float,
	@Fake int,
	@Counter int
AS
	Insert into RouteBus values
	(
		@BusID,
		@RouteID,
		@Travels,
		@DateStart,
		@AvailableSeat,
		@MaxSeat,
		@Price,
		@Fake,
		@Counter
	)
GO
/****** Object:  StoredProcedure [dbo].[AddBooking]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBooking]
@CustomerID char(6),
@EmpID char(6),
@BookingDate datetime,
@IsCanceled bit
as
 insert into Bookings(CustomerID,EmpID,BookingDate,IsCanceled)
 values(@CustomerID,@EmpID,@BookingDate,@IsCanceled)
GO
/****** Object:  StoredProcedure [dbo].[demo]    Script Date: 07/18/2014 23:01:09 ******/
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
 order by counter
 desc
)
GO
/****** Object:  StoredProcedure [dbo].[DeleteRouteBus]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRouteBus]
	@RBID int
AS
	Delete RouteBus 
	where RBID = @RBID
GO
/****** Object:  Table [dbo].[CanceledTickets]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanceledTickets](
	[CTID] [int] IDENTITY(1000,1) NOT NULL,
	[BookID] [int] NULL,
	[Date] [datetime] NULL,
	[Reason] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CTID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CalPromotions]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalPromotions]
@TicketID int
as

 select CAST(PromotePercent as FLOAT)
 from Promotions,Tickets
 where TicketID=@TicketID and Tickets.PromotionID=Promotions.PID
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 07/18/2014 23:01:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[BDID] [int] IDENTITY(1000,1) NOT NULL,
	[BookID] [int] NULL,
	[TicketID] [int] NULL,
	[Quantity] [int] NULL,
	[Position] [varchar](50) NULL,
	[FakeFinal] [float] NULL,
 CONSTRAINT [PK_BookingDetails] PRIMARY KEY CLUSTERED 
(
	[BDID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTicket]
@rbid int,
@SeatID int,
@type nvarchar(20) ,
@PromotionID int
as
 insert into Tickets(RBID,SeatID,Type,PromotionID)
 values(@rbid,@SeatID,@Type,@PromotionID)
GO
/****** Object:  StoredProcedure [dbo].[GetLastedTicketID]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedTicketID]
as
 select max(TicketID)
 from Tickets
GO
/****** Object:  StoredProcedure [dbo].[GetTicketByID]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTicketByID]
	@TicketID int
	
AS

select Tickets.TicketID,bus.name As 'Bus Name ',bus.numberplate as 'Number Plate',  
(select l.name from locations as l,routes as r 
where r.routeid='r00001' and l.locationid=r.StartingPlace
) as 'Starting Place' 
, 
(select l.name from locations as l,routes as r 
where r.RouteID='r00001' and r.Destination=l.locationid
) as 'Destination'
,routes.StartingTiming,BookingDetails.Position
 from Tickets,routebus,bus,routes,BookingDetails where Tickets.TicketID=@TicketID
and tickets.rbid = routebus.rbid 
and routebus.busid=bus.busid 
and routes.routeid=routebus.routeid
and BookingDetails.TicketID=@TicketID
GO
/****** Object:  StoredProcedure [dbo].[AddBD]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBD]
@bid int,
@tid int,
@quantity int,
@pos varchar(50),
@fare float
as
 insert into BookingDetails(BookID,TicketID,Quantity,Position,FakeFinal)
 values(@bid,@tid,@quantity,@pos,@fare)
GO
/****** Object:  Default [DF_RouteBus_Counter]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[RouteBus] ADD  CONSTRAINT [DF_RouteBus_Counter]  DEFAULT ((0)) FOR [Counter]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Bookings]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings] FOREIGN KEY([BookID])
REFERENCES [dbo].[Bookings] ([BookID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings]
GO
/****** Object:  ForeignKey [FK_BookingDetails_Tickets]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Tickets]
GO
/****** Object:  ForeignKey [FK__Bookings__Custom__5EBF139D]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK__Bookings__Custom__5EBF139D] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK__Bookings__Custom__5EBF139D]
GO
/****** Object:  ForeignKey [FK__Bookings__EmpID__628FA481]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([EmpID])
REFERENCES [dbo].[Employees] ([EmpId])
GO
/****** Object:  ForeignKey [FK__Bus__Cat_ID__49C3F6B7]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK__Bus__Cat_ID__49C3F6B7] FOREIGN KEY([Cat_ID])
REFERENCES [dbo].[Categories] ([Cat_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK__Bus__Cat_ID__49C3F6B7]
GO
/****** Object:  ForeignKey [FK__Bus__StationID__48CFD27E]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK__Bus__StationID__48CFD27E] FOREIGN KEY([StationID])
REFERENCES [dbo].[Centrals] ([CentralID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK__Bus__StationID__48CFD27E]
GO
/****** Object:  ForeignKey [FK__CanceledT__BookI__656C112C]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[CanceledTickets]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Bookings] ([BookID])
GO
/****** Object:  ForeignKey [FK__Employees__Centr__66603565]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([CentralID])
REFERENCES [dbo].[Centrals] ([CentralID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__RouteBus__BusID__628FA481]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK__RouteBus__BusID__628FA481] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK__RouteBus__BusID__628FA481]
GO
/****** Object:  ForeignKey [FK__RouteBus__RouteI__6383C8BA]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[RouteBus]  WITH CHECK ADD  CONSTRAINT [FK__RouteBus__RouteI__6383C8BA] FOREIGN KEY([RouteID])
REFERENCES [dbo].[Routes] ([RouteID])
GO
ALTER TABLE [dbo].[RouteBus] CHECK CONSTRAINT [FK__RouteBus__RouteI__6383C8BA]
GO
/****** Object:  ForeignKey [FK__Routes__Destinat__6A30C649]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([Destination])
REFERENCES [dbo].[Locations] ([LocationID])
GO
/****** Object:  ForeignKey [FK__Routes__Starting__6B24EA82]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD FOREIGN KEY([StartingPlace])
REFERENCES [dbo].[Locations] ([LocationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Tickets__RBID__72C60C4A]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK__Tickets__RBID__72C60C4A] FOREIGN KEY([RBID])
REFERENCES [dbo].[RouteBus] ([RBID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK__Tickets__RBID__72C60C4A]
GO
/****** Object:  ForeignKey [fk_Promotion]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_Promotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotions] ([PID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_Promotion]
GO
/****** Object:  ForeignKey [FK_Seats_Tickets]    Script Date: 07/18/2014 23:01:12 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Tickets] FOREIGN KEY([SeatID])
REFERENCES [dbo].[Seats] ([SeatID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Seats_Tickets]
GO
