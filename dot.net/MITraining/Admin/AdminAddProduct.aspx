<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddProduct.aspx.cs" Inherits="Admin_AdminAddProduct" MasterPageFile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Add New Product
</div>
<script language="javascript" type="text/javascript" src="../Script/MI_MGV_CheckValid.js"></script>
<script language="javascript" type="text/javascript">
    function checkfields()
    {
        var checkcode = document.getElementById("ctl00_ContentPlaceHolder1_txtcode").value;
        if(checkcode == "")
        {
            alert("Product Code should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtcode").focus();
            return false;
        }
        else if(!CheckInteger(checkcode))
        {
            alert("Product Code should be a number only!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtcode").focus();
            return false;
        }
        
        var checkname = document.getElementById("ctl00_ContentPlaceHolder1_txtProductName").value;
        if(checkname == "")
        {
            alert("Product Name should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtProductName").focus();
            return false;
        }        
        
        var checprice = document.getElementById("ctl00_ContentPlaceHolder1_txtprice").value;
        if(checprice == "")
        {
            alert("Price should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtprice").focus();
            return false;
        }        
        var checkunit = document.getElementById("ctl00_ContentPlaceHolder1_txtunit").value;
        if(checkunit == "")
        {
            alert("Unit should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtunit").focus();
            return false;
        }
        else if(!CheckInteger(checkunit))
        {
            alert("Product Unit should be a number only!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtunit").focus();
            return false;
        }
        
        var checpoint = document.getElementById("ctl00_ContentPlaceHolder1_txtsalesPoint").value;
        if(checpoint == "")
        {
            alert("Sales Point should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtsalesPoint").focus();
            return false;
        }
        else if(!CheckInteger(checpoint))
        {
            alert("Product Sales Point should be a number only!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtsalesPoint").focus();
            return false;
        }
        var checkrate = document.getElementById("ctl00_ContentPlaceHolder1_txtPairRate").value;
        if(checkrate == "")
        {
            alert("Pair Rate should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtPairRate").focus();
            return false;
        }
        else if(!CheckInteger(checkrate))
        {
            alert("Pair Rate should be a number only!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtPairRate").focus();
            return false;
        }        
        var chectitle = document.getElementById("ctl00_ContentPlaceHolder1_txtTitle").value;
        if(chectitle == "")
        {
            alert("Title should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtTitle").focus();
            return false;
        }
        var checdesc = document.getElementById("ctl00_ContentPlaceHolder1_txtdescription").value;
        if(checdesc == "")
        {
            alert("Description should not be blank!");
            document.getElementById("ctl00_ContentPlaceHolder1_txtdescription").focus();
            return false;
        }
        var checkfile = document.getElementById("ctl00_ContentPlaceHolder1_uploadfile").value;
        if(checkfile == "")
        {
            alert("Select a image for product!");
            document.getElementById("ctl00_ContentPlaceHolder1_uploadfile").focus();
            return false;
        }
        
        return true;
    }
</script>
     <table border="0" cellpadding="2" cellspacing="0" align="center" width="100%" >
            <tr>
                 <td width="100%">
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="1" cellpadding="3" width="100%" >
                    <tbody>
                       
                       <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="fieldText" width="45%">Product Code : <asp:Label ID="label1" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td width="55%" align="left"><asp:TextBox ID="txtcode" runat="server" MaxLength="10"></asp:TextBox></td>
                        </tr>  
                        <tr>
                            <td align="right" class="fieldText">Product Name : <asp:Label ID="label2" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtProductName" runat="server" MaxLength="49"></asp:TextBox></td>
                        </tr> 
                        <tr>
                            <td align="right" class="fieldText">Price : <asp:Label ID="label3" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtprice" runat="server" MaxLength="9"></asp:TextBox></td>
                        </tr> 
                        <tr>
                            <td align="right" class="fieldText">Unit : <asp:Label ID="label9" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtunit" runat="server" MaxLength="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="fieldText">Sales Point : <asp:Label ID="label4" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtsalesPoint" runat="server"  MaxLength="4"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="fieldText">Pair Rate : <asp:Label ID="label8" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtPairRate" runat="server"  MaxLength="4"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="fieldText" valign="top">Title : <asp:Label ID="label5" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtTitle" runat="server" TextMode="multiLine" Rows="3" MaxLength="250" Width="200"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="fieldText" valign="top">Description : <asp:Label ID="label6" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:TextBox ID="txtdescription" runat="server" TextMode="multiLine" Rows="6" MaxLength="1000" Width="200"></asp:TextBox></td>
                        </tr>  
                        <tr>
                            <td align="right" class="fieldText" valign="top">Product Image : <asp:Label ID="label7" runat="server" Text="*" ForeColor="red"></asp:Label></td>
                            <td align="left"><asp:FileUpload ID="uploadfile" runat="server" /></td>
                        </tr>  
                        <tr>
                            <td colspan="2" align="center"><asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" /></td>
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
