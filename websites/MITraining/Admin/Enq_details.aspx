<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Enq_details.aspx.cs" Inherits="Admin_Enq_details" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Heading">Enquiry Details</div>
<table width="100%">
    <tr>
        <td align="right">
            <a href="astrology_list.aspx">Back</a>
        </td>
    </tr>
</table>
<center>
<br />
    <asp:Label ID="Label1" runat="server" Text="Label" Width="332px"></asp:Label><br />
    <br />
<table>

    <tr>
        <td>
             <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" Height="50px" Width="125px" DataSourceID="ObjectDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
             
                <Fields>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Reg_No" HeaderText="Reg.No" />
                        <asp:BoundField  DataField="phone_no" HeaderText="Phone No" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                        <asp:BoundField DataField="enq_date" HeaderText="Date" />
                        
                        
                         <asp:TemplateField  HeaderText="Enquiry:"  >
                         <ItemTemplate>
                         <asp:TextBox ID="txt1" Text='<%#Eval("enquiry") %>'  ForeColor="#000040" TextMode="MultiLine" ReadOnly="true" Width="250px" Height="120px" runat="server"></asp:TextBox> 
                         </ItemTemplate>
                          <HeaderStyle CssClass="headerstyle1" />
                         </asp:TemplateField>
                
                </Fields>
             
             
             
             
             
             
             
                 <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                 <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                 <RowStyle BackColor="White" ForeColor="#330099" />
                 <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                 <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                 <FooterTemplate>
                 <asp:LinkButton ID="lb1"  runat="server" Font-Bold="true" Font-Size="13px" OnClick="reply" ForeColor="darkblue" Text="Reply"></asp:LinkButton>
                  </FooterTemplate>
            </asp:DetailsView>
        </td>
    </tr>

</table>
 </center>  
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="filldetails"
        TypeName="CommonClass"></asp:ObjectDataSource>

</asp:Content>

