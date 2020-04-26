<%@ page language="C#" autoeventwireup="true" inherits="Admin_Admin_Products_List, App_Web_mb1_hneu" masterpagefile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">
Products List
</div>
     <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" >
            <tr>
                 <td width="100%">
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="0" cellpadding="0" width="100%" >
                    <tbody>
                       
                        <tr>
                            
                        </tr>
                        <tr>
                        <td class="grid" valign="top" >
                                <asp:GridView ID="gvproducts" CssClass="grid"  runat="server" AutoGenerateColumns="false" DataKeyNames="ID" OnRowEditing="gvproducts_RowEditing" OnRowCancelingEdit="gvproducts_RowCancelingEdit" OnRowDeleting="gvproducts_RowDeleting" OnRowUpdating="gvproducts_RowUpdating">
                                    <RowStyle BackColor="#FFC0C0" />                                        
                                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                    <HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" Font-Bold="True" VerticalAlign="Middle"></HeaderStyle>
                                    <AlternatingRowStyle BackColor="#FFE0C0" />
                                    <Columns>
                                        <asp:CommandField ShowCancelButton="true" ShowEditButton="true" ShowDeleteButton="true" />                                                                                    
                                        <asp:BoundField HeaderText="Code" DataField="Product_Code" ReadOnly="true"/>                                        
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Product_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Product_Name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                                <img src ='<%#DataBinder.Eval(Container.DataItem,"Image_name")%>' alt="" width="100" height="75" /> 
                                            </ItemTemplate>
                                            <EditItemTemplate>                                                
                                                <input type="file" id="updImage" name="updImage" runat="server" />                                                
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_title" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sub_heading") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_title" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sub_heading") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_desc" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_desc" runat="server" TextMode="multiLine" Rows="3" Text='<%# DataBinder.Eval(Container.DataItem, "Description") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_price" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_price" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_unit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_unit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Unit") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sales Point">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_sp" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sales_Point") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_sp" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sales_Point") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pair Rate">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_pr" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pair_rate") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_pr" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Pair_rate") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
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
