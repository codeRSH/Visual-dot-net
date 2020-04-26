<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JoinNow.aspx.cs" Inherits="JoinNow" Title="Micro Infoware::Join Now" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
    
    function validate()
        {
        
        
            var Pid=document.getElementById('ctl00_ContentPlaceHolder1_txtParentId').value;
            var RefId=document.getElementById('ctl00_ContentPlaceHolder1_txtreferrerId').value;  
            var name=document.getElementById('ctl00_ContentPlaceHolder1_txtName').value;
            var fname=document.getElementById('ctl00_ContentPlaceHolder1_txtFHName').value;
            var city=document.getElementById('ctl00_ContentPlaceHolder1_txtCity').value;
            var State=document.getElementById('ctl00_ContentPlaceHolder1_txtState').value;
            var user=document.getElementById('ctl00_ContentPlaceHolder1_txtUserName').value;
            var pass=document.getElementById('ctl00_ContentPlaceHolder1_txtPassword').value;
            if(Pid=="")
                {
                    alert('Parent Id Should Not be blank');
                    return false;
                }
            if(RefId=="")
                {
                    alert('Refernce Id Should Not be blank');
                    return false;
                }
            
            
                if(name=="")
                    {
                        alert('Name Should Not be blank ');
                        return false;
                
                    }
                if(fname=="")
                    {
                        alert('Father Name Should Not be blank');
                        return false;
                    }
                if(city=="")
                    {
                        alert('City Name Should Not be blank');
                        return false;
                    }
                if(State=="")
                    {
                        alert('State Name Should Not be blank');
                        return false;
                    }
                if(user=="")
                    {
                        alert('User Name Should Not be blank');
                        return false;
                    }
                if(pass=="")
                    {
                        alert('Password Should Not be blank');
                        return false;
                    }
          }
       
            



</script>







<div id="Heading"> Registration Form

</div>


 
   <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="headerstyle" width="40%" align="right">
         <asp:Label ID="Label11" runat="server" ForeColor="red">*</asp:Label>Parent ID :
        </td>
         <td class="txtcontent" width="480px">
        <asp:TextBox ID="txtParentId" CssClass="tbox" runat="server" MaxLength="25"></asp:TextBox>                  
             <asp:Label ID="lblParentID" runat="server" CssClass="vld"></asp:Label></td>
    </tr>
    <tr>
        <td class="headerstyle" width="40%" align="right" style="height: 21px">
        <asp:Label ID="Label1" runat="server" ForeColor="red">*</asp:Label>Referer ID :
        </td>
        <td class="txtcontent" width="480px" style="height: 21px">
        <asp:TextBox ID="txtreferrerId" CssClass="tbox" runat="server" MaxLength="25" ></asp:TextBox>
            <asp:Label ID="lblReferenceID" runat="server" CssClass="vld"></asp:Label></td>
        
    </tr>
    
    <tr>
        <td class="headerstyle" width="40%" align="right">
            <asp:Label ID="Label2" runat="server" ForeColor="red">*</asp:Label>Node :
        </td>
        <td class="txtcontent" width="480px">
            <asp:DropDownList CssClass="tbox" ID="ddlNode" runat="server" BackColor="#F5F5FF">
            <asp:ListItem Value="0" Selected="True">Left</asp:ListItem>
            <asp:ListItem Value="1">Right</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblMessages" runat="server" Font-Size="X-Small"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="headerstyle" width="40%" align="right">
            <asp:Label ID="Label3" runat="server" ForeColor="red">*</asp:Label>Products :    
        
        </td>
        <td class="txtcontent" width="480px">
             <asp:DropDownList CssClass="tbox" ID="ddlProduct" runat="server">
             </asp:DropDownList>
        </td>
    </tr>
      <tr>
        <td colspan="2" style="height: 14px">
         &nbsp;
                </td>
            </tr>
            <tr>
                <td class="block-header" colspan="2">
                    PERSONAL INFORMATION
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label4" runat="server" ForeColor="red">*</asp:Label>Title :  
            </td>
            <td class="txtcontent" width="480px">
                <asp:DropDownList CssClass="tbox" ID="ddlTitle" runat="server">
                                                    <asp:ListItem Selected="True">[Select]</asp:ListItem>
                                                    <asp:ListItem Value="Mr.">Mr.</asp:ListItem>
                                                    <asp:ListItem Value="Ms.">Ms.</asp:ListItem>
                                                    <asp:ListItem Value="M/s.">M/s.</asp:ListItem>
                                                    <asp:ListItem Value="Dr.">Dr.</asp:ListItem>
                                                    <asp:ListItem Value="Md.">Md.</asp:ListItem>
                                                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td class="headerstyle" width="40%" align="right">
            <asp:Label ID="Label5" runat="server" ForeColor="red">*</asp:Label>Name: 
            </td>
            <td class="txtcontent" width="480px" >
                 <asp:TextBox ID="txtName" CssClass="tbox" runat="server" MaxLength="50" ></asp:TextBox>
                </td>
        </tr>
        
        <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label6" runat="server" ForeColor="red">*</asp:Label>Father/Husband:
            </td>
            <td class="txtcontent" width="480px" >
                <asp:TextBox ID="txtFHName" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right" >
                <asp:Label ID="Label7" runat="server" ForeColor="red">*</asp:Label>Date of Birth:
            </td>
            <td class="txtcontent" width="480px">
                 <asp:DropDownList CssClass="tbox" ID="ddlYear" runat="server"></asp:DropDownList>
                 <asp:DropDownList ID="ddlMonth" CssClass="tbox" runat="server"></asp:DropDownList>
                 <asp:DropDownList ID="ddlDay" CssClass="tbox" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
                 <asp:Label ID="Label26" runat="server" ForeColor="red">*</asp:Label>Marital Statu:
            </td>
            <td class="txtcontent" width="480px">
             <asp:DropDownList CssClass="tbox" ID="ddlMStatus" runat="server" BackColor="#F6F6FF">
             <asp:ListItem Value="0" Selected="True">Married</asp:ListItem>
             <asp:ListItem Value="1">Un-Married</asp:ListItem>
             </asp:DropDownList>
            
            </td>
        
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right" >
                <asp:Label ID="Label8" runat="server" ForeColor="red">*</asp:Label>Address:
            </td>
            <td class="txtcontent" width="480px" >
                <asp:TextBox ID="txtAddress" CssClass="tbox" runat="server" MaxLength="150"  TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right" style="height: 21px" >
                 <asp:Label ID="Label9" runat="server" ForeColor="red">*</asp:Label>Town/City:
            </td>
            <td class="txtcontent" width="480px" style="height: 21px">
                <asp:TextBox ID="txtCity" CssClass="tbox" runat="server" MaxLength="20"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label10" runat="server" ForeColor="red">*</asp:Label>State:
            </td>
            <td class="txtcontent" width="480px">
                 <asp:TextBox ID="txtState" CssClass="tbox" runat="server" MaxLength="20" ></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
               <asp:Label ID="Label12" runat="server" ForeColor="red">*</asp:Label>Country:
            </td>
             <td class="txtcontent" width="480px">
             <asp:DropDownList ID="ddlCountry" CssClass="tbox" runat="server" Width="140px"></asp:DropDownList>
                 </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label27" runat="server" ForeColor="red">*</asp:Label>Nationality:
            </td>
            
            <td class="txtcontent" width="480px">
                <asp:TextBox ID="txtNationality" CssClass="tbox" runat="server" MaxLength="20"></asp:TextBox>
            </td>
        
        </tr>
        
        <tr>
           
            <td  class="headerstyle" width="40%" align="right" >
            <asp:Label ID="Label13" runat="server" ForeColor="red">*</asp:Label>Pin Code:
            </td>
            <td  class="txtcontent" width="480px">
                <asp:TextBox ID="txtPin" CssClass="tbox" runat="server" MaxLength="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right" style="height: 21px">
               <asp:Label ID="Label14" runat="server" ForeColor="red">*</asp:Label> Phone:
            </td>
            <td  class="txtcontent" width="480px" style="height: 21px">
            <asp:TextBox ID="txtPhone" CssClass="tbox" runat="server" MaxLength="13"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
             <asp:Label ID="Label15" runat="server" ForeColor="red">*</asp:Label>Mobile Phone:
            </td>
            <td class="txtcontent" width="480px">
                 <asp:TextBox ID="txtMobile" CssClass="tbox" runat="server" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
            <asp:Label ID="Label16" runat="server" ForeColor="red">*</asp:Label>Email:
            </td>
            <td class="txtcontent" width="480px">
                <asp:TextBox ID="txtEmail" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
         <tr>
        <td colspan="2">
         &nbsp;
                </td>
            </tr>
            <tr>
                <td class="block-header" colspan="2">
                    CHEQUE DETAILS
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
       
        <tr>
            <td class="headerstyle" width="40%" align="right">
               <asp:Label ID="Label17" runat="server" ForeColor="red">*</asp:Label> In Favour Of :
            </td>
            <td class="txtcontent" width="480px">
                <asp:TextBox ID="txtchequename" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label18" runat="server" ForeColor="red">*</asp:Label> Relation:
            </td>
            <td class="txtcontent" width="480px">
                  <asp:TextBox ID="txtchequerelation" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
         <tr>
        <td colspan="2">
         &nbsp;
                </td>
            </tr>
            <tr>
                <td class="block-header" colspan="2">
                    NOMINATION DETAILS
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="headerstyle" width="40%" align="right">
                     <asp:Label ID="Label19" runat="server" ForeColor="red">*</asp:Label>Site transfer Nominee:
                </td>
                <td class="txtcontent" width="480px">
                    <asp:TextBox ID="txtNomName" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="headerstyle" width="40%" align="right">
                    <asp:Label ID="Label20" runat="server" ForeColor="red">*</asp:Label>Relation:
                </td>
                <td class="txtcontent" width="480px">
                     <asp:TextBox ID="txtNomRelation" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            <tr>
        <td colspan="2">
         &nbsp;
                </td>
            </tr>
            <tr>
                <td class="block-header" colspan="2">
                    SECURITY INFORMATION
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td  class="headerstyle" width="40%" align="right">
                    <asp:Label ID="Label21" runat="server" ForeColor="red">*</asp:Label>User Name:
                </td>
                <td class="txtcontent" width="480px">
                    <asp:TextBox ID="txtUserName" CssClass="tbox" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:Label ID="lbluseridexist" runat="server" ForeColor="red" Font-Size="X-Small"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  class="headerstyle" width="40%" align="right">
                    <asp:Label ID="Label22" runat="server" ForeColor="red">*</asp:Label>Password:
                </td>
                <td class="txtcontent" width="480px">
                <asp:TextBox ID="txtPassword" CssClass="tbox" runat="server" MaxLength="20" TextMode="Password" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label23" runat="server" ForeColor="red">*</asp:Label>Hint Question:
                </td>
                <td class="txtcontent" width="480px" >
                     <asp:DropDownList CssClass="tbox" ID="ddlHintQues" runat="server" ></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label24" runat="server" ForeColor="red">*</asp:Label>Hint Answer:
                </td>
                <td class="txtcontent" width="480px">
                      <asp:TextBox CssClass="tbox" ID="txtHintAnswer" runat="server" MaxLength="50" ></asp:TextBox>
                
                </td>
            </tr>
               <tr>
        <td colspan="2">
         &nbsp;
                </td>
            </tr>
            <tr>
                <td class="block-header" colspan="2">
                    CUSTOMER DECLARATION
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td class="headerstyle" width="40%" align="right">
                <asp:Label ID="Label25" runat="server" ForeColor="red">*</asp:Label>Terms and Conditions:
            </td>
                <td class="txtcontent" width="480px" colspan="2">
                 <asp:CheckBox CssClass="tbox" ID="chkTerm" runat="server" />
                   <span>
                   I agree to the terms and conditions. Click here to see the 
                   <a href="#"  target="_blank">Terms and Conditions.</a>
                   </span>
                 
                 </td>
                 
                 </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td> 
                </tr> 
                <tr>
                    <td colspan="2" align="center" style="height: 18px">
                        <asp:Button ID="btn" CssClass="btn" runat="server" Text="Submit" OnClick="Submit1_Click" BorderColor="Black" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td> 
                </tr> 
   </table>

</asp:Content>

