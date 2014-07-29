<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="busmanager.aspx.cs" Inherits="manager_busmanager" Title="Untitled Page" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar row">
        <h1>Add Bus</h1>
     <div class="select-bar">
     <table class="table">
     <tr>
     <td>
         <strong>Central</strong>
         </td>
         <td>
         <asp:DropDownList ID="ddlCentralSearch" runat="server" CssClass="central-dd-search form-control" ></asp:DropDownList>
         </td>
         
          <td>
         <strong>Category</strong>
         </td>
         <td>
         <asp:DropDownList ID="ddlCategoriesSearch" runat="server" CssClass="categolry-dd-search form-control">
            </asp:DropDownList>
         </td>
     </tr>
     <tr>
        <td>
          <strong>Name</strong>
         </td>
         <td>
           <asp:TextBox ID="txtNameSearch" runat="server" CssClass="search-input form-control"></asp:TextBox>
         </td>
          <td>
          <strong>Number Plate</strong>
         </td>
         <td>
         <asp:TextBox ID="txtNumberPlateSearch" runat="server" CssClass="search-input form-control"></asp:TextBox>
         </td>
         
     </tr>
     <tr>
        <td>
         <strong>ID</strong>
         </td>
         <td>
         <asp:TextBox ID="txtIDSearch" runat="server" CssClass="search-input form-control"></asp:TextBox>
         </td>
         <td>
         <asp:Button ID="btnSearchBus" runat="server" CssClass="button btn btn-primary" 
                        Text="Search" Font-Bold="True" onclick="btnSearchBus_Click"/>
         </td>
         <td>
         
         </td>
     </tr>
 </table>
    </div>
    <div class="action">
    <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click">New Bus</asp:LinkButton>
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
        <asp:HiddenField ID="hfStationCategories" runat="server" Value="0" />
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing table" cellpadding="0" cellspacing="0" >
          <tr>
            <th class="full" colspan="2">Bus</th>
          </tr>
          <tr>
            <td class="first" width="172"><strong>Bus ID</strong></td>
            <td class="last"><asp:TextBox ID="txtBusID" runat="server"  CssClass="data-input form-control"
                    Enabled="False"></asp:TextBox>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Bus Name</strong></td>
            <td class="last"><asp:TextBox ID="txtBusName" runat="server"   CssClass="data-input form-control"
                    Enabled="False"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtBusName" ErrorMessage="*" ToolTip="Bus Name is empty" 
                    ValidationGroup="InsertBus"></asp:RequiredFieldValidator>--%>
              </td>
          </tr>
          <tr>
            <td class="first"><strong>Number Seat </strong></td>
            <td class="last"><asp:TextBox ID="txtNumSeat" runat="server"  CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNumSeat" ErrorMessage="Number Seat is is empty" 
                    ToolTip="Number Seat is empty" 
                    ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtNumSeat" ErrorMessage="Number Seat must be a number" ToolTip="Not number" 
                    ValidationExpression="^[0-9]{2}$" ValidationGroup="InsertBus"></asp:RegularExpressionValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Number Plate</strong></td>
            <td class="last"><asp:TextBox ID="txtNumberPlate" runat="server"  CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtNumberPlate" ErrorMessage="Number Plate is empty" 
                    ToolTip="Number Plate is empty" ValidationGroup="InsertBus"></asp:RequiredFieldValidator>
             </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Central</strong></td>
            <td class="last"><asp:DropDownList ID="ddlStationID" runat="server" CssClass="data-input form-control" 
                    DataSourceID="SqlCentral" DataTextField="Cent_Name" 
                    DataValueField="CentralID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlCentral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [CentralID], [Cent_Name] FROM [Centrals] ORDER BY [Cent_Name]">
                </asp:SqlDataSource>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Catelogy</strong></td>
            <td class="last"><asp:DropDownList ID="ddlCatelogies" runat="server" 
                      CssClass="data-input form-control" DataSourceID="SqlCategories" DataTextField="Type" 
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
                    <asp:Button ID="btnAddBus" runat="server" CssClass="btn btn-primary" 
                    Text="Save Bus" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="InsertBus" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddBus" runat="server" CssClass="btn btn-info" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
        
    </div>
    </asp:Panel>
    <div > <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
        CssClass="table"
            AutoGenerateColumns="False"  DataKeyNames="BusID" 
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
                <asp:BoundField HeaderText="Number Plate" DataField="NumberPlate" SortExpression="NumberPlate"/>
                <asp:BoundField HeaderText="Number Seat" DataField="NumSeat" SortExpression="NumSeat"/>
                <asp:BoundField HeaderText="Central" DataField="Cent_Name" SortExpression="Cent_Name"/>
                <asp:BoundField HeaderText="Category" DataField="Type" SortExpression="Type"/>
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("BusID") %>' 
                        CommandName="Select" ToolTip="Edit Bus"
                        CssClass="btn btn-default btn-lg">
                        <span class=" glyphicon glyphicon-pencil"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("BusID") %>' 
                        CommandName="Delete" ToolTip="Delete Bus"
                        CssClass="btn btn-default btn-lg">
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
    </div>
</asp:Content>

