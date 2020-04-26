using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_Admin_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnRegMember_Click(object sender, EventArgs e)
    {
        Response.Redirect("User_Profile.aspx");
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnEnquiry_Click(object sender, EventArgs e)
    {
        Response.Redirect("Enquiry_List.aspx");
    }
    protected void btnMail_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Mail.aspx");
    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Change_Password.aspx");
    }
    protected void btnProducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Products.aspx");
    }
    protected void btnSetPersentage_Click(object sender, EventArgs e)
    {
        Response.Redirect("set_Rate.aspx");
    }
}
