<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="changepasword.aspx.cs" Inherits="manager_changepasword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
<tr>
<td>
 Current pasword
</td>
<td>
    <asp:TextBox ID="txtCurrent" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 New pasword
</td>
<td>
    <asp:TextBox ID="txtNew" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
 Re-New pasword
</td>
<td>
    <asp:TextBox ID="txtReNew" runat="server"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="btnChange" runat="server" Text="Change Password" />
</td>
<td>
    <asp:Button ID="txtCancel" runat="server" Text="Cancel" />
</td>
</tr>
</table>
</asp:Content>

