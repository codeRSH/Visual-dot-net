<%@ page language="C#" autoeventwireup="true" inherits="Admin_PaymentStatements, App_Web_2frli6if" masterpagefile="~/Admin/adminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Payment Statements
</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
        <tr>
             <td width="100%">
              <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                <tbody>
                                     
                    <tr  id="trgried" runat="server">
                        <td  align="center" style="width: 100%">
                            <asp:UpdatePanel ID="updgried" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
<asp:GridView id="gvPaymentStatements" runat="server" AutoGenerateColumns="false" AllowSorting="true" cssclass="grid" onsorting="OnSort" AllowPaging="true" PageSize="10" PagerSettings-Mode="NumericFirstLast" PagerStyle-HorizontalAlign="right" OnPageIndexChanging="gvPaymentGenerate_PageIndexChanging" OnRowDataBound="sno">
<PagerSettings Mode="NumericFirstLast"></PagerSettings>
<Columns>
<asp:BoundField HeaderText="Sno"></asp:BoundField>
<asp:BoundField DataField="Reg_No" SortExpression="Reg_No" HeaderText="Reg.No"></asp:BoundField>
<asp:BoundField DataField="Week_Start_date" SortExpression="Week_Start_date" HeaderText="From Date"></asp:BoundField>
<asp:BoundField DataField="Week_End_date" SortExpression="Week_End_date" HeaderText="To Date"></asp:BoundField>
<asp:BoundField DataField="Payment_Generate_date" SortExpression="Payment_Generate_date" HeaderText="GenerateOn"></asp:BoundField>
<asp:BoundField DataField="Direct_Income" SortExpression="Direct_Income" HeaderText="Direct"></asp:BoundField>
<asp:BoundField DataField="Binary_Income" SortExpression="Binary_Income" HeaderText="Binary"></asp:BoundField>
<asp:BoundField DataField="SingleLine_Income" SortExpression="SingleLine_Income" HeaderText="SingleLine"></asp:BoundField>
<asp:BoundField DataField="SingleLeg_Income" SortExpression="SingleLeg_Income" HeaderText="NonSponsor"></asp:BoundField>
<asp:TemplateField><HeaderTemplate>
                                                Pay Status
                                            
</HeaderTemplate>
<ItemTemplate>
                                                <img src ="<%#DataBinder.Eval(Container.DataItem,"Paid_Status")%>" alt="" />                                               
                                            
</ItemTemplate>
</asp:TemplateField>
<asp:HyperLinkField Text="Details" DataNavigateUrlFormatString="Payment.aspx?Reg_No={0}&amp;id={1}" DataNavigateUrlFields="Reg_No,id"></asp:HyperLinkField>
</Columns>

<RowStyle BackColor="#FFC0C0"></RowStyle>

<PagerStyle HorizontalAlign="Right"></PagerStyle>

<HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" Font-Bold="True" VerticalAlign="Middle"></HeaderStyle>

<AlternatingRowStyle BackColor="#FFE0C0"></AlternatingRowStyle>
</asp:GridView> 
</ContentTemplate>                                                                                                  
                                <Triggers>
<asp:AsyncPostBackTrigger ControlID="gvPaymentStatements" EventName="PageIndexChanging"></asp:AsyncPostBackTrigger>
</Triggers>
                            </asp:UpdatePanel> 
                            <asp:Label ID="lblnorecord" runat="server"></asp:Label>                                                     
                        </td>                                               
                    </tr>
                 </tbody>
              </table>&nbsp; 
            </td> 
        </tr>
    </table>
</asp:Content>

