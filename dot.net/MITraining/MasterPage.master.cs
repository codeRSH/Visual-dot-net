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

public partial class MasterPage : System.Web.UI.MasterPage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        //Session["UserID"] = "";
        
        
        /* if (Session["UserID"].ToString() != "")
        {
            //tdlogin.Visible = false;
            //tdnologin.Visible = true;
            //SqlDataReader MI_MGV_drMemberName = obj.RunSqlReturnDR("Select Name,Color_Theme from MI_MGV_RegistrationDetails where RegistrationNo='" + Session["UserID"].ToString()  + "'");
            //MI_MGV_drMemberName.Read();
            //lbluser.Text = "Welcome" + " " +MI_MGV_drMemberName["Name"] + " (" + Session["UserID"].ToString()+")";
            //LinkCSS.Href = "CSS/" + MI_MGV_drMemberName["Color_Theme"].ToString() + ".css";
        }
        else
        {
            //tdlogin.Visible = true;
            //tdnologin.Visible = false;
            //LinkCSS.Href = "CSS/Style.css";
        }
        if (!this.IsPostBack)
        {

            SqlDataReader MI_MGV_drTHEME = obj.RunSqlReturnDR("Select SNO,Theme_Name from MI_MGV_theme");
            //if(drTHEME.Read())
            //{
                ddlTheme.DataValueField = "SNO";
                ddlTheme.DataTextField = "Theme_Name";
                ddlTheme.DataSource = MI_MGV_drTHEME;
                ddlTheme.DataBind();
                MI_MGV_drTHEME.Close();
                MI_MGV_drTHEME = null;
            //}

        }*/
       
    }
  
    /*protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string CurrentCSS = 
        LinkCSS.Href = "CSS/" + ddlTheme.SelectedItem.Text.ToString() + ".css";
        if (Session["UserID"].ToString() != "")
        {
            obj.RunSql("update MI_MGV_RegistrationDetails set color_theme='" + ddlTheme.SelectedItem.ToString() + "' where RegistrationNo='" + Session["UserID"].ToString() + "'");
        }
    }
    protected void btnlogin_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            SqlDataReader MI_MGV_drCheckLogin = obj.RunSqlReturnDR("select RegistrationNo from MI_MGV_registrationDetails where User_name='" + txtUserName.Text.Trim() + "' and Password='" + txtPassword.Text.Trim() + "'");
            if (MI_MGV_drCheckLogin.HasRows)
            {
                MI_MGV_drCheckLogin.Read();
                Session["UserID"] = MI_MGV_drCheckLogin["RegistrationNo"].ToString();
                MI_MGV_drCheckLogin.Close();
                MI_MGV_drCheckLogin = null;
                if (Session["UserID"].ToString() != "")
                {
                    obj.RunSql("update MI_MGV_RegistrationDetails set last_Updated='" + DateTime.Today.ToShortDateString() + "' where RegistrationNo='" + Session["UserID"].ToString() + "'");
                }
                Response.Redirect("User_Menu.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }*/
    
    protected void btt1_Click(object sender, EventArgs e)
    {
        CommonClass obj = new CommonClass();

        try
        {
            SqlDataReader MI_MGV_drCheckLogin = obj.RunSqlReturnDR("select RegistrationNo from MI_MGV_registrationDetails where User_name='" + txtuserid.Text.Trim() + "' and Password='" + txtpassword.Text.Trim() + "'");
            if (MI_MGV_drCheckLogin.HasRows)
            {
                MI_MGV_drCheckLogin.Read();
                Session["UserID"] = MI_MGV_drCheckLogin["RegistrationNo"].ToString();
                MI_MGV_drCheckLogin.Close();
                MI_MGV_drCheckLogin = null;
                //Response.Redirect("Tree_Display.aspx");
                Response.Redirect("WelcomeLetter.aspx");
            }
            else
            {
                //Response.Write("Incorrect User ID or Password!");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}
