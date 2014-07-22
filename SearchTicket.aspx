<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTicket.aspx.cs" Inherits="SearchTicket" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 291px;
        }
        .style2
        {
            width: 291px;
            height: 23px;
        }
        .style3
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true" ID="ScriptManager1" CombineScripts="false" />
    <p>
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" 
            Checked="True" GroupName="radioGroup" Text="Search by TicketNo" 
            oncheckedchanged="RadioButton1_CheckedChanged" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" 
            GroupName="radioGroup" Text="Search by Others" 
            oncheckedchanged="RadioButton2_CheckedChanged" />
    </p>
    
        
                    <asp:Label ID="lbTicket" runat="server" Text="TicketNo"></asp:Label>
                    <asp:TextBox ID="txtTicket" runat="server"></asp:TextBox>
        
                    <asp:Label ID="lbName" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        
                    <br />
        
                    <asp:Label ID="lbStart" runat="server" Text="Start"></asp:Label>
                    <asp:DropDownList ID="ddStart" runat="server">
                    </asp:DropDownList>
        
                    <br />
        
                    <asp:Label ID="lbDest" runat="server" Text="Destination"></asp:Label>
                    <asp:DropDownList ID="ddDest" runat="server">
                    </asp:DropDownList>
        
                    <br />
        
                    <asp:Label ID="lbFrom" runat="server" Text="Date From"></asp:Label>
                    <asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>
                    <ajaxtoolkit:calendarextender ID="CalendarExtender1" runat="server"  
                        TargetControlID="txtFrom" />
&nbsp;<asp:Label ID="lbTo" runat="server" Text="To"></asp:Label>
                    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
                    <ajaxtoolkit:calendarextender ID="CalendarExtender2" runat="server"  
                        TargetControlID="txtTo" />
        
    
<br />
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
<br />
<asp:Label ID="txtError" runat="server"></asp:Label>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False">
</asp:GridView>
        
    
</asp:Content>

