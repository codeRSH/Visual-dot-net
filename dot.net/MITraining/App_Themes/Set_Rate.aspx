<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Set_Rate.aspx.cs" Inherits="Set_Rate" MasterPageFile="~/Admin/AdminMasterPage.master" %>

<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function ShowTrSave()
        {
            document.getElementById("ctl00_ContentPlaceHolder1_btnAdd").style.display="none";
            document.getElementById("ctl00_ContentPlaceHolder1_trSave").style.display="inline";
            document.getElementById("ctl00_ContentPlaceHolder1_txtRate_Type").focus();
            return false;
        }
        function ShowTrAdd()
        {
            document.getElementById("ctl00_ContentPlaceHolder1_btnAdd").style.display="inline";
            document.getElementById("ctl00_ContentPlaceHolder1_trSave").style.display="none";
            return false;
        }
        function CheckFields()
        {
            var strRate_Type;
            var intRate;
         
            strRate_Type=document.getElementById("ctl00_ContentPlaceHolder1_txtRate_Type").value;
            intRate=document.getElementById("ctl00_ContentPlaceHolder1_txtRate").value;
            document.getElementById("ctl00_ContentPlaceHolder1_lblMessage").title="";
           
            if(strRate_Type=="")
            {
                document.getElementById("ctl00_ContentPlaceHolder1_lblMessage").title="Rate Type Should not be empty";
                alert("Rate Type Should not be empty");
                 document.getElementById("ctl00_ContentPlaceHolder1_txtRate_Type").focus();
                return false;
            }
            else if(intRate=="")
            {
                document.getElementById("ctl00_ContentPlaceHolder1_lblMessage").title="Rate Should not be empty";
                 alert("Rate Should not be empty");
                  document.getElementById("ctl00_ContentPlaceHolder1_txtRate").focus();
                return false;
            }
            document.getElementById("ctl00_ContentPlaceHolder1_btnAdd").style.display="inline";
            document.getElementById("ctl00_ContentPlaceHolder1_trSave").style.display="none";
            return true;
        }
    </script>
     <table border="0" cellpadding="2" cellspacing="3" align="center" width="90%" style="background-color:Gray;">
            <tr>
                 <td width="100%">
                  
                  
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                        <tr>
                            <td class="cellhead" align="center" width="100%" height="22" colspan="2">
                                <b><span class="heading">Set Rates(in %)</span></b>
                            </td>
                        </tr>
                       <tr>
                            <td width="100%" height="150" colspan="2" align="center" valign="top">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                
                                    <tr>
                                        <td class="cellhead" align="center" valign="top" width="100%" height="22" >
                                            <asp:DataGrid ID="grdRate" Runat="server" Width="100%" DataKeyField="ID" AutoGenerateColumns="false" OnEditCommand="MyDataGrid_Edit" OnCancelCommand="MyDataGrid_Cancel"
				                             OnUpdateCommand="MyDataGrid_Update" OnDeleteCommand="MyDataGrid_Delete">
            				                    
                                                 <HeaderStyle BackColor="BurlyWood" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true" />
                                                 <Columns>
                                                    
                                                    <asp:TemplateColumn HeaderText="Rate Type" SortExpression="Rate_Type" ItemStyle-Width="40%">
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "Rate_Type")%>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
							                            <asp:TextBox ID="txtRate_Type" runat="server" Text='  <%# DataBinder.Eval(Container.DataItem, "Rate_Type")%>'> </asp:TextBox>
						                            </EditItemTemplate>
                                                    </asp:TemplateColumn>
                                                    
                                                    <asp:TemplateColumn HeaderText="Rate(%)" SortExpression="rate" ItemStyle-Width="40%">
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "rate") %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
							                             <asp:TextBox ID="txtRate" runat="server" Text='  <%# DataBinder.Eval(Container.DataItem, "rate")%>'></asp:TextBox>
						                            </EditItemTemplate>
                                                    </asp:TemplateColumn>
                                                   <asp:EditCommandColumn EditText="Edit" CancelText="Cancel" UpdateText="Update" ItemStyle-Wrap="false" ItemStyle-Width="20%" />
                                                  <asp:ButtonColumn Text="Delete" CommandName="Delete"></asp:ButtonColumn>
                                                   
                                                 </Columns>
				                            </asp:DataGrid>
                                        </td>
                                     </tr>
                                     
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                     </tbody>
                  </table>&nbsp; 
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tr id="trAdd" runat="server">
                        <td   align="center" valign="middle" width="100%" height="22"  >
                            <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="btnAdd_Click" />
                            <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr id="trSave" runat="server" >
                        <td align="center" valign="middle" width="100%" height="22"  >
                         Rate Type
                            &nbsp;&nbsp;<asp:TextBox id="txtRate_Type" runat="server"  ></asp:TextBox>&nbsp;&nbsp;
                          Rate
                            &nbsp;&nbsp; <asp:TextBox id="txtRate" runat="server"  ></asp:TextBox>&nbsp;&nbsp;
                            <asp:Button ID="btnSave" runat="server" Text="Add" OnClick="btnSave_Click"  />&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel"   />
                        </td>
                     </tr>
                  </table>
                </td> 
            </tr>
        </table>
    </asp:Content>

