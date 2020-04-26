<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
    Confirmation
</div>
    <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%" >
                <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                 <tbody>
                    
                    <tr>
                        <td height="480" align="center">  
                            <table>
                                <tr>
                                    <td height="70">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" height="25">
                                        <asp:Label ID="lblmsg" runat="server" ForeColor="#000066" Font-Size="Small"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="385">
                                        &nbsp;
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