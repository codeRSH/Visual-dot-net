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

public partial class ChangeChequeName : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onClick", "return checkValid();");
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
            try
            {
                DataView MI_MGV_dvRegno = RunSQLReturnDV("select ID,RegistrationNo from MI_MGV_registrationDetails");
                if (MI_MGV_dvRegno.Count > 0)
                {
                    ddlEmployee.DataSource = MI_MGV_dvRegno;
                    ddlEmployee.DataTextField = "RegistrationNo";
                    ddlEmployee.DataValueField = "ID";
                    ddlEmployee.DataBind();
                    ddlEmployee.Items.Insert(0, "--Select--");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlDataReader MI_MGV_drEmployee = RunSqlReturnDR("select Cheque_Name,Cheque_Relation from MI_MGV_registrationDetails where ID=" + ddlEmployee.SelectedValue + "");
            if (MI_MGV_drEmployee.Read())
            {
                txtname.Text = MI_MGV_drEmployee["Cheque_Name"].ToString();
                txtRelation.Text = MI_MGV_drEmployee["Cheque_Relation"].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int objUpdated = 0;
            objUpdated = RunSql("update MI_MGV_registrationDetails set Cheque_Name='" + txtname.Text.Trim() + "',Cheque_Relation ='" + txtRelation.Text.Trim() + "' " +
                "where ID=" + ddlEmployee.SelectedValue + "");
            if (objUpdated > 0)
            {
                Response.Redirect("Thanks.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
