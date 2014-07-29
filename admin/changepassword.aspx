<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="manager_changepasword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="ChangePanel" runat="server">
        <table class="table">
<tr>
<td>
 Current pasword
</td>
<td>
    <asp:TextBox ID="txtCurrent" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 New pasword
</td>
<td>
    <asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 Re-New pasword
</td>
<td>
    <asp:TextBox ID="txtReNew" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnChange" runat="server" Text="Change Password" 
        onclick="btnChange_Click" />
</td>
<td>
    <asp:Button ID="txtCancel" runat="server" Text="Cancel" />
</td>
</tr>
</table>
    </asp:Panel>
    <asp:Panel ID="ResultPanel" runat="server" Visible="False">
        <div>Change password success</div>
    </asp:Panel>
</asp:Content>

