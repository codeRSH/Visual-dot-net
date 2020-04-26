<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelcomeLetter.aspx.cs" Inherits="WelcomeLetter" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">Welcome Letter</div>

                             <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tr>
                                     <td style="width:100%; height: 25px;">
                                         &nbsp;
                                     </td>               
                               </tr>
                                <tr>
                                     <td class="pad4" style="width:100%; height: 19px;">
                                          WELCOME
                                     </td>               
                               </tr>
                               <tr>
                                     <td align="center" style="width:100%; height: 19px;">
                                         <asp:Label ID="lb1name" runat="server" ForeColor="Maroon" Font-Bold="true" Font-Size="Small"></asp:Label>
                                     </td>               
                               </tr>
                               <tr>
                                     <td class="pad4" align="center" style="width:100%; height: 19px;">                                        
                                            TO <br />
                                         !! Micro Infoware !!                                       
                                     </td>               
                               </tr>
                               <tr>
                                    <td class="pad1" style="height: 20px">Your Reg.No is :  <asp:Label ID="lblRegno" runat="server" ForeColor="Maroon" Font-Bold="true" Font-Size="Smaller"></asp:Label></td>
                               </tr>
                               <tr>
                                    <td class="paratext">         
                                        You will find that your decision to join  Micro Infoware has                                
                                        been your best step towards happy and prosperous life. Lacs of families are already 
                                        enjoying economic freedom and a better life style.                                 
                                        This business not only provides you an opportunity to earn but also a golden chance 
                                        to develop value based business. Moreover this business gives you a chance to develop 
                                        your personality.                 
                                    </td>              
                              </tr>
                             
                           </table>

 </asp:Content>

