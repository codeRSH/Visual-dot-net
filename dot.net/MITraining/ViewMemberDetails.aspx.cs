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

public partial class ViewMemberDetails : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnClose.Attributes.Add("onClick","return CloseForm();");
        if (!this.IsPostBack)
        {
            if (Request.QueryString["registrationno"] != null)
            {
                SqlDataReader dr;
                dr = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo ='" + Request.QueryString["registrationno"].ToString() + "'");
                if(dr.Read())
                {
                    if (dr["RegistrationNo"].ToString() == Session["UserID"].ToString())
                    {
                        tdedit.Visible = true;
                        tdeditbar.Visible = true;
                    }
                    else
                    {
                        tdedit.Visible = false;
                        tdeditbar.Visible = false;
                    }

                    lblParentCode.Text  = dr["Parentid"].ToString();
                    lblRegistrationNumber.Text  = dr["RegistrationNo"].ToString();
                    lblFirstName.Text  = dr["Name"].ToString();
                    lblEmail.Text  = dr["Email"].ToString();
                    lblPassword.Text  = dr["Password"].ToString();

                    dr.Close();
                    dr = null;
                }
            }
        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {

    }
}
