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
public partial class Admin_Enq_details : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
    }

    public void reply(object s, EventArgs e)
    {
        CommonClass cn = new CommonClass();
        SqlDataReader dr = cn.RunSqlReturnDR("select * from MI_MGV_Enquiry where id='" + Session["detail"] + "'");
        dr.Read();

        if (Convert.ToInt32(dr["IsReplied"]) == 1)
        {
            Label1.Visible = true;
            Label1.Text = "Already Replied.....";
            return;
        }
        else
        {
            Response.Redirect("Admin_Mail.aspx");
        }


    }
   
}
