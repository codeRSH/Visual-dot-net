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

public partial class Admin_User_Profile : CommonClass 
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
                intCurrIndex.Text = Convert.ToString(grdEmployee.CurrentPageIndex);
                // DataView Dv = RunSQLReturnDV("select id from MI_MGV_registrationDetails");
                DataView Dv = RunSPReturnDV("MemberCount");
                grdEmployee.VirtualItemCount = Dv.Count;
                BindGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    public void BindGrid()
    {
        try
        {
            DataView Dv = RunSPReturnListDV("SelectMember", Convert.ToInt32(intCurrIndex.Text), grdEmployee.PageSize, "temp");
            grdEmployee.DataSource = Dv;
            grdEmployee.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

   public void MyDataGrid_Page(Object sender, DataGridPageChangedEventArgs e)
    {
        try
        {
            grdEmployee.CurrentPageIndex = e.NewPageIndex;
            intCurrIndex.Text = Convert.ToString(grdEmployee.CurrentPageIndex * grdEmployee.PageSize);
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    void ShowStats()
    {
       
    }


    public void MyDataGrid_Edit(object sendder, DataGridCommandEventArgs e)
    {
        try
        {
            grdEmployee.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    public void MyDataGrid_Cancel(object sendder, DataGridCommandEventArgs e)
    {
        try
        {
            grdEmployee.EditItemIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    public void MyDataGrid_Update(object sendder, DataGridCommandEventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                SqlCommand MyCommand;
                SqlConnection MyConnection = new SqlConnection();
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                string UpdateCmd = "Update MI_MGV_registrationDetails set IsActive=@IsActive, Join_Date= getdate() where ID = @Id";

                MyCommand = new SqlCommand(UpdateCmd, MyConnection);

                MyCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
                MyCommand.Parameters.Add(new SqlParameter("@IsActive", SqlDbType.Bit));
                MyCommand.Parameters["@Id"].Value = grdEmployee.DataKeys[Convert.ToInt32(e.Item.ItemIndex)];


                System.Web.UI.WebControls.DropDownList ddlCurrent;
                ddlCurrent = (DropDownList)e.Item.FindControl("active");
                string ColValue = ddlCurrent.SelectedValue.ToString();
                MyCommand.Parameters["@IsActive"].Value = ColValue;

                MyCommand.Connection.Open();
                MyCommand.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }
    }
   
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Button objBtn = (Button)sender;
        Session["MemberID"] = "";
        Session["MemberID"] = objBtn.CommandArgument.ToString();
        Response.Redirect("Members_Details.aspx");
    }
}
