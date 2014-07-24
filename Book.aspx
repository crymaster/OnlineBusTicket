<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Book.aspx.cs" Inherits="Book" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h3>
        Tour information</h3>
    <p>
        Start:
        <asp:Label ID="lbStart" runat="server"></asp:Label>
    </p>
    <p>
        Destination:
        <asp:Label ID="lbDest" runat="server"></asp:Label>
    </p>
    <p>
        Distance:
        <asp:Label ID="lbDistance" runat="server"></asp:Label>
    </p>
    <p>
        Bus No:
        <asp:Label ID="lbBusNo" runat="server"></asp:Label>
    </p>
    <p>
        Bus Type:
        <asp:Label ID="lbType" runat="server"></asp:Label>
    </p>
    <p>
        Running Date:
        <asp:Label ID="lbDate" runat="server"></asp:Label>
    </p>
    <p>
        Running Time:
        <asp:Label ID="lbTime" runat="server"></asp:Label>
    </p>
    <p>
        Capacity:
        <asp:Label ID="lbCapacity" runat="server"></asp:Label>
    </p>
    <p>
        Available Seat:
        <asp:Label ID="lbAvaiSeat" runat="server"></asp:Label>
    </p>
    <p>
        Adult Price:
        <asp:Label ID="lbAdult" runat="server"></asp:Label>
    </p>
    <p>
        Elder Price:
        <asp:Label ID="lbElder" runat="server"></asp:Label>
    </p>
    <p>
        Kid Price:
        <asp:Label ID="lbKid" runat="server"></asp:Label>
    </p>
    <h3>
        Customer information</h3>
    <p>
        UID/Passport No*:
        <asp:TextBox ID="txtID" runat="server" AutoPostBack="True" 
            ontextchanged="txtID_TextChanged"></asp:TextBox>
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
        <asp:TextBox ID="txtDOB" runat="server" AutoPostBack="True" 
            ontextchanged="txtDOB_TextChanged"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender" runat="server"  Format="dd/MM/yyyy"
            Enabled="True" TargetControlID="txtDOB">
        </asp:CalendarExtender>
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbDOB" runat="server"></asp:Label>
    </p>
    <p>
        Gender:
        <asp:RadioButton ID="rdMale" runat="server" Checked="True" GroupName="gender" 
            Text="Male" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rdFemale" runat="server" GroupName="gender" 
            Text="Female" />
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
        Seat No:
        <asp:DropDownList ID="ddSeat" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        Price:&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbPrice" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;
        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Cancel" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBook" runat="server" Text="Book" 
            onclick="btnContinue_Click" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
