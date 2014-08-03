<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/login-form.css" media="screen" />
</head>
<body>
<form runat="server" class="form-login">


    <div>
        <h1 class="login-title">Login</h1>
        <table class="table-login">
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:Label ID="txtError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" />
                </td>
              <%--  <td>
                    <asp:CheckBox ID="ckRemember" runat="server" Text="Remember Me" />
                </td>--%>
            </tr>
        </table>
        
    </div>
</form>
</body>
</html>