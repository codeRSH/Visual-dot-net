<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LastPayment.aspx.cs" Inherits="Admin_LastPayment" MasterPageFile="~/Admin/adminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Last Payment Details
</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%">
              
              
              <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                <tbody>
                    
                   <tr>
                        <td   width="100%" height="30" colspan="2">
                            
                        </td>
                    </tr>
                    <tr>
                        <td  align="center"  width="100%">
                            <asp:GridView ID="gvPayment" AutoGenerateColumns="false" runat="server" AllowPaging="true" PageSize="10" PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="right" OnRowDataBound="sno">
                                    <Columns>  
                                        <asp:BoundField HeaderText="Sno" />                                        
                                        <asp:BoundField HeaderText="Reg. No." DataField="RegistrationNo"/>                                        
                                        <asp:BoundField HeaderText="Name" DataField="Name"/>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Status
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <img src ="" alt="" width="100" height="70" />                                               
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                        <asp:ButtonField HeaderText="Payment" ButtonType="Button" Text="Genarate" CommandName="" />
                                        <asp:HyperLinkField HeaderText="Last Payment" DataTextField="Details" DataNavigateUrlFields="RegistrationNo" DataNavigateUrlFormatString="LastPayment.aspx?RegistrationNo={0}" />                                                                                                                                                                                                                                    
                                    </Columns>
                                </asp:GridView>    
                        </td>
                    </tr>
                   
                 </tbody>
              </table>&nbsp; 
            </td> 
        </tr>
    </table>
</asp:Content>


