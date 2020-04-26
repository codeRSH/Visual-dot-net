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

public partial class Admin_Admin_Mail : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {

        btnSend.Attributes.Add("onClick", "return checkForm();");
        if (!this.IsPostBack)
        {
            if (Session["reply"].ToString() != "")
            {
                FillValues();
            }
            else
            {

            }
        }
    }


    

   
    protected void btnSend_Click1(object sender, EventArgs e)
    {
        try
        {
            CommonClass cm = new CommonClass();
            Session["Message"] = "";
            Session["Message"] = "your mail has been successfully send to " + txtTo.Text;
            string strMailFrom = ConfigurationManager.AppSettings["MailFrom"];
            cm.SendMail(strMailFrom, txtTo.Text, txtSubject.Text, txtMessage.Text);
            if (Session["reply"].ToString() != "")
                cm.RunSql("update MI_MGV_Enquiry set IsReplied=1 where id=" + Session["reply"] + "");
           
            Session["reply"] = "";
            Response.Redirect("Admin_Conformation.aspx");
        }
        catch { }
    }


    public void FillValues()
    {

        try
        {
            CommonClass cm = new CommonClass();
            string strcom = "select * from MI_MGV_Enquiry where id=" + Session["reply"] + "";
            SqlDataReader dr = cm.RunSqlReturnDR(strcom);
            if (dr.HasRows)
            {
                dr.Read();
                txtTo.Text = dr["email"].ToString();
                txtSubject.Text = "Re : " + dr["subject"].ToString();


            }
        }
        catch { }


    }
}
