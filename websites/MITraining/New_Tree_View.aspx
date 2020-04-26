<%@ Page Language="C#" AutoEventWireup="true" CodeFile="New_Tree_View.aspx.cs" Inherits="New_Tree_View" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<script language="javascript" type="text/javascript">
    var newwindow;
    function poptastic(regno)
    {
        //alert(regno);
	    newwindow=window.open('MemberDetail.aspx?registrationno=' + regno,'name','height=300,width=330,scrollbars=no');
	   if (window.focus) {newwindow.focus()}
    }
</script>
 <div id="Heading">Binary Format Representation</div>
    <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" style="height: 386px" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                       
                        <tr>
                          <td colspan="12" style="height: 14px">&nbsp;</td>
                          </tr>
                        <tr>
                            <td colspan="12">
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>                      
                              <tr>
                                <td>
                                  <div align="center"><span class="style1"><b><font 
                                  color="#000099"><asp:Label ID="lblRootID" runat="server"></asp:Label> </font></b></span></div>
                                  <div class="style1" align="center"></div></td></tr></tbody></table>
                              </td>
                        </tr>
                        <tr>
                          <td colspan="12"><div align="center">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td align="center">
                                  <div align="center"><span class="style1">
                                      <img height="48" alt="" src="Images/loginred.jpg" width="35" id="imgRoot" runat="server" /><br />
                                      <a href="#"><asp:Label ID="lblRootName" runat="server"></asp:Label></a></span>
                                  </div>
                                </td>
                              </tr>
                             </tbody>
                           </table>
                           </div>
                           </td>
                          </tr>
                        <tr>
                          <td style="height: 24px" colspan="14">&nbsp;&nbsp;<div align="center"><img height="10" alt="Toplevalbar" src="Images/toplev.gif" width="350"  /></div>
                              &nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                &nbsp;&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" src="Images/loginred.jpg" width="30" id="imgLevel1Left" runat="server" /></div>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#"><asp:Label ID="lbl_Lavel1_Left" runat="server"></asp:Label></a></div>
                                </td>
                              </tr>
                              </tbody>
                            </table>
                                &nbsp;&nbsp;</td>
                          <td colspan="6">&nbsp;&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" 
                                  border="0" id="imgLevel1Right" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a onclick="return rusure()" href="#"><asp:Label ID="lblLevel1_Right" runat="server"></asp:Label></a></div>
                                </td>
                              </tr>
                              </tbody>
                            </table>
                              &nbsp;&nbsp;</td>
                          </tr>
                        <tr>
                            <td colspan="6">
                                &nbsp;&nbsp;<div align="center"><img height="10" alt="Horixon" src="Images/istlevalHoriLine.gif" width="200" /></div>
                                &nbsp;</td>
                          <td colspan="6">&nbsp;<div align="center"><img height="10" alt="Horixon" 
                            src="Images/istlevalHoriLine.gif" width="200" /></div>
                              &nbsp;</td>
                         </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel2Left1" runat="server" /></div>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a 
                                  href="#"><asp:Label ID="lblLavel2_Left1" runat="server"></asp:Label></a></div>
                                </td>
                              </tr>
                              </tbody>
                            </table>
                                &nbsp;</td>
                          <td colspan="3">&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID"  
                                  src="Images/loginred.jpg" width="30" id="imgLevel2Right1" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a 
                                  href="#"><asp:Label ID="lblLevel2_Right1" runat="server"></asp:Label></a> </div></td></tr></tbody></table>
                              &nbsp;</td>
                          <td colspan="3">&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel2Left2" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" 
                          align="center"><asp:Label ID="lblLevel2_Left2" runat="server"></asp:Label></div></td></tr></tbody></table>
                              &nbsp;</td>
                          <td colspan="3">&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel2Right2" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a 
                                  href="#"><asp:Label ID="lblLevel2_Right2" runat="server"></asp:Label></a></div></td></tr></tbody></table>
                              &nbsp;</td>
                          </tr>
                        <tr>
                          <td colspan="3">
                            <div align="center"><img height="10" alt="ThirdLevelRow "
                            src="Images/thirdleval.gif" width="100" /></div></td>
                          <td colspan="3">
                            <div align="center"><img height="10" alt="ThirdLevelRow "
                            src="Images/thirdleval.gif" width="100" /></div></td>
                          <td colspan="3">
                            <div align="center"><img height="10" alt="ThirdLevelRow "
                            src="Images/thirdleval.gif" width="100" /></div></td>
                          <td colspan="3">
                            <div align="center"><img height="10" alt="ThirdLevelRow "
                            src="Images/thirdleval.gif" width="100" /></div></td></tr>
                        <tr>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Left1"  runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a 
                                  href="#"><asp:Label ID="lblLevel3_Left1" runat="server"></asp:Label></a></div></td></tr></tbody></table></td>
                          <td>&nbsp;</td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Right1" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" 
                          align="center"><asp:Label ID="lblLevel3_Right1" runat="server"></asp:Label></div></td></tr></tbody></table></td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td align="center" style="height: 40px">
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Left2" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a 
                                  href="#"><asp:Label ID="lblLevel3_Left2" runat="server"></asp:Label> 
                                  </a></div></td></tr></tbody></table></td>
                          <td>&nbsp;</td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Right2" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#">
                                    <asp:Label ID="lblLevel3_Right2" runat="server"></asp:Label></a>
                                  </div></td></tr></tbody></table></td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Left3" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#">
                                    <asp:Label ID="lblLevel3_Left3" runat="server"></asp:Label></a>
                                  </div></td></tr></tbody></table></td>
                          <td>&nbsp;</td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Right3" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#">
                                    <asp:Label ID="lblLevel3_Right3" runat="server"></asp:Label></a>
                                  </div></td></tr></tbody></table></td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Left4" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#">
                                    <asp:Label ID="lblLevel3_Left4" runat="server"></asp:Label></a>
                                  </div></td></tr></tbody></table></td>
                          <td>&nbsp;</td>
                          <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                              <tbody>
                              <tr>
                                <td>
                                  <div align="center"><img height="40" alt="ID" 
                                  src="Images/loginred.jpg" width="30" id="imgLevel3Right4" runat="server" /></div></td></tr>
                              <tr>
                                <td>
                                  <div class="style1" align="center"><a href="#"><asp:Label ID="lblLevel3_Right4" runat="server"></asp:Label></a></div></td></tr></tbody></table></td></tr>

                     </tbody>
                    </table>
                 </td>
            </tr>
    </table>
</asp:Content>