<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="busmanager.aspx.cs" Inherits="manager_busmanager" Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar">
        <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="button" 
            onclick="lbtnAddNew_Click">New Bus</asp:LinkButton>
        <h1>Add Bus</h1>
    <div class="breadcrumbs"><a href="index.aspx">Homepage</a> / <a href="http://www.free-css.com/">
        Contents</a>
        </div>
    </div>
    
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
        <asp:DropDownList ID="ddlStationSearch" runat="server" 
            DataSourceID="SqlStation" DataTextField="Cent_Name" 
            DataValueField="CentralID" 
            onselectedindexchanged="ddlStationSearch_SelectedIndexChanged" 
            AutoPostBack="True">
        </asp:DropDownList>
        <strong>Search Categories</strong>
        <asp:DropDownList ID="ddlCategoriesSearch" runat="server" 
            DataSourceID="SqlCategories" DataTextField="Type" DataValueField="Cat_ID" 
            AutoPostBack="True" 
            onselectedindexchanged="ddlCategoriesSearch_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
        <asp:HiddenField ID="hfStationCategories" runat="server" Value="0" />
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing form" cellpadding="0" cellspacing="0" >
          <tr>
            <th class="full" colspan="2">Add Bus</th>
          </tr>
          <tr>
            <td class="first" width="172"><strong>Bus ID</strong></td>
            <td class="last"><asp:TextBox ID="txtBusID" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtBusID" ErrorMessage="*" ToolTip="Bus ID is empty" 
                    ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Bus Name</strong></td>
            <td class="last"><asp:TextBox ID="txtBusName" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtBusName" ErrorMessage="*" ToolTip="Bus Name is empty" 
                    ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
            <td class="first"><strong>Number Seat </strong></td>
            <td class="last"><asp:TextBox ID="txtNumSeat" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNumSeat" ErrorMessage="*" ToolTip="Number Seat is empty" 
                    ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtNumSeat" ErrorMessage="*" ToolTip="Not number" 
                    ValidationExpression="^[0-9]{2}$" ValidationGroup="InsertBus"></asp:RegularExpressionValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Number Plate</strong></td>
            <td class="last"><asp:TextBox ID="txtNumberPlate" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtNumberPlate" ErrorMessage="*" 
                    ToolTip="Number Plate is empty" ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Station ID</strong></td>
            <td class="last"><asp:DropDownList ID="ddlStationID" runat="server" CssClass="text" 
                    DataSourceID="SqlStation" DataTextField="Cent_Name" 
                    DataValueField="CentralID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlStation" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [CentralID], [Cent_Name] FROM [Centrals] ORDER BY [Cent_Name]">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Catelogies ID</strong></td>
            <td class="last"><asp:DropDownList ID="ddlCatelogies" runat="server" 
                    CssClass="text" DataSourceID="SqlCategories" DataTextField="Type" 
                    DataValueField="Cat_ID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlCategories" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [Cat_ID], [Type] FROM [Categories] ORDER BY [Type]">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAddBus" runat="server" CssClass="button" 
                    Text="Save Bus" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="InsertBus" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddBus" runat="server" CssClass="button" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
        
    </div>
    </asp:Panel>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="listing" DataKeyNames="BusID" 
            onrowdeleting="GridView1_RowDeleting" onsorting="GridView1_Sorting" 
            AllowSorting="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Bus ID" DataField="BusID" SortExpression="BusID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Bus Name" DataField="Name" SortExpression="Name"/>
                <asp:BoundField HeaderText="Number Seat" DataField="NumSeat" SortExpression="NumSeat"/>
                <asp:BoundField HeaderText="Number Plate" DataField="NumberPlate" SortExpression="NumberPlate"/>
                <asp:BoundField HeaderText="Station ID" DataField="Cent_Name" SortExpression="Cent_Name"/>
                <asp:BoundField HeaderText="Categories ID" DataField="Type" SortExpression="Type"/>
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("BusID") %>' CommandName="Select" ToolTip="Edit Bus"
                            ImageUrl="~/cms-admin/img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteBus" runat="server" CommandArgument='<%# Eval("BusID") %>' CommandName="Delete" ToolTip="Delete Bus"
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
</asp:Content>

