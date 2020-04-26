<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Members_Details.aspx.cs" Inherits="Admin_Members_Details" MasterPageFile="~/Admin/AdminMasterPage.master"  %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Member Details
</div>
  <input type="hidden" id="hdnEmailID" runat="server" />
   <script language="javascript" type="text/javascript">
    function isEmailID()
    {
       
         var strEmailID;
         strEmailID=document.getElementById("ctl00_ContentPlaceHolder1_hdnEmailID").value;
         document.getElementById("ctl00_ContentPlaceHolder1_hdnEmailID").value="";
         if(strEmailID=="")
         {
            document.getElementById("ctl00_ContentPlaceHolder1_lblMessage").title="The member don't have Email Address";
            alert("The member don't have Email Address");
            return false;
         }
         document.getElementById("ctl00_ContentPlaceHolder1_lblMessage").title="";
         return true;
    }
   </script>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%">
                  <table class="celltable" border="1"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                      
                       <tr>
                            <td  align="right" width="100%" height="30" colspan="2">
                                <table>
                                    <tr>
                                        <td align="left" width="100%" height="30">
                                            <b><asp:Label ID="lblActiveMessage" runat="server"></asp:Label></b>
                                        </td>
                                        <td align="right" width="100%" height="30">
                                             <a onclick="history.back()" style="cursor:hand" ><b>Back</b></a>
                                        </td>
                                    </tr>
                                </table>
                                 
                            </td>
                        </tr>
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Reference ID
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblReference" runat="server" ></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Parent ID
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblParent" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Name
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblName" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                             <td  align="right" width="40%" height="22" class="fieldText">
                              Registration No.
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblRegNo" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Left Child ID
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblLeftChildID" runat="server" ></asp:Label>
                            </td>
                        </tr>
                        
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Right Child ID
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblRightChildID" runat="server" ></asp:Label>
                            </td>
                        </tr>
                          <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Father/Husband Name
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblFHName" runat="server" ></asp:Label>
                            </td>
                        </tr>
                          <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Date of Birth
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblDOB" runat="server" ></asp:Label>
                            </td>
                        </tr>
                            <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Nationality
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblNationality" runat="server" ></asp:Label>
                            </td>
                        </tr>                       
                            <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Marital Status
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblMaritalStatus" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                             <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Address
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblAddress" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                           <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              City
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblCity" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                          <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              State
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblState" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Country
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblCountry" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Pin
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblPin" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                        <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Phone/Mobile
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblPhoneMobile" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                           <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              EmailID
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblEmail" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                          <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Nominee Name
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblNomName" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                              Nominee Relation
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblNomRelation" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Joining Date
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblJoinDate" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Joining Point
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblJoinPoint" runat="server" ></asp:Label>
                            </td>
                        </tr>  
                        <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Last Updated
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblLastUpdated" runat="server" ></asp:Label>
                            </td>
                        </tr> 
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText"> 
                             IsActive
                            </td>
                            <td  align="left" width="60%" height="22">
                               <asp:Label ID="lblIsActive" runat="server" ></asp:Label>
                            </td>
                        </tr> 
                         <tr>
                            <td  align="right" width="40%" height="22" class="fieldText">
                             Change Status (Active/Inactive)
                            </td>
                            <td  align="left" width="60%" height="22">
                                <asp:DropDownList ID="active" runat="server">
							                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
							                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
							                </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
							      <asp:Button ID="btnSave" runat="server"  Text="Save" ToolTip="click to save" OnClick="btnSave_Click"/>          
                            </td>
                        </tr>   
                       
                          <tr>
                            <td  align="center" width="100%" height="30" colspan="2" >
                                  <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                                  <asp:Button ID="btnSendMail" runat="server" Text="Send Mail" ToolTip="Click for Sending Mail" OnClick="btnSendMail_Click"/>
                            </td>
                        </tr>
                     </tbody>
                  </table>&nbsp; 
                </td> 
            </tr>
        </table>
    </asp:Content>

