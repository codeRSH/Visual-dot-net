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

public partial class forgotpwd : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        imgproceed.Attributes.Add("onClick", "return CheckForm();");
    }
    protected void imgproceed_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataReader dr;
        dr = RunSqlReturnDR("Select User_Name,Password from MI_MGV_registrationDetails where Email = '" + txtEmail.Text.ToString().Trim() + "'");
        string password = "";
        string userid = "";
        if (dr.Read())
        {
            password = dr["Password"].ToString();
            userid = dr["User_Name"].ToString();
            
        }
        else
        {
            lblerrormsg.Text = "* This Mail ID does not exist!";
            return;
        }
        string strbody = "Thank you for using 4.com.<br><br> Your User ID :" + userid + " and <br> Password : " + password;
        SendMail("info@myrightvision.com", txtEmail.Text.Trim(), "Password Reminder", strbody);
        Response.Redirect("Thanks.aspx");
    }
}
