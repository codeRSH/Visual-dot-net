<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Your Profile
</div>
<script language="javascript" src="Script/MI_MGV_CheckValid.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    function validForm()
    {
        
        var MI_MGV_nationality;
        MI_MGV_nationality=document.getElementById("ctl00_ContentPlaceHolder1_txtnationality").value ;        
        if (MI_MGV_nationality=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Nationality should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtnationality").focus();
           return false;
        }
                
        var MI_MGV_address;
        MI_MGV_address=document.getElementById("ctl00_ContentPlaceHolder1_txtaddress").value ;        
        if (MI_MGV_address=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Address should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtaddress").focus();
           return false;
        }
        var MI_MGV_town;        
        MI_MGV_town=document.getElementById("ctl00_ContentPlaceHolder1_txttown").value ;               
        if (MI_MGV_town=="")
        {     
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* City should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txttown").focus();
           return false;
        }
        var MI_MGV_state;
        MI_MGV_state=document.getElementById("ctl00_ContentPlaceHolder1_txtstate").value ;        
        if (MI_MGV_state=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* State should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtstate").focus();
           return false;
        }
        var MI_MGV_email;
        MI_MGV_email=document.getElementById("ctl00_ContentPlaceHolder1_txtemail").value ;        
        if (MI_MGV_email=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Email ID should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtemail").focus();
          return false;
        }
        else
        {
             var MI_MGV_email;
             MI_MGV_email=CheckEmail(document.getElementById("ctl00_ContentPlaceHolder1_txtemail").value);
             if (!MI_MGV_email)
             {
                  document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Enter a valid Email ID!";
                  window.location.href="#top";
                  document.getElementById("ctl00_ContentPlaceHolder1_txtemail").focus();
                  return false;
             }
        }
        var MI_MGV_nominee;
        MI_MGV_nominee=document.getElementById("ctl00_ContentPlaceHolder1_txtnominee").value ;        
        if (MI_MGV_nominee=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Nominee Name should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtnominee").focus();
          return false;
        }
        var MI_MGV_nominee_rel;
        MI_MGV_nominee_rel=document.getElementById("ctl00_ContentPlaceHolder1_txtrelation").value ;        
        if (MI_MGV_nominee_rel=="")
        {
          document.getElementById("ctl00_ContentPlaceHolder1_lblerror").innerHTML = "* Nominee Relation should not be blank!";
          window.location.href="#top";
          document.getElementById("ctl00_ContentPlaceHolder1_txtrelation").focus();
          return false;
        }
        
        return true;
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
    <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%">
        <tr>
             <td width="100%" >
                <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                 <tbody>
                    <tr>
                        <td class="cellhead" width="20%" height="22" align="left"><a name="top"></a>
                           Your Profile
                        </td>
                        <td width="64%" class="cellhead" align="center"><asp:Label ID="lblerror" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="red"></asp:Label></td>
                        <td class="cellhead" align="right" width="16%"><asp:Button ID="btnedit1" runat="server" Text="Edit" OnClick="Edit_Profile" /></td>
                    </tr>
                    <tr>
                        <td valign="top" align="center" width="100%" colspan="3">
                            <table cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td colspan="5">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad" style="width: 30%">Registration No. : </td>
                                    <td class="lbltext" style="width: 22%"><asp:Label ID="lblregno" runat="server"></asp:Label></td>
                                    <td style="width: 1%">&nbsp;</td>
                                    <td align="right" class="pad" style="width: 22%">Parent ID : </td>
                                    <td class="lbltext" style="width: 25%"><asp:Label ID="lblparentid" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Node Position :</td>
                                    <td class="lbltext"><asp:Label ID="lblnode" runat="server"></asp:Label></td>
                                    <td>&nbsp;</td>
                                    <td align="right" class="pad">Referrer ID : </td>
                                    <td class="lbltext"><asp:Label ID="lblreferreid" runat="server"></asp:Label></td>
                                    
                                    
                                </tr>
                                <tr>
                                    <td colspan="5">&nbsp; </td>
                                </tr>
                                
                            </table>
                            <table cellpadding="0" cellspacing="0" align="center" width="100%">
                                <tr>
                                    <td colspan="2" class="cellhead" align="left">Personel Details</td>
                                    <td class="cellhead" align="right"><asp:Button ID="btnedit2" runat="server" Text="Edit" OnClick="Edit_Profile" /></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad" width="50%">Your Name  : </td>
                                    <td>&nbsp;</td>
                                    <td class="lblheadtext" width="49%"><asp:Label ID="lblname" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Father/Husband's Name : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext"><asp:Label ID="lblfhname" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Date of Birth : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lbldob" runat="server"></asp:Label>                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Marital Status : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblmarital" runat="server"></asp:Label>
                                        <asp:DropDownList ID="ddlmarital" runat="server" Visible="false">
                                            <asp:ListItem Value="0" Selected="True">Married</asp:ListItem>
                                            <asp:ListItem Value="1">Un-Married</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Nationality : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblnationality" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtnationality" runat="server" Visible="false"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Address : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lbladdress" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtaddress" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Town/City/District : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lbltown" runat="server"></asp:Label>
                                        <asp:TextBox ID="txttown" runat="server" Visible="false"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">State : </td>
                                     <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblstate" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtstate" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Country : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblcountry" runat="server"></asp:Label>
                                        <asp:DropDownList ID="ddlcountry" runat="server" Visible="false"></asp:DropDownList>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Pin Code : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblpin" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtpin" runat="server" Visible="false" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Phone No. : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblphone" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtphone" runat="server" Visible="false" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Mobile No. : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblmobile" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtmobile" runat="server" Visible="false" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" class="pad">Email : </td>
                                    <td>&nbsp;</td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtemail" runat="server" Visible="false"></asp:TextBox>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" align="center" width="100%">
                                <tr>
                                    <td colspan="2" class="cellhead" align="left">Nomination Details</td>
                                    <td class="cellhead" align="right"><asp:Button ID="btnedit3" runat="server" Text="Edit" OnClick="Edit_Profile" /></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad" style="width: 302px">Nominee Name : </td>
                                    <td style="width: 7px"></td>
                                    <td class="lbltext" width="49%">
                                        <asp:Label ID="lblnominee" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtnominee" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pad" style="width: 302px">Relation with Nominee :123 </td>
                                    <td style="width: 7px"></td>
                                    <td class="lbltext">
                                        <asp:Label ID="lblrelation" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtrelation" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center"><asp:Button ID="btnsave" runat="server" Text="Save" Visible="false" OnClick="btnsave_Click" /></td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp; </td>
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