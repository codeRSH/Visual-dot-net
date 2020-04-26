<%@ page language="C#" autoeventwireup="true" inherits="Admin_GeneratePayment, App_Web_mb1_hneu" masterpagefile="~/Admin/adminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Generate Payment
</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%">
              
              
              <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                <tbody>
                   
                    <tr>
                        <td  width="35%" colspan="2" align="center">
                            <asp:Label ID="lblpaymentdate" runat="server" Font-Size="Small"></asp:Label><br /><br /><br />
                            <asp:Button ID="btnGeneratePayment" runat="server" Text="Generate Payment" OnClick="btnGeneratePayment_Click" /><br />
                            <asp:Button ID="btnfinalPayment" runat="server" Text="Click here for final Payment" OnClick="btnfinalPayment_Click" /><br />
                            <asp:Label ID="lblnorecord" runat="server" Font-Size="Small"></asp:Label><br />
                            <asp:Label ID="lblError" runat="server" Font-Size="Small"></asp:Label>
                        </td> 
                    </tr>                 
                    <tr  id="trgried" runat="server">
                        <td  align="center"  width="65%">
                            <asp:UpdatePanel ID="updgried" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:GridView id="gvPaymentGenerate" cssclass="grid" runat="server" OnRowDataBound="sno" OnPageIndexChanging="gvPaymentGenerate_PageIndexChanging" PagerStyle-HorizontalAlign="right" PagerSettings-Mode="NumericFirstLast" PageSize="10" AllowPaging="true" AutoGenerateColumns="false">
                                    <PagerSettings Mode="NumericFirstLast"></PagerSettings>
                                    <Columns>
                                    <asp:BoundField HeaderText="Sno"></asp:BoundField>
                                    <asp:BoundField DataField="RegistrationNo" HeaderText="Reg. No."></asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="Name"></asp:BoundField>
                                    <asp:BoundField DataField="FHName" HeaderText="Father's Name"></asp:BoundField>
                                    <asp:BoundField DataField="DOB" HeaderText="Date of Birth"></asp:BoundField>
                                    <asp:BoundField DataField="City" HeaderText="City"></asp:BoundField>
                                    <asp:BoundField DataField="Natioanlity" HeaderText="Nationality"></asp:BoundField>
                                    <asp:BoundField DataField="Join_Date" HeaderText="Join Date"></asp:BoundField>
                                    </Columns>
                                    <RowStyle BackColor="#FFC0C0" />                                        
                                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                    <HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" Font-Bold="True" VerticalAlign="Middle"></HeaderStyle>
                                    <AlternatingRowStyle BackColor="#FFE0C0" />
                                    </asp:GridView> 
                                 </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvPaymentGenerate" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
                                </Triggers>
                            </asp:UpdatePanel> 
                                                                                 
                        </td>                                               
                    </tr>
                   
                 </tbody>
              </table>&nbsp; 
            </td> 
        </tr>
    </table>
</asp:Content>


