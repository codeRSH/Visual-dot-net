<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Micro Infoware::AdminLogin</title>
    <link href="../CSS/v4.css" type="text/css" rel="stylesheet" />
    <link href="../CSS/Ssheet.css" rel="stylesheet" type="text/css" />
    <link id="LinkCSS" runat="server" type="text/css" rel="stylesheet" />
    <script language ="javascript" type="text/javascript">
        function isValidAdmin()
        {
            var strUserName;
            var StrPassword;
            strUserName=document.getElementById("txtUserName").value;
            StrPassword=document.getElementById("txtPassword").value;
            if(strUserName=="")
            {
            alert("UserName should not be empty");
            document.getElementById("txtUserName").focus();
            return false;
            }
            else if(StrPassword=="")
            {
                alert("Password should not be empty");
                document.getElementById("txtPassword").focus();
                return false;
            }
            return true;
        }
        
        function SetFocus()
        {
            document.getElementById("txtUserName").focus();
        }
    </script>
</head>
<body onload="SetFocus()">
    <form id="form1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <table cellpadding="0" cellspacing="0" border="0" id="page" >
	<tr><td>
	<div id="main">
		<div id="head">
			<div class="div2"><img src="../Images/logo.gif" alt="Z-Rox" height="135" /></div>
			<div class="div2">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="135" height="135">
      				<param name="movie" value="../Images/h_gl.swf" />
					<param name="wmode" value="transparent" />
      				<param name="quality" value="high" />
      				<embed src="../Images/h_gl.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="135" height="135" wmode="transparent">
					</embed>
    			</object>
			</div>
			<div class="div2"><img src="../Images/Internet.gif" alt="Z-Rox" height="135" /></div>
			<div class="div3" style="padding-right:10px;">
				<div><img src="../Images/dtyd.gif" alt="Z-Rox" height="105" /></div><br />
				<div>
					<a href="../default.aspx"><img src="../Images/home_ic.gif" border="0" alt="" /> Home
					</a>
				</div>
			</div>
		</div>
	</div>
	<div style="position:relative;float:left;width:100%;">
 <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
 <tr >
                <td  height="90px" align="center" valign="bottom" class="headline_page">
                   <h1> Administrator Login</h1>
                </td>
              </tr>
  <tr>
    <td valign="top" height="300px">
        <table cellspacing="0" style="border:#8987aa 3px double;" cellpadding="0" width="35%" border="0" align="center">
            <tbody>
              
              <tr height="40">
                <td  align="center" class="adminDefaultlbl" colspan="2">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
              </tr>
              <tr height="30">
                <td width="45%" align="right" class="fieldText">
                    User Name 
                </td>
                <td width="55%" align="left" class="frmFieldsValue">
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" Width="150"></asp:TextBox>
                </td>
              </tr>
              <tr height="30">
                <td width="45%" align="right" class="fieldText">
                    Password 
                </td>
                <td width="55%" align="left" class="frmFieldsValue">
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" MaxLength="20" Width="150" ></asp:TextBox>
                    
                </td>
              </tr>
              <tr height="30" valign="middle">
                <td width="45%" align="right" class="fieldText">
                  
                </td>
                <td width="55%" align="left">
                     <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
              </tr>
            </tbody>
        </table>  
      </td>
        
    </tr>
 
  </table>
    </div>
	<div id="foot">
		Copyright &copy; All rights reserved : Micro Infoware 2009 
		
	</div></td></tr></table>
    
    </form>
</body>
</html>



