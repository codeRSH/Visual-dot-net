<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Mail.aspx.cs" Inherits="Admin_Admin_Mail" MasterPageFile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script language="javascript" type="text/javascript">
        function checkForm()
        {
            var strTO;
            var strSubj;
            var strMessage;
            strTO=document.getElementById("ctl00_ContentPlaceHolder1_txtTo").value;
            strSubj=document.getElementById("ctl00_ContentPlaceHolder1_txtSubject").value;
            strMessage=document.getElementById("ctl00_ContentPlaceHolder1_TxtMessage").value;
            if(strTO=="")
            {
                alert("To Box should not be blank !");
                document.getElementById("ctl00_ContentPlaceHolder1_txtTo").focus();
                return false;
            }
            else if(strSubj=="")
            {
                alert("Subject Box should not be blank !");
                document.getElementById("ctl00_ContentPlaceHolder1_txtSubject").focus();
                return false;
            }
             else if(strMessage=="")
            {
                alert("Message Box should not be blank !");
                document.getElementById("ctl00_ContentPlaceHolder1_TxtMessage").focus();
                return false;
            }
            return true;
        }
     </script>
     <div id="Heading" >
          Send Mail
     </div> 
<div style="position:relative;float:left;width:100%;text-align:center">
                <br />
                <table   cellspacing="0" cellpadding="0"   style="border: navy 2px double;width: 80%;margin-left:auto;margin-right:auto">
                  <tr><td>&nbsp;</td></tr>
                  <tr>
                    <td>
                            <table style="margin-left:auto;margin-right:auto" border="0" cellpadding="0" cellspacing="0" width="85%">
                                <tr>
                                   <td align="right" valign="top" height="25px">
                                       To :&nbsp;
                                  </td>
                                  <td align="left" valign="top" height="25px">
                                     <asp:TextBox ID="txtTo" runat="server" Columns="24" Width="180px" ></asp:TextBox>
                                  </td>
                               </tr>
                               <tr>
                                  <td align="right" valign="top" height="25px">
                                      Subject :&nbsp;
                                  </td>
                                  <td align="left" valign="top" height="25px">
                                     <asp:TextBox ID="txtSubject" runat="server" Columns="24" Width="180px" ></asp:TextBox>
                                  </td>
                               </tr>
                               <tr>
                                <td align="right" valign="top">
                                   Message :&nbsp;
                                </td>
                                <td  align="left">
                                  <asp:TextBox ID="txtMessage" TextMode="MultiLine" Rows="10"  runat="server" Width="350px" Height="179px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                 <td colspan="2" align="right">
                                 <br />
                                   <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click1"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                  </tr>
                  <tr><td>&nbsp;</td></tr>
               </table><br />
 </div>

  
    </asp:Content>
