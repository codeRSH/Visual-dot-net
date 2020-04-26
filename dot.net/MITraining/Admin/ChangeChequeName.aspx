<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeChequeName.aspx.cs" Inherits="ChangeChequeName" MasterPageFile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Change Cheque Name
</div>
    <script language="javascript" type="text/javascript">

    function checkValid()
    {
         var MI_MGV_Emp;
         MI_MGV_Emp=document.getElementById("ctl00_ContentPlaceHolder1_ddlEmployee").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlEmployee").selectedIndex).text;
         //alert(MI_MGV_Mode);
         if (MI_MGV_Emp=="--Select--")
         {
            alert("Please select Employee!");
            return false;
         }
         var MI_MGV_chequename;
         MI_MGV_chequename=document.getElementById("ctl00_ContentPlaceHolder1_txtname").value;
         //alert(MI_MGV_Mode);
         if (MI_MGV_chequename=="")
         {
            alert("Cheque Name should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtname").focus();
            return false;
         }
         var MI_MGV_chequerelation;
         MI_MGV_chequerelation=document.getElementById("ctl00_ContentPlaceHolder1_txtRelation").value;
         //alert(MI_MGV_Mode);
         if (MI_MGV_chequerelation=="")
         {
            alert("Cheque Relation should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtRelation").focus();
            return false;
         }
          
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
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%">
              <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                <tbody>
                    
                   <tr>
                        <td width="100%" colspan="2" align="center" height="225">
                            <table border="0" width="60%">
                                <tr>
                                    <td align="right" width="40%">
                                    Select Employee :
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlEmployee" runat="server" Width="135" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Cheque Name :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtname" runat="server" MaxLength="49" onkeypress="return isAlphabetKey(event)" AutoCompleteType="disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Relation :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRelation" runat="server" MaxLength="49" onkeypress="return isAlphabetKey(event)" AutoCompleteType="disabled"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                 </tbody>
              </table>&nbsp; 
            </td> 
        </tr>
    </table>
</asp:Content>


