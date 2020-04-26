<%@ page language="C#" autoeventwireup="true" inherits="Enquiry, App_Web_-p6c43jy" masterpagefile="~/MasterPage.master" title="Micro Infoware::Contact us" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript" src="Script/CheckValid.js"></script>
    <script language="javascript" type="text/javascript">
        function ValidateEnquiryForm()
        {
            var error;
            error=false;
            var message;
            message="";
            
            var MI_MGV_Name;
            MI_MGV_Name = document.getElementById("ctl00_ContentPlaceHolder1_txtname").value;
            if (MI_MGV_Name=="")
            {
               message=" * Enter Your Name";
               error= true;
            }
            else
            {
               
            }
           /*
            var MI_MGV_Reg_No;
            MI_MGV_Reg_No = document.getElementById("ctl00_ContentPlaceHolder1_txtregno").value;
            if (MI_MGV_Reg_No=="")
            {
               message= message + "<br> * Enter Correct Reg. No.";
               error= true;
            }
            else
            {
               
            }*/
            
            var MI_MGV_Phone_No;
            MI_MGV_Phone_No = document.getElementById("ctl00_ContentPlaceHolder1_txtphone").value;
            if (MI_MGV_Phone_No=="")
            {
               message=message + "<br> * Enter Correct Phone No.";
               error= true;
            }
            else
            {
               
            }
            
            var MI_MGV_Email;
            MI_MGV_Email = document.getElementById("ctl00_ContentPlaceHolder1_txtemail").value;
            if (MI_MGV_Email=="")
            {
               message= message +"<br> * Enter Your Email ID.";
               error= true;
            }
            else
            {
                var MI_MGV_VEmail;
                 MI_MGV_VEmail=CheckEmail(document.getElementById("ctl00_ContentPlaceHolder1_txtemail").value);
                 if (!MI_MGV_VEmail)
                 {
                    message=message + "<br> * Enter a valid Email Id";
                    error= true;
                 }
                 else
                 {
               
                 }  
            }
            
            var MI_MGV_Subject;
            MI_MGV_Subject = document.getElementById("ctl00_ContentPlaceHolder1_txtsubject").value;
            if (MI_MGV_Subject=="")
            {
               message=message + "<br> * Subject should not be blank.";
               error= true;
            }
            else
            {
               
            }
            
            var MI_MGV_Enquiry;
            MI_MGV_Enquiry = document.getElementById("ctl00_ContentPlaceHolder1_txtenquiry").value;
            if (MI_MGV_Enquiry=="")
            {
               message= message + "<br> * Enquiry should not be blank.";
               error= true;
            }
            else
            {
               
            }
            
            if(error)
            {
                document.getElementById("ctl00_ContentPlaceHolder1_lblMessages").innerHTML=message;                
                return false;
            }
            else
            {
                return true;
            }            
        }
        
        function isNumberKey(evt)
          {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

             return true;
          }

        function isAlphabetKey(evt)
          {               
             var charCode = (evt.which) ? evt.which : event.keyCode
             if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode==32)
                return true;
                
             return false;
          }
          
    </script>
    <div id="Heading">Enquiry</div>
        <a name="top"></a><font color="red"> <asp:Label ID="lblMessages" runat="server"></asp:Label></font>
        <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                        <tr>
                            <td width="100%" valign="top" align="center">
                                <table cellpadding="0" cellspacing="0" border="0" width="80%">
                                    <tr>
                                        <td class="vld" colspan="2" height="30" align="right" valign="bottom">Field Marked * are mandatory</td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle">Your Name<asp:Label ID="lblcompul" runat="server" ForeColor="red">*</asp:Label> :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtname" CssClass="tbox" runat="server" Width="150" MaxLength="49" onkeypress="return isAlphabetKey(event)"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle">Registration No.(If Exist) :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtregno" CssClass="tbox" runat="server" Width="150" MaxLength="12"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle">Phone No.(If Exist) :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtphone" CssClass="tbox" runat="server" Width="150" MaxLength="12" onkeypress="return isNumberKey(event)"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle">Email ID<asp:Label ID="Label1" runat="server" ForeColor="red">*</asp:Label> :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtemail" CssClass="tbox" runat="server" Width="150" MaxLength="49"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle">Subject<asp:Label ID="Label2" runat="server" ForeColor="red">*</asp:Label> :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtsubject" CssClass="tbox" runat="server" Width="150" MaxLength="49"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td class="headerstyle" valign="top">Enquiry<asp:Label ID="Label3" runat="server" ForeColor="red">*</asp:Label> :</td>
                                        <td align="left" class="txtcontent" style="padding-left:7px"><asp:TextBox ID="txtenquiry" CssClass="tbox" runat="server" Width="250" Rows="10" TextMode="multiLine" MaxLength="400"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"> &nbsp;</td>                                        
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2"> <asp:Button ID="btn" runat="server" Text="Submit" OnClick="btnsubmit_Click" /></td>                                        
                                    </tr>
                                    <tr>
                                        <td colspan="0" height="15">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                     </tbody>
                   </table>
                </td>
             </tr>
          </table>
     </asp:Content>