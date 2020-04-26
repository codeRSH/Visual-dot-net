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
public partial class WelcomeLetter :CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            SqlDataReader MI_MGV_drwelcome = RunSqlReturnDR("select Name,RegistrationNo from MI_MGV_registrationDetails Where RegistrationNo = '" + Session["UserID"] + "'");
            if (MI_MGV_drwelcome.Read())
            {

                lb1name.Text = MI_MGV_drwelcome["Name"].ToString();
                lblRegno.Text = MI_MGV_drwelcome["RegistrationNo"].ToString();
            }
            
        }
    }
}
