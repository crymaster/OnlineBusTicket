<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTour.aspx.cs" Inherits="SearchTour" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true" ID="ScriptManager1" CombineScripts="false" />
    <p>
        <asp:Label ID="txtStart" runat="server" Text="Start"></asp:Label>
        <asp:DropDownList ID="ddStart" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        Destination<asp:DropDownList ID="ddDest" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        Date From
        <asp:TextBox runat="server" ID="txtDateFrom" autocomplete="off" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="txtDateFrom" />
        &nbsp;To 
        <asp:TextBox runat="server" ID="txtDateTo" autocomplete="off" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"  TargetControlID="txtDateTo" />
    </p>
<p>
        Bus Type&nbsp;
        <asp:DropDownList ID="ddBus" runat="server">
        </asp:DropDownList>
    </p>
<p>
        <asp:Button ID="btnSearch" runat="server" 
            Text="Search" />
    </p>
<p>
        <asp:Label ID="txtError" runat="server"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" PageSize="20">
        </asp:GridView>
    </p>
</asp:Content>

