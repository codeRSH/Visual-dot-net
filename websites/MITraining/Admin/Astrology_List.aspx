<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Astrology_List.aspx.cs" Inherits="Admin_Astrology_Details" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Heading">
    Astrology List
</div>

<table width="100%">
    <tr>
        <td>
               &nbsp;
        </td>
    </tr>
    <tr>
        <td>
               &nbsp;
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Yes" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="No" OnClick="Button2_Click" /></td>
    </tr>
    <tr>
        <td>
               &nbsp;
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="sno" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField  HeaderText="S.No" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email Id" />
                    <asp:BoundField DataField="Edate" HeaderText="Date" />
                    
                    
                    <asp:CheckBoxField HeaderText="IsReplied" DataField="Is_Replied" ReadOnly="True" >
                                     <ControlStyle ForeColor="Green" />
                                   </asp:CheckBoxField>
                                    <asp:TemplateField HeaderText="Reply">
                                    <ItemTemplate>
                                    <asp:LinkButton ID="lbrep" Font-Bold="true" Font-Size="10px"  Text="Reply" CommandArgument='<%#Eval("id")%>' OnClick="reply" ForeColor="DarkBlue"  runat="server"></asp:LinkButton>
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
            <br />
            <br />
            <br />
            <br />
            
        </td>
    </tr>
    

</table>

</asp:Content>

