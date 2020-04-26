<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EnquiryList.aspx.cs" Inherits="Admin_EnquiryList" Title="Enquiry List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Heading">Enquiry List</div>
<center>
<table>
    <tr>
        <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Width="317px"></asp:Label>&nbsp;<br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Yes" />
               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="No" /><br />
                &nbsp;
            </td>
        </tr>
</table>
        
</center>
    <center>
        &nbsp;</center>
    <center>
        &nbsp;</center>
    <center>

            <asp:GridView ID="GridView1"  DataKeyNames="id" OnRowDataBound="sno" runat="server" Width="600px" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                    <asp:BoundField HeaderText="S.No" />
                    <asp:BoundField DataField="Name"  HeaderText="Name" />
                   
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    
                    <asp:BoundField DataField="enq_date" HeaderText="Date" />
                      <asp:CheckBoxField HeaderText="IsReplied" DataField="Isreplied" ReadOnly="True" >
                                     <ControlStyle ForeColor="Green" />
                                   </asp:CheckBoxField>
                                    <asp:TemplateField HeaderText="Reply">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="lbrep" Font-Bold="true" Font-Size="10px" CommandArgument='<%#Eval("id")%>' OnClick="reply"  Text="Reply" ForeColor="DarkBlue"  runat="server"></asp:LinkButton>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Details">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="lbdls" Text="Details" Font-Bold="true" Font-Size="10px" OnClick="details" CommandArgument='<%#Eval("id") %>'   ForeColor="darkblue" runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                     </asp:TemplateField>
                                  
                                     
                               
                                   
                                 
                
           </Columns>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" />
                <EditRowStyle BackColor="#7C6F57" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            
            </asp:GridView>
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
    </center>
    
</asp:Content>

