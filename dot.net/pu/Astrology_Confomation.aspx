<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Astrology_Confomation, App_Web_-p6c43jy" title="Micro Infoware::Conformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="Heading">
    Conformation
</div>
<div style="width:100%;background: url(Images/man-astrology.jpg) no-repeat; height:450px">
<br />
<br />
<br />
<br />
<table border="0" cellpadding="2" cellspacing="3"  align="center"  width="90%" >
            <tr>
                 <td style="width: 79%">
                  
                  
                  <table class="celltable" border="0"  style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellspacing="5" cellpadding="5" width="100%" >
                    <tbody>
                        
                       <tr>
                            <td   width="100%" height="30" colspan="2">
                                
                            </td>
                        </tr>
                        <tr>
                            <td  align="center" style="text-align:left" width="40%" height="22">
                               <b><asp:Label ID="lblMessage" runat="server" Font-Size="Medium" ForeColor="White"  ></asp:Label></b>
                            </td>
                        </tr>
                       
                          <tr>
                            <td width="100%"  style="height: 20px;text-align:left">
                            <asp:Label ID="Userid" runat="server"  Font-Size="small" ForeColor="maroon" ></asp:Label><br />
                           <asp:Label ID="Password" runat="server" Font-Size="small" ForeColor="maroon"  ></asp:Label><br />
                            </td>
                        </tr>
                        
                     </tbody>
                  </table>
                               
                </td> 
            </tr>
        </table>
<table width="100%">
   
    <tr>
     <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    
    
    
    <tr>

    <td align="center" style="color:gold; font-family:Bookman Old Style, Verdana; font-size:40px">
        Have a great day!
    </td>
</tr>

</table>
</div>
</asp:Content>

