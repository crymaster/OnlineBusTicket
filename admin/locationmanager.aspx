﻿<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="locationmanager.aspx.cs" Inherits="manager_locationmaanger" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar">
        <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="button" 
            onclick="lbtnAddNew_Click" ToolTip="New Central">New</asp:LinkButton>
        <h1>Locations</h1>
    <div class="breadcrumbs"><a href="http://www.free-css.com/">Homepage</a> / <a href="http://www.free-css.com/">
        Contents</a></div>
    </div>
      <br />
    <div class="select-bar">
        <label>
        <strong>Name</strong>
            <asp:TextBox ID="txtNameSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearchRoutes" runat="server" CssClass="button" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBusName_Click" 
            Height="26px"/>
        <asp:HiddenField ID="hfSearchKey" runat="server" Value="0" />
       <%-- <asp:SqlDataSource ID="SqlCentrals" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
            
            SelectCommand="SELECT [Name], [LocationID] FROM [Location]">
        </asp:SqlDataSource>--%>
        </label>
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing form" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">Add Location</th>
          </tr>
           <tr class="bg">
            <td class="first"><strong>ID</strong></td>
            <td class="last"><asp:TextBox ID="txtLocationID" runat="server" CssClass="text"></asp:TextBox>
            </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Name</strong></td>
            <td class="last"><asp:TextBox ID="txtName" runat="server" CssClass="text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="*" 
                    ToolTip="Name is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAdd" runat="server" CssClass="button" 
                    Text="Save Location" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="Insert" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddCentrals" runat="server" CssClass="button" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
    </div>
    </asp:Panel>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="listing" DataKeyNames="LocationID" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" PageSize="5" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Location ID" DataField="LocationID" 
                    SortExpression="LocationID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Name" DataField="Name" 
                    SortExpression="Name"/>
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("LocationID") %>' CommandName="Select" ToolTip="Edit Location"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteCentral" runat="server" 
                            CommandArgument='<%# Eval("LocationID") %>' CommandName="Delete" ToolTip="Delete Location"
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
</asp:Content>



