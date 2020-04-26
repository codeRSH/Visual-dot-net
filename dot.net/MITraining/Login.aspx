<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/MasterPage.master" %>
<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panel1" runat="server" DefaultButton="btnlogin">
    
                    <div id="Heading">
                           User Login </div>
                <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#efefff"  cellspacing="0" cellpadding="0" width="100%" border="0">
                 <tbody>                    
                    <tr>
                        <td height="400" valign="top" align="center"  style="padding-top:60px">
                            <table cellpadding="0" cellspacing="0" border="0" width="50%">
                                <tr>
                                    <td colspan="2" height="20">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:UpdatePanel ID="updpanellogin" UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
<asp:Label id="lblerrormsg" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label> 
</ContentTemplate>
                                            <Triggers>
<asp:AsyncPostBackTrigger ControlID="btnlogin" EventName="Click"></asp:AsyncPostBackTrigger>
</Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" height="20">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="padlogin" width="40%">Login Id :</td>
                                    <td align="left" style="padding-left:7px"><asp:TextBox ID="txtuserid" runat="server" MaxLength="16"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="padlogin">Password :</td>
                                    <td align="left" style="padding-left:7px"><asp:TextBox ID="txtpassword" runat="server" MaxLength="16" TextMode="password"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="padlogin">
                                        <div align="center">
                                            <a href="forgotpwd.aspx">Forgot Password</a>
                                           <br>
                                           <strong><a href="joinNow.aspx">Not a User? Click here</a></strong>  <br> <br>                 
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2" align="center"><asp:Button ID="btnlogin" Text="Login" runat="server" OnClick="btnlogin_Click" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2" height="30">&nbsp;</td>
                                </tr>
                            </table>                                                        
                        </td>
                    </tr>
                 </tbody>
               </table>
    </asp:Panel>
</asp:Content>

