<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Profile.aspx.cs" Inherits="Admin_User_Profile" MasterPageFile="~/Admin/AdminMasterPage.master" %>


<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Heading">Registered Members</div>


<div style="position:relative;float:left;width:100%">

 <asp:DataGrid ID="grdEmployee" CssClass="grid" Runat="server" DataKeyField="ID" AutoGenerateColumns="false" OnEditCommand="MyDataGrid_Edit" 
                                OnCancelCommand="MyDataGrid_Cancel" OnUpdateCommand="MyDataGrid_Update" AllowPaging="True" AllowCustomPaging="true" PageSize="10"
                                PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" PagerStyle-NextPageText="Next"
                                PagerStyle-PrevPageText="Prev" OnPageIndexChanged="MyDataGrid_Page"  Font-Name="Verdana" >
				                    
                                    <ItemStyle BackColor="#FFC0C0" />                                        
                                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                    <HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" Font-Bold="True" VerticalAlign="Middle"></HeaderStyle>
                                    <AlternatingItemStyle BackColor="#FFE0C0" />
                                    
                                     <Columns>
                                        <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" />
                                        <asp:TemplateColumn HeaderText="Registration No." SortExpression="RegistrationNo">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "RegistrationNo") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Reference By" SortExpression="ReferenceBy">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ReferenceBy") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Parent ID" SortExpression="ParentID">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "ParentID") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Left Child" SortExpression="LeftChildRegNo">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "LeftChildRegNo") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Right Child" SortExpression="RightChildRegNo">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "RightChildRegNo") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        
                                        <asp:TemplateColumn HeaderText="Is Active" SortExpression="IsActive">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "IsActive") %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
							                <asp:DropDownList ID="active" runat="server">
							                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
							                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
							                </asp:DropDownList>
						                </EditItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Details" SortExpression="Details">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDetails" runat="server" Text="Details"  OnClick="btnDetails_Click" CommandArgument=' <%# DataBinder.Eval(Container.DataItem, "RegistrationNo") %>'/>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                     </Columns>
				                </asp:DataGrid>

   <asp:label ID="intCurrIndex" Visible="false" Runat="server"></asp:label>

</div>

    
        
		
    </asp:Content>
