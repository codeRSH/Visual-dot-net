<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Menu.aspx.cs" Inherits="Admin_Admin_Menu" MasterPageFile="~/Admin/AdminMasterPage.master"  %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%">
                  
                  
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                        <tr>
                            <td class="cellhead" align="left" width="100%" height="22" colspan="2">
                                <b><span class="heading">Admin's Menu</span></b>
                            </td>
                        </tr>
                       <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                        <tr>
                            <td  align="center" width="50%" height="22">
                               <asp:Button ID="btnEnquiry" runat="server" Text="Enquiry"  CssClass="cellheadHeader" Width="190" OnClick="btnEnquiry_Click"/>
                            </td>
                            <td  align="center" width="50%" height="22">
                               <asp:Button ID="btnRegMember" runat="server"  Text="Registered Member" CssClass="cellheadHeader" Width="190" OnClick="btnRegMember_Click"/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td  align="center" width="50%" height="22">
                               <asp:Button ID="btnChangePwd" runat="server" Text="Change Password"  CssClass="cellheadHeader" Width="190" OnClick="btnChangePwd_Click"/>  
                            </td>
                            <td  align="center" width="50%" height="22">
                               <asp:Button ID="btnMail" runat="server"  Text="Mail Management"  CssClass="cellheadHeader" Width="190" OnClick="btnMail_Click"/>  
                            </td>
                        </tr>
                        
                         <tr>
                            <td  align="center" width="50%" height="22">
                              <asp:Button ID="btnProducts" runat="server" Text="Products Add/View/Edit"  CssClass="cellheadHeader" Width="190" OnClick="btnProducts_Click"/>  
                            </td>
                            <td  align="center" width="50%" height="22">
                              <asp:Button ID="btnSetPersentage" runat="server" Text="Set Rates(in %)"  CssClass="cellheadHeader" Width="190" OnClick="btnSetPersentage_Click"/>  
                              
                            </td>
                        </tr>
                         <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                           <tr>
                            <td  align="center" width="50%" height="22" colspan="2">
                             
                            <asp:Button ID="btnLogout" runat="server"  Text="Logout"  CssClass="cellheadHeader" Width="190" OnClick="btnLogout_Click"/>   
                              
                            </td>
                        </tr>
                         
                          
                          <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                     </tbody>
                  </table>&nbsp; 
                </td> 
            </tr>
        </table>
    </asp:Content>
