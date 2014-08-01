<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/login-form.css" media="screen" />
</head>
<body>
    <form id="form1" runat="server" class="form-login">
    <div>
    <h1 class="login-title">Login</h1>
        <table style="" class="table-login">
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" class="input-text"></asp:TextBox>
                    <asp:Label ID="txtError" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Password" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="input-text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" />
                </td>
                <td class="remember">
                    <asp:CheckBox ID="ckRemember" runat="server" Text="Remember Me" />
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
