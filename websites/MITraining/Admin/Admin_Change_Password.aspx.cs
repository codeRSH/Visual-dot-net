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
using System.Data.SqlClient;

public partial class Admin_Admin_Change_Password : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("OnClick", "return CheckValidation();");
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
       
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        try
        {
            RunSP("ChangePassword", new SqlParameter("@NewPassword", txtNewPassword.Text.Trim()), new SqlParameter("@oldPassword", txtPassword.Text.Trim()), new SqlParameter("@Admin_Id", Session["AdminID"].ToString()));
            Session["Message"] = "password has been changed successfully !";
            Response.Redirect("Admin_Conformation.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
       
    }
}
