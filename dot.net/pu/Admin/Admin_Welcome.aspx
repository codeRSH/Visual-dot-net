<%@ page language="C#" autoeventwireup="true" inherits="Admin_Admin_Welcome, App_Web_mb1_hneu" masterpagefile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="Heading">
     My Account
     </div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%">
                 <table class="celltable" border="1"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                       
                       <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" width="50%" height="22" class="fieldText">
                               <b>Total Members Joined Till Now</b>
                            </td>
                            <td  align="left" width="50%" height="22">
                              <b><asp:Label ID="lblTotalMembers" runat="server"></asp:Label></b>
                            </td>
                        </tr>
                        
                        <tr>
                            <td width="100%" height="30" colspan="2">
                            
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" width="50%" height="22" class="fieldText">
                               <b>Enquiry Pending For Reply</b>
                            </td>
                            <td  align="left" width="50%" height="22">
                             <a href="Enquiry_List.aspx"> <b><asp:Label ID="lblEnquiryPending" runat="server"></asp:Label></b></a>
                            </td>
                        </tr>
                        
                        <tr>
                            <td width="100%" height="70" colspan="2">
                            
                            </td>
                        </tr>
                     </tbody>
                  </table>&nbsp; 
                </td> 
            </tr>
        </table>
    </asp:Content>

