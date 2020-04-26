<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Admin_Payment" MasterPageFile="~/Admin/adminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                        <tr>
                            <td class="cellhead" width="100%" height="22" align="left">
                               Payment Details
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" height="20" style="text-align:right"><a href="javascript:history.back()">Back</a>&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="100%" align="center"> <asp:Label ID="lblempname" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="maroon"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="100%" height="20">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="100%" align="center"><b>Payment Generated On</b> &nbsp;&nbsp; <asp:Label ID="lblgeneratedate" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="maroon"></asp:Label></td>
                        </tr>
                        <tr>
                            <td width="100%" height="20">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="100%" style="font-size:small" height="22">
                               <b> Payment of Date&nbsp;&nbsp; <asp:Label ID="lblStartingDate" runat="server">MM/DD/YYYY</asp:Label>&nbsp;&nbsp;To&nbsp;&nbsp;<asp:Label Font-Size="Small" ID="lblEndingDate" runat="server">MM/DD/YYYY</asp:Label></b>
                               <br /><hr />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" height="22">&nbsp;</td>
                        </tr>
                        <tr>
                            <td  align="center" height="500" valign="top">
                                <table cellpadding="0" cellspacing="0" border="0" width="70%">
                                    <tr>
                                        <td class="pad2" width="60%">
                                            Types of Income : 
                                        </td>
                                        <td class="pad2" style="width: 205px">
                                            Amount
                                        </td> 
                                        
                                    </tr>
                                    <tr><td height="15">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad1">
                                            Direct Income : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_D_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                            Binary Income : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_B_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                            Single Line Income : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_SL_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Non Sponsorship Income : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_SLeg_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr><td height="8">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad2">
                                            Total :  
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                           <asp:Label ID="lbl_Total" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr><td height="8">&nbsp;</td></tr>
                                     <tr>
                                        <td class="pad2">
                                            Deductions :  
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           TDS(10.3%) : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_TDS" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Administration Charges(5%) : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_Admin" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Education Charges(3%) : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_Edu" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Wellfare Charges(2%) : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lbl_Well" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>                                    
                                    <tr><td height="8">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad2">
                                            Net Payment :  
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                           <asp:Label ID="lbl_Net" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr><td height="8">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad1">
                                          Paid Status : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lblpaidstatus" runat="server" ForeColor="red"></asp:Label>
                                            <!--<a id="lnkpaynow" href="Pay_Payment.aspx" runat="server" visible="false">Pay Now</a>-->
                                            <asp:LinkButton ID="lnkbtnpaynow" runat="server" Text="Pay Now" OnClick="Pay_Now" Visible="false"></asp:LinkButton>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="pad1">
                                          Payment Mode : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lblpaymode" runat="server" Text="None"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                          Cheque No. : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lblchequeno" runat="server" Text="None"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="pad1">
                                          Cheque Name : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lblchequename" runat="server" Text="None"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                          Payment Date : 
                                        </td>
                                        <td class="pad1" style="width: 205px">
                                            <asp:Label ID="lblPayDate" runat="server" Text="None"></asp:Label>
                                        </td>
                                    </tr>
                                      <tr><td style="height: 8px">&nbsp;</td></tr>      
                                                                      
                                </table>
                               
                            </td>
                           
                        </tr>
                     </tbody>
                   </table>
                </td>
             </tr>
          </table>
     </asp:Content>


