<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="employeemanager.aspx.cs" Inherits="manager_employeemanager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top-bar">
        <asp:LinkButton ID="lbtnAddNew" runat="server" CssClass="button" 
            onclick="lbtnAddNew_Click1">New Employee</asp:LinkButton>
        <h1>Employees</h1>
    <div class="breadcrumbs"><a href="http://www.free-css.com/">Homepage</a> / <a href="http://www.free-css.com/">
        Contents</a></div>
    </div>
      <br />
    <div class="select-bar">
       <strong>ID</strong>
        <asp:TextBox ID="txtIDSearch" runat="server"></asp:TextBox>
        <strong>Name</strong>
        <asp:TextBox ID="txtNameSearch" runat="server"></asp:TextBox>
        <strong>Central</strong>
        <asp:DropDownList ID="ddlCentralsSearch" runat="server" CssClass="text" >
        </asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" CssClass="button" 
                            Font-Bold="True" Text="Search" onclick="btnSearch_Click"/>
        &nbsp;&nbsp;&nbsp;
        
    </div>
    <div class="select-bar">
        <strong>Centrals ID</strong>
        
 
        <asp:HiddenField ID="hfSearch" runat="server" Value="9" />
    </div>
    <div><asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label></div>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table"> <%--<img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />--%>
            <table cellpadding="0" cellspacing="0" class="listing form">
                <tr>
                    <th class="full" colspan="2">
                        New employee</th>
                </tr>
                <tr>
                    <td class="first" width="172">
                        <strong>Employee ID</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtEmpID" runat="server" CssClass="text" Enabled="False"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtEmpID" ErrorMessage="*" ToolTip="Bus ID is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first" style="height: 58px">
                        <strong>Centrals ID</strong></td>
                    <td class="last" style="height: 58px">
                        <asp:DropDownList ID="ddlCentralID" runat="server" CssClass="text" 
                            DataSourceID="SqlStation" DataTextField="Cent_Name" DataValueField="CentralID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlStation" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                            SelectCommand="SELECT [CentralID], [Cent_Name] FROM [Centrals] ORDER BY [Cent_Name]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Name</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtName" runat="server" CssClass="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="*" ToolTip="Name is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Email</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="*" ToolTip="Email is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="*" ToolTip="Email is valid" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="Insert"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Address</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtAddress" ErrorMessage="*" ToolTip="Address is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Phone</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="*" ToolTip="Phone is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="*" 
                            ToolTip="Phone is Valid (Ex: 09xxxxxxx or 01xxxxxxxxxx)" 
                            ValidationExpression="^[0-9]{9,12}$" ValidationGroup="Insert"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>DOB</strong></td>
                    <td class="last">
                        <asp:Label ID="lblDOB" runat="server" CssClass="bold"></asp:Label>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Qualification</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtQualification" runat="server" CssClass="text"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtQualification" ErrorMessage="*" 
                            ToolTip="Qualification is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                    </td>
                    <td class="last">
                        <asp:Button ID="btnNewEmp" runat="server" CssClass="button" Font-Bold="True" 
                            onclick="btnNewEmp_Click" Text="Save Employee" ValidationGroup="Insert" />
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnDeleteEmp" runat="server" CssClass="button" 
                            Font-Bold="True" onclick="btnDeleteEmp_Click" Text="Delete Employee" 
                            Visible="False" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCloseNewEmp" runat="server" CssClass="button" 
                            Font-Bold="True" Text="Close" onclick="btnCloseNewEmp_Click" />
                    </td>
                </tr>
            </table>
        
    </div>
    </asp:Panel>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="listing" DataKeyNames="EmpId"  
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" AllowPaging="True" AllowSorting="True" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onsorting="GridView1_Sorting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowediting="GridView1_RowEditing" >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="EmpId" DataField="EmpId" SortExpression="EmpId" 
                    ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="Cent_Name" HeaderText="Central Name" 
                    SortExpression="CentralID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                    SortExpression="Qualification" />
             <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("EmpId") %>' CommandName="Select" ToolTip="Edit Employee"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                       
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

