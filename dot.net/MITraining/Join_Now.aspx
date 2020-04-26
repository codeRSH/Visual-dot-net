<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Join_Now.aspx.cs" Inherits="Join_Now" MasterPageFile="~/MasterPage.master" Title="PRmarketing::Join Now" %>


<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="ttip" id="dhtmltooltip"></div>
<script language="JavaScript1.2" src="Script/tooltip_new.js" type="text/javascript"></script>
<script language="JavaScript1.2" src="Script/searchhover.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="Script/MI_MGV_CheckValid.js"></script>
<script language="javascript" type="text/javascript">
 
function ValidateJoinNowForm()
{
    var error;
    error=false;
    var message;
    message="";
    var MI_MGV_parentID;
    MI_MGV_parentID=document.getElementById("ctl00_ContentPlaceHolder1_txtParentId").value ;
    
    if (MI_MGV_parentID=="")
    {
       message=" * Enter Parent ID";
       error= true;
    }
    else
    {
       
    }
     var MI_MGV_ReferranceId;
     MI_MGV_ReferranceId=document.getElementById("ctl00_ContentPlaceHolder1_txtreferrerId").value ;
     if (MI_MGV_ReferranceId=="")
     {
        message=message + "<br> * Enter Referrance ID";
        error= true;
     }
     else
     {
   
     }
        
     var MI_MGV_Title;
     MI_MGV_Title=(document.getElementById("ctl00_ContentPlaceHolder1_ddlTitle").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlTitle").selectedIndex).text);
     if (MI_MGV_Title=="[Select]")
     {
        message=message + "<br> * Select Title";
        error= true;
     }
    
     
     var MI_MGV_Name;
     MI_MGV_Name=document.getElementById("ctl00_ContentPlaceHolder1_txtName").value;
     if (MI_MGV_Name=="")
     {
        message=message + "<br> * Name Should not be Empty";
        error= true;
     }
     else
     {
   
     }
      var MI_MGV_FHName;
     MI_MGV_FHName=document.getElementById("ctl00_ContentPlaceHolder1_txtFHName").value;
     if (MI_MGV_FHName=="")
     {
        message=message + "<br> * Father/Husband Name Should not be Empty";
        error= true;
     }
     else
     {
   
     }/*
     var MI_MGV_Day;
     MI_MGV_Day=(document.getElementById("ctl00_ContentPlaceHolder1_ddlDay").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlDay").selectedIndex).text);
     if (MI_MGV_Day=="")
     {
        message=message + "<br> * Select Day";
        error= true;
     }
      var MI_MGV_Month;
     MI_MGV_Month=document.getElementById("ctl00_ContentPlaceHolder1_ddlMonth").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlMonth").selectedIndex).text);
     if (MI_MGV_Month=="")
     {
        message=message + "<br> * Select Month";
        error= true;
     }
       var MI_MGV_Year;
     MI_MGV_Year=document.getElementById("ctl00_ContentPlaceHolder1_ddlYear").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlYear").selectedIndex).text);
     if (MI_MGV_Year=="")
     {
        message=message + "<br> * Select Year";
        error= true;
     }*/
     var MI_MGV_Nationality;
     MI_MGV_Nationality=document.getElementById("ctl00_ContentPlaceHolder1_txtNationality").value;
     if (MI_MGV_Nationality=="")
     {
        message=message + "<br> * Nationality should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_Address;
     MI_MGV_Address=document.getElementById("ctl00_ContentPlaceHolder1_txtaddress").value;
     if (MI_MGV_Address=="")
     {
        message=message + "<br> * Address should not be Empty";
        error= true;
     }
     else
     {
   
     }
      /* var MI_MGV_City;
     MI_MGV_City=document.getElementById("ctl00_ContentPlaceHolder1_txtCity").value;
     if (MI_MGV_City=="")
     {
        message=message + "<br> * City should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_State;
     MI_MGV_State=document.getElementById("ctl00_ContentPlaceHolder1_txtState").value;
     if (MI_MGV_State=="")
     {
        message=message + "<br> * State should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_Country;
     MI_MGV_Country=(document.getElementById("ctl00_ContentPlaceHolder1_ddlCountry").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlCountry").selectedIndex).text);
     if (MI_MGV_Country=="")
     {
        message=message + "<br> * Select Country";
        error= true;
     }
      var MI_MGV_Pin;
     MI_MGV_Pin=document.getElementById("ctl00_ContentPlaceHolder1_txtPin").value;
     if (MI_MGV_Pin=="")
     {
        message=message + "<br> * Pin should not be Empty";
        error= true;
     }
     else
     {
   
     }
       var MI_MGV_Phone;
     MI_MGV_Phone=document.getElementById("ctl00_ContentPlaceHolder1_txtPhone").value;
     if (MI_MGV_Phone=="")
     {
        message=message + "<br> * Phone should not be Empty";
        error= true;
     }
     else
     {
   
     }
       var MI_MGV_Mobile;
     MI_MGV_Mobile=document.getElementById("ctl00_ContentPlaceHolder1_txtMobile").value;
     if (MI_MGV_Mobile=="")
     {
        message=message + "<br> * Mobile should not be Empty";
        error= true;
     }
     else
     {
   
     }
        var MI_MGV_Email;
     MI_MGV_Email=document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").value;
     if (MI_MGV_Email=="")
     {
        message=message + "<br> * Email should not be Empty";
        error= true;
     }
     else
     {
       
        var MI_MGV_VEmail;
         MI_MGV_VEmail=CheckEmail(document.getElementById("ctl00_ContentPlaceHolder1_txtEmail").value);
         if (!MI_MGV_VEmail)
         {
            message=message + "<br> * Enter a valid Email Id";
            error= true;
         }
         else
         {
       
         }
     }*/
     
     var MI_MGV_ChequeName;
     MI_MGV_ChequeName=document.getElementById("ctl00_ContentPlaceHolder1_txtchequename").value;
     if (MI_MGV_ChequeName=="")
     {
        message=message + "<br> * Cheque Name should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_ChequeRelation;
     MI_MGV_ChequeRelation=document.getElementById("ctl00_ContentPlaceHolder1_txtchequerelation").value;
     if (MI_MGV_ChequeRelation=="")
     {
        message=message + "<br> * Cheque Relation should not be Empty";
        error= true;
     }
     else
     {
   
     }
      
     var MI_MGV_NomName;
     MI_MGV_NomName=document.getElementById("ctl00_ContentPlaceHolder1_txtNomName").value;
     if (MI_MGV_NomName=="")
     {
        message=message + "<br> * Nominee Name should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_NomRelation;
     MI_MGV_NomRelation=document.getElementById("ctl00_ContentPlaceHolder1_txtNomRelation").value;
     if (MI_MGV_NomRelation=="")
     {
        message=message + "<br> * Nominee Relation should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_UserName;
     MI_MGV_UserName=document.getElementById("ctl00_ContentPlaceHolder1_txtUserName").value;
     if (MI_MGV_UserName=="")
     {
        message=message + "<br> * UserName should not be Empty";
        error= true;
     }
     else
     {
   
     }
       var MI_MGV_Password;
     MI_MGV_Password=document.getElementById("ctl00_ContentPlaceHolder1_txtPassword").value;
     if (MI_MGV_Password=="")
     {
        message=message + "<br> * Password should not be Empty";
        error= true;
     }
     else
     {
   
     }
        var MI_MGV_VPassword;
     MI_MGV_VPassword=document.getElementById("ctl00_ContentPlaceHolder1_txtVPassword").value;
     if (MI_MGV_VPassword=="")
     {
        message=message + "<br> * Verificatin Password should not be Empty";
        error= true;
     }
     else
     {
   
     }
     var MI_MGV_HintAns;
     MI_MGV_HintAns=document.getElementById("ctl00_ContentPlaceHolder1_txtHintAnswer").value;
     if (MI_MGV_HintAns=="")
     {
        message=message + "<br> * Pls Give answer to your hint question";
        error= true;
     }
     else
     {
   
     }
  
     if (!document.getElementById("ctl00_ContentPlaceHolder1_chkTerm").checked)
     {
        message=message + "<br> * Tick the CheckBox If You Are Agree With Term & Conditions !";
        error= true;
     }
    
    if(error)
    {
        document.getElementById("ctl00_ContentPlaceHolder1_lblMessages").innerHTML=message;
        window.location.href="#top";
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
  function CheckUserName(evt)
  {
     var charCode = (evt.which) ? evt.which : event.keyCode
     if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 48 && charCode <= 57) || charCode==189)
        return true;
        
     return false;
  }
  function CheckPassword(evt)
  {
     var charCode = (evt.which) ? evt.which : event.keyCode
     if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 48 && charCode <= 57))
        return true;
        
     return false;
  }

</script>
                
     <a name="top"></a><div align="left"><font color="red"> <asp:Label ID="lblMessages" runat="server" Font-Size="X-Small"></asp:Label></font></div>
       <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%">
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                        <tr>
                            <td class="cellhead" width="100%" align="left" style="height: 22px">
                                <b><span class="heading">APPLICATION FORM</span></b>
                            </td>
                        </tr>
                     </tbody>
                  </table>
                  <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td align="center">
                                <table class="celltable"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td colspan="3" style="font-size:x-small;color:Red" align="left">Fields marked with asterisk(*) are manadatory</td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right" width="37%">
                                                <b>Parent ID</b><asp:Label ID="label1" runat="server" ForeColor="red">*</asp:Label>
                                            </td>
                                            <td  align="left" width="25%">
                                                <asp:TextBox ID="txtParentId" runat="server" MaxLength="25" class="textbox" size="26"></asp:TextBox>
                                               
                                            </td>
                                            <td  align="left" width="38%"> &nbsp;<font color="red"><asp:Label ID="lblParentID" runat="server"></asp:Label></font></td>
                                         </tr>
                                         
                                        <tr>
                                            <td class="pad" align="right">
                                                <b>Reference ID</b><asp:Label ID="label2" runat="server" ForeColor="red">*</asp:Label>
                                            </td>
                                            <td  align="left">
                                                <asp:TextBox ID="txtreferrerId" runat="server" MaxLength="25" class="textbox" size="26" ></asp:TextBox>
                                                
                                            </td>
                                            <td align="left">&nbsp;<font color="red"><asp:Label ID="lblReferenceID" runat="server"></asp:Label></font> </td>
                                         </tr>
                                         <tr>
                                            <td class="pad" align="right"><b>Node</b><asp:Label ID="label3" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  align="left">
                                                <asp:DropDownList ID="ddlNode" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Left</asp:ListItem>
                                                    <asp:ListItem Value="1">Right</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td >&nbsp;</td>
                                         </tr>
                                         
                                          <tr>
                                            <td class="pad" align="right"><b>Select Product </b><asp:Label ID="label4" runat="server" ForeColor="red">*</asp:Label> </td>
                                            <td  align="left">
                                                <asp:DropDownList ID="ddlProduct" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td >&nbsp;</td>
                                         </tr>
                                       
                                        <tr>
                                            <td  width="100%" colspan="3">&nbsp;</td>
                                        </tr>
                                      </tbody>
                                   </table>
                                    
                                   <table class="tablehead" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                                     <tbody>
                                        <tr>
                                            <td class="cellhead" width="100%" align="left" style="height: 22px">
                                                PERSONAL DETAILS
                                            </td>
                                        </tr>
                                     </tbody>
                                   </table>
                                   <table class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pad" align="right" width="22%">Title <asp:Label ID="label5" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  align="left" width="25%">
                                                <asp:DropDownList ID="ddlTitle" runat="server">
                                                    <asp:ListItem Value="" Selected="True">[Select]</asp:ListItem>
                                                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                                                    <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
                                                    <asp:ListItem Value="M/s.">M/s.</asp:ListItem>
                                                    <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                                    <asp:ListItem Value="Md.">Md.</asp:ListItem>
                                                </asp:DropDownList>
                                             </td>
                                            <td class="pad" align="right" width="21%">Name <asp:Label ID="label6" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  width="33%" align="left">
                                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" class="textbox" size="18"  onkeypress="return isAlphabetKey(event)" ></asp:TextBox>
                                                
                                           </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right">Father/Husband<asp:Label ID="label7" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  align="left">
                                                <asp:TextBox ID="txtFHName" runat="server" MaxLength="50" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right">Date of Birth</td>
                                            <td align="left">
                                                 <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
                                                 <asp:DropDownList ID="ddlMonth" runat="server"></asp:DropDownList>
                                                 <asp:DropDownList ID="ddlDay" runat="server"></asp:DropDownList>
                                             </td>
                                          </tr>
                                          <tr>
                                            <td class="pad" align="right">Nationality <asp:Label ID="label8" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  align="left">
                                                <asp:TextBox ID="txtNationality" runat="server" MaxLength="20" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right">Marital Status</td>
                                            <td align="left">                               
                                                <asp:DropDownList ID="ddlMStatus" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Married</asp:ListItem>
                                                    <asp:ListItem Value="1">Un-Married</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr>
                                            <td rowspan="2" class="pad" align="right">Address <asp:Label ID="label9" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td rowspan="2" align="left">
                                                <asp:TextBox ID="txtAddress" runat="server" MaxLength="150" class="textbox" size="18" TextMode="MultiLine"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right">Town/City</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtCity" runat="server" MaxLength="20" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right">State</td>
                                            <td  align="left">
                                                <asp:TextBox ID="txtState" runat="server" MaxLength="20" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>                        
                                        <tr>
                                            <td class="pad" align="right">Country</td>
                                            <td align="left">
                                               <asp:DropDownList ID="ddlCountry" runat="server"  onkeyup="validateR(this, '')" ruleset="[^a-z]"></asp:DropDownList>
                                            </td>
                                            <td class="pad" align="right">Pin Code</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPin" runat="server" MaxLength="8" class="textbox" size="18" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right">Phone</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPhone" runat="server" MaxLength="13" class="textbox" size="18" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right">Mobile Phone</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" class="textbox" size="18" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right">Email</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" class="textbox" size="18" ></asp:TextBox>
                                            </td>
                                            <td class="pad" colspan="2">&nbsp;</td>
                                       </tr>
                                     </tbody>
                                   </table>
                                   <table class="tablehead" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="cellhead" width="100%" height="22" align="left">CHEQUE DETAILS</td>
                                        </tr>
                                    </tbody>
                                   </table>
                                   <table class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" height="44" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>  
                                        <tr>
                                            <td  width="100%" colspan="4" height="15">&nbsp;</td>
                                        </tr>                      
                                        <tr>
                                            <td class="pad" align="right" width="28%" height="23">In Favour Of <asp:Label ID="label10" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  width="20%" height="23" align="left" valign="top">
                                                <asp:TextBox ID="txtchequename" runat="server" MaxLength="50" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right" width="20%" height="23">Relation <asp:Label ID="label11" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  width="32%" height="23" align="left" valign="top">
                                                <asp:TextBox ID="txtchequerelation" runat="server" MaxLength="50" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                     </tbody>
                                  </table>
                                   <table class="tablehead" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="cellhead" width="100%" height="22" align="left">NOMINATION DETAILS</td>
                                        </tr>
                                    </tbody>
                                   </table>
                                   <table class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" height="44" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td  width="100%" colspan="4" height="21">1)Site transfer Nominee </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right" width="27%" height="23">Name <asp:Label ID="label12" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td   width="25%" height="20" align="left">
                                                <asp:TextBox ID="txtNomName" runat="server" MaxLength="50" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                            <td class="pad" align="right" width="17%" height="23">Relation <asp:Label ID="label13" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  width="36%" height="23" align="left">
                                                <asp:TextBox ID="txtNomRelation" runat="server" MaxLength="50" class="textbox" size="18" onkeypress="return isAlphabetKey(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                     </tbody>
                                  </table>
                                  
                                  <table class="tablehead" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="cellhead" width="100%" height="22" align="left">SECURITY INFORMATION</td>
                                        </tr>
                                    </tbody>
                                  </table>
                                  
                                  <table class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="pad" align="right" style="width: 306px">User Name <asp:Label ID="label14" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td  width="60%" align="left">
                                               <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" class="textbox" size="29" onkeypress="return CheckUserName(event)"></asp:TextBox>
                                               <asp:Label ID="lbluseridexist" runat="server" ForeColor="red" Font-Size="X-Small"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="left" style="width: 306px">&nbsp; </td>
                                            <td align="left" style="font-size:x-small">
                                                <span class="page_inf">
                                                    Accept only (A-Z,a-z,0-9,-,_) &nbsp;
                                                </span>
                                            </td>
                                       </tr>
                                        <tr>
                                            <td class="pad" align="right" style="width: 306px">Password <asp:Label ID="label15" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td align="left">
                                               <asp:TextBox ID="txtPassword" runat="server" MaxLength="20" class="textbox" size="29" TextMode="Password" onkeypress="return CheckPassword(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="right" style="width: 306px">Verify Password <asp:Label ID="label16" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td align="left">
                                                <asp:TextBox ID="txtVPassword" runat="server" MaxLength="20" class="textbox" size="29" TextMode="Password" onkeypress="return CheckPassword(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="pad" align="left" style="width: 306px">&nbsp; </td>
                                            <td align="left" style="font-size:x-small">
                                                <span class="page_inf">
                                                    Please 
                                                    Create your Password, above <br>by using between 6 and 
                                                    15 characters <br>(only A-Z,a-z,0-9) with no spaces. <br>Make sure it is 
                                                    difficult for others to guess! &nbsp;
                                                </span>
                                            </td>
                                       </tr>
                                       <tr>
                                            <td class="pad" align="right" style="width: 306px">Hint Question <asp:Label ID="label17" runat="server" ForeColor="red">*</asp:Label></td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlHintQues" runat="server" ></asp:DropDownList>
                                            </td>
                                       </tr>
                                       <tr>
                                            <td class="pad" style="width: 306px">
                                                <P align="right">Hint Answer <asp:Label ID="label18" runat="server" ForeColor="red">*</asp:Label></P>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtHintAnswer" runat="server" MaxLength="50" class="textbox" size="29" ></asp:TextBox>
                                            </td>
                                       </tr>
                                       <tr>
                                            <td class="pad" style="width: 306px">&nbsp;</td>
                                            <td align="left" style="font-size:x-small">
                                                <span class="page_inf">
                                                    If you forget your Password, we will verify <br />
                                                    your identity by asking you the question.<br /><br />
                                                </span>
                                            </td>
                                       </tr>
                                     </tbody>
                                  </table>
                                  <table class="celltable"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="cellhead" width="100%" height="22" align="left">CUSTOMER DECLARATION</td>
                                        </tr>
                                        <tr>
                                            <td  style="font-size:small" align="center" width="100%" height="22">&nbsp;
                                               <asp:CheckBox ID="chkTerm" runat="server" />
                                                <span class="page_inf">
                                                    I agree to the terms and conditions. Click here to see the 
                                                    <a href="Terms.aspx"  target="_blank">Terms and Conditions.</a>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  align="center" width="100%" height="22">
                                                <asp:Button ID="CMDJOIN" Text="Join" Width="150" runat="server" OnClick="CMDJOIN_Click"  />
                                            </td>
                                        </tr>
                                     </tbody>
                                  </table>&nbsp; 
                            </td>
                        </tr>
                  </table>                  
                </td> 
            </tr>
        </table>
    </asp:Content>