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

public partial class User_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "" || Session["UserID"]==null)
        {
            Response.Redirect("Login.aspx");
        }
       
    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["UserID"] = "";
        Response.Redirect("Login.aspx");
    }
    protected void btnViewProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewProfile.aspx");
    }
    
    protected void btnPayment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
    protected void btnBinaryDisplay_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tree_Display.aspx");
    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Changepassword.aspx");
    }
    protected void btnNode_Click(object sender, EventArgs e)
    {
        Response.Redirect("LeftRightnodes.aspx");        
    }
    protected void btnWelcomeLetter_Click(object sender, EventArgs e)
    {
        Response.Redirect("WelcomeLetter.aspx");
    }
}
