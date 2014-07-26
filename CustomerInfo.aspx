<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CustomerInfo.aspx.cs" Inherits="CustomerInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
        <h3>
            Customer information</h3>
        <p>
            UID/Passport No*:
            <asp:TextBox ID="txtID" runat="server" AutoPostBack="True" OnTextChanged="txtID_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbStatus" runat="server"></asp:Label>
        </p>
        <p>
            Name*:&nbsp;
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbName" runat="server"></asp:Label>
        </p>
        <p>
            DOB*:
            <asp:TextBox ID="txtDOB" runat="server" AutoPostBack="True"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender" runat="server" Format="dd/MM/yyyy" Enabled="True"
                TargetControlID="txtDOB">
            </asp:CalendarExtender>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbDOB" runat="server"></asp:Label>
        </p>
        <p>
            Gender:
            <asp:RadioButton ID="rdMale" runat="server" Checked="True" GroupName="gender" Text="Male" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="rdFemale" runat="server" GroupName="gender" Text="Female" />
        </p>
        <p>
            Email:
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </p>
        <p>
            Address:
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        </p>
        <p>
            Phone:
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </p>
<p>
            <asp:Button ID="btnContinue" runat="server" onclick="btnContinue_Click" 
                Text="Continue" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
        </p>
</asp:Content>
