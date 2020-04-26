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

public partial class Admin_Default : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnLogin.Attributes.Add("OnClick", "return isValidAdmin();");
        LinkCSS.Href = "../CSS/Style.css";
        Session["AdminID"] = "";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            //SqlDataReader MI_MGV_drCheckLogin = RunSqlReturnDR("select Admin_ID,Admin_Password from MI_MGV_AdminLogin where Admin_ID='" + txtUserName.Text.Trim() + "' and Admin_Password='" + txtPassword.Text.Trim() + "'");
            SqlDataReader MI_MGV_drCheckLogin = RunSPReturnDR("CheckAdminLogin", new SqlParameter("@Admin_ID", txtUserName.Text.Trim()), new SqlParameter("@Admin_Password", txtPassword.Text.Trim()));
            if (MI_MGV_drCheckLogin.HasRows)
            {
                MI_MGV_drCheckLogin.Read();
                Session["AdminID"] = MI_MGV_drCheckLogin["Admin_ID"].ToString();
                MI_MGV_drCheckLogin.Close();
                MI_MGV_drCheckLogin = null;
                Response.Redirect("Admin_Welcome.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid UserName/Password";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    
}
