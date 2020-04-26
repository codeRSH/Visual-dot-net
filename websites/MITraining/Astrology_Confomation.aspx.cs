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
public partial class Astrology_Confomation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                CommonClass cm = new CommonClass();
                lblMessage.Text = " YOU HAVE SUCESSFULLY SUBMITTED YOUR INFORMATION.<br/> <br><br> 'Within 24-48 hours time you will receive an email directly from me, titled Your Free Reading from ZRox'which will contain your complete Free Astrological Reading.: ";

                TextBox txmail = (TextBox)PreviousPage.FindControl("txtEmail");
                CommonClass mail = new CommonClass();


                if (txmail != null && txmail.Text != "")
                {
                    string to = txmail.Text.ToString();
                    string msg = "Welcome";
                    mail.SendMail("info@rmcvision.com", to, "Welcome in ZROX", msg);
                }
            }
            catch (Exception ex)
            {

                //Response.Redirect("Astrology_Confomation.aspx");
            }

        }
    }
}
