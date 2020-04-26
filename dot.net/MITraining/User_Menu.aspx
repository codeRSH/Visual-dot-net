<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Menu.aspx.cs" Inherits="User_Menu" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                    <div id="Heading">User's Menu</div>
                    <div>
                    <table cellspacing="0" cellpadding="4" width="100%" border="0">
                                     <tr>
                                        <td colspan="2" height="50"></td>                                        
                                     </tr>
                                     <tr>
                                        <td  align="center" width="50%" height="22">
                                           <asp:Button ID="btnWelcomeLetter" runat="server" Text="Welcome Letter"  CssClass="cellheadHeader" Width="190" OnClick="btnWelcomeLetter_Click"/>
                                        </td>
                                        <td  align="center" width="50%" height="22">
                                           <asp:Button ID="btnBinaryDisplay" runat="server"  Text="Binary Display" CssClass="cellheadHeader" Width="190" OnClick="btnBinaryDisplay_Click"/>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td  align="center">
                                           <asp:Button ID="btnChangePwd" runat="server" Text="Change Password"  CssClass="cellheadHeader" Width="190" OnClick="btnChangePwd_Click"/>  
                                        </td>
                                        <td  align="center">
                                           <asp:Button ID="btnSpill" runat="server"  Text="Spill Details"  CssClass="cellheadHeader" Width="190"/>  
                                        </td>
                                    </tr>
                                     
                                     <tr>
                                        <td  align="center">
                                          <asp:Button ID="btnViewProfile" runat="server" Text="View/Modify Profile"  CssClass="cellheadHeader" Width="190" OnClick="btnViewProfile_Click"/>  
                                        </td>
                                        <td  align="center">
                                          <asp:Button ID="btnNode" runat="server"  Text="Left/Right Nodes Count"  CssClass="cellheadHeader" Width="190" OnClick="btnNode_Click"/>   
                                        </td>
                                    </tr>
                                     
                                     <tr>
                                        <td  align="center">
                                          <asp:Button ID="btnDSummary" runat="server"  Text="DownLine Summary Details"  CssClass="cellheadHeader" Width="190"/>    
                                        </td>
                                        <td  align="center">
                                         <asp:Button ID="btnStatement" runat="server"  Text="Statements"  CssClass="cellheadHeader" Width="190"/>    
                                        </td>
                                    </tr>
                                    
                                  
                                     <tr>
                                        <td  align="center">
                                        <asp:Button ID="btnSales" runat="server" Text="Fresh Sales"  CssClass="cellheadHeader" Width="190"/>     
                                        </td>
                                        <td  align="center">
                                        <asp:Button ID="btnPayment" runat="server" Text="Payment"  CssClass="cellheadHeader" Width="190" OnClick="btnPayment_Click"/>       
                                        </td>
                                    </tr>
                                      
                                     <tr>
                                        <td  align="center">
                                        <asp:Button ID="btnRecepit" runat="server" Text="Recepit/Invoices"  CssClass="cellheadHeader" Width="190"/>       
                                        </td>
                                        <td  align="center">
                                        <asp:Button ID="btnlogout" runat="server" Text="Logout"  CssClass="cellheadHeader" Width="190" OnClick="btnlogout_Click"/>       
                                        </td>
                                    </tr>                                      
                                     <tr>
                                        <td colspan="2" height="230"></td>                                        
                                    </tr>
                                </table>
                    </div>
    </asp:Content>