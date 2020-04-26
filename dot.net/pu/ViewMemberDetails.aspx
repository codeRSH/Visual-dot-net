<%@ page language="C#" autoeventwireup="true" inherits="ViewMemberDetails, App_Web_-p6c43jy" masterpagefile="~/MasterPage.master" %>
<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript" type="text/javascript">
        function CloseForm()
        {
            window.close();
            return false;
        }
    </script>

    <table cellpadding="0" cellspacing="0" border="0" style="border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;height:100%;"> 
        <tr>
         <td valign="top" >
         <table cellpadding="0" cellspacing="0" border="0" width="80%"> 
         <tr>
             <td style="background-image:url('images/Bar.jpg');height:20px;"> 
                <table cellpadding="0" cellspacing="0" border="0" class="groupHeaderLink">
                <tr>
                    <td width="100px" align="center" id="tdedit" runat="server">
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="groupHeaderLink" BackColor="transparent" BorderStyle="None" Width="80px"/>
                    </td>
                     <td id="tdeditbar" runat="server">|</td>
                    <td width="120px" align="center">
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="groupHeaderLink" BackColor="transparent" BorderStyle="None"/>
                    </td>
                </tr>
                </table>
             </td>
         </tr>
         <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="800px">
                <tr>
                <td align="right" class="frmFields">Parent Code:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblParentCode" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                <td align="right" class="frmFields">Registration Number:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblRegistrationNumber" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                <td align="right" class="frmFields">First Name:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                <td align="right" class="frmFields">Email:</td>
                <td class="frmFieldsValue">
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </td>
                </tr>
                <tr>
                <td align="right" class="frmFields">Password:</td>
                <td class="frmFieldsValue">
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
            </td>             
         </tr>
         </table> 
         </td>
        </tr>
        </table>
         </asp:Content>
