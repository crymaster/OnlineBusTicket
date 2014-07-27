Use OnlineBusTicket
/****** Object:  StoredProcedure [dbo].[AddTicket]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTicket]
@rbid int,
@seatnum int,
@status bit
as
 insert into Tickets(RBID,SeatNum,Status)
 values(@rbid,@seatnum,@status)
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
/****** Object:  StoredProcedure [dbo].[UpdateRoutes]    Script Date: 07/18/2014 23:01:10 ******/
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
	Update Routers Set
		StartingPlace = @StartingPlace,
		Destination = @Destination,
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
@CustomerID char(6) 
AS
 UPDATE Customers
 Set
  Name=@Name,Gender=@Gender,Email=@Email,Address=@Address,Phone=@Phone,DOB=@DOB,DateCreated=@DateCreated
  where CustomerID=@CustomerID
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
@CustomerID char(6)
as
insert into Customers(Name,Gender,Email,Address,Phone,DOB,DateCreated,CustomerID)
values(@Name,@Gender,@Email,@Address,@Phone,@DOB,@DateCreated,@CustomerID)
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
 @Type nvarchar(50),
 @Rate float,
 @Description nvarchar(100)
 as
 INSERT INTO Categories(Type,Rate,Description)
 VALUES(@Type,@Rate,@Description)
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
@Name nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(50),
@Phone nchar(20),
@DOB datetime,
@Qualification nvarchar(50)
as
insert into Employees(EmpId,CentralID,[Name],Email,Address,Phone,DOB,Qualification)
values(@EmpId,@CentralID,@Name,@Email,@Address,@Phone,@DOB,@Qualification);
GO
/****** Object:  StoredProcedure [dbo].[AddRoutes]    Script Date: 07/18/2014 23:01:09 ******/
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
			Select Employees.*,Centrals.Cent_Name From Employees,Centrals
			where Centrals.CentralID = Employees.CentralID
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
/****** Object:  StoredProcedure [dbo].[UpdateRouteBus]    Script Date: 07/18/2014 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRouteBus]
	@RBID int,
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@DateStart nvarchar(100)
AS
	Update RouteBus set
		BusID = @BusID,
		RouteID = @RouteID,
		DateStart = @DateStart
	Where RBID = @RBID
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
/****** Object:  StoredProcedure [dbo].[AddRouteBus]    Script Date: 07/18/2014 23:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRouteBus]
	@BusID nvarchar(50),
	@RouteID nvarchar(50),
	@DateStart nvarchar(100),
	@AvaiSeat int,
	@Price float
AS
	Insert into RouteBus values
	(
		@BusID,
		@RouteID,
		@DateStart,
		@AvaiSeat,
		@Price
	)
GO
/****** Object:  StoredProcedure [dbo].[AddBooking]    Script Date: 07/18/2014 23:01:09 ******/
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
