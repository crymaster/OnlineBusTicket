<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="routebusmanager.aspx.cs" Inherits="manager_routebusmanager" Title="Untitled Page" %>
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
        <label>
        <asp:TextBox ID="txtSearchBusName" runat="server">Bus Name</asp:TextBox>
        </label>
        <label>
        <asp:Button ID="btnSearchBusName" runat="server" CssClass="button" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBusName_Click"/>
        </label>
    </div>
    <div class="select-bar">
        <strong>Search Stations</strong>
        <strong>Search Categories</strong>
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
            <td class="first" width="172" style="height: 21px"><strong>Bus ID</strong></td>
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
            <td class="first"><strong>Route ID</strong></td>
            <td class="last">
                <asp:DropDownList ID="ddlRoute" runat="server" 
                    DataSourceID="SqlRoute" DataTextField="RouteID" DataValueField="RouteID" 
                    >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlRoute" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT * FROM [Routes] ORDER BY [RouteID]">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr>
            <td class="first"><strong>Travels</strong></td>
            <td class="last"><asp:TextBox ID="txtTravels" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTravels" ErrorMessage="*" ToolTip="Travels is empty" 
                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
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
            <td class="first" style="height: 20px"><strong>Max Seat</strong></td>
            <td class="last" style="height: 20px"><asp:TextBox ID="txtMaxSeat" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtMaxSeat" ErrorMessage="*" 
                    ToolTip="Max Seat is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Fake</strong></td>
            <td class="last">
                <asp:TextBox ID="txtFake" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtFake" ErrorMessage="*" 
                    ToolTip="Fake is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Counter</strong></td>
            <td class="last"><asp:TextBox ID="txtCounter" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtCounter" ErrorMessage="*" 
                    ToolTip="Counter is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator></td>
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
            onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="RBID" HeaderText="Route Bus ID" 
                    SortExpression="RBID" />
                <asp:BoundField DataField="Name" HeaderText="Bus Name" SortExpression="Name" />
                <asp:BoundField DataField="RouteID" HeaderText="Route ID" 
                    SortExpression="RouteID" />
                <asp:BoundField DataField="Travels" HeaderText="Travels" 
                    SortExpression="Travels" />
                <asp:BoundField DataField="DateStart" HeaderText="Date Start" 
                    SortExpression="DateStart" />
                <asp:BoundField DataField="MaxSeat" HeaderText="Max Seat" 
                    SortExpression="MaxSeat" />
                <asp:BoundField DataField="Counter" HeaderText="Counter" 
                    SortExpression="Counter" />
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("RBID") %>' CommandName="Select" ToolTip="Edit Route Bus"
                            ImageUrl="~/cms-admin/img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteBus" runat="server" CommandArgument='<%# Eval("RBID") %>' CommandName="Delete" ToolTip="Delete Route Bus"
                            ImageUrl="~/cms-admin/img/hr.gif" />
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
    <div class="select-bar">
        <strong>Route</strong>
        </div>
    <div class="table"><img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView2" runat="server" Width="100%" CssClass="listing" DataKeyNames="RouteID" 
            AllowPaging="True" AllowSorting="True" DataSourceID="SqlRoute" 
             >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
</asp:Content>

