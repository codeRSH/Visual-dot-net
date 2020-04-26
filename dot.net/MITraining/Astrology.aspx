<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Astrology.aspx.cs" Inherits="Astrology" Title="Micro Infoware::Astrology" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script  language="javascript" type="text/javascript">
     function validate()
        {
            var name=document.getElementById('ctl00_ContentPlaceHolder1_txtName').value;
            var fname=document.getElementById('ctl00_ContentPlaceHolder1_txtFHName').value;
            var email=document.getElementById('ctl00_ContentPlaceHolder1_txtEmail').value;
                if(name=="")
                    {
                        alert('Name Should Not be blank');
                        return false;
                    }
                if(fname=="")
                    {
                        alert('Father Name Should Not be blank');
                        return false;
                    }
                 if(email=="")
                    {
                    alert('Email Id Should Not be blank');
                    return false;
                    }
        }
    
    
    
    
    </script>


<div id="Heading"> Free Astrology</div>
<div style="width:100%">
<br />
<br />
<table width="83%">
    <tr>
        <td class="headerstyle1">
            Enter your information below to get your instant free reading!
        </td>
    </tr>

</table>
<br />
<br />
<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-left:auto;margin-right:auto">
   
   
      <tr>
        <td colspan="2" style="height: 14px">
         &nbsp;
                </td>
            </tr>
            
            <tr>
                <td colspan="2">
                    &nbsp;


                </td>
            </tr>
        
        
        <tr>
            <td class="headerstyle1" width="40%" align="right">
            <asp:Label ID="Label5" runat="server" ForeColor="red">*</asp:Label>Name :
            </td>
            <td class="txtcontent" width="480px" align="left" >
                 <asp:TextBox ID="txtName" CssClass="tbox" runat="server" MaxLength="50" ></asp:TextBox>
                </td>
        </tr>
        
        <tr>
            <td class="headerstyle1" width="40%" align="right">
                <asp:Label ID="Label6" runat="server" ForeColor="red">*</asp:Label>Father's Name :
            </td>
            <td class="txtcontent" width="480px" align="left">
                <asp:TextBox ID="txtFHName" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
        </tr>
      
        <tr>
            <td class="headerstyle1" width="40%" align="right">
                 <asp:Label ID="Label26" runat="server" ForeColor="red">*</asp:Label>Sex :
            </td>
            <td class="txtcontent" width="480px" align="left">
             <asp:DropDownList ID="Dropsex" runat="server">
                 <asp:ListItem>Male</asp:ListItem>
                 <asp:ListItem>Female</asp:ListItem>
             </asp:DropDownList>
            
            </td>
        
        </tr>
          <tr>
            <td class="headerstyle1" width="40%" align="right" >
                <asp:Label ID="Label7" runat="server" ForeColor="red">*</asp:Label>Date of Birth
                :
            </td>
            <td class="txtcontent" width="480px" align="left">
                 <asp:DropDownList CssClass="tbox" ID="ddlYear" runat="server"></asp:DropDownList>
                 <asp:DropDownList ID="ddlMonth" CssClass="tbox" runat="server"></asp:DropDownList>
                 <asp:DropDownList ID="ddlDay" CssClass="tbox" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right" >
                <asp:Label ID="Label1" runat="server" ForeColor="red">*</asp:Label>Time of Birth(24 Hrs) :
            </td>
            <td class="txtcontent" width="480px" align="left">
                 <asp:DropDownList CssClass="tbox" ID="DropDownList1" runat="server">
                 </asp:DropDownList>
                <asp:DropDownList ID="DropDownList2" CssClass="tbox" runat="server">
                 </asp:DropDownList>
                 <asp:DropDownList ID="DropDownList3" CssClass="tbox" runat="server">
                     <asp:ListItem Selected="True">AM</asp:ListItem>
                     <asp:ListItem>PM</asp:ListItem>
                 </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td class="headerstyle1" width="40%" align="right" style="height: 21px" >
                 <asp:Label ID="Label9" runat="server" ForeColor="red">*</asp:Label>Town/City :
            </td>
            <td class="txtcontent" width="480px" style="height: 21px" align="left">
                <asp:TextBox ID="txtCity" CssClass="tbox" runat="server" MaxLength="20"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right" >
                <asp:Label ID="Label10" runat="server" ForeColor="red">*</asp:Label>State :
            </td>
            <td class="txtcontent" width="480px" align="left">
                 <asp:TextBox ID="txtState" CssClass="tbox" runat="server" MaxLength="20" ></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right" style="height: 23px">
               <asp:Label ID="Label12" runat="server" ForeColor="red">*</asp:Label>Country :
            </td>
             <td class="txtcontent" width="480px" align="left" style="height: 23px">
             <asp:DropDownList ID="ddlCountry" CssClass="tbox" runat="server" Width="140px"></asp:DropDownList>
            </td>
        </tr>
     
        
        <tr>
           
            <td  class="headerstyle1" width="40%" align="right" >
            <asp:Label ID="Label13" runat="server" ForeColor="red">*</asp:Label>Pin Code :
            </td>
            <td  class="txtcontent" width="480px" align="left">
                <asp:TextBox ID="txtPin" CssClass="tbox" runat="server" MaxLength="8"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right" style="height: 21px">
               <asp:Label ID="Label14" runat="server" ForeColor="red">*</asp:Label> Phone :
            </td>
            <td  class="txtcontent" width="480px" style="height: 21px" align="left">
            <asp:TextBox ID="txtPhone" CssClass="tbox" runat="server" MaxLength="13"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right">
             <asp:Label ID="Label15" runat="server" ForeColor="red">*</asp:Label>Mobile Phone :
            </td>
            <td class="txtcontent" width="480px" align="left">
                 <asp:TextBox ID="txtMobile" CssClass="tbox" runat="server" MaxLength="10"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="headerstyle1" width="40%" align="right" style="height: 28px">
            <asp:Label ID="Label16" runat="server" ForeColor="red">*</asp:Label>Email :
            </td>
            <td class="txtcontent" width="480px" style="height: 28px" align="left">
                <asp:TextBox ID="txtEmail" CssClass="tbox" runat="server" MaxLength="50"></asp:TextBox>
                </td>
        </tr>
         <tr>
        <td colspan="2">
         &nbsp;
                </td>
            </tr>
          
                <tr>
                    <td colspan="2" align="center" style="height: 19px">
                        <asp:Button ID="btn" runat="server" Text="Submit" BorderColor="DarkRed" OnClick="btn_Click" BackColor="Navy" BorderStyle="Groove" Font-Bold="True" ForeColor="White" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 24px">
                        &nbsp;
                    </td> 
                </tr> 
   </table>
</div>
</asp:Content>

