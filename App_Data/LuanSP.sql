USE [OnlineBusTicket]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 07/28/2014 14:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomers]
	@CustomerID char(50),
	@Name nvarchar(100)
AS
	if(@CustomerID != '')
		BEGIN
			Select * From Customers
			where CustomerID=@CustomerID
		END
	else if(@Name != '')
		BEGIN
			Select * From Customers
			Where Name like N'%'+@Name+'%'
		END
	else
		BEGIN
			Select * From Customers
		END
GO
/****** Object:  StoredProcedure [dbo].[GetBus]    Script Date: 07/28/2014 14:44:59 ******/
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
		End
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 07/28/2014 14:45:00 ******/
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
		END
	ELSE IF (@EmpId != 0)
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Employees.EmpID=@EmpId
			AND Employees.Name like N'%'+@Name+'%'
		END
	ELSE IF (@CentralID != 0)
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Centrals.CentralID=@CentralID
			AND Employees.Name like N'%'+@Name+'%'
		END
	else
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees INNER JOIN Centrals
			ON Centrals.CentralID = Employees.CentralID
			WHERE Employees.Name like N'%'+@Name+'%'
		END
GO
/****** Object:  StoredProcedure [dbo].[AddCentrals]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteCentrals]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetBusBy_Centrals_Categories]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCentrals]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCentral]    Script Date: 07/28/2014 14:44:59 ******/
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
		End
	
	ELSE 
		Begin
			Select * From Centrals
			WHERE Cent_Name like N'%'+@Cent_Name+'%'
		End
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeesById]    Script Date: 07/28/2014 14:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEmployeesById]
	@EmpId nvarchar(50)
AS
	if(@EmpId = '')
		BEGIN
			Select Employees.*,Centrals.Cent_Name From Employees,Centrals
			where Centrals.CentralID = Employees.CentralID
		END
	else
		BEGIN
			Select * From Employees
			where EmpId = @EmpId
		END
GO
/****** Object:  StoredProcedure [dbo].[SearchBus_1]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 07/28/2014 14:44:59 ******/
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
		End
	ELSE IF(@Type != '0')
		Begin
			Select * From Categories
			Where Type like N'%'+@Type+'%'
		End
	ELSE 
		Begin
			Select * From Categories
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateCategory]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[AddRouteBus]    Script Date: 07/28/2014 14:44:59 ******/
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
SET @AvailableSeat=(SELECT NumSeat FROM Bus WHERE BusID=@BusID)
	Insert into RouteBus values
	(
		@BusID,
		@RouteID,
		@DateStart,
		@AvailableSeat,
		@Price
	)
END
GO
/****** Object:  StoredProcedure [dbo].[SearchRouteBus]    Script Date: 07/28/2014 14:45:00 ******/
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
			select RouteBus.RBID, Bus.Name, 
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
		ELSE IF (@StartingPlace!=0)
		select RouteBus.RBID, Bus.Name, 
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
	ELSE IF (@Destination!=0)
		select RouteBus.RBID, Bus.Name, 
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
		ELSE 
		select RouteBus.RBID, Bus.Name, 
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
GO
/****** Object:  StoredProcedure [dbo].[GetBusByBusID]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertBus]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteBus]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateBus]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRouteBus]    Script Date: 07/28/2014 14:45:00 ******/
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
DECLARE @AvailableSeat int
SET @AvailableSeat=(SELECT NumSeat FROM Bus WHERE BusID=@BusID)
	UPDATE RouteBus
	SET
		BusID=@BusID,
		RouteID=@RouteID,
		DateStart=@DateStart,
		AvailableSeat=@AvailableSeat,
		Price=@Price
END
GO
/****** Object:  StoredProcedure [dbo].[GetRouteBus]    Script Date: 07/28/2014 14:45:00 ******/
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
		End
GO

/****** Object:  StoredProcedure [dbo].[AddBooking]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastedBookID]    Script Date: 07/28/2014 14:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedBookID]
as
 select max(BookID)
 from Bookings
GO
/****** Object:  StoredProcedure [dbo].[AddRoutes]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[demo]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRoutes]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTopRoutes]    Script Date: 07/28/2014 14:45:00 ******/
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
)
)
GO
/****** Object:  StoredProcedure [dbo].[GetRoutes]    Script Date: 07/28/2014 14:45:00 ******/
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
		End
	ELSE IF(@StartingPlace != 0 AND @Destination !=0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.StartingPlace=@StartingPlace AND Routes.Destination=@Destination
		End
	ELSE IF(@StartingPlace != 0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.StartingPlace=@StartingPlace
		End
	ELSE IF(@Destination !=0)
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
			WHERE Routes.Destination=@Destination
		End
	ELSE
		Begin
			SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			Routes.StartingPlace, Routes.Destination, Routes.Distance
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoutes]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRouteBus]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[GetLastedTicketID]    Script Date: 07/28/2014 14:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastedTicketID]
as
 select max(TicketID)
 from Tickets
GO
/****** Object:  StoredProcedure [dbo].[GetLocationByLoID]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateLocation]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteLocation]    Script Date: 07/28/2014 14:44:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteLocation]
@LocationID int
AS
	DELETE Locations
		WHERE LocationID=@LocationID
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 07/28/2014 14:45:00 ******/
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
		End
	ELSE IF(@Name != '0')
		Begin
			Select * From Locations
			Where Name like N'%'+@Name+'%'
		End
	ELSE 
		Begin
			Select * From Locations
		End
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 07/28/2014 14:45:00 ******/
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
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[ChangeEmployeePassword]    Script Date: 07/28/2014 14:44:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckEmployeeLogin]    Script Date: 07/28/2014 14:44:59 ******/
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
END
GO
