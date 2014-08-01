<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTour.aspx.cs" Inherits="SearchTour" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true" ID="ScriptManager1" CombineScripts="false" />
            <div class="list-search-tour">
    <div class="list-search-tour-item">
        <asp:Label ID="txtStart" runat="server" Text="Start"></asp:Label>
        <asp:DropDownList ID="ddStart" runat="server">
        </asp:DropDownList>
    </div>
    <div class="list-search-tour-item">
        Destination<asp:DropDownList ID="ddDest" runat="server">
        </asp:DropDownList>
    </div>
    <div class="list-search-tour-item">
        Date From
        <asp:TextBox runat="server" ID="txtDateFrom" autocomplete="off" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDateFrom" />
        &nbsp;To 
        <asp:TextBox runat="server" ID="txtDateTo" autocomplete="off" />
        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy"  TargetControlID="txtDateTo" />
    </div>
<div class="list-search-tour-item">
        Bus Type&nbsp;
        <asp:DropDownList ID="ddBus" runat="server">
        </asp:DropDownList>
    </div>
<div class="list-search-tour-item">
        <asp:Button ID="btnSearch" runat="server" 
            Text="Search" /> 
    </div>
<div class="list-search-tour-item">
        <asp:Label ID="txtError" runat="server"></asp:Label>
    </div>
    <div class="list-search-tour-item">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" PageSize="20">
        </asp:GridView>
    </div>
    </div>
</asp:Content>

