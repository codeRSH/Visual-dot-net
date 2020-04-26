<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pay_Payment.aspx.cs" Inherits="Admin_Pay_Payment" MasterPageFile="~/Admin/adminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">

    function checkValid()
    {
         var MI_MGV_Mode;
         MI_MGV_Mode=document.getElementById("ctl00_ContentPlaceHolder1_ddlpaymode").options(document.getElementById("ctl00_ContentPlaceHolder1_ddlpaymode").selectedIndex).text;
         //alert(MI_MGV_Mode);
         if (MI_MGV_Mode=="--Select--")
         {
            alert("Please select Payment Mode!");
            return false;
         }
         else if(MI_MGV_Mode=="Cheque" || MI_MGV_Mode=="DD")
         {
             var MI_MGV_chequeNo;
             MI_MGV_chequeNo=document.getElementById("ctl00_ContentPlaceHolder1_txtchequeNo").value;
             //alert(MI_MGV_Mode);
             if (MI_MGV_chequeNo=="")
             {
                alert("Please enter Cheque/DD no.!");
                return false;
             }
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
</script>
<div id="Heading">
Payment
</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%">              
              <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                <tbody>
                     
                    <tr>                    
                        <td align="center" width="60%">
                            <table width="60%">
                                <tr id="trselectemp" runat="server">
                                    <td class="pad1">
                                        Select Employee : 
                                    </td>
                                    <td class="pad1">                            
                                        <asp:DropDownList ID="ddlemp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlemp_SelectedIndexChanged"></asp:DropDownList>
                                    </td>
                                </tr>  
                                <tr id="tremp" runat="server">
                                    <td class="pad1">
                                        Employee Reg. No.: 
                                    </td>
                                    <td class="pad1">                            
                                        <asp:Label ID="lblRegNo" runat="server"></asp:Label>
                                    </td>
                                </tr>                                                                                               
                                <tr id="trdate" runat="server">
                                    <td class="pad1" colspan="2" align="center">
                                        Date From &nbsp;
                                        <asp:Label ID="lblDateFrom" runat="server"></asp:Label>&nbsp; 
                                        To &nbsp;
                                        <asp:Label ID="lblDateTo" runat="server"></asp:Label>
                                    </td>                                    
                                </tr>
                                <tr id="trAmount" runat="server">
                                    <td class="pad1">
                                        Total Amount : 
                                    </td>
                                    <td class="pad1">
                                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>                                                     
                                <tr id="tr1" runat="server">
                                    <td class="pad1">
                                        Net Amount : 
                                    </td>
                                    <td class="pad1">
                                        <asp:Label ID="lblNet" runat="server"></asp:Label>
                                    </td>
                                </tr>  
                               <tr id="trmode" runat="server">
                                    <td class="pad1">
                                        Payment Mode : 
                                    </td>
                                    <td class="pad1">
                                        <asp:DropDownList ID="ddlpaymode" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr id="trchequname" runat="server">
                                    <td class="pad1">
                                        Cheque/DD Name : 
                                    </td>
                                    <td class="pad1">
                                        <asp:Label ID="lblchequename" runat="server"></asp:Label>                                        
                                    </td>
                                </tr>
                                <tr id="trchequeNo" runat="server">
                                    <td class="pad1">
                                        Cheque/DD No : 
                                    </td>
                                    <td class="pad1">
                                        <asp:TextBox ID="txtchequeNo" runat="server" MaxLength="15" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td   width="100%" height="10" colspan="2">
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%" height="15" colspan="2" align="center">
                                        <asp:Button ID="btnPaid" Text="Pay Now" runat="server" OnClick="btnPaid_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>                       
                    </tr> 
                    <tr>
                        <td   width="100%" height="15" colspan="2">
                            
                        </td>
                    </tr>
                 </tbody>
              </table>&nbsp; 
            </td> 
        </tr>
    </table>
</asp:Content>



