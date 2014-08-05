<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerView.ascx.cs" Inherits="CustomerView" %>
<div id="customer-search">
Name 
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    Email
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearchCus" runat="server" Text="Search" 
        onclick="btnSearchCus_Click" />
</div>
 <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="CusGV" runat="server" Width="100%" 
            AutoGenerateColumns="False" CssClass="listing" DataKeyNames="CustomerID" 
             AllowPaging="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            EmptyDataText="No Customer found" 
          >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Customer ID" Visible="false" DataField="CustomerID" SortExpression="CustomerID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name"/>
                <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email"/>
                <asp:BoundField HeaderText="Phone" DataField="Phone" SortExpression="Phone"/>
                <asp:BoundField HeaderText="Date of Birth" DataField="DOB" SortExpression="DOB"/>
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>