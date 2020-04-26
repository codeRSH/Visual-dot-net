<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default12.aspx.cs" Inherits="Default12" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Untitled Page</title>
    <style type="text/css">
        #form1
        {
            height: 57px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
            Font-Underline="True" ForeColor="#0033CC" Text="WELCOME ADMINSTRATOR"></asp:Label>
    
    </div>
    <br />
    <br />
    <br />
&nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="Medium" Font-Underline="True" Text="COMPANY EMPLOYEEE"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ParentID" HeaderText="ParentID" 
                SortExpression="ParentID" />
            <asp:BoundField DataField="RefererID" HeaderText="RefererID" 
                SortExpression="RefererID" />
            <asp:BoundField DataField="name1" HeaderText="name1" SortExpression="name1" />
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="country" HeaderText="country" 
                SortExpression="country" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="pin" HeaderText="pin" SortExpression="pin" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Cheque_in_favour" HeaderText="Cheque_in_favour" 
                SortExpression="Cheque_in_favour" />
            <asp:BoundField DataField="username" HeaderText="username" 
                SortExpression="username" />
            <asp:BoundField DataField="password" HeaderText="password" 
                SortExpression="password" />
            <asp:BoundField DataField="Security_ques" HeaderText="Security_ques" 
                SortExpression="Security_ques" />
            <asp:BoundField DataField="answer" HeaderText="answer" 
                SortExpression="answer" />
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db1ConnectionString2 %>"
            SelectCommand="SELECT * FROM [join_now]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db1ConnectionString %>" 
        SelectCommand="SELECT * FROM [join_now]"></asp:SqlDataSource>
    </form>
</body>
</html>
