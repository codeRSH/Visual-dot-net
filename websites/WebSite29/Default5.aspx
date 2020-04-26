<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 613px; height: 326px">
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bgn.png)">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
            </td>
            <td style="width: 100px">
                <asp:Button ID="Button1" runat="server" Text="Submit" /></td>
        </tr>
    </table>
</asp:Content>

