<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="Heading">
                                    Products
                                </div>
        <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                       
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="400" valign="top" align="center" class="grid">
                                <asp:GridView AlternatingRowStyle-BackColor="black" BorderColor="Aqua" GridLines="Both" HeaderStyle-BackColor="ActiveBorder"  AutoGenerateColumns="false" ID="gvproducts" runat="server" OnRowDataBound="sno" Width="622px" >
                                    <Columns>  
                                        <asp:BoundField HeaderText="Sno" />                                        
                                        <asp:BoundField HeaderText="Product Code" DataField="Product_Code"/>                                        
                                        <asp:HyperLinkField HeaderText="Product Name" DataTextField="Product_Name" DataNavigateUrlFields="Product_Code" DataNavigateUrlFormatString="Product_Details.aspx?Product_Code={0}" />                                        
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Image
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <img src ="<%#DataBinder.Eval(Container.DataItem,"Image_name")%>" alt="" width="100" height="70" />                                               
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                        <asp:BoundField HeaderText="Price" DataField="Price" />
                                        <asp:BoundField HeaderText="Unit" DataField="Unit" />
                                        <asp:BoundField HeaderText="Pair Rate" DataField="Pair_Rate" />                                                                                                                                                                                                                                                                                                                       
                                    </Columns>
                                    <HeaderStyle BackColor="ActiveBorder" />
                                    <AlternatingRowStyle BackColor="Beige" />
                                   </asp:GridView>                               
                            </td>
                        </tr>                        
                     </tbody>
                   </table>
                </td>
             </tr>
          </table>
     </asp:Content>