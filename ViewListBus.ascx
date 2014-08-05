<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewListBus.ascx.cs" Inherits="ViewListBus" %>
<div class="select-bar list-view-bus">
    <div class="list-view-bus-item">
      <strong>ID</strong>
        <asp:TextBox ID="txtIDSearch" runat="server"></asp:TextBox>
        </div>
        <div class="list-view-bus-item">
     <strong>Name</strong>
        <asp:TextBox ID="txtNameSearch" runat="server"></asp:TextBox>
        </div>
        <div class="list-view-bus-item">        
         <strong>Number Plate</strong>
        <asp:TextBox ID="txtNumberPlateSearch" runat="server"></asp:TextBox>
        </div>
        <div class="list-view-bus-item">
        <strong>Central</strong>
        <asp:DropDownList ID="ddlCentralSearch" runat="server" 
            
            >
        </asp:DropDownList>
        </div>
        <div class="list-view-bus-item">
        <strong>Category</strong>
        <asp:DropDownList ID="ddlCategoriesSearch" runat="server" 
           
            >
        </asp:DropDownList>
        </div>
        <div class="button-search">
        <asp:Button ID="btnSearchBus" runat="server" CssClass="button" 
                    Text="Search" Font-Bold="True" onclick="btnSearchBus_Click"/></div>
                     <asp:SqlDataSource ID="SqlCentral" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [CentralID], [Cent_Name] FROM [Centrals] ORDER BY [Cent_Name]">
                </asp:SqlDataSource>
                 <asp:SqlDataSource ID="SqlCategories" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnlineBusTicketConnectionString %>" 
                    SelectCommand="SELECT [Cat_ID], [Type] FROM [Categories] ORDER BY [Type]">
                </asp:SqlDataSource>
    </div>
 <div class="table"> <img src="img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img src="img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <asp:GridView ID="BusGV" runat="server" Width="100%" 

            AutoGenerateColumns="False" CssClass="listing" DataKeyNames="BusID" 
             AllowPaging="True" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            EmptyDataText="No Bus found" 
          >
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <asp:BoundField HeaderText="Bus ID" DataField="BusID" SortExpression="BusID">
                    <ItemStyle Wrap="True" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Bus Code" DataField="Name" SortExpression="Name"/>
                <asp:BoundField HeaderText="Number Seat" DataField="NumSeat" SortExpression="NumSeat"/>
                <asp:BoundField HeaderText="Number Plate" DataField="NumberPlate" SortExpression="NumberPlate"/>
                <asp:BoundField HeaderText="Central" DataField="Cent_Name" SortExpression="Cent_Name"/>
                <asp:BoundField HeaderText="Category" DataField="Type" SortExpression="Type"/>
              
            </Columns>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>