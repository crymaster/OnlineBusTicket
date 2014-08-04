<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="employeemanager.aspx.cs" Inherits="manager_employeemanager" Title="Untitled Page" %>
<%@ Register assembly="AjaxControlToolkit"  namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="top-bar">
      
        <h1>Employee</h1>
    <div class="select-bar">
    <ul class="list-inline">
    <li>
     <strong>ID</strong>
    </li>
    <li>
     <asp:TextBox ID="txtIDSearch" runat="server" 
            CssClass="search-input form-control"></asp:TextBox>
    </li>
    <li>
     <strong>Name</strong>
    </li>
    <li>
     <asp:TextBox ID="txtNameSearch" runat="server" 
            CssClass="search-input form-control"></asp:TextBox>
    </li>
    <li>
     <strong>Central</strong>
    </li>
    <li>
      <asp:DropDownList ID="ddlCentralsSearch" runat="server" 
            CssClass="search-input form-control" ></asp:DropDownList>
    </li>
    <li>
     <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" 
                            Font-Bold="True" Text="Search" onclick="btnSearch_Click"/>
    </li>
    </ul>
    </div>
    <div class="select-bar">
        
        <asp:HiddenField ID="hfSearch" runat="server" Value="9" />
    </div>
     <div class="action">
    <asp:LinkButton ID="LinkButton2" runat="server"
     CssClass="button btn btn-success" 
            onclick="lbtnAddNew_Click1">New Employee</asp:LinkButton>
    </div>
    <div>
     <%--<asp:Label ID="lblInformation" runat="server" ForeColor="Red" Visible="False" 
            Font-Bold="True" Font-Size="15px"></asp:Label>--%>
    <asp:Panel ID="pInsert" runat="server" Visible="False">
        <div class="table"> <%--<img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />--%>
            <table cellpadding="0" cellspacing="0" class="table">
                <tr>
                    <th class="full" colspan="2">
                        <asp:Label ID="lbMode" runat="server" Text=""></asp:Label>
                    </th>
                </tr>
                <tr>
                    <td class="first" width="172">
                        <strong>Employee ID</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtEmpID" runat="server" CssClass="search-input form-control" 
                            Enabled="False"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtEmpID" ErrorMessage="*" ToolTip="Bus ID is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first" style="height: 58px">
                        <strong>Centrals ID</strong></td>
                    <td class="last" style="height: 58px">
                        <asp:DropDownList ID="ddlCentralID" runat="server" CssClass="search-input form-control" 
                            DataSourceID="SqlStation" DataTextField="Cent_Name" 
                            DataValueField="CentralID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlStation" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                            SelectCommand="SELECT [CentralID], [Cent_Name] FROM [Centrals] WHERE Deactived='N' ORDER BY [Cent_Name]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Name</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtName" runat="server" CssClass="search-input form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="*" ToolTip="Name is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Email</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="search-input form-control"></asp:TextBox>
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
                        <asp:TextBox ID="txtAddress" runat="server" 
                            CssClass="search-input form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtAddress" ErrorMessage="*" ToolTip="Address is empty" 
                            ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Phone</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="search-input form-control"></asp:TextBox>
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
                    <asp:TextBox ID="txtDOB" runat="server" 
                CssClass="search-input form-control"></asp:TextBox>
              <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    Enabled="True" TargetControlID="txtDOB"></cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ControlToValidate="txtDOB" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="bg">
                    <td class="first">
                        <strong>Qualification</strong></td>
                    <td class="last">
                        <asp:TextBox ID="txtQualification" runat="server" 
                            CssClass="search-input form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtQualification" ErrorMessage="*" 
                            ToolTip="Qualification is empty" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                    <asp:Panel ID="ResetPasswordPanel" runat="server" Visible="false">
                    <tr>
                    <td>
                    <strong>Password</strong>
                    </td>
                    <td>
                        <asp:Button ID="btnResetPass" runat="server" Text="Reset" CssClass="btn btn-success" onclick="btnResetPass_Click" />
                    </td>
                    </tr>
                    </asp:Panel>
                    
               
                <tr class="bg">
                    <td class="first">
                    </td>
                    <td class="last">
                        <asp:Button ID="btnNewEmp" runat="server" CssClass="btn btn-primary" Font-Bold="True" 
                            onclick="btnNewEmp_Click" Text="Save" ValidationGroup="Insert" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <%--<asp:Button ID="btnDeleteEmp" runat="server" CssClass="btn btn-warning" 
                            Font-Bold="True" onclick="btnDeleteEmp_Click" Text="Delete" 
                            Visible="False" />--%>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnCloseNewEmp" runat="server" CssClass="btn btn-info" 
                            Font-Bold="True" Text="Close" onclick="btnCloseNewEmp_Click" />
                    </td>
                </tr>
            </table>
        
    </div>
    </asp:Panel>
      </div>
    <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="GridView1" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="search-input " DataKeyNames="EmpId"  
            CellPadding="4" ForeColor="#333333" 
            GridLines="None" AllowPaging="True" AllowSorting="True" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onsorting="GridView1_Sorting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            OnRowDeleting="btnDeleteEmp_Click"
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
                       
                        <asp:LinkButton ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("EmpId") %>' 
                        CommandName="Select" ToolTip="Edit Employee"
                        CssClass="btn btn-default btn-lg">
                        <span class=" glyphicon glyphicon-pencil"></span>
                        </asp:LinkButton>
                      <asp:LinkButton ID="LinkButton1" runat="server" 
                                    CommandArgument='<%# Eval("EmpId") %>' CommandName="Delete" 
                                    CssClass="btn btn-default btn-lg" ToolTip="Delete Employee"
                                    OnClientClick="return confirm('Are you sure delete this employee ?')" >
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

