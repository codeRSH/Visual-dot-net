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

public partial class Enquiry : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btn.Attributes.Add("onClick", "return ValidateEnquiryForm();");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime edate = DateTime.Now;
            int objRowsAffected=0;
            objRowsAffected = RunSql("insert into MI_MGV_Enquiry(Name,Reg_No,phone_no,email,subject,enquiry,enq_date)" +
                   "values('" + txtname.Text.ToString() + "','" + txtregno.Text.ToString()+ "','" + txtphone.Text.ToString() + "'," +
                   "'" + txtemail.Text.ToString() + "','" + txtsubject.Text.ToString() + "','" + txtenquiry.Text.ToString() + "','"+edate+"')");
            if (objRowsAffected > 0)
            {
                Response.Redirect("Thanks.aspx?From=enquiry");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
