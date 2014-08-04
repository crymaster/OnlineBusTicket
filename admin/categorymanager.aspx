<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="categorymanager.aspx.cs" Inherits="manager_categorymanager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar">
        <h1>Category</h1>
    </div>
      <br />
    <div class="select-bar">
       <ul class="list-inline">
       <li>
        <strong>Name</strong>
       </li>
       <li>
        <asp:TextBox ID="txtNameSearch" runat="server"  CssClass="search-input form-control"></asp:TextBox>
       </li>
       <li>
        <asp:Button ID="btnSearchRoutes" runat="server" CssClass="btn btn-primary" 
                    Text="Search" onclick="btnSearchBusName_Click" /> 
       </li>
       </ul>
    </div>
    <div class="action">
    <asp:LinkButton ID="LinkButton2" runat="server"
     CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click">New Category</asp:LinkButton>
    </div>
     <asp:HiddenField ID="hfSearchKey" runat="server" Value="0" />
    <div><%--<asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>--%>
    </div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table" dir="ltr"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="table" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">
                <asp:Label ID="lbMode" runat="server" Text="Label"></asp:Label>
            </th>
          </tr>
           <tr class="bg">
            <td class="first"><strong>ID</strong></td>
            <td class="last"><asp:TextBox ID="txtID" runat="server" 
                    CssClass="data-input form-control"
                    Width="221px" ></asp:TextBox>
            </td>
            <td></td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Name</strong></td>
            <td class="last">
                <asp:TextBox ID="txtName" runat="server" CssClass="data-input form-control" 
                    Width="221px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Name is required !" 
                    ToolTip="Name is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
              </td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Rate</strong></td>
            <td class="last">
                <asp:TextBox ID="txtRate" runat="server" CssClass="data-input form-control" 
                    Width="221px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtRate" ErrorMessage="Rate is requied !" 
                    ToolTip="Rate is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                
              </td>
          </tr>
           <tr class="bg">
            <td class="first"><strong>Desciption</strong></td>
            <td class="last"><asp:TextBox ID="txtDesc" runat="server" CssClass="data-input form-control"
                    Height="89px" Width="222px"></asp:TextBox>
               
              </td>
          </tr>
          <tr class="bg">
            <td class="first"></td>
            <td class="last">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" 
                    Text="Save Category" Font-Bold="True" onclick="btnAddBus_Click" 
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
        CssClass="table"
            AutoGenerateColumns="False" DataKeyNames="Cat_ID" 
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            onpageindexchanging="GridView1_PageIndexChanging" PageSize="5" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Category ID" DataField="Cat_ID" 
                    SortExpression="Cat_ID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Type" DataField="Type" 
                    SortExpression="Type"/>
                     <asp:BoundField HeaderText="Rate" DataField="Rate" 
                    SortExpression="Rate"/>
                <asp:TemplateField HeaderText="Edit - Delete">
                    <ItemTemplate>
                     <asp:LinkButton ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("Cat_ID") %>' 
                        CommandName="Select" ToolTip="Edit Category"
                        CssClass="btn btn-default btn-lg">
                        <span class=" glyphicon glyphicon-pencil"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("Cat_ID") %>' 
                        CommandName="Delete" ToolTip="Delete Category"
                        CssClass="btn btn-default btn-lg"
                        OnClientClick="return confirm('Deleting Category will delete all Bus have this Category. Are you sure delete this Category ?')" >
                        <span class="glyphicon glyphicon-remove"></span>
                        </asp:LinkButton>
                        
                       <%-- <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("Cat_ID") %>' CommandName="Select" ToolTip="Edit Category"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                        <asp:ImageButton ID="ibtnDeleteCentral" runat="server" 
                            CommandArgument='<%# Eval("Cat_ID") %>' CommandName="Delete" ToolTip="Delete Category"
                            ImageUrl="img/hr.gif" />--%>
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
