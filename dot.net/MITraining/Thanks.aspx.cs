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

public partial class Thanks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["From"] != null && Request.QueryString["From"].ToString() != "")
        {
            if (Request.QueryString["From"] == "join_now")
            {
                lblmsg.Text = "Thanks for joining 'MicroInfoware'. <br/>Please login to check your profile details.";
            }
            else
            {
                lblmsg.Text = "Your query has been sent successfully. We will contact you soon!";
            }
        }
    }
}
