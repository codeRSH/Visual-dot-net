<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Enquiry_List.aspx.cs" Inherits="Admin_Enquiry_List" MasterPageFile="~/Admin/AdminMasterPage.master"  %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Enquiry
</div>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%">
            <tr>
                 <td width="100%">
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                        <tr>
                            <td class="cellhead" align="center" width="100%" style="height:18px">
                                 <table width="100%">
                                     <tr>
                                     <td class="cellhead" align="left" width="55%" height="18" >
                                        <b><span class="heading"></span></b>
                                    </td>
                                    <td class="cellhead" align="right" width="45%" height="18" >
                                        <b><span class="fieldText">Status</span></b>
                                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                            <asp:ListItem Text="Pending" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Replyed" Value="1" ></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                     </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td  align="center" valign="top" class="grid" width="100%" height="225" colspan="2">
                                <asp:DataGrid ID="grdEnquiry" Runat="server" DataKeyField="ID" AutoGenerateColumns="false" OnDeleteCommand="MyDataGrid_Delete" Width="100%"
                                AllowPaging="True" AllowCustomPaging="true" PageSize="10" PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right"
                                PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" OnPageIndexChanged="MyDataGrid_Page"  Font-Name="Verdana">
				                    
                                    <ItemStyle BackColor="#FFC0C0" />                                        
                                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                    <HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" Font-Bold="True" VerticalAlign="Middle"></HeaderStyle>
                                    <AlternatingItemStyle BackColor="#FFE0C0" />
                                    
                                     <Columns>
                                        <asp:TemplateColumn HeaderText="S.No." SortExpression="ID" ItemStyle-Width="12" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ID") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Name" SortExpression="Name"  ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        
                                        
                                        <asp:TemplateColumn HeaderText="Subject" SortExpression="Subject"  ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Subject") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="IsReplied" SortExpression="IsReplied" ItemStyle-Width="12" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "IsReplied")%>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                       
                                       
                                       <asp:TemplateColumn HeaderText="" SortExpression="" ItemStyle-Width="12">
                                        <ItemTemplate>
                                             <asp:Button ID="btnReply" runat="server" Text="Reply" OnClick="btnReply_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'/>
                                            
                                        </ItemTemplate>
                                       </asp:TemplateColumn>
                                       <asp:TemplateColumn HeaderText="" SortExpression="" ItemStyle-Width="12">
                                        <ItemTemplate>
                                             <asp:Button ID="btnDetails" runat="server" Text="Details" OnClick="btnDetails_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>'/>
                                        </ItemTemplate>
                                       </asp:TemplateColumn>
                                      
                                       <asp:ButtonColumn Text="Delete" CommandName="Delete" ItemStyle-Width="14"></asp:ButtonColumn>
                                       
                                     </Columns>
				                </asp:DataGrid>
                            </td>
                        </tr>
                     </tbody>
                  </table> 
                </td> 
            </tr>
        </table>
        <asp:label ID="intCurrIndex" Visible="false" Runat="server"></asp:label>
    </asp:Content>

