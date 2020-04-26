<%@ page language="C#" autoeventwireup="true" inherits="Product_Details, App_Web_-p6c43jy" masterpagefile="~/MasterPage.master" %>


<asp:Content ID="TestMasterpageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div id="Heading" >
        Product Details
        </div>
        <table border="0" cellpadding="2" cellspacing="3" align="center" width="100%" >
            <tr>
                 <td width="100%" >
                    <table  class="celltable" style="BORDER-COLLAPSE: collapse" bordercolor="#111111"  cellspacing="0" cellpadding="0" width="100%" border="0">
                     <tbody>
                        
                        <tr>
                            <td class="pad1" height="500" valign="top" align="center">
                                
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td class="productanme">
                                            <asp:Label ID="lblProduct_name" runat="server" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheading">
                                            <asp:Label ID="lblsubheading" runat="server" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pad4">
                                            Price : <asp:Label ID="lblprice" runat="server" ></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            Unit : <asp:Label ID="lblsalespoint" runat="server" ></asp:Label><br /><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="imgProduct_image" runat="server" BorderStyle="solid" BorderWidth="4" BorderColor="Black" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="paratext">
                                            <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                        </tr>
                     </tbody>
                   </table>
                </td>
             </tr>
          </table>
    </asp:Content>