<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="locationmanager.aspx.cs" Inherits="manager_locationmaanger" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar">
     
        <h1>Locations</h1>

    </div>
      <br />
    <div class="select-bar">
    <ul class="list-inline">
    <li>
    <strong>Name</strong>
    </li>
    <li>
     <asp:TextBox ID="txtNameSearch" runat="server" 
            CssClass="search-input form-control"></asp:TextBox>
    </li>
    <li>
     <asp:Button ID="btnSearchRoutes" runat="server" CssClass="btn btn-primary" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBusName_Click" />
    </li>
    </ul>
        <asp:HiddenField ID="hfSearchKey" runat="server" Value="0" />
       <%-- <asp:SqlDataSource ID="SqlCentrals" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
            
            SelectCommand="SELECT [Name], [LocationID] FROM [Location]">
        </asp:SqlDataSource>--%>
    </div>
    <div class="action">
    <asp:LinkButton ID="LinkButton2" runat="server"
     CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click">New Location</asp:LinkButton>
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
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
            <td class="first"><strong>ID</strong></td>
            <td class="last">
                <asp:TextBox ID="txtLocationID" runat="server" 
                    CssClass="data-input form-control" Enabled="False"></asp:TextBox>
            </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Name</strong></td>
            <td class="last">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" CssClass="table" 
                    DataKeyNames="LocationID" ForeColor="#333333" GridLines="None" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    onrowdeleting="GridView1_RowDeleting" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="5" 
                    Width="100%">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="LocationID" HeaderText="Location ID" 
                            SortExpression="LocationID">
                            <ItemStyle Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Edit - Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="Button1" runat="server" 
                                    CommandArgument='<%# Eval("LocationID") %>' CommandName="Select" 
                                    CssClass="btn btn-default btn-lg" ToolTip="Edit Location">
                                <span class=" glyphicon glyphicon-pencil"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                    CommandArgument='<%# Eval("LocationID") %>' CommandName="Delete" 
                                    CssClass="btn btn-default btn-lg" ToolTip="Delete Location">
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
                <asp:TextBox ID="txtName" runat="server" 
                    CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*" 
                    ToolTip="Name is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" 
                    Text="Save Location" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="Insert" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddCentrals" runat="server" CssClass="btn btn-info" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
    </div>
    </asp:Panel>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        </div>
</asp:Content>



