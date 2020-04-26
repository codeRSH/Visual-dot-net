<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin_admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 100%;
            
            font-family:Courier New;
            font-weight:bold;
            text-align:right;
            color:#0066CC;
           
        }
        .style2
        {
            width: 35%;
            height: 20%;
            border: 5px solid #0066CC ;
            background-color: #FFFFCC;
            
        }
    </style>
</head>
<body style="background-color:Transparent">
    <form id="form1" runat="server">
    <div style="background-color: #0066CC; width: 100%; height: 36px; color: #FFFFFF; font-weight: 700; font-family: 'Courier New'; font-size: x-large;">
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        Administrator Login</div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <table align="center" cellpadding="8" cellspacing="0" class="style2" 
        style="border-style: double; height:5%">
        <tr>
            <td>
                <br />
    <table align="center" cellpadding="0" cellspacing="5" class="style1">
        <tr>
            <td>
                &nbsp;
                Login ID:</td>
            <td align="left">
                <asp:TextBox ID="TextBox1" runat="server" Width="160px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:</td>
            <td align="left">
                <asp:TextBox ID="TextBox2" runat="server" Width="160px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;</td>
            <td align="left"> 
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/images/bluebttn.gif" />
            </td>
        </tr>
    </table>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
    
    
    </form>
    </body>
</html>
