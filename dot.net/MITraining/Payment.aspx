<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div  id="Heading">
Payment Statement

</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                       
                        <tr>
                            <td width="100%" height="30">&nbsp;</td>
                        </tr>
                        
                        <tr>
                            <td width="100%" height="22">&nbsp;</td>
                        </tr>
                        <tr id="tractive" runat="server" visible="false">
                            <td align="center" width="100%" height="22">
                               <b><asp:Label ID="lblactivemsg" runat="server"></asp:Label></b>
                               <br /><hr />
                            </td>
                        </tr>
                        <tr id="trdate" runat="server">
                            <td align="center" width="100%" height="22">
                               <b>Payment of Date&nbsp;&nbsp; <asp:Label ID="lblStartingDate" runat="server">MM/DD/YYYY</asp:Label>&nbsp;&nbsp;To&nbsp;&nbsp;<asp:Label ID="lblEndingDate" runat="server">MM/DD/YYYY</asp:Label></b>
                               <br /><hr />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%" height="22">&nbsp;</td>
                        </tr>
                        <tr id="trincom" runat="server">
                            <td  align="center" valign="top">
                                <table cellpadding="0" cellspacing="0" border="0" width="60%">
                                    <tr>
                                        <td class="pad2">
                                            Types of Income : 
                                        </td>
                                        <td class="pad2">
                                            Amount
                                        </td>
                                    </tr>
                                    <tr><td height="15">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad1">
                                            Direct Income : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_D_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                            Binary Income : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_B_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                            Single Line Income : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_SL_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Non Sponsoring Income : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_SLeg_income" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           Achievement Income : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_Achievement" runat="server" Text="None"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                           <asp:Label ID="lblLeftRight" runat="server"></asp:Label> 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lblcarrypoints" runat="server" Text="00"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr><td height="8">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad2">
                                            Total :  
                                        </td>
                                        <td class="pad1">
                                           <asp:Label ID="lbl_Total" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr><td height="8">&nbsp;</td></tr>
                                    <tr>
                                        <td class="pad1">
                                          TDS(10.3%) : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_TDS" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="pad1">
                                          Administration Charges(5%) : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_Admin_Charges" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad1">
                                          Education Charges(3%) : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_Education" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="pad1">
                                          Wellfare Charges(2%) : 
                                        </td>
                                        <td class="pad1">
                                            <asp:Label ID="lbl_wellfare_Charges" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                      <tr><td height="8">&nbsp;</td></tr>
                                      <tr>
                                        <td class="pad2">
                                            Net Payble :  
                                        </td>
                                        <td class="pad1">
                                           <asp:Label ID="lbl_net_Amount" runat="server" Text="00.00"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="trlast" runat="server">
                            <td class="pad2" align="center" width="100%" height="22">
                                <hr />
                               <b><center>Payment Details of last four weeks</center> </b>
                            </td>
                        </tr>
                        <tr id="trlastgrd" runat="server">
                            <td width="100%" align="center">
                                <asp:GridView ID="gvLastPayments" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="ActiveBorder" RowStyle-BackColor="ActiveBorder" HeaderStyle-BackColor="Chocolate" OnRowDataBound="sno">
                                    <Columns>
                                        <asp:BoundField HeaderText="Sno" />                                        
                                        <asp:BoundField HeaderText="Start Date" DataField="Week_Start_date"/>
                                        <asp:BoundField HeaderText="End Date" DataField="Week_End_date"/>
                                        <asp:BoundField HeaderText="Generate On" DataField="Payment_Generate_date"/>
                                        <asp:BoundField HeaderText="Direct" DataField="Direct_Income"/>
                                        <asp:BoundField HeaderText="Binary" DataField="Binary_Income"/>
                                        <asp:BoundField HeaderText="SingleLine" DataField="SingleLine_Income"/>
                                        <asp:BoundField HeaderText="SingleLeg" DataField="SingleLeg_Income"/>
                                        <asp:BoundField HeaderText="Achievement" DataField="Achievement_Income"/>
                                        <asp:BoundField HeaderText="Total" DataField="Total_Income"/>
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="lblMsgPayments" runat="server" Font-Bold="true" ForeColor="maroon" Font-Size="Small"></asp:Label>
                                <br /><br />
                            </td>
                        </tr>
                     </tbody>
                   </table>
                </td>
             </tr>
          </table>
     </asp:Content>
