<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="background-image: url(Images/aa1.jpg);
            width: 240px; height: 7px">
            <tr>
                <td rowspan="2" style="width: 16px; height: 195px" valign="top">
                    ,<table>
                        <tr>
                            <td colspan="2" style="height: 19px">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Member Login"></asp:Label></td>
                        </tr>
                        <tr style="font-size: 12pt">
                            <td style="width: 100px">
                                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="User Name" Width="80px"></asp:Label></td>
                            <td style="width: 85px">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Password"></asp:Label></td>
                            <td style="width: 85px">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 100px; height: 56px">
                            </td>
                            <td style="width: 85px; height: 56px">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="Button1" runat="server"
                                    Text="Submit" /></td>
                        </tr>
                        <tr>
                            <td style="width: 100px; height: 28px">
                            </td>
                            <td style="width: 85px; height: 28px">
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" Width="147px">Forgot Password</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
        &nbsp;
        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/astro.gif" Width="262px" /></div>
    </form>
</body>
</html>
