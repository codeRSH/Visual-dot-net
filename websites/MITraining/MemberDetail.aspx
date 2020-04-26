<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberDetail.aspx.cs" Inherits="MemberDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Member Details</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script language="javascript" type="text/javascript">
        function CloseForm()
        {
            window.close();
            return false;
        }
    </script>

        &nbsp;</div>
                    <center>
                <table cellpadding="4" cellspacing="4" border="0" width="330">
                <tr>
                <td align="left" style="width:148px; height: 19px; text-align: right;">
                    <span style="color: #000099"><strong>Parent Code :</strong></span></td>
                <td align="left" style="height: 19px; width: 324px;">
                    <asp:Label ID="lblParentCode" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 19px">
                        &nbsp;
                    </td>
                </tr>
               
                <tr>
                <td align="left" style="width: 148px; text-align: right">
                    <span style="color: #000099"><strong>Registration No</strong><span style="color: #000000">:&nbsp;
                    </span></span></td>
                <td align="left" style="width: 324px; color: #000000" >
                    <asp:Label ID="lblRegistrationNumber" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
               
                <tr>
                <td align="left" class="frmFields" style="width: 148px; height: 19px; text-align: right;">
                    <span style="color: #000099"><strong>First Name :</strong></span></td>
                <td align="left" style="height: 19px; width: 324px;">
                    <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
               
                <tr>
                <td align="left" class="frmFields" style="width: 148px; text-align: right;">
                    <span style="color: #000099"><strong>Email :</strong></span></td>
                <td align="left" style="width: 324px">
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                 <tr>
                    <td colspan="2" style="height: 28px">
                        &nbsp;
                    </td>
                </tr>
               
                <tr>
                
                <td align="left" class="frmFields" style="width: 148px; height: 18px; text-align: right;">
                    <span style="color: #000099"><strong>Password :</strong></span></td>
                <td align="left" style="height: 18px; width: 324px;">
                    <asp:Label ID="lblPassword" runat="server" Text=""></asp:Label>
                </td>
                </tr>
               <!-- <tr>
                <td align="right" class="frmFields">Order Quantity:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                <td align="right" class="frmFields">Ordering Name:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblOrderingName" runat="server" Text=""></asp:Label>
                </td>
                </tr>-->
                </table>       
                        
                        </center>
        <center>
            &nbsp;</center>
        <center>
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="groupHeaderLink" BackColor="transparent" BorderStyle="None"/>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="groupHeaderLink" BackColor="transparent" BorderStyle="None" Width="80px"/>
        </center>
    </form>
</body>
</html>
