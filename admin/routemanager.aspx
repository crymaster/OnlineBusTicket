<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="routemanager.aspx.cs" Inherits="manager_routemanager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar">
         <h1>Route</h1>
      <br />
    <div class="select-bar">
    <ul class="list-inline">
    <li>
    <strong>Starting Place</strong>
    </li>
    <li>
            <asp:DropDownList ID="ddlStartingPlaceSearch" runat="server" 
            
            Width="145px" CssClass="search-input form-control" >
            <asp:ListItem Text="Add New" Value="0" />
        </asp:DropDownList>
    </li>
    <li>
     <strong>Destination</strong>
    </li>
    <li>
     <asp:DropDownList ID="ddlDestinationSearch" runat="server"   
            Width="145px" CssClass="search-input form-control" >
        </asp:DropDownList>
    </li>
    <li>
      <asp:Button ID="btnSearchRoutes" runat="server" CssClass="btn btn-primary" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBusName_Click"/>
    </li>
    </ul>
        <asp:HiddenField ID="hfSearchKey" runat="server" Value="0" />
      <asp:SqlDataSource ID="SqlLocation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
            SelectCommand="SELECT LocationID, Name FROM Locations WHERE Deactived='N'">
        </asp:SqlDataSource>
        
    </div>
     <div class="action">
    <asp:LinkButton ID="LinkButton2" runat="server"
     CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click">New Route</asp:LinkButton>
    </div>
    <div>
    <%--<asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>--%>
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing form" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">
                <asp:Label ID="lbMode" runat="server" Text=""></asp:Label>
            </th>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Route ID</strong></td>
            <td class="last">
                <asp:TextBox ID="txtRouteID" runat="server" CssClass="data-input form-control" 
                    Enabled="False"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td class="first" width="172"><strong>Starting Place</strong></td>
            <td class="last">
                <asp:DropDownList ID="ddlStartingPlace" runat="server" 
                  DataSourceID="SqlLocation" DataTextField="Name" 
                    DataValueField="LocationID"
                    onselectedindexchanged="ddlStartingPlace_SelectedIndexChanged" 
                    CssClass="data-input form-control">
                </asp:DropDownList>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Destination</strong></td>
            <td class="last">
                <asp:DropDownList ID="ddlDestination" runat="server"
                  DataSourceID="SqlLocation" DataTextField="Name" 
                    DataValueField="LocationID"
                    onselectedindexchanged="ddlDestination_SelectedIndexChanged" 
                    CssClass="data-input form-control">
                </asp:DropDownList>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Distance</strong></td>
            <td class="last"><asp:TextBox ID="txtDistance" runat="server" 
                    CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtDistance" ErrorMessage="*" 
                    ToolTip="Distance is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtDistance" ErrorMessage="Distance must be a number" 
                    ToolTip="Not is number" ValidationExpression="^[0-9]{1,100}$" 
                    ValidationGroup="Insert"></asp:RegularExpressionValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" 
                    Text="Save Route" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="Insert" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddCentrals" runat="server" CssClass="btn btn-info" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
    </div>
    </asp:Panel>
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="table" DataKeyNames="RouteID" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" PageSize="5"
            EmptyDataText="No route found"  >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Route ID" DataField="RouteID" 
                    SortExpression="RouteID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Starting Place" DataField="StartingName" 
                    SortExpression="StartingName"/>
                <asp:BoundField HeaderText="Destination" DataField="DestinationName" 
                    SortExpression="DestinationName"/>
                <asp:BoundField DataField="Distance" HeaderText="Distance" 
                    SortExpression="Distance" />
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                       <%-- <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("RouteID") %>' CommandName="Select" ToolTip="Edit Central"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteCentral" runat="server" 
                            CommandArgument='<%# Eval("RouteID") %>' CommandName="Delete" ToolTip="Delete Central"
                            ImageUrl="img/hr.gif" />--%>
                             <asp:LinkButton ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("RouteID") %>' 
                        CommandName="Select" ToolTip="Edit Route"
                        CssClass="btn btn-default btn-lg"
                         >
                        <span class=" glyphicon glyphicon-pencil"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("RouteID") %>' 
                        CommandName="Delete" ToolTip="Delete Route"
                        CssClass="btn btn-default btn-lg"
                        OnClientClick="return confirm('Deleting Route will delete all RouteBus have this Route. Are you sure delete this Route ?')" >
                        <span class="glyphicon glyphicon-remove"></span>
                        </asp:LinkButton>
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
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        </div>
</asp:Content>

