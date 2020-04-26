using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserID"] = "";
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataReader MI_MGV_drCheckLogin = RunSqlReturnDR("select RegistrationNo from MI_MGV_registrationDetails where User_name='" + txtuserid.Text.Trim() + "' and Password='" + txtpassword.Text.Trim() + "'");
            if (MI_MGV_drCheckLogin.HasRows)
            {
                MI_MGV_drCheckLogin.Read();
                Session["UserID"] = MI_MGV_drCheckLogin["RegistrationNo"].ToString();
                MI_MGV_drCheckLogin.Close();
                MI_MGV_drCheckLogin = null;
                //Response.Redirect("Tree_Display.aspx");
                Response.Redirect("User_Menu.aspx");
            }
            else
            {
                lblerrormsg.Text = "Incorrect User ID or Password!";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}
