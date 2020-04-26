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

public partial class Changepassword : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("OnClick", "return CheckValidation();");
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            RunSql("update MI_MGV_registrationDetails set Password= '" + txtNewPassword.Text.Trim() + "' where Password='" + txtPassword.Text.Trim() + "' and RegistrationNo='" + Session["UserID"].ToString() + "'");
            Session["Message"] = "password has been changed successfully !";
            Response.Redirect("Thanks.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
