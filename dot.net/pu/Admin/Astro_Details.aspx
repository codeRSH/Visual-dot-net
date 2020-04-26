<%@ page language="C#" masterpagefile="~/Admin/AdminMasterPage.master" autoeventwireup="true" inherits="Admin_Astro_List, App_Web_2frli6if" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Heading">Astrology Details</div>
<br />
<table width="100%">
    <tr>
        <td align="right">
            <a href="astrology_list.aspx">Back</a>
        </td>
    </tr>
</table>
<center>


</center>
<br />
    <br />
    <br />

    <center>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" Width="433px" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HeaderText="Atrology Details">
        <Fields>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="FHName" HeaderText="Father's Name" />
            <asp:BoundField DataField="Sex" HeaderText="Gender" />
            <asp:BoundField DataField="Dbirth" HeaderText="Date Of Birth" />
            <asp:BoundField DataField="Tbirth" HeaderText=" Time Of Birth" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="State" HeaderText="State" />
            <asp:BoundField DataField="Country" HeaderText="Country" />
            <asp:BoundField DataField="Pin" HeaderText="Pin Code" />
            <asp:BoundField DataField="Phone" HeaderText="Phone No." />
            <asp:BoundField DataField="mobile" HeaderText="Mobile" />
            <asp:BoundField DataField="Email" HeaderText="Email Id" />
        
        
        </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <RowStyle ForeColor="#000066" HorizontalAlign="Left" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Justify" VerticalAlign="Top" />
        
        </asp:DetailsView>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="AstroDetailsfill"
            TypeName="CommonClass"></asp:ObjectDataSource>
    </center>

</asp:Content>

