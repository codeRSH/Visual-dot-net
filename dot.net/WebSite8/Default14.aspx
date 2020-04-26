<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default14.aspx.cs" Inherits="Default14" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table style="width: 606px; position: static; height: 1px">
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bgn.png); height: 21px; background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Regitration Form" ForeColor="White"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 10px;">
            </td>
            <td style="width: 100px; height: 10px;">
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label2" runat="server" Text="Parent ID"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                    ErrorMessage="Parent ID required" Width="148px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label3" runat="server" Text="Referer ID"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server" Width="144px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="Referer ID required" Width="127px"></asp:RequiredFieldValidator>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label4" runat="server" Text="Node"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>..Select Node...</asp:ListItem>
                    <asp:ListItem>Left Child</asp:ListItem>
                    <asp:ListItem>Right Child</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1"
                    Display="Dynamic" ErrorMessage="Node required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 21px">
                <asp:Label ID="Label5" runat="server" Text="Product"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>...Select Product...</asp:ListItem>
                    <asp:ListItem>Product 1</asp:ListItem>
                    <asp:ListItem>Product 2</asp:ListItem>
                    <asp:ListItem>Product 3</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2"
                    Display="Dynamic" ErrorMessage="Product required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); height: 21px; background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Larger" Text="Personal Information"
                    Width="172px" ForeColor="White"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 21px">
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 119px; height: 21px">
                <asp:Label ID="Label7" runat="server" Text="Title"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                &nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>...Title...</asp:ListItem>
                    <asp:ListItem>Mr.</asp:ListItem>
                    <asp:ListItem>Miss</asp:ListItem>
                    <asp:ListItem>Mrs.</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList3"
                    Display="Dynamic" ErrorMessage="Title required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label8" runat="server" Text="Name"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                    Display="Dynamic" ErrorMessage="Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label9" runat="server" Text="Father/Husband"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7"
                    Display="Dynamic" ErrorMessage="Father/Husband Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Date Of Birth" Width="104px"></asp:Label></td>
            <td style="width: 100px; height: 26px">
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:DropDownList ID="DropDownList10" runat="server">
                                <asp:ListItem>...Date...</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                <asp:DropDownList ID="DropDownList11" runat="server">
                    <asp:ListItem>...Month...</asp:ListItem>
                    <asp:ListItem>jan</asp:ListItem>
                    <asp:ListItem>feb</asp:ListItem>
                    <asp:ListItem>mar</asp:ListItem>
                    <asp:ListItem>Apr</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>Jun</asp:ListItem>
                    <asp:ListItem>Jul</asp:ListItem>
                    <asp:ListItem>Aug</asp:ListItem>
                    <asp:ListItem>Sep</asp:ListItem>
                    <asp:ListItem>Oct</asp:ListItem>
                    <asp:ListItem>Nov</asp:ListItem>
                    <asp:ListItem>Dec</asp:ListItem>
                </asp:DropDownList>
                        </td>
                        <td>
                <asp:DropDownList ID="DropDownList12" runat="server">
                    <asp:ListItem>...Year...</asp:ListItem>
                    <asp:ListItem>1965</asp:ListItem>
                    <asp:ListItem>1966</asp:ListItem>
                    <asp:ListItem>1967</asp:ListItem>
                    <asp:ListItem>1968</asp:ListItem>
                    <asp:ListItem>1969</asp:ListItem>
                    <asp:ListItem>1970</asp:ListItem>
                    <asp:ListItem>1971</asp:ListItem>
                    <asp:ListItem>1972</asp:ListItem>
                    <asp:ListItem>1973</asp:ListItem>
                    <asp:ListItem>1974</asp:ListItem>
                    <asp:ListItem>1975</asp:ListItem>
                    <asp:ListItem>1976</asp:ListItem>
                    <asp:ListItem>1977</asp:ListItem>
                    <asp:ListItem>1978</asp:ListItem>
                    <asp:ListItem>1979</asp:ListItem>
                    <asp:ListItem>1980</asp:ListItem>
                    <asp:ListItem>1981</asp:ListItem>
                    <asp:ListItem>1982</asp:ListItem>
                    <asp:ListItem>1983</asp:ListItem>
                    <asp:ListItem>1984</asp:ListItem>
                    <asp:ListItem>1985</asp:ListItem>
                    <asp:ListItem>1986</asp:ListItem>
                    <asp:ListItem>1987</asp:ListItem>
                    <asp:ListItem>1988</asp:ListItem>
                    <asp:ListItem>1989</asp:ListItem>
                    <asp:ListItem>1990</asp:ListItem>
                    <asp:ListItem>1991</asp:ListItem>
                </asp:DropDownList>
                            
                        </td>
                    </tr>
                </table>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                ControlToValidate="DropDownList10" Display="Dynamic" 
                                ErrorMessage="date required"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                    ControlToValidate="DropDownList11" ErrorMessage="month required"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                    ControlToValidate="DropDownList12" Display="Dynamic" 
                    ErrorMessage="Year required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label11" runat="server" Text="Marital Status" Width="99px"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList7" runat="server">
                    <asp:ListItem>...Status...</asp:ListItem>
                    <asp:ListItem>married</asp:ListItem>
                    <asp:ListItem>Unmarried</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 21px">
                <asp:Label ID="Label12" runat="server" Text="Address"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox10"
                    Display="Dynamic" ErrorMessage="Address required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 26px">
                <asp:Label ID="Label13" runat="server" Text="Town/City"></asp:Label></td>
            <td style="width: 100px; height: 26px">
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox11"
                    Display="Dynamic" ErrorMessage="Town/City Required"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 45px;">
                <asp:Label ID="Label14" runat="server" Text="State"></asp:Label></td>
            <td style="width: 100px; height: 45px;">
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox12"
                    Display="Dynamic" ErrorMessage="State required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label15" runat="server" Text="Country"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem>...Country...</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>Argentina</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>Norway</asp:ListItem>
                    <asp:ListItem>France</asp:ListItem>
                    <asp:ListItem>Germany</asp:ListItem>
                    <asp:ListItem>Sweden</asp:ListItem>
                    <asp:ListItem>Afganistan</asp:ListItem>
                    <asp:ListItem>Iran</asp:ListItem>
                    <asp:ListItem>Japan</asp:ListItem>
                    <asp:ListItem>Iraq</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                    <asp:ListItem>Italy</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>Mongolia</asp:ListItem>
                    <asp:ListItem>Kenya</asp:ListItem>
                    <asp:ListItem>Vietnam</asp:ListItem>
                    <asp:ListItem>Sri Lanka</asp:ListItem>
                    <asp:ListItem>Combodia</asp:ListItem>
                    <asp:ListItem>Russia</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DropDownList4"
                    Display="Dynamic" ErrorMessage="Country required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label16" runat="server" Text="Nationality"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox14" runat="server" Width="128px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox14"
                    Display="Dynamic" ErrorMessage="Nationality Required"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label17" runat="server" Text="Pin Code"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox15"
                    Display="Dynamic" ErrorMessage="Pin Code required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label18" runat="server" Text="Phone"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox16"
                    Display="Dynamic" ErrorMessage="Phone No. required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label19" runat="server" Text="Mobile Phone" Width="96px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox17"
                    Display="Dynamic" ErrorMessage="Mobile required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label20" runat="server" Text="E-mail"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox18"
                    Display="Dynamic" ErrorMessage="Email-ID required" Width="127px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox18" Display="Dynamic" ErrorMessage="invalid Email" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Larger" Text="Cheque Details"
                    Width="135px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label22" runat="server" Text="In Favour Of" Width="83px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox19"
                    Display="Dynamic" ErrorMessage="Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label23" runat="server" Text="Relation"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox20"
                    Display="Dynamic" ErrorMessage="Relation required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Larger" Text="Nomination Details"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label25" runat="server" Text="Site Transfer Nominee" Width="149px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox25"
                    Display="Dynamic" ErrorMessage="Nominee required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label26" runat="server" Text="Relation"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="TextBox26"
                    Display="Dynamic" ErrorMessage="Relation required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); height: 21px; background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label27"
                    runat="server" Font-Bold="True" Font-Size="Larger" Text="Security Information" ForeColor="White"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label28" runat="server" Text="User name"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="TextBox21"
                    Display="Dynamic" ErrorMessage="User Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label29" runat="server" Text="Password"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label30" runat="server" Text="Hint Question" Width="96px"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList8" runat="server">
                    <asp:ListItem>...Question...</asp:ListItem>
                    <asp:ListItem>what is ur first school name</asp:ListItem>
                    <asp:ListItem>what is ur phone no.</asp:ListItem>
                    <asp:ListItem>what is ur university name</asp:ListItem>
                    <asp:ListItem>What is ur pet's name</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="DropDownList8"
                    Display="Dynamic" ErrorMessage="Hint Question required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
                <asp:Label ID="Label31" runat="server" Text="Hint Answer" Width="103px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="TextBox24"
                    Display="Dynamic" ErrorMessage="Hint Answer required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); background-color: royalblue;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="Larger" Text="Customer Declaration" ForeColor="White"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 119px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 119px; height: 37px">
                <asp:Label ID="Label33" runat="server" Text="Terms And Conditions" Width="175px"></asp:Label></td>
            <td style="width: 100px; height: 37px">
                <span><asp:CheckBox ID="CheckBox1" runat="server" Text=" " OnCheckedChanged="CheckBox1_CheckedChanged" />I
                    agree to the terms and conditions. Click here to see the <a href="#" target="_blank">
                        <strong>Terms </strong></a>
                    </span></td>
        </tr>
        <tr>
            <td style="width: 119px; height: 21px">
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 21px">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/bluebttn.gif"
                    OnClick="ImageButton1_Click" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
