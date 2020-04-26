<%@ page language="C#" autoeventwireup="true" inherits="Admin_Admin_Change_Password, App_Web_mb1_hneu" masterpagefile="~/Admin/AdminMasterPage.master" title="Micro Infoware::ChangePassword" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    
    <div id="Heading">Change Password</div>
     <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" >
            <tr>
                 <td width="100%">
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                        
                       <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%" height="22" class="fieldText">
                              Old Password
                            </td>
                            <td  align="left" width="50%" height="22">
                               <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" Width="50%"></asp:TextBox>
                              
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" width="50%" class="fieldText" style="height: 22px">
                               New Password
                            </td>
                            <td  align="left" width="50%" style="height: 22px">
                               <asp:TextBox ID="txtNewPassword" TextMode="Password" MaxLength="20" runat="server" Width="50%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" valign="top" width="50%" height="22" class="fieldText">
                               Conform New Password
                            </td>
                            <td  align="left" width="50%" height="22">
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
                  </table>&nbsp; 
                </td> 
            </tr>
        </table>
    </asp:Content>