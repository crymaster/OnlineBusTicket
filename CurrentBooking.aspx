<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CurrentBooking.aspx.cs" Inherits="CurrentBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbMessage" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
    <br />
<br />
<asp:HyperLink ID="hlMore" runat="server" NavigateUrl="SearchTour.aspx">Book More</asp:HyperLink>
<br />
<asp:HyperLink ID="hlAnother" runat="server" NavigateUrl="CustomerInfo.aspx">Book For Another</asp:HyperLink>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        AllowSorting="True" onrowdatabound="GridView1_RowDataBound" 
        ShowFooter="True">
        <FooterStyle BackColor="#61A6F8" BorderColor="White" BorderStyle="None" 
            Font-Bold="True" ForeColor="Black" Wrap="False" />
</asp:GridView>
    <br />
<asp:LinkButton ID="btnEnd" runat="server" onclick="btnEnd_Click">End Booking</asp:LinkButton>
<br />
</asp:Content>

