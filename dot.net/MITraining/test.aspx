<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <asp:Button ID="btntest" Text="Get Date" runat="server" OnClick="btntest_Click" /><br /><br />
        <asp:Label ID="lbldate" runat="server" ></asp:Label>
        <a href="mailto:">click here</a>
    </div>
    </form>
</body>
</html>
