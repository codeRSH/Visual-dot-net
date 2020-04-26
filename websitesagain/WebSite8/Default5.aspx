<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 613px; height: 326px">
        <tr>
            <td colspan="2" style="background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Enquiry" ForeColor="White"></asp:Label></td>
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
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="Dynamic" 
                    ErrorMessage="Name Should be mentioned"></asp:RequiredFieldValidator>
            </td>
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
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" 
                    ErrorMessage="Email ID not given"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox4" Display="Dynamic" 
                    ErrorMessage="Full and correct email id Should be mentioned" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label6" runat="server" Text="Subject"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox5" Display="Dynamic" 
                    ErrorMessage="Subject not mentioned"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label7" runat="server" Text="Enquiry"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox6" Display="Dynamic" 
                    ErrorMessage="Enquiry field is empty"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 232px">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
            </td>
            <td style="width: 100px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/bluebttn.gif"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
</asp:Content>

