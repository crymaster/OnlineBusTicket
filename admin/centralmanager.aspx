<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="centralmanager.aspx.cs" Inherits="manager_centralmanager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="top-bar">
        <h1>Centrals</h1>
    </div>
      <br />
    <div class="select-bar">
    <div class="select-bar">
       <ul class="list-inline">
       <li><strong>ID</strong></li>
       <li>
       <asp:TextBox ID="txtIDSearch" runat="server" CssClass="search-input form-control"></asp:TextBox>
       </li>
       <li>
       <strong>Name</strong>
       </li>
       <li>
       <asp:TextBox ID="txtNameSearch" runat="server" CssClass="search-input form-control"></asp:TextBox>
       </li>
        <li>
        <asp:Button ID="btnSearchBus" runat="server" CssClass="btn btn-primary" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBusName_Click" />
        </li>
        </ul>
        <asp:HiddenField ID="hfSearchKey" runat="server" Value="1" />
    </div>
    <div class="action">
    <asp:LinkButton ID="LinkButton2" runat="server"
     CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click">New Central</asp:LinkButton>
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="table" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">
                <asp:Label ID="lbMode" runat="server" Text="Label"></asp:Label></th>
          </tr>
           <tr>
            <td class="first" width="172"><strong><asp:Label ID="lblCentID" runat="server" Text="Central ID" Visible="false"></asp:Label></strong></td>
            <td class="last">
                <asp:TextBox ID="txtCentralID" runat="server" CssClass="data-input form-control" 
                    Visible="False"></asp:TextBox>
              </td>
          </tr>
          <tr>
            <td class="first" width="172"><strong>Central Name</strong></td>
            <td class="last"><asp:TextBox ID="txtCent_Name" runat="server" 
                    CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtCent_Name" ErrorMessage="*" ToolTip="Central Name is empty" 
                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Address</strong></td>
            <td class="last"><asp:TextBox ID="txtAddress" runat="server" 
                    CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="*" ToolTip="Address is empty" 
                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr>
            <td class="first"><strong>Director</strong></td>
            <td class="last"><asp:TextBox ID="txtDirector" runat="server" 
                    CssClass="data-input form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtDirector" ErrorMessage="*" ToolTip="Director is empty" 
                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Phone</strong></td>
            <td class="last"><asp:TextBox ID="txtPhone" runat="server" 
                    CssClass="data-input form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="*" 
                    ToolTip="Phone is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="*" 
                    ToolTip="Ex: 09XXXXXXX or 01XXXXXXXXXX" ValidationExpression="^[0-9]{9,12}$" 
                    ValidationGroup="Insert"></asp:RegularExpressionValidator>--%>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAddCentral" runat="server" CssClass="btn btn-primary" 
                    Text="Save Central" Font-Bold="True" onclick="btnAddBus_Click" 
                        ValidationGroup="Insert" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCloseAddCentrals" runat="server" CssClass="btn btn-info" 
                    Text="Close" Font-Bold="True" onclick="btnCloseAddBus_Click" /></td>
          </tr>
        </table>
    </div>
    </asp:Panel>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="table" DataKeyNames="CentralID" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging" 
            onrowdeleting="GridView1_RowDeleting" AllowSorting="True" 
            onsorting="GridView1_Sorting">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Central ID" DataField="CentralID" 
                    SortExpression="CentralID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Central Name" DataField="Cent_Name" 
                    SortExpression="Cent_Name"/>
                <asp:BoundField HeaderText="Address" DataField="Address" 
                    SortExpression="Address"/>
                <asp:BoundField HeaderText="Director" DataField="Director" 
                    SortExpression="Director"/>
                <asp:BoundField HeaderText="Phone" DataField="Phone" SortExpression="Phone"/>
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                    <asp:LinkButton ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("CentralID") %>' 
                        CommandName="Select" ToolTip="Edit Central"
                        CssClass="btn btn-default btn-lg">
                        <span class=" glyphicon glyphicon-pencil"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("CentralID") %>' 
                        CommandName="Delete" ToolTip="Delete Central"
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

