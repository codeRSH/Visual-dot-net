<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 606px; position: static; height: 1px">
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bgn.png); height: 21px">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="Regitration Form"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 10px;">
            </td>
            <td style="width: 100px; height: 10px;">
            </td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label2" runat="server" Text="Parent ID"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic"
                    ErrorMessage="Parent ID required" Width="148px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label3" runat="server" Text="Referer ID"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox2" runat="server" Width="144px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="Referer ID required" Width="127px"></asp:RequiredFieldValidator>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label4" runat="server" Text="Node"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1"
                    Display="Dynamic" ErrorMessage="Node required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 21px">
                <asp:Label ID="Label5" runat="server" Text="Product"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                <asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2"
                    Display="Dynamic" ErrorMessage="Product required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); height: 21px">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Larger" Text="Personal Information"
                    Width="172px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 21px">
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 75px; height: 21px">
                <asp:Label ID="Label7" runat="server" Text="Title"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5"
                    Display="Dynamic" ErrorMessage="Title required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label8" runat="server" Text="Name"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                    Display="Dynamic" ErrorMessage="Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label9" runat="server" Text="Father/Husband"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7"
                    Display="Dynamic" ErrorMessage="Father/Husband Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Date Of Birth" Width="104px"></asp:Label></td>
            <td style="width: 100px; height: 26px">
                <asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>&nbsp;
                <asp:DropDownList ID="DropDownList6" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList5" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList3"
                    Display="Dynamic" ErrorMessage="Date Required" Width="127px"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownList6"
                    Display="Dynamic" ErrorMessage="Month required" Width="127px"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DropDownList5"
                    Display="Dynamic" ErrorMessage="Year required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label11" runat="server" Text="Marital Status" Width="99px"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList7" runat="server">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 21px">
                <asp:Label ID="Label12" runat="server" Text="Address"></asp:Label></td>
            <td style="width: 100px; height: 21px">
                <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox10"
                    Display="Dynamic" ErrorMessage="Address required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 26px">
                <asp:Label ID="Label13" runat="server" Text="Town/City"></asp:Label></td>
            <td style="width: 100px; height: 26px">
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 45px;">
                <asp:Label ID="Label14" runat="server" Text="State"></asp:Label></td>
            <td style="width: 100px; height: 45px;">
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox12"
                    Display="Dynamic" ErrorMessage="State required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label15" runat="server" Text="Country"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList4" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DropDownList4"
                    Display="Dynamic" ErrorMessage="Country required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label16" runat="server" Text="Nationality"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label17" runat="server" Text="Pin Code"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox15"
                    Display="Dynamic" ErrorMessage="Pin Code required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label18" runat="server" Text="Phone"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox16"
                    Display="Dynamic" ErrorMessage="Phone No. required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label19" runat="server" Text="Mobile Phone" Width="96px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox17"
                    Display="Dynamic" ErrorMessage="Mobile required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label20" runat="server" Text="E-mail"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox18"
                    Display="Dynamic" ErrorMessage="Email-ID required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png)">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Larger" Text="Cheque Details"
                    Width="135px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label22" runat="server" Text="In Favour Of" Width="83px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox19"
                    Display="Dynamic" ErrorMessage="Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label23" runat="server" Text="Relation"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox20"
                    Display="Dynamic" ErrorMessage="Relation required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png)">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="Larger" Text="Nomination Details"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label25" runat="server" Text="Site Transfer Nominee" Width="149px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox25"
                    Display="Dynamic" ErrorMessage="Nominee required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label26" runat="server" Text="Relation"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="TextBox26"
                    Display="Dynamic" ErrorMessage="Relation required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png); height: 21px">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="Label27"
                    runat="server" Font-Bold="True" Font-Size="Larger" Text="Security Information"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label28" runat="server" Text="User name"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="TextBox21"
                    Display="Dynamic" ErrorMessage="User Name required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label29" runat="server" Text="Password"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox22" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="TextBox22"
                    Display="Dynamic" ErrorMessage="Password required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label30" runat="server" Text="Hint Question" Width="96px"></asp:Label></td>
            <td style="width: 100px">
                <asp:DropDownList ID="DropDownList8" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="DropDownList8"
                    Display="Dynamic" ErrorMessage="Hint Question required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
                <asp:Label ID="Label31" runat="server" Text="Hint Answer" Width="103px"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="TextBox24"
                    Display="Dynamic" ErrorMessage="Hint Answer required" Width="127px"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(Images/H_bg1n.png)">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label32" runat="server" Font-Bold="True" Font-Size="Larger" Text="Customer Declaration"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 75px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 75px; height: 37px">
                <asp:Label ID="Label33" runat="server" Text="Terms And Conditions" Width="175px"></asp:Label></td>
            <td style="width: 100px; height: 37px">
                <span><asp:CheckBox ID="CheckBox1" runat="server" />I
                    agree to the terms and conditions. Click here to see the <a href="#" target="_blank">
                        <strong>Terms </strong></a>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="TextBox5"
                        Display="Dynamic" ErrorMessage="Check Box should be selected" Width="127px"></asp:RequiredFieldValidator></span></td>
        </tr>
        <tr>
            <td style="width: 75px; height: 21px">
            </td>
            <td style="width: 100px; height: 21px">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 21px">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Submit" /></td>
        </tr>
    </table>
</asp:Content>

