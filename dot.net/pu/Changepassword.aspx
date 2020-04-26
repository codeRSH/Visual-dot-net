<%@ page language="C#" autoeventwireup="true" inherits="Changepassword, App_Web_-p6c43jy" masterpagefile="~/MasterPage.master" title="Micro Infoware::ChangePassword" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">Change Password</div>
<script language="javascript" type="text/javascript">
        function CheckValidation()
        { 
            
            var strPassword;
            var strNewPassword;
            var strConformPassword;
            strPassword=document.getElementById("ctl00_ContentPlaceHolder1_txtPassword").value;
            strNewPassword=document.getElementById("ctl00_ContentPlaceHolder1_txtNewPassword").value;
            strConformPassword=document.getElementById("ctl00_ContentPlaceHolder1_TxtConfNewPassword").value;
           
            if(strPassword=="")
            {
                alert("Old Password should not be blank");
                return false;
            }
            else  if(strNewPassword=="")
            {
                alert("New Password should not be blank");
                return false;
            }
            else  if(strConformPassword=="")
            {
                alert("Conform Password should not be blank");
                return false;
            }
             else  if(strConformPassword != strNewPassword)
            {
                alert("Conform Password miss match");
                return false;
            }
            return true;
        }
    </script>
        <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%">
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tbody>
                           
                           <tr>
                                <td   width="100%" height="30" colspan="2">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" height="22" class="pad">
                                  Old Password :
                                </td>
                                <td  align="left" width="50%" height="22" class="textbox">
                                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" Width="50%"></asp:TextBox>
                                  
                                </td>
                            </tr>
                            <tr>
                                <td  align="right" width="50%" height="22" class="pad">
                                   New Password :
                                </td>
                                <td  align="left" width="50%" height="22" class="textbox">
                                   <asp:TextBox ID="txtNewPassword" TextMode="Password" MaxLength="20" runat="server" Width="50%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  align="right" valign="top" width="50%" height="22" class="pad">
                                   Confirm New Password :
                                </td>
                                <td  align="left" width="50%" height="22" class="textbox">
                                   <asp:TextBox ID="TxtConfNewPassword" TextMode="Password" MaxLength="20" Width="50%" runat="server"></asp:TextBox>
                                   
                                </td>
                            </tr>
                            
                             <tr>
                                <td  align="left" width="50%" height="22">
                                  
                                </td>
                                <td  align="left" width="50%" height="22">
                                  <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
                                </td>
                            </tr>
                             
                             
                              
                              <tr>
                                <td   width="100%" height="30" colspan="2">
                                    
                                </td>
                            </tr>
                         </tbody>
                      </table>
                </td>
             </tr>
          </table>          
</asp:Content>
