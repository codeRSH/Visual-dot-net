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

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    CommonClass obj = new CommonClass();
    protected void Page_Load(object sender, EventArgs e)
    {
       /* if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            try
            {
                LinkCSS.Href = "../CSS/Style.css";
                lbluser.Text = Session["AdminID"].ToString();
                SqlDataReader MI_MGV_drTHEME = obj.RunSqlReturnDR("Select SNO,Theme_Name from MI_MGV_theme");
                ddlTheme.DataValueField = "SNO";
                ddlTheme.DataTextField = "Theme_Name";
                ddlTheme.DataSource = MI_MGV_drTHEME;
                ddlTheme.DataBind();
                MI_MGV_drTHEME.Close();
                MI_MGV_drTHEME = null;
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
       
        }*/
    }
    protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string CurrentCSS = 
     //   LinkCSS.Href = "../CSS/" + ddlTheme.SelectedItem.Text.ToString() + ".css";
    }
}
