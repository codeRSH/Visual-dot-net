<%@ page language="C#" autoeventwireup="true" inherits="forgotpwd, App_Web_-p6c43jy" masterpagefile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
&nbsp;Forgot Password
</div>
<script language="javascript" src="Script/CheckValid.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    function CheckForm()
    {
    
	    var checkemailblank;	    
	    checkemailblank = document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").value;	    
	    if(checkemailblank != "")
	    {
	       var mailvalid;
		    mailvalid  = CheckEmail(document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").value);
		    if(mailvalid)
		    {
			    return true;
		    }
		    else
		    {
			    alert("Please enter a valid email !");
			    document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").focus();
			    return false;
		    }
	    }
	    else
	    {
		    alert("Please Enter your Email Id !");
		    document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").focus();
		    return false;
	    }
    }
</script>
    <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%" >
                <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                 <tbody>
                    
                    <tr>
                        <td height="400" valign="top" align="center"  style="padding-top:60px">
                            <table cellpadding="0" cellspacing="0" width="75%" border="0" >
					            <tr>
						            <td>&nbsp;</td>
					            </tr>
					            <tr>
						            <td align="center" colspan="2" >
							            <table align="center">							    
							                <tr>
			                                    <td align="center" colspan="2">
				                                    <font color="maroon" face="verdana" size="2"><b>Enter your Email ID. Your Password 
					                                    will be send to you.</b> </font>
			                                    </td>
		                                    </tr>		                        
		                                    <tr>
			                                    <td>&nbsp;</td>
		                                    </tr>
		                                    <tr>
			                                    <td align="right" style="PADDING-RIGHT:5px; width:35%">
				                                    <FONT color="#000000" face="verdana" size="2"><b>Email :</b></FONT>
			                                    </td>
			                                    <td align="left">
				                                    <asp:TextBox ID="txtEmail" Runat="server" Width="180px" AutoCompleteType="disabled" MaxLength="49"></asp:TextBox>
			                                    </td>
		                                    </tr>
		                                    <tr>
		                                        <td>&nbsp;</td>
			                                    <td align="left">
			                                    <asp:UpdatePanel ID="updgorgetpwd" runat="server" UpdateMode="conditional">
			                                        <ContentTemplate>
			                                            <asp:Label ID="lblerrormsg" runat="server" ForeColor="red"></asp:Label>
			                                        </ContentTemplate>
			                                        <Triggers>
			                                            <asp:AsyncPostBackTrigger ControlID="imgproceed" EventName="Click" />
			                                        </Triggers>
			                                    </asp:UpdatePanel>														                            
			                                    </td>
		                                    </tr>
		                                    <tr>
			                                    <td>&nbsp;</td>
		                                    </tr>
		                                    <tr>
			                                    <td align="center" colspan="2">
				                                    <asp:ImageButton ID="imgproceed" ImageUrl="images/submit.jpg" Runat="server" OnClick="imgproceed_Click"></asp:ImageButton>
			                                    </td>
		                                    </tr>
							            </table>
							            </td>
					            </tr>
					            <tr>
						            <td>&nbsp;</td>
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
