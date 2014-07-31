<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="manager_changepasword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="ChangePanel" runat="server">
        <table class="table">
<tr>
<td width="20%">
 Current pasword
</td>
<td >
    <asp:TextBox ID="txtCurrent" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
    ControlToValidate="txtCurrent" runat="server" 
    ErrorMessage="Password is required !"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
 New pasword
</td>
<td>
    <asp:TextBox ID="txtNew" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
    ControlToValidate="txtNew" runat="server" 
    ErrorMessage="New Password is required !"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
 Re-New pasword
</td>
<td>
    <asp:TextBox ID="txtReNew" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
    ControlToValidate="txtReNew" runat="server" 
    ErrorMessage="Re Password is not compair !"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnChange" runat="server" Text="Change Password" 
        onclick="btnChange_Click" CssClass="btn btn-primary" />
</td>
<td>
    <asp:Button ID="txtCancel" runat="server" Text="Cancel" CssClass="btn btn-info" />
</td>
</tr>
</table>
    </asp:Panel>
    <asp:Panel ID="ResultPanel" runat="server" Visible="False">
        <div>Change password success</div>
    </asp:Panel>
</asp:Content>

