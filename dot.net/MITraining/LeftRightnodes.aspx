<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeftRightnodes.aspx.cs" Inherits="LeftRightnodes" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%" >
                <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                 <tbody>
                    <tr>
                        <td class="cellhead" width="100%" height="22" align="left">
                            &nbsp;Total Members
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="500" valign="top">
                            <table cellpadding="0" cellspacing="0" border="0" width="30%">
                                <tr>
                                    <td colspan="2" height="40"> &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="pad2">
                                        Total Members : 
                                    </td>
                                    <td class="pad2">
                                        <asp:Label ID="lbltotalMembers" runat="server" Text="None"></asp:Label>
                                    </td>
                                </tr>
                                <tr><td height="15">&nbsp;</td></tr>
                                <tr>
                                    <td class="pad1">
                                        Left Members : 
                                    </td>
                                    <td class="pad1">
                                        <asp:Label ID="lblleftmember" runat="server" Text="None"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pad1">
                                        Right Members : 
                                    </td>
                                    <td class="pad1">
                                        <asp:Label ID="lblrightmember" runat="server" Text="None"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                 </tbody>
               </table>
            </td>
         </tr>
      </table>
</asp:Content>