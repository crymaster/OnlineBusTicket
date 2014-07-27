<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PrintTicket.aspx.cs" Inherits="PrintTicket" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 313px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div id="center_big_box" class="Print" style="height: 456px">
        <table>
            <tr>
                <td style="width: 270px" valign="top" align="right">
                    <span class="orange">&nbsp;<asp:Label ID="lblTD" runat="server" Text="Ticket Details:"></asp:Label>
                    </span>
                </td>
                <td class="style1">
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="#C0C0FF" Height="301px" 
                        Width="300px">
                        <div align="center">
                            <b>SRC Travel Agencies<br />
                                1 - Nguyen Trai - Hanoi<br />
                                Phone:05113.944147 </b>
                            <br />
                            <b>------------------------------------------------------------</b><br />
                            <b>BUS TICKET</b><br />
                            <b>No:</b>
                            <asp:Label ID="lblTID" runat="server"></asp:Label>
                        </div>
                        <br />
                        <b>Passenger:    </b>
                        <asp:Label ID="lblPassenger" runat="server"></asp:Label>
                        <br />
                        <b>Bus:    </b><asp:Label ID="lblBus" runat="server"></asp:Label>
                        <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number
                            Plate:</b><asp:Label ID="lblNP" runat="server"></asp:Label>
                        <br />
                        <b>Start:    </b><asp:Label ID="lblS" runat="server"></asp:Label>
                        <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination:    </b><asp:Label ID="lblD" runat="server"></asp:Label>
                        <br />
                        <b>Running Date/Time:    </b><asp:Label ID="lblDate" runat="server"></asp:Label>
                        <br />
                        <b>Seat:    </b>
                        <asp:Label ID="lblSeat" runat="server" ForeColor="Red"></asp:Label>
                    </asp:Panel>
                    <cc1:DropShadowExtender ID="DropShadowExtender1" runat="server" TargetControlID="Panel1"
                        Rounded="true" Radius="10">
                    </cc1:DropShadowExtender>
                    <br />
                    <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print" Width="47px"
                        BackColor="#EFEFEF" Visible="True" Height="26px" />
                    &nbsp;<br />
                    <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
