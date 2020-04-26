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

public partial class Admin_Admin_Welcome : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
        if (!this.IsPostBack)
        {
            try
            {
                SqlConnection cn = OpenConnection();
                SqlCommand cmd = new SqlCommand("TotalMembers_EnquiryPending", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter PramTotalMembers = new SqlParameter("@intTotalMembers", SqlDbType.Int);
                SqlParameter PramEnquiryPending = new SqlParameter("@intEnquiryPending", SqlDbType.Int);
                PramTotalMembers.Direction = ParameterDirection.Output;
                PramEnquiryPending.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(PramTotalMembers);
                cmd.Parameters.Add(PramEnquiryPending);
                cmd.ExecuteNonQuery();
                lblTotalMembers.Text = PramTotalMembers.Value.ToString();
                lblEnquiryPending.Text = PramEnquiryPending.Value.ToString();
                cmd.Dispose();
                CloseConnection(cn);
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}
