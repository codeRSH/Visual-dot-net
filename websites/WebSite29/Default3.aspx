<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Enquiry"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 232px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label2" runat="server" Text="Your Name" Width="91px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label3" runat="server" Text="Registration No.(If Exist)" Width="162px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label4" runat="server" Text="Phone No.(If Exist)"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label5" runat="server" Text="E-mail Id"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label6" runat="server" Text="Subject"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label7" runat="server" Text="Enquiry"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 232px; height: 21px;">
            </td>
            <td style="width: 100px; height: 21px;">
            </td>
        </tr>
    </table>
</asp:Content>

