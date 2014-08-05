<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="rule.aspx.cs" Inherits="rule" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="EditPanel" runat="server" Visible="False">
    <div>
        <h2>Fee</h2>
    </div>
    <table class="table">
    <tr>
    <td>
    Price
    </td>
    <td>
    <span>
        <asp:TextBox ID="txtPrice" runat="server" Width="200px"  ></asp:TextBox>
        VN&#272;/KM
        </span>
    </td>
    <td>
        
        
    </td>
    </tr>
    <tr>
    <td>
        Kid 1
    </td>
    <td>
        <asp:TextBox ID="txtPKid1" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
    Below
        <asp:TextBox ID="txtDKid1" runat="server" Width="100px"  ></asp:TextBox>
        ages
    </td>
    </tr>
    <tr>
    <td>
        Kid 2
    </td>
    <td>
        <asp:TextBox ID="txtPKid2" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
         Below
        <asp:TextBox ID="txtDKid2" runat="server" Width="100px"  ></asp:TextBox>
        ages
    </td>
    </tr>
    <tr>
    <td>
    Elder
    </td>
    <td>
        <asp:TextBox ID="txtPElder" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
        Above
        <asp:TextBox ID="txtDElder" runat="server" Width="100px"  ></asp:TextBox>
        ages
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <h2>Refuse</h2>
    </td>
    </tr>
    <tr>
    <td>
    Cancel 1
    </td>
    <td>
        <asp:TextBox ID="txtPCan1" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
    Before
        <asp:TextBox ID="txtDCan1" runat="server" Width="100px"  ></asp:TextBox>
        days
    </td>
    </tr>
    <tr>
    <td>
    Cancel 2
    </td>
    <td>
        <asp:TextBox ID="txtPCan2" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
    Before
        <asp:TextBox ID="txtDCan2" runat="server" Width="100px"  ></asp:TextBox>
        days
    </td>
    </tr>
    <tr>
    <td>
    Cancel 3
    </td>
    <td>
        <asp:TextBox ID="txtPCan3" runat="server" Width="100px"  ></asp:TextBox>
        %
    </td>
    <td>
    Before
        <asp:TextBox ID="txtDCan3" runat="server" Width="100px"  ></asp:TextBox>
        days
    </td>
    </tr>
    <tr>
    <td></td>
    <td style="text-align='center'">
        <asp:Button ID="btnSave"  CssClass="btn btn-primary"  runat="server" 
            Text="Save" onclick="btnSave_Click" />
    <asp:Button ID="btnClose"  CssClass="btn btn-info"  runat="server" Text="Close" 
            onclick="btnClose_Click" />
    </td>
    <td></td>
    </tr>
    </table>
    </asp:Panel>
    
    
    
     <asp:Panel ID="ViewPanel" runat="server" Visible="True">
    <div>
        <h2>Fee</h2>
    </div>
    <table class="table">
    <tr>
    <td>
    Price
    </td>
    <td>
    <span>
        <asp:Label ID="lbPrice" runat="server" Text="0"></asp:Label>
        VN&#272;/KM
        </span>
    </td>
    <td>
        
        
    </td>
    </tr>
    <tr>
    <td>
        Kid 1
    </td>
    <td>
        <asp:Label ID="lbPKid1" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
    Below
        <asp:Label ID="lbDKid1" runat="server" Text="0"></asp:Label>
        ages
    </td>
    </tr>
    <tr>
    <td>
        Kid 2
    </td>
    <td>
        <asp:Label ID="lbPKid2" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
         Below
        <asp:Label ID="lbDKid2" runat="server" Text="0"></asp:Label>
        ages
    </td>
    </tr>
    <tr>
    <td>
    Elder
    </td>
    <td>
        <asp:Label ID="lbPElder" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
        Above
        <asp:Label ID="lbDElder" runat="server" Text="0"></asp:Label>
        ages
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <h2>Refuse</h2>
    </td>
    </tr>
    <tr>
    <td>
    Cancel 1
    </td>
    <td>
        <asp:Label ID="lbPCan1" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
    Before
        <asp:Label ID="lbDCan1" runat="server" Text="0"></asp:Label>
        days
    </td>
    </tr>
    <tr>
    <td>
    Cancel 2
    </td>
    <td>
        <asp:Label ID="lbPCan2" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
    Before
        <asp:Label ID="lbDCan2" runat="server" Text="0"></asp:Label>
        days
    </td>
    </tr>
    <tr>
    <td>
    Cancel 3
    </td>
    <td>
        <asp:Label ID="lbPCan3" runat="server" Text="0"></asp:Label>
        %
    </td>
    <td>
    Before
        <asp:Label ID="lbDCan3" runat="server" Text="0"></asp:Label>
        days
    </td>
    </tr>
    <tr>
    
    <td style="text-align='center'">
        <asp:Button ID="btnEdit"  CssClass="btn btn-primary" Width="50px"  
            runat="server" Text="Edit" onclick="btnEdit_Click" />
    </td>
    <td></td>
    <td></td>
    </tr>
    </table>
    </asp:Panel> 
</asp:Content>

