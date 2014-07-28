<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="rule.aspx.cs" Inherits="rule" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="EditAgeFee" runat="server" Visible="False">
    <div>
        Update Fee
    </div>
    <table>
    <tr>
    <td>
    Type
    </td>
    <td>
        <asp:Label ID="lbAgeType" runat="server" Text=""></asp:Label>
    </td>
    </tr>
    <tr>
    <td>
    Age
    </td>
    <td>
        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Fee
    </td>
    <td>
        <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnAgeSave" runat="server" Text="Save" 
            onclick="btnAgeSave_Click" />
    </td>
    <td>
        <asp:Button ID="btnCancelF" runat="server" Text="Cancel" 
            onclick="btnCancelF_Click" />
    </td>
    </tr>
    </table>
    </asp:Panel>
     <asp:Panel ID="EditRefusePN" runat="server" Visible="False">
    <div>
    Update Refuse
    </div>
    <table>
    <tr>
    <td>
    Day
    </td>
    <td>
        <asp:TextBox ID="txtRefuseDay" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    Refuse
    </td>
    <td>
        <asp:TextBox ID="txtRefuse" runat="server"></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Button ID="btnUpdateRefuse" runat="server" Text="Save" 
            onclick="btnUpdateRefuse_Click" />
    </td>
    <td>
        <asp:Button ID="btnCancelR" runat="server" Text="Cancel" 
            onclick="btnCancelR_Click" />
    </td>
    </tr>
    </table>
    </asp:Panel>
     <asp:Panel ID="ViewPN" runat="server">
    <div>
    <div>
    Fee
    </div>
        <asp:GridView ID="FeeGV" runat="server" AutoGenerateColumns="False" 
        Width="100%"
            DataKeyNames="Type" onselectedindexchanged="FeeGV_SelectedIndexChanged">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FF0066" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="true" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" />
                  <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("Type") %>' CommandName="Select" ToolTip="Edit Age Fee"
                            ImageUrl="img/edit-icon.gif" Height="16px" />
                       
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
    
    <div>
    <div>Refuse</div>
        <asp:GridView ID="RefuseGV" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Day" 
            onselectedindexchanged="RefuseGV_SelectedIndexChanged" Width="100%">
            <Columns>
                <asp:BoundField DataField="Day" HeaderText="Day" />
                <asp:BoundField DataField="Refuse" HeaderText="Refuse" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnEditBus" runat="server" 
                            CommandArgument='<%# Eval("Day") %>' CommandName="Select" Height="16px" 
                            ImageUrl="img/edit-icon.gif" ToolTip="Edit Refuse" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </asp:Panel>
</asp:Content>

