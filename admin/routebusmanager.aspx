﻿<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="routebusmanager.aspx.cs" Inherits="manager_routebusmanager" Title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="top-bar">
        <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="button" 
            onclick="lbtnAddNew_Click">New</asp:LinkButton>
        <h1>Add Route Bus</h1>
    <div class="breadcrumbs"><a href="http://www.free-css.com/">Homepage</a> / <a href="http://www.free-css.com/">
        Contents</a></div>
    </div>
      <br />
    <div class="select-bar">
    <table>
    <tr>
    <td>
    <strong>ID</strong>
    </td>
    <td>
    <asp:TextBox ID="txtIDSearch" runat="server"></asp:TextBox>
    </td>
    <td>
     <strong>Route ID</strong>
    </td>
    <td>
    <asp:TextBox ID="txtRouteIDSearch" runat="server"></asp:TextBox>
    </td>
   
    <td>
        <strong>Bus ID</strong>
    </td>
    <td>
        <asp:TextBox ID="txtBusIDSearch" runat="server"></asp:TextBox>
    </td>
    <td>
    <strong>Bus Name</strong>
    </td>
    <td>
    <asp:TextBox ID="txtBusNameSearch" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    <strong>Starting Place</strong>
    </td>
    <td>
    <asp:DropDownList ID="ddlStartingPlaceSearch" runat="server" 
            Width="145px" >
        </asp:DropDownList>
    </td>
    <td>
    <strong>Destination</strong>
    </td>
    <td>
    <asp:DropDownList ID="ddlDestinationSearch" runat="server"   
            Width="145px" >
        </asp:DropDownList>
    </td>
    
        <td>
        <strong>Date Start</strong>
        </td>
        <td>
        <asp:TextBox ID="txtDateAboveSearch" runat="server" CssClass="text"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtDateAboveSearch"></cc1:CalendarExtender>
        </td>
        <td>
        <strong>Date Start</strong>
        </td>
        <td>
        <asp:TextBox ID="txtDateBelowSearch" runat="server" CssClass="text"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                    Enabled="True" TargetControlID="txtDateBelowSearch"></cc1:CalendarExtender>
        </td>
        </tr>
        <tr>
        <td colspan="8">
         <asp:Button ID="btnSearch" runat="server" CssClass="button" 
                    Text="Search" Font-Bold="True"
            Height="26px" onclick="btnSearch_Click"/>
        </td>
        </tr>
            </table>
        <asp:HiddenField ID="hfSearchKey" runat="server" Value="0" />
      <asp:SqlDataSource ID="SqlLocation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
            SelectCommand="SELECT LocationID, Name FROM Locations">
        </asp:SqlDataSource>
        
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
        <asp:HiddenField ID="hf" runat="server" Value="0" />
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing form" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">Add ROUTE BUS</th>
          </tr>
          <tr>
            <td class="first" width="172" style="height: 21px"><strong>Bus Name</strong></td>
            <td class="last" style="height: 21px">
                <asp:DropDownList ID="ddlBus" runat="server" 
                    DataSourceID="SqlBus" DataTextField="Name" DataValueField="BusID" 
                    >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlBus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [BusID], [Name] FROM [Bus] ORDER BY [Name]">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Route</strong></td>
            <td class="last">
                <asp:DropDownList ID="ddlRoute" runat="server" 
                    DataSourceID="SqlRoute" DataTextField="RouteName" DataValueField="RouteID" 
                    >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlRoute" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT Routes.RouteID, (Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) AS StartingName, 
			(Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) AS DestinationName,
			 Routes.Distance, ((Select Name FROM Locations WHERE Locations.LocationID=Routes.StartingPlace) + ' - ' + (Select Name FROM Locations WHERE Locations.LocationID=Routes.Destination) ) as RouteName
				FROM [OnlineBusTicket].[dbo].[Routes]
			inner join Locations ON Routes.StartingPlace=Locations.LocationID">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Date start</strong></td>
            <td class="last"><asp:TextBox ID="txtDateStart" runat="server" CssClass="text"></asp:TextBox>
                <cc1:CalendarExtender ID="txtDateStart_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="txtDateStart">
                </cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDateStart" ErrorMessage="*" 
                    ToolTip="Date Start is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Price</strong></td>
            <td class="last">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPrice" ErrorMessage="*" 
                    ToolTip="Price is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first">
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
              </td>
            <td class="last">
                    <asp:Button ID="btnAddRouteBus" runat="server" CssClass="button" 
                    Text="Save Bus" Font-Bold="True" 
                        ValidationGroup="Insert" onclick="btnAddRouteBus_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddRouteBus" runat="server" CssClass="button" 
                    Text="Close" Font-Bold="True"/></td>
          </tr>
        </table>
        
    </div>
    </asp:Panel>
    <div class="table">
     <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="listing" 
            DataKeyNames="RBID" AutoGenerateColumns="False" 
            AllowPaging="True" 
            onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="RBID" HeaderText="RBID" 
                    SortExpression="RBID" />
                <asp:BoundField DataField="RouteID" HeaderText="Route ID" 
                    SortExpression="RouteID" />
                <asp:BoundField DataField="BusID" HeaderText="Bus ID" 
                    SortExpression="BusID" />
                <asp:BoundField DataField="Name" HeaderText="Bus Name" SortExpression="Name" />
                <asp:BoundField DataField="RouteName" HeaderText="Route Name" 
                    SortExpression="RouteID" />
                <asp:BoundField DataField="DateStart" HeaderText="Date Start" 
                    SortExpression="DateStart" />
                <asp:BoundField DataField="AvailableSeat" HeaderText="Available Seat" 
                    SortExpression="MaxSeat" />
                <asp:BoundField DataField="Price" HeaderText="Price" 
                    SortExpression="Price" />
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("RBID") %>' CommandName="Select" ToolTip="Edit Route Bus"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteBus" runat="server" CommandArgument='<%# Eval("RBID") %>' CommandName="Delete" ToolTip="Delete Route Bus"
                            ImageUrl="img/hr.gif" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
  <%--  <div class="select-bar">
        <strong>Route</strong>
        </div>
    <div class="table"><img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView2" runat="server" Width="100%" CssClass="listing" DataKeyNames="RouteID" 
            AllowPaging="True" AllowSorting="True" DataSourceID="SqlRoute" 
            AutoGenerateColumns="false"
             >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="RouteID" HeaderText="Route ID" 
                    SortExpression="RouteID" />
                <asp:BoundField DataField="StartingName" HeaderText="Starting Name" 
                    SortExpression="StartingName" />
                <asp:BoundField DataField="DestinationName" HeaderText="Destination Name" 
                    SortExpression="DestinationName" />
                    <asp:BoundField DataField="Distance" HeaderText="Distance" 
                    SortExpression="Distance" />
                    </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>--%>
</asp:Content>

